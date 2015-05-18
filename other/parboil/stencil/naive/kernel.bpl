type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$A0"} {:global} {:elem_width 32} {:source_name "A0"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A0: bool;

var {:source_name "Anext"} {:global} $$Anext: [bv32]bv32;

axiom {:array_info "$$Anext"} {:global} {:elem_width 32} {:source_name "Anext"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Anext: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Anext: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Anext: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "naive_kernel"} {:kernel} $naive_kernel($c0: bv32, $c1: bv32, $nx: bv32, $ny: bv32, $nz: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $nx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $ny == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A0 && !_WRITE_HAS_OCCURRED_$$A0 && !_ATOMIC_HAS_OCCURRED_$$A0;
  requires !_READ_HAS_OCCURRED_$$Anext && !_WRITE_HAS_OCCURRED_$$Anext && !_ATOMIC_HAS_OCCURRED_$$Anext;
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
  modifies _WRITE_HAS_OCCURRED_$$Anext, _WRITE_READ_BENIGN_FLAG_$$Anext, _WRITE_READ_BENIGN_FLAG_$$Anext;



implementation {:source_name "naive_kernel"} {:kernel} $naive_kernel($c0: bv32, $c1: bv32, $nx: bv32, $ny: bv32, $nz: bv32)
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
  var v6$1: bool;
  var v6$2: bool;
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(v0$1, 1bv32);
    v1$2 := BV32_ADD(v0$2, 1bv32);
    v2$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v2$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v3$1 := BV32_ADD(v2$1, 1bv32);
    v3$2 := BV32_ADD(v2$2, 1bv32);
    v4$1 := BV32_ADD(BV32_MUL(group_size_z, group_id_z$1), local_id_z$1);
    v4$2 := BV32_ADD(BV32_MUL(group_size_z, group_id_z$2), local_id_z$2);
    v5$1 := BV32_ADD(v4$1, 1bv32);
    v5$2 := BV32_ADD(v4$2, 1bv32);
    v6$1 := BV32_SLT(v1$1, BV32_SUB($nx, 1bv32));
    v6$2 := BV32_SLT(v1$2, BV32_SUB($nx, 1bv32));
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v6$1 then v6$1 else p0$1);
    p0$2 := (if v6$2 then v6$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p0$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p0$2 then _HAVOC_bv32$2 else v7$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p0$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p0$2 then _HAVOC_bv32$2 else v8$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p0$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p0$2 then _HAVOC_bv32$2 else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p0$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p0$2 then _HAVOC_bv32$2 else v10$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p0$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p0$2 then _HAVOC_bv32$2 else v11$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p0$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p0$2 then _HAVOC_bv32$2 else v12$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v13$1 := (if p0$1 then _HAVOC_bv32$1 else v13$1);
    v13$2 := (if p0$2 then _HAVOC_bv32$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$Anext(p0$1, BV32_ADD(v1$1, BV32_MUL($nx, BV32_ADD(v3$1, BV32_MUL($ny, v5$1)))), FADD32(FMUL32($c1, FADD32(FADD32(FADD32(FADD32(FADD32(v7$1, v8$1), v9$1), v10$1), v11$1), v12$1)), FSUB32(2147483648bv32, FMUL32(v13$1, $c0))), $$Anext[BV32_ADD(v1$1, BV32_MUL($nx, BV32_ADD(v3$1, BV32_MUL($ny, v5$1))))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Anext(p0$2, BV32_ADD(v1$2, BV32_MUL($nx, BV32_ADD(v3$2, BV32_MUL($ny, v5$2)))));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$Anext(p0$2, BV32_ADD(v1$2, BV32_MUL($nx, BV32_ADD(v3$2, BV32_MUL($ny, v5$2)))), FADD32(FMUL32($c1, FADD32(FADD32(FADD32(FADD32(FADD32(v7$2, v8$2), v9$2), v10$2), v11$2), v12$2)), FSUB32(2147483648bv32, FMUL32(v13$2, $c0))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Anext"} true;
    $$Anext[BV32_ADD(v1$1, BV32_MUL($nx, BV32_ADD(v3$1, BV32_MUL($ny, v5$1))))] := (if p0$1 then FADD32(FMUL32($c1, FADD32(FADD32(FADD32(FADD32(FADD32(v7$1, v8$1), v9$1), v10$1), v11$1), v12$1)), FSUB32(2147483648bv32, FMUL32(v13$1, $c0))) else $$Anext[BV32_ADD(v1$1, BV32_MUL($nx, BV32_ADD(v3$1, BV32_MUL($ny, v5$1))))]);
    $$Anext[BV32_ADD(v1$2, BV32_MUL($nx, BV32_ADD(v3$2, BV32_MUL($ny, v5$2))))] := (if p0$2 then FADD32(FMUL32($c1, FADD32(FADD32(FADD32(FADD32(FADD32(v7$2, v8$2), v9$2), v10$2), v11$2), v12$2)), FSUB32(2147483648bv32, FMUL32(v13$2, $c0))) else $$Anext[BV32_ADD(v1$2, BV32_MUL($nx, BV32_ADD(v3$2, BV32_MUL($ny, v5$2))))]);
    return;
}



axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 510bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 62bv32 then 1bv1 else 0bv1) != 0bv1;

const _WATCHED_VALUE_$$A0: bv32;

procedure {:inline 1} _LOG_READ_$$A0(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$A0;



implementation {:inline 1} _LOG_READ_$$A0(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$A0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A0 == _value then true else _READ_HAS_OCCURRED_$$A0);
    return;
}



procedure _CHECK_READ_$$A0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$A0);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$A0: bool;

procedure {:inline 1} _LOG_WRITE_$$A0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$A0, _WRITE_READ_BENIGN_FLAG_$$A0;



implementation {:inline 1} _LOG_WRITE_$$A0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$A0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A0 == _value then true else _WRITE_HAS_OCCURRED_$$A0);
    _WRITE_READ_BENIGN_FLAG_$$A0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$A0);
    return;
}



