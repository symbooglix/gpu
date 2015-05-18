type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



procedure _ATOMIC_OP32(_P$1: bool, x$1: [bv32]bv32, y$1: bv32, _P$2: bool, x$2: [bv32]bv32, y$2: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "histograms"} {:global} $$histograms: [bv32]bv64;

axiom {:array_info "$$histograms"} {:global} {:elem_width 64} {:source_name "histograms"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$histograms: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$histograms: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$histograms: bool;

var {:source_name "all_x_data"} {:global} $$all_x_data: [bv32]bv32;

axiom {:array_info "$$all_x_data"} {:global} {:elem_width 32} {:source_name "all_x_data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$all_x_data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$all_x_data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$all_x_data: bool;

var {:source_name "dev_binb"} {:constant} $$dev_binb$1: [bv32]bv32;

var {:source_name "dev_binb"} {:constant} $$dev_binb$2: [bv32]bv32;

axiom {:array_info "$$dev_binb"} {:constant} {:elem_width 32} {:source_name "dev_binb"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "warp_hists"} {:group_shared} $$gen_hists.warp_hists: [bv1][bv32]bv32;

axiom {:array_info "$$gen_hists.warp_hists"} {:group_shared} {:elem_width 32} {:source_name "warp_hists"} {:source_elem_width 32} {:source_dimensions "20,128"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,128"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,128"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,128"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists: bool;

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

function FEQ32(bv32, bv32) : bool;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

function {:bvbuiltin "zero_extend 32"} BV32_ZEXT64(bv32) : bv64;

procedure {:source_name "gen_hists"} {:kernel} $gen_hists($NUM_SETS: bv32, $NUM_ELEMENTS: bv32);
  requires !_READ_HAS_OCCURRED_$$histograms && !_WRITE_HAS_OCCURRED_$$histograms && !_ATOMIC_HAS_OCCURRED_$$histograms;
  requires !_READ_HAS_OCCURRED_$$all_x_data && !_WRITE_HAS_OCCURRED_$$all_x_data && !_ATOMIC_HAS_OCCURRED_$$all_x_data;
  requires !_READ_HAS_OCCURRED_$$gen_hists.warp_hists && !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists && !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
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
  modifies $$gen_hists.warp_hists, _USED_$$gen_hists.warp_hists, $$histograms, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$gen_hists.warp_hists, _WRITE_HAS_OCCURRED_$$histograms, _WRITE_READ_BENIGN_FLAG_$$histograms, _WRITE_READ_BENIGN_FLAG_$$histograms, _TRACKING, _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists, _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists, _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists, _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;



implementation {:source_name "gen_hists"} {:kernel} $gen_hists($NUM_SETS: bv32, $NUM_ELEMENTS: bv32)
{
  var $w.0: bv32;
  var $random_y.0$1: bv32;
  var $random_y.0$2: bv32;
  var $random_x.0$1: bv32;
  var $random_x.0$2: bv32;
  var $data_z.0$1: bv32;
  var $data_z.0$2: bv32;
  var $data_y.0$1: bv32;
  var $data_y.0$2: bv32;
  var $data_x.0$1: bv32;
  var $data_x.0$2: bv32;
  var $random_z.0$1: bv32;
  var $random_z.0$2: bv32;
  var $j.0: bv32;
  var $random_x_s.0$1: bv32;
  var $random_x_s.0$2: bv32;
  var $random_y_s.0$1: bv32;
  var $random_y_s.0$2: bv32;
  var $random_z_s.0$1: bv32;
  var $random_z_s.0$2: bv32;
  var $random_x_s.1$1: bv32;
  var $random_x_s.1$2: bv32;
  var $random_y_s.1$1: bv32;
  var $random_y_s.1$2: bv32;
  var $random_z_s.1$1: bv32;
  var $random_z_s.1$2: bv32;
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var $0$1: bv1;
  var $0$2: bv1;
  var $1$1: bv32;
  var $1$2: bv32;
  var $min.0$1: bv32;
  var $min.0$2: bv32;
  var $max.0$1: bv32;
  var $max.0$2: bv32;
  var $min.1$1: bv32;
  var $min.1$2: bv32;
  var $max.1$1: bv32;
  var $max.1$2: bv32;
  var $offset.0: bv32;
  var $bin_base.0: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v31$1: bool;
  var v31$2: bool;
  var v37: bool;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bool;
  var v43$2: bool;
  var v44$1: bv32;
  var v44$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0: bv32;
  var v1: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bool;
  var v30$2: bool;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bool;
  var v26$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v18$1: bool;
  var v18$2: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v39$1: bool;
  var v39$2: bool;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36: bool;
  var v32$1: bool;
  var v32$2: bool;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v5: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bool;
  var v28$2: bool;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v13: bool;
  var v38$1: bool;
  var v38$2: bool;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := BV32_MUL($NUM_ELEMENTS, BV32_ADD($NUM_SETS, 1bv32));
    v1 := BV32_MUL($NUM_ELEMENTS, BV32_ADD($NUM_SETS, 1bv32));
    v2$1 := group_id_x$1;
    v2$2 := group_id_x$2;
    v3$1 := local_id_x$1;
    v3$2 := local_id_x$2;
    v4$1 := BV32_ULT(v2$1, BV32_ADD($NUM_SETS, 1bv32));
    v4$2 := BV32_ULT(v2$2, BV32_ADD($NUM_SETS, 1bv32));
    $w.0 := 0bv32;
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_5"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v5 := BV32_ULT($w.0, 2560bv32);
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
    assume {:partition} !v5 && !v5;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    p2$1 := (if v4$1 then v4$1 else p2$1);
    p2$2 := (if v4$2 then v4$2 else p2$2);
    p3$1 := (if !v4$1 then !v4$1 else p3$1);
    p3$2 := (if !v4$2 then !v4$2 else p3$2);
    v7$1 := (if p2$1 then BV32_MUL($NUM_ELEMENTS, v2$1) else v7$1);
    v7$2 := (if p2$2 then BV32_MUL($NUM_ELEMENTS, v2$2) else v7$2);
    v8$1 := (if p2$1 then BV32_MUL($NUM_ELEMENTS, v2$1) else v8$1);
    v8$2 := (if p2$2 then BV32_MUL($NUM_ELEMENTS, v2$2) else v8$2);
    v9$1 := (if p2$1 then BV32_MUL($NUM_ELEMENTS, v2$1) else v9$1);
    v9$2 := (if p2$2 then BV32_MUL($NUM_ELEMENTS, v2$2) else v9$2);
    $random_y.0$1, $random_x.0$1, $data_z.0$1, $data_y.0$1, $data_x.0$1, $random_z.0$1 := (if p2$1 then BV32_ADD(v0, v8$1) else $random_y.0$1), (if p2$1 then v7$1 else $random_x.0$1), (if p2$1 then BV32_ADD(BV32_ADD(v0, v1), v9$1) else $data_z.0$1), (if p2$1 then BV32_ADD(v0, v8$1) else $data_y.0$1), (if p2$1 then v7$1 else $data_x.0$1), (if p2$1 then BV32_ADD(BV32_ADD(v0, v1), v9$1) else $random_z.0$1);
    $random_y.0$2, $random_x.0$2, $data_z.0$2, $data_y.0$2, $data_x.0$2, $random_z.0$2 := (if p2$2 then BV32_ADD(v0, v8$2) else $random_y.0$2), (if p2$2 then v7$2 else $random_x.0$2), (if p2$2 then BV32_ADD(BV32_ADD(v0, v1), v9$2) else $data_z.0$2), (if p2$2 then BV32_ADD(v0, v8$2) else $data_y.0$2), (if p2$2 then v7$2 else $data_x.0$2), (if p2$2 then BV32_ADD(BV32_ADD(v0, v1), v9$2) else $random_z.0$2);
    $random_y.0$1, $random_x.0$1, $data_z.0$1, $data_y.0$1, $data_x.0$1, $random_z.0$1 := (if p3$1 then BV32_ADD(v0, BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$1, $NUM_SETS))) else $random_y.0$1), (if p3$1 then BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$1, $NUM_SETS)) else $random_x.0$1), (if p3$1 then BV32_ADD(v0, v1) else $data_z.0$1), (if p3$1 then v0 else $data_y.0$1), (if p3$1 then 0bv32 else $data_x.0$1), (if p3$1 then BV32_ADD(BV32_ADD(v0, v1), BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$1, $NUM_SETS))) else $random_z.0$1);
    $random_y.0$2, $random_x.0$2, $data_z.0$2, $data_y.0$2, $data_x.0$2, $random_z.0$2 := (if p3$2 then BV32_ADD(v0, BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$2, $NUM_SETS))) else $random_y.0$2), (if p3$2 then BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$2, $NUM_SETS)) else $random_x.0$2), (if p3$2 then BV32_ADD(v0, v1) else $data_z.0$2), (if p3$2 then v0 else $data_y.0$2), (if p3$2 then 0bv32 else $data_x.0$2), (if p3$2 then BV32_ADD(BV32_ADD(v0, v1), BV32_MUL($NUM_ELEMENTS, BV32_SUB(v2$2, $NUM_SETS))) else $random_z.0$2);
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    $j.0, $random_x_s.0$1, $random_y_s.0$1, $random_z_s.0$1 := 0bv32, v10$1, v11$1, v12$1;
    $random_x_s.0$2, $random_y_s.0$2, $random_z_s.0$2 := v10$2, v11$2, v12$2;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 12} true;
    v13 := BV32_ULT($j.0, $NUM_ELEMENTS);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v13 && !v13;
    v34$1 := BV32_AND(v3$1, 63bv32);
    v34$2 := BV32_AND(v3$2, 63bv32);
    v35$1 := BV32_UDIV(v3$1, 64bv32);
    v35$2 := BV32_UDIV(v3$2, 64bv32);
    $offset.0 := 64bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $37;

  $37:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 49} true;
    v36 := BV32_UGT($offset.0, 0bv32);
    p32$1 := false;
    p32$2 := false;
    p33$1 := false;
    p33$2 := false;
    goto $truebb14, __partitioned_block_$falsebb14_0;

  __partitioned_block_$falsebb14_0:
    assume {:partition} !v36 && !v36;
    goto __partitioned_block_$falsebb14_1;

  __partitioned_block_$falsebb14_1:
    call {:sourceloc_num 64} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v42$1 := BV32_MUL(20bv32, v2$1);
    v42$2 := BV32_MUL(20bv32, v2$2);
    v43$1 := BV32_ULT(v3$1, 20bv32);
    v43$2 := BV32_ULT(v3$2, 20bv32);
    p32$1 := (if v43$1 then v43$1 else p32$1);
    p32$2 := (if v43$2 then v43$2 else p32$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_READ(p32$1, p32$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$gen_hists.warp_hists(p32$1, BV32_MUL(v3$1, 128bv32), $$gen_hists.warp_hists[1bv1][BV32_MUL(v3$1, 128bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$gen_hists.warp_hists(p32$2, BV32_MUL(v3$2, 128bv32), $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v3$2, 128bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_READ(p32$1, p32$2);
    v44$1 := (if p32$1 then $$gen_hists.warp_hists[1bv1][BV32_MUL(v3$1, 128bv32)] else v44$1);
    v44$2 := (if p32$2 then $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v3$2, 128bv32)] else v44$2);
    call _PRE_WARP_SYNC_$$histograms_WRITE(p32$1, p32$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$histograms(p32$1, BV32_ADD(v42$1, v3$1), BV32_ZEXT64(v44$1), $$histograms[BV32_ADD(v42$1, v3$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histograms(p32$2, BV32_ADD(v42$2, v3$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$histograms(p32$2, BV32_ADD(v42$2, v3$2), BV32_ZEXT64(v44$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histograms"} true;
    call _POST_WARP_SYNC_$$histograms_WRITE(p32$1, p32$2);
    $$histograms[BV32_ADD(v42$1, v3$1)] := (if p32$1 then BV32_ZEXT64(v44$1) else $$histograms[BV32_ADD(v42$1, v3$1)]);
    $$histograms[BV32_ADD(v42$2, v3$2)] := (if p32$2 then BV32_ZEXT64(v44$2) else $$histograms[BV32_ADD(v42$2, v3$2)]);
    return;

  $truebb14:
    assume {:partition} v36 && v36;
    $bin_base.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $39;

  $39:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 51} true;
    v37 := BV32_ULT($bin_base.0, 20bv32);
    p28$1 := false;
    p28$2 := false;
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    p31$1 := false;
    p31$2 := false;
    goto __partitioned_block_$truebb15_0, $falsebb15;

  $falsebb15:
    assume {:partition} !v37 && !v37;
    $offset.0 := BV32_LSHR($offset.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $37;

  __partitioned_block_$truebb15_0:
    assume {:partition} v37 && v37;
    goto __partitioned_block_$truebb15_1;

  __partitioned_block_$truebb15_1:
    call {:sourceloc_num 53} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v38$1 := BV32_ULT(v34$1, $offset.0);
    v38$2 := BV32_ULT(v34$2, $offset.0);
    p29$1 := (if v38$1 then v38$1 else p29$1);
    p29$2 := (if v38$2 then v38$2 else p29$2);
    v39$1 := (if p29$1 then BV32_ULT(BV32_ADD($bin_base.0, v35$1), 20bv32) else v39$1);
    v39$2 := (if p29$2 then BV32_ULT(BV32_ADD($bin_base.0, v35$2), 20bv32) else v39$2);
    p31$1 := (if p29$1 && v39$1 then v39$1 else p31$1);
    p31$2 := (if p29$2 && v39$2 then v39$2 else p31$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_READ(p31$1, p31$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$gen_hists.warp_hists(p31$1, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1), $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$gen_hists.warp_hists(p31$2, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2), $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_READ(p31$1, p31$2);
    v40$1 := (if p31$1 then $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1)] else v40$1);
    v40$2 := (if p31$2 then $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2)] else v40$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_READ(p31$1, p31$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$gen_hists.warp_hists(p31$1, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), BV32_ADD(v34$1, $offset.0)), $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), BV32_ADD(v34$1, $offset.0))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$gen_hists.warp_hists(p31$2, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), BV32_ADD(v34$2, $offset.0)), $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), BV32_ADD(v34$2, $offset.0))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_READ(p31$1, p31$2);
    v41$1 := (if p31$1 then $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), BV32_ADD(v34$1, $offset.0))] else v41$1);
    v41$2 := (if p31$2 then $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), BV32_ADD(v34$2, $offset.0))] else v41$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_WRITE(p31$1, p31$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$gen_hists.warp_hists(p31$1, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1), BV32_ADD(v40$1, v41$1), $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists(p31$2, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$gen_hists.warp_hists(p31$2, BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2), BV32_ADD(v40$2, v41$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_WRITE(p31$1, p31$2);
    $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1)] := (if p31$1 then BV32_ADD(v40$1, v41$1) else $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$1), 128bv32), v34$1)]);
    $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2)] := (if p31$2 then BV32_ADD(v40$2, v41$2) else $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($bin_base.0, v35$2), 128bv32), v34$2)]);
    $bin_base.0 := BV32_ADD($bin_base.0, 4bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $39;

  $truebb2:
    assume {:partition} v13 && v13;
    v14$1 := BV32_ULT(BV32_ADD(v3$1, $j.0), $NUM_ELEMENTS);
    v14$2 := BV32_ULT(BV32_ADD(v3$2, $j.0), $NUM_ELEMENTS);
    p5$1 := (if v14$1 then v14$1 else p5$1);
    p5$2 := (if v14$2 then v14$2 else p5$2);
    p4$1 := (if !v14$1 then !v14$1 else p4$1);
    p4$2 := (if !v14$2 then !v14$2 else p4$2);
    $random_x_s.1$1, $random_y_s.1$1, $random_z_s.1$1 := (if p4$1 then $random_x_s.0$1 else $random_x_s.1$1), (if p4$1 then $random_y_s.0$1 else $random_y_s.1$1), (if p4$1 then $random_z_s.0$1 else $random_z_s.1$1);
    $random_x_s.1$2, $random_y_s.1$2, $random_z_s.1$2 := (if p4$2 then $random_x_s.0$2 else $random_x_s.1$2), (if p4$2 then $random_y_s.0$2 else $random_y_s.1$2), (if p4$2 then $random_z_s.0$2 else $random_z_s.1$2);
    v15$1 := (if p5$1 then $$all_x_data[BV32_ADD($random_x.0$1, BV32_ADD(v3$1, $j.0))] else v15$1);
    v15$2 := (if p5$2 then $$all_x_data[BV32_ADD($random_x.0$2, BV32_ADD(v3$2, $j.0))] else v15$2);
    v16$1 := (if p5$1 then $$all_x_data[BV32_ADD($random_y.0$1, BV32_ADD(v3$1, $j.0))] else v16$1);
    v16$2 := (if p5$2 then $$all_x_data[BV32_ADD($random_y.0$2, BV32_ADD(v3$2, $j.0))] else v16$2);
    v17$1 := (if p5$1 then $$all_x_data[BV32_ADD($random_z.0$1, BV32_ADD(v3$1, $j.0))] else v17$1);
    v17$2 := (if p5$2 then $$all_x_data[BV32_ADD($random_z.0$2, BV32_ADD(v3$2, $j.0))] else v17$2);
    $random_x_s.1$1, $random_y_s.1$1, $random_z_s.1$1 := (if p5$1 then v15$1 else $random_x_s.1$1), (if p5$1 then v16$1 else $random_y_s.1$1), (if p5$1 then v17$1 else $random_z_s.1$1);
    $random_x_s.1$2, $random_y_s.1$2, $random_z_s.1$2 := (if p5$2 then v15$2 else $random_x_s.1$2), (if p5$2 then v16$2 else $random_y_s.1$2), (if p5$2 then v17$2 else $random_z_s.1$2);
    $k.0$1 := 0bv32;
    $k.0$2 := 0bv32;
    p6$1 := true;
    p6$2 := true;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $14;

  $14:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 19} p6$1 ==> true;
    v18$1 := (if p6$1 then BV32_ULT($k.0$1, $NUM_ELEMENTS) else v18$1);
    v18$2 := (if p6$2 then BV32_ULT($k.0$2, $NUM_ELEMENTS) else v18$2);
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
    p27$1 := false;
    p27$2 := false;
    p8$1 := (if p6$1 && v18$1 then v18$1 else p8$1);
    p8$2 := (if p6$2 && v18$2 then v18$2 else p8$2);
    p7$1 := (if p6$1 && !v18$1 then !v18$1 else p7$1);
    p7$2 := (if p6$2 && !v18$2 then !v18$2 else p7$2);
    $0$1 := (if p7$1 then 0bv1 else $0$1);
    $0$2 := (if p7$2 then 0bv1 else $0$2);
    p10$1 := (if p8$1 && v4$1 then v4$1 else p10$1);
    p10$2 := (if p8$2 && v4$2 then v4$2 else p10$2);
    p9$1 := (if p8$1 && !v4$1 then !v4$1 else p9$1);
    p9$2 := (if p8$2 && !v4$2 then !v4$2 else p9$2);
    $1$1 := (if p9$1 then 1bv32 else $1$1);
    $1$2 := (if p9$2 then 1bv32 else $1$2);
    $1$1 := (if p10$1 then BV1_ZEXT32((if BV32_ULT($k.0$1, BV32_ADD($j.0, 256bv32)) then 1bv1 else 0bv1)) else $1$1);
    $1$2 := (if p10$2 then BV1_ZEXT32((if BV32_ULT($k.0$2, BV32_ADD($j.0, 256bv32)) then 1bv1 else 0bv1)) else $1$2);
    $0$1 := (if p8$1 then (if $1$1 != 0bv32 then 1bv1 else 0bv1) else $0$1);
    $0$2 := (if p8$2 then (if $1$2 != 0bv32 then 1bv1 else 0bv1) else $0$2);
    p11$1 := (if p6$1 && $0$1 == 1bv1 then $0$1 == 1bv1 else p11$1);
    p11$2 := (if p6$2 && $0$2 == 1bv1 then $0$2 == 1bv1 else p11$2);
    p6$1 := (if p6$1 && !($0$1 == 1bv1) then $0$1 == 1bv1 else p6$1);
    p6$2 := (if p6$2 && !($0$2 == 1bv1) then $0$2 == 1bv1 else p6$2);
    v19$1 := (if p11$1 then $$all_x_data[BV32_ADD($data_x.0$1, $k.0$1)] else v19$1);
    v19$2 := (if p11$2 then $$all_x_data[BV32_ADD($data_x.0$2, $k.0$2)] else v19$2);
    v20$1 := (if p11$1 then $$all_x_data[BV32_ADD($data_y.0$1, $k.0$1)] else v20$1);
    v20$2 := (if p11$2 then $$all_x_data[BV32_ADD($data_y.0$2, $k.0$2)] else v20$2);
    v21$1 := (if p11$1 then $$all_x_data[BV32_ADD($data_z.0$1, $k.0$1)] else v21$1);
    v21$2 := (if p11$2 then $$all_x_data[BV32_ADD($data_z.0$2, $k.0$2)] else v21$2);
    v22$1 := (if p11$1 then FADD32(FMUL32(v21$1, $random_z_s.1$1), FADD32(FMUL32(v19$1, $random_x_s.1$1), FMUL32(v20$1, $random_y_s.1$1))) else v22$1);
    v22$2 := (if p11$2 then FADD32(FMUL32(v21$2, $random_z_s.1$2), FADD32(FMUL32(v19$2, $random_x_s.1$2), FMUL32(v20$2, $random_y_s.1$2))) else v22$2);
    $min.0$1, $max.0$1 := (if p11$1 then 0bv32 else $min.0$1), (if p11$1 then 20bv32 else $max.0$1);
    $min.0$2, $max.0$2 := (if p11$2 then 0bv32 else $min.0$2), (if p11$2 then 20bv32 else $max.0$2);
    p12$1 := (if p11$1 then true else p12$1);
    p12$2 := (if p11$2 then true else p12$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gen_hists.warp_hists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p12$1 ==> p6$1;
    assert p12$2 ==> p6$2;
    assert {:block_sourceloc} {:sourceloc_num 29} p12$1 ==> true;
    v23$1 := (if p12$1 then BV32_UGT($max.0$1, BV32_ADD($min.0$1, 1bv32)) else v23$1);
    v23$2 := (if p12$2 then BV32_UGT($max.0$2, BV32_ADD($min.0$2, 1bv32)) else v23$2);
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
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p13$1 := (if p12$1 && v23$1 then v23$1 else p13$1);
    p13$2 := (if p12$2 && v23$2 then v23$2 else p13$2);
    p12$1 := (if p12$1 && !v23$1 then v23$1 else p12$1);
    p12$2 := (if p12$2 && !v23$2 then v23$2 else p12$2);
    v24$1 := (if p13$1 then BV32_UDIV(BV32_ADD($min.0$1, $max.0$1), 2bv32) else v24$1);
    v24$2 := (if p13$2 then BV32_UDIV(BV32_ADD($min.0$2, $max.0$2), 2bv32) else v24$2);
    v25$1 := (if p13$1 then $$dev_binb$1[v24$1] else v25$1);
    v25$2 := (if p13$2 then $$dev_binb$2[v24$2] else v25$2);
    v26$1 := (if p13$1 then FEQ32(v22$1, v25$1) || FLT32(v25$1, v22$1) else v26$1);
    v26$2 := (if p13$2 then FEQ32(v22$2, v25$2) || FLT32(v25$2, v22$2) else v26$2);
    p15$1 := (if p13$1 && v26$1 then v26$1 else p15$1);
    p15$2 := (if p13$2 && v26$2 then v26$2 else p15$2);
    p14$1 := (if p13$1 && !v26$1 then !v26$1 else p14$1);
    p14$2 := (if p13$2 && !v26$2 then !v26$2 else p14$2);
    $min.1$1, $max.1$1 := (if p14$1 then v24$1 else $min.1$1), (if p14$1 then $max.0$1 else $max.1$1);
    $min.1$2, $max.1$2 := (if p14$2 then v24$2 else $min.1$2), (if p14$2 then $max.0$2 else $max.1$2);
    $min.1$1, $max.1$1 := (if p15$1 then $min.0$1 else $min.1$1), (if p15$1 then v24$1 else $max.1$1);
    $min.1$2, $max.1$2 := (if p15$2 then $min.0$2 else $min.1$2), (if p15$2 then v24$2 else $max.1$2);
    $min.0$1, $max.0$1 := (if p13$1 then $min.1$1 else $min.0$1), (if p13$1 then $max.1$1 else $max.0$1);
    $min.0$2, $max.0$2 := (if p13$2 then $min.1$2 else $min.0$2), (if p13$2 then $max.1$2 else $max.0$2);
    p12$1 := (if p13$1 then true else p12$1);
    p12$2 := (if p13$2 then true else p12$2);
    goto $21.backedge, $21.tail;

  $21.tail:
    assume !p12$1 && !p12$2;
    v27$1 := (if p11$1 then $$dev_binb$1[$min.0$1] else v27$1);
    v27$2 := (if p11$2 then $$dev_binb$2[$min.0$2] else v27$2);
    v28$1 := (if p11$1 then FLT32(v22$1, v27$1) else v28$1);
    v28$2 := (if p11$2 then FLT32(v22$2, v27$2) else v28$2);
    p17$1 := (if p11$1 && v28$1 then v28$1 else p17$1);
    p17$2 := (if p11$2 && v28$2 then v28$2 else p17$2);
    v29$1 := (if p17$1 then $$dev_binb$1[$max.0$1] else v29$1);
    v29$2 := (if p17$2 then $$dev_binb$2[$max.0$2] else v29$2);
    v30$1 := (if p17$1 then FEQ32(v22$1, v29$1) || FLT32(v29$1, v22$1) else v30$1);
    v30$2 := (if p17$2 then FEQ32(v22$2, v29$2) || FLT32(v29$2, v22$2) else v30$2);
    p19$1 := (if p17$1 && v30$1 then v30$1 else p19$1);
    p19$2 := (if p17$2 && v30$2 then v30$2 else p19$2);
    p20$1 := (if p19$1 && v4$1 then v4$1 else p20$1);
    p20$2 := (if p19$2 && v4$2 then v4$2 else p20$2);
    p24$1 := (if p19$1 && !v4$1 then !v4$1 else p24$1);
    p24$2 := (if p19$2 && !v4$2 then !v4$2 else p24$2);
    v31$1 := (if p20$1 then BV32_UGT(BV32_ADD(v3$1, $j.0), $k.0$1) else v31$1);
    v31$2 := (if p20$2 then BV32_UGT(BV32_ADD(v3$2, $j.0), $k.0$2) else v31$2);
    p24$1 := (if p20$1 && v31$1 then v31$1 else p24$1);
    p24$2 := (if p20$2 && v31$2 then v31$2 else p24$2);
    p24$1 := (if p22$1 then true else p24$1);
    p24$2 := (if p22$2 then true else p24$2);
    p24$1 := (if p23$1 then true else p24$1);
    p24$2 := (if p23$2 then true else p24$2);
    v32$1 := (if p24$1 then BV32_ULT(BV32_ADD(v3$1, $j.0), $NUM_ELEMENTS) else v32$1);
    v32$2 := (if p24$2 then BV32_ULT(BV32_ADD(v3$2, $j.0), $NUM_ELEMENTS) else v32$2);
    p26$1 := (if p24$1 && v32$1 then v32$1 else p26$1);
    p26$2 := (if p24$2 && v32$2 then v32$2 else p26$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(p26$1, p26$2);
    call {:sourceloc} {:sourceloc_num 43} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$gen_hists.warp_hists(p26$1, BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$1, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$1, 2bv32), 4bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 43} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$gen_hists.warp_hists(p26$2, BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$2, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$2, 2bv32), 4bv32)), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(p26$1, p26$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v33$1 := (if p26$1 then _HAVOC_bv32$1 else v33$1);
    v33$2 := (if p26$2 then _HAVOC_bv32$2 else v33$2);
    assume !_USED_$$gen_hists.warp_hists[BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$1, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$1, 2bv32), 4bv32)), 4bv32)][v33$1];
    _USED_$$gen_hists.warp_hists[BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$1, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$1, 2bv32), 4bv32)), 4bv32)][v33$1] := true;
    assume !_USED_$$gen_hists.warp_hists[BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$2, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$2, 2bv32), 4bv32)), 4bv32)][v33$2];
    _USED_$$gen_hists.warp_hists[BV32_SDIV(BV32_ADD(BV32_MUL(BV32_SUB($max.0$2, 1bv32), 512bv32), BV32_MUL(BV32_UDIV(v3$2, 2bv32), 4bv32)), 4bv32)][v33$2] := true;
    $k.0$1 := (if p11$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1);
    $k.0$2 := (if p11$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2);
    p6$1 := (if p11$1 then true else p6$1);
    p6$2 := (if p11$2 then true else p6$2);
    goto $14.backedge, $14.tail;

  $14.tail:
    assume !p6$1 && !p6$2;
    $j.0, $random_x_s.0$1, $random_y_s.0$1, $random_z_s.0$1 := BV32_ADD($j.0, 256bv32), $random_x_s.1$1, $random_y_s.1$1, $random_z_s.1$1;
    $random_x_s.0$2, $random_y_s.0$2, $random_z_s.0$2 := $random_x_s.1$2, $random_y_s.1$2, $random_z_s.1$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $10;

  $14.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $14;

  $21.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $21;

  $truebb:
    assume {:partition} v5 && v5;
    v6$1 := BV32_ULT(BV32_ADD($w.0, v3$1), 2560bv32);
    v6$2 := BV32_ULT(BV32_ADD($w.0, v3$2), 2560bv32);
    p1$1 := (if v6$1 then v6$1 else p1$1);
    p1$2 := (if v6$2 then v6$2 else p1$2);
    call _PRE_WARP_SYNC_$$gen_hists.warp_hists_WRITE(p1$1, p1$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$gen_hists.warp_hists(p1$1, BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$1), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$1), 128bv32)), 0bv32, $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$1), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$1), 128bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists(p1$2, BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$2), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$2), 128bv32)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$gen_hists.warp_hists(p1$2, BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$2), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$2), 128bv32)), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gen_hists.warp_hists"} true;
    call _POST_WARP_SYNC_$$gen_hists.warp_hists_WRITE(p1$1, p1$2);
    $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$1), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$1), 128bv32))] := (if p1$1 then 0bv32 else $$gen_hists.warp_hists[1bv1][BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$1), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$1), 128bv32))]);
    $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$2), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$2), 128bv32))] := (if p1$2 then 0bv32 else $$gen_hists.warp_hists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_UDIV(BV32_ADD($w.0, v3$2), 128bv32), 128bv32), BV32_UREM(BV32_ADD($w.0, v3$2), 128bv32))]);
    $w.0 := BV32_ADD($w.0, 256bv32);
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 201bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 0bv1;
  modifies $$gen_hists.warp_hists, $$histograms, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$gen_hists.warp_hists, $$histograms, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$gen_hists.warp_hists, $$histograms, _TRACKING;



