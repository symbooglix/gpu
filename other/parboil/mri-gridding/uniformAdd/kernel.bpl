type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "dataBase"} {:global} $$dataBase: [bv32]bv32;

axiom {:array_info "$$dataBase"} {:global} {:elem_width 32} {:source_name "dataBase"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dataBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dataBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dataBase: bool;

axiom {:array_info "$$interBase"} {:global} {:elem_width 32} {:source_name "interBase"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$interBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$interBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$interBase: bool;

var {:source_name "uni"} {:group_shared} $$uniformAdd.uni: [bv1][bv32]bv32;

axiom {:array_info "$$uniformAdd.uni"} {:group_shared} {:elem_width 32} {:source_name "uni"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$uniformAdd.uni: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$uniformAdd.uni: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni: bool;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "uniformAdd"} {:kernel} $uniformAdd($n: bv32, $data_offset: bv32, $inter_offset: bv32);
  requires !_READ_HAS_OCCURRED_$$dataBase && !_WRITE_HAS_OCCURRED_$$dataBase && !_ATOMIC_HAS_OCCURRED_$$dataBase;
  requires !_READ_HAS_OCCURRED_$$interBase && !_WRITE_HAS_OCCURRED_$$interBase && !_ATOMIC_HAS_OCCURRED_$$interBase;
  requires !_READ_HAS_OCCURRED_$$uniformAdd.uni && !_WRITE_HAS_OCCURRED_$$uniformAdd.uni && !_ATOMIC_HAS_OCCURRED_$$uniformAdd.uni;
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
  modifies $$uniformAdd.uni, _WRITE_HAS_OCCURRED_$$uniformAdd.uni, _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni, _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni, $$dataBase, _TRACKING, _READ_HAS_OCCURRED_$$uniformAdd.uni, _READ_HAS_OCCURRED_$$dataBase, _WRITE_HAS_OCCURRED_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase;



implementation {:source_name "uniformAdd"} {:kernel} $uniformAdd($n: bv32, $data_offset: bv32, $inter_offset: bv32)
{
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := local_id_x$1 == 0bv32;
    v0$2 := local_id_x$2 == 0bv32;
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
    p0$1 := (if v0$1 then v0$1 else p0$1);
    p0$2 := (if v0$2 then v0$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v1$1 := (if p0$1 then _HAVOC_bv32$1 else v1$1);
    v1$2 := (if p0$2 then _HAVOC_bv32$2 else v1$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$uniformAdd.uni(p0$1, 0bv32, v1$1, $$uniformAdd.uni[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$uniformAdd.uni(p0$2, 0bv32, v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$uniformAdd.uni"} true;
    $$uniformAdd.uni[1bv1][0bv32] := (if p0$1 then v1$1 else $$uniformAdd.uni[1bv1][0bv32]);
    $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v1$2 else $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 5} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v2$1 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$1, 2bv32), group_size_x), local_id_x$1);
    v2$2 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$2, 2bv32), group_size_x), local_id_x$2);
    v3$1 := BV32_ADD(v2$1, group_size_x);
    v3$2 := BV32_ADD(v2$2, group_size_x);
    v4$1 := BV32_ULT(v2$1, $n);
    v4$2 := BV32_ULT(v2$2, $n);
    p2$1 := (if v4$1 then v4$1 else p2$1);
    p2$2 := (if v4$2 then v4$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$uniformAdd.uni(p2$1, 0bv32, $$uniformAdd.uni[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$uniformAdd.uni(p2$2, 0bv32, $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$uniformAdd.uni"} true;
    v5$1 := (if p2$1 then $$uniformAdd.uni[1bv1][0bv32] else v5$1);
    v5$2 := (if p2$2 then $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v5$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$dataBase(p2$1, BV32_ADD($data_offset, v2$1), $$dataBase[BV32_ADD($data_offset, v2$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$dataBase(p2$2, BV32_ADD($data_offset, v2$2), $$dataBase[BV32_ADD($data_offset, v2$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$dataBase"} true;
    v6$1 := (if p2$1 then $$dataBase[BV32_ADD($data_offset, v2$1)] else v6$1);
    v6$2 := (if p2$2 then $$dataBase[BV32_ADD($data_offset, v2$2)] else v6$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$dataBase(p2$1, BV32_ADD($data_offset, v2$1), BV32_ADD(v6$1, v5$1), $$dataBase[BV32_ADD($data_offset, v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(p2$2, BV32_ADD($data_offset, v2$2));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$dataBase(p2$2, BV32_ADD($data_offset, v2$2), BV32_ADD(v6$2, v5$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dataBase"} true;
    $$dataBase[BV32_ADD($data_offset, v2$1)] := (if p2$1 then BV32_ADD(v6$1, v5$1) else $$dataBase[BV32_ADD($data_offset, v2$1)]);
    $$dataBase[BV32_ADD($data_offset, v2$2)] := (if p2$2 then BV32_ADD(v6$2, v5$2) else $$dataBase[BV32_ADD($data_offset, v2$2)]);
    v7$1 := BV32_ULT(v3$1, $n);
    v7$2 := BV32_ULT(v3$2, $n);
    p4$1 := (if v7$1 then v7$1 else p4$1);
    p4$2 := (if v7$2 then v7$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$uniformAdd.uni(p4$1, 0bv32, $$uniformAdd.uni[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$uniformAdd.uni(p4$2, 0bv32, $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$uniformAdd.uni"} true;
    v8$1 := (if p4$1 then $$uniformAdd.uni[1bv1][0bv32] else v8$1);
    v8$2 := (if p4$2 then $$uniformAdd.uni[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v8$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$dataBase(p4$1, BV32_ADD($data_offset, v3$1), $$dataBase[BV32_ADD($data_offset, v3$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$dataBase(p4$2, BV32_ADD($data_offset, v3$2), $$dataBase[BV32_ADD($data_offset, v3$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$dataBase"} true;
    v9$1 := (if p4$1 then $$dataBase[BV32_ADD($data_offset, v3$1)] else v9$1);
    v9$2 := (if p4$2 then $$dataBase[BV32_ADD($data_offset, v3$2)] else v9$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$dataBase(p4$1, BV32_ADD($data_offset, v3$1), BV32_ADD(v9$1, v8$1), $$dataBase[BV32_ADD($data_offset, v3$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(p4$2, BV32_ADD($data_offset, v3$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$dataBase(p4$2, BV32_ADD($data_offset, v3$2), BV32_ADD(v9$2, v8$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dataBase"} true;
    $$dataBase[BV32_ADD($data_offset, v3$1)] := (if p4$1 then BV32_ADD(v9$1, v8$1) else $$dataBase[BV32_ADD($data_offset, v3$1)]);
    $$dataBase[BV32_ADD($data_offset, v3$2)] := (if p4$2 then BV32_ADD(v9$2, v8$2) else $$dataBase[BV32_ADD($data_offset, v3$2)]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16385bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$uniformAdd.uni, $$dataBase, _TRACKING;



const _WATCHED_VALUE_$$dataBase: bv32;

procedure {:inline 1} _LOG_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dataBase;



implementation {:inline 1} _LOG_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then true else _READ_HAS_OCCURRED_$$dataBase);
    return;
}



procedure _CHECK_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dataBase);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dataBase: bool;

procedure {:inline 1} _LOG_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase;



implementation {:inline 1} _LOG_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then true else _WRITE_HAS_OCCURRED_$$dataBase);
    _WRITE_READ_BENIGN_FLAG_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dataBase);
    return;
}



procedure _CHECK_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase != _value);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase != _value);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dataBase(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dataBase;



implementation {:inline 1} _LOG_ATOMIC_$$dataBase(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dataBase);
    return;
}



procedure _CHECK_ATOMIC_$$dataBase(_P: bool, _offset: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dataBase;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dataBase := (if _P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dataBase);
    return;
}



const _WATCHED_VALUE_$$interBase: bv32;

procedure {:inline 1} _LOG_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$interBase;



implementation {:inline 1} _LOG_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then true else _READ_HAS_OCCURRED_$$interBase);
    return;
}



procedure _CHECK_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$interBase);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$interBase: bool;

procedure {:inline 1} _LOG_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$interBase, _WRITE_READ_BENIGN_FLAG_$$interBase;



implementation {:inline 1} _LOG_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then true else _WRITE_HAS_OCCURRED_$$interBase);
    _WRITE_READ_BENIGN_FLAG_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$interBase);
    return;
}



procedure _CHECK_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase != _value);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase != _value);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$interBase(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$interBase;



implementation {:inline 1} _LOG_ATOMIC_$$interBase(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$interBase);
    return;
}



procedure _CHECK_ATOMIC_$$interBase(_P: bool, _offset: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$interBase(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$interBase;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$interBase(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$interBase := (if _P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$interBase);
    return;
}



const _WATCHED_VALUE_$$uniformAdd.uni: bv32;

procedure {:inline 1} _LOG_READ_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$uniformAdd.uni;



implementation {:inline 1} _LOG_READ_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$uniformAdd.uni := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$uniformAdd.uni == _value then true else _READ_HAS_OCCURRED_$$uniformAdd.uni);
    return;
}



procedure _CHECK_READ_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni: bool;

procedure {:inline 1} _LOG_WRITE_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$uniformAdd.uni, _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni;



implementation {:inline 1} _LOG_WRITE_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$uniformAdd.uni := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$uniformAdd.uni == _value then true else _WRITE_HAS_OCCURRED_$$uniformAdd.uni);
    _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$uniformAdd.uni == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni);
    return;
}



procedure _CHECK_WRITE_$$uniformAdd.uni(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$uniformAdd.uni != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$uniformAdd.uni != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$uniformAdd.uni(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni;



implementation {:inline 1} _LOG_ATOMIC_$$uniformAdd.uni(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$uniformAdd.uni);
    return;
}



procedure _CHECK_ATOMIC_$$uniformAdd.uni(_P: bool, _offset: bv32);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "uni"} {:array "$$uniformAdd.uni"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni := (if _P && _WRITE_HAS_OCCURRED_$$uniformAdd.uni && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$uniformAdd.uni);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$uniformAdd.uni;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$uniformAdd.uni;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$uniformAdd.uni;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dataBase;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$dataBase;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$uniformAdd.uni;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
