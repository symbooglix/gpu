type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "data"} {:global} $$data: [bv32]bv32;

axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "s_data"} {:group_shared} $$scan_inter1_kernel.s_data: [bv1][bv32]bv32;

axiom {:array_info "$$scan_inter1_kernel.s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "544"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "scan_inter1_kernel"} {:kernel} $scan_inter1_kernel($iter: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $iter == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data && !_WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data && !_ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
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
  modifies $$scan_inter1_kernel.s_data, _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data, $$data, _TRACKING, _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _TRACKING;



implementation {:source_name "scan_inter1_kernel"} {:kernel} $scan_inter1_kernel($iter: bv32)
{
  var $stride.0: bv32;
  var $d.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
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
  var v12: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $iter), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $iter), 1bv32);
    v1$2 := BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $iter), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $iter), 1bv32);
    v2$1 := BV32_ADD(v1$1, $iter);
    v2$2 := BV32_ADD(v1$2, $iter);
    v3$1 := BV32_MUL(2bv32, v0$1);
    v3$2 := BV32_MUL(2bv32, v0$2);
    v4$1 := BV32_MUL(2bv32, v0$1);
    v4$2 := BV32_MUL(2bv32, v0$2);
    v5$1 := BV32_ADD(v4$1, 1bv32);
    v5$2 := BV32_ADD(v4$2, 1bv32);
    v6$1 := BV32_ADD(4bv32, v3$1);
    v6$2 := BV32_ADD(4bv32, v3$2);
    v7$1 := BV32_ADD(v3$1, BV32_LSHR(BV32_LSHR(v3$1, BV32_AND((if BV32_ULT(v6$1, 24bv32) then v6$1 else 24bv32), 31bv32)), 8bv32));
    v7$2 := BV32_ADD(v3$2, BV32_LSHR(BV32_LSHR(v3$2, BV32_AND((if BV32_ULT(v6$2, 24bv32) then v6$2 else 24bv32), 31bv32)), 8bv32));
    v8$1 := BV32_ADD(v4$1, 5bv32);
    v8$2 := BV32_ADD(v4$2, 5bv32);
    v9$1 := BV32_ADD(v5$1, BV32_LSHR(BV32_LSHR(v5$1, BV32_AND((if BV32_ULT(v8$1, 24bv32) then v8$1 else 24bv32), 31bv32)), 8bv32));
    v9$2 := BV32_ADD(v5$2, BV32_LSHR(BV32_LSHR(v5$2, BV32_AND((if BV32_ULT(v8$2, 24bv32) then v8$2 else 24bv32), 31bv32)), 8bv32));
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$data(true, v1$1, $$data[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$data(true, v1$2, $$data[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v10$1 := $$data[v1$1];
    v10$2 := $$data[v1$2];
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$scan_inter1_kernel.s_data(true, v7$1, v10$1, $$scan_inter1_kernel.s_data[1bv1][v7$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data(true, v7$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$scan_inter1_kernel.s_data(true, v7$2, v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter1_kernel.s_data"} true;
    $$scan_inter1_kernel.s_data[1bv1][v7$1] := v10$1;
    $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2] := v10$2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$data(true, v2$1, $$data[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$data(true, v2$2, $$data[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v11$1 := $$data[v2$1];
    v11$2 := $$data[v2$2];
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$scan_inter1_kernel.s_data(true, v9$1, v11$1, $$scan_inter1_kernel.s_data[1bv1][v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data(true, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$scan_inter1_kernel.s_data(true, v9$2, v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter1_kernel.s_data"} true;
    $$scan_inter1_kernel.s_data[1bv1][v9$1] := v11$1;
    $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] := v11$2;
    $stride.0, $d.0 := 1bv32, group_size_x;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b45 ==> _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $stride.0), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0));
    assert {:tag "accessBreak"} _b44 ==> _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $stride.0), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0));
    assert {:tag "accessBreak"} _b43 ==> _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $stride.0), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0));
    assert {:tag "accessBreak"} _b42 ==> _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $stride.0), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0)), BV32_DIV(BV32_MUL(local_id_x$1, $stride.0), $stride.0));
    assert {:tag "nowrite"} _b41 ==> !_WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assert {:tag "noread"} _b40 ==> !_READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assert {:tag "relationalPow2"} _b39 ==> ($d.0 == 0bv32 && $stride.0 == 2bv32) || BV32_MUL($stride.0, $d.0) == 1bv32;
    assert {:tag "relationalPow2"} _b38 ==> BV32_MUL($stride.0, $d.0) == 1bv32;
    assert {:tag "relationalPow2"} _b37 ==> ($d.0 == 0bv32 && $stride.0 == 4bv32) || BV32_MUL($stride.0, $d.0) == 2bv32;
    assert {:tag "relationalPow2"} _b36 ==> BV32_MUL($stride.0, $d.0) == 2bv32;
    assert {:tag "relationalPow2"} _b35 ==> ($d.0 == 0bv32 && $stride.0 == 8bv32) || BV32_MUL($stride.0, $d.0) == 4bv32;
    assert {:tag "relationalPow2"} _b34 ==> BV32_MUL($stride.0, $d.0) == 4bv32;
    assert {:tag "relationalPow2"} _b33 ==> ($d.0 == 0bv32 && $stride.0 == 16bv32) || BV32_MUL($stride.0, $d.0) == 8bv32;
    assert {:tag "relationalPow2"} _b32 ==> BV32_MUL($stride.0, $d.0) == 8bv32;
    assert {:tag "relationalPow2"} _b31 ==> ($d.0 == 0bv32 && $stride.0 == 32bv32) || BV32_MUL($stride.0, $d.0) == 16bv32;
    assert {:tag "relationalPow2"} _b30 ==> BV32_MUL($stride.0, $d.0) == 16bv32;
    assert {:tag "relationalPow2"} _b29 ==> ($d.0 == 0bv32 && $stride.0 == 64bv32) || BV32_MUL($stride.0, $d.0) == 32bv32;
    assert {:tag "relationalPow2"} _b28 ==> BV32_MUL($stride.0, $d.0) == 32bv32;
    assert {:tag "relationalPow2"} _b27 ==> ($d.0 == 0bv32 && $stride.0 == 128bv32) || BV32_MUL($stride.0, $d.0) == 64bv32;
    assert {:tag "relationalPow2"} _b26 ==> BV32_MUL($stride.0, $d.0) == 64bv32;
    assert {:tag "relationalPow2"} _b25 ==> ($d.0 == 0bv32 && $stride.0 == 256bv32) || BV32_MUL($stride.0, $d.0) == 128bv32;
    assert {:tag "relationalPow2"} _b24 ==> BV32_MUL($stride.0, $d.0) == 128bv32;
    assert {:tag "relationalPow2"} _b23 ==> ($d.0 == 0bv32 && $stride.0 == 512bv32) || BV32_MUL($stride.0, $d.0) == 256bv32;
    assert {:tag "relationalPow2"} _b22 ==> BV32_MUL($stride.0, $d.0) == 256bv32;
    assert {:tag "relationalPow2"} _b21 ==> ($d.0 == 0bv32 && $stride.0 == 1024bv32) || BV32_MUL($stride.0, $d.0) == 512bv32;
    assert {:tag "relationalPow2"} _b20 ==> BV32_MUL($stride.0, $d.0) == 512bv32;
    assert {:tag "relationalPow2"} _b19 ==> ($d.0 == 0bv32 && $stride.0 == 2048bv32) || BV32_MUL($stride.0, $d.0) == 1024bv32;
    assert {:tag "relationalPow2"} _b18 ==> BV32_MUL($stride.0, $d.0) == 1024bv32;
    assert {:tag "relationalPow2"} _b17 ==> ($d.0 == 0bv32 && $stride.0 == 4096bv32) || BV32_MUL($stride.0, $d.0) == 2048bv32;
    assert {:tag "relationalPow2"} _b16 ==> BV32_MUL($stride.0, $d.0) == 2048bv32;
    assert {:tag "relationalPow2"} _b15 ==> ($d.0 == 0bv32 && $stride.0 == 8192bv32) || BV32_MUL($stride.0, $d.0) == 4096bv32;
    assert {:tag "relationalPow2"} _b14 ==> BV32_MUL($stride.0, $d.0) == 4096bv32;
    assert {:tag "relationalPow2"} _b13 ==> ($d.0 == 0bv32 && $stride.0 == 16384bv32) || BV32_MUL($stride.0, $d.0) == 8192bv32;
    assert {:tag "relationalPow2"} _b12 ==> BV32_MUL($stride.0, $d.0) == 8192bv32;
    assert {:tag "relationalPow2"} _b11 ==> ($d.0 == 0bv32 && $stride.0 == 32768bv32) || BV32_MUL($stride.0, $d.0) == 16384bv32;
    assert {:tag "relationalPow2"} _b10 ==> BV32_MUL($stride.0, $d.0) == 16384bv32;
    assert {:tag "relationalPow2"} _b9 ==> ($d.0 == 0bv32 && $stride.0 == 65536bv32) || BV32_MUL($stride.0, $d.0) == 32768bv32;
    assert {:tag "relationalPow2"} _b8 ==> BV32_MUL($stride.0, $d.0) == 32768bv32;
    assert {:tag "pow2NotZero"} _b7 ==> $d.0 != 0bv32;
    assert {:tag "pow2"} _b6 ==> $d.0 == 0bv32 || BV32_AND($d.0, BV32_SUB($d.0, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b5 ==> $stride.0 != 0bv32;
    assert {:tag "pow2"} _b4 ==> $stride.0 == 0bv32 || BV32_AND($stride.0, BV32_SUB($stride.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($d.0, group_size_x);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($d.0, group_size_x);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v12 := BV32_UGT($d.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto __partitioned_block_$truebb_0, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v12 && !v12;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 16} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$scan_inter1_kernel.s_data(true, v7$1, $$scan_inter1_kernel.s_data[1bv1][v7$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$scan_inter1_kernel.s_data(true, v7$2, $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter1_kernel.s_data"} true;
    v21$1 := $$scan_inter1_kernel.s_data[1bv1][v7$1];
    v21$2 := $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2];
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$data(true, v1$1, v21$1, $$data[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$data(true, v1$2, v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v1$1] := v21$1;
    $$data[v1$2] := v21$2;
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$scan_inter1_kernel.s_data(true, v9$1, $$scan_inter1_kernel.s_data[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$scan_inter1_kernel.s_data(true, v9$2, $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter1_kernel.s_data"} true;
    v22$1 := $$scan_inter1_kernel.s_data[1bv1][v9$1];
    v22$2 := $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2];
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$data(true, v2$1, v22$1, $$data[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$data(true, v2$2, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v2$1] := v22$1;
    $$data[v2$2] := v22$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v12 && v12;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v13$1 := BV32_ULT(v0$1, $d.0);
    v13$2 := BV32_ULT(v0$2, $d.0);
    p1$1 := (if v13$1 then v13$1 else p1$1);
    p1$2 := (if v13$2 then v13$2 else p1$2);
    v14$1 := (if p1$1 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $stride.0), v0$1), $stride.0), 1bv32) else v14$1);
    v14$2 := (if p1$2 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $stride.0), v0$2), $stride.0), 1bv32) else v14$2);
    v15$1 := (if p1$1 then BV32_ADD(v14$1, $stride.0) else v15$1);
    v15$2 := (if p1$2 then BV32_ADD(v14$2, $stride.0) else v15$2);
    v16$1 := (if p1$1 then BV32_ADD(4bv32, v14$1) else v16$1);
    v16$2 := (if p1$2 then BV32_ADD(4bv32, v14$2) else v16$2);
    v17$1 := (if p1$1 then BV32_ADD(4bv32, v15$1) else v17$1);
    v17$2 := (if p1$2 then BV32_ADD(4bv32, v15$2) else v17$2);
    v18$1 := (if p1$1 then BV32_ADD(v15$1, BV32_LSHR(BV32_LSHR(v15$1, BV32_AND((if BV32_ULT(v17$1, 24bv32) then v17$1 else 24bv32), 31bv32)), 8bv32)) else v18$1);
    v18$2 := (if p1$2 then BV32_ADD(v15$2, BV32_LSHR(BV32_LSHR(v15$2, BV32_AND((if BV32_ULT(v17$2, 24bv32) then v17$2 else 24bv32), 31bv32)), 8bv32)) else v18$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$scan_inter1_kernel.s_data(p1$1, BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32)), $$scan_inter1_kernel.s_data[1bv1][BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$scan_inter1_kernel.s_data(p1$2, BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32)), $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter1_kernel.s_data"} true;
    v19$1 := (if p1$1 then $$scan_inter1_kernel.s_data[1bv1][BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32))] else v19$1);
    v19$2 := (if p1$2 then $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32))] else v19$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$scan_inter1_kernel.s_data(p1$1, v18$1, $$scan_inter1_kernel.s_data[1bv1][v18$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$scan_inter1_kernel.s_data(p1$2, v18$2, $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter1_kernel.s_data"} true;
    v20$1 := (if p1$1 then $$scan_inter1_kernel.s_data[1bv1][v18$1] else v20$1);
    v20$2 := (if p1$2 then $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] else v20$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$scan_inter1_kernel.s_data(p1$1, v18$1, BV32_ADD(v20$1, v19$1), $$scan_inter1_kernel.s_data[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data(p1$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$scan_inter1_kernel.s_data(p1$2, v18$2, BV32_ADD(v20$2, v19$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter1_kernel.s_data"} true;
    $$scan_inter1_kernel.s_data[1bv1][v18$1] := (if p1$1 then BV32_ADD(v20$1, v19$1) else $$scan_inter1_kernel.s_data[1bv1][v18$1]);
    $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p1$2 then BV32_ADD(v20$2, v19$2) else $$scan_inter1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    $stride.0, $d.0 := BV32_MUL($stride.0, 2bv32), BV32_LSHR($d.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$scan_inter1_kernel.s_data, $$data, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$scan_inter1_kernel.s_data, $$data, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$data: bv32;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32);
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



const _WATCHED_VALUE_$$scan_inter1_kernel.s_data: bv32;

procedure {:inline 1} _LOG_READ_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data;



implementation {:inline 1} _LOG_READ_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter1_kernel.s_data == _value then true else _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data);
    return;
}



procedure _CHECK_READ_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data;



implementation {:inline 1} _LOG_WRITE_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter1_kernel.s_data == _value then true else _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data);
    _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter1_kernel.s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data);
    return;
}



procedure _CHECK_WRITE_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter1_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter1_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data;



implementation {:inline 1} _LOG_ATOMIC_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data);
    return;
}



procedure _CHECK_ATOMIC_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter1_kernel.s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data := (if _P && _WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$scan_inter1_kernel.s_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
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
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_inter1_kernel.s_data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_inter1_kernel.s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
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
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_inter1_kernel.s_data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b4: bool;

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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

const {:existential true} _b45: bool;
