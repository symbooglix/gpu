type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$v2"} {:global} {:elem_width 64} {:source_name "v2"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v2: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v2: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v2: bool;

axiom {:array_info "$$u2"} {:global} {:elem_width 64} {:source_name "u2"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$u2: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$u2: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$u2: bool;

axiom {:array_info "$$u1"} {:global} {:elem_width 64} {:source_name "u1"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$u1: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$u1: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$u1: bool;

axiom {:array_info "$$v1"} {:global} {:elem_width 64} {:source_name "v1"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v1: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v1: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v1: bool;

var {:source_name "A"} {:global} $$A: [bv32]bv64;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

var {:source_name "shared_u1"} {:group_shared} $$kernel0.shared_u1: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_u1"} {:group_shared} {:elem_width 64} {:source_name "shared_u1"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel0.shared_u1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1: bool;

var {:source_name "shared_u2"} {:group_shared} $$kernel0.shared_u2: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_u2"} {:group_shared} {:elem_width 64} {:source_name "shared_u2"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel0.shared_u2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2: bool;

var {:source_name "shared_v1"} {:group_shared} $$kernel0.shared_v1: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_v1"} {:group_shared} {:elem_width 64} {:source_name "shared_v1"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel0.shared_v1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1: bool;

var {:source_name "shared_v2"} {:group_shared} $$kernel0.shared_v2: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_v2"} {:group_shared} {:elem_width 64} {:source_name "shared_v2"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel0.shared_v2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2: bool;

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

function FADD64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel0"} {:kernel} $kernel0($n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$v2 && !_WRITE_HAS_OCCURRED_$$v2 && !_ATOMIC_HAS_OCCURRED_$$v2;
  requires !_READ_HAS_OCCURRED_$$u2 && !_WRITE_HAS_OCCURRED_$$u2 && !_ATOMIC_HAS_OCCURRED_$$u2;
  requires !_READ_HAS_OCCURRED_$$u1 && !_WRITE_HAS_OCCURRED_$$u1 && !_ATOMIC_HAS_OCCURRED_$$u1;
  requires !_READ_HAS_OCCURRED_$$v1 && !_WRITE_HAS_OCCURRED_$$v1 && !_ATOMIC_HAS_OCCURRED_$$v1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_u1 && !_WRITE_HAS_OCCURRED_$$kernel0.shared_u1 && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_u2 && !_WRITE_HAS_OCCURRED_$$kernel0.shared_u2 && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_v1 && !_WRITE_HAS_OCCURRED_$$kernel0.shared_v1 && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_v2 && !_WRITE_HAS_OCCURRED_$$kernel0.shared_v2 && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2;
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
  modifies $$kernel0.shared_u1, $$kernel0.shared_u2, $$kernel0.shared_v1, $$kernel0.shared_v2, _WRITE_HAS_OCCURRED_$$kernel0.shared_u1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1, _WRITE_HAS_OCCURRED_$$kernel0.shared_u2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2, _WRITE_HAS_OCCURRED_$$kernel0.shared_v1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1, _WRITE_HAS_OCCURRED_$$kernel0.shared_v2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2, $$A, _TRACKING, _READ_HAS_OCCURRED_$$A, _READ_HAS_OCCURRED_$$kernel0.shared_u1, _READ_HAS_OCCURRED_$$kernel0.shared_v1, _READ_HAS_OCCURRED_$$kernel0.shared_u2, _READ_HAS_OCCURRED_$$kernel0.shared_v2, _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _TRACKING;



implementation {:source_name "kernel0"} {:kernel} $kernel0($n: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $c1.0$1: bv32;
  var $c1.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $c11.0$1: bv32;
  var $c11.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var $c12.0$1: bv32;
  var $c12.0$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $c13.0$1: bv32;
  var $c13.0$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $c14.0$1: bv32;
  var $c14.0$2: bv32;
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
  var v6$1: bv64;
  var v6$2: bv64;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bv64;
  var v19$2: bv64;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv64;
  var v23$2: bv64;
  var v24$1: bv64;
  var v24$2: bv64;
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bv64;
  var v26$2: bv64;
  var v27$1: bv64;
  var v27$2: bv64;
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
  var p33$1: bool;
  var p33$2: bool;
  var p34$1: bool;
  var p34$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
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
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_SLT($g1.0$1, $n) else v2$1);
    v2$2 := (if p0$2 then BV32_SLT($g1.0$2, $n) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p14$1 := false;
    p14$2 := false;
    p34$1 := false;
    p34$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    v3$1 := (if p1$1 then v0$1 == 0bv32 else v3$1);
    v3$2 := (if p1$2 then v0$2 == 0bv32 else v3$2);
    p3$1 := (if p1$1 && v3$1 then v3$1 else p3$1);
    p3$2 := (if p1$2 && v3$2 then v3$2 else p3$2);
    $c1.0$1 := (if p3$1 then v1$1 else $c1.0$1);
    $c1.0$2 := (if p3$2 then v1$2 else $c1.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_6_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_6"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 5} p4$1 ==> true;
    v4$1 := (if p4$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32), 31bv32) else v4$1);
    v4$2 := (if p4$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32), 31bv32) else v4$2);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p6$1 := (if p4$1 && v4$1 then v4$1 else p6$1);
    p6$2 := (if p4$2 && v4$2 then v4$2 else p6$2);
    p5$1 := (if p4$1 && !v4$1 then !v4$1 else p5$1);
    p5$2 := (if p4$2 && !v4$2 then !v4$2 else p5$2);
    $0$1 := (if p5$1 then 31bv32 else $0$1);
    $0$2 := (if p5$2 then 31bv32 else $0$2);
    $0$1 := (if p6$1 then BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32) else $0$1);
    $0$2 := (if p6$2 then BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32) else $0$2);
    v5$1 := (if p4$1 then BV32_SLE($c1.0$1, $0$1) else v5$1);
    v5$2 := (if p4$2 then BV32_SLE($c1.0$2, $0$2) else v5$2);
    p7$1 := (if p4$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p4$2 && v5$2 then v5$2 else p7$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v6$1 := (if p7$1 then _HAVOC_bv64$1 else v6$1);
    v6$2 := (if p7$2 then _HAVOC_bv64$2 else v6$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$kernel0.shared_u1(p7$1, $c1.0$1, v6$1, $$kernel0.shared_u1[1bv1][$c1.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1(p7$2, $c1.0$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$kernel0.shared_u1(p7$2, $c1.0$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_u1"} true;
    $$kernel0.shared_u1[1bv1][$c1.0$1] := (if p7$1 then v6$1 else $$kernel0.shared_u1[1bv1][$c1.0$1]);
    $$kernel0.shared_u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c1.0$2] := (if p7$2 then v6$2 else $$kernel0.shared_u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c1.0$2]);
    $c1.0$1 := (if p7$1 then BV32_ADD($c1.0$1, 16bv32) else $c1.0$1);
    $c1.0$2 := (if p7$2 then BV32_ADD($c1.0$2, 16bv32) else $c1.0$2);
    p4$1 := (if p7$1 then true else p4$1);
    p4$2 := (if p7$2 then true else p4$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p4$1 && !p4$2;
    v7$1 := (if p1$1 then v0$1 == 0bv32 else v7$1);
    v7$2 := (if p1$2 then v0$2 == 0bv32 else v7$2);
    p9$1 := (if p1$1 && v7$1 then v7$1 else p9$1);
    p9$2 := (if p1$2 && v7$2 then v7$2 else p9$2);
    $c11.0$1 := (if p9$1 then v1$1 else $c11.0$1);
    $c11.0$2 := (if p9$2 then v1$2 else $c11.0$2);
    p10$1 := (if p9$1 then true else p10$1);
    p10$2 := (if p9$2 then true else p10$2);
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_5"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p10$1 ==> p0$1;
    assert p10$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 16} p10$1 ==> true;
    v8$1 := (if p10$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32), 31bv32) else v8$1);
    v8$2 := (if p10$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32), 31bv32) else v8$2);
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p12$1 := (if p10$1 && v8$1 then v8$1 else p12$1);
    p12$2 := (if p10$2 && v8$2 then v8$2 else p12$2);
    p11$1 := (if p10$1 && !v8$1 then !v8$1 else p11$1);
    p11$2 := (if p10$2 && !v8$2 then !v8$2 else p11$2);
    $1$1 := (if p11$1 then 31bv32 else $1$1);
    $1$2 := (if p11$2 then 31bv32 else $1$2);
    $1$1 := (if p12$1 then BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32) else $1$1);
    $1$2 := (if p12$2 then BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32) else $1$2);
    v9$1 := (if p10$1 then BV32_SLE($c11.0$1, $1$1) else v9$1);
    v9$2 := (if p10$2 then BV32_SLE($c11.0$2, $1$2) else v9$2);
    p13$1 := (if p10$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p10$2 && v9$2 then v9$2 else p13$2);
    p10$1 := (if p10$1 && !v9$1 then v9$1 else p10$1);
    p10$2 := (if p10$2 && !v9$2 then v9$2 else p10$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v10$1 := (if p13$1 then _HAVOC_bv64$1 else v10$1);
    v10$2 := (if p13$2 then _HAVOC_bv64$2 else v10$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$kernel0.shared_u2(p13$1, $c11.0$1, v10$1, $$kernel0.shared_u2[1bv1][$c11.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2(p13$2, $c11.0$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$kernel0.shared_u2(p13$2, $c11.0$2, v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_u2"} true;
    $$kernel0.shared_u2[1bv1][$c11.0$1] := (if p13$1 then v10$1 else $$kernel0.shared_u2[1bv1][$c11.0$1]);
    $$kernel0.shared_u2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c11.0$2] := (if p13$2 then v10$2 else $$kernel0.shared_u2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c11.0$2]);
    $c11.0$1 := (if p13$1 then BV32_ADD($c11.0$1, 16bv32) else $c11.0$1);
    $c11.0$2 := (if p13$2 then BV32_ADD($c11.0$2, 16bv32) else $c11.0$2);
    p10$1 := (if p13$1 then true else p10$1);
    p10$2 := (if p13$2 then true else p10$2);
    goto $13.backedge, $13.tail;

  $13.tail:
    assume !p10$1 && !p10$2;
    $g3.0$1 := (if p1$1 then BV32_MUL(32bv32, group_id_y$1) else $g3.0$1);
    $g3.0$2 := (if p1$2 then BV32_MUL(32bv32, group_id_y$2) else $g3.0$2);
    p14$1 := (if p1$1 then true else p14$1);
    p14$2 := (if p1$2 then true else p14$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p14$1 ==> p0$1;
    assert p14$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 26} p14$1 ==> true;
    v11$1 := (if p14$1 then BV32_SLT($g3.0$1, $n) else v11$1);
    v11$2 := (if p14$2 then BV32_SLT($g3.0$2, $n) else v11$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p28$1 := false;
    p28$2 := false;
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    p15$1 := (if p14$1 && v11$1 then v11$1 else p15$1);
    p15$2 := (if p14$2 && v11$2 then v11$2 else p15$2);
    p14$1 := (if p14$1 && !v11$1 then v11$1 else p14$1);
    p14$2 := (if p14$2 && !v11$2 then v11$2 else p14$2);
    v12$1 := (if p15$1 then v0$1 == 0bv32 else v12$1);
    v12$2 := (if p15$2 then v0$2 == 0bv32 else v12$2);
    p17$1 := (if p15$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p15$2 && v12$2 then v12$2 else p17$2);
    $c12.0$1 := (if p17$1 then v1$1 else $c12.0$1);
    $c12.0$2 := (if p17$2 then v1$2 else $c12.0$2);
    p18$1 := (if p17$1 then true else p18$1);
    p18$2 := (if p17$2 then true else p18$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $24;

  $24:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p18$1 ==> p14$1;
    assert p18$2 ==> p14$2;
    assert p14$1 ==> p0$1;
    assert p14$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 29} p18$1 ==> true;
    v13$1 := (if p18$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32)) else v13$1);
    v13$2 := (if p18$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32)) else v13$2);
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p20$1 := (if p18$1 && v13$1 then v13$1 else p20$1);
    p20$2 := (if p18$2 && v13$2 then v13$2 else p20$2);
    p19$1 := (if p18$1 && !v13$1 then !v13$1 else p19$1);
    p19$2 := (if p18$2 && !v13$2 then !v13$2 else p19$2);
    $2$1 := (if p19$1 then BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32) else $2$1);
    $2$2 := (if p19$2 then BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32) else $2$2);
    $2$1 := (if p20$1 then 31bv32 else $2$1);
    $2$2 := (if p20$2 then 31bv32 else $2$2);
    v14$1 := (if p18$1 then BV32_SLE($c12.0$1, $2$1) else v14$1);
    v14$2 := (if p18$2 then BV32_SLE($c12.0$2, $2$2) else v14$2);
    p21$1 := (if p18$1 && v14$1 then v14$1 else p21$1);
    p21$2 := (if p18$2 && v14$2 then v14$2 else p21$2);
    p18$1 := (if p18$1 && !v14$1 then v14$1 else p18$1);
    p18$2 := (if p18$2 && !v14$2 then v14$2 else p18$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v15$1 := (if p21$1 then _HAVOC_bv64$1 else v15$1);
    v15$2 := (if p21$2 then _HAVOC_bv64$2 else v15$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$kernel0.shared_v1(p21$1, $c12.0$1, v15$1, $$kernel0.shared_v1[1bv1][$c12.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1(p21$2, $c12.0$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$kernel0.shared_v1(p21$2, $c12.0$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_v1"} true;
    $$kernel0.shared_v1[1bv1][$c12.0$1] := (if p21$1 then v15$1 else $$kernel0.shared_v1[1bv1][$c12.0$1]);
    $$kernel0.shared_v1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c12.0$2] := (if p21$2 then v15$2 else $$kernel0.shared_v1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c12.0$2]);
    $c12.0$1 := (if p21$1 then BV32_ADD($c12.0$1, 16bv32) else $c12.0$1);
    $c12.0$2 := (if p21$2 then BV32_ADD($c12.0$2, 16bv32) else $c12.0$2);
    p18$1 := (if p21$1 then true else p18$1);
    p18$2 := (if p21$2 then true else p18$2);
    goto $24.backedge, $24.tail;

  $24.tail:
    assume !p18$1 && !p18$2;
    v16$1 := (if p15$1 then v0$1 == 0bv32 else v16$1);
    v16$2 := (if p15$2 then v0$2 == 0bv32 else v16$2);
    p23$1 := (if p15$1 && v16$1 then v16$1 else p23$1);
    p23$2 := (if p15$2 && v16$2 then v16$2 else p23$2);
    $c13.0$1 := (if p23$1 then v1$1 else $c13.0$1);
    $c13.0$2 := (if p23$2 then v1$2 else $c13.0$2);
    p24$1 := (if p23$1 then true else p24$1);
    p24$2 := (if p23$2 then true else p24$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $33;

  $33:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p24$1 ==> p14$1;
    assert p24$2 ==> p14$2;
    assert p14$1 ==> p0$1;
    assert p14$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 40} p24$1 ==> true;
    v17$1 := (if p24$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32)) else v17$1);
    v17$2 := (if p24$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32)) else v17$2);
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p27$1 := false;
    p27$2 := false;
    p26$1 := (if p24$1 && v17$1 then v17$1 else p26$1);
    p26$2 := (if p24$2 && v17$2 then v17$2 else p26$2);
    p25$1 := (if p24$1 && !v17$1 then !v17$1 else p25$1);
    p25$2 := (if p24$2 && !v17$2 then !v17$2 else p25$2);
    $3$1 := (if p25$1 then BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32) else $3$1);
    $3$2 := (if p25$2 then BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32) else $3$2);
    $3$1 := (if p26$1 then 31bv32 else $3$1);
    $3$2 := (if p26$2 then 31bv32 else $3$2);
    v18$1 := (if p24$1 then BV32_SLE($c13.0$1, $3$1) else v18$1);
    v18$2 := (if p24$2 then BV32_SLE($c13.0$2, $3$2) else v18$2);
    p27$1 := (if p24$1 && v18$1 then v18$1 else p27$1);
    p27$2 := (if p24$2 && v18$2 then v18$2 else p27$2);
    p24$1 := (if p24$1 && !v18$1 then v18$1 else p24$1);
    p24$2 := (if p24$2 && !v18$2 then v18$2 else p24$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v19$1 := (if p27$1 then _HAVOC_bv64$1 else v19$1);
    v19$2 := (if p27$2 then _HAVOC_bv64$2 else v19$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$kernel0.shared_v2(p27$1, $c13.0$1, v19$1, $$kernel0.shared_v2[1bv1][$c13.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2(p27$2, $c13.0$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$kernel0.shared_v2(p27$2, $c13.0$2, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_v2"} true;
    $$kernel0.shared_v2[1bv1][$c13.0$1] := (if p27$1 then v19$1 else $$kernel0.shared_v2[1bv1][$c13.0$1]);
    $$kernel0.shared_v2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c13.0$2] := (if p27$2 then v19$2 else $$kernel0.shared_v2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c13.0$2]);
    $c13.0$1 := (if p27$1 then BV32_ADD($c13.0$1, 16bv32) else $c13.0$1);
    $c13.0$2 := (if p27$2 then BV32_ADD($c13.0$2, 16bv32) else $c13.0$2);
    p24$1 := (if p27$1 then true else p24$1);
    p24$2 := (if p27$2 then true else p24$2);
    goto $33.backedge, __partitioned_block_$33.tail_0;

  __partitioned_block_$33.tail_0:
    assume !p24$1 && !p24$2;
    goto __partitioned_block_$33.tail_1;

  __partitioned_block_$33.tail_1:
    call {:sourceloc_num 50} $bugle_barrier_duplicated_0(1bv1, 1bv1, p15$1, p15$2);
    v20$1 := (if p15$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v20$1);
    v20$2 := (if p15$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v20$2);
    p29$1 := (if p15$1 && v20$1 then v20$1 else p29$1);
    p29$2 := (if p15$2 && v20$2 then v20$2 else p29$2);
    $c14.0$1 := (if p29$1 then v1$1 else $c14.0$1);
    $c14.0$2 := (if p29$2 then v1$2 else $c14.0$2);
    p30$1 := (if p29$1 then true else p30$1);
    p30$2 := (if p29$2 then true else p30$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $42;

  $42:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_v1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p30$1 ==> p14$1;
    assert p30$2 ==> p14$2;
    assert p14$1 ==> p0$1;
    assert p14$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 52} p30$1 ==> true;
    v21$1 := (if p30$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32), 31bv32) else v21$1);
    v21$2 := (if p30$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32), 31bv32) else v21$2);
    p31$1 := false;
    p31$2 := false;
    p32$1 := false;
    p32$2 := false;
    p33$1 := false;
    p33$2 := false;
    p32$1 := (if p30$1 && v21$1 then v21$1 else p32$1);
    p32$2 := (if p30$2 && v21$2 then v21$2 else p32$2);
    p31$1 := (if p30$1 && !v21$1 then !v21$1 else p31$1);
    p31$2 := (if p30$2 && !v21$2 then !v21$2 else p31$2);
    $4$1 := (if p31$1 then 31bv32 else $4$1);
    $4$2 := (if p31$2 then 31bv32 else $4$2);
    $4$1 := (if p32$1 then BV32_SUB(BV32_SUB($n, $g3.0$1), 1bv32) else $4$1);
    $4$2 := (if p32$2 then BV32_SUB(BV32_SUB($n, $g3.0$2), 1bv32) else $4$2);
    v22$1 := (if p30$1 then BV32_SLE($c14.0$1, $4$1) else v22$1);
    v22$2 := (if p30$2 then BV32_SLE($c14.0$2, $4$2) else v22$2);
    p33$1 := (if p30$1 && v22$1 then v22$1 else p33$1);
    p33$2 := (if p30$2 && v22$2 then v22$2 else p33$2);
    p30$1 := (if p30$1 && !v22$1 then v22$1 else p30$1);
    p30$2 := (if p30$2 && !v22$2 then v22$2 else p30$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$A(p33$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$A(p33$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v23$1 := (if p33$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1))] else v23$1);
    v23$2 := (if p33$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2))] else v23$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$kernel0.shared_u1(p33$1, v0$1, $$kernel0.shared_u1[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$kernel0.shared_u1(p33$2, v0$2, $$kernel0.shared_u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_u1"} true;
    v24$1 := (if p33$1 then $$kernel0.shared_u1[1bv1][v0$1] else v24$1);
    v24$2 := (if p33$2 then $$kernel0.shared_u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v24$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$kernel0.shared_v1(p33$1, $c14.0$1, $$kernel0.shared_v1[1bv1][$c14.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$kernel0.shared_v1(p33$2, $c14.0$2, $$kernel0.shared_v1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c14.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_v1"} true;
    v25$1 := (if p33$1 then $$kernel0.shared_v1[1bv1][$c14.0$1] else v25$1);
    v25$2 := (if p33$2 then $$kernel0.shared_v1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c14.0$2] else v25$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$kernel0.shared_u2(p33$1, v0$1, $$kernel0.shared_u2[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$kernel0.shared_u2(p33$2, v0$2, $$kernel0.shared_u2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_u2"} true;
    v26$1 := (if p33$1 then $$kernel0.shared_u2[1bv1][v0$1] else v26$1);
    v26$2 := (if p33$2 then $$kernel0.shared_u2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v26$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$kernel0.shared_v2(p33$1, $c14.0$1, $$kernel0.shared_v2[1bv1][$c14.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$kernel0.shared_v2(p33$2, $c14.0$2, $$kernel0.shared_v2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c14.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_v2"} true;
    v27$1 := (if p33$1 then $$kernel0.shared_v2[1bv1][$c14.0$1] else v27$1);
    v27$2 := (if p33$2 then $$kernel0.shared_v2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c14.0$2] else v27$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$A(p33$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1)), FADD64(FMUL64(v26$1, v27$1), FADD64(FMUL64(v24$1, v25$1), v23$1)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(p33$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$A(p33$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2)), FADD64(FMUL64(v26$2, v27$2), FADD64(FMUL64(v24$2, v25$2), v23$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$A"} true;
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1))] := (if p33$1 then FADD64(FMUL64(v26$1, v27$1), FADD64(FMUL64(v24$1, v25$1), v23$1)) else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $n), BV32_ADD($g3.0$1, $c14.0$1))]);
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2))] := (if p33$2 then FADD64(FMUL64(v26$2, v27$2), FADD64(FMUL64(v24$2, v25$2), v23$2)) else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $n), BV32_ADD($g3.0$2, $c14.0$2))]);
    $c14.0$1 := (if p33$1 then BV32_ADD($c14.0$1, 16bv32) else $c14.0$1);
    $c14.0$2 := (if p33$2 then BV32_ADD($c14.0$2, 16bv32) else $c14.0$2);
    p30$1 := (if p33$1 then true else p30$1);
    p30$2 := (if p33$2 then true else p30$2);
    goto $42.backedge, __partitioned_block_$42.tail_0;

  __partitioned_block_$42.tail_0:
    assume !p30$1 && !p30$2;
    goto __partitioned_block_$42.tail_1;

  __partitioned_block_$42.tail_1:
    call {:sourceloc_num 66} $bugle_barrier_duplicated_1(1bv1, 1bv1, p15$1, p15$2);
    $g3.0$1 := (if p15$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p15$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p14$1 := (if p15$1 then true else p14$1);
    p14$2 := (if p15$2 then true else p14$2);
    goto $21.backedge, $21.tail;

  $21.tail:
    assume !p14$1 && !p14$2;
    $g1.0$1 := (if p1$1 then BV32_ADD($g1.0$1, 8192bv32) else $g1.0$1);
    $g1.0$2 := (if p1$2 then BV32_ADD($g1.0$2, 8192bv32) else $g1.0$2);
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

  $21.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $21;

  $42.backedge:
    assume {:backedge} p30$1 || p30$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $42;

  $33.backedge:
    assume {:backedge} p24$1 || p24$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $33;

  $24.backedge:
    assume {:backedge} p18$1 || p18$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $24;

  $13.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $13;

  $4.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_6_0"} true;
    goto $4;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_u1, $$kernel0.shared_u2, $$kernel0.shared_v1, $$kernel0.shared_v2, $$A, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_u1, $$kernel0.shared_u2, $$kernel0.shared_v1, $$kernel0.shared_v2, $$A, _TRACKING;



const _WATCHED_VALUE_$$v2: bv64;

procedure {:inline 1} _LOG_READ_$$v2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$v2;



implementation {:inline 1} _LOG_READ_$$v2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v2 == _value then true else _READ_HAS_OCCURRED_$$v2);
    return;
}



procedure _CHECK_READ_$$v2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v2);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v2: bool;

procedure {:inline 1} _LOG_WRITE_$$v2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$v2, _WRITE_READ_BENIGN_FLAG_$$v2;



implementation {:inline 1} _LOG_WRITE_$$v2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v2 == _value then true else _WRITE_HAS_OCCURRED_$$v2);
    _WRITE_READ_BENIGN_FLAG_$$v2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v2);
    return;
}



