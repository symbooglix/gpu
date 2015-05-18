type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_CallResult"} {:global} $$d_CallResult: [bv32]bv32;

axiom {:array_info "$$d_CallResult"} {:global} {:elem_width 32} {:source_name "d_CallResult"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_CallResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_CallResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_CallResult: bool;

var {:source_name "d_PutResult"} {:global} $$d_PutResult: [bv32]bv32;

axiom {:array_info "$$d_PutResult"} {:global} {:elem_width 32} {:source_name "d_PutResult"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_PutResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_PutResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_PutResult: bool;

axiom {:array_info "$$d_StockPrice"} {:global} {:elem_width 32} {:source_name "d_StockPrice"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_StockPrice: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_StockPrice: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_StockPrice: bool;

axiom {:array_info "$$d_OptionStrike"} {:global} {:elem_width 32} {:source_name "d_OptionStrike"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_OptionStrike: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_OptionStrike: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_OptionStrike: bool;

var {:source_name "d_OptionYears"} {:global} $$d_OptionYears: [bv32]bv32;

axiom {:array_info "$$d_OptionYears"} {:global} {:elem_width 32} {:source_name "d_OptionYears"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_OptionYears: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_OptionYears: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_OptionYears: bool;

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

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "BlackScholesGPU"} {:kernel} $_Z15BlackScholesGPUPfS_S_S_S_ffi($Riskfree: bv32, $Volatility: bv32, $optN: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $optN == 4000000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_CallResult && !_WRITE_HAS_OCCURRED_$$d_CallResult && !_ATOMIC_HAS_OCCURRED_$$d_CallResult;
  requires !_READ_HAS_OCCURRED_$$d_PutResult && !_WRITE_HAS_OCCURRED_$$d_PutResult && !_ATOMIC_HAS_OCCURRED_$$d_PutResult;
  requires !_READ_HAS_OCCURRED_$$d_StockPrice && !_WRITE_HAS_OCCURRED_$$d_StockPrice && !_ATOMIC_HAS_OCCURRED_$$d_StockPrice;
  requires !_READ_HAS_OCCURRED_$$d_OptionStrike && !_WRITE_HAS_OCCURRED_$$d_OptionStrike && !_ATOMIC_HAS_OCCURRED_$$d_OptionStrike;
  requires !_READ_HAS_OCCURRED_$$d_OptionYears && !_WRITE_HAS_OCCURRED_$$d_OptionYears && !_ATOMIC_HAS_OCCURRED_$$d_OptionYears;
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
  modifies _WRITE_HAS_OCCURRED_$$d_CallResult, _WRITE_READ_BENIGN_FLAG_$$d_CallResult, _WRITE_READ_BENIGN_FLAG_$$d_CallResult, _WRITE_HAS_OCCURRED_$$d_PutResult, _WRITE_READ_BENIGN_FLAG_$$d_PutResult, _WRITE_READ_BENIGN_FLAG_$$d_PutResult;



implementation {:source_name "BlackScholesGPU"} {:kernel} $_Z15BlackScholesGPUPfS_S_S_S_ffi($Riskfree: bv32, $Volatility: bv32, $optN: bv32)
{
  var $opt.0$1: bv32;
  var $opt.0$2: bv32;
  var $cnd.i.i.0$1: bv32;
  var $cnd.i.i.0$2: bv32;
  var $cnd.i8.i.0$1: bv32;
  var $cnd.i8.i.0$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
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
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    $opt.0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    $opt.0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b8 ==> _WRITE_HAS_OCCURRED_$$d_PutResult ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b7 ==> _WRITE_HAS_OCCURRED_$$d_CallResult ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($opt.0$1, $optN) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($opt.0$2, $optN) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($opt.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($opt.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($opt.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($opt.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($opt.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($opt.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($opt.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($opt.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $opt.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $opt.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $opt.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $opt.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLT($opt.0$1, $optN) else v0$1);
    v0$2 := (if p0$2 then BV32_SLT($opt.0$2, $optN) else v0$2);
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
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v1$1 := (if p1$1 then _HAVOC_bv32$1 else v1$1);
    v1$2 := (if p1$2 then _HAVOC_bv32$2 else v1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    v3$1 := (if p1$1 then $$d_OptionYears[$opt.0$1] else v3$1);
    v3$2 := (if p1$2 then $$d_OptionYears[$opt.0$2] else v3$2);
    v4$1 := (if p1$1 then FSQRT32(v3$1) else v4$1);
    v4$2 := (if p1$2 then FSQRT32(v3$2) else v4$2);
    call {:sourceloc_num 7} v5$1, v5$2 := $__logf(p1$1, FDIV32(v1$1, v2$1), p1$2, FDIV32(v1$2, v2$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__logf"} true;
    v6$1 := (if p1$1 then FDIV32(FADD32(v5$1, FMUL32(FADD32($Riskfree, FMUL32(FMUL32(1056964608bv32, $Volatility), $Volatility)), v3$1)), FMUL32($Volatility, v4$1)) else v6$1);
    v6$2 := (if p1$2 then FDIV32(FADD32(v5$2, FMUL32(FADD32($Riskfree, FMUL32(FMUL32(1056964608bv32, $Volatility), $Volatility)), v3$2)), FMUL32($Volatility, v4$2)) else v6$2);
    v7$1 := (if p1$1 then FSUB32(v6$1, FMUL32($Volatility, v4$1)) else v7$1);
    v7$2 := (if p1$2 then FSUB32(v6$2, FMUL32($Volatility, v4$2)) else v7$2);
    call {:sourceloc_num 8} v8$1, v8$2 := $fabsf(p1$1, v6$1, p1$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fabsf"} true;
    v9$1 := (if p1$1 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(1047344009bv32, v8$1))) else v9$1);
    v9$2 := (if p1$2 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(1047344009bv32, v8$2))) else v9$2);
    call {:sourceloc_num 9} v10$1, v10$2 := $__expf(p1$1, FMUL32(FMUL32(3204448256bv32, v6$1), v6$1), p1$2, FMUL32(FMUL32(3204448256bv32, v6$2), v6$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    v11$1 := (if p1$1 then FMUL32(FMUL32(1053573674bv32, v10$1), FMUL32(v9$1, FADD32(1050904058bv32, FMUL32(v9$1, FADD32(3199635335bv32, FMUL32(v9$1, FADD32(1071908728bv32, FMUL32(v9$1, FADD32(3219726058bv32, FMUL32(v9$1, 1068123759bv32)))))))))) else v11$1);
    v11$2 := (if p1$2 then FMUL32(FMUL32(1053573674bv32, v10$2), FMUL32(v9$2, FADD32(1050904058bv32, FMUL32(v9$2, FADD32(3199635335bv32, FMUL32(v9$2, FADD32(1071908728bv32, FMUL32(v9$2, FADD32(3219726058bv32, FMUL32(v9$2, 1068123759bv32)))))))))) else v11$2);
    v12$1 := (if p1$1 then FLT32(0bv32, v6$1) else v12$1);
    v12$2 := (if p1$2 then FLT32(0bv32, v6$2) else v12$2);
    p3$1 := (if p1$1 && v12$1 then v12$1 else p3$1);
    p3$2 := (if p1$2 && v12$2 then v12$2 else p3$2);
    p2$1 := (if p1$1 && !v12$1 then !v12$1 else p2$1);
    p2$2 := (if p1$2 && !v12$2 then !v12$2 else p2$2);
    $cnd.i.i.0$1 := (if p2$1 then v11$1 else $cnd.i.i.0$1);
    $cnd.i.i.0$2 := (if p2$2 then v11$2 else $cnd.i.i.0$2);
    $cnd.i.i.0$1 := (if p3$1 then FSUB32(1065353216bv32, v11$1) else $cnd.i.i.0$1);
    $cnd.i.i.0$2 := (if p3$2 then FSUB32(1065353216bv32, v11$2) else $cnd.i.i.0$2);
    call {:sourceloc_num 12} v13$1, v13$2 := $fabsf(p1$1, v7$1, p1$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fabsf"} true;
    v14$1 := (if p1$1 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(1047344009bv32, v13$1))) else v14$1);
    v14$2 := (if p1$2 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(1047344009bv32, v13$2))) else v14$2);
    call {:sourceloc_num 13} v15$1, v15$2 := $__expf(p1$1, FMUL32(FMUL32(3204448256bv32, v7$1), v7$1), p1$2, FMUL32(FMUL32(3204448256bv32, v7$2), v7$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    v16$1 := (if p1$1 then FMUL32(FMUL32(1053573674bv32, v15$1), FMUL32(v14$1, FADD32(1050904058bv32, FMUL32(v14$1, FADD32(3199635335bv32, FMUL32(v14$1, FADD32(1071908728bv32, FMUL32(v14$1, FADD32(3219726058bv32, FMUL32(v14$1, 1068123759bv32)))))))))) else v16$1);
    v16$2 := (if p1$2 then FMUL32(FMUL32(1053573674bv32, v15$2), FMUL32(v14$2, FADD32(1050904058bv32, FMUL32(v14$2, FADD32(3199635335bv32, FMUL32(v14$2, FADD32(1071908728bv32, FMUL32(v14$2, FADD32(3219726058bv32, FMUL32(v14$2, 1068123759bv32)))))))))) else v16$2);
    v17$1 := (if p1$1 then FLT32(0bv32, v7$1) else v17$1);
    v17$2 := (if p1$2 then FLT32(0bv32, v7$2) else v17$2);
    p5$1 := (if p1$1 && v17$1 then v17$1 else p5$1);
    p5$2 := (if p1$2 && v17$2 then v17$2 else p5$2);
    p4$1 := (if p1$1 && !v17$1 then !v17$1 else p4$1);
    p4$2 := (if p1$2 && !v17$2 then !v17$2 else p4$2);
    $cnd.i8.i.0$1 := (if p4$1 then v16$1 else $cnd.i8.i.0$1);
    $cnd.i8.i.0$2 := (if p4$2 then v16$2 else $cnd.i8.i.0$2);
    $cnd.i8.i.0$1 := (if p5$1 then FSUB32(1065353216bv32, v16$1) else $cnd.i8.i.0$1);
    $cnd.i8.i.0$2 := (if p5$2 then FSUB32(1065353216bv32, v16$2) else $cnd.i8.i.0$2);
    call {:sourceloc_num 16} v18$1, v18$2 := $__expf(p1$1, FMUL32(FSUB32(2147483648bv32, $Riskfree), v3$1), p1$2, FMUL32(FSUB32(2147483648bv32, $Riskfree), v3$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$d_CallResult(p1$1, $opt.0$1, FSUB32(FMUL32(v1$1, $cnd.i.i.0$1), FMUL32(FMUL32(v2$1, v18$1), $cnd.i8.i.0$1)), $$d_CallResult[$opt.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallResult(p1$2, $opt.0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$d_CallResult(p1$2, $opt.0$2, FSUB32(FMUL32(v1$2, $cnd.i.i.0$2), FMUL32(FMUL32(v2$2, v18$2), $cnd.i8.i.0$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallResult"} true;
    $$d_CallResult[$opt.0$1] := (if p1$1 then FSUB32(FMUL32(v1$1, $cnd.i.i.0$1), FMUL32(FMUL32(v2$1, v18$1), $cnd.i8.i.0$1)) else $$d_CallResult[$opt.0$1]);
    $$d_CallResult[$opt.0$2] := (if p1$2 then FSUB32(FMUL32(v1$2, $cnd.i.i.0$2), FMUL32(FMUL32(v2$2, v18$2), $cnd.i8.i.0$2)) else $$d_CallResult[$opt.0$2]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$d_PutResult(p1$1, $opt.0$1, FSUB32(FMUL32(FMUL32(v2$1, v18$1), FSUB32(1065353216bv32, $cnd.i8.i.0$1)), FMUL32(v1$1, FSUB32(1065353216bv32, $cnd.i.i.0$1))), $$d_PutResult[$opt.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PutResult(p1$2, $opt.0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$d_PutResult(p1$2, $opt.0$2, FSUB32(FMUL32(FMUL32(v2$2, v18$2), FSUB32(1065353216bv32, $cnd.i8.i.0$2)), FMUL32(v1$2, FSUB32(1065353216bv32, $cnd.i.i.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_PutResult"} true;
    $$d_PutResult[$opt.0$1] := (if p1$1 then FSUB32(FMUL32(FMUL32(v2$1, v18$1), FSUB32(1065353216bv32, $cnd.i8.i.0$1)), FMUL32(v1$1, FSUB32(1065353216bv32, $cnd.i.i.0$1))) else $$d_PutResult[$opt.0$1]);
    $$d_PutResult[$opt.0$2] := (if p1$2 then FSUB32(FMUL32(FMUL32(v2$2, v18$2), FSUB32(1065353216bv32, $cnd.i8.i.0$2)), FMUL32(v1$2, FSUB32(1065353216bv32, $cnd.i.i.0$2))) else $$d_PutResult[$opt.0$2]);
    $opt.0$1 := (if p1$1 then BV32_ADD($opt.0$1, BV32_MUL(group_size_x, num_groups_x)) else $opt.0$1);
    $opt.0$2 := (if p1$2 then BV32_ADD($opt.0$2, BV32_MUL(group_size_x, num_groups_x)) else $opt.0$2);
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
}



procedure {:source_name "__logf"} $__logf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "__expf"} $__expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "fabsf"} $fabsf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 480bv32 then 1bv1 else 0bv1) != 0bv1;

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

const {:existential true} _b2: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const _WATCHED_VALUE_$$d_CallResult: bv32;

procedure {:inline 1} _LOG_READ_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_CallResult;



implementation {:inline 1} _LOG_READ_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_CallResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallResult == _value then true else _READ_HAS_OCCURRED_$$d_CallResult);
    return;
}



procedure _CHECK_READ_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_CallResult);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_CallResult: bool;

procedure {:inline 1} _LOG_WRITE_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_CallResult, _WRITE_READ_BENIGN_FLAG_$$d_CallResult;



implementation {:inline 1} _LOG_WRITE_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_CallResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallResult == _value then true else _WRITE_HAS_OCCURRED_$$d_CallResult);
    _WRITE_READ_BENIGN_FLAG_$$d_CallResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallResult == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_CallResult);
    return;
}



procedure _CHECK_WRITE_$$d_CallResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallResult != _value);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallResult != _value);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_CallResult(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_CallResult;



implementation {:inline 1} _LOG_ATOMIC_$$d_CallResult(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_CallResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_CallResult);
    return;
}



procedure _CHECK_ATOMIC_$$d_CallResult(_P: bool, _offset: bv32);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_CallResult"} {:array "$$d_CallResult"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallResult(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_CallResult;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallResult(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_CallResult := (if _P && _WRITE_HAS_OCCURRED_$$d_CallResult && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_CallResult);
    return;
}



const _WATCHED_VALUE_$$d_PutResult: bv32;

procedure {:inline 1} _LOG_READ_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_PutResult;



implementation {:inline 1} _LOG_READ_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_PutResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PutResult == _value then true else _READ_HAS_OCCURRED_$$d_PutResult);
    return;
}



procedure _CHECK_READ_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_PutResult);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_PutResult: bool;

procedure {:inline 1} _LOG_WRITE_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_PutResult, _WRITE_READ_BENIGN_FLAG_$$d_PutResult;



implementation {:inline 1} _LOG_WRITE_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_PutResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PutResult == _value then true else _WRITE_HAS_OCCURRED_$$d_PutResult);
    _WRITE_READ_BENIGN_FLAG_$$d_PutResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PutResult == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_PutResult);
    return;
}



procedure _CHECK_WRITE_$$d_PutResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PutResult != _value);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PutResult != _value);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_PutResult(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_PutResult;



implementation {:inline 1} _LOG_ATOMIC_$$d_PutResult(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_PutResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_PutResult);
    return;
}



procedure _CHECK_ATOMIC_$$d_PutResult(_P: bool, _offset: bv32);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_PutResult"} {:array "$$d_PutResult"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PutResult(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_PutResult;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PutResult(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_PutResult := (if _P && _WRITE_HAS_OCCURRED_$$d_PutResult && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_PutResult);
    return;
}



const _WATCHED_VALUE_$$d_StockPrice: bv32;

procedure {:inline 1} _LOG_READ_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_StockPrice;



implementation {:inline 1} _LOG_READ_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_StockPrice := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_StockPrice == _value then true else _READ_HAS_OCCURRED_$$d_StockPrice);
    return;
}



procedure _CHECK_READ_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_StockPrice);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_StockPrice: bool;

procedure {:inline 1} _LOG_WRITE_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_StockPrice, _WRITE_READ_BENIGN_FLAG_$$d_StockPrice;



implementation {:inline 1} _LOG_WRITE_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_StockPrice := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_StockPrice == _value then true else _WRITE_HAS_OCCURRED_$$d_StockPrice);
    _WRITE_READ_BENIGN_FLAG_$$d_StockPrice := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_StockPrice == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_StockPrice);
    return;
}



procedure _CHECK_WRITE_$$d_StockPrice(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_StockPrice != _value);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_StockPrice != _value);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_StockPrice(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_StockPrice;



implementation {:inline 1} _LOG_ATOMIC_$$d_StockPrice(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_StockPrice := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_StockPrice);
    return;
}



procedure _CHECK_ATOMIC_$$d_StockPrice(_P: bool, _offset: bv32);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_StockPrice"} {:array "$$d_StockPrice"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_StockPrice(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_StockPrice;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_StockPrice(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_StockPrice := (if _P && _WRITE_HAS_OCCURRED_$$d_StockPrice && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_StockPrice);
    return;
}



