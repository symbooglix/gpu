type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$x"} {:global} {:elem_width 32} {:source_name "x"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$x: bool;

axiom {:array_info "$$y"} {:global} {:elem_width 32} {:source_name "y"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$y: bool;

axiom {:array_info "$$z"} {:global} {:elem_width 32} {:source_name "z"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$z: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$z: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$z: bool;

var {:source_name "Qr"} {:global} $$Qr: [bv32]bv32;

axiom {:array_info "$$Qr"} {:global} {:elem_width 32} {:source_name "Qr"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Qr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Qr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Qr: bool;

var {:source_name "Qi"} {:global} $$Qi: [bv32]bv32;

axiom {:array_info "$$Qi"} {:global} {:elem_width 32} {:source_name "Qi"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Qi: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Qi: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Qi: bool;

axiom {:array_info "$$ck"} {:global} {:elem_width 32} {:source_name "ck"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ck: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ck: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ck: bool;

var {:source_name "sX"} $$sX$1: [bv32]bv32;

var {:source_name "sX"} $$sX$2: [bv32]bv32;

axiom {:array_info "$$sX"} {:elem_width 32} {:source_name "sX"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "sY"} $$sY$1: [bv32]bv32;

var {:source_name "sY"} $$sY$2: [bv32]bv32;

axiom {:array_info "$$sY"} {:elem_width 32} {:source_name "sY"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "sZ"} $$sZ$1: [bv32]bv32;

var {:source_name "sZ"} $$sZ$2: [bv32]bv32;

axiom {:array_info "$$sZ"} {:elem_width 32} {:source_name "sZ"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "sQr"} $$sQr$1: [bv32]bv32;

var {:source_name "sQr"} $$sQr$2: [bv32]bv32;

axiom {:array_info "$$sQr"} {:elem_width 32} {:source_name "sQr"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "sQi"} $$sQi$1: [bv32]bv32;

var {:source_name "sQi"} $$sQi$2: [bv32]bv32;

axiom {:array_info "$$sQi"} {:elem_width 32} {:source_name "sQi"} {:source_elem_width 32} {:source_dimensions "4"} true;

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

function FCOS32(bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSIN32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "ComputeQ_GPU"} {:kernel} $ComputeQ_GPU($numK: bv32, $kGlobalIndex: bv32);
  requires !_READ_HAS_OCCURRED_$$x && !_WRITE_HAS_OCCURRED_$$x && !_ATOMIC_HAS_OCCURRED_$$x;
  requires !_READ_HAS_OCCURRED_$$y && !_WRITE_HAS_OCCURRED_$$y && !_ATOMIC_HAS_OCCURRED_$$y;
  requires !_READ_HAS_OCCURRED_$$z && !_WRITE_HAS_OCCURRED_$$z && !_ATOMIC_HAS_OCCURRED_$$z;
  requires !_READ_HAS_OCCURRED_$$Qr && !_WRITE_HAS_OCCURRED_$$Qr && !_ATOMIC_HAS_OCCURRED_$$Qr;
  requires !_READ_HAS_OCCURRED_$$Qi && !_WRITE_HAS_OCCURRED_$$Qi && !_ATOMIC_HAS_OCCURRED_$$Qi;
  requires !_READ_HAS_OCCURRED_$$ck && !_WRITE_HAS_OCCURRED_$$ck && !_ATOMIC_HAS_OCCURRED_$$ck;
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
  modifies _WRITE_HAS_OCCURRED_$$Qr, _WRITE_READ_BENIGN_FLAG_$$Qr, _WRITE_READ_BENIGN_FLAG_$$Qr, _WRITE_HAS_OCCURRED_$$Qi, _WRITE_READ_BENIGN_FLAG_$$Qi, _WRITE_READ_BENIGN_FLAG_$$Qi, _READ_HAS_OCCURRED_$$Qr, _READ_HAS_OCCURRED_$$Qi;



implementation {:source_name "ComputeQ_GPU"} {:kernel} $ComputeQ_GPU($numK: bv32, $kGlobalIndex: bv32)
{
  var $tx.0: bv32;
  var $kIndex.0: bv32;
  var $.0: bv32;
  var $0: bv1;
  var $tx1.0: bv32;
  var $tx2.0: bv32;
  var v0: bool;
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
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12: bool;
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
  var v19: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;


  $0:
    $tx.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessBreak"} _b13 ==> _READ_HAS_OCCURRED_$$Qi ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_DIV(BV32_MUL(group_id_x$1, 256bv32), 4bv32));
    assert {:tag "accessBreak"} _b12 ==> _READ_HAS_OCCURRED_$$Qi ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 256bv32), BV32_DIV(BV32_MUL(local_id_x$1, 4bv32), 256bv32));
    assert {:tag "accessBreak"} _b11 ==> _READ_HAS_OCCURRED_$$Qr ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_DIV(BV32_MUL(group_id_x$1, 256bv32), 4bv32));
    assert {:tag "accessBreak"} _b10 ==> _READ_HAS_OCCURRED_$$Qr ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 256bv32), BV32_DIV(BV32_MUL(local_id_x$1, 4bv32), 256bv32));
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($tx.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($tx.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $tx.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $tx.0);
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v0 := BV32_SLT($tx.0, 4bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    $kIndex.0, $.0 := 0bv32, $kGlobalIndex;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v7 := BV32_SLT($kIndex.0, 1024bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v7 && !v7;
    $0 := 0bv1;
    goto $7;

  $7:
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !($0 == 1bv1) && !($0 == 1bv1);
    $tx2.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b17 ==> _WRITE_HAS_OCCURRED_$$Qi ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_DIV(BV32_MUL(group_id_x$1, 256bv32), 4bv32));
    assert {:tag "accessBreak"} _b16 ==> _WRITE_HAS_OCCURRED_$$Qi ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 256bv32), BV32_DIV(BV32_MUL(local_id_x$1, 4bv32), 256bv32));
    assert {:tag "accessBreak"} _b15 ==> _WRITE_HAS_OCCURRED_$$Qr ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_DIV(BV32_MUL(group_id_x$1, 256bv32), 4bv32));
    assert {:tag "accessBreak"} _b14 ==> _WRITE_HAS_OCCURRED_$$Qr ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 256bv32), BV32_DIV(BV32_MUL(local_id_x$1, 4bv32), 256bv32));
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($tx2.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($tx2.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $tx2.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $tx2.0);
    assert {:block_sourceloc} {:sourceloc_num 36} true;
    v19 := BV32_SLT($tx2.0, 4bv32);
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v19 && !v19;
    return;

  $truebb3:
    assume {:partition} v19 && v19;
    v20$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), BV32_MUL(4bv32, local_id_x$1)), $tx2.0);
    v20$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), BV32_MUL(4bv32, local_id_x$2)), $tx2.0);
    v21$1 := $$sQr$1[$tx2.0];
    v21$2 := $$sQr$2[$tx2.0];
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$Qr(true, v20$1, v21$1, $$Qr[v20$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qr(true, v20$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$Qr(true, v20$2, v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Qr"} true;
    $$Qr[v20$1] := v21$1;
    $$Qr[v20$2] := v21$2;
    v22$1 := $$sQi$1[$tx2.0];
    v22$2 := $$sQi$2[$tx2.0];
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$Qi(true, v20$1, v22$1, $$Qi[v20$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qi(true, v20$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$Qi(true, v20$2, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Qi"} true;
    $$Qi[v20$1] := v22$1;
    $$Qi[v20$2] := v22$2;
    $tx2.0 := BV32_ADD($tx2.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $15;

  $truebb1:
    assume {:partition} $0 == 1bv1 && $0 == 1bv1;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    $tx1.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 23} true;
    v12 := BV32_SLT($tx1.0, 4bv32);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v12 && !v12;
    $kIndex.0, $.0 := BV32_ADD($kIndex.0, 1bv32), BV32_ADD($.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $truebb2:
    assume {:partition} v12 && v12;
    v13$1 := $$sX$1[$tx1.0];
    v13$2 := $$sX$2[$tx1.0];
    v14$1 := $$sY$1[$tx1.0];
    v14$2 := $$sY$2[$tx1.0];
    v15$1 := $$sZ$1[$tx1.0];
    v15$2 := $$sZ$2[$tx1.0];
    v16$1 := FMUL32(1086918619bv32, FADD32(FMUL32(v10$1, v15$1), FADD32(FMUL32(v8$1, v13$1), FMUL32(v9$1, v14$1))));
    v16$2 := FMUL32(1086918619bv32, FADD32(FMUL32(v10$2, v15$2), FADD32(FMUL32(v8$2, v13$2), FMUL32(v9$2, v14$2))));
    v17$1 := $$sQr$1[$tx1.0];
    v17$2 := $$sQr$2[$tx1.0];
    $$sQr$1[$tx1.0] := FADD32(v17$1, FMUL32(v11$1, FCOS32(v16$1)));
    $$sQr$2[$tx1.0] := FADD32(v17$2, FMUL32(v11$2, FCOS32(v16$2)));
    v18$1 := $$sQi$1[$tx1.0];
    v18$2 := $$sQi$2[$tx1.0];
    $$sQi$1[$tx1.0] := FADD32(v18$1, FMUL32(v11$1, FSIN32(v16$1)));
    $$sQi$2[$tx1.0] := FADD32(v18$2, FMUL32(v11$2, FSIN32(v16$2)));
    $tx1.0 := BV32_ADD($tx1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $9;

  $truebb0:
    assume {:partition} v7 && v7;
    $0 := (if BV32_SLT($.0, $numK) then 1bv1 else 0bv1);
    goto $7;

  $truebb:
    assume {:partition} v0 && v0;
    v1$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), BV32_MUL(4bv32, local_id_x$1)), $tx.0);
    v1$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), BV32_MUL(4bv32, local_id_x$2)), $tx.0);
    havoc v2$1, v2$2;
    $$sX$1[$tx.0] := v2$1;
    $$sX$2[$tx.0] := v2$2;
    havoc v3$1, v3$2;
    $$sY$1[$tx.0] := v3$1;
    $$sY$2[$tx.0] := v3$2;
    havoc v4$1, v4$2;
    $$sZ$1[$tx.0] := v4$1;
    $$sZ$2[$tx.0] := v4$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$Qr(true, v1$1, $$Qr[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$Qr(true, v1$2, $$Qr[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$Qr"} true;
    v5$1 := $$Qr[v1$1];
    v5$2 := $$Qr[v1$2];
    $$sQr$1[$tx.0] := v5$1;
    $$sQr$2[$tx.0] := v5$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$Qi(true, v1$1, $$Qi[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$Qi(true, v1$2, $$Qi[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$Qi"} true;
    v6$1 := $$Qi[v1$1];
    v6$2 := $$Qi[v1$2];
    $$sQi$1[$tx.0] := v6$1;
    $$sQi$2[$tx.0] := v6$2;
    $tx.0 := BV32_ADD($tx.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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

const _WATCHED_VALUE_$$x: bv32;

procedure {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$x;



implementation {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _READ_HAS_OCCURRED_$$x);
    return;
}



procedure _CHECK_READ_$$x(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$x);
  requires {:source_name "x"} {:array "$$x"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$x: bool;

procedure {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$x, _WRITE_READ_BENIGN_FLAG_$$x;



implementation {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _WRITE_HAS_OCCURRED_$$x);
    _WRITE_READ_BENIGN_FLAG_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$x);
    return;
}



procedure _CHECK_WRITE_$$x(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x != _value);
  requires {:source_name "x"} {:array "$$x"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x != _value);
  requires {:source_name "x"} {:array "$$x"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$x(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$x;



implementation {:inline 1} _LOG_ATOMIC_$$x(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$x);
    return;
}



procedure _CHECK_ATOMIC_$$x(_P: bool, _offset: bv32);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);
  requires {:source_name "x"} {:array "$$x"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$x;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$x := (if _P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$x);
    return;
}



const _WATCHED_VALUE_$$y: bv32;

procedure {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$y;



implementation {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _READ_HAS_OCCURRED_$$y);
    return;
}



procedure _CHECK_READ_$$y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$y);
  requires {:source_name "y"} {:array "$$y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$y: bool;

procedure {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$y, _WRITE_READ_BENIGN_FLAG_$$y;



implementation {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _WRITE_HAS_OCCURRED_$$y);
    _WRITE_READ_BENIGN_FLAG_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$y);
    return;
}



procedure _CHECK_WRITE_$$y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y != _value);
  requires {:source_name "y"} {:array "$$y"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y != _value);
  requires {:source_name "y"} {:array "$$y"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$y(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$y;



implementation {:inline 1} _LOG_ATOMIC_$$y(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$y);
    return;
}



procedure _CHECK_ATOMIC_$$y(_P: bool, _offset: bv32);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);
  requires {:source_name "y"} {:array "$$y"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$y(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$y;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$y(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$y := (if _P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$y);
    return;
}



const _WATCHED_VALUE_$$z: bv32;

procedure {:inline 1} _LOG_READ_$$z(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$z;



implementation {:inline 1} _LOG_READ_$$z(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then true else _READ_HAS_OCCURRED_$$z);
    return;
}



procedure _CHECK_READ_$$z(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$z);
  requires {:source_name "z"} {:array "$$z"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$z: bool;

procedure {:inline 1} _LOG_WRITE_$$z(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$z, _WRITE_READ_BENIGN_FLAG_$$z;



implementation {:inline 1} _LOG_WRITE_$$z(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then true else _WRITE_HAS_OCCURRED_$$z);
    _WRITE_READ_BENIGN_FLAG_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$z);
    return;
}



procedure _CHECK_WRITE_$$z(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z != _value);
  requires {:source_name "z"} {:array "$$z"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z != _value);
  requires {:source_name "z"} {:array "$$z"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$z(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$z;



implementation {:inline 1} _LOG_ATOMIC_$$z(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$z);
    return;
}



procedure _CHECK_ATOMIC_$$z(_P: bool, _offset: bv32);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);
  requires {:source_name "z"} {:array "$$z"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$z(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$z;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$z(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$z := (if _P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$z);
    return;
}



const _WATCHED_VALUE_$$Qr: bv32;

procedure {:inline 1} _LOG_READ_$$Qr(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Qr;



implementation {:inline 1} _LOG_READ_$$Qr(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qr == _value then true else _READ_HAS_OCCURRED_$$Qr);
    return;
}



procedure _CHECK_READ_$$Qr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Qr);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Qr: bool;

procedure {:inline 1} _LOG_WRITE_$$Qr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Qr, _WRITE_READ_BENIGN_FLAG_$$Qr;



implementation {:inline 1} _LOG_WRITE_$$Qr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qr == _value then true else _WRITE_HAS_OCCURRED_$$Qr);
    _WRITE_READ_BENIGN_FLAG_$$Qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qr == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Qr);
    return;
}



procedure _CHECK_WRITE_$$Qr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qr != _value);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qr != _value);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Qr(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Qr;



implementation {:inline 1} _LOG_ATOMIC_$$Qr(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Qr);
    return;
}



procedure _CHECK_ATOMIC_$$Qr(_P: bool, _offset: bv32);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset);
  requires {:source_name "Qr"} {:array "$$Qr"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qr(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Qr;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qr(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Qr := (if _P && _WRITE_HAS_OCCURRED_$$Qr && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Qr);
    return;
}



const _WATCHED_VALUE_$$Qi: bv32;

procedure {:inline 1} _LOG_READ_$$Qi(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Qi;



implementation {:inline 1} _LOG_READ_$$Qi(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qi == _value then true else _READ_HAS_OCCURRED_$$Qi);
    return;
}



procedure _CHECK_READ_$$Qi(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Qi);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Qi: bool;

procedure {:inline 1} _LOG_WRITE_$$Qi(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Qi, _WRITE_READ_BENIGN_FLAG_$$Qi;



implementation {:inline 1} _LOG_WRITE_$$Qi(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qi == _value then true else _WRITE_HAS_OCCURRED_$$Qi);
    _WRITE_READ_BENIGN_FLAG_$$Qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qi == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Qi);
    return;
}



procedure _CHECK_WRITE_$$Qi(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qi != _value);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Qi != _value);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Qi(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Qi;



implementation {:inline 1} _LOG_ATOMIC_$$Qi(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Qi);
    return;
}



procedure _CHECK_ATOMIC_$$Qi(_P: bool, _offset: bv32);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset);
  requires {:source_name "Qi"} {:array "$$Qi"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qi(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Qi;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Qi(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Qi := (if _P && _WRITE_HAS_OCCURRED_$$Qi && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Qi);
    return;
}



const _WATCHED_VALUE_$$ck: bv32;

procedure {:inline 1} _LOG_READ_$$ck(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$ck;



implementation {:inline 1} _LOG_READ_$$ck(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ck := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ck == _value then true else _READ_HAS_OCCURRED_$$ck);
    return;
}



procedure _CHECK_READ_$$ck(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ck);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$ck: bool;

procedure {:inline 1} _LOG_WRITE_$$ck(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$ck, _WRITE_READ_BENIGN_FLAG_$$ck;



implementation {:inline 1} _LOG_WRITE_$$ck(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ck := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ck == _value then true else _WRITE_HAS_OCCURRED_$$ck);
    _WRITE_READ_BENIGN_FLAG_$$ck := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ck == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ck);
    return;
}



procedure _CHECK_WRITE_$$ck(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ck != _value);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ck != _value);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$ck(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ck;



implementation {:inline 1} _LOG_ATOMIC_$$ck(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ck := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ck);
    return;
}



procedure _CHECK_ATOMIC_$$ck(_P: bool, _offset: bv32);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset);
  requires {:source_name "ck"} {:array "$$ck"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ck(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ck;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ck(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ck := (if _P && _WRITE_HAS_OCCURRED_$$ck && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ck);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;