procedure _CHECK_WRITE_$$v2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v2 != _value);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v2 != _value);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v2;



implementation {:inline 1} _LOG_ATOMIC_$$v2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v2);
    return;
}



procedure _CHECK_ATOMIC_$$v2(_P: bool, _offset: bv32);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset);
  requires {:source_name "v2"} {:array "$$v2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v2 := (if _P && _WRITE_HAS_OCCURRED_$$v2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v2);
    return;
}



const _WATCHED_VALUE_$$u2: bv64;

procedure {:inline 1} _LOG_READ_$$u2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$u2;



implementation {:inline 1} _LOG_READ_$$u2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u2 == _value then true else _READ_HAS_OCCURRED_$$u2);
    return;
}



procedure _CHECK_READ_$$u2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$u2);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$u2: bool;

procedure {:inline 1} _LOG_WRITE_$$u2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$u2, _WRITE_READ_BENIGN_FLAG_$$u2;



implementation {:inline 1} _LOG_WRITE_$$u2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u2 == _value then true else _WRITE_HAS_OCCURRED_$$u2);
    _WRITE_READ_BENIGN_FLAG_$$u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$u2);
    return;
}



procedure _CHECK_WRITE_$$u2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u2 != _value);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u2 != _value);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$u2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$u2;



implementation {:inline 1} _LOG_ATOMIC_$$u2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$u2);
    return;
}



