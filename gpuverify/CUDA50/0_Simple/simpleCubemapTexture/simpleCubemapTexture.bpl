type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "g_odata"} {:global} $$g_odata: [bv32]bv32;

axiom {:array_info "$$g_odata"} {:global} {:elem_width 32} {:source_name "g_odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_odata: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tex"} {:global} {:elem_width 8} {:source_name "tex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tex: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "transformKernel"} {:kernel} $_Z15transformKernelPfi($width: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$g_odata && !_WRITE_HAS_OCCURRED_$$g_odata && !_ATOMIC_HAS_OCCURRED_$$g_odata;
  requires !_READ_HAS_OCCURRED_$$tex && !_WRITE_HAS_OCCURRED_$$tex && !_ATOMIC_HAS_OCCURRED_$$tex;
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
  modifies _WRITE_HAS_OCCURRED_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata;



implementation {:source_name "transformKernel"} {:kernel} $_Z15transformKernelPfi($width: bv32)
{
  var $cx.0$1: bv32;
  var $cx.0$2: bv32;
  var $cy.0$1: bv32;
  var $cy.0$2: bv32;
  var $cz.0$1: bv32;
  var $cz.0$2: bv32;
  var $face.0: bv32;
  var $cx.6$1: bv32;
  var $cx.6$2: bv32;
  var $cy.6$1: bv32;
  var $cy.6$2: bv32;
  var $cz.6$1: bv32;
  var $cz.6$2: bv32;
  var $cx.5$1: bv32;
  var $cx.5$2: bv32;
  var $cy.5$1: bv32;
  var $cy.5$2: bv32;
  var $cz.5$1: bv32;
  var $cz.5$2: bv32;
  var $cx.4$1: bv32;
  var $cx.4$2: bv32;
  var $cy.4$1: bv32;
  var $cy.4$2: bv32;
  var $cz.4$1: bv32;
  var $cz.4$2: bv32;
  var $cx.3$1: bv32;
  var $cx.3$2: bv32;
  var $cy.3$1: bv32;
  var $cy.3$2: bv32;
  var $cz.3$1: bv32;
  var $cz.3$2: bv32;
  var $cx.2$1: bv32;
  var $cx.2$2: bv32;
  var $cy.2$1: bv32;
  var $cy.2$2: bv32;
  var $cz.2$1: bv32;
  var $cz.2$2: bv32;
  var $cx.1$1: bv32;
  var $cx.1$2: bv32;
  var $cy.1$1: bv32;
  var $cy.1$2: bv32;
  var $cz.1$1: bv32;
  var $cz.1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v9: bool;
  var v7: bool;
  var v8: bool;
  var v10: bool;
  var v11: bool;
  var v12: bool;
  var v13: bool;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v36$1: bv8;
  var v36$2: bv8;
  var v37$1: bv8;
  var v37$2: bv8;
  var v38$1: bv32;
  var v38$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := FSUB32(FMUL32(FDIV32(FADD32(UI32_TO_FP32(v0$1), 1056964608bv32), SI32_TO_FP32($width)), 1073741824bv32), 1065353216bv32);
    v2$2 := FSUB32(FMUL32(FDIV32(FADD32(UI32_TO_FP32(v0$2), 1056964608bv32), SI32_TO_FP32($width)), 1073741824bv32), 1065353216bv32);
    v3$1 := FSUB32(FMUL32(FDIV32(FADD32(UI32_TO_FP32(v1$1), 1056964608bv32), SI32_TO_FP32($width)), 1073741824bv32), 1065353216bv32);
    v3$2 := FSUB32(FMUL32(FDIV32(FADD32(UI32_TO_FP32(v1$2), 1056964608bv32), SI32_TO_FP32($width)), 1073741824bv32), 1065353216bv32);
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    $cx.0$1, $cy.0$1, $cz.0$1, $face.0 := v4$1, v5$1, v6$1, 0bv32;
    $cx.0$2, $cy.0$2, $cz.0$2 := v4$2, v5$2, v6$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b9 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, group_size_x), BV32_DIV(BV32_MUL(BV32_MUL(group_id_y$1, $width), group_size_y), group_size_x)), BV32_DIV(BV32_MUL(local_id_y$1, $width), group_size_x));
    assert {:tag "accessBreak"} _b8 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $width), BV32_MUL(group_id_y$1, group_size_y)), BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $width));
    assert {:tag "accessBreak"} _b7 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $width), group_size_y), BV32_DIV(local_id_y$1, group_size_y)), BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $width), group_size_y));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b6 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), $width), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), $width), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(0bv32, $width), $width), BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1), $width)), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b5 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b4 ==> _WRITE_HAS_OCCURRED_$$g_odata ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($face.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($face.0, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v7 := BV32_ULT($face.0, 6bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v7 && !v7;
    return;

  $truebb:
    assume {:partition} v7 && v7;
    v8 := $face.0 == 0bv32;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v8 && !v8;
    v9 := $face.0 == 1bv32;
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v9 && !v9;
    v10 := $face.0 == 2bv32;
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v10 && !v10;
    v11 := $face.0 == 3bv32;
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v11 && !v11;
    v12 := $face.0 == 4bv32;
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} !v12 && !v12;
    v13 := $face.0 == 5bv32;
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v13 && !v13;
    $cx.1$1, $cy.1$1, $cz.1$1 := $cx.0$1, $cy.0$1, $cz.0$1;
    $cx.1$2, $cy.1$2, $cz.1$2 := $cx.0$2, $cy.0$2, $cz.0$2;
    goto $14;

  $14:
    $cx.2$1, $cy.2$1, $cz.2$1 := $cx.1$1, $cy.1$1, $cz.1$1;
    $cx.2$2, $cy.2$2, $cz.2$2 := $cx.1$2, $cy.1$2, $cz.1$2;
    goto $15;

  $15:
    $cx.3$1, $cy.3$1, $cz.3$1 := $cx.2$1, $cy.2$1, $cz.2$1;
    $cx.3$2, $cy.3$2, $cz.3$2 := $cx.2$2, $cy.2$2, $cz.2$2;
    goto $16;

  $16:
    $cx.4$1, $cy.4$1, $cz.4$1 := $cx.3$1, $cy.3$1, $cz.3$1;
    $cx.4$2, $cy.4$2, $cz.4$2 := $cx.3$2, $cy.3$2, $cz.3$2;
    goto $17;

  $17:
    $cx.5$1, $cy.5$1, $cz.5$1 := $cx.4$1, $cy.4$1, $cz.4$1;
    $cx.5$2, $cy.5$2, $cz.5$2 := $cx.4$2, $cy.4$2, $cz.4$2;
    goto $18;

  $18:
    $cx.6$1, $cy.6$1, $cz.6$1 := $cx.5$1, $cy.5$1, $cz.5$1;
    $cx.6$2, $cy.6$2, $cz.6$2 := $cx.5$2, $cy.5$2, $cz.5$2;
    goto $19;

  $19:
    havoc v14$1, v14$2;
    $$0$0bv32$1 := v14$1;
    $$0$0bv32$2 := v14$2;
    havoc v15$1, v15$2;
    $$0$1bv32$1 := v15$1;
    $$0$1bv32$2 := v15$2;
    havoc v16$1, v16$2;
    $$0$2bv32$1 := v16$1;
    $$0$2bv32$2 := v16$2;
    havoc v17$1, v17$2;
    $$0$3bv32$1 := v17$1;
    $$0$3bv32$2 := v17$2;
    havoc v18$1, v18$2;
    $$0$4bv32$1 := v18$1;
    $$0$4bv32$2 := v18$2;
    havoc v19$1, v19$2;
    $$0$5bv32$1 := v19$1;
    $$0$5bv32$2 := v19$2;
    havoc v20$1, v20$2;
    $$0$6bv32$1 := v20$1;
    $$0$6bv32$2 := v20$2;
    havoc v21$1, v21$2;
    $$0$7bv32$1 := v21$1;
    $$0$7bv32$2 := v21$2;
    havoc v22$1, v22$2;
    $$0$8bv32$1 := v22$1;
    $$0$8bv32$2 := v22$2;
    havoc v23$1, v23$2;
    $$0$9bv32$1 := v23$1;
    $$0$9bv32$2 := v23$2;
    havoc v24$1, v24$2;
    $$0$10bv32$1 := v24$1;
    $$0$10bv32$2 := v24$2;
    havoc v25$1, v25$2;
    $$0$11bv32$1 := v25$1;
    $$0$11bv32$2 := v25$2;
    v26$1 := $$0$0bv32$1;
    v26$2 := $$0$0bv32$2;
    v27$1 := $$0$1bv32$1;
    v27$2 := $$0$1bv32$2;
    v28$1 := $$0$2bv32$1;
    v28$2 := $$0$2bv32$2;
    v29$1 := $$0$3bv32$1;
    v29$2 := $$0$3bv32$2;
    v30$1 := $$0$4bv32$1;
    v30$2 := $$0$4bv32$2;
    v31$1 := $$0$5bv32$1;
    v31$2 := $$0$5bv32$2;
    v32$1 := $$0$6bv32$1;
    v32$2 := $$0$6bv32$2;
    v33$1 := $$0$7bv32$1;
    v33$2 := $$0$7bv32$2;
    v34$1 := $$0$8bv32$1;
    v34$2 := $$0$8bv32$2;
    v35$1 := $$0$9bv32$1;
    v35$2 := $$0$9bv32$2;
    v36$1 := $$0$10bv32$1;
    v36$2 := $$0$10bv32$2;
    v37$1 := $$0$11bv32$1;
    v37$2 := $$0$11bv32$2;
    call {:sourceloc_num 52} v38$1, v38$2 := $_Z10texCubemapIfET_7textureIS0_Li12EL19cudaTextureReadMode0EEfff(v29$1 ++ v28$1 ++ v27$1 ++ v26$1, v33$1 ++ v32$1 ++ v31$1 ++ v30$1, v37$1 ++ v36$1 ++ v35$1 ++ v34$1, $cx.6$1, $cy.6$1, $cz.6$1, v29$2 ++ v28$2 ++ v27$2 ++ v26$2, v33$2 ++ v32$2 ++ v31$2 ++ v30$2, v37$2 ++ v36$2 ++ v35$2 ++ v34$2, $cx.6$2, $cy.6$2, $cz.6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10texCubemapIfET_7textureIS0_Li12EL19cudaTextureReadMode0EEfff"} true;
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$g_odata(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$1, $width)), v0$1), FSUB32(2147483648bv32, v38$1), $$g_odata[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$1, $width)), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$2, $width)), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$g_odata(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$2, $width)), v0$2), FSUB32(2147483648bv32, v38$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$1, $width)), v0$1)] := FSUB32(2147483648bv32, v38$1);
    $$g_odata[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($face.0, $width), $width), BV32_MUL(v1$2, $width)), v0$2)] := FSUB32(2147483648bv32, v38$2);
    $cx.0$1, $cy.0$1, $cz.0$1, $face.0 := $cx.6$1, $cy.6$1, $cz.6$1, BV32_ADD($face.0, 1bv32);
    $cx.0$2, $cy.0$2, $cz.0$2 := $cx.6$2, $cy.6$2, $cz.6$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb5:
    assume {:partition} v13 && v13;
    $cx.1$1, $cy.1$1, $cz.1$1 := FSUB32(2147483648bv32, v2$1), FSUB32(2147483648bv32, v3$1), 3212836864bv32;
    $cx.1$2, $cy.1$2, $cz.1$2 := FSUB32(2147483648bv32, v2$2), FSUB32(2147483648bv32, v3$2), 3212836864bv32;
    goto $14;

  $truebb4:
    assume {:partition} v12 && v12;
    $cx.2$1, $cy.2$1, $cz.2$1 := v2$1, FSUB32(2147483648bv32, v3$1), 1065353216bv32;
    $cx.2$2, $cy.2$2, $cz.2$2 := v2$2, FSUB32(2147483648bv32, v3$2), 1065353216bv32;
    goto $15;

  $truebb3:
    assume {:partition} v11 && v11;
    $cx.3$1, $cy.3$1, $cz.3$1 := v2$1, 3212836864bv32, FSUB32(2147483648bv32, v3$1);
    $cx.3$2, $cy.3$2, $cz.3$2 := v2$2, 3212836864bv32, FSUB32(2147483648bv32, v3$2);
    goto $16;

  $truebb2:
    assume {:partition} v10 && v10;
    $cx.4$1, $cy.4$1, $cz.4$1 := v2$1, 1065353216bv32, v3$1;
    $cx.4$2, $cy.4$2, $cz.4$2 := v2$2, 1065353216bv32, v3$2;
    goto $17;

  $truebb1:
    assume {:partition} v9 && v9;
    $cx.5$1, $cy.5$1, $cz.5$1 := 3212836864bv32, FSUB32(2147483648bv32, v3$1), v2$1;
    $cx.5$2, $cy.5$2, $cz.5$2 := 3212836864bv32, FSUB32(2147483648bv32, v3$2), v2$2;
    goto $18;

  $truebb0:
    assume {:partition} v8 && v8;
    $cx.6$1, $cy.6$1, $cz.6$1 := 1065353216bv32, FSUB32(2147483648bv32, v3$1), FSUB32(2147483648bv32, v2$1);
    $cx.6$2, $cy.6$2, $cz.6$2 := 1065353216bv32, FSUB32(2147483648bv32, v3$2), FSUB32(2147483648bv32, v2$2);
    goto $19;
}



