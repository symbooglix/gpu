type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$feature"} {:global} {:elem_width 32} {:source_name "feature"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$feature: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$feature: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$feature: bool;

var {:source_name "feature_swap"} {:global} $$feature_swap: [bv32]bv32;

axiom {:array_info "$$feature_swap"} {:global} {:elem_width 32} {:source_name "feature_swap"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$feature_swap: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$feature_swap: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$feature_swap: bool;

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

procedure {:source_name "kmeans_swap"} {:kernel} $kmeans_swap($npoints: bv32, $nfeatures: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $npoints == 494020bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$feature && !_WRITE_HAS_OCCURRED_$$feature && !_ATOMIC_HAS_OCCURRED_$$feature;
  requires !_READ_HAS_OCCURRED_$$feature_swap && !_WRITE_HAS_OCCURRED_$$feature_swap && !_ATOMIC_HAS_OCCURRED_$$feature_swap;
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
  modifies _WRITE_HAS_OCCURRED_$$feature_swap, _WRITE_READ_BENIGN_FLAG_$$feature_swap, _WRITE_READ_BENIGN_FLAG_$$feature_swap;



implementation {:source_name "kmeans_swap"} {:kernel} $kmeans_swap($npoints: bv32, $nfeatures: bv32)
{
  var $i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b8 ==> _WRITE_HAS_OCCURRED_$$feature_swap ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b7 ==> _WRITE_HAS_OCCURRED_$$feature_swap ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $npoints), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $npoints), 1bv32), BV32_ADD(BV32_MUL(0bv32, $npoints), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b6 ==> _WRITE_HAS_OCCURRED_$$feature_swap ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b5 ==> _WRITE_HAS_OCCURRED_$$feature_swap ==> BV32_SLE(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v1 := BV32_SLT($i.0, $nfeatures);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    return;

  $truebb:
    assume {:partition} v1 && v1;
    havoc v2$1, v2$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$feature_swap(true, BV32_ADD(BV32_MUL($i.0, $npoints), v0$1), v2$1, $$feature_swap[BV32_ADD(BV32_MUL($i.0, $npoints), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$feature_swap(true, BV32_ADD(BV32_MUL($i.0, $npoints), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$feature_swap(true, BV32_ADD(BV32_MUL($i.0, $npoints), v0$2), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$feature_swap"} true;
    $$feature_swap[BV32_ADD(BV32_MUL($i.0, $npoints), v0$1)] := v2$1;
    $$feature_swap[BV32_ADD(BV32_MUL($i.0, $npoints), v0$2)] := v2$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1930bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$feature: bv32;

procedure {:inline 1} _LOG_READ_$$feature(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$feature;



implementation {:inline 1} _LOG_READ_$$feature(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$feature := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature == _value then true else _READ_HAS_OCCURRED_$$feature);
    return;
}



procedure _CHECK_READ_$$feature(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$feature);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$feature: bool;

procedure {:inline 1} _LOG_WRITE_$$feature(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$feature, _WRITE_READ_BENIGN_FLAG_$$feature;



implementation {:inline 1} _LOG_WRITE_$$feature(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$feature := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature == _value then true else _WRITE_HAS_OCCURRED_$$feature);
    _WRITE_READ_BENIGN_FLAG_$$feature := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$feature);
    return;
}



procedure _CHECK_WRITE_$$feature(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature != _value);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature != _value);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$feature(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$feature;



implementation {:inline 1} _LOG_ATOMIC_$$feature(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$feature := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$feature);
    return;
}



procedure _CHECK_ATOMIC_$$feature(_P: bool, _offset: bv32);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset);
  requires {:source_name "feature"} {:array "$$feature"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$feature(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$feature;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$feature(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$feature := (if _P && _WRITE_HAS_OCCURRED_$$feature && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$feature);
    return;
}



const _WATCHED_VALUE_$$feature_swap: bv32;

procedure {:inline 1} _LOG_READ_$$feature_swap(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$feature_swap;



implementation {:inline 1} _LOG_READ_$$feature_swap(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$feature_swap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature_swap == _value then true else _READ_HAS_OCCURRED_$$feature_swap);
    return;
}



procedure _CHECK_READ_$$feature_swap(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$feature_swap);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$feature_swap: bool;

procedure {:inline 1} _LOG_WRITE_$$feature_swap(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$feature_swap, _WRITE_READ_BENIGN_FLAG_$$feature_swap;



implementation {:inline 1} _LOG_WRITE_$$feature_swap(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$feature_swap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature_swap == _value then true else _WRITE_HAS_OCCURRED_$$feature_swap);
    _WRITE_READ_BENIGN_FLAG_$$feature_swap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature_swap == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$feature_swap);
    return;
}



procedure _CHECK_WRITE_$$feature_swap(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature_swap != _value);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$feature_swap != _value);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$feature_swap(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$feature_swap;



implementation {:inline 1} _LOG_ATOMIC_$$feature_swap(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$feature_swap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$feature_swap);
    return;
}



procedure _CHECK_ATOMIC_$$feature_swap(_P: bool, _offset: bv32);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset);
  requires {:source_name "feature_swap"} {:array "$$feature_swap"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$feature_swap(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$feature_swap;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$feature_swap(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$feature_swap := (if _P && _WRITE_HAS_OCCURRED_$$feature_swap && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$feature_swap);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b7: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b8: bool;
