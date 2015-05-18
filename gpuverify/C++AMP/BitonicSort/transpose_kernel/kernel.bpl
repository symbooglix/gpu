type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$data_in"} {:global} {:elem_width 32} {:source_name "data_in"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_in: bool;

var {:source_name "data_out"} {:global} $$data_out: [bv32]bv32;

axiom {:array_info "$$data_out"} {:global} {:elem_width 32} {:source_name "data_out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_out: bool;

var {:source_name "transpose_shared_data"} {:group_shared} $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:group_shared} {:elem_width 32} {:source_name "transpose_shared_data"} {:source_elem_width 32} {:source_dimensions "16,16"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: bool;

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

procedure {:source_name "transpose_kernel"} {:kernel} $_Z16transpose_kernelPfS_jj($width: bv32, $height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data_in && !_WRITE_HAS_OCCURRED_$$data_in && !_ATOMIC_HAS_OCCURRED_$$data_in;
  requires !_READ_HAS_OCCURRED_$$data_out && !_WRITE_HAS_OCCURRED_$$data_out && !_ATOMIC_HAS_OCCURRED_$$data_out;
  requires !_READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && !_WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && !_ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;
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
  modifies $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, $$data_out, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, _WRITE_HAS_OCCURRED_$$data_out, _WRITE_READ_BENIGN_FLAG_$$data_out, _WRITE_READ_BENIGN_FLAG_$$data_out;



implementation {:source_name "transpose_kernel"} {:kernel} $_Z16transpose_kernelPfS_jj($width: bv32, $height: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;


  __partitioned_block_$0_0:
    havoc v0$1, v0$2;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(true, BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1), v0$1, $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2), v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} true;
    $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)] := v0$1;
    $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2)] := v0$2;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 4} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(true, BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1), $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2), $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} true;
    v1$1 := $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)];
    v1$2 := $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2)];
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$data_out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1)), v1$1, $$data_out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$data_out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2)), v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out"} true;
    $$data_out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1))] := v1$1;
    $$data_out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $width), BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2))] := v1$2;
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, $$data_out, _TRACKING;



const _WATCHED_VALUE_$$data_in: bv32;

procedure {:inline 1} _LOG_READ_$$data_in(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_in;



implementation {:inline 1} _LOG_READ_$$data_in(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in == _value then true else _READ_HAS_OCCURRED_$$data_in);
    return;
}



procedure _CHECK_READ_$$data_in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_in);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_in: bool;

procedure {:inline 1} _LOG_WRITE_$$data_in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_in, _WRITE_READ_BENIGN_FLAG_$$data_in;



implementation {:inline 1} _LOG_WRITE_$$data_in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in == _value then true else _WRITE_HAS_OCCURRED_$$data_in);
    _WRITE_READ_BENIGN_FLAG_$$data_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_in);
    return;
}



procedure _CHECK_WRITE_$$data_in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in != _value);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in != _value);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_in(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_in;



implementation {:inline 1} _LOG_ATOMIC_$$data_in(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_in);
    return;
}



procedure _CHECK_ATOMIC_$$data_in(_P: bool, _offset: bv32);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_in"} {:array "$$data_in"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_in;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_in := (if _P && _WRITE_HAS_OCCURRED_$$data_in && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_in);
    return;
}



const _WATCHED_VALUE_$$data_out: bv32;

procedure {:inline 1} _LOG_READ_$$data_out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_out;



implementation {:inline 1} _LOG_READ_$$data_out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out == _value then true else _READ_HAS_OCCURRED_$$data_out);
    return;
}



procedure _CHECK_READ_$$data_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_out);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_out: bool;

procedure {:inline 1} _LOG_WRITE_$$data_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_out, _WRITE_READ_BENIGN_FLAG_$$data_out;



implementation {:inline 1} _LOG_WRITE_$$data_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out == _value then true else _WRITE_HAS_OCCURRED_$$data_out);
    _WRITE_READ_BENIGN_FLAG_$$data_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_out);
    return;
}



procedure _CHECK_WRITE_$$data_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out != _value);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out != _value);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_out;



implementation {:inline 1} _LOG_ATOMIC_$$data_out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_out);
    return;
}



procedure _CHECK_ATOMIC_$$data_out(_P: bool, _offset: bv32);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_out"} {:array "$$data_out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_out := (if _P && _WRITE_HAS_OCCURRED_$$data_out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_out);
    return;
}



const _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;



implementation {:inline 1} _LOG_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data == _value then true else _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data);
    return;
}



procedure _CHECK_READ_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "transpose_shared_data"} {:array "$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data_out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data_out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data_out;
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
    havoc $$data_out;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ16transpose_kernelPfS_jjE21transpose_shared_data;
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
