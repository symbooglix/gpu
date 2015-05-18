type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$alpha"} {:global} {:elem_width 64} {:source_name "alpha"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$alpha: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$alpha: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$alpha: bool;

var {:source_name "y"} {:global} $$y: [bv32]bv64;

axiom {:array_info "$$y"} {:global} {:elem_width 64} {:source_name "y"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$y: bool;

var {:source_name "shared_alpha"} {:group_shared} $$kernel8.shared_alpha: [bv1][bv32]bv64;

axiom {:array_info "$$kernel8.shared_alpha"} {:group_shared} {:elem_width 64} {:source_name "shared_alpha"} {:source_elem_width 64} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel8.shared_alpha: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha: bool;

var {:source_name "shared_y_2"} {:group_shared} $$kernel8.shared_y_2: [bv1][bv32]bv64;

axiom {:array_info "$$kernel8.shared_y_2"} {:group_shared} {:elem_width 64} {:source_name "shared_y_2"} {:source_elem_width 64} {:source_dimensions "32,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel8.shared_y_2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2: bool;

var {:source_name "shared_y_1"} {:group_shared} $$kernel8.shared_y_1: [bv1][bv32]bv64;

axiom {:array_info "$$kernel8.shared_y_1"} {:group_shared} {:elem_width 64} {:source_name "shared_y_1"} {:source_elem_width 64} {:source_dimensions "32,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel8.shared_y_1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1: bool;

var {:source_name "shared_y_0"} {:group_shared} $$kernel8.shared_y_0: [bv1][bv32]bv64;

axiom {:array_info "$$kernel8.shared_y_0"} {:group_shared} {:elem_width 64} {:source_name "shared_y_0"} {:source_elem_width 64} {:source_dimensions "32,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel8.shared_y_0: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel8"} {:kernel} $kernel8($n: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$alpha && !_WRITE_HAS_OCCURRED_$$alpha && !_ATOMIC_HAS_OCCURRED_$$alpha;
  requires !_READ_HAS_OCCURRED_$$y && !_WRITE_HAS_OCCURRED_$$y && !_ATOMIC_HAS_OCCURRED_$$y;
  requires !_READ_HAS_OCCURRED_$$kernel8.shared_alpha && !_WRITE_HAS_OCCURRED_$$kernel8.shared_alpha && !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha;
  requires !_READ_HAS_OCCURRED_$$kernel8.shared_y_2 && !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 && !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2;
  requires !_READ_HAS_OCCURRED_$$kernel8.shared_y_1 && !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 && !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1;
  requires !_READ_HAS_OCCURRED_$$kernel8.shared_y_0 && !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 && !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0;
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
  modifies $$kernel8.shared_alpha, $$kernel8.shared_y_2, $$kernel8.shared_y_1, $$kernel8.shared_y_0, _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha, _READ_HAS_OCCURRED_$$y, _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2, _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1, $$y, _TRACKING, _READ_HAS_OCCURRED_$$kernel8.shared_y_1, _READ_HAS_OCCURRED_$$kernel8.shared_alpha, _READ_HAS_OCCURRED_$$kernel8.shared_y_2, _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0, _TRACKING, _READ_HAS_OCCURRED_$$kernel8.shared_y_0, _WRITE_HAS_OCCURRED_$$y, _WRITE_READ_BENIGN_FLAG_$$y, _WRITE_READ_BENIGN_FLAG_$$y, _TRACKING;



implementation {:source_name "kernel8"} {:kernel} $kernel8($n: bv32, $h0: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $c0.0$1: bv32;
  var $c0.0$2: bv32;
  var $c01.0$1: bv32;
  var $c01.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $c02.0$1: bv32;
  var $c02.0$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv64;
  var v4$2: bv64;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv64;
  var v9$2: bv64;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv64;
  var v13$2: bv64;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bv64;
  var v17$2: bv64;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv64;
  var v21$2: bv64;
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
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := BV32_SGE(BV32_MUL(32768bv32, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(1048544bv32, v0$1), $h0), 1048575bv32), 1048576bv32)), BV32_ADD(BV32_MUL(32767bv32, v0$1), 32768bv32));
    v2$2 := BV32_SGE(BV32_MUL(32768bv32, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(1048544bv32, v0$2), $h0), 1048575bv32), 1048576bv32)), BV32_ADD(BV32_MUL(32767bv32, v0$2), 32768bv32));
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
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    v3$1 := (if p0$1 then v1$1 == 0bv32 else v3$1);
    v3$2 := (if p0$2 then v1$2 == 0bv32 else v3$2);
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v4$1 := (if p1$1 then _HAVOC_bv64$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv64$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$kernel8.shared_alpha(p1$1, 0bv32, v4$1, $$kernel8.shared_alpha[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha(p1$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$kernel8.shared_alpha(p1$2, 0bv32, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel8.shared_alpha"} true;
    $$kernel8.shared_alpha[1bv1][0bv32] := (if p1$1 then v4$1 else $$kernel8.shared_alpha[1bv1][0bv32]);
    $$kernel8.shared_alpha[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p1$2 then v4$2 else $$kernel8.shared_alpha[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    $g1.0$1 := BV32_MUL(32bv32, v0$1);
    $g1.0$2 := BV32_MUL(32bv32, v0$2);
    p4$1 := true;
    p4$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b78 ==> _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b77 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_0;
    assert {:tag "noread"} _b76 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_0;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b75 ==> _READ_HAS_OCCURRED_$$kernel8.shared_y_1 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b74 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1;
    assert {:tag "noread"} _b73 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b72 ==> _READ_HAS_OCCURRED_$$kernel8.shared_y_2 ==> _WATCHED_OFFSET == BV32_ADD(BV32_SUB(0bv32, local_id_x$1), 31bv32);
    assert {:tag "nowrite"} _b71 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2;
    assert {:tag "noread"} _b70 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_2;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b69 ==> _READ_HAS_OCCURRED_$$kernel8.shared_alpha ==> _WATCHED_OFFSET == 0bv32;
    assert {:tag "noread"} _b68 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_alpha;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b67 ==> _WRITE_HAS_OCCURRED_$$y ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $n), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $n), 1bv32), BV32_ADD(BV32_MUL(0bv32, $n), $h0));
    assert {:tag "nowrite"} _b66 ==> !_WRITE_HAS_OCCURRED_$$y;
    assert {:tag "noread"} _b65 ==> !_READ_HAS_OCCURRED_$$y;
    assert {:tag "predicatedEquality"} _b64 ==> p4$1 && p4$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b63 ==> p4$1 && p4$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b62 ==> p4$1 && p4$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b61 ==> p4$1 && p4$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b60 ==> p4$1 && p4$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b59 ==> p4$1 && p4$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b58 ==> p4$1 && p4$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b57 ==> p4$1 && p4$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b56 ==> p4$1 && p4$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b55 ==> p4$1 && p4$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b54 ==> p4$1 && p4$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b53 ==> p4$1 && p4$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b52 ==> p4$1 && p4$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b51 ==> p4$1 && p4$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b50 ==> p4$1 && p4$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b49 ==> p4$1 && p4$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b48 ==> p4$1 && p4$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b47 ==> p4$1 && p4$2 ==> $2$1 == $2$2;
    assert {:tag "predicatedEquality"} _b46 ==> p4$1 && p4$2 ==> $c02.0$1 == $c02.0$2;
    assert {:tag "predicatedEquality"} _b45 ==> p4$1 && p4$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b44 ==> p4$1 && p4$2 ==> $c01.0$1 == $c01.0$2;
    assert {:tag "predicatedEquality"} _b43 ==> p4$1 && p4$2 ==> $c0.0$1 == $c0.0$2;
    assert {:tag "predicatedEquality"} _b42 ==> p4$1 && p4$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b41 ==> p4$1 && p4$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b40 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p4$1 == p4$2;
    assert {:tag "loopPredicateEquality"} _b39 ==> p4$1 == p4$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, $h0) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, $h0) ==> p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b6 ==> BV32_UGE($g1.0$1, BV32_MUL(32bv32, v0$1));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b6 ==> BV32_UGE($g1.0$2, BV32_MUL(32bv32, v0$2));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b5 ==> BV32_ULE($g1.0$1, BV32_MUL(32bv32, v0$1));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b5 ==> BV32_ULE($g1.0$2, BV32_MUL(32bv32, v0$2));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b4 ==> BV32_SGE($g1.0$1, BV32_MUL(32bv32, v0$1));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b4 ==> BV32_SGE($g1.0$2, BV32_MUL(32bv32, v0$2));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b3 ==> BV32_SLE($g1.0$1, BV32_MUL(32bv32, v0$1));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b3 ==> BV32_SLE($g1.0$2, BV32_MUL(32bv32, v0$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p4$1 ==> _b2 ==> BV32_SUB($g1.0$1, BV32_MUL(32bv32, v0$1)) == BV32_SUB($g1.0$2, BV32_MUL(32bv32, v0$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p4$2 ==> _b2 ==> BV32_SUB($g1.0$2, BV32_MUL(32bv32, v0$2)) == BV32_SUB($g1.0$1, BV32_MUL(32bv32, v0$1));
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p4$1 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$1) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p4$2 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$2) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 8} p4$1 ==> true;
    v5$1 := (if p4$1 then BV32_SLT($g1.0$1, $h0) else v5$1);
    v5$2 := (if p4$2 then BV32_SLT($g1.0$2, $h0) else v5$2);
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
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p26$1 := false;
    p26$2 := false;
    p5$1 := (if p4$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p4$2 && v5$2 then v5$2 else p5$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    v6$1 := (if p5$1 then v1$1 == 0bv32 else v6$1);
    v6$2 := (if p5$2 then v1$2 == 0bv32 else v6$2);
    p7$1 := (if p5$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p5$2 && v6$2 then v6$2 else p7$2);
    v7$1 := (if p7$1 then BV32_SGT(0bv32, BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h0), $g1.0$1), 32bv32)) else v7$1);
    v7$2 := (if p7$2 then BV32_SGT(0bv32, BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h0), $g1.0$2), 32bv32)) else v7$2);
    p9$1 := (if p7$1 && v7$1 then v7$1 else p9$1);
    p9$2 := (if p7$2 && v7$2 then v7$2 else p9$2);
    p8$1 := (if p7$1 && !v7$1 then !v7$1 else p8$1);
    p8$2 := (if p7$2 && !v7$2 then !v7$2 else p8$2);
    $0$1 := (if p8$1 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h0), $g1.0$1), 32bv32) else $0$1);
    $0$2 := (if p8$2 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $h0), $g1.0$2), 32bv32) else $0$2);
    $0$1 := (if p9$1 then 0bv32 else $0$1);
    $0$2 := (if p9$2 then 0bv32 else $0$2);
    $c0.0$1 := (if p7$1 then $0$1 else $c0.0$1);
    $c0.0$2 := (if p7$2 then $0$2 else $c0.0$2);
    p10$1 := (if p7$1 then true else p10$1);
    p10$2 := (if p7$2 then true else p10$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p10$1 ==> p4$1;
    assert p10$2 ==> p4$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b38 ==> _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p10$1 ==> _b37 ==> p10$1 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p10$2 ==> _b37 ==> p10$2 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b36 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32 && BV32_SLE($c0.0$1, 31bv32) ==> p10$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b36 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32 && BV32_SLE($c0.0$2, 31bv32) ==> p10$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b35 ==> v1$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$y;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b34 ==> v1$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b33 ==> v1$1 != 0bv32 ==> !p10$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b33 ==> v1$2 != 0bv32 ==> !p10$2;
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b32 ==> BV32_UGE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b32 ==> BV32_UGE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b31 ==> BV32_ULE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b31 ==> BV32_ULE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b30 ==> BV32_SGE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b30 ==> BV32_SGE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b29 ==> BV32_SLE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b29 ==> BV32_SLE($c0.0$2, $0$2);
    assert {:tag "guardNonNeg"} {:thread 1} p10$1 ==> _b28 ==> BV32_SLE(0bv32, $c0.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p10$2 ==> _b28 ==> BV32_SLE(0bv32, $c0.0$2);
    assert {:block_sourceloc} {:sourceloc_num 14} p10$1 ==> true;
    v8$1 := (if p10$1 then BV32_SLE($c0.0$1, 31bv32) else v8$1);
    v8$2 := (if p10$2 then BV32_SLE($c0.0$2, 31bv32) else v8$2);
    p11$1 := false;
    p11$2 := false;
    p11$1 := (if p10$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p10$2 && v8$2 then v8$2 else p11$2);
    p10$1 := (if p10$1 && !v8$1 then v8$1 else p10$1);
    p10$2 := (if p10$2 && !v8$2 then v8$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$y(p11$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c0.0$1), 32bv32), $n), BV32_SUB($h0, 1bv32)), $$y[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c0.0$1), 32bv32), $n), BV32_SUB($h0, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$y(p11$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c0.0$2), 32bv32), $n), BV32_SUB($h0, 1bv32)), $$y[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c0.0$2), 32bv32), $n), BV32_SUB($h0, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$y"} true;
    v9$1 := (if p11$1 then $$y[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c0.0$1), 32bv32), $n), BV32_SUB($h0, 1bv32))] else v9$1);
    v9$2 := (if p11$2 then $$y[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c0.0$2), 32bv32), $n), BV32_SUB($h0, 1bv32))] else v9$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$kernel8.shared_y_2(p11$1, $c0.0$1, v9$1, $$kernel8.shared_y_2[1bv1][$c0.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2(p11$2, $c0.0$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$kernel8.shared_y_2(p11$2, $c0.0$2, v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel8.shared_y_2"} true;
    $$kernel8.shared_y_2[1bv1][$c0.0$1] := (if p11$1 then v9$1 else $$kernel8.shared_y_2[1bv1][$c0.0$1]);
    $$kernel8.shared_y_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c0.0$2] := (if p11$2 then v9$2 else $$kernel8.shared_y_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c0.0$2]);
    $c0.0$1 := (if p11$1 then BV32_ADD($c0.0$1, 1bv32) else $c0.0$1);
    $c0.0$2 := (if p11$2 then BV32_ADD($c0.0$2, 1bv32) else $c0.0$2);
    p10$1 := (if p11$1 then true else p10$1);
    p10$2 := (if p11$2 then true else p10$2);
    goto $11.backedge, $11.tail;

  $11.tail:
    assume !p10$1 && !p10$2;
    v10$1 := (if p5$1 then v1$1 == 0bv32 else v10$1);
    v10$2 := (if p5$2 then v1$2 == 0bv32 else v10$2);
    p13$1 := (if p5$1 && v10$1 then v10$1 else p13$1);
    p13$2 := (if p5$2 && v10$2 then v10$2 else p13$2);
    $c01.0$1 := (if p13$1 then 0bv32 else $c01.0$1);
    $c01.0$2 := (if p13$2 then 0bv32 else $c01.0$2);
    p14$1 := (if p13$1 then true else p14$1);
    p14$2 := (if p13$2 then true else p14$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $17;

  $17:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p14$1 ==> p4$1;
    assert p14$2 ==> p4$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b27 ==> _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p14$1 ==> _b26 ==> p14$1 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p14$2 ==> _b26 ==> p14$2 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b25 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32), 31bv32) ==> p14$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b25 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32), 31bv32) ==> p14$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b24 ==> v1$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$y;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b23 ==> v1$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> v1$1 != 0bv32 ==> !p14$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b22 ==> v1$2 != 0bv32 ==> !p14$2;
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b21 ==> BV32_UGE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b21 ==> BV32_UGE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b20 ==> BV32_ULE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b20 ==> BV32_ULE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b19 ==> BV32_SGE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b19 ==> BV32_SGE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b18 ==> BV32_SLE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b18 ==> BV32_SLE($c01.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 22} p14$1 ==> true;
    v11$1 := (if p14$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32), 31bv32) else v11$1);
    v11$2 := (if p14$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32), 31bv32) else v11$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p16$1 := (if p14$1 && v11$1 then v11$1 else p16$1);
    p16$2 := (if p14$2 && v11$2 then v11$2 else p16$2);
    p15$1 := (if p14$1 && !v11$1 then !v11$1 else p15$1);
    p15$2 := (if p14$2 && !v11$2 then !v11$2 else p15$2);
    $1$1 := (if p15$1 then 31bv32 else $1$1);
    $1$2 := (if p15$2 then 31bv32 else $1$2);
    $1$1 := (if p16$1 then BV32_SUB(BV32_SUB($n, $g1.0$1), 1bv32) else $1$1);
    $1$2 := (if p16$2 then BV32_SUB(BV32_SUB($n, $g1.0$2), 1bv32) else $1$2);
    v12$1 := (if p14$1 then BV32_SLE($c01.0$1, $1$1) else v12$1);
    v12$2 := (if p14$2 then BV32_SLE($c01.0$2, $1$2) else v12$2);
    p17$1 := (if p14$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p14$2 && v12$2 then v12$2 else p17$2);
    p14$1 := (if p14$1 && !v12$1 then v12$1 else p14$1);
    p14$2 := (if p14$2 && !v12$2 then v12$2 else p14$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$y(p17$1, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $n), BV32_SUB($h0, 1bv32)), $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $n), BV32_SUB($h0, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$y(p17$2, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $n), BV32_SUB($h0, 1bv32)), $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $n), BV32_SUB($h0, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$y"} true;
    v13$1 := (if p17$1 then $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $n), BV32_SUB($h0, 1bv32))] else v13$1);
    v13$2 := (if p17$2 then $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $n), BV32_SUB($h0, 1bv32))] else v13$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$kernel8.shared_y_1(p17$1, $c01.0$1, v13$1, $$kernel8.shared_y_1[1bv1][$c01.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1(p17$2, $c01.0$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$kernel8.shared_y_1(p17$2, $c01.0$2, v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel8.shared_y_1"} true;
    $$kernel8.shared_y_1[1bv1][$c01.0$1] := (if p17$1 then v13$1 else $$kernel8.shared_y_1[1bv1][$c01.0$1]);
    $$kernel8.shared_y_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c01.0$2] := (if p17$2 then v13$2 else $$kernel8.shared_y_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c01.0$2]);
    $c01.0$1 := (if p17$1 then BV32_ADD($c01.0$1, 1bv32) else $c01.0$1);
    $c01.0$2 := (if p17$2 then BV32_ADD($c01.0$2, 1bv32) else $c01.0$2);
    p14$1 := (if p17$1 then true else p14$1);
    p14$2 := (if p17$2 then true else p14$2);
    goto $17.backedge, __partitioned_block_$17.tail_0;

  __partitioned_block_$17.tail_0:
    assume !p14$1 && !p14$2;
    goto __partitioned_block_$17.tail_1;

  __partitioned_block_$17.tail_1:
    call {:sourceloc_num 32} $bugle_barrier_duplicated_0(1bv1, 1bv1, p5$1, p5$2);
    v14$1 := (if p5$1 then BV32_SGE($h0, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v14$1);
    v14$2 := (if p5$2 then BV32_SGE($h0, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v14$2);
    p19$1 := (if p5$1 && v14$1 then v14$1 else p19$1);
    p19$2 := (if p5$2 && v14$2 then v14$2 else p19$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$kernel8.shared_y_1(p19$1, v1$1, $$kernel8.shared_y_1[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$kernel8.shared_y_1(p19$2, v1$2, $$kernel8.shared_y_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel8.shared_y_1"} true;
    v15$1 := (if p19$1 then $$kernel8.shared_y_1[1bv1][v1$1] else v15$1);
    v15$2 := (if p19$2 then $$kernel8.shared_y_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$kernel8.shared_alpha(p19$1, 0bv32, $$kernel8.shared_alpha[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$kernel8.shared_alpha(p19$2, 0bv32, $$kernel8.shared_alpha[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel8.shared_alpha"} true;
    v16$1 := (if p19$1 then $$kernel8.shared_alpha[1bv1][0bv32] else v16$1);
    v16$2 := (if p19$2 then $$kernel8.shared_alpha[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v16$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$kernel8.shared_y_2(p19$1, BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32), $$kernel8.shared_y_2[1bv1][BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$kernel8.shared_y_2(p19$2, BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32), $$kernel8.shared_y_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel8.shared_y_2"} true;
    v17$1 := (if p19$1 then $$kernel8.shared_y_2[1bv1][BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32)] else v17$1);
    v17$2 := (if p19$2 then $$kernel8.shared_y_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32)] else v17$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$kernel8.shared_y_0(p19$1, v1$1, FADD64(FMUL64(v16$1, v17$1), v15$1), $$kernel8.shared_y_0[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0(p19$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$kernel8.shared_y_0(p19$2, v1$2, FADD64(FMUL64(v16$2, v17$2), v15$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel8.shared_y_0"} true;
    $$kernel8.shared_y_0[1bv1][v1$1] := (if p19$1 then FADD64(FMUL64(v16$1, v17$1), v15$1) else $$kernel8.shared_y_0[1bv1][v1$1]);
    $$kernel8.shared_y_0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p19$2 then FADD64(FMUL64(v16$2, v17$2), v15$2) else $$kernel8.shared_y_0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$17.tail_2;

  __partitioned_block_$17.tail_2:
    call {:sourceloc_num 39} $bugle_barrier_duplicated_1(1bv1, 1bv1, p5$1, p5$2);
    v18$1 := (if p5$1 then v1$1 == 0bv32 else v18$1);
    v18$2 := (if p5$2 then v1$2 == 0bv32 else v18$2);
    p21$1 := (if p5$1 && v18$1 then v18$1 else p21$1);
    p21$2 := (if p5$2 && v18$2 then v18$2 else p21$2);
    $c02.0$1 := (if p21$1 then 0bv32 else $c02.0$1);
    $c02.0$2 := (if p21$2 then 0bv32 else $c02.0$2);
    p22$1 := (if p21$1 then true else p22$1);
    p22$2 := (if p21$2 then true else p22$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $28;

  $28:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b79 ==> _WRITE_HAS_OCCURRED_$$y ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $n), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $n), 1bv32), BV32_ADD(BV32_MUL(0bv32, $n), $h0));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_y_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel8.shared_alpha ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p22$1 ==> p4$1;
    assert p22$2 ==> p4$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b17 ==> _READ_HAS_OCCURRED_$$kernel8.shared_y_0 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p22$1 ==> _b16 ==> p22$1 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p22$2 ==> _b16 ==> p22$2 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT($g1.0$1, $h0) && local_id_x$1 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($h0, $g1.0$1), 1bv32), 31bv32) ==> p22$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT($g1.0$2, $h0) && local_id_x$2 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($h0, $g1.0$2), 1bv32), 31bv32) ==> p22$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b14 ==> v1$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_0;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b13 ==> v1$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$y;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b12 ==> v1$1 != 0bv32 ==> !p22$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b12 ==> v1$2 != 0bv32 ==> !p22$2;
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b11 ==> BV32_UGE($c02.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b11 ==> BV32_UGE($c02.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b10 ==> BV32_ULE($c02.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b10 ==> BV32_ULE($c02.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b9 ==> BV32_SGE($c02.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b9 ==> BV32_SGE($c02.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b8 ==> BV32_SLE($c02.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b8 ==> BV32_SLE($c02.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 41} p22$1 ==> true;
    v19$1 := (if p22$1 then BV32_SLT(BV32_SUB(BV32_SUB($h0, $g1.0$1), 1bv32), 31bv32) else v19$1);
    v19$2 := (if p22$2 then BV32_SLT(BV32_SUB(BV32_SUB($h0, $g1.0$2), 1bv32), 31bv32) else v19$2);
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p24$1 := (if p22$1 && v19$1 then v19$1 else p24$1);
    p24$2 := (if p22$2 && v19$2 then v19$2 else p24$2);
    p23$1 := (if p22$1 && !v19$1 then !v19$1 else p23$1);
    p23$2 := (if p22$2 && !v19$2 then !v19$2 else p23$2);
    $2$1 := (if p23$1 then 31bv32 else $2$1);
    $2$2 := (if p23$2 then 31bv32 else $2$2);
    $2$1 := (if p24$1 then BV32_SUB(BV32_SUB($h0, $g1.0$1), 1bv32) else $2$1);
    $2$2 := (if p24$2 then BV32_SUB(BV32_SUB($h0, $g1.0$2), 1bv32) else $2$2);
    v20$1 := (if p22$1 then BV32_SLE($c02.0$1, $2$1) else v20$1);
    v20$2 := (if p22$2 then BV32_SLE($c02.0$2, $2$2) else v20$2);
    p25$1 := (if p22$1 && v20$1 then v20$1 else p25$1);
    p25$2 := (if p22$2 && v20$2 then v20$2 else p25$2);
    p22$1 := (if p22$1 && !v20$1 then v20$1 else p22$1);
    p22$2 := (if p22$2 && !v20$2 then v20$2 else p22$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$kernel8.shared_y_0(p25$1, $c02.0$1, $$kernel8.shared_y_0[1bv1][$c02.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$kernel8.shared_y_0(p25$2, $c02.0$2, $$kernel8.shared_y_0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c02.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel8.shared_y_0"} true;
    v21$1 := (if p25$1 then $$kernel8.shared_y_0[1bv1][$c02.0$1] else v21$1);
    v21$2 := (if p25$2 then $$kernel8.shared_y_0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c02.0$2] else v21$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$y(p25$1, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c02.0$1), $n), $h0), v21$1, $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c02.0$1), $n), $h0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$y(p25$2, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c02.0$2), $n), $h0));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$y(p25$2, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c02.0$2), $n), $h0), v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$y"} true;
    $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c02.0$1), $n), $h0)] := (if p25$1 then v21$1 else $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c02.0$1), $n), $h0)]);
    $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c02.0$2), $n), $h0)] := (if p25$2 then v21$2 else $$y[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c02.0$2), $n), $h0)]);
    $c02.0$1 := (if p25$1 then BV32_ADD($c02.0$1, 1bv32) else $c02.0$1);
    $c02.0$2 := (if p25$2 then BV32_ADD($c02.0$2, 1bv32) else $c02.0$2);
    p22$1 := (if p25$1 then true else p22$1);
    p22$2 := (if p25$2 then true else p22$2);
    goto $28.backedge, __partitioned_block_$28.tail_0;

  __partitioned_block_$28.tail_0:
    assume !p22$1 && !p22$2;
    goto __partitioned_block_$28.tail_1;

  __partitioned_block_$28.tail_1:
    call {:sourceloc_num 51} $bugle_barrier_duplicated_2(1bv1, 1bv1, p5$1, p5$2);
    $g1.0$1 := (if p5$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p5$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    return;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $28.backedge:
    assume {:backedge} p22$1 || p22$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $28;

  $17.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $17;

  $11.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $11;
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
  modifies $$kernel8.shared_alpha, $$kernel8.shared_y_2, $$kernel8.shared_y_1, $$kernel8.shared_y_0, $$y, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel8.shared_alpha, $$kernel8.shared_y_2, $$kernel8.shared_y_1, $$kernel8.shared_y_0, $$y, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel8.shared_alpha, $$kernel8.shared_y_2, $$kernel8.shared_y_1, $$kernel8.shared_y_0, $$y, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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

const {:existential true} _b23: bool;

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

const _WATCHED_VALUE_$$alpha: bv64;

procedure {:inline 1} _LOG_READ_$$alpha(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$alpha;



implementation {:inline 1} _LOG_READ_$$alpha(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$alpha := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$alpha == _value then true else _READ_HAS_OCCURRED_$$alpha);
    return;
}



procedure _CHECK_READ_$$alpha(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$alpha);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$alpha: bool;

procedure {:inline 1} _LOG_WRITE_$$alpha(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$alpha, _WRITE_READ_BENIGN_FLAG_$$alpha;



implementation {:inline 1} _LOG_WRITE_$$alpha(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$alpha := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$alpha == _value then true else _WRITE_HAS_OCCURRED_$$alpha);
    _WRITE_READ_BENIGN_FLAG_$$alpha := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$alpha == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$alpha);
    return;
}



