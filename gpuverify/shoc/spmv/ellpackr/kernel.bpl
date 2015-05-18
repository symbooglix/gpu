type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$val"} {:global} {:elem_width 32} {:source_name "val"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$val: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$val: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$val: bool;

axiom {:array_info "$$vec"} {:global} {:elem_width 32} {:source_name "vec"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vec: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vec: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vec: bool;

axiom {:array_info "$$cols"} {:global} {:elem_width 32} {:source_name "cols"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$cols: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$cols: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$cols: bool;

var {:source_name "rowLengths"} {:global} $$rowLengths: [bv32]bv32;

axiom {:array_info "$$rowLengths"} {:global} {:elem_width 32} {:source_name "rowLengths"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rowLengths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rowLengths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rowLengths: bool;

var {:source_name "out"} {:global} $$out: [bv32]bv32;

axiom {:array_info "$$out"} {:global} {:elem_width 32} {:source_name "out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$out: bool;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "spmv_ellpackr_kernel"} {:kernel} $spmv_ellpackr_kernel($dim: bv32);
  requires !_READ_HAS_OCCURRED_$$val && !_WRITE_HAS_OCCURRED_$$val && !_ATOMIC_HAS_OCCURRED_$$val;
  requires !_READ_HAS_OCCURRED_$$vec && !_WRITE_HAS_OCCURRED_$$vec && !_ATOMIC_HAS_OCCURRED_$$vec;
  requires !_READ_HAS_OCCURRED_$$cols && !_WRITE_HAS_OCCURRED_$$cols && !_ATOMIC_HAS_OCCURRED_$$cols;
  requires !_READ_HAS_OCCURRED_$$rowLengths && !_WRITE_HAS_OCCURRED_$$rowLengths && !_ATOMIC_HAS_OCCURRED_$$rowLengths;
  requires !_READ_HAS_OCCURRED_$$out && !_WRITE_HAS_OCCURRED_$$out && !_ATOMIC_HAS_OCCURRED_$$out;
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
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:source_name "spmv_ellpackr_kernel"} {:kernel} $spmv_ellpackr_kernel($dim: bv32)
{
  var $result.0$1: bv32;
  var $result.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, $dim);
    v1$2 := BV32_SLT(v0$2, $dim);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    v2$1 := (if p0$1 then $$rowLengths[v0$1] else v2$1);
    v2$2 := (if p0$2 then $$rowLengths[v0$2] else v2$2);
    $result.0$1, $i.0$1 := (if p0$1 then 0bv32 else $result.0$1), (if p0$1 then 0bv32 else $i.0$1);
    $result.0$2, $i.0$2 := (if p0$2 then 0bv32 else $result.0$2), (if p0$2 then 0bv32 else $i.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 3} p1$1 ==> true;
    v3$1 := (if p1$1 then BV32_SLT($i.0$1, v2$1) else v3$1);
    v3$2 := (if p1$2 then BV32_SLT($i.0$2, v2$2) else v3$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v3$1 then v3$1 else p2$1);
    p2$2 := (if p1$2 && v3$2 then v3$2 else p2$2);
    p1$1 := (if p1$1 && !v3$1 then v3$1 else p1$1);
    p1$2 := (if p1$2 && !v3$2 then v3$2 else p1$2);
    v4$1 := (if p2$1 then BV32_ADD(BV32_MUL($i.0$1, $dim), v0$1) else v4$1);
    v4$2 := (if p2$2 then BV32_ADD(BV32_MUL($i.0$2, $dim), v0$2) else v4$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p2$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p2$2 then _HAVOC_bv32$2 else v5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p2$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p2$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p2$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p2$2 then _HAVOC_bv32$2 else v7$2);
    $result.0$1, $i.0$1 := (if p2$1 then FADD32($result.0$1, FMUL32(v5$1, v7$1)) else $result.0$1), (if p2$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1);
    $result.0$2, $i.0$2 := (if p2$2 then FADD32($result.0$2, FMUL32(v5$2, v7$2)) else $result.0$2), (if p2$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p1$1 && !p1$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$out(p0$1, v0$1, $result.0$1, $$out[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$out(p0$2, v0$2, $result.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[v0$1] := (if p0$1 then $result.0$1 else $$out[v0$1]);
    $$out[v0$2] := (if p0$2 then $result.0$2 else $$out[v0$2]);
    return;

  $2.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $2;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$val: bv32;

procedure {:inline 1} _LOG_READ_$$val(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$val;



implementation {:inline 1} _LOG_READ_$$val(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$val := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$val == _value then true else _READ_HAS_OCCURRED_$$val);
    return;
}



procedure _CHECK_READ_$$val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "val"} {:array "$$val"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$val);
  requires {:source_name "val"} {:array "$$val"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$val: bool;

procedure {:inline 1} _LOG_WRITE_$$val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$val, _WRITE_READ_BENIGN_FLAG_$$val;



implementation {:inline 1} _LOG_WRITE_$$val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$val := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$val == _value then true else _WRITE_HAS_OCCURRED_$$val);
    _WRITE_READ_BENIGN_FLAG_$$val := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$val == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$val);
    return;
}



procedure _CHECK_WRITE_$$val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "val"} {:array "$$val"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$val != _value);
  requires {:source_name "val"} {:array "$$val"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$val != _value);
  requires {:source_name "val"} {:array "$$val"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$val(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$val;



implementation {:inline 1} _LOG_ATOMIC_$$val(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$val := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$val);
    return;
}



procedure _CHECK_ATOMIC_$$val(_P: bool, _offset: bv32);
  requires {:source_name "val"} {:array "$$val"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset);
  requires {:source_name "val"} {:array "$$val"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$val(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$val;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$val(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$val := (if _P && _WRITE_HAS_OCCURRED_$$val && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$val);
    return;
}



const _WATCHED_VALUE_$$vec: bv32;

procedure {:inline 1} _LOG_READ_$$vec(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vec;



implementation {:inline 1} _LOG_READ_$$vec(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vec := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vec == _value then true else _READ_HAS_OCCURRED_$$vec);
    return;
}



procedure _CHECK_READ_$$vec(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vec);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vec: bool;

procedure {:inline 1} _LOG_WRITE_$$vec(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vec, _WRITE_READ_BENIGN_FLAG_$$vec;



implementation {:inline 1} _LOG_WRITE_$$vec(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vec := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vec == _value then true else _WRITE_HAS_OCCURRED_$$vec);
    _WRITE_READ_BENIGN_FLAG_$$vec := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vec == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vec);
    return;
}



procedure _CHECK_WRITE_$$vec(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vec != _value);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vec != _value);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vec(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vec;



implementation {:inline 1} _LOG_ATOMIC_$$vec(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vec := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vec);
    return;
}



procedure _CHECK_ATOMIC_$$vec(_P: bool, _offset: bv32);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset);
  requires {:source_name "vec"} {:array "$$vec"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vec(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vec;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vec(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vec := (if _P && _WRITE_HAS_OCCURRED_$$vec && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vec);
    return;
}



const _WATCHED_VALUE_$$cols: bv32;

procedure {:inline 1} _LOG_READ_$$cols(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$cols;



implementation {:inline 1} _LOG_READ_$$cols(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$cols := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$cols == _value then true else _READ_HAS_OCCURRED_$$cols);
    return;
}



procedure _CHECK_READ_$$cols(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$cols);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$cols: bool;

procedure {:inline 1} _LOG_WRITE_$$cols(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$cols, _WRITE_READ_BENIGN_FLAG_$$cols;



implementation {:inline 1} _LOG_WRITE_$$cols(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$cols := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$cols == _value then true else _WRITE_HAS_OCCURRED_$$cols);
    _WRITE_READ_BENIGN_FLAG_$$cols := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$cols == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$cols);
    return;
}



procedure _CHECK_WRITE_$$cols(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$cols != _value);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$cols != _value);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$cols(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$cols;



implementation {:inline 1} _LOG_ATOMIC_$$cols(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$cols := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$cols);
    return;
}



procedure _CHECK_ATOMIC_$$cols(_P: bool, _offset: bv32);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset);
  requires {:source_name "cols"} {:array "$$cols"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$cols(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$cols;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$cols(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$cols := (if _P && _WRITE_HAS_OCCURRED_$$cols && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$cols);
    return;
}



const _WATCHED_VALUE_$$rowLengths: bv32;

procedure {:inline 1} _LOG_READ_$$rowLengths(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rowLengths;



implementation {:inline 1} _LOG_READ_$$rowLengths(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rowLengths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rowLengths == _value then true else _READ_HAS_OCCURRED_$$rowLengths);
    return;
}



procedure _CHECK_READ_$$rowLengths(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rowLengths);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rowLengths: bool;

procedure {:inline 1} _LOG_WRITE_$$rowLengths(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rowLengths, _WRITE_READ_BENIGN_FLAG_$$rowLengths;



implementation {:inline 1} _LOG_WRITE_$$rowLengths(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rowLengths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rowLengths == _value then true else _WRITE_HAS_OCCURRED_$$rowLengths);
    _WRITE_READ_BENIGN_FLAG_$$rowLengths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rowLengths == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rowLengths);
    return;
}



procedure _CHECK_WRITE_$$rowLengths(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rowLengths != _value);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rowLengths != _value);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rowLengths(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rowLengths;



implementation {:inline 1} _LOG_ATOMIC_$$rowLengths(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rowLengths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rowLengths);
    return;
}



procedure _CHECK_ATOMIC_$$rowLengths(_P: bool, _offset: bv32);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset);
  requires {:source_name "rowLengths"} {:array "$$rowLengths"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rowLengths(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rowLengths;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rowLengths(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rowLengths := (if _P && _WRITE_HAS_OCCURRED_$$rowLengths && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rowLengths);
    return;
}



const _WATCHED_VALUE_$$out: bv32;

procedure {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _READ_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$out);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$out: bool;

procedure {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _WRITE_HAS_OCCURRED_$$out);
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



procedure _CHECK_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_ATOMIC_$$out(_P: bool, _offset: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
