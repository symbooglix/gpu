type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$T"} {:global} {:elem_width 32} {:source_name "T"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$T: bool;

var {:source_name "RKLOW"} {:global} $$RKLOW: [bv32]bv32;

axiom {:array_info "$$RKLOW"} {:global} {:elem_width 32} {:source_name "RKLOW"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RKLOW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RKLOW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RKLOW: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FEXP32(bv32) : bv32;

function FLOG32(bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "ratt10_kernel"} {:kernel} $ratt10_kernel($TCONV: bv32);
  requires !_READ_HAS_OCCURRED_$$T && !_WRITE_HAS_OCCURRED_$$T && !_ATOMIC_HAS_OCCURRED_$$T;
  requires !_READ_HAS_OCCURRED_$$RKLOW && !_WRITE_HAS_OCCURRED_$$RKLOW && !_ATOMIC_HAS_OCCURRED_$$RKLOW;
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
  modifies _WRITE_HAS_OCCURRED_$$RKLOW, _WRITE_READ_BENIGN_FLAG_$$RKLOW, _WRITE_READ_BENIGN_FLAG_$$RKLOW;



implementation {:source_name "ratt10_kernel"} {:kernel} $ratt10_kernel($TCONV: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    havoc v0$1, v0$2;
    v1$1 := FMUL32(v0$1, $TCONV);
    v1$2 := FMUL32(v0$2, $TCONV);
    v2$1 := FMUL32(FLOG32(v1$1), 1060205080bv32);
    v2$2 := FMUL32(FLOG32(v1$2), 1060205080bv32);
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$RKLOW(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), FEXP32(FMUL32(FADD32(FMUL32(1146478073bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3211159142bv32, v2$1), 1109990950bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), FEXP32(FMUL32(FADD32(FMUL32(1146478073bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3211159142bv32, v2$2), 1109990950bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)] := FEXP32(FMUL32(FADD32(FMUL32(1146478073bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3211159142bv32, v2$1), 1109990950bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)] := FEXP32(FMUL32(FADD32(FMUL32(1146478073bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3211159142bv32, v2$2), 1109990950bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$RKLOW(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3341143635bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3227181384bv32, v2$1), 1115630636bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3341143635bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3227181384bv32, v2$2), 1115630636bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3341143635bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3227181384bv32, v2$1), 1115630636bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3341143635bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3227181384bv32, v2$2), 1115630636bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$RKLOW(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3295907471bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3228523561bv32, v2$1), 1115876481bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3295907471bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3228523561bv32, v2$2), 1115876481bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3295907471bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3228523561bv32, v2$1), 1115876481bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3295907471bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3228523561bv32, v2$2), 1115876481bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$RKLOW(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3291694428bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3223616225bv32, v2$1), 1113472931bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3291694428bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3223616225bv32, v2$2), 1113472931bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3291694428bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3223616225bv32, v2$1), 1113472931bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3291694428bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3223616225bv32, v2$2), 1113472931bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$RKLOW(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3290086711bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3226006979bv32, v2$1), 1115510000bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3290086711bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3226006979bv32, v2$2), 1115510000bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3290086711bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3226006979bv32, v2$1), 1115510000bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3290086711bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3226006979bv32, v2$2), 1115510000bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$RKLOW(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3311346984bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231941919bv32, v2$1), 1117385503bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3311346984bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231941919bv32, v2$2), 1117385503bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3311346984bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231941919bv32, v2$1), 1117385503bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3311346984bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231941919bv32, v2$2), 1117385503bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$RKLOW(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3308183080bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231291802bv32, v2$1), 1116453734bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3308183080bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231291802bv32, v2$2), 1116453734bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3308183080bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231291802bv32, v2$1), 1116453734bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3308183080bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231291802bv32, v2$2), 1116453734bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$RKLOW(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3298392872bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231207916bv32, v2$1), 1117374691bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3298392872bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231207916bv32, v2$2), 1117374691bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3298392872bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3231207916bv32, v2$1), 1117374691bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3298392872bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3231207916bv32, v2$2), 1117374691bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$RKLOW(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3307234939bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239667827bv32, v2$1), 1121886214bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3307234939bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239667827bv32, v2$2), 1121886214bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3307234939bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239667827bv32, v2$1), 1121886214bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3307234939bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239667827bv32, v2$2), 1121886214bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$RKLOW(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3309543455bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239753810bv32, v2$1), 1122461317bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3309543455bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239753810bv32, v2$2), 1122461317bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3309543455bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239753810bv32, v2$1), 1122461317bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3309543455bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239753810bv32, v2$2), 1122461317bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$RKLOW(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3334693821bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3206797066bv32, v2$1), 1108196685bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3334693821bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3206797066bv32, v2$2), 1108196685bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3334693821bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3206797066bv32, v2$1), 1108196685bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3334693821bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3206797066bv32, v2$2), 1108196685bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$RKLOW(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3331112198bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3227097498bv32, v2$1), 1115452016bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3331112198bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3227097498bv32, v2$2), 1115452016bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3331112198bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3227097498bv32, v2$1), 1115452016bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3331112198bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3227097498bv32, v2$2), 1115452016bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$RKLOW(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3317375546bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3237247713bv32, v2$1), 1119845219bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3317375546bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3237247713bv32, v2$2), 1119845219bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3317375546bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3237247713bv32, v2$1), 1119845219bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3317375546bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3237247713bv32, v2$2), 1119845219bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$RKLOW(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3302020541bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3229026877bv32, v2$1), 1116394491bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3302020541bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3229026877bv32, v2$2), 1116394491bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3302020541bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3229026877bv32, v2$1), 1116394491bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3302020541bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3229026877bv32, v2$2), 1116394491bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$RKLOW(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3315180188bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3242134077bv32, v2$1), 1124532326bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3315180188bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3242134077bv32, v2$2), 1124532326bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3315180188bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3242134077bv32, v2$1), 1124532326bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3315180188bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3242134077bv32, v2$2), 1124532326bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$RKLOW(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3306410469bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3236528390bv32, v2$1), 1119282722bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3306410469bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3236528390bv32, v2$2), 1119282722bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3306410469bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3236528390bv32, v2$1), 1119282722bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3306410469bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3236528390bv32, v2$2), 1119282722bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$RKLOW(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3343141687bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239376323bv32, v2$1), 1122641532bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3343141687bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239376323bv32, v2$2), 1122641532bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3343141687bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3239376323bv32, v2$1), 1122641532bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3343141687bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3239376323bv32, v2$2), 1122641532bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$RKLOW(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3311089337bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3237205770bv32, v2$1), 1119995939bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3311089337bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3237205770bv32, v2$2), 1119995939bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3311089337bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3237205770bv32, v2$1), 1119995939bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3311089337bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3237205770bv32, v2$2), 1119995939bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$RKLOW(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3310501902bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3236073308bv32, v2$1), 1119760433bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3310501902bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3236073308bv32, v2$2), 1119760433bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3310501902bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3236073308bv32, v2$1), 1119760433bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3310501902bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3236073308bv32, v2$2), 1119760433bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$RKLOW(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3309023627bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3242196992bv32, v2$1), 1124757687bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3309023627bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3242196992bv32, v2$2), 1124757687bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3309023627bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3242196992bv32, v2$1), 1124757687bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3309023627bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3242196992bv32, v2$2), 1124757687bv32)), 1069066811bv32));
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$RKLOW(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FMUL32(3311151172bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3235192504bv32, v2$1), 1119005234bv32)), 1069066811bv32)), $$RKLOW[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$RKLOW(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FMUL32(3311151172bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3235192504bv32, v2$2), 1119005234bv32)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RKLOW"} true;
    $$RKLOW[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FEXP32(FMUL32(FADD32(FMUL32(3311151172bv32, FDIV32(1065353216bv32, v1$1)), FADD32(FMUL32(3235192504bv32, v2$1), 1119005234bv32)), 1069066811bv32));
    $$RKLOW[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FEXP32(FMUL32(FADD32(FMUL32(3311151172bv32, FDIV32(1065353216bv32, v1$2)), FADD32(FMUL32(3235192504bv32, v2$2), 1119005234bv32)), 1069066811bv32));
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 108bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$T: bv32;

procedure {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _READ_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$T);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$T: bool;

procedure {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$T, _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _WRITE_HAS_OCCURRED_$$T);
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



procedure _CHECK_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_ATOMIC_$$T(_P: bool, _offset: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



const _WATCHED_VALUE_$$RKLOW: bv32;

procedure {:inline 1} _LOG_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RKLOW;



implementation {:inline 1} _LOG_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then true else _READ_HAS_OCCURRED_$$RKLOW);
    return;
}



procedure _CHECK_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RKLOW);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RKLOW: bool;

procedure {:inline 1} _LOG_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RKLOW, _WRITE_READ_BENIGN_FLAG_$$RKLOW;



implementation {:inline 1} _LOG_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then true else _WRITE_HAS_OCCURRED_$$RKLOW);
    _WRITE_READ_BENIGN_FLAG_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RKLOW);
    return;
}



procedure _CHECK_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW != _value);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW != _value);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RKLOW(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RKLOW;



implementation {:inline 1} _LOG_ATOMIC_$$RKLOW(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RKLOW);
    return;
}



procedure _CHECK_ATOMIC_$$RKLOW(_P: bool, _offset: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RKLOW;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RKLOW := (if _P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RKLOW);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
