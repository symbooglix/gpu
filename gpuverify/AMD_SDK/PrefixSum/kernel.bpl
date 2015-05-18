type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "block"} {:group_shared} $$block: [bv1][bv32]bv32;

axiom {:array_info "$$block"} {:group_shared} {:elem_width 32} {:source_name "block"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$block: bool;

const _WATCHED_OFFSET: bv32;

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

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "prefixSum"} {:kernel} $prefixSum($length: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $length == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$block && !_WRITE_HAS_OCCURRED_$$block && !_ATOMIC_HAS_OCCURRED_$$block;
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
  modifies $$block, _WRITE_HAS_OCCURRED_$$block, _WRITE_READ_BENIGN_FLAG_$$block, _WRITE_READ_BENIGN_FLAG_$$block, $$output, _TRACKING, _READ_HAS_OCCURRED_$$block, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _TRACKING, _TRACKING;



implementation {:source_name "prefixSum"} {:kernel} $prefixSum($length: bv32)
{
  var $offset.0: bv32;
  var $d.0: bv32;
  var $offset.1: bv32;
  var $d1.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bool;
  var v8$2: bool;
  var v9: bool;
  var v10: bv32;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
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


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    havoc v1$1, v1$2;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$block(true, BV32_MUL(2bv32, v0$1), v1$1, $$block[1bv1][BV32_MUL(2bv32, v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_MUL(2bv32, v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$block(true, BV32_MUL(2bv32, v0$2), v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_MUL(2bv32, v0$1)] := v1$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(2bv32, v0$2)] := v1$2;
    havoc v2$1, v2$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$block(true, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32), v2$1, $$block[1bv1][BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$block(true, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)] := v2$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)] := v2$2;
    $offset.0, $d.0 := 1bv32, BV32_LSHR($length, 1bv32);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b47 ==> _WRITE_HAS_OCCURRED_$$block ==> local_id_x$1 == BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $offset.0), 2bv32);
    assert {:tag "nowrite"} _b46 ==> !_WRITE_HAS_OCCURRED_$$block;
    assert {:tag "noread"} _b45 ==> !_READ_HAS_OCCURRED_$$block;
    assert {:tag "relationalPow2"} _b44 ==> ($d.0 == 0bv32 && $offset.0 == 2bv32) || BV32_MUL($offset.0, $d.0) == 1bv32;
    assert {:tag "relationalPow2"} _b43 ==> BV32_MUL($offset.0, $d.0) == 1bv32;
    assert {:tag "relationalPow2"} _b42 ==> ($d.0 == 0bv32 && $offset.0 == 4bv32) || BV32_MUL($offset.0, $d.0) == 2bv32;
    assert {:tag "relationalPow2"} _b41 ==> BV32_MUL($offset.0, $d.0) == 2bv32;
    assert {:tag "relationalPow2"} _b40 ==> ($d.0 == 0bv32 && $offset.0 == 8bv32) || BV32_MUL($offset.0, $d.0) == 4bv32;
    assert {:tag "relationalPow2"} _b39 ==> BV32_MUL($offset.0, $d.0) == 4bv32;
    assert {:tag "relationalPow2"} _b38 ==> ($d.0 == 0bv32 && $offset.0 == 16bv32) || BV32_MUL($offset.0, $d.0) == 8bv32;
    assert {:tag "relationalPow2"} _b37 ==> BV32_MUL($offset.0, $d.0) == 8bv32;
    assert {:tag "relationalPow2"} _b36 ==> ($d.0 == 0bv32 && $offset.0 == 32bv32) || BV32_MUL($offset.0, $d.0) == 16bv32;
    assert {:tag "relationalPow2"} _b35 ==> BV32_MUL($offset.0, $d.0) == 16bv32;
    assert {:tag "relationalPow2"} _b34 ==> ($d.0 == 0bv32 && $offset.0 == 64bv32) || BV32_MUL($offset.0, $d.0) == 32bv32;
    assert {:tag "relationalPow2"} _b33 ==> BV32_MUL($offset.0, $d.0) == 32bv32;
    assert {:tag "relationalPow2"} _b32 ==> ($d.0 == 0bv32 && $offset.0 == 128bv32) || BV32_MUL($offset.0, $d.0) == 64bv32;
    assert {:tag "relationalPow2"} _b31 ==> BV32_MUL($offset.0, $d.0) == 64bv32;
    assert {:tag "relationalPow2"} _b30 ==> ($d.0 == 0bv32 && $offset.0 == 256bv32) || BV32_MUL($offset.0, $d.0) == 128bv32;
    assert {:tag "relationalPow2"} _b29 ==> BV32_MUL($offset.0, $d.0) == 128bv32;
    assert {:tag "relationalPow2"} _b28 ==> ($d.0 == 0bv32 && $offset.0 == 512bv32) || BV32_MUL($offset.0, $d.0) == 256bv32;
    assert {:tag "relationalPow2"} _b27 ==> BV32_MUL($offset.0, $d.0) == 256bv32;
    assert {:tag "relationalPow2"} _b26 ==> ($d.0 == 0bv32 && $offset.0 == 1024bv32) || BV32_MUL($offset.0, $d.0) == 512bv32;
    assert {:tag "relationalPow2"} _b25 ==> BV32_MUL($offset.0, $d.0) == 512bv32;
    assert {:tag "relationalPow2"} _b24 ==> ($d.0 == 0bv32 && $offset.0 == 2048bv32) || BV32_MUL($offset.0, $d.0) == 1024bv32;
    assert {:tag "relationalPow2"} _b23 ==> BV32_MUL($offset.0, $d.0) == 1024bv32;
    assert {:tag "relationalPow2"} _b22 ==> ($d.0 == 0bv32 && $offset.0 == 4096bv32) || BV32_MUL($offset.0, $d.0) == 2048bv32;
    assert {:tag "relationalPow2"} _b21 ==> BV32_MUL($offset.0, $d.0) == 2048bv32;
    assert {:tag "relationalPow2"} _b20 ==> ($d.0 == 0bv32 && $offset.0 == 8192bv32) || BV32_MUL($offset.0, $d.0) == 4096bv32;
    assert {:tag "relationalPow2"} _b19 ==> BV32_MUL($offset.0, $d.0) == 4096bv32;
    assert {:tag "relationalPow2"} _b18 ==> ($d.0 == 0bv32 && $offset.0 == 16384bv32) || BV32_MUL($offset.0, $d.0) == 8192bv32;
    assert {:tag "relationalPow2"} _b17 ==> BV32_MUL($offset.0, $d.0) == 8192bv32;
    assert {:tag "relationalPow2"} _b16 ==> ($d.0 == 0bv32 && $offset.0 == 32768bv32) || BV32_MUL($offset.0, $d.0) == 16384bv32;
    assert {:tag "relationalPow2"} _b15 ==> BV32_MUL($offset.0, $d.0) == 16384bv32;
    assert {:tag "relationalPow2"} _b14 ==> ($d.0 == 0bv32 && $offset.0 == 65536bv32) || BV32_MUL($offset.0, $d.0) == 32768bv32;
    assert {:tag "relationalPow2"} _b13 ==> BV32_MUL($offset.0, $d.0) == 32768bv32;
    assert {:tag "pow2NotZero"} _b12 ==> $d.0 != 0bv32;
    assert {:tag "pow2"} _b11 ==> $d.0 == 0bv32 || BV32_AND($d.0, BV32_SUB($d.0, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b10 ==> $offset.0 != 0bv32;
    assert {:tag "pow2"} _b9 ==> $offset.0 == 0bv32 || BV32_AND($offset.0, BV32_SUB($offset.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($d.0, BV32_LSHR($length, 1bv32));
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $d.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $d.0);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v3 := BV32_SGT($d.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    v8$1 := v0$1 == 0bv32;
    v8$2 := v0$2 == 0bv32;
    p2$1 := (if v8$1 then v8$1 else p2$1);
    p2$2 := (if v8$2 then v8$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$block(p2$1, BV32_SUB($length, 1bv32), 0bv32, $$block[1bv1][BV32_SUB($length, 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(p2$2, BV32_SUB($length, 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$block(p2$2, BV32_SUB($length, 1bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_SUB($length, 1bv32)] := (if p2$1 then 0bv32 else $$block[1bv1][BV32_SUB($length, 1bv32)]);
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB($length, 1bv32)] := (if p2$2 then 0bv32 else $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB($length, 1bv32)]);
    $offset.1, $d1.0 := $offset.0, 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "nowrite"} _b87 ==> !_WRITE_HAS_OCCURRED_$$block;
    assert {:tag "noread"} _b86 ==> !_READ_HAS_OCCURRED_$$block;
    assert {:tag "relationalPow2"} _b85 ==> ($offset.1 == 0bv32 && $d1.0 == 2bv32) || BV32_MUL($d1.0, $offset.1) == 1bv32;
    assert {:tag "relationalPow2"} _b84 ==> BV32_MUL($d1.0, $offset.1) == 1bv32;
    assert {:tag "relationalPow2"} _b83 ==> ($offset.1 == 0bv32 && $d1.0 == 4bv32) || BV32_MUL($d1.0, $offset.1) == 2bv32;
    assert {:tag "relationalPow2"} _b82 ==> BV32_MUL($d1.0, $offset.1) == 2bv32;
    assert {:tag "relationalPow2"} _b81 ==> ($offset.1 == 0bv32 && $d1.0 == 8bv32) || BV32_MUL($d1.0, $offset.1) == 4bv32;
    assert {:tag "relationalPow2"} _b80 ==> BV32_MUL($d1.0, $offset.1) == 4bv32;
    assert {:tag "relationalPow2"} _b79 ==> ($offset.1 == 0bv32 && $d1.0 == 16bv32) || BV32_MUL($d1.0, $offset.1) == 8bv32;
    assert {:tag "relationalPow2"} _b78 ==> BV32_MUL($d1.0, $offset.1) == 8bv32;
    assert {:tag "relationalPow2"} _b77 ==> ($offset.1 == 0bv32 && $d1.0 == 32bv32) || BV32_MUL($d1.0, $offset.1) == 16bv32;
    assert {:tag "relationalPow2"} _b76 ==> BV32_MUL($d1.0, $offset.1) == 16bv32;
    assert {:tag "relationalPow2"} _b75 ==> ($offset.1 == 0bv32 && $d1.0 == 64bv32) || BV32_MUL($d1.0, $offset.1) == 32bv32;
    assert {:tag "relationalPow2"} _b74 ==> BV32_MUL($d1.0, $offset.1) == 32bv32;
    assert {:tag "relationalPow2"} _b73 ==> ($offset.1 == 0bv32 && $d1.0 == 128bv32) || BV32_MUL($d1.0, $offset.1) == 64bv32;
    assert {:tag "relationalPow2"} _b72 ==> BV32_MUL($d1.0, $offset.1) == 64bv32;
    assert {:tag "relationalPow2"} _b71 ==> ($offset.1 == 0bv32 && $d1.0 == 256bv32) || BV32_MUL($d1.0, $offset.1) == 128bv32;
    assert {:tag "relationalPow2"} _b70 ==> BV32_MUL($d1.0, $offset.1) == 128bv32;
    assert {:tag "relationalPow2"} _b69 ==> ($offset.1 == 0bv32 && $d1.0 == 512bv32) || BV32_MUL($d1.0, $offset.1) == 256bv32;
    assert {:tag "relationalPow2"} _b68 ==> BV32_MUL($d1.0, $offset.1) == 256bv32;
    assert {:tag "relationalPow2"} _b67 ==> ($offset.1 == 0bv32 && $d1.0 == 1024bv32) || BV32_MUL($d1.0, $offset.1) == 512bv32;
    assert {:tag "relationalPow2"} _b66 ==> BV32_MUL($d1.0, $offset.1) == 512bv32;
    assert {:tag "relationalPow2"} _b65 ==> ($offset.1 == 0bv32 && $d1.0 == 2048bv32) || BV32_MUL($d1.0, $offset.1) == 1024bv32;
    assert {:tag "relationalPow2"} _b64 ==> BV32_MUL($d1.0, $offset.1) == 1024bv32;
    assert {:tag "relationalPow2"} _b63 ==> ($offset.1 == 0bv32 && $d1.0 == 4096bv32) || BV32_MUL($d1.0, $offset.1) == 2048bv32;
    assert {:tag "relationalPow2"} _b62 ==> BV32_MUL($d1.0, $offset.1) == 2048bv32;
    assert {:tag "relationalPow2"} _b61 ==> ($offset.1 == 0bv32 && $d1.0 == 8192bv32) || BV32_MUL($d1.0, $offset.1) == 4096bv32;
    assert {:tag "relationalPow2"} _b60 ==> BV32_MUL($d1.0, $offset.1) == 4096bv32;
    assert {:tag "relationalPow2"} _b59 ==> ($offset.1 == 0bv32 && $d1.0 == 16384bv32) || BV32_MUL($d1.0, $offset.1) == 8192bv32;
    assert {:tag "relationalPow2"} _b58 ==> BV32_MUL($d1.0, $offset.1) == 8192bv32;
    assert {:tag "relationalPow2"} _b57 ==> ($offset.1 == 0bv32 && $d1.0 == 32768bv32) || BV32_MUL($d1.0, $offset.1) == 16384bv32;
    assert {:tag "relationalPow2"} _b56 ==> BV32_MUL($d1.0, $offset.1) == 16384bv32;
    assert {:tag "relationalPow2"} _b55 ==> ($offset.1 == 0bv32 && $d1.0 == 65536bv32) || BV32_MUL($d1.0, $offset.1) == 32768bv32;
    assert {:tag "relationalPow2"} _b54 ==> BV32_MUL($d1.0, $offset.1) == 32768bv32;
    assert {:tag "pow2NotZero"} _b53 ==> v10 != 0bv32;
    assert {:tag "pow2"} _b52 ==> v10 == 0bv32 || BV32_AND(v10, BV32_SUB(v10, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b51 ==> $d1.0 != 0bv32;
    assert {:tag "pow2"} _b50 ==> $d1.0 == 0bv32 || BV32_AND($d1.0, BV32_SUB($d1.0, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b49 ==> $offset.1 != 0bv32;
    assert {:tag "pow2"} _b48 ==> $offset.1 == 0bv32 || BV32_AND($offset.1, BV32_SUB($offset.1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_UGE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_UGE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_ULE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_ULE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SGE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SGE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b5 ==> BV32_SLE($d1.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b5 ==> BV32_SLE($d1.0, 1bv32);
    assert {:block_sourceloc} {:sourceloc_num 19} true;
    v9 := BV32_ULT($d1.0, $length);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto __partitioned_block_$truebb2_0, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v9 && !v9;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 31} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$block(true, BV32_MUL(2bv32, v0$1), $$block[1bv1][BV32_MUL(2bv32, v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$block(true, BV32_MUL(2bv32, v0$2), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(2bv32, v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v17$1 := $$block[1bv1][BV32_MUL(2bv32, v0$1)];
    v17$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(2bv32, v0$2)];
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$output(true, BV32_MUL(2bv32, v0$1), v17$1, $$output[BV32_MUL(2bv32, v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_MUL(2bv32, v0$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$output(true, BV32_MUL(2bv32, v0$2), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(2bv32, v0$1)] := v17$1;
    $$output[BV32_MUL(2bv32, v0$2)] := v17$2;
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$block(true, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32), $$block[1bv1][BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$block(true, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v18$1 := $$block[1bv1][BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)];
    v18$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)];
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32), v18$1, $$output[BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)] := v18$1;
    $$output[BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)] := v18$2;
    return;

  __partitioned_block_$truebb2_0:
    assume {:partition} v9 && v9;
    v10 := BV32_ASHR($offset.1, 1bv32);
    goto __partitioned_block_$truebb2_1;

  __partitioned_block_$truebb2_1:
    call {:sourceloc_num 21} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v11$1 := BV32_SLT(v0$1, $d1.0);
    v11$2 := BV32_SLT(v0$2, $d1.0);
    p5$1 := (if v11$1 then v11$1 else p5$1);
    p5$2 := (if v11$2 then v11$2 else p5$2);
    v12$1 := (if p5$1 then BV32_SUB(BV32_MUL(v10, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)), 1bv32) else v12$1);
    v12$2 := (if p5$2 then BV32_SUB(BV32_MUL(v10, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)), 1bv32) else v12$2);
    v13$1 := (if p5$1 then BV32_SUB(BV32_MUL(v10, BV32_ADD(BV32_MUL(2bv32, v0$1), 2bv32)), 1bv32) else v13$1);
    v13$2 := (if p5$2 then BV32_SUB(BV32_MUL(v10, BV32_ADD(BV32_MUL(2bv32, v0$2), 2bv32)), 1bv32) else v13$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$block(p5$1, v12$1, $$block[1bv1][v12$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$block(p5$2, v12$2, $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v12$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v14$1 := (if p5$1 then $$block[1bv1][v12$1] else v14$1);
    v14$2 := (if p5$2 then $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v12$2] else v14$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$block(p5$1, v13$1, $$block[1bv1][v13$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$block(p5$2, v13$2, $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v15$1 := (if p5$1 then $$block[1bv1][v13$1] else v15$1);
    v15$2 := (if p5$2 then $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$block(p5$1, v12$1, v15$1, $$block[1bv1][v12$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(p5$2, v12$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$block(p5$2, v12$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][v12$1] := (if p5$1 then v15$1 else $$block[1bv1][v12$1]);
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v12$2] := (if p5$2 then v15$2 else $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v12$2]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$block(p5$1, v13$1, $$block[1bv1][v13$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$block(p5$2, v13$2, $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v16$1 := (if p5$1 then $$block[1bv1][v13$1] else v16$1);
    v16$2 := (if p5$2 then $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2] else v16$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$block(p5$1, v13$1, FADD32(v16$1, v14$1), $$block[1bv1][v13$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(p5$2, v13$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$block(p5$2, v13$2, FADD32(v16$2, v14$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][v13$1] := (if p5$1 then FADD32(v16$1, v14$1) else $$block[1bv1][v13$1]);
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2] := (if p5$2 then FADD32(v16$2, v14$2) else $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v13$2]);
    $offset.1, $d1.0 := v10, BV32_MUL($d1.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  __partitioned_block_$truebb_0:
    assume {:partition} v3 && v3;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    v4$1 := BV32_SLT(v0$1, $d.0);
    v4$2 := BV32_SLT(v0$2, $d.0);
    p1$1 := (if v4$1 then v4$1 else p1$1);
    p1$2 := (if v4$2 then v4$2 else p1$2);
    v5$1 := (if p1$1 then BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$1), 2bv32)), 1bv32) else v5$1);
    v5$2 := (if p1$2 then BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$2), 2bv32)), 1bv32) else v5$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$block(p1$1, BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)), 1bv32), $$block[1bv1][BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$block(p1$2, BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)), 1bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v6$1 := (if p1$1 then $$block[1bv1][BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$1), 1bv32)), 1bv32)] else v6$1);
    v6$2 := (if p1$2 then $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_MUL($offset.0, BV32_ADD(BV32_MUL(2bv32, v0$2), 1bv32)), 1bv32)] else v6$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$block(p1$1, v5$1, $$block[1bv1][v5$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$block(p1$2, v5$2, $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v7$1 := (if p1$1 then $$block[1bv1][v5$1] else v7$1);
    v7$2 := (if p1$2 then $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] else v7$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$block(p1$1, v5$1, FADD32(v7$1, v6$1), $$block[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(p1$2, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$block(p1$2, v5$2, FADD32(v7$2, v6$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][v5$1] := (if p1$1 then FADD32(v7$1, v6$1) else $$block[1bv1][v5$1]);
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := (if p1$2 then FADD32(v7$2, v6$2) else $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2]);
    $offset.0, $d.0 := BV32_MUL($offset.0, 2bv32), BV32_ASHR($d.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block, $$output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block, $$output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block, $$output, _TRACKING;



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

const _WATCHED_VALUE_$$output: bv32;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



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



const _WATCHED_VALUE_$$block: bv32;

procedure {:inline 1} _LOG_READ_$$block(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$block;



implementation {:inline 1} _LOG_READ_$$block(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then true else _READ_HAS_OCCURRED_$$block);
    return;
}



procedure _CHECK_READ_$$block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$block: bool;

procedure {:inline 1} _LOG_WRITE_$$block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$block, _WRITE_READ_BENIGN_FLAG_$$block;



implementation {:inline 1} _LOG_WRITE_$$block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then true else _WRITE_HAS_OCCURRED_$$block);
    _WRITE_READ_BENIGN_FLAG_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$block);
    return;
}



procedure _CHECK_WRITE_$$block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$block;



implementation {:inline 1} _LOG_ATOMIC_$$block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$block);
    return;
}



procedure _CHECK_ATOMIC_$$block(_P: bool, _offset: bv32);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$block := (if _P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$block);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

const {:existential true} _b32: bool;

const {:existential true} _b33: bool;

const {:existential true} _b34: bool;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;

const {:existential true} _b37: bool;

const {:existential true} _b38: bool;

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

const {:existential true} _b41: bool;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

const {:existential true} _b45: bool;

const {:existential true} _b46: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b47: bool;

const {:existential true} _b48: bool;

const {:existential true} _b49: bool;

const {:existential true} _b50: bool;

const {:existential true} _b51: bool;

const {:existential true} _b52: bool;

const {:existential true} _b53: bool;

const {:existential true} _b54: bool;

const {:existential true} _b55: bool;

const {:existential true} _b56: bool;

const {:existential true} _b57: bool;

const {:existential true} _b58: bool;

const {:existential true} _b59: bool;

const {:existential true} _b60: bool;

const {:existential true} _b61: bool;

const {:existential true} _b62: bool;

const {:existential true} _b63: bool;

const {:existential true} _b64: bool;

const {:existential true} _b65: bool;

const {:existential true} _b66: bool;

const {:existential true} _b67: bool;

const {:existential true} _b68: bool;

const {:existential true} _b69: bool;

const {:existential true} _b70: bool;

const {:existential true} _b71: bool;

const {:existential true} _b72: bool;

const {:existential true} _b73: bool;

const {:existential true} _b74: bool;

const {:existential true} _b75: bool;

const {:existential true} _b76: bool;

const {:existential true} _b77: bool;

const {:existential true} _b78: bool;

const {:existential true} _b79: bool;

const {:existential true} _b80: bool;

const {:existential true} _b81: bool;

const {:existential true} _b82: bool;

const {:existential true} _b83: bool;

const {:existential true} _b84: bool;

const {:existential true} _b85: bool;

const {:existential true} _b86: bool;

const {:existential true} _b87: bool;
