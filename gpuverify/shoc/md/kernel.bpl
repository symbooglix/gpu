type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "force"} {:global} $$force: [bv32]bv32;

axiom {:array_info "$$force"} {:global} {:elem_width 32} {:source_name "force"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$force: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$force: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$force: bool;

var {:source_name "position"} {:global} $$position: [bv32]bv32;

axiom {:array_info "$$position"} {:global} {:elem_width 32} {:source_name "position"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$position: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$position: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$position: bool;

var {:source_name "neighList"} {:global} $$neighList: [bv32]bv32;

axiom {:array_info "$$neighList"} {:global} {:elem_width 32} {:source_name "neighList"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$neighList: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$neighList: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$neighList: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "compute_lj_force"} {:kernel} $compute_lj_force($neighCount: bv32, $cutsq: bv32, $lj1: bv32, $lj2: bv32, $inum: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $neighCount == 128bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $inum == 12288bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$force && !_WRITE_HAS_OCCURRED_$$force && !_ATOMIC_HAS_OCCURRED_$$force;
  requires !_READ_HAS_OCCURRED_$$position && !_WRITE_HAS_OCCURRED_$$position && !_ATOMIC_HAS_OCCURRED_$$position;
  requires !_READ_HAS_OCCURRED_$$neighList && !_WRITE_HAS_OCCURRED_$$neighList && !_ATOMIC_HAS_OCCURRED_$$neighList;
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
  modifies _WRITE_HAS_OCCURRED_$$force, _WRITE_READ_BENIGN_FLAG_$$force, _WRITE_READ_BENIGN_FLAG_$$force;



implementation {:source_name "compute_lj_force"} {:kernel} $compute_lj_force($neighCount: bv32, $cutsq: bv32, $lj1: bv32, $lj2: bv32, $inum: bv32)
{
  var $f.0$1: bv128;
  var $f.0$2: bv128;
  var $j.0: bv32;
  var $f.1$1: bv128;
  var $f.1$2: bv128;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5: bool;
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
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := $$position[BV32_MUL(v0$1, 4bv32)];
    v1$2 := $$position[BV32_MUL(v0$2, 4bv32)];
    v2$1 := $$position[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v2$2 := $$position[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    v3$1 := $$position[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v3$2 := $$position[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    v4$1 := $$position[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v4$2 := $$position[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    $f.0$1, $j.0 := 0bv128, 0bv32;
    $f.0$2 := 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 7} true;
    v5 := BV32_SLT($j.0, $neighCount);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v5 && !v5;
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$force(true, BV32_MUL(v0$1, 4bv32), $f.0$1[32:0], $$force[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$force(true, BV32_MUL(v0$2, 4bv32), $f.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$force"} true;
    $$force[BV32_MUL(v0$1, 4bv32)] := $f.0$1[32:0];
    $$force[BV32_MUL(v0$2, 4bv32)] := $f.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), $f.0$1[64:32], $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), $f.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$force"} true;
    $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := $f.0$1[64:32];
    $$force[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := $f.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), $f.0$1[96:64], $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), $f.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$force"} true;
    $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := $f.0$1[96:64];
    $$force[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := $f.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), $f.0$1[128:96], $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$force(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), $f.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$force"} true;
    $$force[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := $f.0$1[128:96];
    $$force[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := $f.0$2[128:96];
    return;

  $truebb:
    assume {:partition} v5 && v5;
    v6$1 := $$neighList[BV32_ADD(BV32_MUL($j.0, $inum), v0$1)];
    v6$2 := $$neighList[BV32_ADD(BV32_MUL($j.0, $inum), v0$2)];
    v7$1 := $$position[BV32_MUL(v6$1, 4bv32)];
    v7$2 := $$position[BV32_MUL(v6$2, 4bv32)];
    v8$1 := $$position[BV32_ADD(BV32_MUL(v6$1, 4bv32), 1bv32)];
    v8$2 := $$position[BV32_ADD(BV32_MUL(v6$2, 4bv32), 1bv32)];
    v9$1 := $$position[BV32_ADD(BV32_MUL(v6$1, 4bv32), 2bv32)];
    v9$2 := $$position[BV32_ADD(BV32_MUL(v6$2, 4bv32), 2bv32)];
    v10$1 := $$position[BV32_ADD(BV32_MUL(v6$1, 4bv32), 3bv32)];
    v10$2 := $$position[BV32_ADD(BV32_MUL(v6$2, 4bv32), 3bv32)];
    v11$1 := FSUB32(v1$1, v7$1);
    v11$2 := FSUB32(v1$2, v7$2);
    v12$1 := FSUB32(v2$1, v8$1);
    v12$2 := FSUB32(v2$2, v8$2);
    v13$1 := FSUB32(v3$1, v9$1);
    v13$2 := FSUB32(v3$2, v9$2);
    v14$1 := FADD32(FMUL32(v13$1, v13$1), FADD32(FMUL32(v11$1, v11$1), FMUL32(v12$1, v12$1)));
    v14$2 := FADD32(FMUL32(v13$2, v13$2), FADD32(FMUL32(v11$2, v11$2), FMUL32(v12$2, v12$2)));
    v15$1 := FLT32(v14$1, $cutsq);
    v15$2 := FLT32(v14$2, $cutsq);
    p1$1 := (if v15$1 then v15$1 else p1$1);
    p1$2 := (if v15$2 then v15$2 else p1$2);
    p0$1 := (if !v15$1 then !v15$1 else p0$1);
    p0$2 := (if !v15$2 then !v15$2 else p0$2);
    $f.1$1 := (if p0$1 then $f.0$1 else $f.1$1);
    $f.1$2 := (if p0$2 then $f.0$2 else $f.1$2);
    v16$1 := (if p1$1 then FDIV32(1065353216bv32, v14$1) else v16$1);
    v16$2 := (if p1$2 then FDIV32(1065353216bv32, v14$2) else v16$2);
    v17$1 := (if p1$1 then FMUL32(FMUL32(v16$1, v16$1), v16$1) else v17$1);
    v17$2 := (if p1$2 then FMUL32(FMUL32(v16$2, v16$2), v16$2) else v17$2);
    v18$1 := (if p1$1 then FMUL32(FMUL32(v16$1, v17$1), FADD32(FMUL32($lj1, v17$1), FSUB32(2147483648bv32, $lj2))) else v18$1);
    v18$2 := (if p1$2 then FMUL32(FMUL32(v16$2, v17$2), FADD32(FMUL32($lj1, v17$2), FSUB32(2147483648bv32, $lj2))) else v18$2);
    v19$1 := (if p1$1 then $f.0$1[64:32] else v19$1);
    v19$2 := (if p1$2 then $f.0$2[64:32] else v19$2);
    v20$1 := (if p1$1 then $f.0$1[96:64] else v20$1);
    v20$2 := (if p1$2 then $f.0$2[96:64] else v20$2);
    $f.1$1 := (if p1$1 then $f.0$1[128:96] ++ FADD32(v20$1, FMUL32(v13$1, v18$1)) ++ FADD32(v19$1, FMUL32(v12$1, v18$1)) ++ FADD32($f.0$1[32:0], FMUL32(v11$1, v18$1)) else $f.1$1);
    $f.1$2 := (if p1$2 then $f.0$2[128:96] ++ FADD32(v20$2, FMUL32(v13$2, v18$2)) ++ FADD32(v19$2, FMUL32(v12$2, v18$2)) ++ FADD32($f.0$2[32:0], FMUL32(v11$2, v18$2)) else $f.1$2);
    $f.0$1, $j.0 := $f.1$1, BV32_ADD($j.0, 1bv32);
    $f.0$2 := $f.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 96bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$force: bv32;

procedure {:inline 1} _LOG_READ_$$force(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$force;



implementation {:inline 1} _LOG_READ_$$force(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$force := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$force == _value then true else _READ_HAS_OCCURRED_$$force);
    return;
}



procedure _CHECK_READ_$$force(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "force"} {:array "$$force"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$force);
  requires {:source_name "force"} {:array "$$force"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$force: bool;

procedure {:inline 1} _LOG_WRITE_$$force(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$force, _WRITE_READ_BENIGN_FLAG_$$force;



implementation {:inline 1} _LOG_WRITE_$$force(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$force := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$force == _value then true else _WRITE_HAS_OCCURRED_$$force);
    _WRITE_READ_BENIGN_FLAG_$$force := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$force == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$force);
    return;
}



procedure _CHECK_WRITE_$$force(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "force"} {:array "$$force"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$force != _value);
  requires {:source_name "force"} {:array "$$force"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$force != _value);
  requires {:source_name "force"} {:array "$$force"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$force(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$force;



implementation {:inline 1} _LOG_ATOMIC_$$force(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$force := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$force);
    return;
}



procedure _CHECK_ATOMIC_$$force(_P: bool, _offset: bv32);
  requires {:source_name "force"} {:array "$$force"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset);
  requires {:source_name "force"} {:array "$$force"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$force;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$force(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$force := (if _P && _WRITE_HAS_OCCURRED_$$force && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$force);
    return;
}



const _WATCHED_VALUE_$$position: bv32;

procedure {:inline 1} _LOG_READ_$$position(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$position;



implementation {:inline 1} _LOG_READ_$$position(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$position := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$position == _value then true else _READ_HAS_OCCURRED_$$position);
    return;
}



procedure _CHECK_READ_$$position(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "position"} {:array "$$position"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$position);
  requires {:source_name "position"} {:array "$$position"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$position: bool;

procedure {:inline 1} _LOG_WRITE_$$position(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$position, _WRITE_READ_BENIGN_FLAG_$$position;



implementation {:inline 1} _LOG_WRITE_$$position(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$position := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$position == _value then true else _WRITE_HAS_OCCURRED_$$position);
    _WRITE_READ_BENIGN_FLAG_$$position := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$position == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$position);
    return;
}



procedure _CHECK_WRITE_$$position(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "position"} {:array "$$position"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$position != _value);
  requires {:source_name "position"} {:array "$$position"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$position != _value);
  requires {:source_name "position"} {:array "$$position"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$position(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$position;



implementation {:inline 1} _LOG_ATOMIC_$$position(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$position := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$position);
    return;
}



procedure _CHECK_ATOMIC_$$position(_P: bool, _offset: bv32);
  requires {:source_name "position"} {:array "$$position"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset);
  requires {:source_name "position"} {:array "$$position"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$position(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$position;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$position(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$position := (if _P && _WRITE_HAS_OCCURRED_$$position && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$position);
    return;
}



const _WATCHED_VALUE_$$neighList: bv32;

procedure {:inline 1} _LOG_READ_$$neighList(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$neighList;



implementation {:inline 1} _LOG_READ_$$neighList(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$neighList := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$neighList == _value then true else _READ_HAS_OCCURRED_$$neighList);
    return;
}



procedure _CHECK_READ_$$neighList(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$neighList);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$neighList: bool;

procedure {:inline 1} _LOG_WRITE_$$neighList(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$neighList, _WRITE_READ_BENIGN_FLAG_$$neighList;



implementation {:inline 1} _LOG_WRITE_$$neighList(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$neighList := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$neighList == _value then true else _WRITE_HAS_OCCURRED_$$neighList);
    _WRITE_READ_BENIGN_FLAG_$$neighList := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$neighList == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$neighList);
    return;
}



procedure _CHECK_WRITE_$$neighList(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$neighList != _value);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$neighList != _value);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$neighList(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$neighList;



implementation {:inline 1} _LOG_ATOMIC_$$neighList(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$neighList := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$neighList);
    return;
}



procedure _CHECK_ATOMIC_$$neighList(_P: bool, _offset: bv32);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset);
  requires {:source_name "neighList"} {:array "$$neighList"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$neighList(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$neighList;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$neighList(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$neighList := (if _P && _WRITE_HAS_OCCURRED_$$neighList && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$neighList);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