procedure _CHECK_WRITE_$$alpha(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$alpha != _value);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$alpha != _value);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$alpha(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$alpha;



implementation {:inline 1} _LOG_ATOMIC_$$alpha(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$alpha := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$alpha);
    return;
}



procedure _CHECK_ATOMIC_$$alpha(_P: bool, _offset: bv32);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset);
  requires {:source_name "alpha"} {:array "$$alpha"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$alpha(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$alpha;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$alpha(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$alpha := (if _P && _WRITE_HAS_OCCURRED_$$alpha && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$alpha);
    return;
}



const _WATCHED_VALUE_$$y: bv64;

procedure {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$y;



implementation {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _READ_HAS_OCCURRED_$$y);
    return;
}



procedure _CHECK_READ_$$y(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$y);
  requires {:source_name "y"} {:array "$$y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$y: bool;

procedure {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$y, _WRITE_READ_BENIGN_FLAG_$$y;



implementation {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _WRITE_HAS_OCCURRED_$$y);
    _WRITE_READ_BENIGN_FLAG_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$y);
    return;
}



procedure _CHECK_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64);
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



const _WATCHED_VALUE_$$kernel8.shared_alpha: bv64;

procedure {:inline 1} _LOG_READ_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel8.shared_alpha;



implementation {:inline 1} _LOG_READ_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel8.shared_alpha := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_alpha == _value then true else _READ_HAS_OCCURRED_$$kernel8.shared_alpha);
    return;
}



