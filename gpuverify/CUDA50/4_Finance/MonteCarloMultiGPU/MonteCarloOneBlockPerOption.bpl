type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_OptionData"} {:global} $$d_OptionData: [bv32]bv32;

axiom {:array_info "$$d_OptionData"} {:global} {:elem_width 32} {:source_name "d_OptionData"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_OptionData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_OptionData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_OptionData: bool;

var {:source_name "d_CallValue"} {:global} $$d_CallValue: [bv32]bv32;

axiom {:array_info "$$d_CallValue"} {:global} {:elem_width 32} {:source_name "d_CallValue"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_CallValue: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_CallValue: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_CallValue: bool;

var {:source_name "rngStates"} {:global} $$rngStates: [bv32]bv32;

axiom {:array_info "$$rngStates"} {:global} {:elem_width 32} {:source_name "rngStates"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rngStates: bool;

axiom {:array_info "$$localState"} {:elem_width 32} {:source_name "localState"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$sumCall"} {:elem_width 32} {:source_name "sumCall"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$t"} {:elem_width 32} {:source_name "t"} {:source_elem_width 64} {:source_dimensions "1"} true;

var {:source_name "s_SumCall"} {:group_shared} $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:group_shared} {:elem_width 32} {:source_name "s_SumCall"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: bool;

var {:source_name "s_Sum2Call"} {:group_shared} $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:group_shared} {:elem_width 32} {:source_name "s_Sum2Call"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: bool;

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

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "MonteCarloOneBlockPerOption"} {:kernel} $_Z27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWi($pathN: bv32);
  requires !_READ_HAS_OCCURRED_$$d_OptionData && !_WRITE_HAS_OCCURRED_$$d_OptionData && !_ATOMIC_HAS_OCCURRED_$$d_OptionData;
  requires !_READ_HAS_OCCURRED_$$d_CallValue && !_WRITE_HAS_OCCURRED_$$d_CallValue && !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
  requires !_READ_HAS_OCCURRED_$$rngStates && !_WRITE_HAS_OCCURRED_$$rngStates && !_ATOMIC_HAS_OCCURRED_$$rngStates;
  requires !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
  requires !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
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
  modifies $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _READ_HAS_OCCURRED_$$rngStates, _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _WRITE_HAS_OCCURRED_$$rngStates, _WRITE_READ_BENIGN_FLAG_$$rngStates, _WRITE_READ_BENIGN_FLAG_$$rngStates, $$d_CallValue, $$rngStates, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue;



implementation {:source_name "MonteCarloOneBlockPerOption"} {:kernel} $_Z27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWi($pathN: bv32)
{
  var $iSum.0$1: bv32;
  var $iSum.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $pos.i.0$1: bv32;
  var $pos.i.0$2: bv32;
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
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
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
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v20$1: bool;
  var v20$2: bool;
  var v19$1: bv32;
  var v19$2: bv32;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50$1: bv32;
  var v50$2: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bool;
  var v56$2: bool;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
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
  var p14$1: bool;
  var p14$2: bool;
  var p15$1: bool;
  var p15$2: bool;
  var p16$1: bool;
  var p16$2: bool;


  $0:
    v0$1 := $$d_OptionData[BV32_MUL(group_id_x$1, 4bv32)];
    v0$2 := $$d_OptionData[BV32_MUL(group_id_x$2, 4bv32)];
    v1$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 4bv32), 1bv32)];
    v1$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 4bv32), 1bv32)];
    v2$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 4bv32), 2bv32)];
    v2$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 4bv32), 2bv32)];
    v3$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 4bv32), 3bv32)];
    v3$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 4bv32), 3bv32)];
    v4$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x));
    v4$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x));
    call _PRE_WARP_SYNC_$$rngStates_READ(true, true);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$rngStates(true, v4$1, $$rngStates[v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$rngStates(true, v4$2, $$rngStates[v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$rngStates"} true;
    call _POST_WARP_SYNC_$$rngStates_READ(true, true);
    v5$1 := $$rngStates[v4$1];
    v5$2 := $$rngStates[v4$2];
    $$localState$0bv32$1 := v5$1;
    $$localState$0bv32$2 := v5$2;
    $iSum.0$1 := local_id_x$1;
    $iSum.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p7$1 := false;
    p7$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b26 ==> _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b25 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b24 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b23 ==> _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b22 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b21 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b20 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$rngStates;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b19 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$rngStates;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b18 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b17 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b16 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$d_OptionData;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b15 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$d_OptionData;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($iSum.0$1, 256bv32) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($iSum.0$2, 256bv32) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($iSum.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($iSum.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($iSum.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($iSum.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($iSum.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($iSum.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($iSum.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($iSum.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $iSum.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $iSum.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $iSum.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $iSum.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 7} p0$1 ==> true;
    v6$1 := (if p0$1 then BV32_SLT($iSum.0$1, 256bv32) else v6$1);
    v6$2 := (if p0$2 then BV32_SLT($iSum.0$2, 256bv32) else v6$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p6$1 := false;
    p6$2 := false;
    p1$1 := (if p0$1 && v6$1 then v6$1 else p1$1);
    p1$2 := (if p0$2 && v6$2 then v6$2 else p1$2);
    p0$1 := (if p0$1 && !v6$1 then v6$1 else p0$1);
    p0$2 := (if p0$2 && !v6$2 then v6$2 else p0$2);
    $$sumCall$0bv32$1 := (if p1$1 then 0bv32 else $$sumCall$0bv32$1);
    $$sumCall$0bv32$2 := (if p1$2 then 0bv32 else $$sumCall$0bv32$2);
    $$sumCall$1bv32$1 := (if p1$1 then 0bv32 else $$sumCall$1bv32$1);
    $$sumCall$1bv32$2 := (if p1$2 then 0bv32 else $$sumCall$1bv32$2);
    $i.0$1 := (if p1$1 then $iSum.0$1 else $i.0$1);
    $i.0$2 := (if p1$2 then $iSum.0$2 else $i.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 11} p2$1 ==> true;
    v7$1 := (if p2$1 then BV32_SLT($i.0$1, $pathN) else v7$1);
    v7$2 := (if p2$2 then BV32_SLT($i.0$2, $pathN) else v7$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p3$1 := (if p2$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p2$2 && v7$2 then v7$2 else p3$2);
    p2$1 := (if p2$1 && !v7$1 then v7$1 else p2$1);
    p2$2 := (if p2$2 && !v7$2 then v7$2 else p2$2);
    call {:sourceloc_num 13} v8$1, v8$2 := $_Z19__bugle_random_uintv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    v9$1 := (if p3$1 then $$localState$0bv32$1 else v9$1);
    v9$2 := (if p3$2 then $$localState$0bv32$2 else v9$2);
    $$localState$0bv32$1 := (if p3$1 then BV32_ADD(v9$1, v8$1) else $$localState$0bv32$1);
    $$localState$0bv32$2 := (if p3$2 then BV32_ADD(v9$2, v8$2) else $$localState$0bv32$2);
    call {:sourceloc_num 16} v10$1, v10$2 := $_Z19__bugle_random_uintv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    call {:sourceloc_num 17} v11$1, v11$2 := $_Z20__bugle_random_floatv(p3$1, p3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z20__bugle_random_floatv"} true;
    call {:sourceloc_num 18} v12$1, v12$2 := $__expf(p3$1, FADD32(v2$1, FMUL32(v3$1, v11$1)), p3$2, FADD32(v2$2, FMUL32(v3$2, v11$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    v13$1 := (if p3$1 then FSUB32(FMUL32(v0$1, v12$1), v1$1) else v13$1);
    v13$2 := (if p3$2 then FSUB32(FMUL32(v0$2, v12$2), v1$2) else v13$2);
    v14$1 := (if p3$1 then FLT32(0bv32, v13$1) else v14$1);
    v14$2 := (if p3$2 then FLT32(0bv32, v13$2) else v14$2);
    p5$1 := (if p3$1 && v14$1 then v14$1 else p5$1);
    p5$2 := (if p3$2 && v14$2 then v14$2 else p5$2);
    p4$1 := (if p3$1 && !v14$1 then !v14$1 else p4$1);
    p4$2 := (if p3$2 && !v14$2 then !v14$2 else p4$2);
    $0$1 := (if p4$1 then 0bv32 else $0$1);
    $0$2 := (if p4$2 then 0bv32 else $0$2);
    $0$1 := (if p5$1 then v13$1 else $0$1);
    $0$2 := (if p5$2 then v13$2 else $0$2);
    v15$1 := (if p3$1 then $$sumCall$0bv32$1 else v15$1);
    v15$2 := (if p3$2 then $$sumCall$0bv32$2 else v15$2);
    $$sumCall$0bv32$1 := (if p3$1 then FADD32(v15$1, $0$1) else $$sumCall$0bv32$1);
    $$sumCall$0bv32$2 := (if p3$2 then FADD32(v15$2, $0$2) else $$sumCall$0bv32$2);
    v16$1 := (if p3$1 then $$sumCall$1bv32$1 else v16$1);
    v16$2 := (if p3$2 then $$sumCall$1bv32$2 else v16$2);
    $$sumCall$1bv32$1 := (if p3$1 then FADD32(v16$1, FMUL32($0$1, $0$1)) else $$sumCall$1bv32$1);
    $$sumCall$1bv32$2 := (if p3$2 then FADD32(v16$2, FMUL32($0$2, $0$2)) else $$sumCall$1bv32$2);
    $i.0$1 := (if p3$1 then BV32_ADD($i.0$1, 256bv32) else $i.0$1);
    $i.0$2 := (if p3$2 then BV32_ADD($i.0$2, 256bv32) else $i.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    v17$1 := (if p1$1 then $$sumCall$0bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$sumCall$0bv32$2 else v17$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p1$1, p1$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p1$1, $iSum.0$1, v17$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$iSum.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p1$2, $iSum.0$2);
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p1$2, $iSum.0$2, v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p1$1, p1$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$iSum.0$1] := (if p1$1 then v17$1 else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$iSum.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$iSum.0$2] := (if p1$2 then v17$2 else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$iSum.0$2]);
    v18$1 := (if p1$1 then $$sumCall$1bv32$1 else v18$1);
    v18$2 := (if p1$2 then $$sumCall$1bv32$2 else v18$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p1$1, p1$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p1$1, $iSum.0$1, v18$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$iSum.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p1$2, $iSum.0$2);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p1$2, $iSum.0$2, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p1$1, p1$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$iSum.0$1] := (if p1$1 then v18$1 else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$iSum.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$iSum.0$2] := (if p1$2 then v18$2 else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$iSum.0$2]);
    $iSum.0$1 := (if p1$1 then BV32_ADD($iSum.0$1, group_size_x) else $iSum.0$1);
    $iSum.0$2 := (if p1$2 then BV32_ADD($iSum.0$2, group_size_x) else $iSum.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    v19$1 := $$localState$0bv32$1;
    v19$2 := $$localState$0bv32$2;
    call _PRE_WARP_SYNC_$$rngStates_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$rngStates(true, v4$1, v19$1, $$rngStates[v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngStates(true, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$rngStates(true, v4$2, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$rngStates"} true;
    call _POST_WARP_SYNC_$$rngStates_WRITE(true, true);
    $$rngStates[v4$1] := v19$1;
    $$rngStates[v4$2] := v19$2;
    $pos.i.0$1 := local_id_x$1;
    $pos.i.0$2 := local_id_x$2;
    p7$1 := true;
    p7$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$11_0;

  __partitioned_block_$11_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b83 ==> _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b82 ==> _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 32bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 16bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 8bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 4bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 2bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 1bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 64bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 128bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b81 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b80 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:tag "nowrite"} _b79 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:tag "noread"} _b78 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b77 ==> _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b76 ==> _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 32bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 16bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 8bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 4bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 2bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 1bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 64bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, 128bv32)) || BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b75 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b74 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:tag "nowrite"} _b73 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:tag "noread"} _b72 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b71 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$rngStates;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b70 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$rngStates;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b69 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b68 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b67 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_WRITE_HAS_OCCURRED_$$d_OptionData;
    assert {:do_not_predicate} {:tag "sameWarpNoAccess"} _b66 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32) ==> !_READ_HAS_OCCURRED_$$d_OptionData;
    assert {:tag "predicatedEquality"} _b65 ==> p7$1 && p7$2 ==> v55$1 == v55$2;
    assert {:tag "predicatedEquality"} _b64 ==> p7$1 && p7$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b63 ==> p7$1 && p7$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b62 ==> p7$1 && p7$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b61 ==> p7$1 && p7$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b60 ==> p7$1 && p7$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b59 ==> p7$1 && p7$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b58 ==> p7$1 && p7$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b57 ==> p7$1 && p7$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b56 ==> p7$1 && p7$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b55 ==> p7$1 && p7$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b54 ==> p7$1 && p7$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b53 ==> p7$1 && p7$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b52 ==> p7$1 && p7$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b51 ==> p7$1 && p7$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b50 ==> p7$1 && p7$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b49 ==> p7$1 && p7$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b48 ==> p7$1 && p7$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b47 ==> p7$1 && p7$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b46 ==> p7$1 && p7$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b45 ==> p7$1 && p7$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b44 ==> p7$1 && p7$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b43 ==> p7$1 && p7$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b42 ==> p7$1 && p7$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b41 ==> p7$1 && p7$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b40 ==> p7$1 && p7$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b39 ==> p7$1 && p7$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b38 ==> p7$1 && p7$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b37 ==> p7$1 && p7$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b36 ==> p7$1 && p7$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b35 ==> p7$1 && p7$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b34 ==> p7$1 && p7$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b33 ==> p7$1 && p7$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b32 ==> p7$1 && p7$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b31 ==> p7$1 && p7$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b30 ==> p7$1 && p7$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b29 ==> p7$1 && p7$2 ==> $pos.i.0$1 == $pos.i.0$2;
    assert {:tag "loopPredicateEquality"} _b28 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p7$1 == p7$2;
    assert {:tag "loopPredicateEquality"} _b27 ==> p7$1 == p7$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b14 ==> BV32_SLT($pos.i.0$1, 256bv32) ==> p7$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b14 ==> BV32_SLT($pos.i.0$2, 256bv32) ==> p7$2;
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b13 ==> BV32_UGE($pos.i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b13 ==> BV32_UGE($pos.i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b12 ==> BV32_ULE($pos.i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b12 ==> BV32_ULE($pos.i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b11 ==> BV32_SGE($pos.i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b11 ==> BV32_SGE($pos.i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b10 ==> BV32_SLE($pos.i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b10 ==> BV32_SLE($pos.i.0$2, local_id_x$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p7$1 ==> _b9 ==> BV32_SUB($pos.i.0$1, local_id_x$1) == BV32_SUB($pos.i.0$2, local_id_x$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p7$2 ==> _b9 ==> BV32_SUB($pos.i.0$2, local_id_x$2) == BV32_SUB($pos.i.0$1, local_id_x$1);
    assert {:tag "guardNonNeg"} {:thread 1} p7$1 ==> _b8 ==> BV32_SLE(0bv32, $pos.i.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p7$2 ==> _b8 ==> BV32_SLE(0bv32, $pos.i.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p7$1 ==> _b7 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $pos.i.0$1) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p7$2 ==> _b7 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $pos.i.0$2) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 36} p7$1 ==> true;
    v20$1 := (if p7$1 then BV32_SLT($pos.i.0$1, 256bv32) else v20$1);
    v20$2 := (if p7$2 then BV32_SLT($pos.i.0$2, 256bv32) else v20$2);
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p8$1 := (if p7$1 && v20$1 then v20$1 else p8$1);
    p8$2 := (if p7$2 && v20$2 then v20$2 else p8$2);
    p7$1 := (if p7$1 && !v20$1 then v20$1 else p7$1);
    p7$2 := (if p7$2 && !v20$2 then v20$2 else p7$2);
    goto __partitioned_block_$11_1;

  __partitioned_block_$11_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_0(1bv1, 1bv1, p8$1, p8$2);
    v21$1 := (if p8$1 then BV32_SLT($pos.i.0$1, 128bv32) else v21$1);
    v21$2 := (if p8$2 then BV32_SLT($pos.i.0$2, 128bv32) else v21$2);
    p10$1 := (if p8$1 && v21$1 then v21$1 else p10$1);
    p10$2 := (if p8$2 && v21$2 then v21$2 else p10$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$1, BV32_ADD($pos.i.0$1, 128bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 128bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$2, BV32_ADD($pos.i.0$2, 128bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 128bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p10$1, p10$2);
    v22$1 := (if p10$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 128bv32)] else v22$1);
    v22$2 := (if p10$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 128bv32)] else v22$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p10$1, p10$2);
    v23$1 := (if p10$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v23$1);
    v23$2 := (if p10$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v23$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$1, $pos.i.0$1, FADD32(v23$1, v22$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p10$2, $pos.i.0$2, FADD32(v23$2, v22$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p10$1, p10$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p10$1 then FADD32(v23$1, v22$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p10$2 then FADD32(v23$2, v22$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$1, BV32_ADD($pos.i.0$1, 128bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 128bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$2, BV32_ADD($pos.i.0$2, 128bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 128bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p10$1, p10$2);
    v24$1 := (if p10$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 128bv32)] else v24$1);
    v24$2 := (if p10$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 128bv32)] else v24$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 44} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p10$1, p10$2);
    v25$1 := (if p10$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v25$1);
    v25$2 := (if p10$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v25$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p10$1, p10$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$1, $pos.i.0$1, FADD32(v25$1, v24$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p10$2, $pos.i.0$2, FADD32(v25$2, v24$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p10$1, p10$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p10$1 then FADD32(v25$1, v24$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p10$2 then FADD32(v25$2, v24$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    goto __partitioned_block_$11_2;

  __partitioned_block_$11_2:
    call {:sourceloc_num 47} $bugle_barrier_duplicated_1(1bv1, 1bv1, p8$1, p8$2);
    v26$1 := (if p8$1 then BV32_SLT($pos.i.0$1, 64bv32) else v26$1);
    v26$2 := (if p8$2 then BV32_SLT($pos.i.0$2, 64bv32) else v26$2);
    p12$1 := (if p8$1 && v26$1 then v26$1 else p12$1);
    p12$2 := (if p8$2 && v26$2 then v26$2 else p12$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$1, BV32_ADD($pos.i.0$1, 64bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 64bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$2, BV32_ADD($pos.i.0$2, 64bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 64bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p12$1, p12$2);
    v27$1 := (if p12$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 64bv32)] else v27$1);
    v27$2 := (if p12$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 64bv32)] else v27$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p12$1, p12$2);
    v28$1 := (if p12$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v28$1);
    v28$2 := (if p12$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v28$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$1, $pos.i.0$1, FADD32(v28$1, v27$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p12$2, $pos.i.0$2, FADD32(v28$2, v27$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p12$1, p12$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p12$1 then FADD32(v28$1, v27$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p12$2 then FADD32(v28$2, v27$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$1, BV32_ADD($pos.i.0$1, 64bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 64bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$2, BV32_ADD($pos.i.0$2, 64bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 64bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p12$1, p12$2);
    v29$1 := (if p12$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 64bv32)] else v29$1);
    v29$2 := (if p12$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 64bv32)] else v29$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p12$1, p12$2);
    v30$1 := (if p12$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v30$1);
    v30$2 := (if p12$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v30$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p12$1, p12$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$1, $pos.i.0$1, FADD32(v30$1, v29$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p12$2, $pos.i.0$2, FADD32(v30$2, v29$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p12$1, p12$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p12$1 then FADD32(v30$1, v29$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p12$2 then FADD32(v30$2, v29$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    goto __partitioned_block_$11_3;

  __partitioned_block_$11_3:
    call {:sourceloc_num 56} $bugle_barrier_duplicated_2(1bv1, 1bv1, p8$1, p8$2);
    v31$1 := (if p8$1 then BV32_SLT($pos.i.0$1, 32bv32) else v31$1);
    v31$2 := (if p8$2 then BV32_SLT($pos.i.0$2, 32bv32) else v31$2);
    p14$1 := (if p8$1 && v31$1 then v31$1 else p14$1);
    p14$2 := (if p8$2 && v31$2 then v31$2 else p14$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 32bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 32bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 32bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 32bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v32$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 32bv32)] else v32$1);
    v32$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 32bv32)] else v32$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v33$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v33$1);
    v33$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v33$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v33$1, v32$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v33$2, v32$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v33$1, v32$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v33$2, v32$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 32bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 32bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 32bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 32bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v34$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 32bv32)] else v34$1);
    v34$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 32bv32)] else v34$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v35$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v35$1);
    v35$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v35$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v35$1, v34$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v35$2, v34$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v35$1, v34$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v35$2, v34$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 16bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 16bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 16bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 16bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v36$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 16bv32)] else v36$1);
    v36$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 16bv32)] else v36$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v37$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v37$1);
    v37$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v37$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v37$1, v36$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v37$2, v36$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v37$1, v36$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v37$2, v36$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 16bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 16bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 67} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 16bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 16bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v38$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 16bv32)] else v38$1);
    v38$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 16bv32)] else v38$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 68} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 68} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v39$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v39$1);
    v39$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v39$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 69} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v39$1, v38$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 69} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v39$2, v38$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v39$1, v38$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v39$2, v38$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 70} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 8bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 70} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 8bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v40$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 8bv32)] else v40$1);
    v40$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 8bv32)] else v40$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v41$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v41$1);
    v41$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v41$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 72} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v41$1, v40$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 72} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v41$2, v40$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v41$1, v40$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v41$2, v40$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 8bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 8bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v42$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 8bv32)] else v42$1);
    v42$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 8bv32)] else v42$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 74} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 74} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v43$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v43$1);
    v43$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v43$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 75} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v43$1, v42$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 75} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v43$2, v42$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v43$1, v42$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v43$2, v42$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 4bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 4bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v44$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 4bv32)] else v44$1);
    v44$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 4bv32)] else v44$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v45$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v45$1);
    v45$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v45$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 78} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v45$1, v44$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 78} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v45$2, v44$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v45$1, v44$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v45$2, v44$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 4bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 4bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v46$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 4bv32)] else v46$1);
    v46$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 4bv32)] else v46$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v47$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v47$1);
    v47$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v47$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 81} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v47$1, v46$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 81} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v47$2, v46$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v47$1, v46$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v47$2, v46$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 82} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 2bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 82} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 82} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 2bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v48$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 2bv32)] else v48$1);
    v48$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 2bv32)] else v48$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 83} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 83} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v49$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v49$1);
    v49$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v49$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 84} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v49$1, v48$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 84} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v49$2, v48$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v49$1, v48$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v49$2, v48$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 2bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 85} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 2bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v50$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 2bv32)] else v50$1);
    v50$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 2bv32)] else v50$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 86} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 86} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v51$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v51$1);
    v51$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v51$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v51$1, v50$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v51$2, v50$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v51$1, v50$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v51$2, v50$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 88} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, BV32_ADD($pos.i.0$1, 1bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 88} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, BV32_ADD($pos.i.0$2, 1bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v52$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][BV32_ADD($pos.i.0$1, 1bv32)] else v52$1);
    v52$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 1bv32)] else v52$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 89} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 89} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p14$1, p14$2);
    v53$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] else v53$1);
    v53$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v53$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 90} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$1, $pos.i.0$1, FADD32(v53$1, v52$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 90} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p14$2, $pos.i.0$2, FADD32(v53$2, v52$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v53$1, v52$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v53$2, v52$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, BV32_ADD($pos.i.0$1, 1bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, BV32_ADD($pos.i.0$2, 1bv32), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v54$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][BV32_ADD($pos.i.0$1, 1bv32)] else v54$1);
    v54$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($pos.i.0$2, 1bv32)] else v54$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 92} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 92} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p14$1, p14$2);
    v55$1 := (if p14$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] else v55$1);
    v55$2 := (if p14$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] else v55$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$1, $pos.i.0$1, FADD32(v55$1, v54$1), $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 93} _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p14$2, $pos.i.0$2, FADD32(v55$2, v54$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(p14$1, p14$2);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1] := (if p14$1 then FADD32(v55$1, v54$1) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][$pos.i.0$1]);
    $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2] := (if p14$2 then FADD32(v55$2, v54$2) else $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.i.0$2]);
    $pos.i.0$1 := (if p8$1 then BV32_ADD($pos.i.0$1, 256bv32) else $pos.i.0$1);
    $pos.i.0$2 := (if p8$2 then BV32_ADD($pos.i.0$2, 256bv32) else $pos.i.0$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $11.backedge, $11.tail;

  $11.tail:
    assume !p7$1 && !p7$2;
    v56$1 := local_id_x$1 == 0bv32;
    v56$2 := local_id_x$2 == 0bv32;
    p15$1 := (if v56$1 then v56$1 else p15$1);
    p15$2 := (if v56$2 then v56$2 else p15$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 97} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p15$1, 0bv32, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 97} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(p15$2, 0bv32, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(p15$1, p15$2);
    v57$1 := (if p15$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[1bv1][0bv32] else v57$1);
    v57$2 := (if p15$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v57$2);
    $$t$0bv32$1 := (if p15$1 then v57$1 else $$t$0bv32$1);
    $$t$0bv32$2 := (if p15$2 then v57$2 else $$t$0bv32$2);
    call _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 99} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p15$1, 0bv32, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 99} _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(p15$2, 0bv32, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} true;
    call _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(p15$1, p15$2);
    v58$1 := (if p15$1 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[1bv1][0bv32] else v58$1);
    v58$2 := (if p15$2 then $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v58$2);
    $$t$1bv32$1 := (if p15$1 then v58$1 else $$t$1bv32$1);
    $$t$1bv32$2 := (if p15$2 then v58$2 else $$t$1bv32$2);
    v59$1 := (if p15$1 then $$t$0bv32$1 else v59$1);
    v59$2 := (if p15$2 then $$t$0bv32$2 else v59$2);
    call _PRE_WARP_SYNC_$$d_CallValue_WRITE(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 102} _LOG_WRITE_$$d_CallValue(p15$1, BV32_MUL(group_id_x$1, 2bv32), v59$1, $$d_CallValue[BV32_MUL(group_id_x$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(p15$2, BV32_MUL(group_id_x$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 102} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 102} _CHECK_WRITE_$$d_CallValue(p15$2, BV32_MUL(group_id_x$2, 2bv32), v59$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallValue"} true;
    call _POST_WARP_SYNC_$$d_CallValue_WRITE(p15$1, p15$2);
    $$d_CallValue[BV32_MUL(group_id_x$1, 2bv32)] := (if p15$1 then v59$1 else $$d_CallValue[BV32_MUL(group_id_x$1, 2bv32)]);
    $$d_CallValue[BV32_MUL(group_id_x$2, 2bv32)] := (if p15$2 then v59$2 else $$d_CallValue[BV32_MUL(group_id_x$2, 2bv32)]);
    v60$1 := (if p15$1 then $$t$1bv32$1 else v60$1);
    v60$2 := (if p15$2 then $$t$1bv32$2 else v60$2);
    call _PRE_WARP_SYNC_$$d_CallValue_WRITE(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 104} _LOG_WRITE_$$d_CallValue(p15$1, BV32_ADD(BV32_MUL(group_id_x$1, 2bv32), 1bv32), v60$1, $$d_CallValue[BV32_ADD(BV32_MUL(group_id_x$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(p15$2, BV32_ADD(BV32_MUL(group_id_x$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 104} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 104} _CHECK_WRITE_$$d_CallValue(p15$2, BV32_ADD(BV32_MUL(group_id_x$2, 2bv32), 1bv32), v60$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallValue"} true;
    call _POST_WARP_SYNC_$$d_CallValue_WRITE(p15$1, p15$2);
    $$d_CallValue[BV32_ADD(BV32_MUL(group_id_x$1, 2bv32), 1bv32)] := (if p15$1 then v60$1 else $$d_CallValue[BV32_ADD(BV32_MUL(group_id_x$1, 2bv32), 1bv32)]);
    $$d_CallValue[BV32_ADD(BV32_MUL(group_id_x$2, 2bv32), 1bv32)] := (if p15$2 then v60$2 else $$d_CallValue[BV32_ADD(BV32_MUL(group_id_x$2, 2bv32), 1bv32)]);
    return;

  $11.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$11_0;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $3;
}



procedure {:source_name "_Z20__bugle_random_floatv"} $_Z20__bugle_random_floatv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z19__bugle_random_uintv"} $_Z19__bugle_random_uintv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "__expf"} $__expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, $$d_CallValue, $$rngStates, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, $$d_CallValue, $$rngStates, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, $$d_CallValue, $$rngStates, _TRACKING;



var $$localState$0bv32$1: bv32;

var $$localState$0bv32$2: bv32;

var $$sumCall$0bv32$1: bv32;

var $$sumCall$0bv32$2: bv32;

var $$sumCall$1bv32$1: bv32;

var $$sumCall$1bv32$2: bv32;

var $$t$0bv32$1: bv32;

var $$t$0bv32$2: bv32;

var $$t$1bv32$1: bv32;

var $$t$1bv32$2: bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

procedure {:inline 1} _PRE_WARP_SYNC_$$rngStates_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$rngStates_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$rngStates_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$rngStates_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$d_CallValue_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$d_CallValue_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(_P$1: bool, _P$2: bool);



const _WATCHED_VALUE_$$d_OptionData: bv32;

procedure {:inline 1} _LOG_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_OptionData;



implementation {:inline 1} _LOG_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then true else _READ_HAS_OCCURRED_$$d_OptionData);
    return;
}



procedure _CHECK_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_OptionData: bool;

procedure {:inline 1} _LOG_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_OptionData, _WRITE_READ_BENIGN_FLAG_$$d_OptionData;



implementation {:inline 1} _LOG_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then true else _WRITE_HAS_OCCURRED_$$d_OptionData);
    _WRITE_READ_BENIGN_FLAG_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
    return;
}



procedure _CHECK_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData != _value);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData != _value);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_OptionData;



implementation {:inline 1} _LOG_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_OptionData);
    return;
}



procedure _CHECK_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionData(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_OptionData;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionData(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_OptionData := (if _P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
    return;
}



const _WATCHED_VALUE_$$d_CallValue: bv32;

procedure {:inline 1} _LOG_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_CallValue;



implementation {:inline 1} _LOG_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then true else _READ_HAS_OCCURRED_$$d_CallValue);
    return;
}



procedure _CHECK_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_CallValue: bool;

procedure {:inline 1} _LOG_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue;



implementation {:inline 1} _LOG_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then true else _WRITE_HAS_OCCURRED_$$d_CallValue);
    _WRITE_READ_BENIGN_FLAG_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
    return;
}



