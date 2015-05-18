type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_sums"} {:global} $$d_sums: [bv32]bv32;

axiom {:array_info "$$d_sums"} {:global} {:elem_width 32} {:source_name "d_sums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_sums: bool;

var {:source_name "d_sums2"} {:global} $$d_sums2: [bv32]bv32;

axiom {:array_info "$$d_sums2"} {:global} {:elem_width 32} {:source_name "d_sums2"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_sums2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_sums2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_sums2: bool;

var {:source_name "d_psum"} {:group_shared} $$reduce_kernel.d_psum: [bv1][bv32]bv32;

axiom {:array_info "$$reduce_kernel.d_psum"} {:group_shared} {:elem_width 32} {:source_name "d_psum"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum: bool;

var {:source_name "d_psum2"} {:group_shared} $$reduce_kernel.d_psum2: [bv1][bv32]bv32;

axiom {:array_info "$$reduce_kernel.d_psum2"} {:group_shared} {:elem_width 32} {:source_name "d_psum2"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV64_SLT(bv64, bv64) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV64_SUB(bv64, bv64) : bv64;

function {:bvbuiltin "sign_extend 32"} BV32_SEXT64(bv32) : bv64;

procedure {:source_name "reduce_kernel"} {:kernel} $reduce_kernel($d_Ne: bv64, $d_no: bv64, $d_mul: bv32, $gridDim: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $d_Ne == 229916bv64 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $d_no == 229916bv64 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $d_mul == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $gridDim == 450bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_sums && !_WRITE_HAS_OCCURRED_$$d_sums && !_ATOMIC_HAS_OCCURRED_$$d_sums;
  requires !_READ_HAS_OCCURRED_$$d_sums2 && !_WRITE_HAS_OCCURRED_$$d_sums2 && !_ATOMIC_HAS_OCCURRED_$$d_sums2;
  requires !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum && !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum && !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum;
  requires !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 && !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 && !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2;
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
  modifies $$reduce_kernel.d_psum, $$reduce_kernel.d_psum2, _READ_HAS_OCCURRED_$$d_sums, _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum, _READ_HAS_OCCURRED_$$d_sums2, _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2, _READ_HAS_OCCURRED_$$reduce_kernel.d_psum, _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2, $$d_sums, $$d_sums2, _TRACKING, _WRITE_HAS_OCCURRED_$$d_sums, _WRITE_READ_BENIGN_FLAG_$$d_sums, _WRITE_READ_BENIGN_FLAG_$$d_sums, _WRITE_HAS_OCCURRED_$$d_sums2, _WRITE_READ_BENIGN_FLAG_$$d_sums2, _WRITE_READ_BENIGN_FLAG_$$d_sums2, _TRACKING, _TRACKING;



implementation {:source_name "reduce_kernel"} {:kernel} $reduce_kernel($d_Ne: bv64, $d_no: bv64, $d_mul: bv32, $gridDim: bv32)
{
  var $i.0: bv32;
  var $i.1$1: bv32;
  var $i.1$2: bv32;
  var $df.0$1: bv32;
  var $df.0$2: bv32;
  var $i.2$1: bv32;
  var $i.2$2: bv32;
  var $df.1$1: bv32;
  var $df.1$2: bv32;
  var $i.3$1: bv32;
  var $i.3$2: bv32;
  var $i.4$1: bv32;
  var $i.4$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v3: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bool;
  var v30$2: bool;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
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


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := BV32_ADD(BV32_MUL(v0$1, 512bv32), v1$1);
    v2$2 := BV32_ADD(BV32_MUL(v0$2, 512bv32), v1$2);
    v3 := BV64_SUB(512bv64, BV64_SUB(BV32_SEXT64(BV32_MUL($gridDim, 512bv32)), $d_no))[32:0];
    v4$1 := BV64_SLT(BV32_SEXT64(v2$1), $d_no);
    v4$2 := BV64_SLT(BV32_SEXT64(v2$2), $d_no);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p18$1 := false;
    p18$2 := false;
    p25$1 := false;
    p25$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$d_sums(p0$1, BV32_MUL(v2$1, $d_mul), $$d_sums[BV32_MUL(v2$1, $d_mul)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$d_sums(p0$2, BV32_MUL(v2$2, $d_mul), $$d_sums[BV32_MUL(v2$2, $d_mul)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_sums"} true;
    v5$1 := (if p0$1 then $$d_sums[BV32_MUL(v2$1, $d_mul)] else v5$1);
    v5$2 := (if p0$2 then $$d_sums[BV32_MUL(v2$2, $d_mul)] else v5$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$reduce_kernel.d_psum(p0$1, v1$1, v5$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(p0$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$reduce_kernel.d_psum(p0$2, v1$2, v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum"} true;
    $$reduce_kernel.d_psum[1bv1][v1$1] := (if p0$1 then v5$1 else $$reduce_kernel.d_psum[1bv1][v1$1]);
    $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p0$2 then v5$2 else $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$d_sums2(p0$1, BV32_MUL(v2$1, $d_mul), $$d_sums2[BV32_MUL(v2$1, $d_mul)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$d_sums2(p0$2, BV32_MUL(v2$2, $d_mul), $$d_sums2[BV32_MUL(v2$2, $d_mul)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_sums2"} true;
    v6$1 := (if p0$1 then $$d_sums2[BV32_MUL(v2$1, $d_mul)] else v6$1);
    v6$2 := (if p0$2 then $$d_sums2[BV32_MUL(v2$2, $d_mul)] else v6$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$reduce_kernel.d_psum2(p0$1, v1$1, v6$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(p0$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$reduce_kernel.d_psum2(p0$2, v1$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum2"} true;
    $$reduce_kernel.d_psum2[1bv1][v1$1] := (if p0$1 then v6$1 else $$reduce_kernel.d_psum2[1bv1][v1$1]);
    $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p0$2 then v6$2 else $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    v7 := v3 == 512bv32;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v7 && !v7;
    v17$1 := v0$1 != BV32_SUB($gridDim, 1bv32);
    v17$2 := v0$2 != BV32_SUB($gridDim, 1bv32);
    p6$1 := (if v17$1 then v17$1 else p6$1);
    p6$2 := (if v17$2 then v17$2 else p6$2);
    p13$1 := (if !v17$1 then !v17$1 else p13$1);
    p13$2 := (if !v17$2 then !v17$2 else p13$2);
    $i.1$1 := (if p6$1 then 2bv32 else $i.1$1);
    $i.1$2 := (if p6$2 then 2bv32 else $i.1$2);
    p7$1 := (if p6$1 then true else p7$1);
    p7$2 := (if p6$2 then true else p7$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto __partitioned_block_$14_0;

  __partitioned_block_$14_0:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b62 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b61 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b60 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "noread"} _b59 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b58 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b57 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b56 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "noread"} _b55 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "predicatedEquality"} _b54 ==> p7$1 && p7$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b53 ==> p7$1 && p7$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b52 ==> p7$1 && p7$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b51 ==> p7$1 && p7$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b50 ==> p7$1 && p7$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b49 ==> p7$1 && p7$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b48 ==> p7$1 && p7$2 ==> $i.1$1 == $i.1$2;
    assert {:tag "loopPredicateEquality"} _b47 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p7$1 == p7$2;
    assert {:tag "loopPredicateEquality"} _b46 ==> p7$1 == p7$2;
    assert {:tag "pow2NotZero"} _b45 ==> $i.1$2 != 0bv32;
    assert {:tag "pow2"} _b44 ==> $i.1$2 == 0bv32 || BV32_AND($i.1$2, BV32_SUB($i.1$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b43 ==> $i.1$1 != 0bv32;
    assert {:tag "pow2"} _b42 ==> $i.1$1 == 0bv32 || BV32_AND($i.1$1, BV32_SUB($i.1$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b36 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b35 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b34 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b33 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p7$1 ==> _b32 ==> p7$1 ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p7$2 ==> _b32 ==> p7$2 ==> group_id_x$2 != BV32_SUB($gridDim, 1bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b31 ==> group_id_x$1 != BV32_SUB($gridDim, 1bv32) && BV32_SLE($i.1$1, 512bv32) ==> p7$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b31 ==> group_id_x$2 != BV32_SUB($gridDim, 1bv32) && BV32_SLE($i.1$2, 512bv32) ==> p7$2;
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b30 ==> BV32_UGE($i.1$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b30 ==> BV32_UGE($i.1$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b29 ==> BV32_ULE($i.1$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b29 ==> BV32_ULE($i.1$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b28 ==> BV32_SGE($i.1$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b28 ==> BV32_SGE($i.1$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b27 ==> BV32_SLE($i.1$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b27 ==> BV32_SLE($i.1$2, 2bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p7$1 ==> _b26 ==> BV32_SUB($i.1$1, 2bv32) == BV32_SUB($i.1$2, 2bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p7$2 ==> _b26 ==> BV32_SUB($i.1$2, 2bv32) == BV32_SUB($i.1$1, 2bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p7$1 ==> _b25 ==> BV32_SLE(0bv32, $i.1$1);
    assert {:tag "guardNonNeg"} {:thread 2} p7$2 ==> _b25 ==> BV32_SLE(0bv32, $i.1$2);
    assert {:block_sourceloc} {:sourceloc_num 33} p7$1 ==> true;
    v18$1 := (if p7$1 then BV32_SLE($i.1$1, 512bv32) else v18$1);
    v18$2 := (if p7$2 then BV32_SLE($i.1$2, 512bv32) else v18$2);
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
    p8$1 := (if p7$1 && v18$1 then v18$1 else p8$1);
    p8$2 := (if p7$2 && v18$2 then v18$2 else p8$2);
    p7$1 := (if p7$1 && !v18$1 then v18$1 else p7$1);
    p7$2 := (if p7$2 && !v18$2 then v18$2 else p7$2);
    v19$1 := (if p8$1 then BV32_SREM(BV32_ADD(v1$1, 1bv32), $i.1$1) == 0bv32 else v19$1);
    v19$2 := (if p8$2 then BV32_SREM(BV32_ADD(v1$2, 1bv32), $i.1$2) == 0bv32 else v19$2);
    p10$1 := (if p8$1 && v19$1 then v19$1 else p10$1);
    p10$2 := (if p8$2 && v19$2 then v19$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$reduce_kernel.d_psum(p10$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$reduce_kernel.d_psum(p10$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v20$1 := (if p10$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v20$1);
    v20$2 := (if p10$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v20$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$reduce_kernel.d_psum(p10$1, BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32)), $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$reduce_kernel.d_psum(p10$2, BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32)), $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v21$1 := (if p10$1 then $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32))] else v21$1);
    v21$2 := (if p10$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32))] else v21$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$reduce_kernel.d_psum(p10$1, v1$1, FADD32(v20$1, v21$1), $$reduce_kernel.d_psum[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(p10$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$reduce_kernel.d_psum(p10$2, v1$2, FADD32(v20$2, v21$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum"} true;
    $$reduce_kernel.d_psum[1bv1][v1$1] := (if p10$1 then FADD32(v20$1, v21$1) else $$reduce_kernel.d_psum[1bv1][v1$1]);
    $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p10$2 then FADD32(v20$2, v21$2) else $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$reduce_kernel.d_psum2(p10$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$reduce_kernel.d_psum2(p10$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v22$1 := (if p10$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v22$1);
    v22$2 := (if p10$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v22$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$reduce_kernel.d_psum2(p10$1, BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32)), $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$reduce_kernel.d_psum2(p10$2, BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32)), $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v23$1 := (if p10$1 then $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.1$1, 2bv32))] else v23$1);
    v23$2 := (if p10$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.1$2, 2bv32))] else v23$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$reduce_kernel.d_psum2(p10$1, v1$1, FADD32(v22$1, v23$1), $$reduce_kernel.d_psum2[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(p10$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$reduce_kernel.d_psum2(p10$2, v1$2, FADD32(v22$2, v23$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum2"} true;
    $$reduce_kernel.d_psum2[1bv1][v1$1] := (if p10$1 then FADD32(v22$1, v23$1) else $$reduce_kernel.d_psum2[1bv1][v1$1]);
    $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p10$2 then FADD32(v22$2, v23$2) else $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$14_1;

  __partitioned_block_$14_1:
    call {:sourceloc_num 43} $bugle_barrier_duplicated_1(1bv1, 0bv1, p8$1, p8$2);
    $i.1$1 := (if p8$1 then BV32_MUL(2bv32, $i.1$1) else $i.1$1);
    $i.1$2 := (if p8$2 then BV32_MUL(2bv32, $i.1$2) else $i.1$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $14.backedge, $14.tail;

  $14.tail:
    assume !p7$1 && !p7$2;
    v24$1 := (if p6$1 then v1$1 == 511bv32 else v24$1);
    v24$2 := (if p6$2 then v1$2 == 511bv32 else v24$2);
    p11$1 := (if p6$1 && v24$1 then v24$1 else p11$1);
    p11$2 := (if p6$2 && v24$2 then v24$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_READ_$$reduce_kernel.d_psum(p11$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 47} _CHECK_READ_$$reduce_kernel.d_psum(p11$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v25$1 := (if p11$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v25$1);
    v25$2 := (if p11$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v25$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$d_sums(p11$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v25$1, $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums(p11$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$d_sums(p11$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums"} true;
    $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p11$1 then v25$1 else $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p11$2 then v25$2 else $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$reduce_kernel.d_psum2(p11$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$reduce_kernel.d_psum2(p11$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v26$1 := (if p11$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v26$1);
    v26$2 := (if p11$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v26$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$d_sums2(p11$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v26$1, $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums2(p11$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$d_sums2(p11$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums2"} true;
    $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p11$1 then v26$1 else $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p11$2 then v26$2 else $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    $df.0$1, $i.2$1 := (if p13$1 then 0bv32 else $df.0$1), (if p13$1 then 2bv32 else $i.2$1);
    $df.0$2, $i.2$2 := (if p13$2 then 0bv32 else $df.0$2), (if p13$2 then 2bv32 else $i.2$2);
    p14$1 := (if p13$1 then true else p14$1);
    p14$2 := (if p13$2 then true else p14$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 53} p14$1 ==> true;
    v27$1 := (if p14$1 then BV32_SLE($i.2$1, 512bv32) else v27$1);
    v27$2 := (if p14$2 then BV32_SLE($i.2$2, 512bv32) else v27$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p15$1 := (if p14$1 && v27$1 then v27$1 else p15$1);
    p15$2 := (if p14$2 && v27$2 then v27$2 else p15$2);
    p14$1 := (if p14$1 && !v27$1 then v27$1 else p14$1);
    p14$2 := (if p14$2 && !v27$2 then v27$2 else p14$2);
    v28$1 := (if p15$1 then BV32_SGE(v3, $i.2$1) else v28$1);
    v28$2 := (if p15$2 then BV32_SGE(v3, $i.2$2) else v28$2);
    p17$1 := (if p15$1 && v28$1 then v28$1 else p17$1);
    p17$2 := (if p15$2 && v28$2 then v28$2 else p17$2);
    p16$1 := (if p15$1 && !v28$1 then !v28$1 else p16$1);
    p16$2 := (if p15$2 && !v28$2 then !v28$2 else p16$2);
    $df.1$1 := (if p16$1 then $df.0$1 else $df.1$1);
    $df.1$2 := (if p16$2 then $df.0$2 else $df.1$2);
    $df.1$1 := (if p17$1 then $i.2$1 else $df.1$1);
    $df.1$2 := (if p17$2 then $i.2$2 else $df.1$2);
    $df.0$1, $i.2$1 := (if p15$1 then $df.1$1 else $df.0$1), (if p15$1 then BV32_MUL(2bv32, $i.2$1) else $i.2$1);
    $df.0$2, $i.2$2 := (if p15$2 then $df.1$2 else $df.0$2), (if p15$2 then BV32_MUL(2bv32, $i.2$2) else $i.2$2);
    p14$1 := (if p15$1 then true else p14$1);
    p14$2 := (if p15$2 then true else p14$2);
    goto $23.backedge, $23.tail;

  $23.tail:
    assume !p14$1 && !p14$2;
    $i.3$1 := (if p13$1 then 2bv32 else $i.3$1);
    $i.3$2 := (if p13$2 then 2bv32 else $i.3$2);
    p18$1 := (if p13$1 then true else p18$1);
    p18$2 := (if p13$2 then true else p18$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$29_0;

  __partitioned_block_$29_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b84 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b83 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b82 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "noread"} _b81 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b80 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b79 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b78 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "noread"} _b77 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "predicatedEquality"} _b76 ==> p18$1 && p18$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b75 ==> p18$1 && p18$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b74 ==> p18$1 && p18$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b73 ==> p18$1 && p18$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b72 ==> p18$1 && p18$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b71 ==> p18$1 && p18$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b70 ==> p18$1 && p18$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b69 ==> p18$1 && p18$2 ==> $i.3$1 == $i.3$2;
    assert {:tag "loopPredicateEquality"} _b68 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p18$1 == p18$2;
    assert {:tag "loopPredicateEquality"} _b67 ==> p18$1 == p18$2;
    assert {:tag "pow2NotZero"} _b66 ==> $i.3$2 != 0bv32;
    assert {:tag "pow2"} _b65 ==> $i.3$2 == 0bv32 || BV32_AND($i.3$2, BV32_SUB($i.3$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b64 ==> $i.3$1 != 0bv32;
    assert {:tag "pow2"} _b63 ==> $i.3$1 == 0bv32 || BV32_AND($i.3$1, BV32_SUB($i.3$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLE($i.3$1, $df.0$1) ==> p18$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLE($i.3$2, $df.0$2) ==> p18$2;
    assert {:tag "loopBound"} {:thread 1} p18$1 ==> _b5 ==> BV32_UGE($i.3$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p18$2 ==> _b5 ==> BV32_UGE($i.3$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p18$1 ==> _b4 ==> BV32_ULE($i.3$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p18$2 ==> _b4 ==> BV32_ULE($i.3$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p18$1 ==> _b3 ==> BV32_SGE($i.3$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p18$2 ==> _b3 ==> BV32_SGE($i.3$2, 2bv32);
    assert {:tag "loopBound"} {:thread 1} p18$1 ==> _b2 ==> BV32_SLE($i.3$1, 2bv32);
    assert {:tag "loopBound"} {:thread 2} p18$2 ==> _b2 ==> BV32_SLE($i.3$2, 2bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p18$1 ==> _b1 ==> BV32_SUB($i.3$1, 2bv32) == BV32_SUB($i.3$2, 2bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p18$2 ==> _b1 ==> BV32_SUB($i.3$2, 2bv32) == BV32_SUB($i.3$1, 2bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p18$1 ==> _b0 ==> BV32_SLE(0bv32, $i.3$1);
    assert {:tag "guardNonNeg"} {:thread 2} p18$2 ==> _b0 ==> BV32_SLE(0bv32, $i.3$2);
    assert {:block_sourceloc} {:sourceloc_num 59} p18$1 ==> true;
    v29$1 := (if p18$1 then BV32_SLE($i.3$1, $df.0$1) else v29$1);
    v29$2 := (if p18$2 then BV32_SLE($i.3$2, $df.0$2) else v29$2);
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
    p27$1 := false;
    p27$2 := false;
    p19$1 := (if p18$1 && v29$1 then v29$1 else p19$1);
    p19$2 := (if p18$2 && v29$2 then v29$2 else p19$2);
    p18$1 := (if p18$1 && !v29$1 then v29$1 else p18$1);
    p18$2 := (if p18$2 && !v29$2 then v29$2 else p18$2);
    v30$1 := (if p19$1 then BV32_SREM(BV32_ADD(v1$1, 1bv32), $i.3$1) == 0bv32 else v30$1);
    v30$2 := (if p19$2 then BV32_SREM(BV32_ADD(v1$2, 1bv32), $i.3$2) == 0bv32 else v30$2);
    p21$1 := (if p19$1 && v30$1 then v30$1 else p21$1);
    p21$2 := (if p19$2 && v30$2 then v30$2 else p21$2);
    v31$1 := (if p21$1 then BV32_SLT(v1$1, $df.0$1) else v31$1);
    v31$2 := (if p21$2 then BV32_SLT(v1$2, $df.0$2) else v31$2);
    p23$1 := (if p21$1 && v31$1 then v31$1 else p23$1);
    p23$2 := (if p21$2 && v31$2 then v31$2 else p23$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$reduce_kernel.d_psum(p23$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$reduce_kernel.d_psum(p23$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v32$1 := (if p23$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v32$1);
    v32$2 := (if p23$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v32$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$reduce_kernel.d_psum(p23$1, BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32)), $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$reduce_kernel.d_psum(p23$2, BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32)), $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v33$1 := (if p23$1 then $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32))] else v33$1);
    v33$2 := (if p23$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32))] else v33$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$reduce_kernel.d_psum(p23$1, v1$1, FADD32(v32$1, v33$1), $$reduce_kernel.d_psum[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(p23$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$reduce_kernel.d_psum(p23$2, v1$2, FADD32(v32$2, v33$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum"} true;
    $$reduce_kernel.d_psum[1bv1][v1$1] := (if p23$1 then FADD32(v32$1, v33$1) else $$reduce_kernel.d_psum[1bv1][v1$1]);
    $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p23$2 then FADD32(v32$2, v33$2) else $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$reduce_kernel.d_psum2(p23$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$reduce_kernel.d_psum2(p23$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v34$1 := (if p23$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v34$1);
    v34$2 := (if p23$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v34$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_READ_$$reduce_kernel.d_psum2(p23$1, BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32)), $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 67} _CHECK_READ_$$reduce_kernel.d_psum2(p23$2, BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32)), $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v35$1 := (if p23$1 then $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.3$1, 2bv32))] else v35$1);
    v35$2 := (if p23$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.3$2, 2bv32))] else v35$2);
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$reduce_kernel.d_psum2(p23$1, v1$1, FADD32(v34$1, v35$1), $$reduce_kernel.d_psum2[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(p23$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$reduce_kernel.d_psum2(p23$2, v1$2, FADD32(v34$2, v35$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum2"} true;
    $$reduce_kernel.d_psum2[1bv1][v1$1] := (if p23$1 then FADD32(v34$1, v35$1) else $$reduce_kernel.d_psum2[1bv1][v1$1]);
    $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p23$2 then FADD32(v34$2, v35$2) else $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$29_1;

  __partitioned_block_$29_1:
    call {:sourceloc_num 70} $bugle_barrier_duplicated_0(1bv1, 0bv1, p19$1, p19$2);
    $i.3$1 := (if p19$1 then BV32_MUL(2bv32, $i.3$1) else $i.3$1);
    $i.3$2 := (if p19$2 then BV32_MUL(2bv32, $i.3$2) else $i.3$2);
    p18$1 := (if p19$1 then true else p18$1);
    p18$2 := (if p19$2 then true else p18$2);
    goto $29.backedge, $29.tail;

  $29.tail:
    assume !p18$1 && !p18$2;
    v36$1 := (if p13$1 then v1$1 == BV32_SUB($df.0$1, 1bv32) else v36$1);
    v36$2 := (if p13$2 then v1$2 == BV32_SUB($df.0$2, 1bv32) else v36$2);
    p24$1 := (if p13$1 && v36$1 then v36$1 else p24$1);
    p24$2 := (if p13$2 && v36$2 then v36$2 else p24$2);
    $i.4$1 := (if p24$1 then BV32_ADD(BV32_MUL(v0$1, 512bv32), $df.0$1) else $i.4$1);
    $i.4$2 := (if p24$2 then BV32_ADD(BV32_MUL(v0$2, 512bv32), $df.0$2) else $i.4$2);
    p25$1 := (if p24$1 then true else p25$1);
    p25$2 := (if p24$2 then true else p25$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $37;

  $37:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b88 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b87 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b86 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b85 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b24 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b23 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b22 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b21 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p25$1 ==> _b20 ==> p25$1 ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p25$2 ==> _b20 ==> p25$2 ==> local_id_x$2 == BV32_SUB($df.0$2, 1bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b19 ==> local_id_x$1 == BV32_SUB($df.0$1, 1bv32) && BV32_SLT($i.4$1, BV32_ADD(BV32_MUL(group_id_x$1, 512bv32), BV64_SUB(512bv64, BV64_SUB(BV32_SEXT64(BV32_MUL($gridDim, 512bv32)), $d_no))[32:0])) ==> p25$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b19 ==> local_id_x$2 == BV32_SUB($df.0$2, 1bv32) && BV32_SLT($i.4$2, BV32_ADD(BV32_MUL(group_id_x$2, 512bv32), BV64_SUB(512bv64, BV64_SUB(BV32_SEXT64(BV32_MUL($gridDim, 512bv32)), $d_no))[32:0])) ==> p25$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b18 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_READ_HAS_OCCURRED_$$d_sums2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b17 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b16 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_READ_HAS_OCCURRED_$$d_sums;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b15 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b14 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b13 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b12 ==> v1$1 != BV32_SUB($df.0$1, 1bv32) ==> !p25$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b12 ==> v1$2 != BV32_SUB($df.0$2, 1bv32) ==> !p25$2;
    assert {:tag "loopBound"} {:thread 1} p25$1 ==> _b11 ==> BV32_UGE($i.4$1, BV32_ADD(BV32_MUL(v0$1, 512bv32), $df.0$1));
    assert {:tag "loopBound"} {:thread 2} p25$2 ==> _b11 ==> BV32_UGE($i.4$2, BV32_ADD(BV32_MUL(v0$2, 512bv32), $df.0$2));
    assert {:tag "loopBound"} {:thread 1} p25$1 ==> _b10 ==> BV32_ULE($i.4$1, BV32_ADD(BV32_MUL(v0$1, 512bv32), $df.0$1));
    assert {:tag "loopBound"} {:thread 2} p25$2 ==> _b10 ==> BV32_ULE($i.4$2, BV32_ADD(BV32_MUL(v0$2, 512bv32), $df.0$2));
    assert {:tag "loopBound"} {:thread 1} p25$1 ==> _b9 ==> BV32_SGE($i.4$1, BV32_ADD(BV32_MUL(v0$1, 512bv32), $df.0$1));
    assert {:tag "loopBound"} {:thread 2} p25$2 ==> _b9 ==> BV32_SGE($i.4$2, BV32_ADD(BV32_MUL(v0$2, 512bv32), $df.0$2));
    assert {:tag "loopBound"} {:thread 1} p25$1 ==> _b8 ==> BV32_SLE($i.4$1, BV32_ADD(BV32_MUL(v0$1, 512bv32), $df.0$1));
    assert {:tag "loopBound"} {:thread 2} p25$2 ==> _b8 ==> BV32_SLE($i.4$2, BV32_ADD(BV32_MUL(v0$2, 512bv32), $df.0$2));
    assert {:tag "guardNonNeg"} {:thread 1} p25$1 ==> _b7 ==> BV32_SLE(0bv32, $i.4$1);
    assert {:tag "guardNonNeg"} {:thread 2} p25$2 ==> _b7 ==> BV32_SLE(0bv32, $i.4$2);
    assert {:block_sourceloc} {:sourceloc_num 74} p25$1 ==> true;
    v37$1 := (if p25$1 then BV32_SLT($i.4$1, BV32_ADD(BV32_MUL(v0$1, 512bv32), v3)) else v37$1);
    v37$2 := (if p25$2 then BV32_SLT($i.4$2, BV32_ADD(BV32_MUL(v0$2, 512bv32), v3)) else v37$2);
    p26$1 := false;
    p26$2 := false;
    p26$1 := (if p25$1 && v37$1 then v37$1 else p26$1);
    p26$2 := (if p25$2 && v37$2 then v37$2 else p26$2);
    p25$1 := (if p25$1 && !v37$1 then v37$1 else p25$1);
    p25$2 := (if p25$2 && !v37$2 then v37$2 else p25$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$reduce_kernel.d_psum(p26$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$reduce_kernel.d_psum(p26$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v38$1 := (if p26$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v38$1);
    v38$2 := (if p26$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v38$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$d_sums(p26$1, $i.4$1, $$d_sums[$i.4$1]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$d_sums(p26$2, $i.4$2, $$d_sums[$i.4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_sums"} true;
    v39$1 := (if p26$1 then $$d_sums[$i.4$1] else v39$1);
    v39$2 := (if p26$2 then $$d_sums[$i.4$2] else v39$2);
    call {:sourceloc} {:sourceloc_num 78} _LOG_WRITE_$$reduce_kernel.d_psum(p26$1, v1$1, FADD32(v38$1, v39$1), $$reduce_kernel.d_psum[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(p26$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 78} _CHECK_WRITE_$$reduce_kernel.d_psum(p26$2, v1$2, FADD32(v38$2, v39$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum"} true;
    $$reduce_kernel.d_psum[1bv1][v1$1] := (if p26$1 then FADD32(v38$1, v39$1) else $$reduce_kernel.d_psum[1bv1][v1$1]);
    $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p26$2 then FADD32(v38$2, v39$2) else $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$reduce_kernel.d_psum2(p26$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$reduce_kernel.d_psum2(p26$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v40$1 := (if p26$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v40$1);
    v40$2 := (if p26$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v40$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$d_sums2(p26$1, $i.4$1, $$d_sums2[$i.4$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$d_sums2(p26$2, $i.4$2, $$d_sums2[$i.4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_sums2"} true;
    v41$1 := (if p26$1 then $$d_sums2[$i.4$1] else v41$1);
    v41$2 := (if p26$2 then $$d_sums2[$i.4$2] else v41$2);
    call {:sourceloc} {:sourceloc_num 81} _LOG_WRITE_$$reduce_kernel.d_psum2(p26$1, v1$1, FADD32(v40$1, v41$1), $$reduce_kernel.d_psum2[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(p26$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 81} _CHECK_WRITE_$$reduce_kernel.d_psum2(p26$2, v1$2, FADD32(v40$2, v41$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum2"} true;
    $$reduce_kernel.d_psum2[1bv1][v1$1] := (if p26$1 then FADD32(v40$1, v41$1) else $$reduce_kernel.d_psum2[1bv1][v1$1]);
    $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p26$2 then FADD32(v40$2, v41$2) else $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    $i.4$1 := (if p26$1 then BV32_ADD($i.4$1, 1bv32) else $i.4$1);
    $i.4$2 := (if p26$2 then BV32_ADD($i.4$2, 1bv32) else $i.4$2);
    p25$1 := (if p26$1 then true else p25$1);
    p25$2 := (if p26$2 then true else p25$2);
    goto $37.backedge, $37.tail;

  $37.tail:
    assume !p25$1 && !p25$2;
    call {:sourceloc} {:sourceloc_num 84} _LOG_READ_$$reduce_kernel.d_psum(p24$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 84} _CHECK_READ_$$reduce_kernel.d_psum(p24$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v42$1 := (if p24$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v42$1);
    v42$2 := (if p24$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v42$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_WRITE_$$d_sums(p24$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v42$1, $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums(p24$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 85} _CHECK_WRITE_$$d_sums(p24$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v42$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums"} true;
    $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p24$1 then v42$1 else $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p24$2 then v42$2 else $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    call {:sourceloc} {:sourceloc_num 86} _LOG_READ_$$reduce_kernel.d_psum2(p24$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 86} _CHECK_READ_$$reduce_kernel.d_psum2(p24$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v43$1 := (if p24$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v43$1);
    v43$2 := (if p24$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v43$2);
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$d_sums2(p24$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v43$1, $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums2(p24$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$d_sums2(p24$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v43$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums2"} true;
    $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p24$1 then v43$1 else $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p24$2 then v43$2 else $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    goto $43;

  $43:
    return;

  $37.backedge:
    assume {:backedge} p25$1 || p25$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $37;

  $29.backedge:
    assume {:backedge} p18$1 || p18$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$29_0;

  $23.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $23;

  $14.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto __partitioned_block_$14_0;

  $truebb0:
    assume {:partition} v7 && v7;
    $i.0 := 2bv32;
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b98 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b97 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b96 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "noread"} _b95 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b94 ==> _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b93 ==> _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b92 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "noread"} _b91 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assert {:tag "pow2NotZero"} _b90 ==> $i.0 != 0bv32;
    assert {:tag "pow2"} _b89 ==> $i.0 == 0bv32 || BV32_AND($i.0, BV32_SUB($i.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reduce_kernel.d_psum ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b41 ==> BV32_UGE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b41 ==> BV32_UGE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b40 ==> BV32_ULE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b40 ==> BV32_ULE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b39 ==> BV32_SGE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b39 ==> BV32_SGE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b38 ==> BV32_SLE($i.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b38 ==> BV32_SLE($i.0, 2bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b37 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b37 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 12} true;
    v8 := BV32_SLE($i.0, 512bv32);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v8 && !v8;
    v14$1 := v1$1 == 511bv32;
    v14$2 := v1$2 == 511bv32;
    p4$1 := (if v14$1 then v14$1 else p4$1);
    p4$2 := (if v14$2 then v14$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$reduce_kernel.d_psum(p4$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$reduce_kernel.d_psum(p4$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v15$1 := (if p4$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v15$1);
    v15$2 := (if p4$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$d_sums(p4$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v15$1, $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums(p4$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$d_sums(p4$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums"} true;
    $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p4$1 then v15$1 else $$d_sums[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p4$2 then v15$2 else $$d_sums[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$reduce_kernel.d_psum2(p4$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$reduce_kernel.d_psum2(p4$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v16$1 := (if p4$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v16$1);
    v16$2 := (if p4$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v16$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$d_sums2(p4$1, BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32), v16$1, $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums2(p4$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$d_sums2(p4$2, BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_sums2"} true;
    $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)] := (if p4$1 then v16$1 else $$d_sums2[BV32_MUL(BV32_MUL(v0$1, $d_mul), 512bv32)]);
    $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)] := (if p4$2 then v16$2 else $$d_sums2[BV32_MUL(BV32_MUL(v0$2, $d_mul), 512bv32)]);
    goto $43;

  __partitioned_block_$truebb1_0:
    assume {:partition} v8 && v8;
    v9$1 := BV32_SREM(BV32_ADD(v1$1, 1bv32), $i.0) == 0bv32;
    v9$2 := BV32_SREM(BV32_ADD(v1$2, 1bv32), $i.0) == 0bv32;
    p3$1 := (if v9$1 then v9$1 else p3$1);
    p3$2 := (if v9$2 then v9$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$reduce_kernel.d_psum(p3$1, v1$1, $$reduce_kernel.d_psum[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$reduce_kernel.d_psum(p3$2, v1$2, $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v10$1 := (if p3$1 then $$reduce_kernel.d_psum[1bv1][v1$1] else v10$1);
    v10$2 := (if p3$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v10$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$reduce_kernel.d_psum(p3$1, BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32)), $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$reduce_kernel.d_psum(p3$2, BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32)), $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum"} true;
    v11$1 := (if p3$1 then $$reduce_kernel.d_psum[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32))] else v11$1);
    v11$2 := (if p3$2 then $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32))] else v11$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$reduce_kernel.d_psum(p3$1, v1$1, FADD32(v10$1, v11$1), $$reduce_kernel.d_psum[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(p3$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$reduce_kernel.d_psum(p3$2, v1$2, FADD32(v10$2, v11$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum"} true;
    $$reduce_kernel.d_psum[1bv1][v1$1] := (if p3$1 then FADD32(v10$1, v11$1) else $$reduce_kernel.d_psum[1bv1][v1$1]);
    $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p3$2 then FADD32(v10$2, v11$2) else $$reduce_kernel.d_psum[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$reduce_kernel.d_psum2(p3$1, v1$1, $$reduce_kernel.d_psum2[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$reduce_kernel.d_psum2(p3$2, v1$2, $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v12$1 := (if p3$1 then $$reduce_kernel.d_psum2[1bv1][v1$1] else v12$1);
    v12$2 := (if p3$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$reduce_kernel.d_psum2(p3$1, BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32)), $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$reduce_kernel.d_psum2(p3$2, BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32)), $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reduce_kernel.d_psum2"} true;
    v13$1 := (if p3$1 then $$reduce_kernel.d_psum2[1bv1][BV32_SUB(v1$1, BV32_SDIV($i.0, 2bv32))] else v13$1);
    v13$2 := (if p3$2 then $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v1$2, BV32_SDIV($i.0, 2bv32))] else v13$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$reduce_kernel.d_psum2(p3$1, v1$1, FADD32(v12$1, v13$1), $$reduce_kernel.d_psum2[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(p3$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$reduce_kernel.d_psum2(p3$2, v1$2, FADD32(v12$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reduce_kernel.d_psum2"} true;
    $$reduce_kernel.d_psum2[1bv1][v1$1] := (if p3$1 then FADD32(v12$1, v13$1) else $$reduce_kernel.d_psum2[1bv1][v1$1]);
    $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p3$2 then FADD32(v12$2, v13$2) else $$reduce_kernel.d_psum2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    $i.0 := BV32_MUL(2bv32, $i.0);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $4;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$reduce_kernel.d_psum, $$reduce_kernel.d_psum2, $$d_sums, $$d_sums2, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$reduce_kernel.d_psum, $$reduce_kernel.d_psum2, $$d_sums, $$d_sums2, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$reduce_kernel.d_psum, $$reduce_kernel.d_psum2, $$d_sums, $$d_sums2, _TRACKING;



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

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

const {:existential true} _b41: bool;

const _WATCHED_VALUE_$$d_sums: bv32;

procedure {:inline 1} _LOG_READ_$$d_sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_sums;



implementation {:inline 1} _LOG_READ_$$d_sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums == _value then true else _READ_HAS_OCCURRED_$$d_sums);
    return;
}



procedure _CHECK_READ_$$d_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_sums);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_sums: bool;

procedure {:inline 1} _LOG_WRITE_$$d_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_sums, _WRITE_READ_BENIGN_FLAG_$$d_sums;



implementation {:inline 1} _LOG_WRITE_$$d_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums == _value then true else _WRITE_HAS_OCCURRED_$$d_sums);
    _WRITE_READ_BENIGN_FLAG_$$d_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_sums);
    return;
}



procedure _CHECK_WRITE_$$d_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums != _value);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums != _value);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_sums;



implementation {:inline 1} _LOG_ATOMIC_$$d_sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_sums);
    return;
}



procedure _CHECK_ATOMIC_$$d_sums(_P: bool, _offset: bv32);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_sums"} {:array "$$d_sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_sums := (if _P && _WRITE_HAS_OCCURRED_$$d_sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_sums);
    return;
}



const _WATCHED_VALUE_$$d_sums2: bv32;

procedure {:inline 1} _LOG_READ_$$d_sums2(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_sums2;



implementation {:inline 1} _LOG_READ_$$d_sums2(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_sums2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums2 == _value then true else _READ_HAS_OCCURRED_$$d_sums2);
    return;
}



procedure _CHECK_READ_$$d_sums2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_sums2);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_sums2: bool;

procedure {:inline 1} _LOG_WRITE_$$d_sums2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_sums2, _WRITE_READ_BENIGN_FLAG_$$d_sums2;



implementation {:inline 1} _LOG_WRITE_$$d_sums2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_sums2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums2 == _value then true else _WRITE_HAS_OCCURRED_$$d_sums2);
    _WRITE_READ_BENIGN_FLAG_$$d_sums2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_sums2);
    return;
}



procedure _CHECK_WRITE_$$d_sums2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums2 != _value);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_sums2 != _value);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_sums2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_sums2;



implementation {:inline 1} _LOG_ATOMIC_$$d_sums2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_sums2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_sums2);
    return;
}



procedure _CHECK_ATOMIC_$$d_sums2(_P: bool, _offset: bv32);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_sums2"} {:array "$$d_sums2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_sums2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_sums2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_sums2 := (if _P && _WRITE_HAS_OCCURRED_$$d_sums2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_sums2);
    return;
}



const _WATCHED_VALUE_$$reduce_kernel.d_psum: bv32;

procedure {:inline 1} _LOG_READ_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$reduce_kernel.d_psum;



implementation {:inline 1} _LOG_READ_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$reduce_kernel.d_psum := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum == _value then true else _READ_HAS_OCCURRED_$$reduce_kernel.d_psum);
    return;
}



procedure _CHECK_READ_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum: bool;

procedure {:inline 1} _LOG_WRITE_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum;



implementation {:inline 1} _LOG_WRITE_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum == _value then true else _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum);
    _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum);
    return;
}



procedure _CHECK_WRITE_$$reduce_kernel.d_psum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$reduce_kernel.d_psum(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum;



implementation {:inline 1} _LOG_ATOMIC_$$reduce_kernel.d_psum(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum);
    return;
}



procedure _CHECK_ATOMIC_$$reduce_kernel.d_psum(_P: bool, _offset: bv32);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum"} {:array "$$reduce_kernel.d_psum"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum := (if _P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum);
    return;
}



const _WATCHED_VALUE_$$reduce_kernel.d_psum2: bv32;

procedure {:inline 1} _LOG_READ_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;



implementation {:inline 1} _LOG_READ_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum2 == _value then true else _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2);
    return;
}



procedure _CHECK_READ_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2: bool;

procedure {:inline 1} _LOG_WRITE_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2, _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2;



implementation {:inline 1} _LOG_WRITE_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum2 == _value then true else _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2);
    _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2);
    return;
}



procedure _CHECK_WRITE_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reduce_kernel.d_psum2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2;



implementation {:inline 1} _LOG_ATOMIC_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2);
    return;
}



procedure _CHECK_ATOMIC_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "d_psum2"} {:array "$$reduce_kernel.d_psum2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2 := (if _P && _WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$reduce_kernel.d_psum2);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums2;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_sums;
    goto anon9;

  anon9:
    havoc $$d_sums2;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$reduce_kernel.d_psum;
    goto anon4;

  anon4:
    havoc $$reduce_kernel.d_psum2;
    goto anon5;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums2;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_sums;
    goto anon9;

  anon9:
    havoc $$d_sums2;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$reduce_kernel.d_psum;
    goto anon4;

  anon4:
    havoc $$reduce_kernel.d_psum2;
    goto anon5;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reduce_kernel.d_psum2;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_sums2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_sums2;
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
    havoc $$d_sums;
    goto anon9;

  anon9:
    havoc $$d_sums2;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$reduce_kernel.d_psum;
    goto anon4;

  anon4:
    havoc $$reduce_kernel.d_psum2;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

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

const {:existential true} _b80: bool;

const {:existential true} _b81: bool;

const {:existential true} _b82: bool;

const {:existential true} _b83: bool;

const {:existential true} _b84: bool;

const {:existential true} _b85: bool;

const {:existential true} _b86: bool;

const {:existential true} _b87: bool;

const {:existential true} _b88: bool;

const {:existential true} _b89: bool;

const {:existential true} _b90: bool;

const {:existential true} _b91: bool;

const {:existential true} _b92: bool;

const {:existential true} _b93: bool;

const {:existential true} _b94: bool;

const {:existential true} _b95: bool;

const {:existential true} _b96: bool;

const {:existential true} _b97: bool;

const {:existential true} _b98: bool;
