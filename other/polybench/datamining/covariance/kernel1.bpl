type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "data"} {:global} $$data: [bv32]bv64;

axiom {:array_info "$$data"} {:global} {:elem_width 64} {:source_name "data"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "mean"} {:global} $$mean: [bv32]bv64;

axiom {:array_info "$$mean"} {:global} {:elem_width 64} {:source_name "mean"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$mean: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$mean: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$mean: bool;

axiom {:array_info "$$private_mean"} {:elem_width 64} {:source_name "private_mean"} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FADD64(bv64, bv64) : bv64;

function FDIV64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel1"} {:kernel} $kernel1($float_n: bv64, $m: bv32, $n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $m == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $n == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$mean && !_WRITE_HAS_OCCURRED_$$mean && !_ATOMIC_HAS_OCCURRED_$$mean;
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
  modifies _READ_HAS_OCCURRED_$$mean, _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data, $$data, $$mean, _TRACKING, _WRITE_HAS_OCCURRED_$$mean, _WRITE_READ_BENIGN_FLAG_$$mean, _WRITE_READ_BENIGN_FLAG_$$mean, _TRACKING;



implementation {:source_name "kernel1"} {:kernel} $kernel1($float_n: bv64, $m: bv32, $n: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g5.0$1: bv32;
  var $g5.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $c2.0$1: bv32;
  var $c2.0$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv64;
  var v3$2: bv64;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv64;
  var v8$2: bv64;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv64;
  var v14$2: bv64;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv64;
  var v18$2: bv64;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv64;
  var v20$2: bv64;
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
  var p24$1: bool;
  var p24$2: bool;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    $g1.0$1 := BV32_MUL(32bv32, group_id_x$1);
    $g1.0$2 := BV32_MUL(32bv32, group_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, $m) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, $m) else v1$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p24$1 := false;
    p24$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    v2$1 := (if p1$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$mean(p3$1, BV32_ADD(v0$1, $g1.0$1), $$mean[BV32_ADD(v0$1, $g1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$mean(p3$2, BV32_ADD(v0$2, $g1.0$2), $$mean[BV32_ADD(v0$2, $g1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$mean"} true;
    v3$1 := (if p3$1 then $$mean[BV32_ADD(v0$1, $g1.0$1)] else v3$1);
    v3$2 := (if p3$2 then $$mean[BV32_ADD(v0$2, $g1.0$2)] else v3$2);
    $$private_mean$0bv32$1 := (if p3$1 then v3$1 else $$private_mean$0bv32$1);
    $$private_mean$0bv32$2 := (if p3$2 then v3$2 else $$private_mean$0bv32$2);
    $g5.0$1 := (if p1$1 then BV32_SUB(BV32_SUB(BV32_SREM(BV32_ADD($n, 31bv32), 32bv32), $n), 31bv32) else $g5.0$1);
    $g5.0$2 := (if p1$2 then BV32_SUB(BV32_SUB(BV32_SREM(BV32_ADD($n, 31bv32), 32bv32), $n), 31bv32) else $g5.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 9} p4$1 ==> true;
    v4$1 := (if p4$1 then BV32_SGE($n, 1bv32) else v4$1);
    v4$2 := (if p4$2 then BV32_SGE($n, 1bv32) else v4$2);
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
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p6$1 := (if p4$1 && v4$1 then v4$1 else p6$1);
    p6$2 := (if p4$2 && v4$2 then v4$2 else p6$2);
    p5$1 := (if p4$1 && !v4$1 then !v4$1 else p5$1);
    p5$2 := (if p4$2 && !v4$2 then !v4$2 else p5$2);
    $0$1 := (if p5$1 then 0bv32 else $0$1);
    $0$2 := (if p5$2 then 0bv32 else $0$2);
    $0$1 := (if p6$1 then BV32_SUB($n, 1bv32) else $0$1);
    $0$2 := (if p6$2 then BV32_SUB($n, 1bv32) else $0$2);
    v5$1 := (if p4$1 then BV32_SLE($g5.0$1, $0$1) else v5$1);
    v5$2 := (if p4$2 then BV32_SLE($g5.0$2, $0$2) else v5$2);
    p7$1 := (if p4$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p4$2 && v5$2 then v5$2 else p7$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    v6$1 := (if p7$1 then $g5.0$1 == 0bv32 else v6$1);
    v6$2 := (if p7$2 then $g5.0$2 == 0bv32 else v6$2);
    p9$1 := (if p7$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p7$2 && v6$2 then v6$2 else p9$2);
    v7$1 := (if p9$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v7$1);
    v7$2 := (if p9$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v7$2);
    p11$1 := (if p9$1 && v7$1 then v7$1 else p11$1);
    p11$2 := (if p9$2 && v7$2 then v7$2 else p11$2);
    v8$1 := (if p11$1 then $$private_mean$0bv32$1 else v8$1);
    v8$2 := (if p11$2 then $$private_mean$0bv32$2 else v8$2);
    $$private_mean$0bv32$1 := (if p11$1 then FDIV64(v8$1, $float_n) else $$private_mean$0bv32$1);
    $$private_mean$0bv32$2 := (if p11$2 then FDIV64(v8$2, $float_n) else $$private_mean$0bv32$2);
    v9$1 := (if p7$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v9$1);
    v9$2 := (if p7$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v9$2);
    p13$1 := (if p7$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p7$2 && v9$2 then v9$2 else p13$2);
    v10$1 := (if p13$1 then BV32_SGT(BV32_SUB(BV32_SUB(0bv32, $n), $g5.0$1), 0bv32) else v10$1);
    v10$2 := (if p13$2 then BV32_SGT(BV32_SUB(BV32_SUB(0bv32, $n), $g5.0$2), 0bv32) else v10$2);
    p15$1 := (if p13$1 && v10$1 then v10$1 else p15$1);
    p15$2 := (if p13$2 && v10$2 then v10$2 else p15$2);
    p14$1 := (if p13$1 && !v10$1 then !v10$1 else p14$1);
    p14$2 := (if p13$2 && !v10$2 then !v10$2 else p14$2);
    $1$1 := (if p14$1 then 0bv32 else $1$1);
    $1$2 := (if p14$2 then 0bv32 else $1$2);
    $1$1 := (if p15$1 then BV32_SUB(BV32_SUB(0bv32, $n), $g5.0$1) else $1$1);
    $1$2 := (if p15$2 then BV32_SUB(BV32_SUB(0bv32, $n), $g5.0$2) else $1$2);
    $c2.0$1 := (if p13$1 then $1$1 else $c2.0$1);
    $c2.0$2 := (if p13$2 then $1$2 else $c2.0$2);
    p16$1 := (if p13$1 then true else p16$1);
    p16$2 := (if p13$2 then true else p16$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $17;

  $17:
    assume {:captureState "loop_head_state_2"} true;
    assert p16$1 ==> p4$1;
    assert p16$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 23} p16$1 ==> true;
    v11$1 := (if p16$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$1), 1bv32), 31bv32) else v11$1);
    v11$2 := (if p16$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$2), 1bv32), 31bv32) else v11$2);
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p18$1 := (if p16$1 && v11$1 then v11$1 else p18$1);
    p18$2 := (if p16$2 && v11$2 then v11$2 else p18$2);
    p17$1 := (if p16$1 && !v11$1 then !v11$1 else p17$1);
    p17$2 := (if p16$2 && !v11$2 then !v11$2 else p17$2);
    $2$1 := (if p17$1 then 31bv32 else $2$1);
    $2$2 := (if p17$2 then 31bv32 else $2$2);
    $2$1 := (if p18$1 then BV32_SUB(BV32_SUB($n, $g5.0$1), 1bv32) else $2$1);
    $2$2 := (if p18$2 then BV32_SUB(BV32_SUB($n, $g5.0$2), 1bv32) else $2$2);
    v12$1 := (if p16$1 then BV32_SLE($c2.0$1, $2$1) else v12$1);
    v12$2 := (if p16$2 then BV32_SLE($c2.0$2, $2$2) else v12$2);
    p19$1 := (if p16$1 && v12$1 then v12$1 else p19$1);
    p19$2 := (if p16$2 && v12$2 then v12$2 else p19$2);
    p16$1 := (if p16$1 && !v12$1 then v12$1 else p16$1);
    p16$2 := (if p16$2 && !v12$2 then v12$2 else p16$2);
    v13$1 := (if p19$1 then BV32_SLE(BV32_ADD($g5.0$1, $c2.0$1), 4294967295bv32) else v13$1);
    v13$2 := (if p19$2 then BV32_SLE(BV32_ADD($g5.0$2, $c2.0$2), 4294967295bv32) else v13$2);
    p21$1 := (if p19$1 && v13$1 then v13$1 else p21$1);
    p21$2 := (if p19$2 && v13$2 then v13$2 else p21$2);
    p20$1 := (if p19$1 && !v13$1 then !v13$1 else p20$1);
    p20$2 := (if p19$2 && !v13$2 then !v13$2 else p20$2);
    v16$1 := (if p20$1 then $$private_mean$0bv32$1 else v16$1);
    v16$2 := (if p20$2 then $$private_mean$0bv32$2 else v16$2);
    v17$1 := (if p20$1 then BV32_ADD(BV32_MUL(BV32_ADD($g5.0$1, $c2.0$1), $n), BV32_ADD(v0$1, $g1.0$1)) else v17$1);
    v17$2 := (if p20$2 then BV32_ADD(BV32_MUL(BV32_ADD($g5.0$2, $c2.0$2), $n), BV32_ADD(v0$2, $g1.0$2)) else v17$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$data(p20$1, v17$1, $$data[v17$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$data(p20$2, v17$2, $$data[v17$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v18$1 := (if p20$1 then $$data[v17$1] else v18$1);
    v18$2 := (if p20$2 then $$data[v17$2] else v18$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$data(p20$1, v17$1, FSUB64(v18$1, v16$1), $$data[v17$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(p20$2, v17$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$data(p20$2, v17$2, FSUB64(v18$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v17$1] := (if p20$1 then FSUB64(v18$1, v16$1) else $$data[v17$1]);
    $$data[v17$2] := (if p20$2 then FSUB64(v18$2, v16$2) else $$data[v17$2]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$data(p21$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$1), $c2.0$1), $n), BV32_ADD(v0$1, $g1.0$1)), $$data[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$1), $c2.0$1), $n), BV32_ADD(v0$1, $g1.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$data(p21$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$2), $c2.0$2), $n), BV32_ADD(v0$2, $g1.0$2)), $$data[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$2), $c2.0$2), $n), BV32_ADD(v0$2, $g1.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v14$1 := (if p21$1 then $$data[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$1), $c2.0$1), $n), BV32_ADD(v0$1, $g1.0$1))] else v14$1);
    v14$2 := (if p21$2 then $$data[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD($n, $g5.0$2), $c2.0$2), $n), BV32_ADD(v0$2, $g1.0$2))] else v14$2);
    v15$1 := (if p21$1 then $$private_mean$0bv32$1 else v15$1);
    v15$2 := (if p21$2 then $$private_mean$0bv32$2 else v15$2);
    $$private_mean$0bv32$1 := (if p21$1 then FADD64(v15$1, v14$1) else $$private_mean$0bv32$1);
    $$private_mean$0bv32$2 := (if p21$2 then FADD64(v15$2, v14$2) else $$private_mean$0bv32$2);
    $c2.0$1 := (if p19$1 then BV32_ADD($c2.0$1, 1bv32) else $c2.0$1);
    $c2.0$2 := (if p19$2 then BV32_ADD($c2.0$2, 1bv32) else $c2.0$2);
    p16$1 := (if p19$1 then true else p16$1);
    p16$2 := (if p19$2 then true else p16$2);
    goto $17.backedge, __partitioned_block_$17.tail_0;

  __partitioned_block_$17.tail_0:
    assume !p16$1 && !p16$2;
    goto __partitioned_block_$17.tail_1;

  __partitioned_block_$17.tail_1:
    call {:sourceloc_num 40} $bugle_barrier_duplicated_1(1bv1, 1bv1, p7$1, p7$2);
    $g5.0$1 := (if p7$1 then BV32_ADD($g5.0$1, 32bv32) else $g5.0$1);
    $g5.0$2 := (if p7$2 then BV32_ADD($g5.0$2, 32bv32) else $g5.0$2);
    p4$1 := (if p7$1 then true else p4$1);
    p4$2 := (if p7$2 then true else p4$2);
    goto $5.backedge, __partitioned_block_$5.tail_0;

  __partitioned_block_$5.tail_0:
    assume !p4$1 && !p4$2;
    v19$1 := (if p1$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v19$1);
    v19$2 := (if p1$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v19$2);
    p23$1 := (if p1$1 && v19$1 then v19$1 else p23$1);
    p23$2 := (if p1$2 && v19$2 then v19$2 else p23$2);
    v20$1 := (if p23$1 then $$private_mean$0bv32$1 else v20$1);
    v20$2 := (if p23$2 then $$private_mean$0bv32$2 else v20$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$mean(p23$1, BV32_ADD(v0$1, $g1.0$1), v20$1, $$mean[BV32_ADD(v0$1, $g1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$mean(p23$2, BV32_ADD(v0$2, $g1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$mean(p23$2, BV32_ADD(v0$2, $g1.0$2), v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$mean"} true;
    $$mean[BV32_ADD(v0$1, $g1.0$1)] := (if p23$1 then v20$1 else $$mean[BV32_ADD(v0$1, $g1.0$1)]);
    $$mean[BV32_ADD(v0$2, $g1.0$2)] := (if p23$2 then v20$2 else $$mean[BV32_ADD(v0$2, $g1.0$2)]);
    goto __partitioned_block_$5.tail_1;

  __partitioned_block_$5.tail_1:
    call {:sourceloc_num 47} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    $g1.0$1 := (if p1$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p1$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
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

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $17.backedge:
    assume {:backedge} p16$1 || p16$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $17;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$data, $$mean, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$data, $$mean, _TRACKING;



var $$private_mean$0bv32$1: bv64;

var $$private_mean$0bv32$2: bv64;

const _WATCHED_VALUE_$$data: bv64;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



const _WATCHED_VALUE_$$mean: bv64;

procedure {:inline 1} _LOG_READ_$$mean(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$mean;



implementation {:inline 1} _LOG_READ_$$mean(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$mean := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$mean == _value then true else _READ_HAS_OCCURRED_$$mean);
    return;
}



procedure _CHECK_READ_$$mean(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$mean);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$mean: bool;

procedure {:inline 1} _LOG_WRITE_$$mean(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$mean, _WRITE_READ_BENIGN_FLAG_$$mean;



implementation {:inline 1} _LOG_WRITE_$$mean(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$mean := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$mean == _value then true else _WRITE_HAS_OCCURRED_$$mean);
    _WRITE_READ_BENIGN_FLAG_$$mean := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$mean == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$mean);
    return;
}



procedure _CHECK_WRITE_$$mean(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$mean != _value);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$mean != _value);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$mean(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$mean;



implementation {:inline 1} _LOG_ATOMIC_$$mean(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$mean := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$mean);
    return;
}



procedure _CHECK_ATOMIC_$$mean(_P: bool, _offset: bv32);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset);
  requires {:source_name "mean"} {:array "$$mean"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$mean(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$mean;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$mean(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$mean := (if _P && _WRITE_HAS_OCCURRED_$$mean && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$mean);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon1;

  anon1:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$mean;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$mean;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$mean;
    goto anon2;

  anon2:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon5;

  anon5:
    havoc _TRACKING;
    return;

  anon7_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon4;

  anon4:
    havoc $$mean;
    goto anon5;

  anon6_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon6_Then, anon6_Else;

  anon6_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon1;

  anon1:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$mean;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$mean;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$mean;
    goto anon2;

  anon2:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon5;

  anon5:
    havoc _TRACKING;
    return;

  anon7_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon4;

  anon4:
    havoc $$mean;
    goto anon5;

  anon6_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}


