type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$random_nums"} {:global} {:elem_width 32} {:source_name "random_nums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$random_nums: bool;

var {:source_name "normalized_random_nums"} {:global} $$normalized_random_nums: [bv32]bv32;

axiom {:array_info "$$normalized_random_nums"} {:global} {:elem_width 32} {:source_name "normalized_random_nums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$normalized_random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$normalized_random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$normalized_random_nums: bool;

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

function FCOS64(bv64) : bv64;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSIN64(bv64) : bv64;

function FSQRT64(bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "box_muller_kernel"} {:kernel} $_Z17box_muller_kernelPfS_i($n_per_RNG: bv32);
  requires !_READ_HAS_OCCURRED_$$random_nums && !_WRITE_HAS_OCCURRED_$$random_nums && !_ATOMIC_HAS_OCCURRED_$$random_nums;
  requires !_READ_HAS_OCCURRED_$$normalized_random_nums && !_WRITE_HAS_OCCURRED_$$normalized_random_nums && !_ATOMIC_HAS_OCCURRED_$$normalized_random_nums;
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
  modifies _WRITE_HAS_OCCURRED_$$normalized_random_nums, _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums, _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums, _READ_HAS_OCCURRED_$$normalized_random_nums;



implementation {:source_name "box_muller_kernel"} {:kernel} $_Z17box_muller_kernelPfS_i($n_per_RNG: bv32)
{
  var $out.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv64;
  var v4$2: bv64;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    $out.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v1 := BV32_SLT($out.0, $n_per_RNG);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    return;

  $truebb:
    assume {:partition} v1 && v1;
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    call {:sourceloc_num 5} v4$1, v4$2 := $log(FP32_CONV64(v2$1), FP32_CONV64(v2$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$log"} true;
    v5$1 := FP64_CONV32(FSQRT64(FMUL64(13835058055282163712bv64, v4$1)));
    v5$2 := FP64_CONV32(FSQRT64(FMUL64(13835058055282163712bv64, v4$2)));
    v6$1 := FMUL32(1086918619bv32, v3$1);
    v6$2 := FMUL32(1086918619bv32, v3$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), FP64_CONV32(FMUL64(FP32_CONV64(v5$1), FCOS64(FP32_CONV64(v6$1)))), $$normalized_random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalized_random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), FP64_CONV32(FMUL64(FP32_CONV64(v5$2), FCOS64(FP32_CONV64(v6$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$normalized_random_nums"} true;
    $$normalized_random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1)] := FP64_CONV32(FMUL64(FP32_CONV64(v5$1), FCOS64(FP32_CONV64(v6$1))));
    $$normalized_random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2)] := FP64_CONV32(FMUL64(FP32_CONV64(v5$2), FCOS64(FP32_CONV64(v6$2))));
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$1), FP64_CONV32(FMUL64(FP32_CONV64(v5$1), FSIN64(FP32_CONV64(v6$1)))), $$normalized_random_nums[BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalized_random_nums(true, BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$2), FP64_CONV32(FMUL64(FP32_CONV64(v5$2), FSIN64(FP32_CONV64(v6$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$normalized_random_nums"} true;
    $$normalized_random_nums[BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$1)] := FP64_CONV32(FMUL64(FP32_CONV64(v5$1), FSIN64(FP32_CONV64(v6$1))));
    $$normalized_random_nums[BV32_ADD(BV32_MUL(BV32_ADD($out.0, 1bv32), 4096bv32), v0$2)] := FP64_CONV32(FMUL64(FP32_CONV64(v5$2), FSIN64(FP32_CONV64(v6$2))));
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$normalized_random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32), $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$normalized_random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32), $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$normalized_random_nums"} true;
    v7$1 := $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32)];
    v7$2 := $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32)];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32), v7$1, $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalized_random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$normalized_random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$normalized_random_nums"} true;
    $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$1), 1bv32)] := v7$1;
    $$normalized_random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), v0$2), 1bv32)] := v7$2;
    $out.0 := BV32_ADD($out.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



procedure {:source_name "log"} $log($0$1: bv64, $0$2: bv64) returns ($ret$1: bv64, $ret$2: bv64);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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



const _WATCHED_VALUE_$$normalized_random_nums: bv32;

procedure {:inline 1} _LOG_READ_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$normalized_random_nums;



implementation {:inline 1} _LOG_READ_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$normalized_random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalized_random_nums == _value then true else _READ_HAS_OCCURRED_$$normalized_random_nums);
    return;
}



procedure _CHECK_READ_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums: bool;

procedure {:inline 1} _LOG_WRITE_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$normalized_random_nums, _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums;



implementation {:inline 1} _LOG_WRITE_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$normalized_random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalized_random_nums == _value then true else _WRITE_HAS_OCCURRED_$$normalized_random_nums);
    _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalized_random_nums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums);
    return;
}



procedure _CHECK_WRITE_$$normalized_random_nums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalized_random_nums != _value);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalized_random_nums != _value);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$normalized_random_nums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$normalized_random_nums;



implementation {:inline 1} _LOG_ATOMIC_$$normalized_random_nums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$normalized_random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$normalized_random_nums);
    return;
}



procedure _CHECK_ATOMIC_$$normalized_random_nums(_P: bool, _offset: bv32);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset);
  requires {:source_name "normalized_random_nums"} {:array "$$normalized_random_nums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalized_random_nums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalized_random_nums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums := (if _P && _WRITE_HAS_OCCURRED_$$normalized_random_nums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$normalized_random_nums);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
