type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "graph"} {:global} $$graph: [bv32]bv32;

axiom {:array_info "$$graph"} {:global} {:elem_width 32} {:source_name "graph"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$graph: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$graph: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$graph: bool;

var {:source_name "shbuffer1"} {:group_shared} $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:group_shared} {:elem_width 32} {:source_name "shbuffer1"} {:source_elem_width 32} {:source_dimensions "8,8"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: bool;

var {:source_name "shBuffer2"} {:group_shared} $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:group_shared} {:elem_width 32} {:source_name "shBuffer2"} {:source_elem_width 32} {:source_dimensions "8,8"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: bool;

var {:source_name "curr_block_buffer"} {:group_shared} $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:group_shared} {:elem_width 32} {:source_name "curr_block_buffer"} {:source_elem_width 32} {:source_dimensions "8,8"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,8"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: bool;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "transitive_closure_stage3_kernel"} {:kernel} $_Z32transitive_closure_stage3_kernelPji($passnum: bv32);
  requires !_READ_HAS_OCCURRED_$$graph && !_WRITE_HAS_OCCURRED_$$graph && !_ATOMIC_HAS_OCCURRED_$$graph;
  requires !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;
  requires !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;
  requires !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;
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
  modifies $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _READ_HAS_OCCURRED_$$graph, _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _WRITE_HAS_OCCURRED_$$graph, _WRITE_READ_BENIGN_FLAG_$$graph, _WRITE_READ_BENIGN_FLAG_$$graph, _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, $$graph, _TRACKING;



implementation {:source_name "transitive_closure_stage3_kernel"} {:kernel} $_Z32transitive_closure_stage3_kernelPji($passnum: bv32)
{
  var $group_id0.0$1: bv32;
  var $group_id0.0$2: bv32;
  var $group_id1.0$1: bv32;
  var $group_id1.0$2: bv32;
  var $k.0: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var p7$1: bool;
  var p7$2: bool;
  var p8$1: bool;
  var p8$2: bool;
  var p9$1: bool;
  var p9$2: bool;


  $0:
    v0$1 := BV32_ULT(group_id_y$1, $passnum);
    v0$2 := BV32_ULT(group_id_y$2, $passnum);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v0$1 then v0$1 else p0$1);
    p0$2 := (if v0$2 then v0$2 else p0$2);
    p1$1 := (if !v0$1 then !v0$1 else p1$1);
    p1$2 := (if !v0$2 then !v0$2 else p1$2);
    $group_id0.0$1 := (if p0$1 then group_id_y$1 else $group_id0.0$1);
    $group_id0.0$2 := (if p0$2 then group_id_y$2 else $group_id0.0$2);
    $group_id0.0$1 := (if p1$1 then BV32_ADD(group_id_y$1, 1bv32) else $group_id0.0$1);
    $group_id0.0$2 := (if p1$2 then BV32_ADD(group_id_y$2, 1bv32) else $group_id0.0$2);
    v1$1 := BV32_ULT(group_id_x$1, $passnum);
    v1$2 := BV32_ULT(group_id_x$2, $passnum);
    p2$1 := (if v1$1 then v1$1 else p2$1);
    p2$2 := (if v1$2 then v1$2 else p2$2);
    p3$1 := (if !v1$1 then !v1$1 else p3$1);
    p3$2 := (if !v1$2 then !v1$2 else p3$2);
    $group_id1.0$1 := (if p2$1 then group_id_x$1 else $group_id1.0$1);
    $group_id1.0$2 := (if p2$2 then group_id_x$2 else $group_id1.0$2);
    $group_id1.0$1 := (if p3$1 then BV32_ADD(group_id_x$1, 1bv32) else $group_id1.0$1);
    $group_id1.0$2 := (if p3$2 then BV32_ADD(group_id_x$2, 1bv32) else $group_id1.0$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$graph(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$1, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$1)), $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$1, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$graph(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$2, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$2)), $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$2, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$graph"} true;
    v2$1 := $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$1, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$1))];
    v2$2 := $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($group_id0.0$2, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(true, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), v2$1, $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} true;
    $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)] := v2$1;
    $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)] := v2$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$graph(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$1, 8bv32), local_id_x$1)), $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$1, 8bv32), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$graph(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$2, 8bv32), local_id_x$2)), $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$2, 8bv32), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$graph"} true;
    v3$1 := $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$1), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$1, 8bv32), local_id_x$1))];
    v3$2 := $$graph[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($passnum, 8bv32), local_id_y$2), 64bv32), BV32_ADD(BV32_MUL($group_id1.0$2, 8bv32), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(true, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), v3$1, $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} true;
    $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)] := v3$1;
    $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)] := v3$2;
    v4$1 := BV32_ADD(BV32_MUL($group_id0.0$1, 8bv32), local_id_y$1);
    v4$2 := BV32_ADD(BV32_MUL($group_id0.0$2, 8bv32), local_id_y$2);
    v5$1 := BV32_ADD(BV32_MUL($group_id1.0$1, 8bv32), local_id_x$1);
    v5$2 := BV32_ADD(BV32_MUL($group_id1.0$2, 8bv32), local_id_x$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$graph(true, BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1), $$graph[BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$graph(true, BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2), $$graph[BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$graph"} true;
    v6$1 := $$graph[BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1)];
    v6$2 := $$graph[BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2)];
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), v6$1, $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} true;
    $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)] := v6$1;
    $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)] := v6$2;
    $k.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 13} true;
    v7 := BV32_ULT($k.0, 8bv32);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v7 && !v7;
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} true;
    v14$1 := $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)];
    v14$2 := $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)];
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$graph(true, BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1), v14$1, $$graph[BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$graph(true, BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$graph(true, BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$graph"} true;
    $$graph[BV32_ADD(BV32_MUL(v4$1, 64bv32), v5$1)] := v14$1;
    $$graph[BV32_ADD(BV32_MUL(v4$2, 64bv32), v5$2)] := v14$2;
    return;

  __partitioned_block_$truebb1_0:
    assume {:partition} v7 && v7;
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(true, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} true;
    v8$1 := $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)];
    v8$2 := $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)];
    v9$1 := v8$1 == 0bv32;
    v9$2 := v8$2 == 0bv32;
    p5$1 := (if v9$1 then v9$1 else p5$1);
    p5$2 := (if v9$2 then v9$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(p5$1, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), $k.0), $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), $k.0)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(p5$2, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), $k.0), $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), $k.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} true;
    v10$1 := (if p5$1 then $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), $k.0)] else v10$1);
    v10$2 := (if p5$2 then $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), $k.0)] else v10$2);
    v11$1 := (if p5$1 then v10$1 != 0bv32 else v11$1);
    v11$2 := (if p5$2 then v10$2 != 0bv32 else v11$2);
    p7$1 := (if p5$1 && v11$1 then v11$1 else p7$1);
    p7$2 := (if p5$2 && v11$2 then v11$2 else p7$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(p7$1, BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$1), $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[1bv1][BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(p7$2, BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$2), $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} true;
    v12$1 := (if p7$1 then $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[1bv1][BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$1)] else v12$1);
    v12$2 := (if p7$2 then $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 8bv32), local_id_x$2)] else v12$2);
    v13$1 := (if p7$1 then v12$1 != 0bv32 else v13$1);
    v13$2 := (if p7$2 then v12$2 != 0bv32 else v13$2);
    p9$1 := (if p7$1 && v13$1 then v13$1 else p9$1);
    p9$2 := (if p7$2 && v13$2 then v13$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(p9$1, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), BV32_ADD(BV32_ADD(BV32_MUL($passnum, 8bv32), $k.0), 2bv32), $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(p9$2, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(p9$2, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), BV32_ADD(BV32_ADD(BV32_MUL($passnum, 8bv32), $k.0), 2bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} true;
    $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)] := (if p9$1 then BV32_ADD(BV32_ADD(BV32_MUL($passnum, 8bv32), $k.0), 2bv32) else $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)] := (if p9$2 then BV32_ADD(BV32_ADD(BV32_MUL($passnum, 8bv32), $k.0), 2bv32) else $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)]);
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 24} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $k.0 := BV32_ADD($k.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, $$graph, _TRACKING;



const _WATCHED_VALUE_$$graph: bv32;

procedure {:inline 1} _LOG_READ_$$graph(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$graph;



implementation {:inline 1} _LOG_READ_$$graph(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$graph := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$graph == _value then true else _READ_HAS_OCCURRED_$$graph);
    return;
}



procedure _CHECK_READ_$$graph(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$graph);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$graph: bool;

procedure {:inline 1} _LOG_WRITE_$$graph(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$graph, _WRITE_READ_BENIGN_FLAG_$$graph;



implementation {:inline 1} _LOG_WRITE_$$graph(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$graph := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$graph == _value then true else _WRITE_HAS_OCCURRED_$$graph);
    _WRITE_READ_BENIGN_FLAG_$$graph := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$graph == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$graph);
    return;
}



