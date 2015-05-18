type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$work"} {:global} {:elem_width 32} {:source_name "work"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$work: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$work: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$work: bool;

var {:source_name "fail"} {:global} $$fail: [bv32]bv32;

axiom {:array_info "$$fail"} {:global} {:elem_width 32} {:source_name "fail"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$fail: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$fail: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$fail: bool;

var {:source_name "a"} $$a$1: [bv32]bv32;

var {:source_name "a"} $$a$2: [bv32]bv32;

axiom {:array_info "$$a"} {:elem_width 32} {:source_name "a"} {:source_elem_width 64} {:source_dimensions "8"} true;

var {:source_name "b"} $$b$1: [bv32]bv32;

var {:source_name "b"} $$b$2: [bv32]bv32;

axiom {:array_info "$$b"} {:elem_width 32} {:source_name "b"} {:source_elem_width 64} {:source_dimensions "8"} true;

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

function FLT32(bv32, bv32) : bool;

function FUNO32(bv32, bv32) : bool;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "chk1D_512"} {:kernel} $chk1D_512($half_n_cmplx: bv32);
  requires !_READ_HAS_OCCURRED_$$work && !_WRITE_HAS_OCCURRED_$$work && !_ATOMIC_HAS_OCCURRED_$$work;
  requires !_READ_HAS_OCCURRED_$$fail && !_WRITE_HAS_OCCURRED_$$fail && !_ATOMIC_HAS_OCCURRED_$$fail;
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
  modifies _WRITE_HAS_OCCURRED_$$fail, _WRITE_READ_BENIGN_FLAG_$$fail, _WRITE_READ_BENIGN_FLAG_$$fail;