const _WATCHED_VALUE_$$d_OptionStrike: bv32;

procedure {:inline 1} _LOG_READ_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_OptionStrike;



implementation {:inline 1} _LOG_READ_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_OptionStrike := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionStrike == _value then true else _READ_HAS_OCCURRED_$$d_OptionStrike);
    return;
}



procedure _CHECK_READ_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike: bool;

procedure {:inline 1} _LOG_WRITE_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_OptionStrike, _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike;



implementation {:inline 1} _LOG_WRITE_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_OptionStrike := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionStrike == _value then true else _WRITE_HAS_OCCURRED_$$d_OptionStrike);
    _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionStrike == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike);
    return;
}



procedure _CHECK_WRITE_$$d_OptionStrike(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionStrike != _value);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionStrike != _value);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_OptionStrike(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_OptionStrike;



implementation {:inline 1} _LOG_ATOMIC_$$d_OptionStrike(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_OptionStrike := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_OptionStrike);
    return;
}



procedure _CHECK_ATOMIC_$$d_OptionStrike(_P: bool, _offset: bv32);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_OptionStrike"} {:array "$$d_OptionStrike"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionStrike(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionStrike(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike := (if _P && _WRITE_HAS_OCCURRED_$$d_OptionStrike && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_OptionStrike);
    return;
}