procedure _CHECK_READ_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha;



implementation {:inline 1} _LOG_WRITE_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_alpha == _value then true else _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha);
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_alpha == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha);
    return;
}



procedure _CHECK_WRITE_$$kernel8.shared_alpha(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_alpha != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_alpha != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel8.shared_alpha(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha;



implementation {:inline 1} _LOG_ATOMIC_$$kernel8.shared_alpha(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha);
    return;
}



procedure _CHECK_ATOMIC_$$kernel8.shared_alpha(_P: bool, _offset: bv32);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_alpha"} {:array "$$kernel8.shared_alpha"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha := (if _P && _WRITE_HAS_OCCURRED_$$kernel8.shared_alpha && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_alpha);
    return;
}



const _WATCHED_VALUE_$$kernel8.shared_y_2: bv64;

procedure {:inline 1} _LOG_READ_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel8.shared_y_2;



implementation {:inline 1} _LOG_READ_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel8.shared_y_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_2 == _value then true else _READ_HAS_OCCURRED_$$kernel8.shared_y_2);
    return;
}



procedure _CHECK_READ_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2;



implementation {:inline 1} _LOG_WRITE_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_2 == _value then true else _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2);
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2);
    return;
}



procedure _CHECK_WRITE_$$kernel8.shared_y_2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2;



