type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "shared"} {:group_shared} $$shared: [bv1][bv32]bv32;

axiom {:array_info "$$shared"} {:group_shared} {:elem_width 32} {:source_name "shared"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$shared: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$shared: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$shared: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FP32_TO_UI32(bv32) : bv32;

function FPOW32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "QuasiRandomSequence"} {:kernel} $QuasiRandomSequence();
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$shared && !_WRITE_HAS_OCCURRED_$$shared && !_ATOMIC_HAS_OCCURRED_$$shared;
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
  modifies $$shared, _WRITE_HAS_OCCURRED_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared, $$output, _TRACKING, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _READ_HAS_OCCURRED_$$shared;



implementation {:source_name "QuasiRandomSequence"} {:kernel} $QuasiRandomSequence()
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $temp.0$1: bv128;
  var $temp.0$2: bv128;
  var $k.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
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
  var v11: bool;
  var v12: bv32;
  var v13: bv32;
  var v14: bv32;
  var v15: bv32;
  var v16: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v17: bv32;
  var v18: bv32;
  var v19: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v69$1: bv32;
  var v69$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
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
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73$1: bv32;
  var v73$2: bv32;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76$1: bv32;
  var v76$2: bv32;
  var v77$1: bv32;
  var v77$2: bv32;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bv32;
  var v83$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
  var v87: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := local_id_x$1 == 0bv32;
    v1$2 := local_id_x$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    $i.0$1 := (if p0$1 then 0bv32 else $i.0$1);
    $i.0$2 := (if p0$2 then 0bv32 else $i.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b16 ==> _WRITE_HAS_OCCURRED_$$shared ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b15 ==> _WRITE_HAS_OCCURRED_$$shared ==> local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p1$1 ==> _b14 ==> p1$1 ==> local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p1$2 ==> _b14 ==> p1$2 ==> local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b13 ==> local_id_x$1 == 0bv32 && BV32_SLT($i.0$1, 8bv32) ==> p1$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b13 ==> local_id_x$2 == 0bv32 && BV32_SLT($i.0$2, 8bv32) ==> p1$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b12 ==> local_id_x$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$input;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b11 ==> local_id_x$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b10 ==> local_id_x$1 != 0bv32 ==> !p1$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b10 ==> local_id_x$2 != 0bv32 ==> !p1$2;
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b9 ==> BV32_UGE($i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b9 ==> BV32_UGE($i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b8 ==> BV32_ULE($i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b8 ==> BV32_ULE($i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b7 ==> BV32_SGE($i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b7 ==> BV32_SGE($i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b6 ==> BV32_SLE($i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b6 ==> BV32_SLE($i.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p1$1 ==> _b5 ==> BV32_SLE(0bv32, $i.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p1$2 ==> _b5 ==> BV32_SLE(0bv32, $i.0$2);
    assert {:block_sourceloc} {:sourceloc_num 2} p1$1 ==> true;
    v2$1 := (if p1$1 then BV32_SLT($i.0$1, 8bv32) else v2$1);
    v2$2 := (if p1$2 then BV32_SLT($i.0$2, 8bv32) else v2$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v2$1 then v2$1 else p2$1);
    p2$2 := (if p1$2 && v2$2 then v2$2 else p2$2);
    p1$1 := (if p1$1 && !v2$1 then v2$1 else p1$1);
    p1$2 := (if p1$2 && !v2$2 then v2$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p2$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p2$2 then _HAVOC_bv32$2 else v3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p2$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p2$2 then _HAVOC_bv32$2 else v4$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p2$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p2$2 then _HAVOC_bv32$2 else v5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p2$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p2$2 then _HAVOC_bv32$2 else v6$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$shared(p2$1, BV32_MUL($i.0$1, 4bv32), v3$1, $$shared[1bv1][BV32_MUL($i.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p2$2, BV32_MUL($i.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$shared(p2$2, BV32_MUL($i.0$2, 4bv32), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][BV32_MUL($i.0$1, 4bv32)] := (if p2$1 then v3$1 else $$shared[1bv1][BV32_MUL($i.0$1, 4bv32)]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($i.0$2, 4bv32)] := (if p2$2 then v3$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($i.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$shared(p2$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32), v4$1, $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)] := (if p2$1 then v4$1 else $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)] := (if p2$2 then v4$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$shared(p2$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32), v5$1, $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)] := (if p2$1 then v5$1 else $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)] := (if p2$2 then v5$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$shared(p2$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32), v6$1, $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$shared(p2$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)] := (if p2$1 then v6$1 else $$shared[1bv1][BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)] := (if p2$2 then v6$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)]);
    $i.0$1 := (if p2$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1);
    $i.0$2 := (if p2$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, __partitioned_block_$2.tail_0;

  __partitioned_block_$2.tail_0:
    assume !p1$1 && !p1$2;
    goto __partitioned_block_$2.tail_1;

  __partitioned_block_$2.tail_1:
    call {:sourceloc_num 15} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v7$1 := BV32_MUL(local_id_x$1, 4bv32);
    v7$2 := BV32_MUL(local_id_x$2, 4bv32);
    v8$1 := BV32_ADD(v7$1, 1bv32);
    v8$2 := BV32_ADD(v7$2, 1bv32);
    v9$1 := BV32_ADD(v7$1, 2bv32);
    v9$2 := BV32_ADD(v7$2, 2bv32);
    v10$1 := BV32_ADD(v7$1, 3bv32);
    v10$2 := BV32_ADD(v7$2, 3bv32);
    $temp.0$1, $k.0 := 0bv128, 0bv32;
    $temp.0$2 := 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _READ_HAS_OCCURRED_$$shared ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($k.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $k.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $k.0);
    assert {:block_sourceloc} {:sourceloc_num 16} true;
    v11 := BV32_SLT($k.0, 8bv32);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v11 && !v11;
    v87 := FPOW32(1073741824bv32, 1107296256bv32);
    call {:sourceloc} {:sourceloc_num 84} _LOG_WRITE_$$output(true, BV32_MUL(v0$1, 4bv32), FDIV32(UI32_TO_FP32($temp.0$1[32:0]), v87), $$output[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 84} _CHECK_WRITE_$$output(true, BV32_MUL(v0$2, 4bv32), FDIV32(UI32_TO_FP32($temp.0$2[32:0]), v87));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v0$1, 4bv32)] := FDIV32(UI32_TO_FP32($temp.0$1[32:0]), v87);
    $$output[BV32_MUL(v0$2, 4bv32)] := FDIV32(UI32_TO_FP32($temp.0$2[32:0]), v87);
    call {:sourceloc} {:sourceloc_num 85} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), FDIV32(UI32_TO_FP32($temp.0$1[64:32]), v87), $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 85} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), FDIV32(UI32_TO_FP32($temp.0$2[64:32]), v87));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := FDIV32(UI32_TO_FP32($temp.0$1[64:32]), v87);
    $$output[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := FDIV32(UI32_TO_FP32($temp.0$2[64:32]), v87);
    call {:sourceloc} {:sourceloc_num 86} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), FDIV32(UI32_TO_FP32($temp.0$1[96:64]), v87), $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 86} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), FDIV32(UI32_TO_FP32($temp.0$2[96:64]), v87));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := FDIV32(UI32_TO_FP32($temp.0$1[96:64]), v87);
    $$output[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := FDIV32(UI32_TO_FP32($temp.0$2[96:64]), v87);
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), FDIV32(UI32_TO_FP32($temp.0$1[128:96]), v87), $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), FDIV32(UI32_TO_FP32($temp.0$2[128:96]), v87));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := FDIV32(UI32_TO_FP32($temp.0$1[128:96]), v87);
    $$output[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := FDIV32(UI32_TO_FP32($temp.0$2[128:96]), v87);
    return;

  $truebb1:
    assume {:partition} v11 && v11;
    v12 := BV32_MUL($k.0, 4bv32);
    v13 := BV32_ADD(v12, 1bv32);
    v14 := BV32_ADD(v12, 2bv32);
    v15 := BV32_ADD(v12, 3bv32);
    v16 := FP32_TO_UI32(FPOW32(1073741824bv32, UI32_TO_FP32(v12)));
    v17 := FP32_TO_UI32(FPOW32(1073741824bv32, UI32_TO_FP32(v13)));
    v18 := FP32_TO_UI32(FPOW32(1073741824bv32, UI32_TO_FP32(v14)));
    v19 := FP32_TO_UI32(FPOW32(1073741824bv32, UI32_TO_FP32(v15)));
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v20$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v20$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v21$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v21$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v22$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v22$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v23$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v23$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v24$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v24$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v25$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v25$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v26$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v26$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v27$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v27$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v28$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v28$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v29$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v29$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v30$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v30$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v31$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v31$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v32$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v32$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v33$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v33$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v34$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v34$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v35$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v35$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v36$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v36$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v37$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v37$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v38$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v38$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v39$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v39$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v40$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v40$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v41$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v41$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v42$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v42$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v43$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v43$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v44$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v44$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v45$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v45$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 44} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 44} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v46$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v46$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v47$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v47$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v48$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v48$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 47} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 47} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v49$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v49$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v50$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v50$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v51$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v51$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v52$1 := $temp.0$1[64:32];
    v52$2 := $temp.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v53$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v53$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v54$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v54$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v55$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v55$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v56$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v56$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v57$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v57$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v58$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v58$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v59$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v59$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v60$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v60$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v61$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v61$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v62$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v62$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v63$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v63$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v64$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v64$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v65$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v65$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v66$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v66$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v67$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v67$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v68$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v68$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v69$1 := $temp.0$1[96:64];
    v69$2 := $temp.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v70$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v70$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 67} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 67} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v71$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v71$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 68} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 68} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v72$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v72$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 69} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 69} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v73$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v73$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 70} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 70} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v74$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v74$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v75$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v75$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v76$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v76$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v77$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v77$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 74} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 74} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v78$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v78$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 75} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 75} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v79$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v79$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v80$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v80$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v81$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v81$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 78} _LOG_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[1bv1][BV32_MUL($k.0, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 78} _CHECK_READ_$$shared(true, BV32_MUL($k.0, 4bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v82$1 := $$shared[1bv1][BV32_MUL($k.0, 4bv32)];
    v82$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($k.0, 4bv32)];
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v83$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    v83$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v84$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    v84$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 81} _LOG_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 81} _CHECK_READ_$$shared(true, BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32), $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v85$1 := $$shared[1bv1][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v85$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 4bv32), 3bv32)];
    v86$1 := $temp.0$1[128:96];
    v86$2 := $temp.0$2[128:96];
    $temp.0$1, $k.0 := BV32_XOR(v86$1, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v10$1, v16), BV32_AND(v12, 31bv32)), v70$1), BV32_MUL(BV32_LSHR(BV32_AND(v10$1, v17), BV32_AND(v13, 31bv32)), v75$1)), BV32_MUL(BV32_LSHR(BV32_AND(v10$1, v18), BV32_AND(v14, 31bv32)), v80$1)), BV32_MUL(BV32_LSHR(BV32_AND(v10$1, v19), BV32_AND(v15, 31bv32)), v85$1))) ++ BV32_XOR(v69$1, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v9$1, v16), BV32_AND(v12, 31bv32)), v53$1), BV32_MUL(BV32_LSHR(BV32_AND(v9$1, v17), BV32_AND(v13, 31bv32)), v58$1)), BV32_MUL(BV32_LSHR(BV32_AND(v9$1, v18), BV32_AND(v14, 31bv32)), v63$1)), BV32_MUL(BV32_LSHR(BV32_AND(v9$1, v19), BV32_AND(v15, 31bv32)), v68$1))) ++ BV32_XOR(v52$1, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v8$1, v16), BV32_AND(v12, 31bv32)), v36$1), BV32_MUL(BV32_LSHR(BV32_AND(v8$1, v17), BV32_AND(v13, 31bv32)), v41$1)), BV32_MUL(BV32_LSHR(BV32_AND(v8$1, v18), BV32_AND(v14, 31bv32)), v46$1)), BV32_MUL(BV32_LSHR(BV32_AND(v8$1, v19), BV32_AND(v15, 31bv32)), v51$1))) ++ BV32_XOR($temp.0$1[32:0], BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v7$1, v16), BV32_AND(v12, 31bv32)), v20$1), BV32_MUL(BV32_LSHR(BV32_AND(v7$1, v17), BV32_AND(v13, 31bv32)), v25$1)), BV32_MUL(BV32_LSHR(BV32_AND(v7$1, v18), BV32_AND(v14, 31bv32)), v30$1)), BV32_MUL(BV32_LSHR(BV32_AND(v7$1, v19), BV32_AND(v15, 31bv32)), v35$1))), BV32_ADD($k.0, 1bv32);
    $temp.0$2 := BV32_XOR(v86$2, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v10$2, v16), BV32_AND(v12, 31bv32)), v70$2), BV32_MUL(BV32_LSHR(BV32_AND(v10$2, v17), BV32_AND(v13, 31bv32)), v75$2)), BV32_MUL(BV32_LSHR(BV32_AND(v10$2, v18), BV32_AND(v14, 31bv32)), v80$2)), BV32_MUL(BV32_LSHR(BV32_AND(v10$2, v19), BV32_AND(v15, 31bv32)), v85$2))) ++ BV32_XOR(v69$2, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v9$2, v16), BV32_AND(v12, 31bv32)), v53$2), BV32_MUL(BV32_LSHR(BV32_AND(v9$2, v17), BV32_AND(v13, 31bv32)), v58$2)), BV32_MUL(BV32_LSHR(BV32_AND(v9$2, v18), BV32_AND(v14, 31bv32)), v63$2)), BV32_MUL(BV32_LSHR(BV32_AND(v9$2, v19), BV32_AND(v15, 31bv32)), v68$2))) ++ BV32_XOR(v52$2, BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v8$2, v16), BV32_AND(v12, 31bv32)), v36$2), BV32_MUL(BV32_LSHR(BV32_AND(v8$2, v17), BV32_AND(v13, 31bv32)), v41$2)), BV32_MUL(BV32_LSHR(BV32_AND(v8$2, v18), BV32_AND(v14, 31bv32)), v46$2)), BV32_MUL(BV32_LSHR(BV32_AND(v8$2, v19), BV32_AND(v15, 31bv32)), v51$2))) ++ BV32_XOR($temp.0$2[32:0], BV32_XOR(BV32_XOR(BV32_XOR(BV32_MUL(BV32_LSHR(BV32_AND(v7$2, v16), BV32_AND(v12, 31bv32)), v20$2), BV32_MUL(BV32_LSHR(BV32_AND(v7$2, v17), BV32_AND(v13, 31bv32)), v25$2)), BV32_MUL(BV32_LSHR(BV32_AND(v7$2, v18), BV32_AND(v14, 31bv32)), v30$2)), BV32_MUL(BV32_LSHR(BV32_AND(v7$2, v19), BV32_AND(v15, 31bv32)), v35$2)));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $2.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $2;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$shared, $$output, _TRACKING;



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

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

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



const _WATCHED_VALUE_$$shared: bv32;

procedure {:inline 1} _LOG_READ_$$shared(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$shared;



implementation {:inline 1} _LOG_READ_$$shared(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then true else _READ_HAS_OCCURRED_$$shared);
    return;
}



procedure _CHECK_READ_$$shared(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$shared && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$shared: bool;

procedure {:inline 1} _LOG_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared;



implementation {:inline 1} _LOG_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then true else _WRITE_HAS_OCCURRED_$$shared);
    _WRITE_READ_BENIGN_FLAG_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$shared);
    return;
}



procedure _CHECK_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$shared(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$shared;



implementation {:inline 1} _LOG_ATOMIC_$$shared(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$shared);
    return;
}



procedure _CHECK_ATOMIC_$$shared(_P: bool, _offset: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$shared;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$shared := (if _P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$shared);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shared;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shared;
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
    havoc $$shared;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;