procedure _CHECK_ATOMIC_$$u2(_P: bool, _offset: bv32);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset);
  requires {:source_name "u2"} {:array "$$u2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$u2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$u2 := (if _P && _WRITE_HAS_OCCURRED_$$u2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$u2);
    return;
}



const _WATCHED_VALUE_$$u1: bv64;

procedure {:inline 1} _LOG_READ_$$u1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$u1;



implementation {:inline 1} _LOG_READ_$$u1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u1 == _value then true else _READ_HAS_OCCURRED_$$u1);
    return;
}



procedure _CHECK_READ_$$u1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$u1);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$u1: bool;

procedure {:inline 1} _LOG_WRITE_$$u1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$u1, _WRITE_READ_BENIGN_FLAG_$$u1;



implementation {:inline 1} _LOG_WRITE_$$u1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u1 == _value then true else _WRITE_HAS_OCCURRED_$$u1);
    _WRITE_READ_BENIGN_FLAG_$$u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$u1);
    return;
}



procedure _CHECK_WRITE_$$u1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u1 != _value);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u1 != _value);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$u1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$u1;



implementation {:inline 1} _LOG_ATOMIC_$$u1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$u1);
    return;
}



procedure _CHECK_ATOMIC_$$u1(_P: bool, _offset: bv32);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "u1"} {:array "$$u1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$u1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$u1 := (if _P && _WRITE_HAS_OCCURRED_$$u1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$u1);
    return;
}