implementation {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2);
    return;
}



procedure _CHECK_ATOMIC_$$kernel8.shared_y_2(_P: bool, _offset: bv32);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_2"} {:array "$$kernel8.shared_y_2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2 := (if _P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_2);
    return;
}



const _WATCHED_VALUE_$$kernel8.shared_y_1: bv64;

procedure {:inline 1} _LOG_READ_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel8.shared_y_1;



implementation {:inline 1} _LOG_READ_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel8.shared_y_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_1 == _value then true else _READ_HAS_OCCURRED_$$kernel8.shared_y_1);
    return;
}



procedure _CHECK_READ_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1;



implementation {:inline 1} _LOG_WRITE_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_1 == _value then true else _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1);
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1);
    return;
}



procedure _CHECK_WRITE_$$kernel8.shared_y_1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1;



implementation {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1);
    return;
}



procedure _CHECK_ATOMIC_$$kernel8.shared_y_1(_P: bool, _offset: bv32);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_1"} {:array "$$kernel8.shared_y_1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1 := (if _P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_1);
    return;
}



const _WATCHED_VALUE_$$kernel8.shared_y_0: bv64;

procedure {:inline 1} _LOG_READ_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel8.shared_y_0;



implementation {:inline 1} _LOG_READ_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel8.shared_y_0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_0 == _value then true else _READ_HAS_OCCURRED_$$kernel8.shared_y_0);
    return;
}