procedure {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$histograms_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$histograms_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(_P$1: bool, _P$2: bool);



var {:atomic_usedmap} _USED_$$gen_hists.warp_hists: [bv32][bv32]bool;

const _WATCHED_VALUE_$$histograms: bv64;

procedure {:inline 1} _LOG_READ_$$histograms(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$histograms;



implementation {:inline 1} _LOG_READ_$$histograms(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histograms == _value then true else _READ_HAS_OCCURRED_$$histograms);
    return;
}



procedure _CHECK_READ_$$histograms(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histograms);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$histograms: bool;

procedure {:inline 1} _LOG_WRITE_$$histograms(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$histograms, _WRITE_READ_BENIGN_FLAG_$$histograms;



implementation {:inline 1} _LOG_WRITE_$$histograms(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histograms == _value then true else _WRITE_HAS_OCCURRED_$$histograms);
    _WRITE_READ_BENIGN_FLAG_$$histograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histograms == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histograms);
    return;
}



procedure _CHECK_WRITE_$$histograms(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histograms != _value);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histograms != _value);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$histograms(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histograms;



implementation {:inline 1} _LOG_ATOMIC_$$histograms(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histograms);
    return;
}



procedure _CHECK_ATOMIC_$$histograms(_P: bool, _offset: bv32);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset);
  requires {:source_name "histograms"} {:array "$$histograms"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histograms(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histograms;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histograms(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histograms := (if _P && _WRITE_HAS_OCCURRED_$$histograms && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histograms);
    return;
}



const _WATCHED_VALUE_$$all_x_data: bv32;

procedure {:inline 1} _LOG_READ_$$all_x_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$all_x_data;



implementation {:inline 1} _LOG_READ_$$all_x_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$all_x_data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$all_x_data == _value then true else _READ_HAS_OCCURRED_$$all_x_data);
    return;
}



