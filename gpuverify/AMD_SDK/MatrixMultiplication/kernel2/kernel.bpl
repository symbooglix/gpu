type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$matrixA"} {:global} {:elem_width 32} {:source_name "matrixA"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixA: bool;

axiom {:array_info "$$matrixB"} {:global} {:elem_width 32} {:source_name "matrixB"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixB: bool;

var {:source_name "matrixC"} {:global} $$matrixC: [bv32]bv32;

axiom {:array_info "$$matrixC"} {:global} {:elem_width 32} {:source_name "matrixC"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixC: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixC: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixC: bool;

var {:source_name "blockA"} {:group_shared} $$blockA: [bv1][bv32]bv32;

axiom {:array_info "$$blockA"} {:group_shared} {:elem_width 32} {:source_name "blockA"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$blockA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$blockA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$blockA: bool;

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

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "mmmKernel_local"} {:kernel} $mmmKernel_local($widthA: bv32);
  requires !_READ_HAS_OCCURRED_$$matrixA && !_WRITE_HAS_OCCURRED_$$matrixA && !_ATOMIC_HAS_OCCURRED_$$matrixA;
  requires !_READ_HAS_OCCURRED_$$matrixB && !_WRITE_HAS_OCCURRED_$$matrixB && !_ATOMIC_HAS_OCCURRED_$$matrixB;
  requires !_READ_HAS_OCCURRED_$$matrixC && !_WRITE_HAS_OCCURRED_$$matrixC && !_ATOMIC_HAS_OCCURRED_$$matrixC;
  requires !_READ_HAS_OCCURRED_$$blockA && !_WRITE_HAS_OCCURRED_$$blockA && !_ATOMIC_HAS_OCCURRED_$$blockA;
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
  modifies $$blockA, _WRITE_HAS_OCCURRED_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC, _WRITE_HAS_OCCURRED_$$blockA, _WRITE_READ_BENIGN_FLAG_$$blockA, _WRITE_READ_BENIGN_FLAG_$$blockA, $$matrixC, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$blockA;



implementation {:source_name "mmmKernel_local"} {:kernel} $mmmKernel_local($widthA: bv32)
{
  var $sum0.0$1: bv128;
  var $sum0.0$2: bv128;
  var $sum1.0$1: bv128;
  var $sum1.0$2: bv128;
  var $sum2.0$1: bv128;
  var $sum2.0$2: bv128;
  var $sum3.0$1: bv128;
  var $sum3.0$2: bv128;
  var $i.0: bv32;
  var $sum0.1$1: bv128;
  var $sum0.1$2: bv128;
  var $sum1.1$1: bv128;
  var $sum1.1$2: bv128;
  var $sum2.1$1: bv128;
  var $sum2.1$2: bv128;
  var $sum3.1$1: bv128;
  var $sum3.1$2: bv128;
  var $j.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3: bool;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
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
  var v22: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32)));
    v0$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, BV32_SHL(local_id_y$2, 2bv32)));
    v1$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), BV32_MUL(BV32_SHL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 2bv32), BV32_MUL(group_size_x, num_groups_x)));
    v1$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), BV32_MUL(BV32_SHL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 2bv32), BV32_MUL(group_size_x, num_groups_x)));
    v2 := BV32_SDIV($widthA, 4bv32);
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $i.0 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv32;
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2 := 0bv128, 0bv128, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b10 ==> _WRITE_HAS_OCCURRED_$$blockA ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), group_size_x), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), group_size_x), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), group_size_x), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), group_size_x), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(2bv32, group_size_x)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(3bv32, group_size_x)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, BV32_SHL(local_id_y$1, 2bv32))), BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32);
    assert {:tag "nowrite"} _b9 ==> !_WRITE_HAS_OCCURRED_$$blockA;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($i.0, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v3 := BV32_ULT($i.0, BV32_UDIV(v2, group_size_x));
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 75} _LOG_WRITE_$$matrixC(true, BV32_MUL(v1$1, 4bv32), $sum0.0$1[32:0], $$matrixC[BV32_MUL(v1$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(v1$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 75} _CHECK_WRITE_$$matrixC(true, BV32_MUL(v1$2, 4bv32), $sum0.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(v1$1, 4bv32)] := $sum0.0$1[32:0];
    $$matrixC[BV32_MUL(v1$2, 4bv32)] := $sum0.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), $sum0.0$1[64:32], $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), $sum0.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)] := $sum0.0$1[64:32];
    $$matrixC[BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32)] := $sum0.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 77} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), $sum0.0$1[96:64], $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 77} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), $sum0.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)] := $sum0.0$1[96:64];
    $$matrixC[BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32)] := $sum0.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 78} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), $sum0.0$1[128:96], $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 78} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), $sum0.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)] := $sum0.0$1[128:96];
    $$matrixC[BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32)] := $sum0.0$2[128:96];
    call {:sourceloc} {:sourceloc_num 79} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), $sum1.0$1[32:0], $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 79} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), $sum1.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32)] := $sum1.0$1[32:0];
    $$matrixC[BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32)] := $sum1.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 80} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32), $sum1.0$1[64:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 80} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32), $sum1.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32)] := $sum1.0$1[64:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 1bv32)] := $sum1.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 81} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32), $sum1.0$1[96:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 81} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32), $sum1.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32)] := $sum1.0$1[96:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 2bv32)] := $sum1.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 82} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32), $sum1.0$1[128:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 82} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 82} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32), $sum1.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32)] := $sum1.0$1[128:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(group_size_x, num_groups_x)), 4bv32), 3bv32)] := $sum1.0$2[128:96];
    call {:sourceloc} {:sourceloc_num 83} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), $sum2.0$1[32:0], $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 83} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), $sum2.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)] := $sum2.0$1[32:0];
    $$matrixC[BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)] := $sum2.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 84} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32), $sum2.0$1[64:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 84} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32), $sum2.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)] := $sum2.0$1[64:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)] := $sum2.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 85} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32), $sum2.0$1[96:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 85} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32), $sum2.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)] := $sum2.0$1[96:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)] := $sum2.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 86} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32), $sum2.0$1[128:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 86} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32), $sum2.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)] := $sum2.0$1[128:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(2bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)] := $sum2.0$2[128:96];
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), $sum3.0$1[32:0], $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), $sum3.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)] := $sum3.0$1[32:0];
    $$matrixC[BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32)] := $sum3.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 88} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32), $sum3.0$1[64:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 88} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32), $sum3.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)] := $sum3.0$1[64:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 1bv32)] := $sum3.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 89} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32), $sum3.0$1[96:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 89} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32), $sum3.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)] := $sum3.0$1[96:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 2bv32)] := $sum3.0$2[96:64];
    call {:sourceloc} {:sourceloc_num 90} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32), $sum3.0$1[128:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 90} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32), $sum3.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)] := $sum3.0$1[128:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(3bv32, BV32_MUL(group_size_x, num_groups_x))), 4bv32), 3bv32)] := $sum3.0$2[128:96];
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v3 && v3;
    v4$1 := BV32_ADD(BV32_ADD(BV32_MUL($i.0, group_size_x), local_id_x$1), BV32_MUL(BV32_SHL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 2bv32), v2));
    v4$2 := BV32_ADD(BV32_ADD(BV32_MUL($i.0, group_size_x), local_id_x$2), BV32_MUL(BV32_SHL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 2bv32), v2));
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$blockA(true, BV32_MUL(v0$1, 4bv32), v5$1, $$blockA[1bv1][BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$blockA(true, BV32_MUL(v0$2, 4bv32), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_MUL(v0$1, 4bv32)] := v5$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v0$2, 4bv32)] := v5$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v6$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v6$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v6$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v7$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v7$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v7$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v8$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v8$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), v9$1, $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32)] := v9$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32)] := v9$2;
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 1bv32), v10$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 1bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 1bv32)] := v10$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 1bv32)] := v10$2;
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 2bv32), v11$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 2bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 2bv32)] := v11$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 2bv32)] := v11$2;
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 3bv32), v12$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 3bv32), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, group_size_x), 4bv32), 3bv32)] := v12$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, group_size_x), 4bv32), 3bv32)] := v12$2;
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), v13$1, $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32)] := v13$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32)] := v13$2;
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32), v14$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32)] := v14$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 1bv32)] := v14$2;
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32), v15$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32)] := v15$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 2bv32)] := v15$2;
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32), v16$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32)] := v16$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(2bv32, group_size_x)), 4bv32), 3bv32)] := v16$2;
    havoc v17$1, v17$2;
    havoc v18$1, v18$2;
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), v17$1, $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$blockA(true, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32)] := v17$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32)] := v17$2;
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32), v18$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32)] := v18$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 1bv32)] := v18$2;
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32), v19$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32), v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32)] := v19$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 2bv32)] := v19$2;
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32), v20$1, $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$blockA(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32), v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blockA"} true;
    $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32)] := v20$1;
    $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(3bv32, group_size_x)), 4bv32), 3bv32)] := v20$2;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 35} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v21$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), BV32_MUL(BV32_SHL(BV32_MUL($i.0, group_size_x), 2bv32), BV32_MUL(group_size_x, num_groups_x)));
    v21$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), BV32_MUL(BV32_SHL(BV32_MUL($i.0, group_size_x), 2bv32), BV32_MUL(group_size_x, num_groups_x)));
    $sum0.1$1, $sum1.1$1, $sum2.1$1, $sum3.1$1, $j.0 := $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, 0bv32;
    $sum0.1$2, $sum1.1$2, $sum2.1$2, $sum3.1$2 := $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$blockA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_UGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_UGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_ULE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_ULE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b5 ==> BV32_SLE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b5 ==> BV32_SLE($j.0, 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b4 ==> BV32_AND(BV32_SUB(4bv32, 1bv32), $j.0) == BV32_AND(BV32_SUB(4bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b4 ==> BV32_AND(BV32_SUB(4bv32, 1bv32), $j.0) == BV32_AND(BV32_SUB(4bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 36} true;
    v22 := BV32_ULT($j.0, BV32_MUL(group_size_x, 4bv32));
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v22 && !v22;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 72} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $i.0 := $sum0.1$1, $sum1.1$1, $sum2.1$1, $sum3.1$1, BV32_ADD($i.0, 1bv32);
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2 := $sum0.1$2, $sum1.1$2, $sum2.1$2, $sum3.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v22 && v22;
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 38} true;
    v23$1 := $$blockA[1bv1][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$1, 4bv32), group_size_x)), 4bv32)];
    v23$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$2, 4bv32), group_size_x)), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 39} true;
    v24$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$1, 4bv32), group_size_x)), 4bv32), 1bv32)];
    v24$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$2, 4bv32), group_size_x)), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 40} true;
    v25$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$1, 4bv32), group_size_x)), 4bv32), 2bv32)];
    v25$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$2, 4bv32), group_size_x)), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 41} true;
    v26$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$1, 4bv32), group_size_x)), 4bv32), 3bv32)];
    v26$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_MUL(local_id_y$2, 4bv32), group_size_x)), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 42} true;
    v27$1 := $$blockA[1bv1][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 1bv32), group_size_x)), 4bv32)];
    v27$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 1bv32), group_size_x)), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 43} true;
    v28$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 1bv32), group_size_x)), 4bv32), 1bv32)];
    v28$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 1bv32), group_size_x)), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 44} true;
    v29$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 1bv32), group_size_x)), 4bv32), 2bv32)];
    v29$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 1bv32), group_size_x)), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 45} true;
    v30$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 1bv32), group_size_x)), 4bv32), 3bv32)];
    v30$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 1bv32), group_size_x)), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 46} true;
    v31$1 := $$blockA[1bv1][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 2bv32), group_size_x)), 4bv32)];
    v31$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 2bv32), group_size_x)), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 47} true;
    v32$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 2bv32), group_size_x)), 4bv32), 1bv32)];
    v32$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 2bv32), group_size_x)), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 48} true;
    v33$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 2bv32), group_size_x)), 4bv32), 2bv32)];
    v33$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 2bv32), group_size_x)), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 49} true;
    v34$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 2bv32), group_size_x)), 4bv32), 3bv32)];
    v34$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 2bv32), group_size_x)), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 50} true;
    v35$1 := $$blockA[1bv1][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 3bv32), group_size_x)), 4bv32)];
    v35$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 3bv32), group_size_x)), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 51} true;
    v36$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 3bv32), group_size_x)), 4bv32), 1bv32)];
    v36$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 3bv32), group_size_x)), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 52} true;
    v37$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 3bv32), group_size_x)), 4bv32), 2bv32)];
    v37$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 3bv32), group_size_x)), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 53} true;
    v38$1 := $$blockA[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, 4bv32), 3bv32), group_size_x)), 4bv32), 3bv32)];
    v38$2 := $$blockA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ASHR($j.0, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$2, 4bv32), 3bv32), group_size_x)), 4bv32), 3bv32)];
    havoc v39$1, v39$2;
    havoc v40$1, v40$2;
    havoc v41$1, v41$2;
    havoc v42$1, v42$2;
    havoc v43$1, v43$2;
    havoc v44$1, v44$2;
    havoc v45$1, v45$2;
    havoc v46$1, v46$2;
    havoc v47$1, v47$2;
    havoc v48$1, v48$2;
    havoc v49$1, v49$2;
    havoc v50$1, v50$2;
    havoc v51$1, v51$2;
    havoc v52$1, v52$2;
    havoc v53$1, v53$2;
    havoc v54$1, v54$2;
    v55$1 := $sum0.1$1[64:32];
    v55$2 := $sum0.1$2[64:32];
    v56$1 := $sum0.1$1[96:64];
    v56$2 := $sum0.1$2[96:64];
    v57$1 := $sum0.1$1[128:96];
    v57$2 := $sum0.1$2[128:96];
    v58$1 := $sum1.1$1[64:32];
    v58$2 := $sum1.1$2[64:32];
    v59$1 := $sum1.1$1[96:64];
    v59$2 := $sum1.1$2[96:64];
    v60$1 := $sum1.1$1[128:96];
    v60$2 := $sum1.1$2[128:96];
    v61$1 := $sum2.1$1[64:32];
    v61$2 := $sum2.1$2[64:32];
    v62$1 := $sum2.1$1[96:64];
    v62$2 := $sum2.1$2[96:64];
    v63$1 := $sum2.1$1[128:96];
    v63$2 := $sum2.1$2[128:96];
    v64$1 := $sum3.1$1[64:32];
    v64$2 := $sum3.1$2[64:32];
    v65$1 := $sum3.1$1[96:64];
    v65$2 := $sum3.1$2[96:64];
    v66$1 := $sum3.1$1[128:96];
    v66$2 := $sum3.1$2[128:96];
    $sum0.1$1, $sum1.1$1, $sum2.1$1, $sum3.1$1, $j.0 := FADD32(v57$1, FADD32(FMUL32(v26$1, v54$1), FADD32(FMUL32(v25$1, v50$1), FADD32(FMUL32(v23$1, v42$1), FMUL32(v24$1, v46$1))))) ++ FADD32(v56$1, FADD32(FMUL32(v26$1, v53$1), FADD32(FMUL32(v25$1, v49$1), FADD32(FMUL32(v23$1, v41$1), FMUL32(v24$1, v45$1))))) ++ FADD32(v55$1, FADD32(FMUL32(v26$1, v52$1), FADD32(FMUL32(v25$1, v48$1), FADD32(FMUL32(v23$1, v40$1), FMUL32(v24$1, v44$1))))) ++ FADD32($sum0.1$1[32:0], FADD32(FMUL32(v26$1, v51$1), FADD32(FMUL32(v25$1, v47$1), FADD32(FMUL32(v23$1, v39$1), FMUL32(v24$1, v43$1))))), FADD32(v60$1, FADD32(FMUL32(v30$1, v54$1), FADD32(FMUL32(v29$1, v50$1), FADD32(FMUL32(v27$1, v42$1), FMUL32(v28$1, v46$1))))) ++ FADD32(v59$1, FADD32(FMUL32(v30$1, v53$1), FADD32(FMUL32(v29$1, v49$1), FADD32(FMUL32(v27$1, v41$1), FMUL32(v28$1, v45$1))))) ++ FADD32(v58$1, FADD32(FMUL32(v30$1, v52$1), FADD32(FMUL32(v29$1, v48$1), FADD32(FMUL32(v27$1, v40$1), FMUL32(v28$1, v44$1))))) ++ FADD32($sum1.1$1[32:0], FADD32(FMUL32(v30$1, v51$1), FADD32(FMUL32(v29$1, v47$1), FADD32(FMUL32(v27$1, v39$1), FMUL32(v28$1, v43$1))))), FADD32(v63$1, FADD32(FMUL32(v34$1, v54$1), FADD32(FMUL32(v33$1, v50$1), FADD32(FMUL32(v31$1, v42$1), FMUL32(v32$1, v46$1))))) ++ FADD32(v62$1, FADD32(FMUL32(v34$1, v53$1), FADD32(FMUL32(v33$1, v49$1), FADD32(FMUL32(v31$1, v41$1), FMUL32(v32$1, v45$1))))) ++ FADD32(v61$1, FADD32(FMUL32(v34$1, v52$1), FADD32(FMUL32(v33$1, v48$1), FADD32(FMUL32(v31$1, v40$1), FMUL32(v32$1, v44$1))))) ++ FADD32($sum2.1$1[32:0], FADD32(FMUL32(v34$1, v51$1), FADD32(FMUL32(v33$1, v47$1), FADD32(FMUL32(v31$1, v39$1), FMUL32(v32$1, v43$1))))), FADD32(v66$1, FADD32(FMUL32(v38$1, v54$1), FADD32(FMUL32(v37$1, v50$1), FADD32(FMUL32(v35$1, v42$1), FMUL32(v36$1, v46$1))))) ++ FADD32(v65$1, FADD32(FMUL32(v38$1, v53$1), FADD32(FMUL32(v37$1, v49$1), FADD32(FMUL32(v35$1, v41$1), FMUL32(v36$1, v45$1))))) ++ FADD32(v64$1, FADD32(FMUL32(v38$1, v52$1), FADD32(FMUL32(v37$1, v48$1), FADD32(FMUL32(v35$1, v40$1), FMUL32(v36$1, v44$1))))) ++ FADD32($sum3.1$1[32:0], FADD32(FMUL32(v38$1, v51$1), FADD32(FMUL32(v37$1, v47$1), FADD32(FMUL32(v35$1, v39$1), FMUL32(v36$1, v43$1))))), BV32_ADD($j.0, 4bv32);
    $sum0.1$2, $sum1.1$2, $sum2.1$2, $sum3.1$2 := FADD32(v57$2, FADD32(FMUL32(v26$2, v54$2), FADD32(FMUL32(v25$2, v50$2), FADD32(FMUL32(v23$2, v42$2), FMUL32(v24$2, v46$2))))) ++ FADD32(v56$2, FADD32(FMUL32(v26$2, v53$2), FADD32(FMUL32(v25$2, v49$2), FADD32(FMUL32(v23$2, v41$2), FMUL32(v24$2, v45$2))))) ++ FADD32(v55$2, FADD32(FMUL32(v26$2, v52$2), FADD32(FMUL32(v25$2, v48$2), FADD32(FMUL32(v23$2, v40$2), FMUL32(v24$2, v44$2))))) ++ FADD32($sum0.1$2[32:0], FADD32(FMUL32(v26$2, v51$2), FADD32(FMUL32(v25$2, v47$2), FADD32(FMUL32(v23$2, v39$2), FMUL32(v24$2, v43$2))))), FADD32(v60$2, FADD32(FMUL32(v30$2, v54$2), FADD32(FMUL32(v29$2, v50$2), FADD32(FMUL32(v27$2, v42$2), FMUL32(v28$2, v46$2))))) ++ FADD32(v59$2, FADD32(FMUL32(v30$2, v53$2), FADD32(FMUL32(v29$2, v49$2), FADD32(FMUL32(v27$2, v41$2), FMUL32(v28$2, v45$2))))) ++ FADD32(v58$2, FADD32(FMUL32(v30$2, v52$2), FADD32(FMUL32(v29$2, v48$2), FADD32(FMUL32(v27$2, v40$2), FMUL32(v28$2, v44$2))))) ++ FADD32($sum1.1$2[32:0], FADD32(FMUL32(v30$2, v51$2), FADD32(FMUL32(v29$2, v47$2), FADD32(FMUL32(v27$2, v39$2), FMUL32(v28$2, v43$2))))), FADD32(v63$2, FADD32(FMUL32(v34$2, v54$2), FADD32(FMUL32(v33$2, v50$2), FADD32(FMUL32(v31$2, v42$2), FMUL32(v32$2, v46$2))))) ++ FADD32(v62$2, FADD32(FMUL32(v34$2, v53$2), FADD32(FMUL32(v33$2, v49$2), FADD32(FMUL32(v31$2, v41$2), FMUL32(v32$2, v45$2))))) ++ FADD32(v61$2, FADD32(FMUL32(v34$2, v52$2), FADD32(FMUL32(v33$2, v48$2), FADD32(FMUL32(v31$2, v40$2), FMUL32(v32$2, v44$2))))) ++ FADD32($sum2.1$2[32:0], FADD32(FMUL32(v34$2, v51$2), FADD32(FMUL32(v33$2, v47$2), FADD32(FMUL32(v31$2, v39$2), FMUL32(v32$2, v43$2))))), FADD32(v66$2, FADD32(FMUL32(v38$2, v54$2), FADD32(FMUL32(v37$2, v50$2), FADD32(FMUL32(v35$2, v42$2), FMUL32(v36$2, v46$2))))) ++ FADD32(v65$2, FADD32(FMUL32(v38$2, v53$2), FADD32(FMUL32(v37$2, v49$2), FADD32(FMUL32(v35$2, v41$2), FMUL32(v36$2, v45$2))))) ++ FADD32(v64$2, FADD32(FMUL32(v38$2, v52$2), FADD32(FMUL32(v37$2, v48$2), FADD32(FMUL32(v35$2, v40$2), FMUL32(v36$2, v44$2))))) ++ FADD32($sum3.1$2[32:0], FADD32(FMUL32(v38$2, v51$2), FADD32(FMUL32(v37$2, v47$2), FADD32(FMUL32(v35$2, v39$2), FMUL32(v36$2, v43$2)))));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$blockA, $$matrixC, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$blockA, $$matrixC, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const _WATCHED_VALUE_$$matrixA: bv32;

