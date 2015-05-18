type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "s"} {:global} $$s: [bv32]bv32;

axiom {:array_info "$$s"} {:global} {:elem_width 32} {:source_name "s"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$s: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$s: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$s: bool;

var {:source_name "x"} {:global} $$x: [bv32]bv32;

axiom {:array_info "$$x"} {:global} {:elem_width 32} {:source_name "x"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$x: bool;

axiom {:array_info "$$vdt"} {:global} {:elem_width 32} {:source_name "vdt"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vdt: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vdt: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vdt: bool;

axiom {:array_info "$$pu_by_df"} {:global} {:elem_width 32} {:source_name "pu_by_df"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pu_by_df: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pu_by_df: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pu_by_df: bool;

axiom {:array_info "$$pd_by_df"} {:global} {:elem_width 32} {:source_name "pd_by_df"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pd_by_df: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pd_by_df: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pd_by_df: bool;

var {:source_name "call_value"} {:global} $$call_value: [bv32]bv32;

axiom {:array_info "$$call_value"} {:global} {:elem_width 32} {:source_name "call_value"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$call_value: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$call_value: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$call_value: bool;

var {:source_name "call_buffer"} {:global} $$call_buffer: [bv32]bv32;

axiom {:array_info "$$call_buffer"} {:global} {:elem_width 32} {:source_name "call_buffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$call_buffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$call_buffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$call_buffer: bool;

var {:source_name "call_a"} {:group_shared} $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:group_shared} {:elem_width 32} {:source_name "call_a"} {:source_elem_width 32} {:source_dimensions "257"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: bool;

var {:source_name "call_b"} {:group_shared} $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:group_shared} {:elem_width 32} {:source_name "call_b"} {:source_elem_width 32} {:source_dimensions "257"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: bool;

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

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "binomial_options_kernel"} {:kernel} $_Z23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_();
  requires !_READ_HAS_OCCURRED_$$s && !_WRITE_HAS_OCCURRED_$$s && !_ATOMIC_HAS_OCCURRED_$$s;
  requires !_READ_HAS_OCCURRED_$$x && !_WRITE_HAS_OCCURRED_$$x && !_ATOMIC_HAS_OCCURRED_$$x;
  requires !_READ_HAS_OCCURRED_$$vdt && !_WRITE_HAS_OCCURRED_$$vdt && !_ATOMIC_HAS_OCCURRED_$$vdt;
  requires !_READ_HAS_OCCURRED_$$pu_by_df && !_WRITE_HAS_OCCURRED_$$pu_by_df && !_ATOMIC_HAS_OCCURRED_$$pu_by_df;
  requires !_READ_HAS_OCCURRED_$$pd_by_df && !_WRITE_HAS_OCCURRED_$$pd_by_df && !_ATOMIC_HAS_OCCURRED_$$pd_by_df;
  requires !_READ_HAS_OCCURRED_$$call_value && !_WRITE_HAS_OCCURRED_$$call_value && !_ATOMIC_HAS_OCCURRED_$$call_value;
  requires !_READ_HAS_OCCURRED_$$call_buffer && !_WRITE_HAS_OCCURRED_$$call_buffer && !_ATOMIC_HAS_OCCURRED_$$call_buffer;
  requires !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
  requires !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
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
  modifies $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, _WRITE_HAS_OCCURRED_$$call_buffer, _WRITE_READ_BENIGN_FLAG_$$call_buffer, _WRITE_READ_BENIGN_FLAG_$$call_buffer, _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, _WRITE_HAS_OCCURRED_$$call_value, _WRITE_READ_BENIGN_FLAG_$$call_value, _WRITE_READ_BENIGN_FLAG_$$call_value, _READ_HAS_OCCURRED_$$call_buffer, _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, $$call_value, $$call_buffer, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;



implementation {:source_name "binomial_options_kernel"} {:kernel} $_Z23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_()
{
  var $index.0$1: bv32;
  var $index.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $i.0: bv32;
  var $c_base.0: bv32;
  var $1: bv32;
  var $k.0: bv32;
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
  var v5$1: bv64;
  var v5$2: bv64;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8: bool;
  var v9: bool;
  var v10: bool;
  var v11: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14: bool;
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
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bv32;
  var v26$2: bv32;
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
    $index.0$1 := local_id_x$1;
    $index.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessBreak"} _b24 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b23 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLE($index.0$1, 2048bv32) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLE($index.0$2, 2048bv32) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($index.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($index.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($index.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($index.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($index.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($index.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($index.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($index.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $index.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $index.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $index.0$1) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $index.0$2) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLE($index.0$1, 2048bv32) else v0$1);
    v0$2 := (if p0$2 then BV32_SLE($index.0$2, 2048bv32) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    v1$1 := (if p1$1 then BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), $index.0$1) else v1$1);
    v1$2 := (if p1$2 then BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), $index.0$2) else v1$2);
    v2$1 := (if p1$1 then $$s[group_id_x$1] else v2$1);
    v2$2 := (if p1$2 then $$s[group_id_x$2] else v2$2);
    v3$1 := (if p1$1 then $$x[group_id_x$1] else v3$1);
    v3$2 := (if p1$2 then $$x[group_id_x$2] else v3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p1$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv32$2 else v4$2);
    call {:sourceloc_num 6} v5$1, v5$2 := $exp(p1$1, FP32_CONV64(FMUL32(v4$1, FSUB32(FMUL32(1073741824bv32, SI32_TO_FP32($index.0$1)), 1157627904bv32))), p1$2, FP32_CONV64(FMUL32(v4$2, FSUB32(FMUL32(1073741824bv32, SI32_TO_FP32($index.0$2)), 1157627904bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "$exp"} true;
    v6$1 := (if p1$1 then FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v2$1), v5$1), FP32_CONV64(v3$1))) else v6$1);
    v6$2 := (if p1$2 then FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v2$2), v5$2), FP32_CONV64(v3$2))) else v6$2);
    v7$1 := (if p1$1 then FLT32(0bv32, v6$1) else v7$1);
    v7$2 := (if p1$2 then FLT32(0bv32, v6$2) else v7$2);
    p3$1 := (if p1$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p1$2 && v7$2 then v7$2 else p3$2);
    p2$1 := (if p1$1 && !v7$1 then !v7$1 else p2$1);
    p2$2 := (if p1$2 && !v7$2 then !v7$2 else p2$2);
    $0$1 := (if p2$1 then 0bv32 else $0$1);
    $0$2 := (if p2$2 then 0bv32 else $0$2);
    $0$1 := (if p3$1 then v6$1 else $0$1);
    $0$2 := (if p3$2 then v6$2 else $0$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$call_buffer(p1$1, v1$1, $0$1, $$call_buffer[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_buffer(p1$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$call_buffer(p1$2, v1$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$call_buffer"} true;
    $$call_buffer[v1$1] := (if p1$1 then $0$1 else $$call_buffer[v1$1]);
    $$call_buffer[v1$2] := (if p1$2 then $0$2 else $$call_buffer[v1$2]);
    $index.0$1 := (if p1$1 then BV32_ADD($index.0$1, 256bv32) else $index.0$1);
    $index.0$2 := (if p1$2 then BV32_ADD($index.0$2, 256bv32) else $index.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    $i.0 := 2048bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b42 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b41 ==> _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b40 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "noread"} _b39 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b38 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b37 ==> _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b36 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assert {:tag "noread"} _b35 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assert {:tag "accessBreak"} _b34 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessBreak"} _b33 ==> _READ_HAS_OCCURRED_$$call_buffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b32 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b31 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessUpperBoundBlock"} _b30 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b29 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b28 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b27 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "nowrite"} _b26 ==> !_WRITE_HAS_OCCURRED_$$call_buffer;
    assert {:tag "noread"} _b25 ==> !_READ_HAS_OCCURRED_$$call_buffer;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_UGE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_UGE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_ULE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_ULE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_SGE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_SGE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SLE($i.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SLE($i.0, 2048bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b7 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b7 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 13} true;
    v8 := BV32_SGT($i.0, 0bv32);
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v8 && !v8;
    v25$1 := local_id_x$1 == 0bv32;
    v25$2 := local_id_x$2 == 0bv32;
    p9$1 := (if v25$1 then v25$1 else p9$1);
    p9$2 := (if v25$2 then v25$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p9$1, 0bv32, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p9$2, 0bv32, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} true;
    v26$1 := (if p9$1 then $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][0bv32] else v26$1);
    v26$2 := (if p9$2 then $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v26$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$call_value(p9$1, group_id_x$1, v26$1, $$call_value[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_value(p9$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$call_value(p9$2, group_id_x$2, v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$call_value"} true;
    $$call_value[group_id_x$1] := (if p9$1 then v26$1 else $$call_value[group_id_x$1]);
    $$call_value[group_id_x$2] := (if p9$2 then v26$2 else $$call_value[group_id_x$2]);
    return;

  $truebb1:
    assume {:partition} v8 && v8;
    $c_base.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b60 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b59 ==> _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b58 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "noread"} _b57 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b56 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b55 ==> _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b54 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assert {:tag "noread"} _b53 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assert {:tag "accessBreak"} _b52 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessBreak"} _b51 ==> _READ_HAS_OCCURRED_$$call_buffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b50 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b49 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessUpperBoundBlock"} _b48 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b47 ==> _WRITE_HAS_OCCURRED_$$call_buffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b46 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b45 ==> _READ_HAS_OCCURRED_$$call_buffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "nowrite"} _b44 ==> !_WRITE_HAS_OCCURRED_$$call_buffer;
    assert {:tag "noread"} _b43 ==> !_READ_HAS_OCCURRED_$$call_buffer;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b17 ==> BV32_UGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b17 ==> BV32_UGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b16 ==> BV32_ULE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b16 ==> BV32_ULE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b15 ==> BV32_SGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b15 ==> BV32_SGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_SLE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_SLE($c_base.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b13 ==> BV32_SLE(0bv32, $c_base.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b13 ==> BV32_SLE(0bv32, $c_base.0);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b12 ==> BV32_AND(BV32_SUB(224bv32, 1bv32), $c_base.0) == BV32_AND(BV32_SUB(224bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b12 ==> BV32_AND(BV32_SUB(224bv32, 1bv32), $c_base.0) == BV32_AND(BV32_SUB(224bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v9 := BV32_SLT($c_base.0, $i.0);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v9 && !v9;
    $i.0 := BV32_SUB($i.0, 32bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $truebb2:
    assume {:partition} v9 && v9;
    v10 := BV32_SLT(255bv32, BV32_SUB($i.0, $c_base.0));
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v10 && !v10;
    $1 := BV32_SUB($i.0, $c_base.0);
    goto $13;

  $13:
    v11 := BV32_SUB($1, 32bv32);
    v12$1 := BV32_SLE(local_id_x$1, $1);
    v12$2 := BV32_SLE(local_id_x$2, $1);
    p6$1 := (if v12$1 then v12$1 else p6$1);
    p6$2 := (if v12$2 then v12$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$call_buffer(p6$1, BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1)), $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$call_buffer(p6$2, BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2)), $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$call_buffer"} true;
    v13$1 := (if p6$1 then $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1))] else v13$1);
    v13$2 := (if p6$2 then $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2))] else v13$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p6$1, local_id_x$1, v13$1, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p6$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p6$2, local_id_x$2, v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} true;
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1] := (if p6$1 then v13$1 else $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1]);
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p6$2 then v13$2 else $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    $k.0 := BV32_SUB($1, 1bv32);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b66 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b65 ==> _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b64 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "noread"} _b63 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b62 ==> _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b61 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b22 ==> BV32_UGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b22 ==> BV32_UGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b21 ==> BV32_ULE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b21 ==> BV32_ULE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b20 ==> BV32_SGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b20 ==> BV32_SGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b19 ==> BV32_SLE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b19 ==> BV32_SLE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "guardNonNeg"} {:thread 1} _b18 ==> BV32_SLE(0bv32, $k.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b18 ==> BV32_SLE(0bv32, $k.0);
    assert {:block_sourceloc} {:sourceloc_num 24} true;
    v14 := BV32_SGE($k.0, v11);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    goto __partitioned_block_$truebb5_0, __partitioned_block_$falsebb5_0;

  __partitioned_block_$falsebb5_0:
    assume {:partition} !v14 && !v14;
    goto __partitioned_block_$falsebb5_1;

  __partitioned_block_$falsebb5_1:
    call {:sourceloc_num 39} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v23$1 := BV32_SLE(local_id_x$1, v11);
    v23$2 := BV32_SLE(local_id_x$2, v11);
    p8$1 := (if v23$1 then v23$1 else p8$1);
    p8$2 := (if v23$2 then v23$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p8$1, local_id_x$1, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(p8$2, local_id_x$2, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} true;
    v24$1 := (if p8$1 then $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1] else v24$1);
    v24$2 := (if p8$2 then $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v24$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$call_buffer(p8$1, BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1)), v24$1, $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_buffer(p8$2, BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$call_buffer(p8$2, BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2)), v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$call_buffer"} true;
    $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1))] := (if p8$1 then v24$1 else $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$1, 2064bv32), BV32_ADD($c_base.0, local_id_x$1))]);
    $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2))] := (if p8$2 then v24$2 else $$call_buffer[BV32_ADD(BV32_MUL(group_id_x$2, 2064bv32), BV32_ADD($c_base.0, local_id_x$2))]);
    $c_base.0 := BV32_ADD($c_base.0, 224bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $9;

  __partitioned_block_$truebb5_0:
    assume {:partition} v14 && v14;
    goto __partitioned_block_$truebb5_1;

  __partitioned_block_$truebb5_1:
    call {:sourceloc_num 26} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    havoc v15$1, v15$2;
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 28} true;
    v16$1 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][BV32_ADD(local_id_x$1, 1bv32)];
    v16$2 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)];
    havoc v17$1, v17$2;
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 30} true;
    v18$1 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1];
    v18$2 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, local_id_x$1, FADD32(FMUL32(v15$1, v16$1), FMUL32(v17$1, v18$1)), $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, local_id_x$2, FADD32(FMUL32(v15$2, v16$2), FMUL32(v17$2, v18$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} true;
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][local_id_x$1] := FADD32(FMUL32(v15$1, v16$1), FMUL32(v17$1, v18$1));
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := FADD32(FMUL32(v15$2, v16$2), FMUL32(v17$2, v18$2));
    goto __partitioned_block_$truebb5_2;

  __partitioned_block_$truebb5_2:
    call {:sourceloc_num 32} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    havoc v19$1, v19$2;
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, BV32_ADD(local_id_x$1, 1bv32), $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][BV32_ADD(local_id_x$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, BV32_ADD(local_id_x$2, 1bv32), $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} true;
    v20$1 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][BV32_ADD(local_id_x$1, 1bv32)];
    v20$2 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)];
    havoc v21$1, v21$2;
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, local_id_x$1, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(true, local_id_x$2, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} true;
    v22$1 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[1bv1][local_id_x$1];
    v22$2 := $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(true, local_id_x$1, FADD32(FMUL32(v19$1, v20$1), FMUL32(v21$1, v22$1)), $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(true, local_id_x$2, FADD32(FMUL32(v19$2, v20$2), FMUL32(v21$2, v22$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} true;
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[1bv1][local_id_x$1] := FADD32(FMUL32(v19$1, v20$1), FMUL32(v21$1, v22$1));
    $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := FADD32(FMUL32(v19$2, v20$2), FMUL32(v21$2, v22$2));
    $k.0 := BV32_ADD($k.0, 4294967294bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $16;

  $truebb3:
    assume {:partition} v10 && v10;
    $1 := 255bv32;
    goto $13;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



procedure {:source_name "exp"} $exp(_P$1: bool, $0$1: bv64, _P$2: bool, $0$2: bv64) returns ($ret$1: bv64, $ret$2: bv64);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, $$call_value, $$call_buffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, $$call_value, $$call_buffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, $$call_value, $$call_buffer, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

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

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const _WATCHED_VALUE_$$s: bv32;

procedure {:inline 1} _LOG_READ_$$s(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$s;



implementation {:inline 1} _LOG_READ_$$s(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$s := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s == _value then true else _READ_HAS_OCCURRED_$$s);
    return;
}



procedure _CHECK_READ_$$s(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s"} {:array "$$s"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$s);
  requires {:source_name "s"} {:array "$$s"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$s: bool;

procedure {:inline 1} _LOG_WRITE_$$s(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$s, _WRITE_READ_BENIGN_FLAG_$$s;



implementation {:inline 1} _LOG_WRITE_$$s(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$s := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s == _value then true else _WRITE_HAS_OCCURRED_$$s);
    _WRITE_READ_BENIGN_FLAG_$$s := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$s);
    return;
}



procedure _CHECK_WRITE_$$s(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s"} {:array "$$s"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s != _value);
  requires {:source_name "s"} {:array "$$s"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s != _value);
  requires {:source_name "s"} {:array "$$s"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$s(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$s;



implementation {:inline 1} _LOG_ATOMIC_$$s(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$s := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$s);
    return;
}



procedure _CHECK_ATOMIC_$$s(_P: bool, _offset: bv32);
  requires {:source_name "s"} {:array "$$s"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset);
  requires {:source_name "s"} {:array "$$s"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$s(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$s;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$s(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$s := (if _P && _WRITE_HAS_OCCURRED_$$s && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$s);
    return;
}



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



const _WATCHED_VALUE_$$vdt: bv32;

procedure {:inline 1} _LOG_READ_$$vdt(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vdt;



implementation {:inline 1} _LOG_READ_$$vdt(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vdt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vdt == _value then true else _READ_HAS_OCCURRED_$$vdt);
    return;
}



procedure _CHECK_READ_$$vdt(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vdt);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vdt: bool;

procedure {:inline 1} _LOG_WRITE_$$vdt(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vdt, _WRITE_READ_BENIGN_FLAG_$$vdt;



implementation {:inline 1} _LOG_WRITE_$$vdt(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vdt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vdt == _value then true else _WRITE_HAS_OCCURRED_$$vdt);
    _WRITE_READ_BENIGN_FLAG_$$vdt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vdt == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vdt);
    return;
}



procedure _CHECK_WRITE_$$vdt(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vdt != _value);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vdt != _value);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vdt(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vdt;



implementation {:inline 1} _LOG_ATOMIC_$$vdt(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vdt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vdt);
    return;
}



procedure _CHECK_ATOMIC_$$vdt(_P: bool, _offset: bv32);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset);
  requires {:source_name "vdt"} {:array "$$vdt"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vdt(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vdt;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vdt(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vdt := (if _P && _WRITE_HAS_OCCURRED_$$vdt && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vdt);
    return;
}



const _WATCHED_VALUE_$$pu_by_df: bv32;

procedure {:inline 1} _LOG_READ_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pu_by_df;



implementation {:inline 1} _LOG_READ_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pu_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pu_by_df == _value then true else _READ_HAS_OCCURRED_$$pu_by_df);
    return;
}



procedure _CHECK_READ_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pu_by_df);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pu_by_df: bool;

procedure {:inline 1} _LOG_WRITE_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pu_by_df, _WRITE_READ_BENIGN_FLAG_$$pu_by_df;



implementation {:inline 1} _LOG_WRITE_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pu_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pu_by_df == _value then true else _WRITE_HAS_OCCURRED_$$pu_by_df);
    _WRITE_READ_BENIGN_FLAG_$$pu_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pu_by_df == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pu_by_df);
    return;
}



procedure _CHECK_WRITE_$$pu_by_df(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pu_by_df != _value);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pu_by_df != _value);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pu_by_df(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pu_by_df;



implementation {:inline 1} _LOG_ATOMIC_$$pu_by_df(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pu_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pu_by_df);
    return;
}



procedure _CHECK_ATOMIC_$$pu_by_df(_P: bool, _offset: bv32);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset);
  requires {:source_name "pu_by_df"} {:array "$$pu_by_df"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pu_by_df(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pu_by_df;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pu_by_df(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pu_by_df := (if _P && _WRITE_HAS_OCCURRED_$$pu_by_df && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pu_by_df);
    return;
}



const _WATCHED_VALUE_$$pd_by_df: bv32;

procedure {:inline 1} _LOG_READ_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pd_by_df;



implementation {:inline 1} _LOG_READ_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pd_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pd_by_df == _value then true else _READ_HAS_OCCURRED_$$pd_by_df);
    return;
}



