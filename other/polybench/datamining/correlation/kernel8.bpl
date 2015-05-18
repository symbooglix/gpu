type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "symmat"} {:global} $$symmat: [bv32]bv64;

axiom {:array_info "$$symmat"} {:global} {:elem_width 64} {:source_name "symmat"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$symmat: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$symmat: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$symmat: bool;

var {:source_name "shared_symmat"} {:group_shared} $$kernel8.shared_symmat: [bv1][bv32]bv64;

axiom {:array_info "$$kernel8.shared_symmat"} {:group_shared} {:elem_width 64} {:source_name "shared_symmat"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel8.shared_symmat: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat: bool;

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

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel8"} {:kernel} $kernel8($m: bv32, $n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $m == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $n == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$symmat && !_WRITE_HAS_OCCURRED_$$symmat && !_ATOMIC_HAS_OCCURRED_$$symmat;
  requires !_READ_HAS_OCCURRED_$$kernel8.shared_symmat && !_WRITE_HAS_OCCURRED_$$kernel8.shared_symmat && !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat;
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
  modifies $$kernel8.shared_symmat, _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat, $$symmat, _TRACKING, _READ_HAS_OCCURRED_$$kernel8.shared_symmat, _WRITE_HAS_OCCURRED_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat, _TRACKING;



implementation {:source_name "kernel8"} {:kernel} $kernel8($m: bv32, $n: bv32)
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
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_symmat ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, BV32_SUB($m, 1bv32)) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, BV32_SUB($m, 1bv32)) else v1$2);
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
    v2$1 := (if p1$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 2bv32)) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 2bv32)) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$kernel8.shared_symmat(p3$1, BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1), 4607182418800017408bv64, $$kernel8.shared_symmat[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat(p3$2, BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$kernel8.shared_symmat(p3$2, BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2), 4607182418800017408bv64);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel8.shared_symmat"} true;
    $$kernel8.shared_symmat[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1)] := (if p3$1 then 4607182418800017408bv64 else $$kernel8.shared_symmat[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1)]);
    $$kernel8.shared_symmat[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2)] := (if p3$2 then 4607182418800017408bv64 else $$kernel8.shared_symmat[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2)]);
    goto __partitioned_block_$1_1;

  __partitioned_block_$1_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    v3$1 := (if p1$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 2bv32)) else v3$1);
    v3$2 := (if p1$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 2bv32)) else v3$2);
    p5$1 := (if p1$1 && v3$1 then v3$1 else p5$1);
    p5$2 := (if p1$2 && v3$2 then v3$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$kernel8.shared_symmat(p5$1, BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1), $$kernel8.shared_symmat[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$kernel8.shared_symmat(p5$2, BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2), $$kernel8.shared_symmat[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel8.shared_symmat"} true;
    v4$1 := (if p5$1 then $$kernel8.shared_symmat[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), v0$1)] else v4$1);
    v4$2 := (if p5$2 then $$kernel8.shared_symmat[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), v0$2)] else v4$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$symmat(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $m), BV32_ADD(v0$1, $g1.0$1)), v4$1, $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $m), BV32_ADD(v0$1, $g1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $m), BV32_ADD(v0$2, $g1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$symmat(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $m), BV32_ADD(v0$2, $g1.0$2)), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$symmat"} true;
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $m), BV32_ADD(v0$1, $g1.0$1))] := (if p5$1 then v4$1 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $m), BV32_ADD(v0$1, $g1.0$1))]);
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $m), BV32_ADD(v0$2, $g1.0$2))] := (if p5$2 then v4$2 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $m), BV32_ADD(v0$2, $g1.0$2))]);
    goto __partitioned_block_$1_2;

  __partitioned_block_$1_2:
    call {:sourceloc_num 13} $bugle_barrier_duplicated_1(1bv1, 1bv1, p1$1, p1$2);
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

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$kernel8.shared_symmat, $$symmat, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel8.shared_symmat, $$symmat, _TRACKING;



const _WATCHED_VALUE_$$symmat: bv64;

procedure {:inline 1} _LOG_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$symmat;



implementation {:inline 1} _LOG_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then true else _READ_HAS_OCCURRED_$$symmat);
    return;
}



procedure _CHECK_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$symmat);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$symmat: bool;

procedure {:inline 1} _LOG_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat;



implementation {:inline 1} _LOG_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then true else _WRITE_HAS_OCCURRED_$$symmat);
    _WRITE_READ_BENIGN_FLAG_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$symmat);
    return;
}



procedure _CHECK_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat != _value);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat != _value);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$symmat(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$symmat;



implementation {:inline 1} _LOG_ATOMIC_$$symmat(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$symmat);
    return;
}



procedure _CHECK_ATOMIC_$$symmat(_P: bool, _offset: bv32);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$symmat;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$symmat := (if _P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$symmat);
    return;
}



const _WATCHED_VALUE_$$kernel8.shared_symmat: bv64;

procedure {:inline 1} _LOG_READ_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel8.shared_symmat;



implementation {:inline 1} _LOG_READ_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel8.shared_symmat := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_symmat == _value then true else _READ_HAS_OCCURRED_$$kernel8.shared_symmat);
    return;
}



procedure _CHECK_READ_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat;



implementation {:inline 1} _LOG_WRITE_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_symmat == _value then true else _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat);
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_symmat == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat);
    return;
}



procedure _CHECK_WRITE_$$kernel8.shared_symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_symmat != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_symmat != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel8.shared_symmat(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat;



implementation {:inline 1} _LOG_ATOMIC_$$kernel8.shared_symmat(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat);
    return;
}



procedure _CHECK_ATOMIC_$$kernel8.shared_symmat(_P: bool, _offset: bv32);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat"} {:array "$$kernel8.shared_symmat"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat := (if _P && _WRITE_HAS_OCCURRED_$$kernel8.shared_symmat && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_symmat);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_symmat;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_symmat;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$symmat;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$symmat;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel8.shared_symmat;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_symmat;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_symmat;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_symmat;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$symmat;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$symmat;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel8.shared_symmat;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