procedure {:inline 1} _LOG_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$matrixA;



implementation {:inline 1} _LOG_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then true else _READ_HAS_OCCURRED_$$matrixA);
    return;
}



procedure _CHECK_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixA);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixA: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$matrixA, _WRITE_READ_BENIGN_FLAG_$$matrixA;



implementation {:inline 1} _LOG_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then true else _WRITE_HAS_OCCURRED_$$matrixA);
    _WRITE_READ_BENIGN_FLAG_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixA);
    return;
}



procedure _CHECK_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA != _value);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA != _value);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixA;



implementation {:inline 1} _LOG_ATOMIC_$$matrixA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixA);
    return;
}



procedure _CHECK_ATOMIC_$$matrixA(_P: bool, _offset: bv32);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixA := (if _P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixA);
    return;
}



const _WATCHED_VALUE_$$matrixB: bv32;

procedure {:inline 1} _LOG_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$matrixB;



implementation {:inline 1} _LOG_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then true else _READ_HAS_OCCURRED_$$matrixB);
    return;
}



procedure _CHECK_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixB);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixB: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$matrixB, _WRITE_READ_BENIGN_FLAG_$$matrixB;



implementation {:inline 1} _LOG_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then true else _WRITE_HAS_OCCURRED_$$matrixB);
    _WRITE_READ_BENIGN_FLAG_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixB);
    return;
}