procedure {:source_name "_Z10texCubemapIfET_7textureIS0_Li12EL19cudaTextureReadMode0EEfff"} $_Z10texCubemapIfET_7textureIS0_Li12EL19cudaTextureReadMode0EEfff($0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv8;

var $$0$0bv32$2: bv8;

var $$0$1bv32$1: bv8;

var $$0$1bv32$2: bv8;

var $$0$2bv32$1: bv8;

var $$0$2bv32$2: bv8;

var $$0$3bv32$1: bv8;

var $$0$3bv32$2: bv8;

var $$0$4bv32$1: bv8;

var $$0$4bv32$2: bv8;

var $$0$5bv32$1: bv8;

var $$0$5bv32$2: bv8;

var $$0$6bv32$1: bv8;

var $$0$6bv32$2: bv8;

var $$0$7bv32$1: bv8;

var $$0$7bv32$2: bv8;

var $$0$8bv32$1: bv8;

var $$0$8bv32$2: bv8;

var $$0$9bv32$1: bv8;

var $$0$9bv32$2: bv8;

var $$0$10bv32$1: bv8;

var $$0$10bv32$2: bv8;

var $$0$11bv32$1: bv8;

var $$0$11bv32$2: bv8;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$g_odata: bv32;

procedure {:inline 1} _LOG_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_odata;



implementation {:inline 1} _LOG_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then true else _READ_HAS_OCCURRED_$$g_odata);
    return;
}