implementation {:source_name "chk1D_512"} {:kernel} $chk1D_512($half_n_cmplx: bv32)
{
  var $i.0: bv32;
  var $i.1: bv32;
  var $i.2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 512bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 512bv32), local_id_x$2);
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v1 := BV32_SLT($i.0, 8bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    $i.1 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 9} true;
    v4 := BV32_SLT($i.1, 8bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    $i.2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b5 ==> _WRITE_HAS_OCCURRED_$$fail ==> _WATCHED_OFFSET == 0bv32;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.2, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.2);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.2);
    assert {:block_sourceloc} {:sourceloc_num 17} true;
    v7 := BV32_SLT($i.2, 8bv32);
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
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v7 && !v7;
    return;

  $truebb1:
    assume {:partition} v7 && v7;
    v8$1 := $$a$1[BV32_MUL($i.2, 2bv32)];
    v8$2 := $$a$2[BV32_MUL($i.2, 2bv32)];
    v9$1 := $$a$1[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)];
    v9$2 := $$a$2[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)];
    v10$1 := $$b$1[BV32_MUL($i.2, 2bv32)];
    v10$2 := $$b$2[BV32_MUL($i.2, 2bv32)];
    v11$1 := $$b$1[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)];
    v11$2 := $$b$2[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)];
    v12$1 := FLT32(v10$1, v8$1) || FLT32(v8$1, v10$1) || FUNO32(v8$1, v10$1);
    v12$2 := FLT32(v10$2, v8$2) || FLT32(v8$2, v10$2) || FUNO32(v8$2, v10$2);
    p4$1 := (if v12$1 then v12$1 else p4$1);
    p4$2 := (if v12$2 then v12$2 else p4$2);
    p1$1 := (if !v12$1 then !v12$1 else p1$1);
    p1$2 := (if !v12$2 then !v12$2 else p1$2);
    p4$1 := (if p0$1 then true else p4$1);
    p4$2 := (if p0$2 then true else p4$2);
    v13$1 := (if p1$1 then $$a$1[BV32_MUL($i.2, 2bv32)] else v13$1);
    v13$2 := (if p1$2 then $$a$2[BV32_MUL($i.2, 2bv32)] else v13$2);
    v14$1 := (if p1$1 then $$a$1[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)] else v14$1);
    v14$2 := (if p1$2 then $$a$2[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)] else v14$2);
    v15$1 := (if p1$1 then $$b$1[BV32_MUL($i.2, 2bv32)] else v15$1);
    v15$2 := (if p1$2 then $$b$2[BV32_MUL($i.2, 2bv32)] else v15$2);
    v16$1 := (if p1$1 then $$b$1[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)] else v16$1);
    v16$2 := (if p1$2 then $$b$2[BV32_ADD(BV32_MUL($i.2, 2bv32), 1bv32)] else v16$2);
    v17$1 := (if p1$1 then FLT32(v16$1, v14$1) || FLT32(v14$1, v16$1) || FUNO32(v14$1, v16$1) else v17$1);
    v17$2 := (if p1$2 then FLT32(v16$2, v14$2) || FLT32(v14$2, v16$2) || FUNO32(v14$2, v16$2) else v17$2);
    p4$1 := (if p1$1 && v17$1 then v17$1 else p4$1);
    p4$2 := (if p1$2 && v17$2 then v17$2 else p4$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$fail(p4$1, 0bv32, 1bv32, $$fail[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$fail(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$fail(p4$2, 0bv32, 1bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$fail"} true;
    $$fail[0bv32] := (if p4$1 then 1bv32 else $$fail[0bv32]);
    $$fail[0bv32] := (if p4$2 then 1bv32 else $$fail[0bv32]);
    $i.2 := BV32_ADD($i.2, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  $truebb0:
    assume {:partition} v4 && v4;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    $$b$1[BV32_MUL($i.1, 2bv32)] := v5$1;
    $$b$2[BV32_MUL($i.1, 2bv32)] := v5$2;
    $$b$1[BV32_ADD(BV32_MUL($i.1, 2bv32), 1bv32)] := v6$1;
    $$b$2[BV32_ADD(BV32_MUL($i.1, 2bv32), 1bv32)] := v6$2;
    $i.1 := BV32_ADD($i.1, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v1 && v1;
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    $$a$1[BV32_MUL($i.0, 2bv32)] := v2$1;
    $$a$2[BV32_MUL($i.0, 2bv32)] := v2$2;
    $$a$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := v3$1;
    $$a$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := v3$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$work: bv32;

procedure {:inline 1} _LOG_READ_$$work(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$work;



implementation {:inline 1} _LOG_READ_$$work(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then true else _READ_HAS_OCCURRED_$$work);
    return;
}



procedure _CHECK_READ_$$work(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$work);
  requires {:source_name "work"} {:array "$$work"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$work: bool;

procedure {:inline 1} _LOG_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$work, _WRITE_READ_BENIGN_FLAG_$$work;



implementation {:inline 1} _LOG_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then true else _WRITE_HAS_OCCURRED_$$work);
    _WRITE_READ_BENIGN_FLAG_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$work);
    return;
}



procedure _CHECK_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work != _value);
  requires {:source_name "work"} {:array "$$work"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work != _value);
  requires {:source_name "work"} {:array "$$work"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$work(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$work;



implementation {:inline 1} _LOG_ATOMIC_$$work(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$work);
    return;
}



procedure _CHECK_ATOMIC_$$work(_P: bool, _offset: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);
  requires {:source_name "work"} {:array "$$work"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$work;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$work := (if _P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$work);
    return;
}



const _WATCHED_VALUE_$$fail: bv32;

procedure {:inline 1} _LOG_READ_$$fail(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$fail;



implementation {:inline 1} _LOG_READ_$$fail(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$fail := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$fail == _value then true else _READ_HAS_OCCURRED_$$fail);
    return;
}



procedure _CHECK_READ_$$fail(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$fail);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$fail: bool;

procedure {:inline 1} _LOG_WRITE_$$fail(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$fail, _WRITE_READ_BENIGN_FLAG_$$fail;



implementation {:inline 1} _LOG_WRITE_$$fail(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$fail := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$fail == _value then true else _WRITE_HAS_OCCURRED_$$fail);
    _WRITE_READ_BENIGN_FLAG_$$fail := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$fail == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$fail);
    return;
}



procedure _CHECK_WRITE_$$fail(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$fail != _value);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$fail != _value);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$fail(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$fail;



implementation {:inline 1} _LOG_ATOMIC_$$fail(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$fail := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$fail);
    return;
}



procedure _CHECK_ATOMIC_$$fail(_P: bool, _offset: bv32);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset);
  requires {:source_name "fail"} {:array "$$fail"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$fail(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$fail;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$fail(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$fail := (if _P && _WRITE_HAS_OCCURRED_$$fail && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$fail);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b5: bool;