procedure _CHECK_READ_$$all_x_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$all_x_data);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$all_x_data: bool;

procedure {:inline 1} _LOG_WRITE_$$all_x_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$all_x_data, _WRITE_READ_BENIGN_FLAG_$$all_x_data;



implementation {:inline 1} _LOG_WRITE_$$all_x_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$all_x_data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$all_x_data == _value then true else _WRITE_HAS_OCCURRED_$$all_x_data);
    _WRITE_READ_BENIGN_FLAG_$$all_x_data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$all_x_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$all_x_data);
    return;
}



procedure _CHECK_WRITE_$$all_x_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$all_x_data != _value);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$all_x_data != _value);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$all_x_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$all_x_data;



implementation {:inline 1} _LOG_ATOMIC_$$all_x_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$all_x_data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$all_x_data);
    return;
}



procedure _CHECK_ATOMIC_$$all_x_data(_P: bool, _offset: bv32);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset);
  requires {:source_name "all_x_data"} {:array "$$all_x_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$all_x_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$all_x_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$all_x_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$all_x_data := (if _P && _WRITE_HAS_OCCURRED_$$all_x_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$all_x_data);
    return;
}



const _WATCHED_VALUE_$$gen_hists.warp_hists: bv32;

procedure {:inline 1} _LOG_READ_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gen_hists.warp_hists;



