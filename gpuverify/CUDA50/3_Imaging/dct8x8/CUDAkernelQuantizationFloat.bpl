type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP16(x: [bv32]bv16, y: bv32) returns (z$1: bv16, A$1: [bv32]bv16, z$2: bv16, A$2: [bv32]bv16);



var {:source_name "SrcDst"} {:global} $$SrcDst: [bv32]bv32;

axiom {:array_info "$$SrcDst"} {:global} {:elem_width 32} {:source_name "SrcDst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$SrcDst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$SrcDst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$SrcDst: bool;

var {:source_name "Q"} {:constant} $$Q$1: [bv32]bv16;

var {:source_name "Q"} {:constant} $$Q$2: [bv32]bv16;

axiom {:array_info "$$Q"} {:constant} {:elem_width 16} {:source_name "Q"} {:source_elem_width 16} {:source_dimensions "64"} true;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function SI16_TO_FP32(bv16) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "CUDAkernelQuantizationFloat"} {:kernel} $_Z27CUDAkernelQuantizationFloatPfi($Stride: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $Stride == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$SrcDst && !_WRITE_HAS_OCCURRED_$$SrcDst && !_ATOMIC_HAS_OCCURRED_$$SrcDst;
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
  modifies _READ_HAS_OCCURRED_$$SrcDst, _WRITE_HAS_OCCURRED_$$SrcDst, _WRITE_READ_BENIGN_FLAG_$$SrcDst, _WRITE_READ_BENIGN_FLAG_$$SrcDst;



implementation {:source_name "CUDAkernelQuantizationFloat"} {:kernel} $_Z27CUDAkernelQuantizationFloatPfi($Stride: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv16;
  var v1$2: bv16;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv64;
  var v3$2: bv64;


  $0:
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$SrcDst(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1)), $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$SrcDst(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2)), $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$SrcDst"} true;
    v0$1 := $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1))];
    v0$2 := $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2))];
    v1$1 := $$Q$1[BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)];
    v1$2 := $$Q$2[BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)];
    v2$1 := SI16_TO_FP32(v1$1);
    v2$2 := SI16_TO_FP32(v1$2);
    call {:sourceloc_num 4} v3$1, v3$2 := $round(FP32_CONV64(FDIV32(v0$1, v2$1)), FP32_CONV64(FDIV32(v0$2, v2$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$round"} true;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$SrcDst(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1)), FMUL32(FP64_CONV32(v3$1), v2$1), $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$SrcDst(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$SrcDst(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2)), FMUL32(FP64_CONV32(v3$2), v2$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$SrcDst"} true;
    $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 8bv32), local_id_y$1), $Stride), BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), local_id_x$1))] := FMUL32(FP64_CONV32(v3$1), v2$1);
    $$SrcDst[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 8bv32), local_id_y$2), $Stride), BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), local_id_x$2))] := FMUL32(FP64_CONV32(v3$2), v2$2);
    return;
}



procedure {:source_name "round"} $round($0$1: bv64, $0$2: bv64) returns ($ret$1: bv64, $ret$2: bv64);



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$SrcDst: bv32;

procedure {:inline 1} _LOG_READ_$$SrcDst(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$SrcDst;



implementation {:inline 1} _LOG_READ_$$SrcDst(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$SrcDst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SrcDst == _value then true else _READ_HAS_OCCURRED_$$SrcDst);
    return;
}



procedure _CHECK_READ_$$SrcDst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$SrcDst);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$SrcDst: bool;

procedure {:inline 1} _LOG_WRITE_$$SrcDst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$SrcDst, _WRITE_READ_BENIGN_FLAG_$$SrcDst;



implementation {:inline 1} _LOG_WRITE_$$SrcDst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$SrcDst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SrcDst == _value then true else _WRITE_HAS_OCCURRED_$$SrcDst);
    _WRITE_READ_BENIGN_FLAG_$$SrcDst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SrcDst == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$SrcDst);
    return;
}



procedure _CHECK_WRITE_$$SrcDst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SrcDst != _value);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SrcDst != _value);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$SrcDst(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$SrcDst;



implementation {:inline 1} _LOG_ATOMIC_$$SrcDst(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$SrcDst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$SrcDst);
    return;
}



procedure _CHECK_ATOMIC_$$SrcDst(_P: bool, _offset: bv32);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset);
  requires {:source_name "SrcDst"} {:array "$$SrcDst"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$SrcDst(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$SrcDst;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$SrcDst(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$SrcDst := (if _P && _WRITE_HAS_OCCURRED_$$SrcDst && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$SrcDst);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
