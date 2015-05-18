type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$r"} {:global} {:elem_width 64} {:source_name "r"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$r: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$r: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$r: bool;

var {:source_name "sum"} {:global} $$sum: [bv32]bv64;

axiom {:array_info "$$sum"} {:global} {:elem_width 64} {:source_name "sum"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sum: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sum: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sum: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "kernel2"} {:kernel} $kernel2($n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$r && !_WRITE_HAS_OCCURRED_$$r && !_ATOMIC_HAS_OCCURRED_$$r;
  requires !_READ_HAS_OCCURRED_$$sum && !_WRITE_HAS_OCCURRED_$$sum && !_ATOMIC_HAS_OCCURRED_$$sum;
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
  modifies _WRITE_HAS_OCCURRED_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum, $$sum, _TRACKING;



implementation {:source_name "kernel2"} {:kernel} $kernel2($n: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv64;
  var v4$2: bv64;
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
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    $g1.0$1 := BV32_MUL(32bv32, group_id_x$1);
    $g1.0$2 := BV32_MUL(32bv32, group_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$1_0;

  __partitioned_block_$1_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, $n) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, $n) else v1$2);
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
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    v2$1 := (if p1$1 then BV32_SGE(BV32_ADD(v0$1, $g1.0$1), 1bv32) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE(BV32_ADD(v0$2, $g1.0$2), 1bv32) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    v3$1 := (if p3$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v3$1);
    v3$2 := (if p3$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v3$2);
    p5$1 := (if p3$1 && v3$1 then v3$1 else p5$1);
    p5$2 := (if p3$2 && v3$2 then v3$2 else p5$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v4$1 := (if p5$1 then _HAVOC_bv64$1 else v4$1);
    v4$2 := (if p5$2 then _HAVOC_bv64$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$sum(p5$1, BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$1, $g1.0$1)), v4$1, $$sum[BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$1, $g1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(p5$2, BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$2, $g1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$sum(p5$2, BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$2, $g1.0$2)), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum"} true;
    $$sum[BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$1, $g1.0$1))] := (if p5$1 then v4$1 else $$sum[BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$1, $g1.0$1))]);
    $$sum[BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$2, $g1.0$2))] := (if p5$2 then v4$2 else $$sum[BV32_ADD(BV32_MUL(0bv32, $n), BV32_ADD(v0$2, $g1.0$2))]);
    goto __partitioned_block_$1_1;

  __partitioned_block_$1_1:
    call {:sourceloc_num 9} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    $g1.0$1 := (if p1$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p1$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$1_0;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$sum, _TRACKING;



const _WATCHED_VALUE_$$r: bv64;

procedure {:inline 1} _LOG_READ_$$r(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$r;



implementation {:inline 1} _LOG_READ_$$r(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$r := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$r == _value then true else _READ_HAS_OCCURRED_$$r);
    return;
}



procedure _CHECK_READ_$$r(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "r"} {:array "$$r"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$r);
  requires {:source_name "r"} {:array "$$r"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$r: bool;

procedure {:inline 1} _LOG_WRITE_$$r(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$r, _WRITE_READ_BENIGN_FLAG_$$r;



implementation {:inline 1} _LOG_WRITE_$$r(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$r := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$r == _value then true else _WRITE_HAS_OCCURRED_$$r);
    _WRITE_READ_BENIGN_FLAG_$$r := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$r == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$r);
    return;
}



procedure _CHECK_WRITE_$$r(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "r"} {:array "$$r"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$r != _value);
  requires {:source_name "r"} {:array "$$r"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$r != _value);
  requires {:source_name "r"} {:array "$$r"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$r(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$r;



implementation {:inline 1} _LOG_ATOMIC_$$r(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$r := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$r);
    return;
}



procedure _CHECK_ATOMIC_$$r(_P: bool, _offset: bv32);
  requires {:source_name "r"} {:array "$$r"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset);
  requires {:source_name "r"} {:array "$$r"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$r(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$r;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$r(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$r := (if _P && _WRITE_HAS_OCCURRED_$$r && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$r);
    return;
}



const _WATCHED_VALUE_$$sum: bv64;

procedure {:inline 1} _LOG_READ_$$sum(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$sum;



implementation {:inline 1} _LOG_READ_$$sum(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then true else _READ_HAS_OCCURRED_$$sum);
    return;
}



procedure _CHECK_READ_$$sum(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sum);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sum: bool;

procedure {:inline 1} _LOG_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum;



implementation {:inline 1} _LOG_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then true else _WRITE_HAS_OCCURRED_$$sum);
    _WRITE_READ_BENIGN_FLAG_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sum);
    return;
}



procedure _CHECK_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum != _value);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum != _value);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sum(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sum;



implementation {:inline 1} _LOG_ATOMIC_$$sum(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sum);
    return;
}



procedure _CHECK_ATOMIC_$$sum(_P: bool, _offset: bv32);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sum;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sum := (if _P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sum);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$sum;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