procedure _CHECK_READ_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pd_by_df);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pd_by_df: bool;

procedure {:inline 1} _LOG_WRITE_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pd_by_df, _WRITE_READ_BENIGN_FLAG_$$pd_by_df;



implementation {:inline 1} _LOG_WRITE_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pd_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pd_by_df == _value then true else _WRITE_HAS_OCCURRED_$$pd_by_df);
    _WRITE_READ_BENIGN_FLAG_$$pd_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pd_by_df == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pd_by_df);
    return;
}



procedure _CHECK_WRITE_$$pd_by_df(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pd_by_df != _value);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pd_by_df != _value);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pd_by_df(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pd_by_df;



implementation {:inline 1} _LOG_ATOMIC_$$pd_by_df(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pd_by_df := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pd_by_df);
    return;
}



procedure _CHECK_ATOMIC_$$pd_by_df(_P: bool, _offset: bv32);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset);
  requires {:source_name "pd_by_df"} {:array "$$pd_by_df"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pd_by_df(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pd_by_df;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pd_by_df(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pd_by_df := (if _P && _WRITE_HAS_OCCURRED_$$pd_by_df && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pd_by_df);
    return;
}



const _WATCHED_VALUE_$$call_value: bv32;

procedure {:inline 1} _LOG_READ_$$call_value(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$call_value;



implementation {:inline 1} _LOG_READ_$$call_value(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$call_value := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_value == _value then true else _READ_HAS_OCCURRED_$$call_value);
    return;
}



procedure _CHECK_READ_$$call_value(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$call_value);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$call_value: bool;

procedure {:inline 1} _LOG_WRITE_$$call_value(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$call_value, _WRITE_READ_BENIGN_FLAG_$$call_value;



implementation {:inline 1} _LOG_WRITE_$$call_value(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$call_value := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_value == _value then true else _WRITE_HAS_OCCURRED_$$call_value);
    _WRITE_READ_BENIGN_FLAG_$$call_value := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_value == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$call_value);
    return;
}



procedure _CHECK_WRITE_$$call_value(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_value != _value);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_value != _value);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$call_value(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$call_value;



implementation {:inline 1} _LOG_ATOMIC_$$call_value(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$call_value := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$call_value);
    return;
}



