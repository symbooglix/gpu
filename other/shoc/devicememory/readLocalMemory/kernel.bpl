type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

var {:source_name "lbuf"} {:group_shared} $$readLocalMemory.lbuf: [bv1][bv32]bv32;

axiom {:array_info "$$readLocalMemory.lbuf"} {:group_shared} {:elem_width 32} {:source_name "lbuf"} {:source_elem_width 32} {:source_dimensions "4096"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$readLocalMemory.lbuf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf: bool;

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

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "readLocalMemory"} {:kernel} $readLocalMemory($size: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $size == 16777216bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$readLocalMemory.lbuf && !_WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf && !_ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf;
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
  modifies $$readLocalMemory.lbuf, _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf, $$output, _TRACKING, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _READ_HAS_OCCURRED_$$readLocalMemory.lbuf;



implementation {:source_name "readLocalMemory"} {:kernel} $readLocalMemory($size: bv32)
{
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $0$1: bv1;
  var $0$2: bv1;
  var $j.1$1: bv32;
  var $j.1$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $j.2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $s.0$1: bv32;
  var $s.0$2: bv32;
  var v2: bv32;
  var v3: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9: bool;
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
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
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
  var p6$1: bool;
  var p6$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2 := group_size_x;
    v3 := BV32_SDIV(4096bv32, v2);
    v4$1 := BV32_ADD(BV32_MUL(v2, group_id_x$1), BV32_MUL(v1$1, v3));
    v4$2 := BV32_ADD(BV32_MUL(v2, group_id_x$2), BV32_MUL(v1$2, v3));
    $j.0$1 := 0bv32;
    $j.0$2 := 0bv32;
    p0$1 := false;
    p0$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v5$1 := (if p0$1 then BV32_SLT($j.0$1, v3) else v5$1);
    v5$2 := (if p0$2 then BV32_SLT($j.0$2, v3) else v5$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p2$1 := (if p0$1 && v5$1 then v5$1 else p2$1);
    p2$2 := (if p0$2 && v5$2 then v5$2 else p2$2);
    p1$1 := (if p0$1 && !v5$1 then !v5$1 else p1$1);
    p1$2 := (if p0$2 && !v5$2 then !v5$2 else p1$2);
    $0$1 := (if p1$1 then 0bv1 else $0$1);
    $0$2 := (if p1$2 then 0bv1 else $0$2);
    $0$1 := (if p2$1 then (if BV32_SLT($j.0$1, BV32_SUB($size, v4$1)) then 1bv1 else 0bv1) else $0$1);
    $0$2 := (if p2$2 then (if BV32_SLT($j.0$2, BV32_SUB($size, v4$2)) then 1bv1 else 0bv1) else $0$2);
    p3$1 := (if p0$1 && $0$1 == 1bv1 then $0$1 == 1bv1 else p3$1);
    p3$2 := (if p0$2 && $0$2 == 1bv1 then $0$2 == 1bv1 else p3$2);
    p0$1 := (if p0$1 && !($0$1 == 1bv1) then $0$1 == 1bv1 else p0$1);
    p0$2 := (if p0$2 && !($0$2 == 1bv1) then $0$2 == 1bv1 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p3$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p3$2 then _HAVOC_bv32$2 else v6$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$readLocalMemory.lbuf(p3$1, BV32_ADD(BV32_MUL(v1$1, v3), $j.0$1), v6$1, $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf(p3$2, BV32_ADD(BV32_MUL(v1$2, v3), $j.0$2));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$readLocalMemory.lbuf(p3$2, BV32_ADD(BV32_MUL(v1$2, v3), $j.0$2), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$readLocalMemory.lbuf"} true;
    $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.0$1)] := (if p3$1 then v6$1 else $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.0$1)]);
    $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, v3), $j.0$2)] := (if p3$2 then v6$2 else $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, v3), $j.0$2)]);
    $j.0$1 := (if p3$1 then BV32_ADD($j.0$1, 1bv32) else $j.0$1);
    $j.0$2 := (if p3$2 then BV32_ADD($j.0$2, 1bv32) else $j.0$2);
    p0$1 := (if p3$1 then true else p0$1);
    p0$2 := (if p3$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    $j.1$1, $i.0$1 := $j.0$1, 0bv32;
    $j.1$2, $i.0$2 := $j.0$2, 0bv32;
    p5$1 := true;
    p5$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 10} p5$1 ==> true;
    v7$1 := (if p5$1 then BV32_SLT($j.1$1, v3) else v7$1);
    v7$2 := (if p5$2 then BV32_SLT($j.1$2, v3) else v7$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v7$1 then v7$1 else p6$1);
    p6$2 := (if p5$2 && v7$2 then v7$2 else p6$2);
    p5$1 := (if p5$1 && !v7$1 then v7$1 else p5$1);
    p5$2 := (if p5$2 && !v7$2 then v7$2 else p5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p6$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p6$2 then _HAVOC_bv32$2 else v8$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$readLocalMemory.lbuf(p6$1, BV32_ADD(BV32_MUL(v1$1, v3), $j.1$1), v8$1, $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf(p6$2, BV32_ADD(BV32_MUL(v1$2, v3), $j.1$2));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$readLocalMemory.lbuf(p6$2, BV32_ADD(BV32_MUL(v1$2, v3), $j.1$2), v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$readLocalMemory.lbuf"} true;
    $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.1$1)] := (if p6$1 then v8$1 else $$readLocalMemory.lbuf[1bv1][BV32_ADD(BV32_MUL(v1$1, v3), $j.1$1)]);
    $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, v3), $j.1$2)] := (if p6$2 then v8$2 else $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, v3), $j.1$2)]);
    $j.1$1, $i.0$1 := (if p6$1 then BV32_ADD($j.1$1, 1bv32) else $j.1$1), (if p6$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1);
    $j.1$2, $i.0$2 := (if p6$2 then BV32_ADD($j.1$2, 1bv32) else $j.1$2), (if p6$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $7.backedge, __partitioned_block_$7.tail_0;

  __partitioned_block_$7.tail_0:
    assume !p5$1 && !p5$2;
    goto __partitioned_block_$7.tail_1;

  __partitioned_block_$7.tail_1:
    call {:sourceloc_num 16} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $j.2, $sum.0$1, $s.0$1 := 0bv32, 0bv32, v1$1;
    $sum.0$2, $s.0$2 := 0bv32, v1$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$readLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 17} true;
    v9 := BV32_SLT($j.2, 3000bv32);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v9 && !v9;
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$output(true, v0$1, $sum.0$1, $$output[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$output(true, v0$2, $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[v0$1] := $sum.0$1;
    $$output[v0$2] := $sum.0$2;
    return;

  $truebb2:
    assume {:partition} v9 && v9;
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND($s.0$1, 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND($s.0$1, 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND($s.0$2, 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND($s.0$2, 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v10$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND($s.0$1, 4095bv32)];
    v10$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND($s.0$2, 4095bv32)];
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v11$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32)];
    v11$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v12$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32)];
    v12$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v13$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32)];
    v13$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v14$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32)];
    v14$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v15$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32)];
    v15$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v16$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32)];
    v16$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v17$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32)];
    v17$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v18$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32)];
    v18$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v19$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32)];
    v19$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v20$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32)];
    v20$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v21$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32)];
    v21$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v22$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32)];
    v22$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v23$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32)];
    v23$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v24$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32)];
    v24$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32)];
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32), $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$readLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32), $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$readLocalMemory.lbuf"} true;
    v25$1 := $$readLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32)];
    v25$2 := $$readLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32)];
    $j.2, $sum.0$1, $s.0$1 := BV32_ADD($j.2, 1bv32), FADD32($sum.0$1, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v10$1, v11$1), v12$1), v13$1), v14$1), v15$1), v16$1), v17$1), v18$1), v19$1), v20$1), v21$1), v22$1), v23$1), v24$1), v25$1)), BV32_AND(BV32_ADD($s.0$1, 16bv32), 4095bv32);
    $sum.0$2, $s.0$2 := FADD32($sum.0$2, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v10$2, v11$2), v12$2), v13$2), v14$2), v15$2), v16$2), v17$2), v18$2), v19$2), v20$2), v21$2), v22$2), v23$2), v24$2), v25$2)), BV32_AND(BV32_ADD($s.0$2, 16bv32), 4095bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $11;

  $7.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $7;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 40bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$readLocalMemory.lbuf, $$output, _TRACKING;



const _WATCHED_VALUE_$$data: bv32;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



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



const _WATCHED_VALUE_$$readLocalMemory.lbuf: bv32;

procedure {:inline 1} _LOG_READ_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$readLocalMemory.lbuf;



implementation {:inline 1} _LOG_READ_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$readLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$readLocalMemory.lbuf == _value then true else _READ_HAS_OCCURRED_$$readLocalMemory.lbuf);
    return;
}



procedure _CHECK_READ_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf: bool;

procedure {:inline 1} _LOG_WRITE_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf;



implementation {:inline 1} _LOG_WRITE_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$readLocalMemory.lbuf == _value then true else _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf);
    _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$readLocalMemory.lbuf == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf);
    return;
}



procedure _CHECK_WRITE_$$readLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$readLocalMemory.lbuf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$readLocalMemory.lbuf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$readLocalMemory.lbuf(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf;



implementation {:inline 1} _LOG_ATOMIC_$$readLocalMemory.lbuf(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf);
    return;
}



procedure _CHECK_ATOMIC_$$readLocalMemory.lbuf(_P: bool, _offset: bv32);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$readLocalMemory.lbuf"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf := (if _P && _WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$readLocalMemory.lbuf);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$readLocalMemory.lbuf;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$readLocalMemory.lbuf;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$readLocalMemory.lbuf;
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
    havoc $$readLocalMemory.lbuf;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