procedure _CHECK_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue != _value);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue != _value);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_CallValue;



implementation {:inline 1} _LOG_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_CallValue);
    return;
}



procedure _CHECK_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_CallValue;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_CallValue := (if _P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
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



const _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;



implementation {:inline 1} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall == _value then true else _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall);
    return;
}



procedure _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;



implementation {:inline 1} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall);
    return;
}



procedure _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_SumCall"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall);
    return;
}



const _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;



implementation {:inline 1} _LOG_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call == _value then true else _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call);
    return;
}



procedure _CHECK_READ_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call, _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;



implementation {:inline 1} _LOG_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call);
    return;
}



procedure _CHECK_WRITE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Sum2Call"} {:array "$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$rngStates;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$rngStates;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon4;

  anon4:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon5;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$rngStates;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$rngStates;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon4;

  anon4:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon5;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$rngStates;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$rngStates;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$rngStates;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon4;

  anon4:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon5;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

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

implementation {:inline 1} _PRE_WARP_SYNC_$$rngStates_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$rngStates;
    assume !_ATOMIC_HAS_OCCURRED_$$rngStates;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$rngStates_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$rngStates;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$rngStates_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$rngStates;
    assume !_WRITE_HAS_OCCURRED_$$rngStates;
    assume !_ATOMIC_HAS_OCCURRED_$$rngStates;
    goto anon0;

  anon0:
    havoc $$rngStates;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$rngStates_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$rngStates;
    goto anon0;

  anon0:
    havoc $$rngStates;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$d_CallValue_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$d_CallValue;
    assume !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon0;

  anon0:
    havoc $$d_CallValue;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$d_CallValue_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$d_CallValue;
    goto anon0;

  anon0:
    havoc $$d_CallValue;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon0;

  anon0:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    goto anon0;

  anon0:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE9s_SumCall;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon0;

  anon0:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    goto anon0;

  anon0:
    havoc $$_ZZ27MonteCarloOneBlockPerOptionP13__TOptionDataP14__TOptionValueP17curandStateXORWOWiE10s_Sum2Call;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}


