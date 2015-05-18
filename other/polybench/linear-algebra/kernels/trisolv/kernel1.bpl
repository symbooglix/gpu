type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

var {:source_name "x"} {:global} $$x: [bv32]bv64;

axiom {:array_info "$$x"} {:global} {:elem_width 64} {:source_name "x"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$x: bool;

axiom {:array_info "$$private_x_0"} {:elem_width 64} {:source_name "private_x_0"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$private_x_1"} {:elem_width 64} {:source_name "private_x_1"} {:source_elem_width 64} {:source_dimensions "1"} true;

var {:source_name "shared_A"} {:group_shared} $$kernel1.shared_A: [bv1][bv32]bv64;

axiom {:array_info "$$kernel1.shared_A"} {:group_shared} {:elem_width 64} {:source_name "shared_A"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel1.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel1.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A: bool;

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

function FMUL64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel1"} {:kernel} $kernel1($n: bv32, $h1: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$x && !_WRITE_HAS_OCCURRED_$$x && !_ATOMIC_HAS_OCCURRED_$$x;
  requires !_READ_HAS_OCCURRED_$$kernel1.shared_A && !_WRITE_HAS_OCCURRED_$$kernel1.shared_A && !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_A;
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
  modifies $$kernel1.shared_A, _READ_HAS_OCCURRED_$$x, _WRITE_HAS_OCCURRED_$$kernel1.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A, $$x, _TRACKING, _READ_HAS_OCCURRED_$$kernel1.shared_A, _TRACKING, _WRITE_HAS_OCCURRED_$$x, _WRITE_READ_BENIGN_FLAG_$$x, _WRITE_READ_BENIGN_FLAG_$$x, _TRACKING;



implementation {:source_name "kernel1"} {:kernel} $kernel1($n: bv32, $h1: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $c0.0$1: bv32;
  var $c0.0$2: bv32;
  var $4$1: bv32;
  var $4$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
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
  var v11$1: bv64;
  var v11$2: bv64;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bv64;
  var v19$2: bv64;
  var v20$1: bv64;
  var v20$2: bv64;
  var v21$1: bv64;
  var v21$2: bv64;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv64;
  var v24$2: bv64;
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
  var p25$1: bool;
  var p25$2: bool;
  var p26$1: bool;
  var p26$2: bool;
  var p27$1: bool;
  var p27$2: bool;
  var p28$1: bool;
  var p28$2: bool;
  var p29$1: bool;
  var p29$2: bool;
  var p30$1: bool;
  var p30$2: bool;
  var p31$1: bool;
  var p31$2: bool;
  var p32$1: bool;
  var p32$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32), 0bv32);
    v2$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32), 0bv32);
    p0$1 := false;
    p0$2 := false;
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
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    p1$1 := (if !v2$1 then !v2$1 else p1$1);
    p1$2 := (if !v2$2 then !v2$2 else p1$2);
    $0$1 := (if p0$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32)), 1048576bv32), 1bv32), 1048576bv32)) else $0$1);
    $0$2 := (if p0$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32)), 1048576bv32), 1bv32), 1048576bv32)) else $0$2);
    $0$1 := (if p1$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32), 1048576bv32) else $0$1);
    $0$2 := (if p1$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32), 1048576bv32) else $0$2);
    v3$1 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $0$1)), 1048576bv32), BV32_MUL(32bv32, v0$1));
    v3$2 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $0$2)), 1048576bv32), BV32_MUL(32bv32, v0$2));
    p2$1 := (if v3$1 then v3$1 else p2$1);
    p2$2 := (if v3$2 then v3$2 else p2$2);
    p5$1 := (if !v3$1 then !v3$1 else p5$1);
    p5$2 := (if !v3$2 then !v3$2 else p5$2);
    v4$1 := (if p2$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32), 0bv32) else v4$1);
    v4$2 := (if p2$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32), 0bv32) else v4$2);
    p3$1 := (if p2$1 && v4$1 then v4$1 else p3$1);
    p3$2 := (if p2$2 && v4$2 then v4$2 else p3$2);
    p4$1 := (if p2$1 && !v4$1 then !v4$1 else p4$1);
    p4$2 := (if p2$2 && !v4$2 then !v4$2 else p4$2);
    $1$1 := (if p3$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32)), 1048576bv32), 1bv32), 1048576bv32)) else $1$1);
    $1$2 := (if p3$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32)), 1048576bv32), 1bv32), 1048576bv32)) else $1$2);
    $1$1 := (if p4$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$1)), $h1), 31bv32), 1048576bv32) else $1$1);
    $1$2 := (if p4$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v0$2)), $h1), 31bv32), 1048576bv32) else $1$2);
    $2$1 := (if p2$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $1$1)), 1048576bv32) else $2$1);
    $2$2 := (if p2$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $1$2)), 1048576bv32) else $2$2);
    $2$1 := (if p5$1 then BV32_MUL(32bv32, v0$1) else $2$1);
    $2$2 := (if p5$2 then BV32_MUL(32bv32, v0$2) else $2$2);
    $g1.0$1 := $2$1;
    $g1.0$2 := $2$2;
    p6$1 := true;
    p6$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 11} p6$1 ==> true;
    v5$1 := (if p6$1 then BV32_SLT($g1.0$1, BV32_SDIV(BV32_ADD($h1, 1bv32), 2bv32)) else v5$1);
    v5$2 := (if p6$2 then BV32_SLT($g1.0$2, BV32_SDIV(BV32_ADD($h1, 1bv32), 2bv32)) else v5$2);
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
    p20$1 := false;
    p20$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p27$1 := false;
    p27$2 := false;
    p28$1 := false;
    p28$2 := false;
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    p31$1 := false;
    p31$2 := false;
    p32$1 := false;
    p32$2 := false;
    p7$1 := (if p6$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p6$2 && v5$2 then v5$2 else p7$2);
    p6$1 := (if p6$1 && !v5$1 then v5$1 else p6$1);
    p6$2 := (if p6$2 && !v5$2 then v5$2 else p6$2);
    v6$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$1), $g1.0$1), BV32_ADD($h1, 1bv32)) else v6$1);
    v6$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$2), $g1.0$2), BV32_ADD($h1, 1bv32)) else v6$2);
    p9$1 := (if p7$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p7$2 && v6$2 then v6$2 else p9$2);
    v7$1 := (if p9$1 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 1bv32)) else v7$1);
    v7$2 := (if p9$2 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 1bv32)) else v7$2);
    p11$1 := (if p9$1 && v7$1 then v7$1 else p11$1);
    p11$2 := (if p9$2 && v7$2 then v7$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$x(p11$1, BV32_ADD(v1$1, $g1.0$1), $$x[BV32_ADD(v1$1, $g1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$x(p11$2, BV32_ADD(v1$2, $g1.0$2), $$x[BV32_ADD(v1$2, $g1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$x"} true;
    v8$1 := (if p11$1 then $$x[BV32_ADD(v1$1, $g1.0$1)] else v8$1);
    v8$2 := (if p11$2 then $$x[BV32_ADD(v1$2, $g1.0$2)] else v8$2);
    $$private_x_1$0bv32$1 := (if p11$1 then v8$1 else $$private_x_1$0bv32$1);
    $$private_x_1$0bv32$2 := (if p11$2 then v8$2 else $$private_x_1$0bv32$2);
    v9$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$1), $g1.0$1), BV32_ADD($h1, 1bv32)) else v9$1);
    v9$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$2), $g1.0$2), BV32_ADD($h1, 1bv32)) else v9$2);
    p13$1 := (if p7$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p7$2 && v9$2 then v9$2 else p13$2);
    v10$1 := (if p13$1 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 1bv32)) else v10$1);
    v10$2 := (if p13$2 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 1bv32)) else v10$2);
    p15$1 := (if p13$1 && v10$1 then v10$1 else p15$1);
    p15$2 := (if p13$2 && v10$2 then v10$2 else p15$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$x(p15$1, BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1), $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$x(p15$2, BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2), $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$x"} true;
    v11$1 := (if p15$1 then $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1)] else v11$1);
    v11$2 := (if p15$2 then $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2)] else v11$2);
    $$private_x_0$0bv32$1 := (if p15$1 then v11$1 else $$private_x_0$0bv32$1);
    $$private_x_0$0bv32$2 := (if p15$2 then v11$2 else $$private_x_0$0bv32$2);
    v12$1 := (if p7$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v12$1);
    v12$2 := (if p7$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v12$2);
    p17$1 := (if p7$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p7$2 && v12$2 then v12$2 else p17$2);
    v13$1 := (if p17$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h1), $g1.0$1), 31bv32), 0bv32) else v13$1);
    v13$2 := (if p17$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h1), $g1.0$2), 31bv32), 0bv32) else v13$2);
    p19$1 := (if p17$1 && v13$1 then v13$1 else p19$1);
    p19$2 := (if p17$2 && v13$2 then v13$2 else p19$2);
    p18$1 := (if p17$1 && !v13$1 then !v13$1 else p18$1);
    p18$2 := (if p17$2 && !v13$2 then !v13$2 else p18$2);
    $3$1 := (if p18$1 then 0bv32 else $3$1);
    $3$2 := (if p18$2 then 0bv32 else $3$2);
    $3$1 := (if p19$1 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h1), $g1.0$1), 31bv32) else $3$1);
    $3$2 := (if p19$2 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h1), $g1.0$2), 31bv32) else $3$2);
    $c0.0$1 := (if p17$1 then $3$1 else $c0.0$1);
    $c0.0$2 := (if p17$2 then $3$2 else $c0.0$2);
    p20$1 := (if p17$1 then true else p20$1);
    p20$2 := (if p17$2 then true else p20$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $22;

  $22:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p20$1 ==> p6$1;
    assert p20$2 ==> p6$2;
    assert {:block_sourceloc} {:sourceloc_num 27} p20$1 ==> true;
    v14$1 := (if p20$1 then BV32_SLT(BV32_ADD(BV32_ADD(BV32_SUB($n, $h1), $g1.0$1), 30bv32), 31bv32) else v14$1);
    v14$2 := (if p20$2 then BV32_SLT(BV32_ADD(BV32_ADD(BV32_SUB($n, $h1), $g1.0$2), 30bv32), 31bv32) else v14$2);
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p22$1 := (if p20$1 && v14$1 then v14$1 else p22$1);
    p22$2 := (if p20$2 && v14$2 then v14$2 else p22$2);
    p21$1 := (if p20$1 && !v14$1 then !v14$1 else p21$1);
    p21$2 := (if p20$2 && !v14$2 then !v14$2 else p21$2);
    $4$1 := (if p21$1 then 31bv32 else $4$1);
    $4$2 := (if p21$2 then 31bv32 else $4$2);
    $4$1 := (if p22$1 then BV32_ADD(BV32_ADD(BV32_SUB($n, $h1), $g1.0$1), 30bv32) else $4$1);
    $4$2 := (if p22$2 then BV32_ADD(BV32_ADD(BV32_SUB($n, $h1), $g1.0$2), 30bv32) else $4$2);
    v15$1 := (if p20$1 then BV32_SLE($c0.0$1, $4$1) else v15$1);
    v15$2 := (if p20$2 then BV32_SLE($c0.0$2, $4$2) else v15$2);
    p23$1 := (if p20$1 && v15$1 then v15$1 else p23$1);
    p23$2 := (if p20$2 && v15$2 then v15$2 else p23$2);
    p20$1 := (if p20$1 && !v15$1 then v15$1 else p20$1);
    p20$2 := (if p20$2 && !v15$2 then v15$2 else p20$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v16$1 := (if p23$1 then _HAVOC_bv64$1 else v16$1);
    v16$2 := (if p23$2 then _HAVOC_bv64$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$kernel1.shared_A(p23$1, BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1), v16$1, $$kernel1.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A(p23$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$kernel1.shared_A(p23$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel1.shared_A"} true;
    $$kernel1.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)] := (if p23$1 then v16$1 else $$kernel1.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)]);
    $$kernel1.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2)] := (if p23$2 then v16$2 else $$kernel1.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2)]);
    $c0.0$1 := (if p23$1 then BV32_ADD($c0.0$1, 1bv32) else $c0.0$1);
    $c0.0$2 := (if p23$2 then BV32_ADD($c0.0$2, 1bv32) else $c0.0$2);
    p20$1 := (if p23$1 then true else p20$1);
    p20$2 := (if p23$2 then true else p20$2);
    goto $22.backedge, __partitioned_block_$22.tail_0;

  __partitioned_block_$22.tail_0:
    assume !p20$1 && !p20$2;
    goto __partitioned_block_$22.tail_1;

  __partitioned_block_$22.tail_1:
    call {:sourceloc_num 37} $bugle_barrier_duplicated_0(1bv1, 1bv1, p7$1, p7$2);
    v17$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$1), $g1.0$1), BV32_ADD($h1, 1bv32)) else v17$1);
    v17$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$2), $g1.0$2), BV32_ADD($h1, 1bv32)) else v17$2);
    p25$1 := (if p7$1 && v17$1 then v17$1 else p25$1);
    p25$2 := (if p7$2 && v17$2 then v17$2 else p25$2);
    v18$1 := (if p25$1 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 1bv32)) else v18$1);
    v18$2 := (if p25$2 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 1bv32)) else v18$2);
    p27$1 := (if p25$1 && v18$1 then v18$1 else p27$1);
    p27$2 := (if p25$2 && v18$2 then v18$2 else p27$2);
    v19$1 := (if p27$1 then $$private_x_0$0bv32$1 else v19$1);
    v19$2 := (if p27$2 then $$private_x_0$0bv32$2 else v19$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$kernel1.shared_A(p27$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32), 32bv32), v1$1), $$kernel1.shared_A[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32), 32bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$kernel1.shared_A(p27$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32), 32bv32), v1$2), $$kernel1.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32), 32bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel1.shared_A"} true;
    v20$1 := (if p27$1 then $$kernel1.shared_A[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32), 32bv32), v1$1)] else v20$1);
    v20$2 := (if p27$2 then $$kernel1.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32), 32bv32), v1$2)] else v20$2);
    v21$1 := (if p27$1 then $$private_x_1$0bv32$1 else v21$1);
    v21$2 := (if p27$2 then $$private_x_1$0bv32$2 else v21$2);
    $$private_x_0$0bv32$1 := (if p27$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v20$1), v21$1), v19$1) else $$private_x_0$0bv32$1);
    $$private_x_0$0bv32$2 := (if p27$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v20$2), v21$2), v19$2) else $$private_x_0$0bv32$2);
    goto __partitioned_block_$22.tail_2;

  __partitioned_block_$22.tail_2:
    call {:sourceloc_num 45} $bugle_barrier_duplicated_1(1bv1, 1bv1, p7$1, p7$2);
    v22$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$1), $g1.0$1), BV32_ADD($h1, 1bv32)) else v22$1);
    v22$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD($n, v1$2), $g1.0$2), BV32_ADD($h1, 1bv32)) else v22$2);
    p29$1 := (if p7$1 && v22$1 then v22$1 else p29$1);
    p29$2 := (if p7$2 && v22$2 then v22$2 else p29$2);
    v23$1 := (if p29$1 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 1bv32)) else v23$1);
    v23$2 := (if p29$2 then BV32_SGE($h1, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 1bv32)) else v23$2);
    p31$1 := (if p29$1 && v23$1 then v23$1 else p31$1);
    p31$2 := (if p29$2 && v23$2 then v23$2 else p31$2);
    v24$1 := (if p31$1 then $$private_x_0$0bv32$1 else v24$1);
    v24$2 := (if p31$2 then $$private_x_0$0bv32$2 else v24$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$x(p31$1, BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1), v24$1, $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(p31$2, BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$x(p31$2, BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2), v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$x"} true;
    $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1)] := (if p31$1 then v24$1 else $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$1), $h1), $g1.0$1)]);
    $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2)] := (if p31$2 then v24$2 else $$x[BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v1$2), $h1), $g1.0$2)]);
    goto __partitioned_block_$22.tail_3;

  __partitioned_block_$22.tail_3:
    call {:sourceloc_num 51} $bugle_barrier_duplicated_2(1bv1, 1bv1, p7$1, p7$2);
    $g1.0$1 := (if p7$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p7$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $10.backedge, $10.tail;

  $10.tail:
    assume !p6$1 && !p6$2;
    return;

  $10.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $10;

  $22.backedge:
    assume {:backedge} p20$1 || p20$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $22;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$kernel1.shared_A, $$x, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel1.shared_A, $$x, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel1.shared_A, $$x, _TRACKING;



var $$private_x_0$0bv32$1: bv64;

var $$private_x_0$0bv32$2: bv64;

var $$private_x_1$0bv32$1: bv64;

var $$private_x_1$0bv32$2: bv64;

const _WATCHED_VALUE_$$A: bv64;

procedure {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _READ_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_READ_$$A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$A);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$A: bool;

procedure {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _WRITE_HAS_OCCURRED_$$A);
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



procedure _CHECK_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A != _value);
  requires {:source_name "A"} {:array "$$A"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A != _value);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$A(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_ATOMIC_$$A(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_ATOMIC_$$A(_P: bool, _offset: bv32);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);
  requires {:source_name "A"} {:array "$$A"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



const _WATCHED_VALUE_$$x: bv64;

procedure {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$x;



implementation {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _READ_HAS_OCCURRED_$$x);
    return;
}



procedure _CHECK_READ_$$x(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$x);
  requires {:source_name "x"} {:array "$$x"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$x: bool;

procedure {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$x, _WRITE_READ_BENIGN_FLAG_$$x;



implementation {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _WRITE_HAS_OCCURRED_$$x);
    _WRITE_READ_BENIGN_FLAG_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$x);
    return;
}



procedure _CHECK_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64);
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



const _WATCHED_VALUE_$$kernel1.shared_A: bv64;

procedure {:inline 1} _LOG_READ_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel1.shared_A;



implementation {:inline 1} _LOG_READ_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel1.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_A == _value then true else _READ_HAS_OCCURRED_$$kernel1.shared_A);
    return;
}



procedure _CHECK_READ_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel1.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A;



implementation {:inline 1} _LOG_WRITE_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel1.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_A == _value then true else _WRITE_HAS_OCCURRED_$$kernel1.shared_A);
    _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A);
    return;
}



procedure _CHECK_WRITE_$$kernel1.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel1.shared_A(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A;



implementation {:inline 1} _LOG_ATOMIC_$$kernel1.shared_A(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel1.shared_A);
    return;
}



procedure _CHECK_ATOMIC_$$kernel1.shared_A(_P: bool, _offset: bv32);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel1.shared_A"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A := (if _P && _WRITE_HAS_OCCURRED_$$kernel1.shared_A && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_A);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}