procedure _CHECK_READ_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0, _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0;



implementation {:inline 1} _LOG_WRITE_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_0 == _value then true else _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0);
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0);
    return;
}



procedure _CHECK_WRITE_$$kernel8.shared_y_0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_0 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel8.shared_y_0 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0;



implementation {:inline 1} _LOG_ATOMIC_$$kernel8.shared_y_0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0);
    return;
}



procedure _CHECK_ATOMIC_$$kernel8.shared_y_0(_P: bool, _offset: bv32);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y_0"} {:array "$$kernel8.shared_y_0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0 := (if _P && _WRITE_HAS_OCCURRED_$$kernel8.shared_y_0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel8.shared_y_0);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1;
    goto anon3;

  anon3:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0;
    goto anon4;

  anon4:
    goto anon14_Then, anon14_Else;

  anon14_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$y;
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
    havoc $$y;
    goto anon12;

  anon14_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel8.shared_alpha;
    goto anon6;

  anon6:
    havoc $$kernel8.shared_y_2;
    goto anon7;

  anon7:
    havoc $$kernel8.shared_y_1;
    goto anon8;

  anon8:
    havoc $$kernel8.shared_y_0;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1;
    goto anon3;

  anon3:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0;
    goto anon4;

  anon4:
    goto anon14_Then, anon14_Else;

  anon14_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$y;
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
    havoc $$y;
    goto anon12;

  anon14_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel8.shared_alpha;
    goto anon6;

  anon6:
    havoc $$kernel8.shared_y_2;
    goto anon7;

  anon7:
    havoc $$kernel8.shared_y_1;
    goto anon8;

  anon8:
    havoc $$kernel8.shared_y_0;
    goto anon9;

  anon13_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_alpha;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_alpha;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_2;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_1;
    goto anon3;

  anon3:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel8.shared_y_0;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel8.shared_y_0;
    goto anon4;

  anon4:
    goto anon14_Then, anon14_Else;

  anon14_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$y;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$y;
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
    havoc $$y;
    goto anon12;

  anon14_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel8.shared_alpha;
    goto anon6;

  anon6:
    havoc $$kernel8.shared_y_2;
    goto anon7;

  anon7:
    havoc $$kernel8.shared_y_1;
    goto anon8;

  anon8:
    havoc $$kernel8.shared_y_0;
    goto anon9;

  anon13_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



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

const {:existential true} _b67: bool;

const {:existential true} _b68: bool;

const {:existential true} _b69: bool;

const {:existential true} _b70: bool;

const {:existential true} _b71: bool;

const {:existential true} _b72: bool;

const {:existential true} _b73: bool;

const {:existential true} _b74: bool;

const {:existential true} _b75: bool;

const {:existential true} _b76: bool;

const {:existential true} _b77: bool;

const {:existential true} _b78: bool;

const {:existential true} _b79: bool;
