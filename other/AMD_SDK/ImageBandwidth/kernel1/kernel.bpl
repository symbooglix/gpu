type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(y: bv32, x$1: [bv32]bv32, x$2: [bv32]bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);
  requires y == 0bv32;



var {:source_name "in"} {:global} $$in: [bv32]bv8;

axiom {:array_info "$$in"} {:global} {:elem_width 8} {:source_name "in"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$in: bool;

var {:source_name "out"} {:global} $$out: [bv32]bv32;

axiom {:array_info "$$out"} {:global} {:elem_width 32} {:source_name "out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$out: bool;

var {:source_name "lcount"} {:group_shared} $$read_kernel.lcount: [bv1][bv32]bv32;

axiom {:array_info "$$read_kernel.lcount"} {:group_shared} {:elem_width 32} {:source_name "lcount"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$read_kernel.lcount: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$read_kernel.lcount: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "read_kernel"} {:kernel} $read_kernel($np: bv32, $val: bv32, $nk: bv32);
  requires !_READ_HAS_OCCURRED_$$in && !_WRITE_HAS_OCCURRED_$$in && !_ATOMIC_HAS_OCCURRED_$$in;
  requires !_READ_HAS_OCCURRED_$$out && !_WRITE_HAS_OCCURRED_$$out && !_ATOMIC_HAS_OCCURRED_$$out;
  requires !_READ_HAS_OCCURRED_$$read_kernel.lcount && !_WRITE_HAS_OCCURRED_$$read_kernel.lcount && !_ATOMIC_HAS_OCCURRED_$$read_kernel.lcount;
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
  modifies $$read_kernel.lcount, _WRITE_HAS_OCCURRED_$$read_kernel.lcount, _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount, _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount, $$out, _TRACKING, _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount, _TRACKING, _READ_HAS_OCCURRED_$$read_kernel.lcount, _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:source_name "read_kernel"} {:kernel} $read_kernel($np: bv32, $val: bv32, $nk: bv32)
{
  var $pcount.0$1: bv32;
  var $pcount.0$2: bv32;
  var $coord.0$1: bv64;
  var $coord.0$2: bv64;
  var $n.0: bv32;
  var $pcount.1$1: bv32;
  var $pcount.1$2: bv32;
  var $i.0: bv32;
  var $idx.0$1: bv32;
  var $idx.0$2: bv32;
  var $coord.1$1: bv64;
  var $coord.1$2: bv64;
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $pcount.2$1: bv32;
  var $pcount.2$2: bv32;
  var $pcount.3$1: bv32;
  var $pcount.3$2: bv32;
  var $pcount.4$1: bv32;
  var $pcount.4$2: bv32;
  var $pcount.5$1: bv32;
  var $pcount.5$2: bv32;
  var v0: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3: bool;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
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
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bool;
  var v32$2: bool;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bv32;
  var v34$2: bv32;
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
  var p18$1: bool;
  var p18$2: bool;
  var p19$1: bool;
  var p19$2: bool;
  var p20$1: bool;
  var p20$2: bool;
  var p21$1: bool;
  var p21$2: bool;
  var p22$1: bool;
  var p22$2: bool;
  var p23$1: bool;
  var p23$2: bool;


  $0:
    v0 := $nk == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v0 && !v0;
    v1$1 := local_id_x$1 == 0bv32;
    v1$2 := local_id_x$2 == 0bv32;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    v2$1 := (if p0$1 then local_id_y$1 == 0bv32 else v2$1);
    v2$2 := (if p0$2 then local_id_y$2 == 0bv32 else v2$2);
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$read_kernel.lcount(p1$1, 0bv32, 0bv32, $$read_kernel.lcount[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount(p1$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$read_kernel.lcount(p1$2, 0bv32, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$read_kernel.lcount"} true;
    $$read_kernel.lcount[1bv1][0bv32] := (if p1$1 then 0bv32 else $$read_kernel.lcount[1bv1][0bv32]);
    $$read_kernel.lcount[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p1$2 then 0bv32 else $$read_kernel.lcount[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $pcount.0$1, $coord.0$1, $n.0 := 0bv32, 0bv32 ++ BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), 0bv32;
    $pcount.0$2, $coord.0$2 := 0bv32, 0bv32 ++ BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v3 := BV32_ULT($n.0, $nk);
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    goto $truebb2, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 52} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 $pcount.0$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$read_kernel.lcount(true, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 52} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 $pcount.0$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$read_kernel.lcount(true, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$read_kernel.lcount"} true;
    havoc v30$1, v30$2;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 53} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v31$1 := BV32_ADD(BV32_MUL(group_id_y$1, num_groups_x), group_id_x$1);
    v31$2 := BV32_ADD(BV32_MUL(group_id_y$2, num_groups_x), group_id_x$2);
    v32$1 := local_id_x$1 == 0bv32;
    v32$2 := local_id_x$2 == 0bv32;
    p20$1 := (if v32$1 then v32$1 else p20$1);
    p20$2 := (if v32$2 then v32$2 else p20$2);
    v33$1 := (if p20$1 then local_id_y$1 == 0bv32 else v33$1);
    v33$2 := (if p20$2 then local_id_y$2 == 0bv32 else v33$2);
    p21$1 := (if p20$1 && v33$1 then v33$1 else p21$1);
    p21$2 := (if p20$2 && v33$2 then v33$2 else p21$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$read_kernel.lcount(p21$1, 0bv32, $$read_kernel.lcount[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$read_kernel.lcount(p21$2, 0bv32, $$read_kernel.lcount[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$read_kernel.lcount"} true;
    v34$1 := (if p21$1 then $$read_kernel.lcount[1bv1][0bv32] else v34$1);
    v34$2 := (if p21$2 then $$read_kernel.lcount[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v34$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_WRITE_$$out(p21$1, v31$1, BV32_UDIV(v34$1, $nk), $$out[v31$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p21$2, v31$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 57} _CHECK_WRITE_$$out(p21$2, v31$2, BV32_UDIV(v34$2, $nk));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[v31$1] := (if p21$1 then BV32_UDIV(v34$1, $nk) else $$out[v31$1]);
    $$out[v31$2] := (if p21$2 then BV32_UDIV(v34$2, $nk) else $$out[v31$2]);
    goto $35;

  $35:
    return;

  $truebb2:
    assume {:partition} v3 && v3;
    $pcount.1$1, $i.0, $idx.0$1, $coord.1$1 := $pcount.0$1, 0bv32, BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $coord.0$1;
    $pcount.1$2, $idx.0$2, $coord.1$2 := $pcount.0$2, BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $coord.0$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $8;

  $8:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$read_kernel.lcount ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v4 := BV32_ULT($i.0, $np);
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
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v4 && !v4;
    $pcount.0$1, $coord.0$1, $n.0 := $pcount.1$1, $coord.1$1, BV32_ADD($n.0, 1bv32);
    $pcount.0$2, $coord.0$2 := $pcount.1$2, $coord.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $6;

  $truebb3:
    assume {:partition} v4 && v4;
    v5$1 := $coord.1$1[32:0];
    v5$2 := $coord.1$2[32:0];
    v6$1 := BV32_SLT(v5$1, 0bv32);
    v6$2 := BV32_SLT(v5$2, 0bv32);
    p4$1 := (if v6$1 then v6$1 else p4$1);
    p4$2 := (if v6$2 then v6$2 else p4$2);
    p5$1 := (if !v6$1 then !v6$1 else p5$1);
    p5$2 := (if !v6$2 then !v6$2 else p5$2);
    $0$1 := (if p4$1 then 0bv32 else $0$1);
    $0$2 := (if p4$2 then 0bv32 else $0$2);
    v7$1 := (if p5$1 then BV32_SGE(v5$1, 32768bv32) else v7$1);
    v7$2 := (if p5$2 then BV32_SGE(v5$2, 32768bv32) else v7$2);
    p7$1 := (if p5$1 && v7$1 then v7$1 else p7$1);
    p7$2 := (if p5$2 && v7$2 then v7$2 else p7$2);
    p6$1 := (if p5$1 && !v7$1 then !v7$1 else p6$1);
    p6$2 := (if p5$2 && !v7$2 then !v7$2 else p6$2);
    $1$1 := (if p6$1 then v5$1 else $1$1);
    $1$2 := (if p6$2 then v5$2 else $1$2);
    $1$1 := (if p7$1 then 32767bv32 else $1$1);
    $1$2 := (if p7$2 then 32767bv32 else $1$2);
    $0$1 := (if p5$1 then $1$1 else $0$1);
    $0$2 := (if p5$2 then $1$2 else $0$2);
    v8$1 := BV32_SLT($idx.0$1, 0bv32);
    v8$2 := BV32_SLT($idx.0$2, 0bv32);
    p8$1 := (if v8$1 then v8$1 else p8$1);
    p8$2 := (if v8$2 then v8$2 else p8$2);
    p9$1 := (if !v8$1 then !v8$1 else p9$1);
    p9$2 := (if !v8$2 then !v8$2 else p9$2);
    $2$1 := (if p8$1 then 0bv32 else $2$1);
    $2$2 := (if p8$2 then 0bv32 else $2$2);
    v9$1 := (if p9$1 then BV32_SGE($idx.0$1, 32768bv32) else v9$1);
    v9$2 := (if p9$2 then BV32_SGE($idx.0$2, 32768bv32) else v9$2);
    p11$1 := (if p9$1 && v9$1 then v9$1 else p11$1);
    p11$2 := (if p9$2 && v9$2 then v9$2 else p11$2);
    p10$1 := (if p9$1 && !v9$1 then !v9$1 else p10$1);
    p10$2 := (if p9$2 && !v9$2 then !v9$2 else p10$2);
    $3$1 := (if p10$1 then $idx.0$1 else $3$1);
    $3$2 := (if p10$2 then $idx.0$2 else $3$2);
    $3$1 := (if p11$1 then 32767bv32 else $3$1);
    $3$2 := (if p11$2 then 32767bv32 else $3$2);
    $2$1 := (if p9$1 then $3$1 else $2$1);
    $2$2 := (if p9$2 then $3$2 else $2$2);
    v10$1 := $$in[BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32)];
    v10$2 := $$in[BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32)];
    v11$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 1bv32)];
    v11$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 1bv32)];
    v12$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 2bv32)];
    v12$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 2bv32)];
    v13$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 3bv32)];
    v13$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 3bv32)];
    v14$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 4bv32)];
    v14$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 4bv32)];
    v15$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 5bv32)];
    v15$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 5bv32)];
    v16$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 6bv32)];
    v16$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 6bv32)];
    v17$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 7bv32)];
    v17$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 7bv32)];
    v18$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 8bv32)];
    v18$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 8bv32)];
    v19$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 9bv32)];
    v19$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 9bv32)];
    v20$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 10bv32)];
    v20$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 10bv32)];
    v21$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 11bv32)];
    v21$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 11bv32)];
    v22$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 12bv32)];
    v22$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 12bv32)];
    v23$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 13bv32)];
    v23$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 13bv32)];
    v24$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 14bv32)];
    v24$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 14bv32)];
    v25$1 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$1, 32768bv32), $0$1), 16bv32), 15bv32)];
    v25$2 := $$in[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($2$2, 32768bv32), $0$2), 16bv32), 15bv32)];
    v26$1 := v13$1 ++ v12$1 ++ v11$1 ++ v10$1 == $val;
    v26$2 := v13$2 ++ v12$2 ++ v11$2 ++ v10$2 == $val;
    p13$1 := (if v26$1 then v26$1 else p13$1);
    p13$2 := (if v26$2 then v26$2 else p13$2);
    p12$1 := (if !v26$1 then !v26$1 else p12$1);
    p12$2 := (if !v26$2 then !v26$2 else p12$2);
    $pcount.2$1 := (if p12$1 then $pcount.1$1 else $pcount.2$1);
    $pcount.2$2 := (if p12$2 then $pcount.1$2 else $pcount.2$2);
    $pcount.2$1 := (if p13$1 then BV32_ADD($pcount.1$1, 1bv32) else $pcount.2$1);
    $pcount.2$2 := (if p13$2 then BV32_ADD($pcount.1$2, 1bv32) else $pcount.2$2);
    v27$1 := v17$1 ++ v16$1 ++ v15$1 ++ v14$1 == $val;
    v27$2 := v17$2 ++ v16$2 ++ v15$2 ++ v14$2 == $val;
    p15$1 := (if v27$1 then v27$1 else p15$1);
    p15$2 := (if v27$2 then v27$2 else p15$2);
    p14$1 := (if !v27$1 then !v27$1 else p14$1);
    p14$2 := (if !v27$2 then !v27$2 else p14$2);
    $pcount.3$1 := (if p14$1 then $pcount.2$1 else $pcount.3$1);
    $pcount.3$2 := (if p14$2 then $pcount.2$2 else $pcount.3$2);
    $pcount.3$1 := (if p15$1 then BV32_ADD($pcount.2$1, 1bv32) else $pcount.3$1);
    $pcount.3$2 := (if p15$2 then BV32_ADD($pcount.2$2, 1bv32) else $pcount.3$2);
    v28$1 := v21$1 ++ v20$1 ++ v19$1 ++ v18$1 == $val;
    v28$2 := v21$2 ++ v20$2 ++ v19$2 ++ v18$2 == $val;
    p17$1 := (if v28$1 then v28$1 else p17$1);
    p17$2 := (if v28$2 then v28$2 else p17$2);
    p16$1 := (if !v28$1 then !v28$1 else p16$1);
    p16$2 := (if !v28$2 then !v28$2 else p16$2);
    $pcount.4$1 := (if p16$1 then $pcount.3$1 else $pcount.4$1);
    $pcount.4$2 := (if p16$2 then $pcount.3$2 else $pcount.4$2);
    $pcount.4$1 := (if p17$1 then BV32_ADD($pcount.3$1, 1bv32) else $pcount.4$1);
    $pcount.4$2 := (if p17$2 then BV32_ADD($pcount.3$2, 1bv32) else $pcount.4$2);
    v29$1 := v25$1 ++ v24$1 ++ v23$1 ++ v22$1 == $val;
    v29$2 := v25$2 ++ v24$2 ++ v23$2 ++ v22$2 == $val;
    p19$1 := (if v29$1 then v29$1 else p19$1);
    p19$2 := (if v29$2 then v29$2 else p19$2);
    p18$1 := (if !v29$1 then !v29$1 else p18$1);
    p18$2 := (if !v29$2 then !v29$2 else p18$2);
    $pcount.5$1 := (if p18$1 then $pcount.4$1 else $pcount.5$1);
    $pcount.5$2 := (if p18$2 then $pcount.4$2 else $pcount.5$2);
    $pcount.5$1 := (if p19$1 then BV32_ADD($pcount.4$1, 1bv32) else $pcount.5$1);
    $pcount.5$2 := (if p19$2 then BV32_ADD($pcount.4$2, 1bv32) else $pcount.5$2);
    $pcount.1$1, $i.0, $idx.0$1, $coord.1$1 := $pcount.5$1, BV32_ADD($i.0, 1bv32), BV32_ADD($idx.0$1, BV32_MUL(group_size_y, num_groups_y)), $idx.0$1 ++ v5$1;
    $pcount.1$2, $idx.0$2, $coord.1$2 := $pcount.5$2, BV32_ADD($idx.0$2, BV32_MUL(group_size_y, num_groups_y)), $idx.0$2 ++ v5$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $8;

  $truebb:
    assume {:partition} v0 && v0;
    goto $35;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$read_kernel.lcount, $$out, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$read_kernel.lcount, $$out, _TRACKING;



