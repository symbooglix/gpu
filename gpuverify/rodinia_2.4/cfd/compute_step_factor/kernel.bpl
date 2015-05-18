type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$variables"} {:global} {:elem_width 32} {:source_name "variables"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$variables: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$variables: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$variables: bool;

axiom {:array_info "$$areas"} {:global} {:elem_width 32} {:source_name "areas"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$areas: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$areas: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$areas: bool;

var {:source_name "step_factors"} {:global} $$step_factors: [bv32]bv32;

axiom {:array_info "$$step_factors"} {:global} {:elem_width 32} {:source_name "step_factors"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$step_factors: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$step_factors: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$step_factors: bool;

axiom {:array_info "$$velocity.i"} {:elem_width 32} {:source_name "velocity.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$momentum.i"} {:elem_width 32} {:source_name "momentum.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$momentum"} {:elem_width 32} {:source_name "momentum"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$velocity"} {:elem_width 32} {:source_name "velocity"} {:source_elem_width 96} {:source_dimensions "1"} true;

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

function FMUL32(bv32, bv32) : bv32;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "compute_step_factor"} {:kernel} $compute_step_factor($nelr: bv32);
  requires !_READ_HAS_OCCURRED_$$variables && !_WRITE_HAS_OCCURRED_$$variables && !_ATOMIC_HAS_OCCURRED_$$variables;
  requires !_READ_HAS_OCCURRED_$$areas && !_WRITE_HAS_OCCURRED_$$areas && !_ATOMIC_HAS_OCCURRED_$$areas;
  requires !_READ_HAS_OCCURRED_$$step_factors && !_WRITE_HAS_OCCURRED_$$step_factors && !_ATOMIC_HAS_OCCURRED_$$step_factors;
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
  modifies _WRITE_HAS_OCCURRED_$$step_factors, _WRITE_READ_BENIGN_FLAG_$$step_factors, _WRITE_READ_BENIGN_FLAG_$$step_factors;



implementation {:source_name "compute_step_factor"} {:kernel} $compute_step_factor($nelr: bv32)
{
  var v22$1: bv32;
  var v22$2: bv32;
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
  var v13$1: bv32;
  var v13$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    $$momentum$0bv32$1 := v2$1;
    $$momentum$0bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$momentum$1bv32$1 := v3$1;
    $$momentum$1bv32$2 := v3$2;
    havoc v4$1, v4$2;
    $$momentum$2bv32$1 := v4$1;
    $$momentum$2bv32$2 := v4$2;
    havoc v5$1, v5$2;
    v6$1 := $$momentum$0bv32$1;
    v6$2 := $$momentum$0bv32$2;
    v7$1 := $$momentum$1bv32$1;
    v7$2 := $$momentum$1bv32$2;
    v8$1 := $$momentum$2bv32$1;
    v8$2 := $$momentum$2bv32$2;
    $$momentum.i$0bv32$1 := v6$1;
    $$momentum.i$0bv32$2 := v6$2;
    $$momentum.i$1bv32$1 := v7$1;
    $$momentum.i$1bv32$2 := v7$2;
    $$momentum.i$2bv32$1 := v8$1;
    $$momentum.i$2bv32$2 := v8$2;
    v9$1 := $$momentum.i$0bv32$1;
    v9$2 := $$momentum.i$0bv32$2;
    $$velocity$0bv32$1 := FDIV32(v9$1, v1$1);
    $$velocity$0bv32$2 := FDIV32(v9$2, v1$2);
    v10$1 := $$momentum.i$1bv32$1;
    v10$2 := $$momentum.i$1bv32$2;
    $$velocity$1bv32$1 := FDIV32(v10$1, v1$1);
    $$velocity$1bv32$2 := FDIV32(v10$2, v1$2);
    v11$1 := $$momentum.i$2bv32$1;
    v11$2 := $$momentum.i$2bv32$2;
    $$velocity$2bv32$1 := FDIV32(v11$1, v1$1);
    $$velocity$2bv32$2 := FDIV32(v11$2, v1$2);
    v12$1 := $$velocity$0bv32$1;
    v12$2 := $$velocity$0bv32$2;
    v13$1 := $$velocity$1bv32$1;
    v13$2 := $$velocity$1bv32$2;
    v14$1 := $$velocity$2bv32$1;
    v14$2 := $$velocity$2bv32$2;
    $$velocity.i$0bv32$1 := v12$1;
    $$velocity.i$0bv32$2 := v12$2;
    $$velocity.i$1bv32$1 := v13$1;
    $$velocity.i$1bv32$2 := v13$2;
    $$velocity.i$2bv32$1 := v14$1;
    $$velocity.i$2bv32$2 := v14$2;
    v15$1 := $$velocity.i$0bv32$1;
    v15$2 := $$velocity.i$0bv32$2;
    v16$1 := $$velocity.i$0bv32$1;
    v16$2 := $$velocity.i$0bv32$2;
    v17$1 := $$velocity.i$1bv32$1;
    v17$2 := $$velocity.i$1bv32$2;
    v18$1 := $$velocity.i$1bv32$1;
    v18$2 := $$velocity.i$1bv32$2;
    v19$1 := $$velocity.i$2bv32$1;
    v19$2 := $$velocity.i$2bv32$2;
    v20$1 := $$velocity.i$2bv32$1;
    v20$2 := $$velocity.i$2bv32$2;
    v21$1 := FADD32(FMUL32(v19$1, v20$1), FADD32(FMUL32(v15$1, v16$1), FMUL32(v17$1, v18$1)));
    v21$2 := FADD32(FMUL32(v19$2, v20$2), FADD32(FMUL32(v15$2, v16$2), FMUL32(v17$2, v18$2)));
    havoc v22$1, v22$2;
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$step_factors(true, v0$1, FDIV32(1056964608bv32, FMUL32(FSQRT32(v22$1), FADD32(FSQRT32(v21$1), FSQRT32(FDIV32(FMUL32(1068708659bv32, FMUL32(1053609164bv32, FADD32(FMUL32(FSUB32(2147483648bv32, FMUL32(1056964608bv32, v1$1)), v21$1), v5$1))), v1$1))))), $$step_factors[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$step_factors(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$step_factors(true, v0$2, FDIV32(1056964608bv32, FMUL32(FSQRT32(v22$2), FADD32(FSQRT32(v21$2), FSQRT32(FDIV32(FMUL32(1068708659bv32, FMUL32(1053609164bv32, FADD32(FMUL32(FSUB32(2147483648bv32, FMUL32(1056964608bv32, v1$2)), v21$2), v5$2))), v1$2))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$step_factors"} true;
    $$step_factors[v0$1] := FDIV32(1056964608bv32, FMUL32(FSQRT32(v22$1), FADD32(FSQRT32(v21$1), FSQRT32(FDIV32(FMUL32(1068708659bv32, FMUL32(1053609164bv32, FADD32(FMUL32(FSUB32(2147483648bv32, FMUL32(1056964608bv32, v1$1)), v21$1), v5$1))), v1$1)))));
    $$step_factors[v0$2] := FDIV32(1056964608bv32, FMUL32(FSQRT32(v22$2), FADD32(FSQRT32(v21$2), FSQRT32(FDIV32(FMUL32(1068708659bv32, FMUL32(1053609164bv32, FADD32(FMUL32(FSUB32(2147483648bv32, FMUL32(1056964608bv32, v1$2)), v21$2), v5$2))), v1$2)))));
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 192bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 506bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$velocity.i$0bv32$1: bv32;

var $$velocity.i$0bv32$2: bv32;

var $$velocity.i$1bv32$1: bv32;

var $$velocity.i$1bv32$2: bv32;

var $$velocity.i$2bv32$1: bv32;

var $$velocity.i$2bv32$2: bv32;

var $$momentum.i$0bv32$1: bv32;

var $$momentum.i$0bv32$2: bv32;

var $$momentum.i$1bv32$1: bv32;

var $$momentum.i$1bv32$2: bv32;

var $$momentum.i$2bv32$1: bv32;

var $$momentum.i$2bv32$2: bv32;

var $$momentum$0bv32$1: bv32;

var $$momentum$0bv32$2: bv32;

var $$momentum$1bv32$1: bv32;

var $$momentum$1bv32$2: bv32;

var $$momentum$2bv32$1: bv32;

var $$momentum$2bv32$2: bv32;

var $$velocity$0bv32$1: bv32;

var $$velocity$0bv32$2: bv32;

var $$velocity$1bv32$1: bv32;

var $$velocity$1bv32$2: bv32;

var $$velocity$2bv32$1: bv32;

var $$velocity$2bv32$2: bv32;

const _WATCHED_VALUE_$$variables: bv32;

procedure {:inline 1} _LOG_READ_$$variables(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$variables;



implementation {:inline 1} _LOG_READ_$$variables(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$variables := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$variables == _value then true else _READ_HAS_OCCURRED_$$variables);
    return;
}



procedure _CHECK_READ_$$variables(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$variables);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$variables: bool;

procedure {:inline 1} _LOG_WRITE_$$variables(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$variables, _WRITE_READ_BENIGN_FLAG_$$variables;



implementation {:inline 1} _LOG_WRITE_$$variables(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$variables := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$variables == _value then true else _WRITE_HAS_OCCURRED_$$variables);
    _WRITE_READ_BENIGN_FLAG_$$variables := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$variables == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$variables);
    return;
}



procedure _CHECK_WRITE_$$variables(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$variables != _value);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$variables != _value);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$variables(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$variables;



implementation {:inline 1} _LOG_ATOMIC_$$variables(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$variables := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$variables);
    return;
}



procedure _CHECK_ATOMIC_$$variables(_P: bool, _offset: bv32);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset);
  requires {:source_name "variables"} {:array "$$variables"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$variables(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$variables;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$variables(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$variables := (if _P && _WRITE_HAS_OCCURRED_$$variables && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$variables);
    return;
}



const _WATCHED_VALUE_$$areas: bv32;

procedure {:inline 1} _LOG_READ_$$areas(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$areas;



implementation {:inline 1} _LOG_READ_$$areas(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$areas := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$areas == _value then true else _READ_HAS_OCCURRED_$$areas);
    return;
}



procedure _CHECK_READ_$$areas(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$areas);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$areas: bool;

procedure {:inline 1} _LOG_WRITE_$$areas(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$areas, _WRITE_READ_BENIGN_FLAG_$$areas;



implementation {:inline 1} _LOG_WRITE_$$areas(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$areas := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$areas == _value then true else _WRITE_HAS_OCCURRED_$$areas);
    _WRITE_READ_BENIGN_FLAG_$$areas := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$areas == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$areas);
    return;
}



procedure _CHECK_WRITE_$$areas(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$areas != _value);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$areas != _value);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$areas(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$areas;



implementation {:inline 1} _LOG_ATOMIC_$$areas(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$areas := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$areas);
    return;
}



procedure _CHECK_ATOMIC_$$areas(_P: bool, _offset: bv32);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset);
  requires {:source_name "areas"} {:array "$$areas"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$areas(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$areas;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$areas(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$areas := (if _P && _WRITE_HAS_OCCURRED_$$areas && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$areas);
    return;
}



const _WATCHED_VALUE_$$step_factors: bv32;

procedure {:inline 1} _LOG_READ_$$step_factors(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$step_factors;



implementation {:inline 1} _LOG_READ_$$step_factors(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$step_factors := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$step_factors == _value then true else _READ_HAS_OCCURRED_$$step_factors);
    return;
}



procedure _CHECK_READ_$$step_factors(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$step_factors);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$step_factors: bool;

procedure {:inline 1} _LOG_WRITE_$$step_factors(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$step_factors, _WRITE_READ_BENIGN_FLAG_$$step_factors;



implementation {:inline 1} _LOG_WRITE_$$step_factors(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$step_factors := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$step_factors == _value then true else _WRITE_HAS_OCCURRED_$$step_factors);
    _WRITE_READ_BENIGN_FLAG_$$step_factors := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$step_factors == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$step_factors);
    return;
}



procedure _CHECK_WRITE_$$step_factors(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$step_factors != _value);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$step_factors != _value);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$step_factors(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$step_factors;



implementation {:inline 1} _LOG_ATOMIC_$$step_factors(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$step_factors := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$step_factors);
    return;
}



procedure _CHECK_ATOMIC_$$step_factors(_P: bool, _offset: bv32);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset);
  requires {:source_name "step_factors"} {:array "$$step_factors"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$step_factors(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$step_factors;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$step_factors(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$step_factors := (if _P && _WRITE_HAS_OCCURRED_$$step_factors && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$step_factors);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