procedure _CHECK_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_odata);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_odata: bool;

procedure {:inline 1} _LOG_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata;



implementation {:inline 1} _LOG_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then true else _WRITE_HAS_OCCURRED_$$g_odata);
    _WRITE_READ_BENIGN_FLAG_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_odata);
    return;
}



procedure _CHECK_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata != _value);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata != _value);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_odata;



implementation {:inline 1} _LOG_ATOMIC_$$g_odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_odata);
    return;
}



procedure _CHECK_ATOMIC_$$g_odata(_P: bool, _offset: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_odata := (if _P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_odata);
    return;
}



const _WATCHED_VALUE_$$tex: bv8;

procedure {:inline 1} _LOG_READ_$$tex(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$tex;



implementation {:inline 1} _LOG_READ_$$tex(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then true else _READ_HAS_OCCURRED_$$tex);
    return;
}



procedure _CHECK_READ_$$tex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$tex);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$tex: bool;

procedure {:inline 1} _LOG_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$tex, _WRITE_READ_BENIGN_FLAG_$$tex;



implementation {:inline 1} _LOG_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then true else _WRITE_HAS_OCCURRED_$$tex);
    _WRITE_READ_BENIGN_FLAG_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$tex);
    return;
}



procedure _CHECK_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex != _value);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex != _value);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$tex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$tex;



implementation {:inline 1} _LOG_ATOMIC_$$tex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$tex);
    return;
}



procedure _CHECK_ATOMIC_$$tex(_P: bool, _offset: bv32);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$tex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$tex := (if _P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$tex);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b6: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;
