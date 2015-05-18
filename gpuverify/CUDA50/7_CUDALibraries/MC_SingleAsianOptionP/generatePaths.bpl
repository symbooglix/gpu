type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "paths"} {:global} $$paths: [bv32]bv32;

axiom {:array_info "$$paths"} {:global} {:elem_width 32} {:source_name "paths"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$paths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$paths: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$paths: bool;

axiom {:array_info "$$rngStates"} {:global} {:elem_width 32} {:source_name "rngStates"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rngStates: bool;

axiom {:array_info "$$option"} {:global} {:elem_width 8} {:source_name "option"} {:source_elem_width 288} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$option: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$option: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 288} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$option: bool;

axiom {:array_info "$$localState"} {:elem_width 32} {:source_name "localState"} {:source_elem_width 32} {:source_dimensions "1"} true;

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

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "generatePaths<float>"} {:kernel} $_Z13generatePathsIfEvPT_P17curandStateXORWOWPK11AsianOptionIS0_Ejj($numSims: bv32, $numTimesteps: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $numSims == 100000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $numTimesteps == 87bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$paths && !_WRITE_HAS_OCCURRED_$$paths && !_ATOMIC_HAS_OCCURRED_$$paths;
  requires !_READ_HAS_OCCURRED_$$rngStates && !_WRITE_HAS_OCCURRED_$$rngStates && !_ATOMIC_HAS_OCCURRED_$$rngStates;
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
  modifies _WRITE_HAS_OCCURRED_$$paths, _WRITE_READ_BENIGN_FLAG_$$paths, _WRITE_READ_BENIGN_FLAG_$$paths;



implementation {:source_name "generatePaths<float>"} {:kernel} $_Z13generatePathsIfEvPT_P17curandStateXORWOWPK11AsianOptionIS0_Ejj($numSims: bv32, $numTimesteps: bv32)
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $output.0$1: bv32;
  var $output.0$2: bv32;
  var $s.0$1: bv32;
  var $s.0$2: bv32;
  var $t.0$1: bv32;
  var $t.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v19$1: bv8;
  var v19$2: bv8;
  var v1$1: bv8;
  var v1$2: bv8;
  var v2$1: bv8;
  var v2$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v27$1: bool;
  var v27$2: bool;
  var v5$1: bv8;
  var v5$2: bv8;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bool;
  var v26$2: bool;
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
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    havoc v18$1, v18$2;
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    havoc v22$1, v22$2;
    havoc v23$1, v23$2;
    havoc v24$1, v24$2;
    havoc v25$1, v25$2;
    $$localState$0bv32$1 := v25$1;
    $$localState$0bv32$2 := v25$2;
    $i.0$1 := v0$1;
    $i.0$2 := v0$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b5 ==> BV32_ULT($i.0$1, $numSims) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b5 ==> BV32_ULT($i.0$2, $numSims) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_UGE($i.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_UGE($i.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_ULE($i.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_ULE($i.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SGE($i.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SGE($i.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE($i.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE($i.0$2, v0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), $i.0$1) == BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), $i.0$2) == BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 29} p0$1 ==> true;
    v26$1 := (if p0$1 then BV32_ULT($i.0$1, $numSims) else v26$1);
    v26$2 := (if p0$2 then BV32_ULT($i.0$2, $numSims) else v26$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v26$1 then v26$1 else p1$1);
    p1$2 := (if p0$2 && v26$2 then v26$2 else p1$2);
    p0$1 := (if p0$1 && !v26$1 then v26$1 else p0$1);
    p0$2 := (if p0$2 && !v26$2 then v26$2 else p0$2);
    $output.0$1, $s.0$1, $t.0$1 := (if p1$1 then $i.0$1 else $output.0$1), (if p1$1 then 1065353216bv32 else $s.0$1), (if p1$1 then 0bv32 else $t.0$1);
    $output.0$2, $s.0$2, $t.0$2 := (if p1$2 then $i.0$2 else $output.0$2), (if p1$2 then 1065353216bv32 else $s.0$2), (if p1$2 then 0bv32 else $t.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p2$1 ==> _b11 ==> p2$1 ==> BV32_ULT($i.0$1, $numSims);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p2$2 ==> _b11 ==> p2$2 ==> BV32_ULT($i.0$2, $numSims);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b10 ==> BV32_ULT($i.0$1, $numSims) && BV32_ULT($t.0$1, $numTimesteps) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b10 ==> BV32_ULT($i.0$2, $numSims) && BV32_ULT($t.0$2, $numTimesteps) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b9 ==> BV32_UGE($t.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b9 ==> BV32_UGE($t.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b8 ==> BV32_ULE($t.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b8 ==> BV32_ULE($t.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b7 ==> BV32_SGE($t.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b7 ==> BV32_SGE($t.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b6 ==> BV32_SLE($t.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b6 ==> BV32_SLE($t.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 31} p2$1 ==> true;
    v27$1 := (if p2$1 then BV32_ULT($t.0$1, $numTimesteps) else v27$1);
    v27$2 := (if p2$2 then BV32_ULT($t.0$2, $numTimesteps) else v27$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v27$1 then v27$1 else p3$1);
    p3$2 := (if p2$2 && v27$2 then v27$2 else p3$2);
    p2$1 := (if p2$1 && !v27$1 then v27$1 else p2$1);
    p2$2 := (if p2$2 && !v27$2 then v27$2 else p2$2);
    call {:sourceloc_num 33} v28$1, v28$2 := $_Z19__bugle_random_uintv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    v29$1 := (if p3$1 then $$localState$0bv32$1 else v29$1);
    v29$2 := (if p3$2 then $$localState$0bv32$2 else v29$2);
    $$localState$0bv32$1 := (if p3$1 then BV32_ADD(v29$1, v28$1) else $$localState$0bv32$1);
    $$localState$0bv32$2 := (if p3$2 then BV32_ADD(v29$2, v28$2) else $$localState$0bv32$2);
    call {:sourceloc_num 36} v30$1, v30$2 := $_Z19__bugle_random_uintv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    call {:sourceloc_num 37} v31$1, v31$2 := $_Z20__bugle_random_floatv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z20__bugle_random_floatv"} true;
    call {:sourceloc_num 38} v32$1, v32$2 := $expf(p3$1, FADD32(FMUL32(FSUB32(v4$1 ++ v3$1 ++ v2$1 ++ v1$1, FMUL32(FMUL32(1056964608bv32, v8$1 ++ v7$1 ++ v6$1 ++ v5$1), v12$1 ++ v11$1 ++ v10$1 ++ v9$1)), v16$1 ++ v15$1 ++ v14$1 ++ v13$1), FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v20$1 ++ v19$1 ++ v18$1 ++ v17$1), FSQRT64(FP32_CONV64(v24$1 ++ v23$1 ++ v22$1 ++ v21$1)))), v31$1)), p3$2, FADD32(FMUL32(FSUB32(v4$2 ++ v3$2 ++ v2$2 ++ v1$2, FMUL32(FMUL32(1056964608bv32, v8$2 ++ v7$2 ++ v6$2 ++ v5$2), v12$2 ++ v11$2 ++ v10$2 ++ v9$2)), v16$2 ++ v15$2 ++ v14$2 ++ v13$2), FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v20$2 ++ v19$2 ++ v18$2 ++ v17$2), FSQRT64(FP32_CONV64(v24$2 ++ v23$2 ++ v22$2 ++ v21$2)))), v31$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$expf"} true;
    v33$1 := (if p3$1 then FMUL32($s.0$1, v32$1) else v33$1);
    v33$2 := (if p3$2 then FMUL32($s.0$2, v32$2) else v33$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$paths(p3$1, $output.0$1, v33$1, $$paths[$output.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$paths(p3$2, $output.0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$paths(p3$2, $output.0$2, v33$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$paths"} true;
    $$paths[$output.0$1] := (if p3$1 then v33$1 else $$paths[$output.0$1]);
    $$paths[$output.0$2] := (if p3$2 then v33$2 else $$paths[$output.0$2]);
    $output.0$1, $s.0$1, $t.0$1 := (if p3$1 then BV32_ADD($output.0$1, $numSims) else $output.0$1), (if p3$1 then v33$1 else $s.0$1), (if p3$1 then BV32_ADD($t.0$1, 1bv32) else $t.0$1);
    $output.0$2, $s.0$2, $t.0$2 := (if p3$2 then BV32_ADD($output.0$2, $numSims) else $output.0$2), (if p3$2 then v33$2 else $s.0$2), (if p3$2 then BV32_ADD($t.0$2, 1bv32) else $t.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    $i.0$1 := (if p1$1 then BV32_ADD($i.0$1, BV32_MUL(num_groups_x, group_size_x)) else $i.0$1);
    $i.0$2 := (if p1$2 then BV32_ADD($i.0$2, BV32_MUL(num_groups_x, group_size_x)) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



procedure {:source_name "expf"} $expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z20__bugle_random_floatv"} $_Z20__bugle_random_floatv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z19__bugle_random_uintv"} $_Z19__bugle_random_uintv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



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

var $$localState$0bv32$1: bv32;

var $$localState$0bv32$2: bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

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

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

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



const _WATCHED_VALUE_$$rngStates: bv32;

procedure {:inline 1} _LOG_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rngStates;



implementation {:inline 1} _LOG_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then true else _READ_HAS_OCCURRED_$$rngStates);
    return;
}



procedure _CHECK_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rngStates);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rngStates: bool;

procedure {:inline 1} _LOG_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rngStates, _WRITE_READ_BENIGN_FLAG_$$rngStates;



implementation {:inline 1} _LOG_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then true else _WRITE_HAS_OCCURRED_$$rngStates);
    _WRITE_READ_BENIGN_FLAG_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rngStates);
    return;
}



procedure _CHECK_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates != _value);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates != _value);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rngStates(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rngStates;



implementation {:inline 1} _LOG_ATOMIC_$$rngStates(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rngStates);
    return;
}



procedure _CHECK_ATOMIC_$$rngStates(_P: bool, _offset: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngStates(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rngStates;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngStates(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rngStates := (if _P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rngStates);
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

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
