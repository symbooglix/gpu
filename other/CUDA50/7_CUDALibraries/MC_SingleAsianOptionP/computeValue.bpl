type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "values"} {:global} $$values: [bv32]bv32;

axiom {:array_info "$$values"} {:global} {:elem_width 32} {:source_name "values"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$values: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$values: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$values: bool;

axiom {:array_info "$$paths"} {:global} {:elem_width 32} {:source_name "paths"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$paths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$paths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$paths: bool;

var {:source_name "option"} {:global} $$option: [bv32]bv8;

axiom {:array_info "$$option"} {:global} {:elem_width 8} {:source_name "option"} {:source_elem_width 288} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$option: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$option: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$option: bool;

var {:source_name "sdata.i"} $$sdata.i$1: [bv32]bv32;

var {:source_name "sdata.i"} $$sdata.i$2: [bv32]bv32;

axiom {:array_info "$$sdata.i"} {:elem_width 32} {:source_name "sdata.i"} {:source_elem_width 32} {:source_dimensions "1"} true;

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

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "computeValue<float>"} {:kernel} $_Z12computeValueIfEvPT_PKS0_PK11AsianOptionIS0_Ejj($numSims: bv32, $numTimesteps: bv32);
  requires !_READ_HAS_OCCURRED_$$values && !_WRITE_HAS_OCCURRED_$$values && !_ATOMIC_HAS_OCCURRED_$$values;
  requires !_READ_HAS_OCCURRED_$$paths && !_WRITE_HAS_OCCURRED_$$paths && !_ATOMIC_HAS_OCCURRED_$$paths;
  requires !_READ_HAS_OCCURRED_$$option && !_WRITE_HAS_OCCURRED_$$option && !_ATOMIC_HAS_OCCURRED_$$option;
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
  modifies $$values, _TRACKING, _WRITE_HAS_OCCURRED_$$values, _WRITE_READ_BENIGN_FLAG_$$values, _WRITE_READ_BENIGN_FLAG_$$values, _TRACKING;



implementation {:source_name "computeValue<float>"} {:kernel} $_Z12computeValueIfEvPT_PKS0_PK11AsianOptionIS0_Ejj($numSims: bv32, $numTimesteps: bv32)
{
  var $sumPayoffs.0$1: bv32;
  var $sumPayoffs.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $path.0$1: bv32;
  var $path.0$2: bv32;
  var $avg.0$1: bv32;
  var $avg.0$2: bv32;
  var $t.0$1: bv32;
  var $t.0$2: bv32;
  var $payoff.0$1: bv32;
  var $payoff.0$2: bv32;
  var $s.i.0: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv32;
  var v11$2: bv32;
  var v16$1: bool;
  var v16$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v17$1: bv32;
  var v17$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v18: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v4$1: bv8;
  var v4$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    $sumPayoffs.0$1, $i.0$1 := 0bv32, BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    $sumPayoffs.0$2, $i.0$2 := 0bv32, BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_ULT($i.0$1, $numSims) else v0$1);
    v0$2 := (if p0$2 then BV32_ULT($i.0$2, $numSims) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p6$1 := false;
    p6$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    $path.0$1, $avg.0$1, $t.0$1 := (if p1$1 then $i.0$1 else $path.0$1), (if p1$1 then 0bv32 else $avg.0$1), (if p1$1 then 0bv32 else $t.0$1);
    $path.0$2, $avg.0$2, $t.0$2 := (if p1$2 then $i.0$2 else $path.0$2), (if p1$2 then 0bv32 else $avg.0$2), (if p1$2 then 0bv32 else $t.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_2"} true;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p2$1 ==> true;
    v1$1 := (if p2$1 then BV32_ULT($t.0$1, $numTimesteps) else v1$1);
    v1$2 := (if p2$2 then BV32_ULT($t.0$2, $numTimesteps) else v1$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p3$1 := (if p2$1 && v1$1 then v1$1 else p3$1);
    p3$2 := (if p2$2 && v1$2 then v1$2 else p3$2);
    p2$1 := (if p2$1 && !v1$1 then v1$1 else p2$1);
    p2$2 := (if p2$2 && !v1$2 then v1$2 else p2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p3$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p3$2 then _HAVOC_bv32$2 else v2$2);
    $path.0$1, $avg.0$1, $t.0$1 := (if p3$1 then BV32_ADD($path.0$1, $numSims) else $path.0$1), (if p3$1 then FADD32($avg.0$1, v2$1) else $avg.0$1), (if p3$1 then BV32_ADD($t.0$1, 1bv32) else $t.0$1);
    $path.0$2, $avg.0$2, $t.0$2 := (if p3$2 then BV32_ADD($path.0$2, $numSims) else $path.0$2), (if p3$2 then FADD32($avg.0$2, v2$2) else $avg.0$2), (if p3$2 then BV32_ADD($t.0$2, 1bv32) else $t.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    v3$1 := (if p1$1 then $$option[0bv32] else v3$1);
    v3$2 := (if p1$2 then $$option[0bv32] else v3$2);
    v4$1 := (if p1$1 then $$option[1bv32] else v4$1);
    v4$2 := (if p1$2 then $$option[1bv32] else v4$2);
    v5$1 := (if p1$1 then $$option[2bv32] else v5$1);
    v5$2 := (if p1$2 then $$option[2bv32] else v5$2);
    v6$1 := (if p1$1 then $$option[3bv32] else v6$1);
    v6$2 := (if p1$2 then $$option[3bv32] else v6$2);
    v7$1 := (if p1$1 then $$option[4bv32] else v7$1);
    v7$2 := (if p1$2 then $$option[4bv32] else v7$2);
    v8$1 := (if p1$1 then $$option[5bv32] else v8$1);
    v8$2 := (if p1$2 then $$option[5bv32] else v8$2);
    v9$1 := (if p1$1 then $$option[6bv32] else v9$1);
    v9$2 := (if p1$2 then $$option[6bv32] else v9$2);
    v10$1 := (if p1$1 then $$option[7bv32] else v10$1);
    v10$2 := (if p1$2 then $$option[7bv32] else v10$2);
    v11$1 := (if p1$1 then FSUB32(FDIV32(FMUL32($avg.0$1, v6$1 ++ v5$1 ++ v4$1 ++ v3$1), UI32_TO_FP32($numTimesteps)), v10$1 ++ v9$1 ++ v8$1 ++ v7$1) else v11$1);
    v11$2 := (if p1$2 then FSUB32(FDIV32(FMUL32($avg.0$2, v6$2 ++ v5$2 ++ v4$2 ++ v3$2), UI32_TO_FP32($numTimesteps)), v10$2 ++ v9$2 ++ v8$2 ++ v7$2) else v11$2);
    v12$1 := (if p1$1 then $$option[32bv32] else v12$1);
    v12$2 := (if p1$2 then $$option[32bv32] else v12$2);
    v13$1 := (if p1$1 then $$option[33bv32] else v13$1);
    v13$2 := (if p1$2 then $$option[33bv32] else v13$2);
    v14$1 := (if p1$1 then $$option[34bv32] else v14$1);
    v14$2 := (if p1$2 then $$option[34bv32] else v14$2);
    v15$1 := (if p1$1 then $$option[35bv32] else v15$1);
    v15$2 := (if p1$2 then $$option[35bv32] else v15$2);
    v16$1 := (if p1$1 then v15$1 ++ v14$1 ++ v13$1 ++ v12$1 == 1bv32 else v16$1);
    v16$2 := (if p1$2 then v15$2 ++ v14$2 ++ v13$2 ++ v12$2 == 1bv32 else v16$2);
    p5$1 := (if p1$1 && v16$1 then v16$1 else p5$1);
    p5$2 := (if p1$2 && v16$2 then v16$2 else p5$2);
    p4$1 := (if p1$1 && !v16$1 then !v16$1 else p4$1);
    p4$2 := (if p1$2 && !v16$2 then !v16$2 else p4$2);
    $payoff.0$1 := (if p4$1 then v11$1 else $payoff.0$1);
    $payoff.0$2 := (if p4$2 then v11$2 else $payoff.0$2);
    $payoff.0$1 := (if p5$1 then FSUB32(2147483648bv32, v11$1) else $payoff.0$1);
    $payoff.0$2 := (if p5$2 then FSUB32(2147483648bv32, v11$2) else $payoff.0$2);
    call {:sourceloc_num 22} v17$1, v17$2 := $_Z3maxff(0bv32, p1$1, $payoff.0$1, p1$2, $payoff.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3maxff"} true;
    $sumPayoffs.0$1, $i.0$1 := (if p1$1 then FADD32($sumPayoffs.0$1, v17$1) else $sumPayoffs.0$1), (if p1$1 then BV32_ADD($i.0$1, BV32_MUL(num_groups_x, group_size_x)) else $i.0$1);
    $sumPayoffs.0$2, $i.0$2 := (if p1$2 then FADD32($sumPayoffs.0$2, v17$2) else $sumPayoffs.0$2), (if p1$2 then BV32_ADD($i.0$2, BV32_MUL(num_groups_x, group_size_x)) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, __partitioned_block_$1.tail_0;

  __partitioned_block_$1.tail_0:
    assume !p0$1 && !p0$2;
    $$sdata.i$1[local_id_x$1] := $sumPayoffs.0$1;
    $$sdata.i$2[local_id_x$2] := $sumPayoffs.0$2;
    goto __partitioned_block_$1.tail_1;

  __partitioned_block_$1.tail_1:
    call {:sourceloc_num 26} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $s.i.0 := BV32_UDIV(group_size_x, 2bv32);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 27} true;
    v18 := BV32_UGT($s.i.0, 0bv32);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    goto __partitioned_block_$truebb2_0, $falsebb2;

  $falsebb2:
    assume {:partition} !v18 && !v18;
    v22$1 := $$sdata.i$1[0bv32];
    v22$2 := $$sdata.i$2[0bv32];
    v23$1 := local_id_x$1 == 0bv32;
    v23$2 := local_id_x$2 == 0bv32;
    p9$1 := (if v23$1 then v23$1 else p9$1);
    p9$2 := (if v23$2 then v23$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$values(p9$1, group_id_x$1, v22$1, $$values[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(p9$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$values(p9$2, group_id_x$2, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$values"} true;
    $$values[group_id_x$1] := (if p9$1 then v22$1 else $$values[group_id_x$1]);
    $$values[group_id_x$2] := (if p9$2 then v22$2 else $$values[group_id_x$2]);
    return;

  __partitioned_block_$truebb2_0:
    assume {:partition} v18 && v18;
    v19$1 := BV32_ULT(local_id_x$1, $s.i.0);
    v19$2 := BV32_ULT(local_id_x$2, $s.i.0);
    p8$1 := (if v19$1 then v19$1 else p8$1);
    p8$2 := (if v19$2 then v19$2 else p8$2);
    v20$1 := (if p8$1 then $$sdata.i$1[BV32_ADD(local_id_x$1, $s.i.0)] else v20$1);
    v20$2 := (if p8$2 then $$sdata.i$2[BV32_ADD(local_id_x$2, $s.i.0)] else v20$2);
    v21$1 := (if p8$1 then $$sdata.i$1[local_id_x$1] else v21$1);
    v21$2 := (if p8$2 then $$sdata.i$2[local_id_x$2] else v21$2);
    $$sdata.i$1[local_id_x$1] := (if p8$1 then FADD32(v21$1, v20$1) else $$sdata.i$1[local_id_x$1]);
    $$sdata.i$2[local_id_x$2] := (if p8$2 then FADD32(v21$2, v20$2) else $$sdata.i$2[local_id_x$2]);
    goto __partitioned_block_$truebb2_1;

  __partitioned_block_$truebb2_1:
    call {:sourceloc_num 34} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $s.i.0 := BV32_LSHR($s.i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $11;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $3;
}



procedure {:source_name "_Z3maxff"} $_Z3maxff($0: bv32, _P$1: bool, $1$1: bv32, _P$2: bool, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
  requires _P$1 ==> $0 == 0bv32;
  requires _P$2 ==> $0 == 0bv32;



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 195bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 1bv1;
  modifies $$values, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$values, _TRACKING;



const _WATCHED_VALUE_$$values: bv32;

procedure {:inline 1} _LOG_READ_$$values(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$values;



implementation {:inline 1} _LOG_READ_$$values(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then true else _READ_HAS_OCCURRED_$$values);
    return;
}



procedure _CHECK_READ_$$values(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$values);
  requires {:source_name "values"} {:array "$$values"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$values: bool;

procedure {:inline 1} _LOG_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$values, _WRITE_READ_BENIGN_FLAG_$$values;



implementation {:inline 1} _LOG_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then true else _WRITE_HAS_OCCURRED_$$values);
    _WRITE_READ_BENIGN_FLAG_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$values);
    return;
}



procedure _CHECK_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values != _value);
  requires {:source_name "values"} {:array "$$values"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values != _value);
  requires {:source_name "values"} {:array "$$values"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$values(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$values;



implementation {:inline 1} _LOG_ATOMIC_$$values(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$values);
    return;
}



procedure _CHECK_ATOMIC_$$values(_P: bool, _offset: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);
  requires {:source_name "values"} {:array "$$values"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$values;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$values := (if _P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$values);
    return;
}



const _WATCHED_VALUE_$$paths: bv32;

procedure {:inline 1} _LOG_READ_$$paths(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$paths;



implementation {:inline 1} _LOG_READ_$$paths(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$paths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$paths == _value then true else _READ_HAS_OCCURRED_$$paths);
    return;
}



procedure _CHECK_READ_$$paths(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$paths);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$paths: bool;

procedure {:inline 1} _LOG_WRITE_$$paths(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$paths, _WRITE_READ_BENIGN_FLAG_$$paths;



implementation {:inline 1} _LOG_WRITE_$$paths(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$paths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$paths == _value then true else _WRITE_HAS_OCCURRED_$$paths);
    _WRITE_READ_BENIGN_FLAG_$$paths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$paths == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$paths);
    return;
}



procedure _CHECK_WRITE_$$paths(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$paths != _value);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$paths != _value);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$paths(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$paths;



implementation {:inline 1} _LOG_ATOMIC_$$paths(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$paths := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$paths);
    return;
}



procedure _CHECK_ATOMIC_$$paths(_P: bool, _offset: bv32);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset);
  requires {:source_name "paths"} {:array "$$paths"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$paths(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$paths;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$paths(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$paths := (if _P && _WRITE_HAS_OCCURRED_$$paths && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$paths);
    return;
}



const _WATCHED_VALUE_$$option: bv8;

procedure {:inline 1} _LOG_READ_$$option(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$option;



implementation {:inline 1} _LOG_READ_$$option(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$option := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$option == _value then true else _READ_HAS_OCCURRED_$$option);
    return;
}



procedure _CHECK_READ_$$option(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "option"} {:array "$$option"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$option);
  requires {:source_name "option"} {:array "$$option"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$option: bool;

procedure {:inline 1} _LOG_WRITE_$$option(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$option, _WRITE_READ_BENIGN_FLAG_$$option;



implementation {:inline 1} _LOG_WRITE_$$option(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$option := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$option == _value then true else _WRITE_HAS_OCCURRED_$$option);
    _WRITE_READ_BENIGN_FLAG_$$option := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$option == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$option);
    return;
}



procedure _CHECK_WRITE_$$option(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "option"} {:array "$$option"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$option != _value);
  requires {:source_name "option"} {:array "$$option"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$option != _value);
  requires {:source_name "option"} {:array "$$option"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$option(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$option;



implementation {:inline 1} _LOG_ATOMIC_$$option(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$option := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$option);
    return;
}



procedure _CHECK_ATOMIC_$$option(_P: bool, _offset: bv32);
  requires {:source_name "option"} {:array "$$option"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset);
  requires {:source_name "option"} {:array "$$option"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$option(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$option;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$option(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$option := (if _P && _WRITE_HAS_OCCURRED_$$option && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$option);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$values;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$values;
    goto anon3;

  anon4_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$values;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$values;
    goto anon3;

  anon4_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
