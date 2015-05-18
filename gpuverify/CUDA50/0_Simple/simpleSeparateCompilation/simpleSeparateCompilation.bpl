type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "v"} {:global} $$v: [bv32]bv32;

axiom {:array_info "$$v"} {:global} {:elem_width 32} {:source_name "v"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v: bool;

const _WATCHED_OFFSET: bv32;

type functionPtr = bv3;

const $functionId$$_Z13multiplyByTwof: functionPtr;

axiom $functionId$$_Z13multiplyByTwof == 1bv3;

const $functionId$$_Z11divideByTwof: functionPtr;

axiom $functionId$$_Z11divideByTwof == 2bv3;

const $functionId$$_Z15transformVectorPfPFffEj: functionPtr;

axiom $functionId$$_Z15transformVectorPfPFffEj == 3bv3;

const $functionId$$null$: functionPtr;

axiom $functionId$$null$ == 0bv3;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "multiplyByTwo"} $_Z13multiplyByTwof(_P$1: bool, $number$1: bv32, _P$2: bool, $number$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
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
  requires _b0 ==> _P$1 == _P$2;
  requires _b1 ==> _P$1 && _P$2 ==> $number$1 == $number$2;
  requires _b2 ==> $number$1 == $number$2;
  requires _b3 ==> !_READ_HAS_OCCURRED_$$v;
  requires _b4 ==> !_WRITE_HAS_OCCURRED_$$v;
  requires _b5 ==> !_ATOMIC_HAS_OCCURRED_$$v;
  requires _b6 ==> _READ_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  requires _b7 ==> _WRITE_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  requires _b8 ==> _ATOMIC_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b9 ==> $ret$1 == $ret$2;
  ensures _b10 ==> !_READ_HAS_OCCURRED_$$v;
  ensures _b11 ==> !_WRITE_HAS_OCCURRED_$$v;
  ensures _b12 ==> !_ATOMIC_HAS_OCCURRED_$$v;
  ensures _b13 ==> _READ_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b14 ==> _WRITE_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b15 ==> _ATOMIC_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;



implementation {:source_name "multiplyByTwo"} $_Z13multiplyByTwof(_P$1: bool, $number$1: bv32, _P$2: bool, $number$2: bv32) returns ($ret$1: bv32, $ret$2: bv32)
{

  $0:
    $ret$1 := (if _P$1 then FMUL32($number$1, 1073741824bv32) else $ret$1);
    $ret$2 := (if _P$2 then FMUL32($number$2, 1073741824bv32) else $ret$2);
    return;
}



procedure {:source_name "divideByTwo"} $_Z11divideByTwof(_P$1: bool, $number$1: bv32, _P$2: bool, $number$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
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
  requires _b16 ==> _P$1 == _P$2;
  requires _b17 ==> _P$1 && _P$2 ==> $number$1 == $number$2;
  requires _b18 ==> $number$1 == $number$2;
  requires _b19 ==> !_READ_HAS_OCCURRED_$$v;
  requires _b20 ==> !_WRITE_HAS_OCCURRED_$$v;
  requires _b21 ==> !_ATOMIC_HAS_OCCURRED_$$v;
  requires _b22 ==> _READ_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  requires _b23 ==> _WRITE_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  requires _b24 ==> _ATOMIC_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b25 ==> $ret$1 == $ret$2;
  ensures _b26 ==> !_READ_HAS_OCCURRED_$$v;
  ensures _b27 ==> !_WRITE_HAS_OCCURRED_$$v;
  ensures _b28 ==> !_ATOMIC_HAS_OCCURRED_$$v;
  ensures _b29 ==> _READ_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b30 ==> _WRITE_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;
  ensures _b31 ==> _ATOMIC_HAS_OCCURRED_$$v ==> _WATCHED_OFFSET == local_id_x$1;



implementation {:source_name "divideByTwo"} $_Z11divideByTwof(_P$1: bool, $number$1: bv32, _P$2: bool, $number$2: bv32) returns ($ret$1: bv32, $ret$2: bv32)
{

  $0:
    $ret$1 := (if _P$1 then FMUL32($number$1, 1056964608bv32) else $ret$1);
    $ret$2 := (if _P$2 then FMUL32($number$2, 1056964608bv32) else $ret$2);
    return;
}



procedure {:source_name "transformVector"} {:kernel} $_Z15transformVectorPfPFffEj($f: functionPtr, $size: bv32);
  requires {:sourceloc_num 2} {:thread 1} (if BV32_OR(BV1_ZEXT32((if $f == $functionId$$_Z13multiplyByTwof then 1bv1 else 0bv1)), BV1_ZEXT32((if $f == $functionId$$_Z11divideByTwof then 1bv1 else 0bv1))) != 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$v && !_WRITE_HAS_OCCURRED_$$v && !_ATOMIC_HAS_OCCURRED_$$v;
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
  modifies _READ_HAS_OCCURRED_$$v, _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:source_name "transformVector"} {:kernel} $_Z15transformVectorPfPFffEj($f: functionPtr, $size: bv32)
{
  var v1$1: bool;
  var v1$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var p4$1: bool;
  var p4$2: bool;
  var p5$1: bool;
  var p5$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ULT(v0$1, $size);
    v1$2 := BV32_ULT(v0$2, $size);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$v(p0$1, v0$1, $$v[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$v(p0$2, v0$2, $$v[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v2$1 := (if p0$1 then $$v[v0$1] else v2$1);
    v2$2 := (if p0$2 then $$v[v0$2] else v2$2);
    p1$1 := (if p0$1 && $f == $functionId$$_Z13multiplyByTwof then $f == $functionId$$_Z13multiplyByTwof else p1$1);
    p1$2 := (if p0$2 && $f == $functionId$$_Z13multiplyByTwof then $f == $functionId$$_Z13multiplyByTwof else p1$2);
    p2$1 := (if p0$1 && $f != $functionId$$_Z13multiplyByTwof then $f != $functionId$$_Z13multiplyByTwof else p2$1);
    p2$2 := (if p0$2 && $f != $functionId$$_Z13multiplyByTwof then $f != $functionId$$_Z13multiplyByTwof else p2$2);
    call {:sourceloc_num 6} v3$1, v3$2 := $_Z13multiplyByTwof(p1$1, v2$1, p1$2, v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z13multiplyByTwof"} true;
    p3$1 := (if p2$1 && $f == $functionId$$_Z11divideByTwof then $f == $functionId$$_Z11divideByTwof else p3$1);
    p3$2 := (if p2$2 && $f == $functionId$$_Z11divideByTwof then $f == $functionId$$_Z11divideByTwof else p3$2);
    p4$1 := (if p2$1 && $f != $functionId$$_Z11divideByTwof then $f != $functionId$$_Z11divideByTwof else p4$1);
    p4$2 := (if p2$2 && $f != $functionId$$_Z11divideByTwof then $f != $functionId$$_Z11divideByTwof else p4$2);
    call {:sourceloc_num 7} v3$1, v3$2 := $_Z11divideByTwof(p3$1, v2$1, p3$2, v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z11divideByTwof"} true;
    assert {:bad_pointer_access} {:sourceloc_num 8} {:thread 1} p4$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 8} {:thread 2} p4$2 ==> false;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$v(p0$1, v0$1, v3$1, $$v[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$v(p0$2, v0$2, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[v0$1] := (if p0$1 then v3$1 else $$v[v0$1]);
    $$v[v0$2] := (if p0$2 then v3$2 else $$v[v0$2]);
    return;
}



axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$v: bv32;

procedure {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _READ_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_READ_$$v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v: bool;

procedure {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _WRITE_HAS_OCCURRED_$$v);
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



procedure _CHECK_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_ATOMIC_$$v(_P: bool, _offset: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;
