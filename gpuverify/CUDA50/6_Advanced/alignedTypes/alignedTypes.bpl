type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_odata"} {:global} $$d_odata: [bv32]bv32;

axiom {:array_info "$$d_odata"} {:global} {:elem_width 32} {:source_name "d_odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_odata: bool;

axiom {:array_info "$$d_idata"} {:global} {:elem_width 32} {:source_name "d_idata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_idata: bool;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "testKernel<int>"} {:kernel} $_Z10testKernelIiEvPT_S1_i($numElements: bv32);
  requires !_READ_HAS_OCCURRED_$$d_odata && !_WRITE_HAS_OCCURRED_$$d_odata && !_ATOMIC_HAS_OCCURRED_$$d_odata;
  requires !_READ_HAS_OCCURRED_$$d_idata && !_WRITE_HAS_OCCURRED_$$d_idata && !_ATOMIC_HAS_OCCURRED_$$d_idata;
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
  modifies _WRITE_HAS_OCCURRED_$$d_odata, _WRITE_READ_BENIGN_FLAG_$$d_odata, _WRITE_READ_BENIGN_FLAG_$$d_odata;



implementation {:source_name "testKernel<int>"} {:kernel} $_Z10testKernelIiEvPT_S1_i($numElements: bv32)
{
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    $pos.0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    $pos.0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b7 ==> _WRITE_HAS_OCCURRED_$$d_odata ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($pos.0$1, $numElements) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($pos.0$2, $numElements) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $pos.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $pos.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLT($pos.0$1, $numElements) else v0$1);
    v0$2 := (if p0$2 then BV32_SLT($pos.0$2, $numElements) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v1$1 := (if p1$1 then _HAVOC_bv32$1 else v1$1);
    v1$2 := (if p1$2 then _HAVOC_bv32$2 else v1$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$d_odata(p1$1, $pos.0$1, v1$1, $$d_odata[$pos.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_odata(p1$2, $pos.0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$d_odata(p1$2, $pos.0$2, v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_odata"} true;
    $$d_odata[$pos.0$1] := (if p1$1 then v1$1 else $$d_odata[$pos.0$1]);
    $$d_odata[$pos.0$2] := (if p1$2 then v1$2 else $$d_odata[$pos.0$2]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const _WATCHED_VALUE_$$d_odata: bv32;

procedure {:inline 1} _LOG_READ_$$d_odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_odata;



implementation {:inline 1} _LOG_READ_$$d_odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_odata == _value then true else _READ_HAS_OCCURRED_$$d_odata);
    return;
}



procedure _CHECK_READ_$$d_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_odata);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_odata: bool;

procedure {:inline 1} _LOG_WRITE_$$d_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_odata, _WRITE_READ_BENIGN_FLAG_$$d_odata;



implementation {:inline 1} _LOG_WRITE_$$d_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_odata == _value then true else _WRITE_HAS_OCCURRED_$$d_odata);
    _WRITE_READ_BENIGN_FLAG_$$d_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_odata);
    return;
}



procedure _CHECK_WRITE_$$d_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_odata != _value);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_odata != _value);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_odata;



implementation {:inline 1} _LOG_ATOMIC_$$d_odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_odata);
    return;
}



procedure _CHECK_ATOMIC_$$d_odata(_P: bool, _offset: bv32);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_odata"} {:array "$$d_odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_odata := (if _P && _WRITE_HAS_OCCURRED_$$d_odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_odata);
    return;
}



const _WATCHED_VALUE_$$d_idata: bv32;

procedure {:inline 1} _LOG_READ_$$d_idata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_idata;



implementation {:inline 1} _LOG_READ_$$d_idata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_idata == _value then true else _READ_HAS_OCCURRED_$$d_idata);
    return;
}



procedure _CHECK_READ_$$d_idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_idata);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_idata: bool;

procedure {:inline 1} _LOG_WRITE_$$d_idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_idata, _WRITE_READ_BENIGN_FLAG_$$d_idata;



implementation {:inline 1} _LOG_WRITE_$$d_idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_idata == _value then true else _WRITE_HAS_OCCURRED_$$d_idata);
    _WRITE_READ_BENIGN_FLAG_$$d_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_idata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_idata);
    return;
}



procedure _CHECK_WRITE_$$d_idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_idata != _value);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_idata != _value);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_idata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_idata;



implementation {:inline 1} _LOG_ATOMIC_$$d_idata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_idata);
    return;
}



procedure _CHECK_ATOMIC_$$d_idata(_P: bool, _offset: bv32);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_idata"} {:array "$$d_idata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_idata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_idata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_idata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_idata := (if _P && _WRITE_HAS_OCCURRED_$$d_idata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_idata);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b7: bool;
