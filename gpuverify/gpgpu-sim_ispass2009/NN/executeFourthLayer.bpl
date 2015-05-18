type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$Layer4_Neurons_GPU"} {:global} {:elem_width 32} {:source_name "Layer4_Neurons_GPU"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU: bool;

axiom {:array_info "$$Layer4_Weights_GPU"} {:global} {:elem_width 32} {:source_name "Layer4_Weights_GPU"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Layer4_Weights_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU: bool;

var {:source_name "Layer5_Neurons_GPU"} {:global} $$Layer5_Neurons_GPU: [bv32]bv32;

axiom {:array_info "$$Layer5_Neurons_GPU"} {:global} {:elem_width 32} {:source_name "Layer5_Neurons_GPU"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "executeFourthLayer"} {:kernel} $_Z18executeFourthLayerPfS_S_();
  requires !_READ_HAS_OCCURRED_$$Layer4_Neurons_GPU && !_WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU && !_ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU;
  requires !_READ_HAS_OCCURRED_$$Layer4_Weights_GPU && !_WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU && !_ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU;
  requires !_READ_HAS_OCCURRED_$$Layer5_Neurons_GPU && !_WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU && !_ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU;
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
  modifies _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU, _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU, _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU;



implementation {:source_name "executeFourthLayer"} {:kernel} $_Z18executeFourthLayerPfS_S_()
{
  var $result.0$1: bv32;
  var $result.0$2: bv32;
  var $i.0: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;


  $0:
    v0$1 := BV32_MUL(group_id_x$1, 101bv32);
    v0$2 := BV32_MUL(group_id_x$2, 101bv32);
    havoc v1$1, v1$2;
    $result.0$1, $i.0 := FADD32(0bv32, v1$1), 0bv32;
    $result.0$2 := FADD32(0bv32, v1$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v2 := BV32_SLT($i.0, 100bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc_num 8} v5$1, v5$2 := $tanhf(FP64_CONV32(FMUL64(4604180019078461075bv64, FP32_CONV64($result.0$1))), FP64_CONV32(FMUL64(4604180019078461075bv64, FP32_CONV64($result.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "$tanhf"} true;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$Layer5_Neurons_GPU(true, BV32_ADD(group_id_x$1, BV32_MUL(10bv32, group_id_y$1)), FP64_CONV32(FMUL64(4610406545773251946bv64, FP32_CONV64(v5$1))), $$Layer5_Neurons_GPU[BV32_ADD(group_id_x$1, BV32_MUL(10bv32, group_id_y$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU(true, BV32_ADD(group_id_x$2, BV32_MUL(10bv32, group_id_y$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$Layer5_Neurons_GPU(true, BV32_ADD(group_id_x$2, BV32_MUL(10bv32, group_id_y$2)), FP64_CONV32(FMUL64(4610406545773251946bv64, FP32_CONV64(v5$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Layer5_Neurons_GPU"} true;
    $$Layer5_Neurons_GPU[BV32_ADD(group_id_x$1, BV32_MUL(10bv32, group_id_y$1))] := FP64_CONV32(FMUL64(4610406545773251946bv64, FP32_CONV64(v5$1)));
    $$Layer5_Neurons_GPU[BV32_ADD(group_id_x$2, BV32_MUL(10bv32, group_id_y$2))] := FP64_CONV32(FMUL64(4610406545773251946bv64, FP32_CONV64(v5$2)));
    return;

  $truebb:
    assume {:partition} v2 && v2;
    havoc v3$1, v3$2;
    havoc v4$1, v4$2;
    $result.0$1, $i.0 := FADD32($result.0$1, FMUL32(v3$1, v4$1)), BV32_ADD($i.0, 1bv32);
    $result.0$2 := FADD32($result.0$2, FMUL32(v3$2, v4$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



procedure {:source_name "tanhf"} $tanhf($0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 10bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 10bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$Layer4_Neurons_GPU: bv32;

procedure {:inline 1} _LOG_READ_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU;



implementation {:inline 1} _LOG_READ_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Neurons_GPU == _value then true else _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU);
    return;
}



procedure _CHECK_READ_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU: bool;

procedure {:inline 1} _LOG_WRITE_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU, _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU;



implementation {:inline 1} _LOG_WRITE_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Neurons_GPU == _value then true else _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU);
    _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Neurons_GPU == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU);
    return;
}



procedure _CHECK_WRITE_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Neurons_GPU != _value);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Neurons_GPU != _value);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU;



implementation {:inline 1} _LOG_ATOMIC_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Layer4_Neurons_GPU);
    return;
}



procedure _CHECK_ATOMIC_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset);
  requires {:source_name "Layer4_Neurons_GPU"} {:array "$$Layer4_Neurons_GPU"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU := (if _P && _WRITE_HAS_OCCURRED_$$Layer4_Neurons_GPU && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Layer4_Neurons_GPU);
    return;
}



const _WATCHED_VALUE_$$Layer4_Weights_GPU: bv32;

procedure {:inline 1} _LOG_READ_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Layer4_Weights_GPU;



implementation {:inline 1} _LOG_READ_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Layer4_Weights_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Weights_GPU == _value then true else _READ_HAS_OCCURRED_$$Layer4_Weights_GPU);
    return;
}



procedure _CHECK_READ_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU: bool;

procedure {:inline 1} _LOG_WRITE_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU, _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU;



implementation {:inline 1} _LOG_WRITE_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Weights_GPU == _value then true else _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU);
    _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Weights_GPU == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU);
    return;
}



procedure _CHECK_WRITE_$$Layer4_Weights_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Weights_GPU != _value);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer4_Weights_GPU != _value);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Layer4_Weights_GPU(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU;



implementation {:inline 1} _LOG_ATOMIC_$$Layer4_Weights_GPU(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Layer4_Weights_GPU);
    return;
}



procedure _CHECK_ATOMIC_$$Layer4_Weights_GPU(_P: bool, _offset: bv32);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset);
  requires {:source_name "Layer4_Weights_GPU"} {:array "$$Layer4_Weights_GPU"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU := (if _P && _WRITE_HAS_OCCURRED_$$Layer4_Weights_GPU && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Layer4_Weights_GPU);
    return;
}



const _WATCHED_VALUE_$$Layer5_Neurons_GPU: bv32;

procedure {:inline 1} _LOG_READ_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU;



implementation {:inline 1} _LOG_READ_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer5_Neurons_GPU == _value then true else _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU);
    return;
}



procedure _CHECK_READ_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU: bool;

procedure {:inline 1} _LOG_WRITE_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU, _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU;



implementation {:inline 1} _LOG_WRITE_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer5_Neurons_GPU == _value then true else _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU);
    _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer5_Neurons_GPU == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU);
    return;
}



procedure _CHECK_WRITE_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer5_Neurons_GPU != _value);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Layer5_Neurons_GPU != _value);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU;



implementation {:inline 1} _LOG_ATOMIC_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Layer5_Neurons_GPU);
    return;
}



procedure _CHECK_ATOMIC_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset);
  requires {:source_name "Layer5_Neurons_GPU"} {:array "$$Layer5_Neurons_GPU"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU := (if _P && _WRITE_HAS_OCCURRED_$$Layer5_Neurons_GPU && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Layer5_Neurons_GPU);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
