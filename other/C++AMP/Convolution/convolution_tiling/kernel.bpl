type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$img"} {:global} {:elem_width 32} {:source_name "img"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

axiom {:array_info "$$filter"} {:global} {:elem_width 32} {:source_name "filter"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$filter: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$filter: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$filter: bool;

var {:source_name "result"} {:global} $$result: [bv32]bv32;

axiom {:array_info "$$result"} {:global} {:elem_width 32} {:source_name "result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$result: bool;

var {:source_name "local_buf"} {:group_shared} $$_ZZ18convolution_tilingPKfS0_PfE9local_buf: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:group_shared} {:elem_width 32} {:source_name "local_buf"} {:source_elem_width 32} {:source_dimensions "128"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "convolution_tiling"} {:kernel} $_Z18convolution_tilingPKfS0_Pf();
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
  requires !_READ_HAS_OCCURRED_$$filter && !_WRITE_HAS_OCCURRED_$$filter && !_ATOMIC_HAS_OCCURRED_$$filter;
  requires !_READ_HAS_OCCURRED_$$result && !_WRITE_HAS_OCCURRED_$$result && !_ATOMIC_HAS_OCCURRED_$$result;
  requires !_READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && !_WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && !_ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;
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
  modifies $$_ZZ18convolution_tilingPKfS0_PfE9local_buf, _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf, $$result, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf, _WRITE_HAS_OCCURRED_$$result, _WRITE_READ_BENIGN_FLAG_$$result, _WRITE_READ_BENIGN_FLAG_$$result;



implementation {:source_name "convolution_tiling"} {:kernel} $_Z18convolution_tilingPKfS0_Pf()
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
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
  var p10$1: bool;
  var p10$2: bool;
  var p11$1: bool;
  var p11$2: bool;
  var p12$1: bool;
  var p12$2: bool;
  var p13$1: bool;
  var p13$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_SUB(BV32_ADD(BV32_MUL(group_id_y$1, 114bv32), local_id_y$1), 7bv32);
    v0$2 := BV32_SUB(BV32_ADD(BV32_MUL(group_id_y$2, 114bv32), local_id_y$2), 7bv32);
    v1$1 := BV32_SLT(v0$1, 0bv32);
    v1$2 := BV32_SLT(v0$2, 0bv32);
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
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    $0$1 := (if p0$1 then 0bv32 else $0$1);
    $0$2 := (if p0$2 then 0bv32 else $0$2);
    v2$1 := (if p1$1 then BV32_SGT(v0$1, 511bv32) else v2$1);
    v2$2 := (if p1$2 then BV32_SGT(v0$2, 511bv32) else v2$2);
    p2$1 := (if p1$1 && v2$1 then v2$1 else p2$1);
    p2$2 := (if p1$2 && v2$2 then v2$2 else p2$2);
    p3$1 := (if p1$1 && !v2$1 then !v2$1 else p3$1);
    p3$2 := (if p1$2 && !v2$2 then !v2$2 else p3$2);
    $1$1 := (if p2$1 then 511bv32 else $1$1);
    $1$2 := (if p2$2 then 511bv32 else $1$2);
    $1$1 := (if p3$1 then v0$1 else $1$1);
    $1$2 := (if p3$2 then v0$2 else $1$2);
    $0$1 := (if p1$1 then $1$1 else $0$1);
    $0$2 := (if p1$2 then $1$2 else $0$2);
    v3$1 := BV32_SLT(v0$1, 519bv32);
    v3$2 := BV32_SLT(v0$2, 519bv32);
    p4$1 := (if v3$1 then v3$1 else p4$1);
    p4$2 := (if v3$2 then v3$2 else p4$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p4$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p4$2 then _HAVOC_bv32$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(p4$1, local_id_y$1, v4$1, $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[1bv1][local_id_y$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(p4$2, local_id_y$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(p4$2, local_id_y$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} true;
    $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[1bv1][local_id_y$1] := (if p4$1 then v4$1 else $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[1bv1][local_id_y$1]);
    $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_y$2] := (if p4$2 then v4$2 else $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_y$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 11} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v5$1 := BV32_SGE(local_id_y$1, 7bv32);
    v5$2 := BV32_SGE(local_id_y$2, 7bv32);
    p6$1 := (if v5$1 then v5$1 else p6$1);
    p6$2 := (if v5$2 then v5$2 else p6$2);
    v6$1 := (if p6$1 then BV32_SLT(local_id_y$1, 121bv32) else v6$1);
    v6$2 := (if p6$2 then BV32_SLT(local_id_y$2, 121bv32) else v6$2);
    p7$1 := (if p6$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p6$2 && v6$2 then v6$2 else p7$2);
    v7$1 := (if p7$1 then BV32_SLT(v0$1, 512bv32) else v7$1);
    v7$2 := (if p7$2 then BV32_SLT(v0$2, 512bv32) else v7$2);
    p8$1 := (if p7$1 && v7$1 then v7$1 else p8$1);
    p8$2 := (if p7$2 && v7$2 then v7$2 else p8$2);
    $sum.0$1, $k.0$1 := (if p8$1 then 0bv32 else $sum.0$1), (if p8$1 then 4294967289bv32 else $k.0$1);
    $sum.0$2, $k.0$2 := (if p8$2 then 0bv32 else $sum.0$2), (if p8$2 then 4294967289bv32 else $k.0$2);
    p9$1 := (if p8$1 then true else p9$1);
    p9$2 := (if p8$2 then true else p9$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $12;

  $12:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 15} p9$1 ==> true;
    v8$1 := (if p9$1 then BV32_SLE($k.0$1, 7bv32) else v8$1);
    v8$2 := (if p9$2 then BV32_SLE($k.0$2, 7bv32) else v8$2);
    p10$1 := false;
    p10$2 := false;
    p10$1 := (if p9$1 && v8$1 then v8$1 else p10$1);
    p10$2 := (if p9$2 && v8$2 then v8$2 else p10$2);
    p9$1 := (if p9$1 && !v8$1 then v8$1 else p9$1);
    p9$2 := (if p9$2 && !v8$2 then v8$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(p10$1, BV32_ADD(local_id_y$1, $k.0$1), $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[1bv1][BV32_ADD(local_id_y$1, $k.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(p10$2, BV32_ADD(local_id_y$2, $k.0$2), $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_y$2, $k.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} true;
    v9$1 := (if p10$1 then $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[1bv1][BV32_ADD(local_id_y$1, $k.0$1)] else v9$1);
    v9$2 := (if p10$2 then $$_ZZ18convolution_tilingPKfS0_PfE9local_buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_y$2, $k.0$2)] else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p10$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p10$2 then _HAVOC_bv32$2 else v10$2);
    $sum.0$1, $k.0$1 := (if p10$1 then FADD32($sum.0$1, FMUL32(v9$1, v10$1)) else $sum.0$1), (if p10$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1);
    $sum.0$2, $k.0$2 := (if p10$2 then FADD32($sum.0$2, FMUL32(v9$2, v10$2)) else $sum.0$2), (if p10$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2);
    p9$1 := (if p10$1 then true else p9$1);
    p9$2 := (if p10$2 then true else p9$2);
    goto $12.backedge, $12.tail;

  $12.tail:
    assume !p9$1 && !p9$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$result(p8$1, BV32_ADD(BV32_MUL($0$1, 512bv32), group_id_x$1), $sum.0$1, $$result[BV32_ADD(BV32_MUL($0$1, 512bv32), group_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(p8$2, BV32_ADD(BV32_MUL($0$2, 512bv32), group_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$result(p8$2, BV32_ADD(BV32_MUL($0$2, 512bv32), group_id_x$2), $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$result"} true;
    $$result[BV32_ADD(BV32_MUL($0$1, 512bv32), group_id_x$1)] := (if p8$1 then $sum.0$1 else $$result[BV32_ADD(BV32_MUL($0$1, 512bv32), group_id_x$1)]);
    $$result[BV32_ADD(BV32_MUL($0$2, 512bv32), group_id_x$2)] := (if p8$2 then $sum.0$2 else $$result[BV32_ADD(BV32_MUL($0$2, 512bv32), group_id_x$2)]);
    return;

  $12.backedge:
    assume {:backedge} p9$1 || p9$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $12;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 6bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18convolution_tilingPKfS0_PfE9local_buf, $$result, _TRACKING;



const _WATCHED_VALUE_$$img: bv32;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



const _WATCHED_VALUE_$$filter: bv32;

procedure {:inline 1} _LOG_READ_$$filter(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$filter;



implementation {:inline 1} _LOG_READ_$$filter(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$filter == _value then true else _READ_HAS_OCCURRED_$$filter);
    return;
}



procedure _CHECK_READ_$$filter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$filter);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$filter: bool;

procedure {:inline 1} _LOG_WRITE_$$filter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$filter, _WRITE_READ_BENIGN_FLAG_$$filter;



implementation {:inline 1} _LOG_WRITE_$$filter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$filter == _value then true else _WRITE_HAS_OCCURRED_$$filter);
    _WRITE_READ_BENIGN_FLAG_$$filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$filter == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$filter);
    return;
}



procedure _CHECK_WRITE_$$filter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$filter != _value);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$filter != _value);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$filter(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$filter;



implementation {:inline 1} _LOG_ATOMIC_$$filter(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$filter);
    return;
}



procedure _CHECK_ATOMIC_$$filter(_P: bool, _offset: bv32);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset);
  requires {:source_name "filter"} {:array "$$filter"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$filter(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$filter;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$filter(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$filter := (if _P && _WRITE_HAS_OCCURRED_$$filter && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$filter);
    return;
}



const _WATCHED_VALUE_$$result: bv32;

procedure {:inline 1} _LOG_READ_$$result(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$result;



implementation {:inline 1} _LOG_READ_$$result(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then true else _READ_HAS_OCCURRED_$$result);
    return;
}



procedure _CHECK_READ_$$result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$result);
  requires {:source_name "result"} {:array "$$result"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$result: bool;

procedure {:inline 1} _LOG_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$result, _WRITE_READ_BENIGN_FLAG_$$result;



implementation {:inline 1} _LOG_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then true else _WRITE_HAS_OCCURRED_$$result);
    _WRITE_READ_BENIGN_FLAG_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$result);
    return;
}



procedure _CHECK_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result != _value);
  requires {:source_name "result"} {:array "$$result"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result != _value);
  requires {:source_name "result"} {:array "$$result"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$result(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$result;



implementation {:inline 1} _LOG_ATOMIC_$$result(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$result);
    return;
}



procedure _CHECK_ATOMIC_$$result(_P: bool, _offset: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);
  requires {:source_name "result"} {:array "$$result"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$result;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$result := (if _P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$result);
    return;
}



const _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;



implementation {:inline 1} _LOG_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf == _value then true else _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf);
    return;
}



procedure _CHECK_READ_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "local_buf"} {:array "$$_ZZ18convolution_tilingPKfS0_PfE9local_buf"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18convolution_tilingPKfS0_PfE9local_buf;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
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
    havoc $$result;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18convolution_tilingPKfS0_PfE9local_buf;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}