procedure _CHECK_WRITE_$$A0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A0 != _value);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A0 != _value);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$A0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$A0;



implementation {:inline 1} _LOG_ATOMIC_$$A0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$A0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$A0);
    return;
}



procedure _CHECK_ATOMIC_$$A0(_P: bool, _offset: bv32);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "A0"} {:array "$$A0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$A0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$A0 := (if _P && _WRITE_HAS_OCCURRED_$$A0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$A0);
    return;
}



const _WATCHED_VALUE_$$Anext: bv32;

procedure {:inline 1} _LOG_READ_$$Anext(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Anext;



implementation {:inline 1} _LOG_READ_$$Anext(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Anext := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Anext == _value then true else _READ_HAS_OCCURRED_$$Anext);
    return;
}



procedure _CHECK_READ_$$Anext(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Anext);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Anext: bool;

procedure {:inline 1} _LOG_WRITE_$$Anext(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Anext, _WRITE_READ_BENIGN_FLAG_$$Anext;



implementation {:inline 1} _LOG_WRITE_$$Anext(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Anext := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Anext == _value then true else _WRITE_HAS_OCCURRED_$$Anext);
    _WRITE_READ_BENIGN_FLAG_$$Anext := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Anext == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Anext);
    return;
}



procedure _CHECK_WRITE_$$Anext(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Anext != _value);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Anext != _value);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Anext(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Anext;



implementation {:inline 1} _LOG_ATOMIC_$$Anext(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Anext := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Anext);
    return;
}



procedure _CHECK_ATOMIC_$$Anext(_P: bool, _offset: bv32);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset);
  requires {:source_name "Anext"} {:array "$$Anext"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Anext(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Anext;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Anext(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Anext := (if _P && _WRITE_HAS_OCCURRED_$$Anext && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Anext);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