const _WATCHED_VALUE_$$in: bv8;

procedure {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _READ_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_READ_$$in(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$in);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$in: bool;

procedure {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$in, _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _WRITE_HAS_OCCURRED_$$in);
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



procedure _CHECK_WRITE_$$in(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_ATOMIC_$$in(_P: bool, _offset: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



const _WATCHED_VALUE_$$out: bv32;

procedure {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _READ_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$out);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$out: bool;

procedure {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _WRITE_HAS_OCCURRED_$$out);
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



procedure _CHECK_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_ATOMIC_$$out(_P: bool, _offset: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



const _WATCHED_VALUE_$$read_kernel.lcount: bv32;

procedure {:inline 1} _LOG_READ_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$read_kernel.lcount;



implementation {:inline 1} _LOG_READ_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$read_kernel.lcount := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$read_kernel.lcount == _value then true else _READ_HAS_OCCURRED_$$read_kernel.lcount);
    return;
}



procedure _CHECK_READ_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount: bool;

procedure {:inline 1} _LOG_WRITE_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$read_kernel.lcount, _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount;



implementation {:inline 1} _LOG_WRITE_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$read_kernel.lcount := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$read_kernel.lcount == _value then true else _WRITE_HAS_OCCURRED_$$read_kernel.lcount);
    _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$read_kernel.lcount == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount);
    return;
}



procedure _CHECK_WRITE_$$read_kernel.lcount(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$read_kernel.lcount != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$read_kernel.lcount != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$read_kernel.lcount(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount;



implementation {:inline 1} _LOG_ATOMIC_$$read_kernel.lcount(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$read_kernel.lcount);
    return;
}



procedure _CHECK_ATOMIC_$$read_kernel.lcount(_P: bool, _offset: bv32);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lcount"} {:array "$$read_kernel.lcount"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount := (if _P && _WRITE_HAS_OCCURRED_$$read_kernel.lcount && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$read_kernel.lcount);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$read_kernel.lcount;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$read_kernel.lcount;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$read_kernel.lcount;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$read_kernel.lcount;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$read_kernel.lcount;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$read_kernel.lcount;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$read_kernel.lcount;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$read_kernel.lcount;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
