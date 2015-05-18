type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "infront"} $$infront$1: [bv32]bv32;

var {:source_name "infront"} $$infront$2: [bv32]bv32;

axiom {:array_info "$$infront"} {:elem_width 32} {:source_name "infront"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "behind"} $$behind$1: [bv32]bv32;

var {:source_name "behind"} $$behind$2: [bv32]bv32;

axiom {:array_info "$$behind"} {:elem_width 32} {:source_name "behind"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "tile"} {:group_shared} $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:group_shared} {:elem_width 32} {:source_name "tile"} {:source_elem_width 32} {:source_dimensions "24,40"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,40"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,40"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,40"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: bool;

var {:source_name "stencil"} {:constant} $$stencil$1: [bv32]bv32;

var {:source_name "stencil"} {:constant} $$stencil$2: [bv32]bv32;

axiom {:array_info "$$stencil"} {:constant} {:elem_width 32} {:source_name "stencil"} {:source_elem_width 32} {:source_dimensions "5"} true;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "FiniteDifferencesKernel"} {:kernel} $_Z23FiniteDifferencesKernelPfPKfiii($dimx: bv32, $dimy: bv32, $dimz: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dimx == 96bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dimy == 96bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $dimz == 96bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && !_WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && !_ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
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
  modifies $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, $$output, _TRACKING, _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, _TRACKING, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;



implementation {:source_name "FiniteDifferencesKernel"} {:kernel} $_Z23FiniteDifferencesKernelPfPKfiii($dimx: bv32, $dimy: bv32, $dimz: bv32)
{
  var $validr.0$1: bv8;
  var $validr.0$2: bv8;
  var $validw.0$1: bv8;
  var $validw.0$2: bv8;
  var $inputIndex.0$1: bv32;
  var $inputIndex.0$2: bv32;
  var $i.0: bv32;
  var $current.0$1: bv32;
  var $current.0$2: bv32;
  var $inputIndex.1$1: bv32;
  var $inputIndex.1$2: bv32;
  var $i1.0: bv32;
  var $inputIndex.2$1: bv32;
  var $inputIndex.2$2: bv32;
  var $outputIndex.0$1: bv32;
  var $outputIndex.0$2: bv32;
  var $current.1$1: bv32;
  var $current.1$2: bv32;
  var $iz.0: bv32;
  var $i2.0: bv32;
  var $i3.0: bv32;
  var $value.0$1: bv32;
  var $value.0$2: bv32;
  var $i4.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
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
  var v10: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15: bool;
  var v16: bool;
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
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30: bool;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2 := BV32_ADD($dimx, 8bv32);
    v3 := BV32_MUL(v2, BV32_ADD($dimy, 8bv32));
    v4$1 := BV32_ADD(local_id_x$1, 4bv32);
    v4$2 := BV32_ADD(local_id_x$2, 4bv32);
    v5$1 := BV32_ADD(local_id_y$1, 4bv32);
    v5$2 := BV32_ADD(local_id_y$2, 4bv32);
    v6$1 := BV32_SGE(v0$1, BV32_ADD($dimx, 4bv32));
    v6$2 := BV32_SGE(v0$2, BV32_ADD($dimx, 4bv32));
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
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p3$1 := (if v6$1 then v6$1 else p3$1);
    p3$2 := (if v6$2 then v6$2 else p3$2);
    p1$1 := (if !v6$1 then !v6$1 else p1$1);
    p1$2 := (if !v6$2 then !v6$2 else p1$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    v7$1 := (if p1$1 then BV32_SGE(v1$1, BV32_ADD($dimy, 4bv32)) else v7$1);
    v7$2 := (if p1$2 then BV32_SGE(v1$2, BV32_ADD($dimy, 4bv32)) else v7$2);
    p3$1 := (if p1$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p1$2 && v7$2 then v7$2 else p3$2);
    p4$1 := (if p1$1 && !v7$1 then !v7$1 else p4$1);
    p4$2 := (if p1$2 && !v7$2 then !v7$2 else p4$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    $validr.0$1 := (if p3$1 then 0bv8 else $validr.0$1);
    $validr.0$2 := (if p3$2 then 0bv8 else $validr.0$2);
    $validr.0$1 := (if p4$1 then 1bv8 else $validr.0$1);
    $validr.0$2 := (if p4$2 then 1bv8 else $validr.0$2);
    v8$1 := BV32_SGE(v0$1, $dimx);
    v8$2 := BV32_SGE(v0$2, $dimx);
    p8$1 := (if v8$1 then v8$1 else p8$1);
    p8$2 := (if v8$2 then v8$2 else p8$2);
    p6$1 := (if !v8$1 then !v8$1 else p6$1);
    p6$2 := (if !v8$2 then !v8$2 else p6$2);
    p8$1 := (if p5$1 then true else p8$1);
    p8$2 := (if p5$2 then true else p8$2);
    v9$1 := (if p6$1 then BV32_SGE(v1$1, $dimy) else v9$1);
    v9$2 := (if p6$2 then BV32_SGE(v1$2, $dimy) else v9$2);
    p8$1 := (if p6$1 && v9$1 then v9$1 else p8$1);
    p8$2 := (if p6$2 && v9$2 then v9$2 else p8$2);
    p9$1 := (if p6$1 && !v9$1 then !v9$1 else p9$1);
    p9$2 := (if p6$2 && !v9$2 then !v9$2 else p9$2);
    p8$1 := (if p7$1 then true else p8$1);
    p8$2 := (if p7$2 then true else p8$2);
    $validw.0$1 := (if p8$1 then 0bv8 else $validw.0$1);
    $validw.0$2 := (if p8$2 then 0bv8 else $validw.0$2);
    $validw.0$1 := (if p9$1 then 1bv8 else $validw.0$1);
    $validw.0$2 := (if p9$2 then 1bv8 else $validw.0$2);
    $inputIndex.0$1, $i.0 := BV32_ADD(BV32_ADD(BV32_MUL(4bv32, v2), 4bv32), BV32_ADD(BV32_MUL(v1$1, v2), v0$1)), 2bv32;
    $inputIndex.0$2 := BV32_ADD(BV32_ADD(BV32_MUL(4bv32, v2), 4bv32), BV32_ADD(BV32_MUL(v1$2, v2), v0$2));
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_5"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v10 := BV32_SGE($i.0, 0bv32);
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v10 && !v10;
    p12$1 := (if $validr.0$1[1:0] == 1bv1 then $validr.0$1[1:0] == 1bv1 else p12$1);
    p12$2 := (if $validr.0$2[1:0] == 1bv1 then $validr.0$2[1:0] == 1bv1 else p12$2);
    p13$1 := (if !($validr.0$1[1:0] == 1bv1) then !($validr.0$1[1:0] == 1bv1) else p13$1);
    p13$2 := (if !($validr.0$2[1:0] == 1bv1) then !($validr.0$2[1:0] == 1bv1) else p13$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p12$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p12$2 then _HAVOC_bv32$2 else v12$2);
    $current.0$1 := (if p12$1 then v12$1 else $current.0$1);
    $current.0$2 := (if p12$2 then v12$2 else $current.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v38$1 := (if p13$1 then _HAVOC_bv32$1 else v38$1);
    v38$2 := (if p13$2 then _HAVOC_bv32$2 else v38$2);
    $current.0$1 := (if p13$1 then v38$1 else $current.0$1);
    $current.0$2 := (if p13$2 then v38$2 else $current.0$2);
    $inputIndex.1$1, $i1.0 := BV32_ADD($inputIndex.0$1, v3), 0bv32;
    $inputIndex.1$2 := BV32_ADD($inputIndex.0$2, v3);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_4"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v13 := BV32_SLT($i1.0, 4bv32);
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    goto $truebb6, $falsebb6;

  $falsebb6:
    assume {:partition} !v13 && !v13;
    $inputIndex.2$1, $outputIndex.0$1, $current.1$1, $iz.0 := $inputIndex.1$1, $inputIndex.0$1, $current.0$1, 0bv32;
    $inputIndex.2$2, $outputIndex.0$2, $current.1$2 := $inputIndex.1$2, $inputIndex.0$2, $current.0$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b14 ==> _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 40bv32), BV32_ADD(local_id_x$1, 4bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$1, group_size_y), 4bv32), 40bv32), BV32_ADD(local_id_x$1, 4bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, 4bv32), 40bv32), local_id_x$1) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, 4bv32), 40bv32), BV32_ADD(BV32_ADD(local_id_x$1, group_size_x), 4bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, 4bv32), 40bv32), BV32_ADD(local_id_x$1, 4bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 40bv32), BV32_ADD(local_id_x$1, 4bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(local_id_y$1, 4bv32)), 40bv32), BV32_ADD(local_id_x$1, 4bv32)));
    assert {:tag "nowrite"} _b12 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assert {:tag "noread"} _b11 ==> !_READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assert {:tag "nowrite"} _b10 ==> !_WRITE_HAS_OCCURRED_$$output;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($iz.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($iz.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $iz.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $iz.0);
    assert {:block_sourceloc} {:sourceloc_num 29} true;
    v15 := BV32_SLT($iz.0, $dimz);
    goto $truebb8, $falsebb8;

  $falsebb8:
    assume {:partition} !v15 && !v15;
    return;

  $truebb8:
    assume {:partition} v15 && v15;
    $i2.0 := 3bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_3"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 31} true;
    v16 := BV32_SGT($i2.0, 0bv32);
    goto $truebb9, $falsebb9;

  $falsebb9:
    assume {:partition} !v16 && !v16;
    $$behind$1[0bv32] := $current.1$1;
    $$behind$2[0bv32] := $current.1$2;
    v18$1 := $$infront$1[0bv32];
    v18$2 := $$infront$2[0bv32];
    $i3.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $27;

  $27:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 39} true;
    v19 := BV32_SLT($i3.0, 3bv32);
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
    p21$1 := false;
    p21$2 := false;
    goto $truebb10, __partitioned_block_$falsebb10_0;

  __partitioned_block_$falsebb10_0:
    assume {:partition} !v19 && !v19;
    p17$1 := (if $validr.0$1[1:0] == 1bv1 then $validr.0$1[1:0] == 1bv1 else p17$1);
    p17$2 := (if $validr.0$2[1:0] == 1bv1 then $validr.0$2[1:0] == 1bv1 else p17$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v21$1 := (if p17$1 then _HAVOC_bv32$1 else v21$1);
    v21$2 := (if p17$2 then _HAVOC_bv32$2 else v21$2);
    $$infront$1[3bv32] := (if p17$1 then v21$1 else $$infront$1[3bv32]);
    $$infront$2[3bv32] := (if p17$2 then v21$2 else $$infront$2[3bv32]);
    v22$1 := BV32_ADD($outputIndex.0$1, v3);
    v22$2 := BV32_ADD($outputIndex.0$2, v3);
    goto __partitioned_block_$falsebb10_1;

  __partitioned_block_$falsebb10_1:
    call {:sourceloc_num 49} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v23$1 := BV32_SLT(local_id_y$1, 4bv32);
    v23$2 := BV32_SLT(local_id_y$2, 4bv32);
    p19$1 := (if v23$1 then v23$1 else p19$1);
    p19$2 := (if v23$2 then v23$2 else p19$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v24$1 := (if p19$1 then _HAVOC_bv32$1 else v24$1);
    v24$2 := (if p19$2 then _HAVOC_bv32$2 else v24$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$1, BV32_ADD(BV32_MUL(local_id_y$1, 40bv32), v4$1), v24$1, $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 40bv32), v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$2, BV32_ADD(BV32_MUL(local_id_y$2, 40bv32), v4$2));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$2, BV32_ADD(BV32_MUL(local_id_y$2, 40bv32), v4$2), v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 40bv32), v4$1)] := (if p19$1 then v24$1 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 40bv32), v4$1)]);
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 40bv32), v4$2)] := (if p19$2 then v24$2 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 40bv32), v4$2)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v25$1 := (if p19$1 then _HAVOC_bv32$1 else v25$1);
    v25$2 := (if p19$2 then _HAVOC_bv32$2 else v25$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$1, group_size_y), 4bv32), 40bv32), v4$1), v25$1, $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$1, group_size_y), 4bv32), 40bv32), v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$2, group_size_y), 4bv32), 40bv32), v4$2));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p19$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$2, group_size_y), 4bv32), 40bv32), v4$2), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$1, group_size_y), 4bv32), 40bv32), v4$1)] := (if p19$1 then v25$1 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$1, group_size_y), 4bv32), 40bv32), v4$1)]);
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$2, group_size_y), 4bv32), 40bv32), v4$2)] := (if p19$2 then v25$2 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(local_id_y$2, group_size_y), 4bv32), 40bv32), v4$2)]);
    v26$1 := BV32_SLT(local_id_x$1, 4bv32);
    v26$2 := BV32_SLT(local_id_x$2, 4bv32);
    p21$1 := (if v26$1 then v26$1 else p21$1);
    p21$2 := (if v26$2 then v26$2 else p21$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v27$1 := (if p21$1 then _HAVOC_bv32$1 else v27$1);
    v27$2 := (if p21$2 then _HAVOC_bv32$2 else v27$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$1, BV32_ADD(BV32_MUL(v5$1, 40bv32), local_id_x$1), v27$1, $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$2, BV32_ADD(BV32_MUL(v5$2, 40bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$2, BV32_ADD(BV32_MUL(v5$2, 40bv32), local_id_x$2), v27$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), local_id_x$1)] := (if p21$1 then v27$1 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), local_id_x$1)]);
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), local_id_x$2)] := (if p21$2 then v27$2 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), local_id_x$2)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v28$1 := (if p21$1 then _HAVOC_bv32$1 else v28$1);
    v28$2 := (if p21$2 then _HAVOC_bv32$2 else v28$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$1, BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(BV32_ADD(local_id_x$1, group_size_x), 4bv32)), v28$1, $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(BV32_ADD(local_id_x$1, group_size_x), 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$2, BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(BV32_ADD(local_id_x$2, group_size_x), 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(p21$2, BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(BV32_ADD(local_id_x$2, group_size_x), 4bv32)), v28$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(BV32_ADD(local_id_x$1, group_size_x), 4bv32))] := (if p21$1 then v28$1 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(BV32_ADD(local_id_x$1, group_size_x), 4bv32))]);
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(BV32_ADD(local_id_x$2, group_size_x), 4bv32))] := (if p21$2 then v28$2 else $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(BV32_ADD(local_id_x$2, group_size_x), 4bv32))]);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$1, 40bv32), v4$1), v18$1, $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$2, 40bv32), v4$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$2, 40bv32), v4$2), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), v4$1)] := v18$1;
    $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), v4$2)] := v18$2;
    goto __partitioned_block_$falsebb10_2;

  __partitioned_block_$falsebb10_2:
    call {:sourceloc_num 63} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v29$1 := $$stencil$1[0bv32];
    v29$2 := $$stencil$2[0bv32];
    $value.0$1, $i4.0 := FMUL32(v29$1, v18$1), 1bv32;
    $value.0$2 := FMUL32(v29$2, v18$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $37;

  $37:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b15 ==> _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 40bv32), BV32_ADD(local_id_x$1, 4bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 40bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(local_id_y$1, 4bv32)), 40bv32), BV32_ADD(local_id_x$1, 4bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($i4.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($i4.0, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $i4.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $i4.0);
    assert {:block_sourceloc} {:sourceloc_num 65} true;
    v30 := BV32_SLE($i4.0, 4bv32);
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    goto $truebb14, $falsebb14;

  $falsebb14:
    assume {:partition} !v30 && !v30;
    p23$1 := (if $validw.0$1[1:0] == 1bv1 then $validw.0$1[1:0] == 1bv1 else p23$1);
    p23$2 := (if $validw.0$2[1:0] == 1bv1 then $validw.0$2[1:0] == 1bv1 else p23$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_WRITE_$$output(p23$1, v22$1, $value.0$1, $$output[v22$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p23$2, v22$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 77} _CHECK_WRITE_$$output(p23$2, v22$2, $value.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[v22$1] := (if p23$1 then $value.0$1 else $$output[v22$1]);
    $$output[v22$2] := (if p23$2 then $value.0$2 else $$output[v22$2]);
    $inputIndex.2$1, $outputIndex.0$1, $current.1$1, $iz.0 := BV32_ADD($inputIndex.2$1, v3), v22$1, v18$1, BV32_ADD($iz.0, 1bv32);
    $inputIndex.2$2, $outputIndex.0$2, $current.1$2 := BV32_ADD($inputIndex.2$2, v3), v22$2, v18$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $21;

  $truebb14:
    assume {:partition} v30 && v30;
    v31$1 := $$stencil$1[$i4.0];
    v31$2 := $$stencil$2[$i4.0];
    v32$1 := $$infront$1[BV32_SUB($i4.0, 1bv32)];
    v32$2 := $$infront$2[BV32_SUB($i4.0, 1bv32)];
    v33$1 := $$behind$1[BV32_SUB($i4.0, 1bv32)];
    v33$2 := $$behind$2[BV32_SUB($i4.0, 1bv32)];
    call {:sourceloc} {:sourceloc_num 70} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(BV32_SUB(v5$1, $i4.0), 40bv32), v4$1), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_SUB(v5$1, $i4.0), 40bv32), v4$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 70} _CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(BV32_SUB(v5$2, $i4.0), 40bv32), v4$2), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_SUB(v5$2, $i4.0), 40bv32), v4$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    v34$1 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_SUB(v5$1, $i4.0), 40bv32), v4$1)];
    v34$2 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_SUB(v5$2, $i4.0), 40bv32), v4$2)];
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(BV32_ADD(v5$1, $i4.0), 40bv32), v4$1), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v5$1, $i4.0), 40bv32), v4$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(BV32_ADD(v5$2, $i4.0), 40bv32), v4$2), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v5$2, $i4.0), 40bv32), v4$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    v35$1 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v5$1, $i4.0), 40bv32), v4$1)];
    v35$2 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v5$2, $i4.0), 40bv32), v4$2)];
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_SUB(v4$1, $i4.0)), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_SUB(v4$1, $i4.0))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_SUB(v4$2, $i4.0)), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_SUB(v4$2, $i4.0))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    v36$1 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_SUB(v4$1, $i4.0))];
    v36$2 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_SUB(v4$2, $i4.0))];
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(v4$1, $i4.0)), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(v4$1, $i4.0))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(true, BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(v4$2, $i4.0)), $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(v4$2, $i4.0))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} true;
    v37$1 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[1bv1][BV32_ADD(BV32_MUL(v5$1, 40bv32), BV32_ADD(v4$1, $i4.0))];
    v37$2 := $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 40bv32), BV32_ADD(v4$2, $i4.0))];
    $value.0$1, $i4.0 := FADD32($value.0$1, FMUL32(v31$1, FADD32(FADD32(FADD32(FADD32(FADD32(v32$1, v33$1), v34$1), v35$1), v36$1), v37$1))), BV32_ADD($i4.0, 1bv32);
    $value.0$2 := FADD32($value.0$2, FMUL32(v31$2, FADD32(FADD32(FADD32(FADD32(FADD32(v32$2, v33$2), v34$2), v35$2), v36$2), v37$2)));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $37;

  $truebb10:
    assume {:partition} v19 && v19;
    v20$1 := $$infront$1[BV32_ADD($i3.0, 1bv32)];
    v20$2 := $$infront$2[BV32_ADD($i3.0, 1bv32)];
    $$infront$1[$i3.0] := v20$1;
    $$infront$2[$i3.0] := v20$2;
    $i3.0 := BV32_ADD($i3.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $27;

  $truebb9:
    assume {:partition} v16 && v16;
    v17$1 := $$behind$1[BV32_SUB($i2.0, 1bv32)];
    v17$2 := $$behind$2[BV32_SUB($i2.0, 1bv32)];
    $$behind$1[$i2.0] := v17$1;
    $$behind$2[$i2.0] := v17$2;
    $i2.0 := BV32_ADD($i2.0, 4294967295bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $23;

  $truebb6:
    assume {:partition} v13 && v13;
    p15$1 := (if $validr.0$1[1:0] == 1bv1 then $validr.0$1[1:0] == 1bv1 else p15$1);
    p15$2 := (if $validr.0$2[1:0] == 1bv1 then $validr.0$2[1:0] == 1bv1 else p15$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v14$1 := (if p15$1 then _HAVOC_bv32$1 else v14$1);
    v14$2 := (if p15$2 then _HAVOC_bv32$2 else v14$2);
    $$infront$1[$i1.0] := (if p15$1 then v14$1 else $$infront$1[$i1.0]);
    $$infront$2[$i1.0] := (if p15$2 then v14$2 else $$infront$2[$i1.0]);
    $inputIndex.1$1, $i1.0 := BV32_ADD($inputIndex.1$1, v3), BV32_ADD($i1.0, 1bv32);
    $inputIndex.1$2 := BV32_ADD($inputIndex.1$2, v3);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $15;

  $truebb3:
    assume {:partition} v10 && v10;
    p11$1 := (if $validr.0$1[1:0] == 1bv1 then $validr.0$1[1:0] == 1bv1 else p11$1);
    p11$2 := (if $validr.0$2[1:0] == 1bv1 then $validr.0$2[1:0] == 1bv1 else p11$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p11$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p11$2 then _HAVOC_bv32$2 else v11$2);
    $$behind$1[$i.0] := (if p11$1 then v11$1 else $$behind$1[$i.0]);
    $$behind$2[$i.0] := (if p11$2 then v11$2 else $$behind$2[$i.0]);
    $inputIndex.0$1, $i.0 := BV32_ADD($inputIndex.0$1, v3), BV32_ADD($i.0, 4294967295bv32);
    $inputIndex.0$2 := BV32_ADD($inputIndex.0$2, v3);
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $7;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 12bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 24bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, $$output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, $$output, _TRACKING;



const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

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

const _WATCHED_VALUE_$$output: bv32;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



const _WATCHED_VALUE_$$input: bv32;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;



implementation {:inline 1} _LOG_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile == _value then true else _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile);
    return;
}



procedure _CHECK_READ_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;



implementation {:inline 1} _LOG_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile);
    return;
}



procedure _CHECK_WRITE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ23FiniteDifferencesKernelPfPKfiiiE4tile;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;