implementation {:inline 1} _LOG_READ_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gen_hists.warp_hists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gen_hists.warp_hists == _value then true else _READ_HAS_OCCURRED_$$gen_hists.warp_hists);
    return;
}



procedure _CHECK_READ_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists: bool;

procedure {:inline 1} _LOG_WRITE_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists, _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists;



implementation {:inline 1} _LOG_WRITE_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gen_hists.warp_hists == _value then true else _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists);
    _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gen_hists.warp_hists == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists);
    return;
}



procedure _CHECK_WRITE_$$gen_hists.warp_hists(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gen_hists.warp_hists != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gen_hists.warp_hists != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$gen_hists.warp_hists(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;



implementation {:inline 1} _LOG_ATOMIC_$$gen_hists.warp_hists(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists);
    return;
}



procedure _CHECK_ATOMIC_$$gen_hists.warp_hists(_P: bool, _offset: bv32);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "warp_hists"} {:array "$$gen_hists.warp_hists"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists := (if _P && _WRITE_HAS_OCCURRED_$$gen_hists.warp_hists && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gen_hists.warp_hists);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histograms;
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
    havoc $$histograms;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$gen_hists.warp_hists;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histograms;
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
    havoc $$histograms;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$gen_hists.warp_hists;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histograms;
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
    havoc $$histograms;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$gen_hists.warp_hists;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

implementation {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$histograms_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$histograms;
    assume !_WRITE_HAS_OCCURRED_$$histograms;
    assume !_ATOMIC_HAS_OCCURRED_$$histograms;
    goto anon0;

  anon0:
    havoc $$histograms;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$histograms_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$histograms;
    goto anon0;

  anon0:
    havoc $$histograms;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    goto anon0;

  anon0:
    havoc $$gen_hists.warp_hists;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    goto anon0;

  anon0:
    havoc $$gen_hists.warp_hists;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$gen_hists.warp_hists;
    assume !_WRITE_HAS_OCCURRED_$$gen_hists.warp_hists;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$gen_hists.warp_hists_ATOMIC(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_ATOMIC_HAS_OCCURRED_$$gen_hists.warp_hists;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}