const _WATCHED_VALUE_$$v1: bv64;

procedure {:inline 1} _LOG_READ_$$v1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$v1;



implementation {:inline 1} _LOG_READ_$$v1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v1 == _value then true else _READ_HAS_OCCURRED_$$v1);
    return;
}



procedure _CHECK_READ_$$v1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v1);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v1: bool;

procedure {:inline 1} _LOG_WRITE_$$v1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$v1, _WRITE_READ_BENIGN_FLAG_$$v1;



implementation {:inline 1} _LOG_WRITE_$$v1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v1 == _value then true else _WRITE_HAS_OCCURRED_$$v1);
    _WRITE_READ_BENIGN_FLAG_$$v1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v1);
    return;
}



procedure _CHECK_WRITE_$$v1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v1 != _value);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v1 != _value);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v1;



implementation {:inline 1} _LOG_ATOMIC_$$v1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v1);
    return;
}



procedure _CHECK_ATOMIC_$$v1(_P: bool, _offset: bv32);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "v1"} {:array "$$v1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v1 := (if _P && _WRITE_HAS_OCCURRED_$$v1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v1);
    return;
}



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



const _WATCHED_VALUE_$$kernel0.shared_u1: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_u1;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u1 == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_u1);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_u1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u1 == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_u1);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_u1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_u1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_u1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_u1(_P: bool, _offset: bv32);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u1"} {:array "$$kernel0.shared_u1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1 := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u1);
    return;
}