const _WATCHED_VALUE_$$d_OptionYears: bv32;

procedure {:inline 1} _LOG_READ_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_OptionYears;



implementation {:inline 1} _LOG_READ_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_OptionYears := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionYears == _value then true else _READ_HAS_OCCURRED_$$d_OptionYears);
    return;
}



procedure _CHECK_READ_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_OptionYears);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_OptionYears: bool;

procedure {:inline 1} _LOG_WRITE_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_OptionYears, _WRITE_READ_BENIGN_FLAG_$$d_OptionYears;



implementation {:inline 1} _LOG_WRITE_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_OptionYears := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionYears == _value then true else _WRITE_HAS_OCCURRED_$$d_OptionYears);
    _WRITE_READ_BENIGN_FLAG_$$d_OptionYears := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionYears == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_OptionYears);
    return;
}



procedure _CHECK_WRITE_$$d_OptionYears(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionYears != _value);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionYears != _value);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_OptionYears(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_OptionYears;



implementation {:inline 1} _LOG_ATOMIC_$$d_OptionYears(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_OptionYears := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_OptionYears);
    return;
}



procedure _CHECK_ATOMIC_$$d_OptionYears(_P: bool, _offset: bv32);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_OptionYears"} {:array "$$d_OptionYears"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionYears(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_OptionYears;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionYears(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_OptionYears := (if _P && _WRITE_HAS_OCCURRED_$$d_OptionYears && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_OptionYears);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;
