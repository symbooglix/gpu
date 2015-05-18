type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "energygrid"} {:global} $$energygrid: [bv32]bv32;

axiom {:array_info "$$energygrid"} {:global} {:elem_width 32} {:source_name "energygrid"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$energygrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$energygrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$energygrid: bool;

var {:source_name "atominfo"} {:constant} $$atominfo$1: [bv32]bv32;

var {:source_name "atominfo"} {:constant} $$atominfo$2: [bv32]bv32;

axiom {:array_info "$$atominfo"} {:constant} {:elem_width 32} {:source_name "atominfo"} {:source_elem_width 128} {:source_dimensions "1"} true;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "cenergy"} {:kernel} $_Z7cenergyifPf($numatoms: bv32, $gridspacing: bv32);
  requires !_READ_HAS_OCCURRED_$$energygrid && !_WRITE_HAS_OCCURRED_$$energygrid && !_ATOMIC_HAS_OCCURRED_$$energygrid;
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
  modifies _READ_HAS_OCCURRED_$$energygrid, _WRITE_HAS_OCCURRED_$$energygrid, _WRITE_READ_BENIGN_FLAG_$$energygrid, _WRITE_READ_BENIGN_FLAG_$$energygrid;



implementation {:source_name "cenergy"} {:kernel} $_Z7cenergyifPf($numatoms: bv32, $gridspacing: bv32)
{
  var $energyvalx1.0$1: bv32;
  var $energyvalx1.0$2: bv32;
  var $energyvalx2.0$1: bv32;
  var $energyvalx2.0$2: bv32;
  var $atomid.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$1, group_size_x), 2bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$2, group_size_x), 2bv32), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(BV32_MUL(BV32_MUL(num_groups_x, group_size_x), 2bv32), v1$1), v0$1);
    v2$2 := BV32_ADD(BV32_MUL(BV32_MUL(BV32_MUL(num_groups_x, group_size_x), 2bv32), v1$2), v0$2);
    $energyvalx1.0$1, $energyvalx2.0$1, $atomid.0 := 0bv32, 0bv32, 0bv32;
    $energyvalx1.0$2, $energyvalx2.0$2 := 0bv32, 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v3 := BV32_SLT($atomid.0, $numatoms);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$energygrid(true, v2$1, $$energygrid[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$energygrid(true, v2$2, $$energygrid[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$energygrid"} true;
    v13$1 := $$energygrid[v2$1];
    v13$2 := $$energygrid[v2$2];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$energygrid(true, v2$1, FADD32(v13$1, $energyvalx1.0$1), $$energygrid[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$energygrid(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$energygrid(true, v2$2, FADD32(v13$2, $energyvalx1.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$energygrid"} true;
    $$energygrid[v2$1] := FADD32(v13$1, $energyvalx1.0$1);
    $$energygrid[v2$2] := FADD32(v13$2, $energyvalx1.0$2);
    v14$1 := BV32_ADD(v2$1, 16bv32);
    v14$2 := BV32_ADD(v2$2, 16bv32);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$energygrid(true, v14$1, $$energygrid[v14$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$energygrid(true, v14$2, $$energygrid[v14$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$energygrid"} true;
    v15$1 := $$energygrid[v14$1];
    v15$2 := $$energygrid[v14$2];
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$energygrid(true, v14$1, FADD32(v15$1, $energyvalx2.0$1), $$energygrid[v14$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$energygrid(true, v14$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$energygrid(true, v14$2, FADD32(v15$2, $energyvalx2.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$energygrid"} true;
    $$energygrid[v14$1] := FADD32(v15$1, $energyvalx2.0$1);
    $$energygrid[v14$2] := FADD32(v15$2, $energyvalx2.0$2);
    return;

  $truebb:
    assume {:partition} v3 && v3;
    v4$1 := $$atominfo$1[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 1bv32)];
    v4$2 := $$atominfo$2[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 1bv32)];
    v5$1 := FSUB32(FMUL32($gridspacing, UI32_TO_FP32(v1$1)), v4$1);
    v5$2 := FSUB32(FMUL32($gridspacing, UI32_TO_FP32(v1$2)), v4$2);
    v6$1 := $$atominfo$1[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 2bv32)];
    v6$2 := $$atominfo$2[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 2bv32)];
    v7$1 := FADD32(FMUL32(v5$1, v5$1), v6$1);
    v7$2 := FADD32(FMUL32(v5$2, v5$2), v6$2);
    v8$1 := $$atominfo$1[BV32_MUL($atomid.0, 4bv32)];
    v8$2 := $$atominfo$2[BV32_MUL($atomid.0, 4bv32)];
    v9$1 := FSUB32(FMUL32($gridspacing, UI32_TO_FP32(v0$1)), v8$1);
    v9$2 := FSUB32(FMUL32($gridspacing, UI32_TO_FP32(v0$2)), v8$2);
    v10$1 := FADD32(v9$1, FMUL32($gridspacing, 1098907648bv32));
    v10$2 := FADD32(v9$2, FMUL32($gridspacing, 1098907648bv32));
    v11$1 := $$atominfo$1[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 3bv32)];
    v11$2 := $$atominfo$2[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 3bv32)];
    v12$1 := $$atominfo$1[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 3bv32)];
    v12$2 := $$atominfo$2[BV32_ADD(BV32_MUL($atomid.0, 4bv32), 3bv32)];
    $energyvalx1.0$1, $energyvalx2.0$1, $atomid.0 := FADD32($energyvalx1.0$1, FMUL32(v11$1, FDIV32(1065353216bv32, FSQRT32(FADD32(FMUL32(v9$1, v9$1), v7$1))))), FADD32($energyvalx2.0$1, FMUL32(v12$1, FDIV32(1065353216bv32, FSQRT32(FADD32(FMUL32(v10$1, v10$1), v7$1))))), BV32_ADD($atomid.0, 1bv32);
    $energyvalx1.0$2, $energyvalx2.0$2 := FADD32($energyvalx1.0$2, FMUL32(v11$2, FDIV32(1065353216bv32, FSQRT32(FADD32(FMUL32(v9$2, v9$2), v7$2))))), FADD32($energyvalx2.0$2, FMUL32(v12$2, FDIV32(1065353216bv32, FSQRT32(FADD32(FMUL32(v10$2, v10$2), v7$2)))));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$energygrid: bv32;

procedure {:inline 1} _LOG_READ_$$energygrid(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$energygrid;



implementation {:inline 1} _LOG_READ_$$energygrid(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$energygrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$energygrid == _value then true else _READ_HAS_OCCURRED_$$energygrid);
    return;
}



procedure _CHECK_READ_$$energygrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$energygrid);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$energygrid: bool;

procedure {:inline 1} _LOG_WRITE_$$energygrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$energygrid, _WRITE_READ_BENIGN_FLAG_$$energygrid;



implementation {:inline 1} _LOG_WRITE_$$energygrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$energygrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$energygrid == _value then true else _WRITE_HAS_OCCURRED_$$energygrid);
    _WRITE_READ_BENIGN_FLAG_$$energygrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$energygrid == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$energygrid);
    return;
}



procedure _CHECK_WRITE_$$energygrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$energygrid != _value);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$energygrid != _value);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$energygrid(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$energygrid;



implementation {:inline 1} _LOG_ATOMIC_$$energygrid(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$energygrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$energygrid);
    return;
}



procedure _CHECK_ATOMIC_$$energygrid(_P: bool, _offset: bv32);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset);
  requires {:source_name "energygrid"} {:array "$$energygrid"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$energygrid(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$energygrid;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$energygrid(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$energygrid := (if _P && _WRITE_HAS_OCCURRED_$$energygrid && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$energygrid);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