const _WATCHED_VALUE_$$kernel0.shared_u2: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_u2;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_u2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u2 == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_u2);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_u2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u2 == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_u2);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_u2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_u2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_u2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_u2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_u2(_P: bool, _offset: bv32);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_u2"} {:array "$$kernel0.shared_u2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2 := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_u2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_u2);
    return;
}



const _WATCHED_VALUE_$$kernel0.shared_v1: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_v1;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_v1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v1 == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_v1);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_v1, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v1 == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_v1);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_v1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_v1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_v1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_v1(_P: bool, _offset: bv32);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v1"} {:array "$$kernel0.shared_v1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1 := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v1);
    return;
}



const _WATCHED_VALUE_$$kernel0.shared_v2: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_v2;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_v2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v2 == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_v2);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_v2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v2 == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_v2);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_v2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_v2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_v2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_v2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_v2(_P: bool, _offset: bv32);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_v2"} {:array "$$kernel0.shared_v2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2 := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_v2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_v2);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_u1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_u1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_u2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_u2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_v1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_v1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1;
    goto anon3;

  anon3:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_v2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_v2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2;
    goto anon4;

  anon4:
    goto anon14_Then, anon14_Else;

  anon14_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
    goto anon10;

  anon10:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon12;

  anon12:
    havoc _TRACKING;
    return;

  anon15_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$A;
    goto anon12;

  anon14_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_u1;
    goto anon6;

  anon6:
    havoc $$kernel0.shared_u2;
    goto anon7;

  anon7:
    havoc $$kernel0.shared_v1;
    goto anon8;

  anon8:
    havoc $$kernel0.shared_v2;
    goto anon9;

  anon13_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_u1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_u1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u1;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_u2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_u2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_u2;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_v1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_v1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v1;
    goto anon3;

  anon3:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_v2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_v2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_v2;
    goto anon4;

  anon4:
    goto anon14_Then, anon14_Else;

  anon14_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
    goto anon10;

  anon10:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon12;

  anon12:
    havoc _TRACKING;
    return;

  anon15_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$A;
    goto anon12;

  anon14_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_u1;
    goto anon6;

  anon6:
    havoc $$kernel0.shared_u2;
    goto anon7;

  anon7:
    havoc $$kernel0.shared_v1;
    goto anon8;

  anon8:
    havoc $$kernel0.shared_v2;
    goto anon9;

  anon13_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
