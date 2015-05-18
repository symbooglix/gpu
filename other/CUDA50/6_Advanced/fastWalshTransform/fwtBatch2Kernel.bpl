type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Output"} {:global} $$d_Output: [bv32]bv32;

axiom {:array_info "$$d_Output"} {:global} {:elem_width 32} {:source_name "d_Output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Output: bool;

axiom {:array_info "$$d_Input"} {:global} {:elem_width 32} {:source_name "d_Input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Input: bool;

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

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "fwtBatch2Kernel"} {:kernel} $_Z15fwtBatch2KernelPfS_i($stride: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $stride == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Output && !_WRITE_HAS_OCCURRED_$$d_Output && !_ATOMIC_HAS_OCCURRED_$$d_Output;
  requires !_READ_HAS_OCCURRED_$$d_Input && !_WRITE_HAS_OCCURRED_$$d_Input && !_ATOMIC_HAS_OCCURRED_$$d_Input;
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
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:source_name "fwtBatch2Kernel"} {:kernel} $_Z15fwtBatch2KernelPfS_i($stride: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bv32;
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
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1 := BV32_MUL(BV32_MUL(group_size_x, num_groups_x), 4bv32);
    v2$1 := BV32_MUL(group_id_y$1, v1);
    v2$2 := BV32_MUL(group_id_y$2, v1);
    v3$1 := BV32_MUL(group_id_y$1, v1);
    v3$2 := BV32_MUL(group_id_y$2, v1);
    v4$1 := BV32_AND(v0$1, BV32_SUB($stride, 1bv32));
    v4$2 := BV32_AND(v0$2, BV32_SUB($stride, 1bv32));
    v5$1 := BV32_ADD(BV32_SHL(BV32_SUB(v0$1, v4$1), 2bv32), v4$1);
    v5$2 := BV32_ADD(BV32_SHL(BV32_SUB(v0$2, v4$2), 2bv32), v4$2);
    v6$1 := BV32_ADD(v5$1, $stride);
    v6$2 := BV32_ADD(v5$2, $stride);
    v7$1 := BV32_ADD(v6$1, $stride);
    v7$2 := BV32_ADD(v6$2, $stride);
    v8$1 := BV32_ADD(v7$1, $stride);
    v8$2 := BV32_ADD(v7$2, $stride);
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    v13$1 := FADD32(v9$1, v11$1);
    v13$2 := FADD32(v9$2, v11$2);
    v14$1 := FSUB32(v9$1, v11$1);
    v14$2 := FSUB32(v9$2, v11$2);
    v15$1 := FADD32(v10$1, v12$1);
    v15$2 := FADD32(v10$2, v12$2);
    v16$1 := FSUB32(v10$1, v12$1);
    v16$2 := FSUB32(v10$2, v12$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$d_Output(true, BV32_ADD(v3$1, v5$1), FADD32(v13$1, v15$1), $$d_Output[BV32_ADD(v3$1, v5$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(true, BV32_ADD(v3$2, v5$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$d_Output(true, BV32_ADD(v3$2, v5$2), FADD32(v13$2, v15$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(v3$1, v5$1)] := FADD32(v13$1, v15$1);
    $$d_Output[BV32_ADD(v3$2, v5$2)] := FADD32(v13$2, v15$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$d_Output(true, BV32_ADD(v3$1, v6$1), FSUB32(v13$1, v15$1), $$d_Output[BV32_ADD(v3$1, v6$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(true, BV32_ADD(v3$2, v6$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$d_Output(true, BV32_ADD(v3$2, v6$2), FSUB32(v13$2, v15$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(v3$1, v6$1)] := FSUB32(v13$1, v15$1);
    $$d_Output[BV32_ADD(v3$2, v6$2)] := FSUB32(v13$2, v15$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$d_Output(true, BV32_ADD(v3$1, v7$1), FADD32(v14$1, v16$1), $$d_Output[BV32_ADD(v3$1, v7$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(true, BV32_ADD(v3$2, v7$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$d_Output(true, BV32_ADD(v3$2, v7$2), FADD32(v14$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(v3$1, v7$1)] := FADD32(v14$1, v16$1);
    $$d_Output[BV32_ADD(v3$2, v7$2)] := FADD32(v14$2, v16$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$d_Output(true, BV32_ADD(v3$1, v8$1), FSUB32(v14$1, v16$1), $$d_Output[BV32_ADD(v3$1, v8$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(true, BV32_ADD(v3$2, v8$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$d_Output(true, BV32_ADD(v3$2, v8$2), FSUB32(v14$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(v3$1, v8$1)] := FSUB32(v14$1, v16$1);
    $$d_Output[BV32_ADD(v3$2, v8$2)] := FSUB32(v14$2, v16$2);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8192bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_Output: bv32;

procedure {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _READ_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Output);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _WRITE_HAS_OCCURRED_$$d_Output);
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



procedure _CHECK_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



const _WATCHED_VALUE_$$d_Input: bv32;

procedure {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _READ_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Input);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Input: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Input, _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _WRITE_HAS_OCCURRED_$$d_Input);
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



procedure _CHECK_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
