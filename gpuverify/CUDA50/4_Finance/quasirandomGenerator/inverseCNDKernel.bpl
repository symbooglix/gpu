type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Output"} {:global} $$d_Output: [bv32]bv32;

axiom {:array_info "$$d_Output"} {:global} {:elem_width 32} {:source_name "d_Output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Output: bool;

const $arrayId$$d_Output: arrayId;

axiom $arrayId$$d_Output == 1bv2;

var {:source_name "d_Input"} {:global} $$d_Input: [bv32]bv32;

axiom {:array_info "$$d_Input"} {:global} {:elem_width 32} {:source_name "d_Input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Input: bool;

const $arrayId$$d_Input: arrayId;

axiom $arrayId$$d_Input == 2bv2;

type ptr = bv32;

type arrayId = bv2;

function {:inline true} MKPTR(base: arrayId, offset: bv32) : ptr
{
  base ++ offset[30:0]
}

function {:inline true} base#MKPTR(p: ptr) : arrayId
{
  p[32:30]
}

function {:inline true} offset#MKPTR(p: ptr) : bv32
{
  0bv2 ++ p[30:0]
}

const $arrayId$$null$: arrayId;

axiom $arrayId$$null$ == 0bv2;

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

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV64_SUB(bv64, bv64) : bv64;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV64_UGE(bv64, bv64) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 32"} BV32_ZEXT64(bv32) : bv64;

procedure {:source_name "inverseCNDKernel"} {:kernel} $_Z16inverseCNDKernelPfPjj($pathN: bv32);
  requires !_READ_HAS_OCCURRED_$$d_Output && !_WRITE_HAS_OCCURRED_$$d_Output && !_ATOMIC_HAS_OCCURRED_$$d_Output;
  requires !_READ_HAS_OCCURRED_$$d_Input && !_WRITE_HAS_OCCURRED_$$d_Input && !_ATOMIC_HAS_OCCURRED_$$d_Input;
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
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:source_name "inverseCNDKernel"} {:kernel} $_Z16inverseCNDKernelPfPjj($pathN: bv32)
{
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var $negate.i21.0$1: bv8;
  var $negate.i21.0$2: bv8;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $z.i20.0$1: bv32;
  var $z.i20.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $pos1.0$1: bv32;
  var $pos1.0$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $negate.i.0$1: bv8;
  var $negate.i.0$2: bv8;
  var $z.i.0$1: bv32;
  var $z.i.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v1: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
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
  var p17$1: bool;
  var p17$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1 := BV32_MUL(group_size_x, num_groups_x);
    v2 := MKPTR($arrayId$$d_Input, 0bv32) != MKPTR($arrayId$$null$, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p9$1 := false;
    p9$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    $pos1.0$1 := v0$1;
    $pos1.0$2 := v0$2;
    p9$1 := true;
    p9$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $14;

  $14:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b5 ==> BV32_ULT($pos1.0$1, $pathN) ==> p9$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b5 ==> BV32_ULT($pos1.0$2, $pathN) ==> p9$2;
    assert {:tag "loopBound"} {:thread 1} p9$1 ==> _b4 ==> BV32_UGE($pos1.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p9$2 ==> _b4 ==> BV32_UGE($pos1.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p9$1 ==> _b3 ==> BV32_ULE($pos1.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p9$2 ==> _b3 ==> BV32_ULE($pos1.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p9$1 ==> _b2 ==> BV32_SGE($pos1.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p9$2 ==> _b2 ==> BV32_SGE($pos1.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p9$1 ==> _b1 ==> BV32_SLE($pos1.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p9$2 ==> _b1 ==> BV32_SLE($pos1.0$2, v0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p9$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos1.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p9$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos1.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 19} p9$1 ==> true;
    v12$1 := (if p9$1 then BV32_ULT($pos1.0$1, $pathN) else v12$1);
    v12$2 := (if p9$2 then BV32_ULT($pos1.0$2, $pathN) else v12$2);
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
    p17$1 := false;
    p17$2 := false;
    p10$1 := (if p9$1 && v12$1 then v12$1 else p10$1);
    p10$2 := (if p9$2 && v12$2 then v12$2 else p10$2);
    p9$1 := (if p9$1 && !v12$1 then v12$1 else p9$1);
    p9$2 := (if p9$2 && !v12$2 then v12$2 else p9$2);
    v13$1 := (if p10$1 then BV32_MUL(BV32_ADD($pos1.0$1, 1bv32), BV32_UDIV(4294967295bv32, BV32_ADD($pathN, 1bv32))) else v13$1);
    v13$2 := (if p10$2 then BV32_MUL(BV32_ADD($pos1.0$2, 1bv32), BV32_UDIV(4294967295bv32, BV32_ADD($pathN, 1bv32))) else v13$2);
    v14$1 := (if p10$1 then BV64_UGE(BV32_ZEXT64(v13$1), 2147483648bv64) else v14$1);
    v14$2 := (if p10$2 then BV64_UGE(BV32_ZEXT64(v13$2), 2147483648bv64) else v14$2);
    p12$1 := (if p10$1 && v14$1 then v14$1 else p12$1);
    p12$2 := (if p10$2 && v14$2 then v14$2 else p12$2);
    p11$1 := (if p10$1 && !v14$1 then !v14$1 else p11$1);
    p11$2 := (if p10$2 && !v14$2 then !v14$2 else p11$2);
    $.01$1, $negate.i.0$1 := (if p11$1 then v13$1 else $.01$1), (if p11$1 then 0bv8 else $negate.i.0$1);
    $.01$2, $negate.i.0$2 := (if p11$2 then v13$2 else $.01$2), (if p11$2 then 0bv8 else $negate.i.0$2);
    $.01$1, $negate.i.0$1 := (if p12$1 then BV64_SUB(4294967295bv64, BV32_ZEXT64(v13$1))[32:0] else $.01$1), (if p12$1 then 1bv8 else $negate.i.0$1);
    $.01$2, $negate.i.0$2 := (if p12$2 then BV64_SUB(4294967295bv64, BV32_ZEXT64(v13$2))[32:0] else $.01$2), (if p12$2 then 1bv8 else $negate.i.0$2);
    v15$1 := (if p10$1 then FADD32(FMUL32(UI32_TO_FP32($.01$1), 796917760bv32), 788529152bv32) else v15$1);
    v15$2 := (if p10$2 then FADD32(FMUL32(UI32_TO_FP32($.01$2), 796917760bv32), 788529152bv32) else v15$2);
    v16$1 := (if p10$1 then FSUB32(v15$1, 1056964608bv32) else v16$1);
    v16$2 := (if p10$2 then FSUB32(v15$2, 1056964608bv32) else v16$2);
    v17$1 := (if p10$1 then FLT32(3201763901bv32, v16$1) else v17$1);
    v17$2 := (if p10$2 then FLT32(3201763901bv32, v16$2) else v17$2);
    p14$1 := (if p10$1 && v17$1 then v17$1 else p14$1);
    p14$2 := (if p10$2 && v17$2 then v17$2 else p14$2);
    p13$1 := (if p10$1 && !v17$1 then !v17$1 else p13$1);
    p13$2 := (if p10$2 && !v17$2 then !v17$2 else p13$2);
    call {:sourceloc_num 25} v19$1, v19$2 := $__logf(p13$1, v15$1, p13$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__logf"} true;
    call {:sourceloc_num 26} v20$1, v20$2 := $__logf(p13$1, FSUB32(2147483648bv32, v19$1), p13$2, FSUB32(2147483648bv32, v19$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__logf"} true;
    $z.i.0$1 := (if p13$1 then FSUB32(2147483648bv32, FADD32(1051511190bv32, FMUL32(v20$1, FADD32(1064953398bv32, FMUL32(v20$1, FADD32(1042589753bv32, FMUL32(v20$1, FADD32(1021474156bv32, FMUL32(v20$1, FADD32(997962271bv32, FMUL32(v20$1, FADD32(969879925bv32, FMUL32(v20$1, FADD32(939980176bv32, FMUL32(v20$1, FADD32(882577068bv32, FMUL32(v20$1, 886349352bv32))))))))))))))))) else $z.i.0$1);
    $z.i.0$2 := (if p13$2 then FSUB32(2147483648bv32, FADD32(1051511190bv32, FMUL32(v20$2, FADD32(1064953398bv32, FMUL32(v20$2, FADD32(1042589753bv32, FMUL32(v20$2, FADD32(1021474156bv32, FMUL32(v20$2, FADD32(997962271bv32, FMUL32(v20$2, FADD32(969879925bv32, FMUL32(v20$2, FADD32(939980176bv32, FMUL32(v20$2, FADD32(882577068bv32, FMUL32(v20$2, 886349352bv32))))))))))))))))) else $z.i.0$2);
    v18$1 := (if p14$1 then FMUL32(v16$1, v16$1) else v18$1);
    v18$2 := (if p14$2 then FMUL32(v16$2, v16$2) else v18$2);
    $z.i.0$1 := (if p14$1 then FDIV32(FMUL32(v16$1, FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(3251341131bv32, v18$1), 1109758102bv32), v18$1), 3247762309bv32), v18$1), 1075866777bv32)), FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(1078484865bv32, v18$1), 3249045368bv32), v18$1), 1102621373bv32), v18$1), 3238499200bv32), v18$1), 1065353216bv32)) else $z.i.0$1);
    $z.i.0$2 := (if p14$2 then FDIV32(FMUL32(v16$2, FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(3251341131bv32, v18$2), 1109758102bv32), v18$2), 3247762309bv32), v18$2), 1075866777bv32)), FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(1078484865bv32, v18$2), 3249045368bv32), v18$2), 1102621373bv32), v18$2), 3238499200bv32), v18$2), 1065353216bv32)) else $z.i.0$2);
    p16$1 := (if p10$1 && $negate.i.0$1[1:0] == 1bv1 then $negate.i.0$1[1:0] == 1bv1 else p16$1);
    p16$2 := (if p10$2 && $negate.i.0$2[1:0] == 1bv1 then $negate.i.0$2[1:0] == 1bv1 else p16$2);
    p15$1 := (if p10$1 && !($negate.i.0$1[1:0] == 1bv1) then !($negate.i.0$1[1:0] == 1bv1) else p15$1);
    p15$2 := (if p10$2 && !($negate.i.0$2[1:0] == 1bv1) then !($negate.i.0$2[1:0] == 1bv1) else p15$2);
    $1$1 := (if p15$1 then $z.i.0$1 else $1$1);
    $1$2 := (if p15$2 then $z.i.0$2 else $1$2);
    $1$1 := (if p16$1 then FSUB32(2147483648bv32, $z.i.0$1) else $1$1);
    $1$2 := (if p16$2 then FSUB32(2147483648bv32, $z.i.0$2) else $1$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$d_Output(p10$1, $pos1.0$1, $1$1, $$d_Output[$pos1.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(p10$2, $pos1.0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$d_Output(p10$2, $pos1.0$2, $1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[$pos1.0$1] := (if p10$1 then $1$1 else $$d_Output[$pos1.0$1]);
    $$d_Output[$pos1.0$2] := (if p10$2 then $1$2 else $$d_Output[$pos1.0$2]);
    $pos1.0$1 := (if p10$1 then BV32_ADD($pos1.0$1, v1) else $pos1.0$1);
    $pos1.0$2 := (if p10$2 then BV32_ADD($pos1.0$2, v1) else $pos1.0$2);
    p9$1 := (if p10$1 then true else p9$1);
    p9$2 := (if p10$2 then true else p9$2);
    goto $14.backedge, $14.tail;

  $14.tail:
    assume !p9$1 && !p9$2;
    goto $25;

  $25:
    return;

  $14.backedge:
    assume {:backedge} p9$1 || p9$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $14;

  $truebb:
    assume {:partition} v2 && v2;
    $pos.0$1 := v0$1;
    $pos.0$2 := v0$2;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b14 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p0$1 ==> _b12 ==> p0$1 ==> MKPTR($arrayId$$d_Input, 0bv32) != MKPTR($arrayId$$null$, 0bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p0$2 ==> _b12 ==> p0$2 ==> MKPTR($arrayId$$d_Input, 0bv32) != MKPTR($arrayId$$null$, 0bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b11 ==> MKPTR($arrayId$$d_Input, 0bv32) != MKPTR($arrayId$$null$, 0bv32) && BV32_ULT($pos.0$1, $pathN) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b11 ==> MKPTR($arrayId$$d_Input, 0bv32) != MKPTR($arrayId$$null$, 0bv32) && BV32_ULT($pos.0$2, $pathN) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b10 ==> BV32_UGE($pos.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b10 ==> BV32_UGE($pos.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b9 ==> BV32_ULE($pos.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b9 ==> BV32_ULE($pos.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b8 ==> BV32_SGE($pos.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b8 ==> BV32_SGE($pos.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b7 ==> BV32_SLE($pos.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b7 ==> BV32_SLE($pos.0$2, v0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b6 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b6 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_ULT($pos.0$1, $pathN) else v3$1);
    v3$2 := (if p0$2 then BV32_ULT($pos.0$2, $pathN) else v3$2);
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
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    p0$1 := (if p0$1 && !v3$1 then v3$1 else p0$1);
    p0$2 := (if p0$2 && !v3$2 then v3$2 else p0$2);
    v4$1 := (if p1$1 then $$d_Input[$pos.0$1] else v4$1);
    v4$2 := (if p1$2 then $$d_Input[$pos.0$2] else v4$2);
    v5$1 := (if p1$1 then BV64_UGE(BV32_ZEXT64(v4$1), 2147483648bv64) else v5$1);
    v5$2 := (if p1$2 then BV64_UGE(BV32_ZEXT64(v4$2), 2147483648bv64) else v5$2);
    p3$1 := (if p1$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p1$2 && v5$2 then v5$2 else p3$2);
    p2$1 := (if p1$1 && !v5$1 then !v5$1 else p2$1);
    p2$2 := (if p1$2 && !v5$2 then !v5$2 else p2$2);
    $negate.i21.0$1, $.0$1 := (if p2$1 then 0bv8 else $negate.i21.0$1), (if p2$1 then v4$1 else $.0$1);
    $negate.i21.0$2, $.0$2 := (if p2$2 then 0bv8 else $negate.i21.0$2), (if p2$2 then v4$2 else $.0$2);
    $negate.i21.0$1, $.0$1 := (if p3$1 then 1bv8 else $negate.i21.0$1), (if p3$1 then BV64_SUB(4294967295bv64, BV32_ZEXT64(v4$1))[32:0] else $.0$1);
    $negate.i21.0$2, $.0$2 := (if p3$2 then 1bv8 else $negate.i21.0$2), (if p3$2 then BV64_SUB(4294967295bv64, BV32_ZEXT64(v4$2))[32:0] else $.0$2);
    v6$1 := (if p1$1 then FADD32(FMUL32(UI32_TO_FP32($.0$1), 796917760bv32), 788529152bv32) else v6$1);
    v6$2 := (if p1$2 then FADD32(FMUL32(UI32_TO_FP32($.0$2), 796917760bv32), 788529152bv32) else v6$2);
    v7$1 := (if p1$1 then FSUB32(v6$1, 1056964608bv32) else v7$1);
    v7$2 := (if p1$2 then FSUB32(v6$2, 1056964608bv32) else v7$2);
    v8$1 := (if p1$1 then FLT32(3201763901bv32, v7$1) else v8$1);
    v8$2 := (if p1$2 then FLT32(3201763901bv32, v7$2) else v8$2);
    p5$1 := (if p1$1 && v8$1 then v8$1 else p5$1);
    p5$2 := (if p1$2 && v8$2 then v8$2 else p5$2);
    p4$1 := (if p1$1 && !v8$1 then !v8$1 else p4$1);
    p4$2 := (if p1$2 && !v8$2 then !v8$2 else p4$2);
    call {:sourceloc_num 9} v10$1, v10$2 := $__logf(p4$1, v6$1, p4$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__logf"} true;
    call {:sourceloc_num 10} v11$1, v11$2 := $__logf(p4$1, FSUB32(2147483648bv32, v10$1), p4$2, FSUB32(2147483648bv32, v10$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__logf"} true;
    $z.i20.0$1 := (if p4$1 then FSUB32(2147483648bv32, FADD32(1051511190bv32, FMUL32(v11$1, FADD32(1064953398bv32, FMUL32(v11$1, FADD32(1042589753bv32, FMUL32(v11$1, FADD32(1021474156bv32, FMUL32(v11$1, FADD32(997962271bv32, FMUL32(v11$1, FADD32(969879925bv32, FMUL32(v11$1, FADD32(939980176bv32, FMUL32(v11$1, FADD32(882577068bv32, FMUL32(v11$1, 886349352bv32))))))))))))))))) else $z.i20.0$1);
    $z.i20.0$2 := (if p4$2 then FSUB32(2147483648bv32, FADD32(1051511190bv32, FMUL32(v11$2, FADD32(1064953398bv32, FMUL32(v11$2, FADD32(1042589753bv32, FMUL32(v11$2, FADD32(1021474156bv32, FMUL32(v11$2, FADD32(997962271bv32, FMUL32(v11$2, FADD32(969879925bv32, FMUL32(v11$2, FADD32(939980176bv32, FMUL32(v11$2, FADD32(882577068bv32, FMUL32(v11$2, 886349352bv32))))))))))))))))) else $z.i20.0$2);
    v9$1 := (if p5$1 then FMUL32(v7$1, v7$1) else v9$1);
    v9$2 := (if p5$2 then FMUL32(v7$2, v7$2) else v9$2);
    $z.i20.0$1 := (if p5$1 then FDIV32(FMUL32(v7$1, FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(3251341131bv32, v9$1), 1109758102bv32), v9$1), 3247762309bv32), v9$1), 1075866777bv32)), FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(1078484865bv32, v9$1), 3249045368bv32), v9$1), 1102621373bv32), v9$1), 3238499200bv32), v9$1), 1065353216bv32)) else $z.i20.0$1);
    $z.i20.0$2 := (if p5$2 then FDIV32(FMUL32(v7$2, FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(3251341131bv32, v9$2), 1109758102bv32), v9$2), 3247762309bv32), v9$2), 1075866777bv32)), FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(1078484865bv32, v9$2), 3249045368bv32), v9$2), 1102621373bv32), v9$2), 3238499200bv32), v9$2), 1065353216bv32)) else $z.i20.0$2);
    p7$1 := (if p1$1 && $negate.i21.0$1[1:0] == 1bv1 then $negate.i21.0$1[1:0] == 1bv1 else p7$1);
    p7$2 := (if p1$2 && $negate.i21.0$2[1:0] == 1bv1 then $negate.i21.0$2[1:0] == 1bv1 else p7$2);
    p6$1 := (if p1$1 && !($negate.i21.0$1[1:0] == 1bv1) then !($negate.i21.0$1[1:0] == 1bv1) else p6$1);
    p6$2 := (if p1$2 && !($negate.i21.0$2[1:0] == 1bv1) then !($negate.i21.0$2[1:0] == 1bv1) else p6$2);
    $0$1 := (if p6$1 then $z.i20.0$1 else $0$1);
    $0$2 := (if p6$2 then $z.i20.0$2 else $0$2);
    $0$1 := (if p7$1 then FSUB32(2147483648bv32, $z.i20.0$1) else $0$1);
    $0$2 := (if p7$2 then FSUB32(2147483648bv32, $z.i20.0$2) else $0$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$d_Output(p1$1, $pos.0$1, $0$1, $$d_Output[$pos.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(p1$2, $pos.0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$d_Output(p1$2, $pos.0$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[$pos.0$1] := (if p1$1 then $0$1 else $$d_Output[$pos.0$1]);
    $$d_Output[$pos.0$2] := (if p1$2 then $0$2 else $$d_Output[$pos.0$2]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, v1) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, v1) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p0$1 && !p0$2;
    goto $25;

  $2.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $2;
}



procedure {:source_name "__logf"} $__logf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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

const {:existential true} _b12: bool;

const _WATCHED_VALUE_$$d_Output: bv32;

procedure {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _READ_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Output);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _WRITE_HAS_OCCURRED_$$d_Output);
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



procedure _CHECK_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



const _WATCHED_VALUE_$$d_Input: bv32;

procedure {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _READ_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Input);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Input: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Input, _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _WRITE_HAS_OCCURRED_$$d_Input);
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



procedure _CHECK_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;