procedure _CHECK_ATOMIC_$$call_value(_P: bool, _offset: bv32);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset);
  requires {:source_name "call_value"} {:array "$$call_value"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_value(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$call_value;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_value(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$call_value := (if _P && _WRITE_HAS_OCCURRED_$$call_value && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$call_value);
    return;
}



const _WATCHED_VALUE_$$call_buffer: bv32;

procedure {:inline 1} _LOG_READ_$$call_buffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$call_buffer;



implementation {:inline 1} _LOG_READ_$$call_buffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$call_buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_buffer == _value then true else _READ_HAS_OCCURRED_$$call_buffer);
    return;
}



procedure _CHECK_READ_$$call_buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$call_buffer);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$call_buffer: bool;

procedure {:inline 1} _LOG_WRITE_$$call_buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$call_buffer, _WRITE_READ_BENIGN_FLAG_$$call_buffer;



implementation {:inline 1} _LOG_WRITE_$$call_buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$call_buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_buffer == _value then true else _WRITE_HAS_OCCURRED_$$call_buffer);
    _WRITE_READ_BENIGN_FLAG_$$call_buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_buffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$call_buffer);
    return;
}



procedure _CHECK_WRITE_$$call_buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_buffer != _value);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$call_buffer != _value);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$call_buffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$call_buffer;