procedure _CHECK_WRITE_$$graph(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$graph != _value);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$graph != _value);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$graph(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$graph;



implementation {:inline 1} _LOG_ATOMIC_$$graph(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$graph := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$graph);
    return;
}



procedure _CHECK_ATOMIC_$$graph(_P: bool, _offset: bv32);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset);
  requires {:source_name "graph"} {:array "$$graph"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$graph(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$graph;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$graph(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$graph := (if _P && _WRITE_HAS_OCCURRED_$$graph && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$graph);
    return;
}



const _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;



implementation {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 == _value then true else _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1);
    return;
}



procedure _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;



implementation {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1);
    return;
}



procedure _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shbuffer1"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1);
    return;
}



const _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;



implementation {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 == _value then true else _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2);
    return;
}



procedure _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;



implementation {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2);
    return;
}



procedure _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shBuffer2"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2);
    return;
}



const _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;



implementation {:inline 1} _LOG_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer == _value then true else _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer);
    return;
}



procedure _CHECK_READ_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer, _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;



implementation {:inline 1} _LOG_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer);
    return;
}



procedure _CHECK_WRITE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "curr_block_buffer"} {:array "$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;
    goto anon3;

  anon3:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$graph;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$graph;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$graph;
    goto anon8;

  anon8:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$graph;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ32transitive_closure_stage3_kernelPjiE9shbuffer1;
    goto anon5;

  anon5:
    havoc $$_ZZ32transitive_closure_stage3_kernelPjiE9shBuffer2;
    goto anon6;

  anon6:
    havoc $$_ZZ32transitive_closure_stage3_kernelPjiE17curr_block_buffer;
    goto anon7;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
