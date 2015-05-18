type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "sm_mappings"} {:global} $$sm_mappings: [bv32]bv8;

axiom {:array_info "$$sm_mappings"} {:global} {:elem_width 8} {:source_name "sm_mappings"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sm_mappings: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sm_mappings: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sm_mappings: bool;

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

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "histo_intermediates_kernel"} {:kernel} $histo_intermediates_kernel($height: bv32, $width: bv32, $input_pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 996bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$sm_mappings && !_WRITE_HAS_OCCURRED_$$sm_mappings && !_ATOMIC_HAS_OCCURRED_$$sm_mappings;
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
  modifies _WRITE_HAS_OCCURRED_$$sm_mappings, _WRITE_READ_BENIGN_FLAG_$$sm_mappings, _WRITE_READ_BENIGN_FLAG_$$sm_mappings;



implementation {:source_name "histo_intermediates_kernel"} {:kernel} $histo_intermediates_kernel($height: bv32, $width: bv32, $input_pitch: bv32)
{
  var $0$1: bv1;
  var $0$2: bv1;
  var $load_bin.0$1: bv32;
  var $load_bin.0$2: bv32;
  var $store.0$1: bv32;
  var $store.0$2: bv32;
  var $i.0: bv32;
  var v1: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v4: bool;
  var v3: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1 := group_size_x;
    v2$1 := BV32_MUL(16bv32, group_id_x$1);
    v2$2 := BV32_MUL(16bv32, group_id_x$2);
    v3 := BV32_UREM($width, 2bv32) != 0bv32;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    $0$1 := 0bv1;
    $0$2 := 0bv1;
    goto $2;

  $2:
    $load_bin.0$1, $store.0$1, $i.0 := BV32_ADD(BV32_MUL(BV32_MUL(v2$1, $input_pitch), 2bv32), BV32_MUL(v0$1, 2bv32)), BV32_ADD(BV32_MUL(v2$1, $width), v0$1), 0bv32;
    $load_bin.0$2, $store.0$2 := BV32_ADD(BV32_MUL(BV32_MUL(v2$2, $input_pitch), 2bv32), BV32_MUL(v0$2, 2bv32)), BV32_ADD(BV32_MUL(v2$2, $width), v0$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 4} true;
    v4 := BV32_SLT($i.0, 16bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    return;

  $truebb0:
    assume {:partition} v4 && v4;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$sm_mappings(true, BV32_MUL($store.0$1, 4bv32), BV32_UDIV(v5$1, 24576bv32)[8:0], $$sm_mappings[BV32_MUL($store.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(true, BV32_MUL($store.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$sm_mappings(true, BV32_MUL($store.0$2, 4bv32), BV32_UDIV(v5$2, 24576bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_MUL($store.0$1, 4bv32)] := BV32_UDIV(v5$1, 24576bv32)[8:0];
    $$sm_mappings[BV32_MUL($store.0$2, 4bv32)] := BV32_UDIV(v5$2, 24576bv32)[8:0];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$1, 4bv32), 1bv32), BV32_UREM(BV32_LSHR(v5$1, 10bv32), 24bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 1bv32), BV32_UREM(BV32_LSHR(v5$2, 10bv32), 24bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 1bv32)] := BV32_UREM(BV32_LSHR(v5$1, 10bv32), 24bv32)[8:0];
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$2, 4bv32), 1bv32)] := BV32_UREM(BV32_LSHR(v5$2, 10bv32), 24bv32)[8:0];
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$1, 4bv32), 2bv32), BV32_UREM(BV32_LSHR(v5$1, 2bv32), 256bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 2bv32), BV32_UREM(BV32_LSHR(v5$2, 2bv32), 256bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 2bv32)] := BV32_UREM(BV32_LSHR(v5$1, 2bv32), 256bv32)[8:0];
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$2, 4bv32), 2bv32)] := BV32_UREM(BV32_LSHR(v5$2, 2bv32), 256bv32)[8:0];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$1, 4bv32), 3bv32), BV32_MUL(BV8_ZEXT32(BV32_UREM(v5$1, 4bv32)[8:0]), 8bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$sm_mappings(true, BV32_ADD(BV32_MUL($store.0$2, 4bv32), 3bv32), BV32_MUL(BV8_ZEXT32(BV32_UREM(v5$2, 4bv32)[8:0]), 8bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$1, 4bv32), 3bv32)] := BV32_MUL(BV8_ZEXT32(BV32_UREM(v5$1, 4bv32)[8:0]), 8bv32)[8:0];
    $$sm_mappings[BV32_ADD(BV32_MUL($store.0$2, 4bv32), 3bv32)] := BV32_MUL(BV8_ZEXT32(BV32_UREM(v5$2, 4bv32)[8:0]), 8bv32)[8:0];
    p0$1 := (if !($0$1 == 1bv1) then !($0$1 == 1bv1) else p0$1);
    p0$2 := (if !($0$2 == 1bv1) then !($0$2 == 1bv1) else p0$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$sm_mappings(p0$1, BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), BV32_UDIV(v6$1, 24576bv32)[8:0], $$sm_mappings[BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(p0$2, BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$sm_mappings(p0$2, BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), BV32_UDIV(v6$2, 24576bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32)] := (if p0$1 then BV32_UDIV(v6$1, 24576bv32)[8:0] else $$sm_mappings[BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32)]);
    $$sm_mappings[BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32)] := (if p0$2 then BV32_UDIV(v6$2, 24576bv32)[8:0] else $$sm_mappings[BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$sm_mappings(p0$1, BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 1bv32), BV32_UREM(BV32_LSHR(v6$1, 10bv32), 24bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 1bv32), BV32_UREM(BV32_LSHR(v6$2, 10bv32), 24bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 1bv32)] := (if p0$1 then BV32_UREM(BV32_LSHR(v6$1, 10bv32), 24bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 1bv32)]);
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 1bv32)] := (if p0$2 then BV32_UREM(BV32_LSHR(v6$2, 10bv32), 24bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$sm_mappings(p0$1, BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 2bv32), BV32_UREM(BV32_LSHR(v6$1, 2bv32), 256bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 2bv32), BV32_UREM(BV32_LSHR(v6$2, 2bv32), 256bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 2bv32)] := (if p0$1 then BV32_UREM(BV32_LSHR(v6$1, 2bv32), 256bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 2bv32)]);
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 2bv32)] := (if p0$2 then BV32_UREM(BV32_LSHR(v6$2, 2bv32), 256bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$sm_mappings(p0$1, BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 3bv32), BV32_MUL(BV8_ZEXT32(BV32_UREM(v6$1, 4bv32)[8:0]), 8bv32)[8:0], $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$sm_mappings(p0$2, BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 3bv32), BV32_MUL(BV8_ZEXT32(BV32_UREM(v6$2, 4bv32)[8:0]), 8bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sm_mappings"} true;
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 3bv32)] := (if p0$1 then BV32_MUL(BV8_ZEXT32(BV32_UREM(v6$1, 4bv32)[8:0]), 8bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$1, v1), 4bv32), 3bv32)]);
    $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 3bv32)] := (if p0$2 then BV32_MUL(BV8_ZEXT32(BV32_UREM(v6$2, 4bv32)[8:0]), 8bv32)[8:0] else $$sm_mappings[BV32_ADD(BV32_MUL(BV32_ADD($store.0$2, v1), 4bv32), 3bv32)]);
    $load_bin.0$1, $store.0$1, $i.0 := BV32_ADD($load_bin.0$1, BV32_MUL($input_pitch, 2bv32)), BV32_ADD($store.0$1, $width), BV32_ADD($i.0, 1bv32);
    $load_bin.0$2, $store.0$2 := BV32_ADD($load_bin.0$2, BV32_MUL($input_pitch, 2bv32)), BV32_ADD($store.0$2, $width);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;

  $truebb:
    assume {:partition} v3 && v3;
    $0$1 := (if v0$1 == BV32_SUB(v1, 1bv32) then 1bv1 else 0bv1);
    $0$2 := (if v0$2 == BV32_SUB(v1, 1bv32) then 1bv1 else 0bv1);
    goto $2;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 498bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 65bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$input: bv32;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$sm_mappings: bv8;

procedure {:inline 1} _LOG_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$sm_mappings;



implementation {:inline 1} _LOG_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then true else _READ_HAS_OCCURRED_$$sm_mappings);
    return;
}



procedure _CHECK_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sm_mappings: bool;

procedure {:inline 1} _LOG_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$sm_mappings, _WRITE_READ_BENIGN_FLAG_$$sm_mappings;



implementation {:inline 1} _LOG_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then true else _WRITE_HAS_OCCURRED_$$sm_mappings);
    _WRITE_READ_BENIGN_FLAG_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
    return;
}



procedure _CHECK_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings != _value);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings != _value);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sm_mappings;



implementation {:inline 1} _LOG_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sm_mappings);
    return;
}



procedure _CHECK_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sm_mappings;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sm_mappings := (if _P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
