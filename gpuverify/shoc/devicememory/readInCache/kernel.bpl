type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "d_out"} {:global} $$d_out: [bv32]bv32;

axiom {:array_info "$$d_out"} {:global} {:elem_width 32} {:source_name "d_out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_out: bool;

axiom {:array_info "$$img"} {:global} {:elem_width 8} {:source_name "img"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

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

function FADD32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "readInCache"} {:kernel} $readInCache($n: bv32, $samp: bv32);
  requires !_READ_HAS_OCCURRED_$$d_out && !_WRITE_HAS_OCCURRED_$$d_out && !_ATOMIC_HAS_OCCURRED_$$d_out;
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
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
  modifies _WRITE_HAS_OCCURRED_$$d_out, _WRITE_READ_BENIGN_FLAG_$$d_out, _WRITE_READ_BENIGN_FLAG_$$d_out;



implementation {:source_name "readInCache"} {:kernel} $readInCache($n: bv32, $samp: bv32)
{
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $i.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
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
  var p6$1: bool;
  var p6$2: bool;
  var p7$1: bool;
  var p7$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(v0$1, BV32_MUL(group_size_y, num_groups_y)), v1$1);
    v2$2 := BV32_ADD(BV32_MUL(v0$2, BV32_MUL(group_size_y, num_groups_y)), v1$2);
    $sum.0$1, $i.0 := 0bv32, 0bv32;
    $sum.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v3 := BV32_SLT($i.0, $n);
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
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$d_out(true, v2$1, $sum.0$1, $$d_out[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_out(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$d_out(true, v2$2, $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_out"} true;
    $$d_out[v2$1] := $sum.0$1;
    $$d_out[v2$2] := $sum.0$2;
    return;

  $truebb:
    assume {:partition} v3 && v3;
    v4$1 := BV32_SLT(v0$1, 0bv32);
    v4$2 := BV32_SLT(v0$2, 0bv32);
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    $0$1 := (if p0$1 then 0bv32 else $0$1);
    $0$2 := (if p0$2 then 0bv32 else $0$2);
    v5$1 := (if p1$1 then BV32_SGE(v0$1, 32768bv32) else v5$1);
    v5$2 := (if p1$2 then BV32_SGE(v0$2, 32768bv32) else v5$2);
    p3$1 := (if p1$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p1$2 && v5$2 then v5$2 else p3$2);
    p2$1 := (if p1$1 && !v5$1 then !v5$1 else p2$1);
    p2$2 := (if p1$2 && !v5$2 then !v5$2 else p2$2);
    $1$1 := (if p2$1 then v0$1 else $1$1);
    $1$2 := (if p2$2 then v0$2 else $1$2);
    $1$1 := (if p3$1 then 32767bv32 else $1$1);
    $1$2 := (if p3$2 then 32767bv32 else $1$2);
    $0$1 := (if p1$1 then $1$1 else $0$1);
    $0$2 := (if p1$2 then $1$2 else $0$2);
    v6$1 := BV32_SLT(v1$1, 0bv32);
    v6$2 := BV32_SLT(v1$2, 0bv32);
    p4$1 := (if v6$1 then v6$1 else p4$1);
    p4$2 := (if v6$2 then v6$2 else p4$2);
    p5$1 := (if !v6$1 then !v6$1 else p5$1);
    p5$2 := (if !v6$2 then !v6$2 else p5$2);
    $2$1 := (if p4$1 then 0bv32 else $2$1);
    $2$2 := (if p4$2 then 0bv32 else $2$2);
    v7$1 := (if p5$1 then BV32_SGE(v1$1, 32768bv32) else v7$1);
    v7$2 := (if p5$2 then BV32_SGE(v1$2, 32768bv32) else v7$2);
    p7$1 := (if p5$1 && v7$1 then v7$1 else p7$1);
    p7$2 := (if p5$2 && v7$2 then v7$2 else p7$2);
    p6$1 := (if p5$1 && !v7$1 then !v7$1 else p6$1);
    p6$2 := (if p5$2 && !v7$2 then !v7$2 else p6$2);
    $3$1 := (if p6$1 then v1$1 else $3$1);
    $3$2 := (if p6$2 then v1$2 else $3$2);
    $3$1 := (if p7$1 then 32767bv32 else $3$1);
    $3$2 := (if p7$2 then 32767bv32 else $3$2);
    $2$1 := (if p5$1 then $3$1 else $2$1);
    $2$2 := (if p5$2 then $3$2 else $2$2);
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    havoc v18$1, v18$2;
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    havoc v22$1, v22$2;
    havoc v23$1, v23$2;
    $sum.0$1, $i.0 := FADD32($sum.0$1, v11$1 ++ v10$1 ++ v9$1 ++ v8$1), BV32_ADD($i.0, 1bv32);
    $sum.0$2 := FADD32($sum.0$2, v11$2 ++ v10$2 ++ v9$2 ++ v8$2);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_out: bv32;

procedure {:inline 1} _LOG_READ_$$d_out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_out;



implementation {:inline 1} _LOG_READ_$$d_out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_out == _value then true else _READ_HAS_OCCURRED_$$d_out);
    return;
}



procedure _CHECK_READ_$$d_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_out);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_out: bool;

procedure {:inline 1} _LOG_WRITE_$$d_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_out, _WRITE_READ_BENIGN_FLAG_$$d_out;



implementation {:inline 1} _LOG_WRITE_$$d_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_out == _value then true else _WRITE_HAS_OCCURRED_$$d_out);
    _WRITE_READ_BENIGN_FLAG_$$d_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_out);
    return;
}



procedure _CHECK_WRITE_$$d_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_out != _value);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_out != _value);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_out;



implementation {:inline 1} _LOG_ATOMIC_$$d_out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_out);
    return;
}



procedure _CHECK_ATOMIC_$$d_out(_P: bool, _offset: bv32);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_out"} {:array "$$d_out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_out := (if _P && _WRITE_HAS_OCCURRED_$$d_out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_out);
    return;
}



const _WATCHED_VALUE_$$img: bv8;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