procedure _CHECK_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB != _value);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB != _value);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixB;



implementation {:inline 1} _LOG_ATOMIC_$$matrixB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixB);
    return;
}



procedure _CHECK_ATOMIC_$$matrixB(_P: bool, _offset: bv32);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixB := (if _P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixB);
    return;
}



const _WATCHED_VALUE_$$matrixC: bv32;

procedure {:inline 1} _LOG_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$matrixC;



implementation {:inline 1} _LOG_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then true else _READ_HAS_OCCURRED_$$matrixC);
    return;
}



procedure _CHECK_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixC);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixC: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC;



implementation {:inline 1} _LOG_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then true else _WRITE_HAS_OCCURRED_$$matrixC);
    _WRITE_READ_BENIGN_FLAG_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixC);
    return;
}



procedure _CHECK_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC != _value);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC != _value);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixC(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixC;



implementation {:inline 1} _LOG_ATOMIC_$$matrixC(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixC);
    return;
}



procedure _CHECK_ATOMIC_$$matrixC(_P: bool, _offset: bv32);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixC;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixC := (if _P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixC);
    return;
}



const _WATCHED_VALUE_$$blockA: bv32;

procedure {:inline 1} _LOG_READ_$$blockA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$blockA;



implementation {:inline 1} _LOG_READ_$$blockA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$blockA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blockA == _value then true else _READ_HAS_OCCURRED_$$blockA);
    return;
}



procedure _CHECK_READ_$$blockA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$blockA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$blockA: bool;

procedure {:inline 1} _LOG_WRITE_$$blockA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$blockA, _WRITE_READ_BENIGN_FLAG_$$blockA;



implementation {:inline 1} _LOG_WRITE_$$blockA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$blockA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blockA == _value then true else _WRITE_HAS_OCCURRED_$$blockA);
    _WRITE_READ_BENIGN_FLAG_$$blockA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blockA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$blockA);
    return;
}



procedure _CHECK_WRITE_$$blockA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blockA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blockA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$blockA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$blockA;



implementation {:inline 1} _LOG_ATOMIC_$$blockA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$blockA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$blockA);
    return;
}



procedure _CHECK_ATOMIC_$$blockA(_P: bool, _offset: bv32);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "blockA"} {:array "$$blockA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$blockA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blockA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$blockA := (if _P && _WRITE_HAS_OCCURRED_$$blockA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$blockA);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$blockA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$blockA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$blockA;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$matrixC;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$matrixC;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$matrixC;
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
    havoc $$matrixC;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$blockA;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$blockA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$blockA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$blockA;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$matrixC;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$matrixC;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$matrixC;
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
    havoc $$matrixC;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$blockA;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;