implementation {:inline 1} _LOG_ATOMIC_$$call_buffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$call_buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$call_buffer);
    return;
}



procedure _CHECK_ATOMIC_$$call_buffer(_P: bool, _offset: bv32);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "call_buffer"} {:array "$$call_buffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_buffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$call_buffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$call_buffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$call_buffer := (if _P && _WRITE_HAS_OCCURRED_$$call_buffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$call_buffer);
    return;
}



const _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;



implementation {:inline 1} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a == _value then true else _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a);
    return;
}



procedure _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;



implementation {:inline 1} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a);
    return;
}



procedure _CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_a"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a);
    return;
}



const _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;



implementation {:inline 1} _LOG_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b == _value then true else _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b);
    return;
}



procedure _CHECK_READ_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b, _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;



implementation {:inline 1} _LOG_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b);
    return;
}



procedure _CHECK_WRITE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "call_b"} {:array "$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_value;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_buffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$call_value;
    goto anon9;

  anon9:
    havoc $$call_buffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon4;

  anon4:
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_value;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_buffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$call_value;
    goto anon9;

  anon9:
    havoc $$call_buffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon4;

  anon4:
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_value;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_value;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$call_buffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$call_buffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$call_value;
    goto anon9;

  anon9:
    havoc $$call_buffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_a;
    goto anon4;

  anon4:
    havoc $$_ZZ23binomial_options_kernelPKfS0_S0_S0_S0_PfS1_E6call_b;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b23: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

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
