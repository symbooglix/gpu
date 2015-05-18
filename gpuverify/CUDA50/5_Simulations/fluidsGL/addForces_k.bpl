type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "v"} {:global} $$v: [bv32]bv8;

axiom {:array_info "$$v"} {:global} {:elem_width 8} {:source_name "v"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v: bool;

axiom {:array_info "$$vterm"} {:elem_width 8} {:source_name "vterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

const _WATCHED_OFFSET: bv32;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "addForces_k"} {:kernel} $_Z11addForces_kP6float2iiiiffij($dx: bv32, $dy: bv32, $spx: bv32, $spy: bv32, $fx: bv32, $fy: bv32, $r: bv32, $pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dy == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $spx == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $spy == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 4} {:thread 1} (if $r == 4bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 5} {:thread 1} (if $pitch == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$v && !_WRITE_HAS_OCCURRED_$$v && !_ATOMIC_HAS_OCCURRED_$$v;
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
  modifies _READ_HAS_OCCURRED_$$v, _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:source_name "addForces_k"} {:kernel} $_Z11addForces_kP6float2iiiiffij($dx: bv32, $dy: bv32, $spx: bv32, $spy: bv32, $fx: bv32, $fy: bv32, $r: bv32, $pitch: bv32)
{
  var v0$1: bv8;
  var v0$2: bv8;
  var v1$1: bv8;
  var v1$2: bv8;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv32;
  var v15$2: bv32;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv32;
  var v20$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
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
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;


  $0:
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v0$1 := $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32))];
    v0$2 := $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32))];
    $$vterm$0bv32$1 := v0$1;
    $$vterm$0bv32$2 := v0$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v1$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)];
    v1$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)];
    $$vterm$1bv32$1 := v1$1;
    $$vterm$1bv32$2 := v1$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v2$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)];
    v2$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)];
    $$vterm$2bv32$1 := v2$1;
    $$vterm$2bv32$2 := v2$2;
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v3$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)];
    v3$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)];
    $$vterm$3bv32$1 := v3$1;
    $$vterm$3bv32$2 := v3$2;
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v4$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)];
    v4$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)];
    $$vterm$4bv32$1 := v4$1;
    $$vterm$4bv32$2 := v4$2;
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v5$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)];
    v5$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)];
    $$vterm$5bv32$1 := v5$1;
    $$vterm$5bv32$2 := v5$2;
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v6$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)];
    v6$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)];
    $$vterm$6bv32$1 := v6$1;
    $$vterm$6bv32$2 := v6$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32), $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v"} true;
    v7$1 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)];
    v7$2 := $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)];
    $$vterm$7bv32$1 := v7$1;
    $$vterm$7bv32$2 := v7$2;
    v8$1 := BV32_SUB(local_id_x$1, $r);
    v8$2 := BV32_SUB(local_id_x$2, $r);
    v9$1 := BV32_SUB(local_id_y$1, $r);
    v9$2 := BV32_SUB(local_id_y$2, $r);
    v10$1 := FDIV32(1065353216bv32, FADD32(FADD32(1065353216bv32, SI32_TO_FP32(BV32_MUL(BV32_MUL(BV32_MUL(v8$1, v8$1), v8$1), v8$1))), SI32_TO_FP32(BV32_MUL(BV32_MUL(BV32_MUL(v9$1, v9$1), v9$1), v9$1))));
    v10$2 := FDIV32(1065353216bv32, FADD32(FADD32(1065353216bv32, SI32_TO_FP32(BV32_MUL(BV32_MUL(BV32_MUL(v8$2, v8$2), v8$2), v8$2))), SI32_TO_FP32(BV32_MUL(BV32_MUL(BV32_MUL(v9$2, v9$2), v9$2), v9$2))));
    v11$1 := $$vterm$0bv32$1;
    v11$2 := $$vterm$0bv32$2;
    v12$1 := $$vterm$1bv32$1;
    v12$2 := $$vterm$1bv32$2;
    v13$1 := $$vterm$2bv32$1;
    v13$2 := $$vterm$2bv32$2;
    v14$1 := $$vterm$3bv32$1;
    v14$2 := $$vterm$3bv32$2;
    v15$1 := FADD32(v14$1 ++ v13$1 ++ v12$1 ++ v11$1, FMUL32(v10$1, $fx));
    v15$2 := FADD32(v14$2 ++ v13$2 ++ v12$2 ++ v11$2, FMUL32(v10$2, $fx));
    $$vterm$0bv32$1 := v15$1[8:0];
    $$vterm$0bv32$2 := v15$2[8:0];
    $$vterm$1bv32$1 := v15$1[16:8];
    $$vterm$1bv32$2 := v15$2[16:8];
    $$vterm$2bv32$1 := v15$1[24:16];
    $$vterm$2bv32$2 := v15$2[24:16];
    $$vterm$3bv32$1 := v15$1[32:24];
    $$vterm$3bv32$2 := v15$2[32:24];
    v16$1 := $$vterm$4bv32$1;
    v16$2 := $$vterm$4bv32$2;
    v17$1 := $$vterm$5bv32$1;
    v17$2 := $$vterm$5bv32$2;
    v18$1 := $$vterm$6bv32$1;
    v18$2 := $$vterm$6bv32$2;
    v19$1 := $$vterm$7bv32$1;
    v19$2 := $$vterm$7bv32$2;
    v20$1 := FADD32(v19$1 ++ v18$1 ++ v17$1 ++ v16$1, FMUL32(v10$1, $fy));
    v20$2 := FADD32(v19$2 ++ v18$2 ++ v17$2 ++ v16$2, FMUL32(v10$2, $fy));
    $$vterm$4bv32$1 := v20$1[8:0];
    $$vterm$4bv32$2 := v20$2[8:0];
    $$vterm$5bv32$1 := v20$1[16:8];
    $$vterm$5bv32$2 := v20$2[16:8];
    $$vterm$6bv32$1 := v20$1[24:16];
    $$vterm$6bv32$2 := v20$2[24:16];
    $$vterm$7bv32$1 := v20$1[32:24];
    $$vterm$7bv32$2 := v20$2[32:24];
    v21$1 := $$vterm$0bv32$1;
    v21$2 := $$vterm$0bv32$2;
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), v21$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32))] := v21$1;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32))] := v21$2;
    v22$1 := $$vterm$1bv32$1;
    v22$2 := $$vterm$1bv32$2;
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32), v22$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32), v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)] := v22$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 1bv32)] := v22$2;
    v23$1 := $$vterm$2bv32$1;
    v23$2 := $$vterm$2bv32$2;
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32), v23$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32), v23$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)] := v23$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 2bv32)] := v23$2;
    v24$1 := $$vterm$3bv32$1;
    v24$2 := $$vterm$3bv32$2;
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32), v24$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32), v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)] := v24$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 3bv32)] := v24$2;
    v25$1 := $$vterm$4bv32$1;
    v25$2 := $$vterm$4bv32$2;
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32), v25$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)] := v25$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 4bv32)] := v25$2;
    v26$1 := $$vterm$5bv32$1;
    v26$2 := $$vterm$5bv32$2;
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32), v26$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)] := v26$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 5bv32)] := v26$2;
    v27$1 := $$vterm$6bv32$1;
    v27$2 := $$vterm$6bv32$2;
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32), v27$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32), v27$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)] := v27$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 6bv32)] := v27$2;
    v28$1 := $$vterm$7bv32$1;
    v28$2 := $$vterm$7bv32$2;
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32), v28$1, $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$v(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32), v28$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $spy), $pitch), BV32_MUL(local_id_x$1, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)] := v28$1;
    $$v[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $spy), $pitch), BV32_MUL(local_id_x$2, 8bv32)), BV32_MUL($spx, 8bv32)), 7bv32)] := v28$2;
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 9bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 9bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$vterm$0bv32$1: bv8;

var $$vterm$0bv32$2: bv8;

var $$vterm$1bv32$1: bv8;

var $$vterm$1bv32$2: bv8;

var $$vterm$2bv32$1: bv8;

var $$vterm$2bv32$2: bv8;

var $$vterm$3bv32$1: bv8;

var $$vterm$3bv32$2: bv8;

var $$vterm$4bv32$1: bv8;

var $$vterm$4bv32$2: bv8;

var $$vterm$5bv32$1: bv8;

var $$vterm$5bv32$2: bv8;

var $$vterm$6bv32$1: bv8;

var $$vterm$6bv32$2: bv8;

var $$vterm$7bv32$1: bv8;

var $$vterm$7bv32$2: bv8;

const _WATCHED_VALUE_$$v: bv8;

procedure {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _READ_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_READ_$$v(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v: bool;

procedure {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _WRITE_HAS_OCCURRED_$$v);
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



procedure _CHECK_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_ATOMIC_$$v(_P: bool, _offset: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
