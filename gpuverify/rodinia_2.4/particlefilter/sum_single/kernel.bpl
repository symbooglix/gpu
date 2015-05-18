type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "partial_sums"} {:global} $$partial_sums: [bv32]bv32;

axiom {:array_info "$$partial_sums"} {:global} {:elem_width 32} {:source_name "partial_sums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$partial_sums: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

procedure {:source_name "sum_kernel"} {:kernel} $sum_kernel($Nparticles: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $Nparticles == 400000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$partial_sums && !_WRITE_HAS_OCCURRED_$$partial_sums && !_ATOMIC_HAS_OCCURRED_$$partial_sums;
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
  modifies _READ_HAS_OCCURRED_$$partial_sums, _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:source_name "sum_kernel"} {:kernel} $sum_kernel($Nparticles: bv32)
{
  var $x.0$1: bv32;
  var $x.0$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1) == 0bv32;
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2) == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v0$1 then v0$1 else p0$1);
    p0$2 := (if v0$2 then v0$2 else p0$2);
    $x.0$1, $sum.0$1 := (if p0$1 then 0bv32 else $x.0$1), (if p0$1 then 0bv32 else $sum.0$1);
    $x.0$2, $sum.0$2 := (if p0$2 then 0bv32 else $x.0$2), (if p0$2 then 0bv32 else $sum.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p1$1 ==> _b8 ==> p1$1 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1) == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p1$2 ==> _b8 ==> p1$2 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2) == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1) == 0bv32 && BV32_SLT($x.0$1, BV32_ADD(BV32_UDIV($Nparticles, group_size_x), 1bv32)) ==> p1$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2) == 0bv32 && BV32_SLT($x.0$2, BV32_ADD(BV32_UDIV($Nparticles, group_size_x), 1bv32)) ==> p1$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1) != 0bv32 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b5 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1) != 0bv32 ==> !p1$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b5 ==> BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2) != 0bv32 ==> !p1$2;
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b4 ==> BV32_UGE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b4 ==> BV32_UGE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b3 ==> BV32_ULE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b3 ==> BV32_ULE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b2 ==> BV32_SGE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b2 ==> BV32_SGE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b1 ==> BV32_SLE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b1 ==> BV32_SLE($x.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p1$1 ==> _b0 ==> BV32_SLE(0bv32, $x.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p1$2 ==> _b0 ==> BV32_SLE(0bv32, $x.0$2);
    assert {:block_sourceloc} {:sourceloc_num 3} p1$1 ==> true;
    v1$1 := (if p1$1 then BV32_SLT($x.0$1, BV32_ADD(BV32_UDIV($Nparticles, group_size_x), 1bv32)) else v1$1);
    v1$2 := (if p1$2 then BV32_SLT($x.0$2, BV32_ADD(BV32_UDIV($Nparticles, group_size_x), 1bv32)) else v1$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v1$1 then v1$1 else p2$1);
    p2$2 := (if p1$2 && v1$2 then v1$2 else p2$2);
    p1$1 := (if p1$1 && !v1$1 then v1$1 else p1$1);
    p1$2 := (if p1$2 && !v1$2 then v1$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$partial_sums(p2$1, $x.0$1, $$partial_sums[$x.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$partial_sums(p2$2, $x.0$2, $$partial_sums[$x.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$partial_sums"} true;
    v2$1 := (if p2$1 then $$partial_sums[$x.0$1] else v2$1);
    v2$2 := (if p2$2 then $$partial_sums[$x.0$2] else v2$2);
    $x.0$1, $sum.0$1 := (if p2$1 then BV32_ADD($x.0$1, 1bv32) else $x.0$1), (if p2$1 then FADD32($sum.0$1, v2$1) else $sum.0$1);
    $x.0$2, $sum.0$2 := (if p2$2 then BV32_ADD($x.0$2, 1bv32) else $x.0$2), (if p2$2 then FADD32($sum.0$2, v2$2) else $sum.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p1$1 && !p1$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$partial_sums(p0$1, 0bv32, $sum.0$1, $$partial_sums[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$partial_sums(p0$2, 0bv32, $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$partial_sums"} true;
    $$partial_sums[0bv32] := (if p0$1 then $sum.0$1 else $$partial_sums[0bv32]);
    $$partial_sums[0bv32] := (if p0$2 then $sum.0$2 else $$partial_sums[0bv32]);
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

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 782bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const _WATCHED_VALUE_$$partial_sums: bv32;

procedure {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _READ_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$partial_sums);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$partial_sums: bool;

procedure {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _WRITE_HAS_OCCURRED_$$partial_sums);
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



procedure _CHECK_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
