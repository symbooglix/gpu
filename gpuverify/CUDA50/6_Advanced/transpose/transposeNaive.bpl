type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "odata"} {:global} $$odata: [bv32]bv32;

axiom {:array_info "$$odata"} {:global} {:elem_width 32} {:source_name "odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$odata: bool;

axiom {:array_info "$$idata"} {:global} {:elem_width 32} {:source_name "idata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$idata: bool;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "transposeNaive"} {:kernel} $_Z14transposeNaivePfS_iii($width: bv32, $height: bv32, $nreps: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $nreps == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$odata && !_WRITE_HAS_OCCURRED_$$odata && !_ATOMIC_HAS_OCCURRED_$$odata;
  requires !_READ_HAS_OCCURRED_$$idata && !_WRITE_HAS_OCCURRED_$$idata && !_ATOMIC_HAS_OCCURRED_$$idata;
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
  modifies _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:source_name "transposeNaive"} {:kernel} $_Z14transposeNaivePfS_iii($width: bv32, $height: bv32, $nreps: bv32)
{
  var $r.0: bv32;
  var $i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 16bv32), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), local_id_y$2);
    $r.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b14 ==> _WRITE_HAS_OCCURRED_$$odata ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $height), BV32_DIV(BV32_MUL(group_id_y$1, 16bv32), $height)), BV32_MUL(group_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b13 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $height), 16bv32), BV32_DIV(group_id_y$1, $height)), BV32_DIV(local_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b12 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 16bv32), BV32_MUL(group_id_x$1, $height)), BV32_DIV(BV32_MUL(local_id_x$1, $height), 16bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b11 ==> _WRITE_HAS_OCCURRED_$$odata ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(0bv32, BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_y$1), BV32_MUL($height, BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_x$1)))));
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($r.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $r.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $r.0);
    assert {:block_sourceloc} {:sourceloc_num 4} true;
    v2 := BV32_SLT($r.0, $nreps);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    return;

  $truebb:
    assume {:partition} v2 && v2;
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b18 ==> _WRITE_HAS_OCCURRED_$$odata ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $height), BV32_DIV(BV32_MUL(group_id_y$1, 16bv32), $height)), BV32_MUL(group_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b17 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $height), 16bv32), BV32_DIV(group_id_y$1, $height)), BV32_DIV(local_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b16 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 16bv32), BV32_MUL(group_id_x$1, $height)), BV32_DIV(BV32_MUL(local_id_x$1, $height), 16bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b15 ==> _WRITE_HAS_OCCURRED_$$odata ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(0bv32, BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_y$1), BV32_MUL($height, BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_x$1)))));
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b6 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b6 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b5 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b5 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v3 := BV32_SLT($i.0, 16bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    $r.0 := BV32_ADD($r.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v3 && v3;
    havoc v4$1, v4$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$odata(true, BV32_ADD(BV32_ADD(v1$1, BV32_MUL($height, v0$1)), $i.0), v4$1, $$odata[BV32_ADD(BV32_ADD(v1$1, BV32_MUL($height, v0$1)), $i.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(true, BV32_ADD(BV32_ADD(v1$2, BV32_MUL($height, v0$2)), $i.0));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$odata(true, BV32_ADD(BV32_ADD(v1$2, BV32_MUL($height, v0$2)), $i.0), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$odata"} true;
    $$odata[BV32_ADD(BV32_ADD(v1$1, BV32_MUL($height, v0$1)), $i.0)] := v4$1;
    $$odata[BV32_ADD(BV32_ADD(v1$2, BV32_MUL($height, v0$2)), $i.0)] := v4$2;
    $i.0 := BV32_ADD($i.0, 16bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

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

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const _WATCHED_VALUE_$$odata: bv32;

procedure {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _READ_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$odata);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$odata: bool;

procedure {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _WRITE_HAS_OCCURRED_$$odata);
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



procedure _CHECK_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_ATOMIC_$$odata(_P: bool, _offset: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



const _WATCHED_VALUE_$$idata: bv32;

procedure {:inline 1} _LOG_READ_$$idata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$idata;



implementation {:inline 1} _LOG_READ_$$idata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then true else _READ_HAS_OCCURRED_$$idata);
    return;
}



procedure _CHECK_READ_$$idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$idata);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$idata: bool;

procedure {:inline 1} _LOG_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$idata, _WRITE_READ_BENIGN_FLAG_$$idata;



implementation {:inline 1} _LOG_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then true else _WRITE_HAS_OCCURRED_$$idata);
    _WRITE_READ_BENIGN_FLAG_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$idata);
    return;
}



procedure _CHECK_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata != _value);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata != _value);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$idata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$idata;



implementation {:inline 1} _LOG_ATOMIC_$$idata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$idata);
    return;
}



procedure _CHECK_ATOMIC_$$idata(_P: bool, _offset: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$idata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$idata := (if _P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$idata);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b11: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;
