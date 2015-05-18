type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "data"} {:global} $$data: [bv32]bv64;

axiom {:array_info "$$data"} {:global} {:elem_width 64} {:source_name "data"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

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

function FADD64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "Add8"} {:kernel} $Add8($nIters: bv32);
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
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
  modifies _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:source_name "Add8"} {:kernel} $Add8($nIters: bv32)
{
  var $s0.0$1: bv512;
  var $s0.0$2: bv512;
  var $j.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv64;
  var v1$2: bv64;
  var v2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$data(true, v0$1, $$data[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$data(true, v0$2, $$data[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v1$1 := $$data[v0$1];
    v1$2 := $$data[v0$2];
    $s0.0$1, $j.0 := FADD64(v1$1, 4604480259023595110bv64) ++ FADD64(v1$1, 4603579539098121011bv64) ++ FADD64(v1$1, 4602678819172646912bv64) ++ FADD64(v1$1, 4600877379321698714bv64) ++ FADD64(v1$1, 4599075939470750515bv64) ++ FADD64(v1$1, 4596373779694328218bv64) ++ FADD64(v1$1, 4591870180066957722bv64) ++ FADD64(v1$1, 0bv64), 0bv32;
    $s0.0$2 := FADD64(v1$2, 4604480259023595110bv64) ++ FADD64(v1$2, 4603579539098121011bv64) ++ FADD64(v1$2, 4602678819172646912bv64) ++ FADD64(v1$2, 4600877379321698714bv64) ++ FADD64(v1$2, 4599075939470750515bv64) ++ FADD64(v1$2, 4596373779694328218bv64) ++ FADD64(v1$2, 4591870180066957722bv64) ++ FADD64(v1$2, 0bv64);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v2 := BV32_SLT($j.0, $nIters);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$data(true, v0$1, FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64($s0.0$1[64:0], $s0.0$1[128:64]), $s0.0$1[192:128]), $s0.0$1[256:192]), $s0.0$1[320:256]), $s0.0$1[384:320]), $s0.0$1[448:384]), $s0.0$1[512:448]), $$data[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$data(true, v0$2, FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64($s0.0$2[64:0], $s0.0$2[128:64]), $s0.0$2[192:128]), $s0.0$2[256:192]), $s0.0$2[320:256]), $s0.0$2[384:320]), $s0.0$2[448:384]), $s0.0$2[512:448]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v0$1] := FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64($s0.0$1[64:0], $s0.0$1[128:64]), $s0.0$1[192:128]), $s0.0$1[256:192]), $s0.0$1[320:256]), $s0.0$1[384:320]), $s0.0$1[448:384]), $s0.0$1[512:448]);
    $$data[v0$2] := FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64($s0.0$2[64:0], $s0.0$2[128:64]), $s0.0$2[192:128]), $s0.0$2[256:192]), $s0.0$2[320:256]), $s0.0$2[384:320]), $s0.0$2[448:384]), $s0.0$2[512:448]);
    return;

  $truebb:
    assume {:partition} v2 && v2;
    $s0.0$1, $j.0 := FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[512:448]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[448:384]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[384:320]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[320:256]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[256:192]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[192:128]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[128:64]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$1[64:0]))))))))))), BV32_ADD($j.0, 1bv32);
    $s0.0$2 := FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[512:448]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[448:384]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[384:320]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[320:256]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[256:192]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[192:128]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[128:64]))))))))))) ++ FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, FSUB64(4621819117588971520bv64, $s0.0$2[64:0])))))))))));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16384bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$data: bv64;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64);
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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
