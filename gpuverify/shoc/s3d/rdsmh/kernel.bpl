type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "T"} {:global} $$T: [bv32]bv32;

axiom {:array_info "$$T"} {:global} {:elem_width 32} {:source_name "T"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$T: bool;

var {:source_name "EG"} {:global} $$EG: [bv32]bv32;

axiom {:array_info "$$EG"} {:global} {:elem_width 32} {:source_name "EG"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$EG: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$EG: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$EG: bool;

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

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "rdsmh_kernel"} {:kernel} $rdsmh_kernel($TCONV: bv32);
  requires !_READ_HAS_OCCURRED_$$T && !_WRITE_HAS_OCCURRED_$$T && !_ATOMIC_HAS_OCCURRED_$$T;
  requires !_READ_HAS_OCCURRED_$$EG && !_WRITE_HAS_OCCURRED_$$EG && !_ATOMIC_HAS_OCCURRED_$$EG;
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
  modifies _WRITE_HAS_OCCURRED_$$EG, _WRITE_READ_BENIGN_FLAG_$$EG, _WRITE_READ_BENIGN_FLAG_$$EG;



implementation {:source_name "rdsmh_kernel"} {:kernel} $rdsmh_kernel($TCONV: bv32)
{
  var v4$1: bool;
  var v4$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := $$T[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)];
    v0$2 := $$T[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)];
    v1$1 := FMUL32(v0$1, $TCONV);
    v1$2 := FMUL32(v0$2, $TCONV);
    v2$1 := FDIV32(1065353216bv32, v1$1);
    v2$2 := FDIV32(1065353216bv32, v1$2);
    v3$1 := FP64_CONV32(FSUB64(FP32_CONV64(FMUL32(FLOG32(v1$1), 1060205080bv32)), 4607182418800017408bv64));
    v3$2 := FP64_CONV32(FSUB64(FP32_CONV64(FMUL32(FLOG32(v1$2), 1060205080bv32)), 4607182418800017408bv64));
    v4$1 := FLT32(1148846080bv32, v1$1);
    v4$2 := FLT32(1148846080bv32, v1$2);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$EG(p0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079350779bv32, v3$1), FADD32(FMUL32(1148029484bv32, v2$1), 3226279706bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(646991001bv32, v1$1), 2911084450bv32), v1$1), 867353398bv32), v1$1), 3083810176bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079350779bv32, v3$2), FADD32(FMUL32(1148029484bv32, v2$2), 3226279706bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(646991001bv32, v1$2), 2911084450bv32), v1$2), 867353398bv32), v1$2), 3083810176bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079350779bv32, v3$1), FADD32(FMUL32(1148029484bv32, v2$1), 3226279706bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(646991001bv32, v1$1), 2911084450bv32), v1$1), 867353398bv32), v1$1), 3083810176bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079350779bv32, v3$2), FADD32(FMUL32(1148029484bv32, v2$2), 3226279706bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(646991001bv32, v1$2), 2911084450bv32), v1$2), 867353398bv32), v1$2), 3083810176bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)]);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$EG(p0$1, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$1), FADD32(FMUL32(3334931282bv32, v2$1), 3202659231bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(435218904bv32, v1$1), 2699619754bv32), v1$1), 658638728bv32), v1$1), 2907376951bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$2), FADD32(FMUL32(3334931282bv32, v2$2), 3202659231bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(435218904bv32, v1$2), 2699619754bv32), v1$2), 658638728bv32), v1$2), 2907376951bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$1), FADD32(FMUL32(3334931282bv32, v2$1), 3202659231bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(435218904bv32, v1$1), 2699619754bv32), v1$1), 658638728bv32), v1$1), 2907376951bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$2), FADD32(FMUL32(3334931282bv32, v2$2), 3202659231bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(435218904bv32, v1$2), 2699619754bv32), v1$2), 658638728bv32), v1$2), 2907376951bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$EG(p0$1, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076130148bv32, v3$1), FADD32(FMUL32(3336848168bv32, v2$1), 1083775309bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(613260827bv32, v1$1), 2875914947bv32), v1$1), 837826839bv32), v1$1), 3090435328bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076130148bv32, v3$2), FADD32(FMUL32(3336848168bv32, v2$2), 1083775309bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(613260827bv32, v1$2), 2875914947bv32), v1$2), 837826839bv32), v1$2), 3090435328bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076130148bv32, v3$1), FADD32(FMUL32(3336848168bv32, v2$1), 1083775309bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(613260827bv32, v1$1), 2875914947bv32), v1$1), 837826839bv32), v1$1), 3090435328bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076130148bv32, v3$2), FADD32(FMUL32(3336848168bv32, v2$2), 1083775309bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(613260827bv32, v1$2), 2875914947bv32), v1$2), 837826839bv32), v1$2), 3090435328bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$EG(p0$1, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079121178bv32, v3$1), FADD32(FMUL32(1149767334bv32, v2$1), 1085178079bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795252064bv32, v1$1), 765037349bv32), v1$1), 3020399799bv32), v1$1), 977429545bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079121178bv32, v3$2), FADD32(FMUL32(1149767334bv32, v2$2), 1085178079bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795252064bv32, v1$2), 765037349bv32), v1$2), 3020399799bv32), v1$2), 977429545bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079121178bv32, v3$1), FADD32(FMUL32(1149767334bv32, v2$1), 1085178079bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795252064bv32, v1$1), 765037349bv32), v1$1), 3020399799bv32), v1$1), 977429545bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079121178bv32, v3$2), FADD32(FMUL32(1149767334bv32, v2$2), 1085178079bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795252064bv32, v1$2), 765037349bv32), v1$2), 3020399799bv32), v1$2), 977429545bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$EG(p0$1, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078325727bv32, v3$1), FADD32(FMUL32(3312528003bv32, v2$1), 1083130136bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(640234885bv32, v1$1), 2902519345bv32), v1$1), 850730152bv32), v1$1), 965723263bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078325727bv32, v3$2), FADD32(FMUL32(3312528003bv32, v2$2), 1083130136bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(640234885bv32, v1$2), 2902519345bv32), v1$2), 850730152bv32), v1$2), 965723263bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078325727bv32, v3$1), FADD32(FMUL32(3312528003bv32, v2$1), 1083130136bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(640234885bv32, v1$1), 2902519345bv32), v1$1), 850730152bv32), v1$1), 965723263bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078325727bv32, v3$2), FADD32(FMUL32(3312528003bv32, v2$2), 1083130136bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(640234885bv32, v1$2), 2902519345bv32), v1$2), 850730152bv32), v1$2), 965723263bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$EG(p0$1, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078078703bv32, v3$1), FADD32(FMUL32(1189767320bv32, v2$1), 1084157896bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645031735bv32, v1$1), 2903393243bv32), v1$1), 3001738551bv32), v1$1), 982428320bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078078703bv32, v3$2), FADD32(FMUL32(1189767320bv32, v2$2), 1084157896bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645031735bv32, v1$2), 2903393243bv32), v1$2), 3001738551bv32), v1$2), 982428320bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078078703bv32, v3$1), FADD32(FMUL32(1189767320bv32, v2$1), 1084157896bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645031735bv32, v1$1), 2903393243bv32), v1$1), 3001738551bv32), v1$1), 982428320bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078078703bv32, v3$2), FADD32(FMUL32(1189767320bv32, v2$2), 1084157896bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645031735bv32, v1$2), 2903393243bv32), v1$2), 3001738551bv32), v1$2), 982428320bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$EG(p0$1, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082166526bv32, v3$1), FADD32(FMUL32(3269441187bv32, v2$1), 1081229085bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2786820921bv32, v1$1), 757562537bv32), v1$1), 3017984907bv32), v1$1), 982698482bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082166526bv32, v3$2), FADD32(FMUL32(3269441187bv32, v2$2), 1081229085bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2786820921bv32, v1$2), 757562537bv32), v1$2), 3017984907bv32), v1$2), 982698482bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082166526bv32, v3$1), FADD32(FMUL32(3269441187bv32, v2$1), 1081229085bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2786820921bv32, v1$1), 757562537bv32), v1$1), 3017984907bv32), v1$1), 982698482bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082166526bv32, v3$2), FADD32(FMUL32(3269441187bv32, v2$2), 1081229085bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2786820921bv32, v1$2), 757562537bv32), v1$2), 3017984907bv32), v1$2), 982698482bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$EG(p0$1, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082476468bv32, v3$1), FADD32(FMUL32(1183550355bv32, v2$1), 1077584463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2798613941bv32, v1$1), 772278918bv32), v1$1), 3031048762bv32), v1$1), 992007666bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082476468bv32, v3$2), FADD32(FMUL32(1183550355bv32, v2$2), 1077584463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2798613941bv32, v1$2), 772278918bv32), v1$2), 3031048762bv32), v1$2), 992007666bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082476468bv32, v3$1), FADD32(FMUL32(1183550355bv32, v2$1), 1077584463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2798613941bv32, v1$1), 772278918bv32), v1$1), 3031048762bv32), v1$1), 992007666bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082476468bv32, v3$2), FADD32(FMUL32(1183550355bv32, v2$2), 1077584463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2798613941bv32, v1$2), 772278918bv32), v1$2), 3031048762bv32), v1$2), 992007666bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$EG(p0$1, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077426372bv32, v3$1), FADD32(FMUL32(3347755576bv32, v2$1), 1085244661bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645775828bv32, v1$1), 2906625829bv32), v1$1), 852413412bv32), v1$1), 972981482bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077426372bv32, v3$2), FADD32(FMUL32(3347755576bv32, v2$2), 1085244661bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645775828bv32, v1$2), 2906625829bv32), v1$2), 852413412bv32), v1$2), 972981482bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077426372bv32, v3$1), FADD32(FMUL32(3347755576bv32, v2$1), 1085244661bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645775828bv32, v1$1), 2906625829bv32), v1$1), 852413412bv32), v1$1), 972981482bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077426372bv32, v3$2), FADD32(FMUL32(3347755576bv32, v2$2), 1085244661bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(645775828bv32, v1$2), 2906625829bv32), v1$2), 852413412bv32), v1$2), 972981482bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$EG(p0$1, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077408070bv32, v3$1), FADD32(FMUL32(3342120859bv32, v2$1), 1086683754bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2793883040bv32, v1$1), 767473328bv32), v1$1), 3028034565bv32), v1$1), 988782616bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077408070bv32, v3$2), FADD32(FMUL32(3342120859bv32, v2$2), 1086683754bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2793883040bv32, v1$2), 767473328bv32), v1$2), 3028034565bv32), v1$2), 988782616bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077408070bv32, v3$1), FADD32(FMUL32(3342120859bv32, v2$1), 1086683754bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2793883040bv32, v1$1), 767473328bv32), v1$1), 3028034565bv32), v1$1), 988782616bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1077408070bv32, v3$2), FADD32(FMUL32(3342120859bv32, v2$2), 1086683754bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2793883040bv32, v1$2), 767473328bv32), v1$2), 3028034565bv32), v1$2), 988782616bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$EG(p0$1, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074966722bv32, v3$1), FADD32(FMUL32(3343314432bv32, v2$1), 1091175975bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801060508bv32, v1$1), 773401095bv32), v1$1), 3031696901bv32), v1$1), 991465576bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074966722bv32, v3$2), FADD32(FMUL32(3343314432bv32, v2$2), 1091175975bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801060508bv32, v1$2), 773401095bv32), v1$2), 3031696901bv32), v1$2), 991465576bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074966722bv32, v3$1), FADD32(FMUL32(3343314432bv32, v2$1), 1091175975bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801060508bv32, v1$1), 773401095bv32), v1$1), 3031696901bv32), v1$1), 991465576bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074966722bv32, v3$2), FADD32(FMUL32(3343314432bv32, v2$2), 1091175975bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801060508bv32, v1$2), 773401095bv32), v1$2), 3031696901bv32), v1$2), 991465576bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$EG(p0$1, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074940211bv32, v3$1), FADD32(FMUL32(3330477867bv32, v2$1), 1091022432bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804436835bv32, v1$1), 777671195bv32), v1$1), 3037045885bv32), v1$1), 997014704bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074940211bv32, v3$2), FADD32(FMUL32(3330477867bv32, v2$2), 1091022432bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804436835bv32, v1$2), 777671195bv32), v1$2), 3037045885bv32), v1$2), 997014704bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074940211bv32, v3$1), FADD32(FMUL32(3330477867bv32, v2$1), 1091022432bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804436835bv32, v1$1), 777671195bv32), v1$1), 3037045885bv32), v1$1), 997014704bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074940211bv32, v3$2), FADD32(FMUL32(3330477867bv32, v2$2), 1091022432bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804436835bv32, v1$2), 777671195bv32), v1$2), 3037045885bv32), v1$2), 997014704bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$EG(p0$1, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1033456574bv32, v3$1), FADD32(FMUL32(1175712097bv32, v2$1), 1100185505bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2813815293bv32, v1$1), 786438779bv32), v1$1), 3045080555bv32), v1$1), 1004234164bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1033456574bv32, v3$2), FADD32(FMUL32(1175712097bv32, v2$2), 1100185505bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2813815293bv32, v1$2), 786438779bv32), v1$2), 3045080555bv32), v1$2), 1004234164bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1033456574bv32, v3$1), FADD32(FMUL32(1175712097bv32, v2$1), 1100185505bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2813815293bv32, v1$1), 786438779bv32), v1$1), 3045080555bv32), v1$1), 1004234164bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1033456574bv32, v3$2), FADD32(FMUL32(1175712097bv32, v2$2), 1100185505bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2813815293bv32, v1$2), 786438779bv32), v1$2), 3045080555bv32), v1$2), 1004234164bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$EG(p0$1, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076741530bv32, v3$1), FADD32(FMUL32(1180508029bv32, v2$1), 1090138801bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794634847bv32, v1$1), 766026098bv32), v1$1), 3023224625bv32), v1$1), 981937016bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076741530bv32, v3$2), FADD32(FMUL32(1180508029bv32, v2$2), 1090138801bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794634847bv32, v1$2), 766026098bv32), v1$2), 3023224625bv32), v1$2), 981937016bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076741530bv32, v3$1), FADD32(FMUL32(1180508029bv32, v2$1), 1090138801bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794634847bv32, v1$1), 766026098bv32), v1$1), 3023224625bv32), v1$1), 981937016bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076741530bv32, v3$2), FADD32(FMUL32(1180508029bv32, v2$2), 1090138801bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794634847bv32, v1$2), 766026098bv32), v1$2), 3023224625bv32), v1$2), 981937016bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$EG(p0$1, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081532577bv32, v3$1), FADD32(FMUL32(1195276074bv32, v2$1), 1074881157bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804553236bv32, v1$1), 775937142bv32), v1$1), 3032886687bv32), v1$1), 990946924bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081532577bv32, v3$2), FADD32(FMUL32(1195276074bv32, v2$2), 1074881157bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804553236bv32, v1$2), 775937142bv32), v1$2), 3032886687bv32), v1$2), 990946924bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081532577bv32, v3$1), FADD32(FMUL32(1195276074bv32, v2$1), 1074881157bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804553236bv32, v1$1), 775937142bv32), v1$1), 3032886687bv32), v1$1), 990946924bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081532577bv32, v3$2), FADD32(FMUL32(1195276074bv32, v2$2), 1074881157bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2804553236bv32, v1$2), 775937142bv32), v1$2), 3032886687bv32), v1$2), 990946924bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$EG(p0$1, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076980558bv32, v3$1), FADD32(FMUL32(3313155761bv32, v2$1), 1092404741bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2806003582bv32, v1$1), 777514521bv32), v1$1), 3034467885bv32), v1$1), 992112116bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076980558bv32, v3$2), FADD32(FMUL32(3313155761bv32, v2$2), 1092404741bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2806003582bv32, v1$2), 777514521bv32), v1$2), 3034467885bv32), v1$2), 992112116bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076980558bv32, v3$1), FADD32(FMUL32(3313155761bv32, v2$1), 1092404741bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2806003582bv32, v1$1), 777514521bv32), v1$1), 3034467885bv32), v1$1), 992112116bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1076980558bv32, v3$2), FADD32(FMUL32(3313155761bv32, v2$2), 1092404741bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2806003582bv32, v1$2), 777514521bv32), v1$2), 3034467885bv32), v1$2), 992112116bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$EG(p0$1, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1071734347bv32, v3$1), FADD32(FMUL32(1180348244bv32, v2$1), 1096450125bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812229798bv32, v1$1), 783838542bv32), v1$1), 3041254654bv32), v1$1), 999734170bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1071734347bv32, v3$2), FADD32(FMUL32(1180348244bv32, v2$2), 1096450125bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812229798bv32, v1$2), 783838542bv32), v1$2), 3041254654bv32), v1$2), 999734170bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1071734347bv32, v3$1), FADD32(FMUL32(1180348244bv32, v2$1), 1096450125bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812229798bv32, v1$1), 783838542bv32), v1$1), 3041254654bv32), v1$1), 999734170bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1071734347bv32, v3$2), FADD32(FMUL32(1180348244bv32, v2$2), 1096450125bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812229798bv32, v1$2), 783838542bv32), v1$2), 3041254654bv32), v1$2), 999734170bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$EG(p0$1, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081169093bv32, v3$1), FADD32(FMUL32(3271535168bv32, v2$1), 1077640744bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794994403bv32, v1$1), 772837535bv32), v1$1), 3035476081bv32), v1$1), 998307700bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081169093bv32, v3$2), FADD32(FMUL32(3271535168bv32, v2$2), 1077640744bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794994403bv32, v1$2), 772837535bv32), v1$2), 3035476081bv32), v1$2), 998307700bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081169093bv32, v3$1), FADD32(FMUL32(3271535168bv32, v2$1), 1077640744bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794994403bv32, v1$1), 772837535bv32), v1$1), 3035476081bv32), v1$1), 998307700bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081169093bv32, v3$2), FADD32(FMUL32(3271535168bv32, v2$2), 1077640744bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794994403bv32, v1$2), 772837535bv32), v1$2), 3035476081bv32), v1$2), 998307700bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$EG(p0$1, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082439908bv32, v3$1), FADD32(FMUL32(3335168000bv32, v2$1), 3214768603bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801935889bv32, v1$1), 774590194bv32), v1$1), 3033813997bv32), v1$1), 994269718bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082439908bv32, v3$2), FADD32(FMUL32(3335168000bv32, v2$2), 3214768603bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801935889bv32, v1$2), 774590194bv32), v1$2), 3033813997bv32), v1$2), 994269718bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082439908bv32, v3$1), FADD32(FMUL32(3335168000bv32, v2$1), 3214768603bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801935889bv32, v1$1), 774590194bv32), v1$1), 3033813997bv32), v1$1), 994269718bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082439908bv32, v3$2), FADD32(FMUL32(3335168000bv32, v2$2), 3214768603bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2801935889bv32, v1$2), 774590194bv32), v1$2), 3033813997bv32), v1$2), 994269718bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$EG(p0$1, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082713512bv32, v3$1), FADD32(FMUL32(3342646448bv32, v2$1), 1059317395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2790689035bv32, v1$1), 767206644bv32), v1$1), 3029457893bv32), v1$1), 991681170bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082713512bv32, v3$2), FADD32(FMUL32(3342646448bv32, v2$2), 1059317395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2790689035bv32, v1$2), 767206644bv32), v1$2), 3029457893bv32), v1$2), 991681170bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082713512bv32, v3$1), FADD32(FMUL32(3342646448bv32, v2$1), 1059317395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2790689035bv32, v1$1), 767206644bv32), v1$1), 3029457893bv32), v1$1), 991681170bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082713512bv32, v3$2), FADD32(FMUL32(3342646448bv32, v2$2), 1059317395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2790689035bv32, v1$2), 767206644bv32), v1$2), 3029457893bv32), v1$2), 991681170bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$EG(p0$1, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078006274bv32, v3$1), FADD32(FMUL32(3339138272bv32, v2$1), 1090073026bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811978938bv32, v1$1), 783973299bv32), v1$1), 3042011808bv32), v1$1), 1000947743bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078006274bv32, v3$2), FADD32(FMUL32(3339138272bv32, v2$2), 1090073026bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811978938bv32, v1$2), 783973299bv32), v1$2), 3042011808bv32), v1$2), 1000947743bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078006274bv32, v3$1), FADD32(FMUL32(3339138272bv32, v2$1), 1090073026bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811978938bv32, v1$1), 783973299bv32), v1$1), 3042011808bv32), v1$1), 1000947743bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078006274bv32, v3$2), FADD32(FMUL32(3339138272bv32, v2$2), 1090073026bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811978938bv32, v1$2), 783973299bv32), v1$2), 3042011808bv32), v1$2), 1000947743bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$EG(p0$1, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073893285bv32, v3$1), FADD32(FMUL32(3315228439bv32, v2$1), 1092936395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2816635824bv32, v1$1), 788980985bv32), v1$1), 3046514202bv32), v1$1), 1005581139bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073893285bv32, v3$2), FADD32(FMUL32(3315228439bv32, v2$2), 1092936395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2816635824bv32, v1$2), 788980985bv32), v1$2), 3046514202bv32), v1$2), 1005581139bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073893285bv32, v3$1), FADD32(FMUL32(3315228439bv32, v2$1), 1092936395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2816635824bv32, v1$1), 788980985bv32), v1$1), 3046514202bv32), v1$1), 1005581139bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073893285bv32, v3$2), FADD32(FMUL32(3315228439bv32, v2$2), 1092936395bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2816635824bv32, v1$2), 788980985bv32), v1$2), 3046514202bv32), v1$2), 1005581139bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$EG(p0$1, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073361454bv32, v3$1), FADD32(FMUL32(3326666260bv32, v2$1), 1096246818bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2819016960bv32, v1$1), 790662015bv32), v1$1), 3048377930bv32), v1$1), 1007584441bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073361454bv32, v3$2), FADD32(FMUL32(3326666260bv32, v2$2), 1096246818bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2819016960bv32, v1$2), 790662015bv32), v1$2), 3048377930bv32), v1$2), 1007584441bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073361454bv32, v3$1), FADD32(FMUL32(3326666260bv32, v2$1), 1096246818bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2819016960bv32, v1$1), 790662015bv32), v1$1), 3048377930bv32), v1$1), 1007584441bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1073361454bv32, v3$2), FADD32(FMUL32(3326666260bv32, v2$2), 1096246818bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2819016960bv32, v1$2), 790662015bv32), v1$2), 3048377930bv32), v1$2), 1007584441bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$EG(p0$1, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065956202bv32, v3$1), FADD32(FMUL32(1177717139bv32, v2$1), 1097980299bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2821399471bv32, v1$1), 793435891bv32), v1$1), 3051373791bv32), v1$1), 1009886542bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065956202bv32, v3$2), FADD32(FMUL32(1177717139bv32, v2$2), 1097980299bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2821399471bv32, v1$2), 793435891bv32), v1$2), 3051373791bv32), v1$2), 1009886542bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065956202bv32, v3$1), FADD32(FMUL32(1177717139bv32, v2$1), 1097980299bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2821399471bv32, v1$1), 793435891bv32), v1$1), 3051373791bv32), v1$1), 1009886542bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065956202bv32, v3$2), FADD32(FMUL32(1177717139bv32, v2$2), 1097980299bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2821399471bv32, v1$2), 793435891bv32), v1$2), 3051373791bv32), v1$2), 1009886542bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$EG(p0$1, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085545027bv32, v3$1), FADD32(FMUL32(3331784302bv32, v2$1), 3229321567bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794182946bv32, v1$1), 768726216bv32), v1$1), 3029242997bv32), v1$1), 990240337bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085545027bv32, v3$2), FADD32(FMUL32(3331784302bv32, v2$2), 3229321567bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794182946bv32, v1$2), 768726216bv32), v1$2), 3029242997bv32), v1$2), 990240337bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085545027bv32, v3$1), FADD32(FMUL32(3331784302bv32, v2$1), 3229321567bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794182946bv32, v1$1), 768726216bv32), v1$1), 3029242997bv32), v1$1), 990240337bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085545027bv32, v3$2), FADD32(FMUL32(3331784302bv32, v2$2), 3229321567bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2794182946bv32, v1$2), 768726216bv32), v1$2), 3029242997bv32), v1$2), 990240337bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$EG(p0$1, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083202700bv32, v3$1), FADD32(FMUL32(1173092461bv32, v2$1), 1059183348bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811178865bv32, v1$1), 782840950bv32), v1$1), 3040512287bv32), v1$1), 999523283bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083202700bv32, v3$2), FADD32(FMUL32(1173092461bv32, v2$2), 1059183348bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811178865bv32, v1$2), 782840950bv32), v1$2), 3040512287bv32), v1$2), 999523283bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083202700bv32, v3$1), FADD32(FMUL32(1173092461bv32, v2$1), 1059183348bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811178865bv32, v1$1), 782840950bv32), v1$1), 3040512287bv32), v1$1), 999523283bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083202700bv32, v3$2), FADD32(FMUL32(1173092461bv32, v2$2), 1059183348bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2811178865bv32, v1$2), 782840950bv32), v1$2), 3040512287bv32), v1$2), 999523283bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$EG(p0$1, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1086273712bv32, v3$1), FADD32(FMUL32(3287623984bv32, v2$1), 3231778525bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795293806bv32, v1$1), 773139872bv32), v1$1), 3035987664bv32), v1$1), 998585900bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1086273712bv32, v3$2), FADD32(FMUL32(3287623984bv32, v2$2), 3231778525bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795293806bv32, v1$2), 773139872bv32), v1$2), 3035987664bv32), v1$2), 998585900bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1086273712bv32, v3$1), FADD32(FMUL32(3287623984bv32, v2$1), 3231778525bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795293806bv32, v1$1), 773139872bv32), v1$1), 3035987664bv32), v1$1), 998585900bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1086273712bv32, v3$2), FADD32(FMUL32(3287623984bv32, v2$2), 3231778525bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2795293806bv32, v1$2), 773139872bv32), v1$2), 3035987664bv32), v1$2), 998585900bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$EG(p0$1, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085075066bv32, v3$1), FADD32(FMUL32(1185972798bv32, v2$1), 3227436363bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2803083741bv32, v1$1), 779785842bv32), v1$1), 3040679171bv32), v1$1), 1002443283bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085075066bv32, v3$2), FADD32(FMUL32(1185972798bv32, v2$2), 3227436363bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2803083741bv32, v1$2), 779785842bv32), v1$2), 3040679171bv32), v1$2), 1002443283bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085075066bv32, v3$1), FADD32(FMUL32(1185972798bv32, v2$1), 3227436363bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2803083741bv32, v1$1), 779785842bv32), v1$1), 3040679171bv32), v1$1), 1002443283bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1085075066bv32, v3$2), FADD32(FMUL32(1185972798bv32, v2$2), 3227436363bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2803083741bv32, v1$2), 779785842bv32), v1$2), 3040679171bv32), v1$2), 1002443283bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$EG(p0$1, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087374964bv32, v3$1), FADD32(FMUL32(3330839782bv32, v2$1), 3241403272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812463357bv32, v1$1), 785059534bv32), v1$1), 3044936039bv32), v1$1), 1005236807bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087374964bv32, v3$2), FADD32(FMUL32(3330839782bv32, v2$2), 3241403272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812463357bv32, v1$2), 785059534bv32), v1$2), 3044936039bv32), v1$2), 1005236807bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087374964bv32, v3$1), FADD32(FMUL32(3330839782bv32, v2$1), 3241403272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812463357bv32, v1$1), 785059534bv32), v1$1), 3044936039bv32), v1$1), 1005236807bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087374964bv32, v3$2), FADD32(FMUL32(3330839782bv32, v2$2), 3241403272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2812463357bv32, v1$2), 785059534bv32), v1$2), 3044936039bv32), v1$2), 1005236807bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$EG(p0$1, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087860390bv32, v3$1), FADD32(FMUL32(1147593856bv32, v2$1), 3243574139bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802299162bv32, v1$1), 780413285bv32), v1$1), 3042800745bv32), v1$1), 1005863452bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087860390bv32, v3$2), FADD32(FMUL32(1147593856bv32, v2$2), 3243574139bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802299162bv32, v1$2), 780413285bv32), v1$2), 3042800745bv32), v1$2), 1005863452bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087860390bv32, v3$1), FADD32(FMUL32(1147593856bv32, v2$1), 3243574139bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802299162bv32, v1$1), 780413285bv32), v1$1), 3042800745bv32), v1$1), 1005863452bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1087860390bv32, v3$2), FADD32(FMUL32(1147593856bv32, v2$2), 3243574139bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802299162bv32, v1$2), 780413285bv32), v1$2), 3042800745bv32), v1$2), 1005863452bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$EG(p0$1, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1089910337bv32, v3$1), FADD32(FMUL32(3321446858bv32, v2$1), 3245883048bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802582664bv32, v1$1), 780865823bv32), v1$1), 3043745225bv32), v1$1), 1006851190bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p0$2, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$EG(p0$2, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1089910337bv32, v3$2), FADD32(FMUL32(3321446858bv32, v2$2), 3245883048bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802582664bv32, v1$2), 780865823bv32), v1$2), 3043745225bv32), v1$2), 1006851190bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p0$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1089910337bv32, v3$1), FADD32(FMUL32(3321446858bv32, v2$1), 3245883048bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802582664bv32, v1$1), 780865823bv32), v1$1), 3043745225bv32), v1$1), 1006851190bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p0$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1089910337bv32, v3$2), FADD32(FMUL32(3321446858bv32, v2$2), 3245883048bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2802582664bv32, v1$2), 780865823bv32), v1$2), 3043745225bv32), v1$2), 1006851190bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$EG(p1$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075186053bv32, v3$1), FADD32(FMUL32(1147501530bv32, v2$1), 1060035010bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2865733255bv32, v1$1), 820436368bv32), v1$1), 3059342340bv32), v1$1), 998424763bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075186053bv32, v3$2), FADD32(FMUL32(1147501530bv32, v2$2), 1060035010bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2865733255bv32, v1$2), 820436368bv32), v1$2), 3059342340bv32), v1$2), 998424763bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075186053bv32, v3$1), FADD32(FMUL32(1147501530bv32, v2$1), 1060035010bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2865733255bv32, v1$1), 820436368bv32), v1$1), 3059342340bv32), v1$1), 998424763bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075186053bv32, v3$2), FADD32(FMUL32(1147501530bv32, v2$2), 1060035010bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2865733255bv32, v1$2), 820436368bv32), v1$2), 3059342340bv32), v1$2), 998424763bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)]);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$EG(p1$1, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$1), FADD32(FMUL32(3334931282bv32, v2$1), 3202659229bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2590003162bv32, v1$1), 543317057bv32), v1$1), 2780807925bv32), v1$1), 717654166bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$2), FADD32(FMUL32(3334931282bv32, v2$2), 3202659229bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2590003162bv32, v1$2), 543317057bv32), v1$2), 2780807925bv32), v1$2), 717654166bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$1), FADD32(FMUL32(3334931282bv32, v2$1), 3202659229bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2590003162bv32, v1$1), 543317057bv32), v1$1), 2780807925bv32), v1$1), 717654166bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075838976bv32, v3$2), FADD32(FMUL32(3334931282bv32, v2$2), 3202659229bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2590003162bv32, v1$2), 543317057bv32), v1$2), 2780807925bv32), v1$2), 717654166bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$EG(p1$1, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078641891bv32, v3$1), FADD32(FMUL32(3336799365bv32, v2$1), 1073959649bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703454533bv32, v1$1), 2953600860bv32), v1$1), 898931283bv32), v1$1), 3134646743bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078641891bv32, v3$2), FADD32(FMUL32(3336799365bv32, v2$2), 1073959649bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703454533bv32, v1$2), 2953600860bv32), v1$2), 898931283bv32), v1$2), 3134646743bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078641891bv32, v3$1), FADD32(FMUL32(3336799365bv32, v2$1), 1073959649bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703454533bv32, v1$1), 2953600860bv32), v1$1), 898931283bv32), v1$1), 3134646743bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078641891bv32, v3$2), FADD32(FMUL32(3336799365bv32, v2$2), 1073959649bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703454533bv32, v1$2), 2953600860bv32), v1$2), 898931283bv32), v1$2), 3134646743bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$EG(p1$1, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081217988bv32, v3$1), FADD32(FMUL32(1149566514bv32, v2$1), 1080694620bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(708221709bv32, v1$1), 2958934967bv32), v1$1), 903628745bv32), v1$1), 3133433051bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081217988bv32, v3$2), FADD32(FMUL32(1149566514bv32, v2$2), 1080694620bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(708221709bv32, v1$2), 2958934967bv32), v1$2), 903628745bv32), v1$2), 3133433051bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081217988bv32, v3$1), FADD32(FMUL32(1149566514bv32, v2$1), 1080694620bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(708221709bv32, v1$1), 2958934967bv32), v1$1), 903628745bv32), v1$1), 3133433051bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081217988bv32, v3$2), FADD32(FMUL32(1149566514bv32, v2$2), 1080694620bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(708221709bv32, v1$2), 2958934967bv32), v1$2), 903628745bv32), v1$2), 3133433051bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$EG(p1$1, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082096942bv32, v3$1), FADD32(FMUL32(3311530314bv32, v2$1), 3184842463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(697931246bv32, v1$1), 2947665514bv32), v1$1), 894343779bv32), v1$1), 3130875756bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082096942bv32, v3$2), FADD32(FMUL32(3311530314bv32, v2$2), 3184842463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(697931246bv32, v1$2), 2947665514bv32), v1$2), 894343779bv32), v1$2), 3130875756bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082096942bv32, v3$1), FADD32(FMUL32(3311530314bv32, v2$1), 3184842463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(697931246bv32, v1$1), 2947665514bv32), v1$1), 894343779bv32), v1$1), 3130875756bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082096942bv32, v3$2), FADD32(FMUL32(3311530314bv32, v2$2), 3184842463bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(697931246bv32, v1$2), 2947665514bv32), v1$2), 894343779bv32), v1$2), 3130875756bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$EG(p1$1, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082547011bv32, v3$1), FADD32(FMUL32(1189915508bv32, v2$1), 3210304045bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700940747bv32, v1$1), 2952489882bv32), v1$1), 898751459bv32), v1$1), 3129308594bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082547011bv32, v3$2), FADD32(FMUL32(1189915508bv32, v2$2), 3210304045bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700940747bv32, v1$2), 2952489882bv32), v1$2), 898751459bv32), v1$2), 3129308594bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082547011bv32, v3$1), FADD32(FMUL32(1189915508bv32, v2$1), 3210304045bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700940747bv32, v1$1), 2952489882bv32), v1$1), 898751459bv32), v1$1), 3129308594bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082547011bv32, v3$2), FADD32(FMUL32(1189915508bv32, v2$2), 3210304045bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700940747bv32, v1$2), 2952489882bv32), v1$2), 898751459bv32), v1$2), 3129308594bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$EG(p1$1, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082763348bv32, v3$1), FADD32(FMUL32(3281217390bv32, v2$1), 1080942028bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721602269bv32, v1$1), 2970289552bv32), v1$1), 913090246bv32), v1$1), 3139149443bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082763348bv32, v3$2), FADD32(FMUL32(3281217390bv32, v2$2), 1080942028bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721602269bv32, v1$2), 2970289552bv32), v1$2), 913090246bv32), v1$2), 3139149443bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082763348bv32, v3$1), FADD32(FMUL32(3281217390bv32, v2$1), 1080942028bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721602269bv32, v1$1), 2970289552bv32), v1$1), 913090246bv32), v1$1), 3139149443bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082763348bv32, v3$2), FADD32(FMUL32(3281217390bv32, v2$2), 1080942028bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721602269bv32, v1$2), 2970289552bv32), v1$2), 913090246bv32), v1$2), 3139149443bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$EG(p1$1, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082709482bv32, v3$1), FADD32(FMUL32(1183468842bv32, v2$1), 1079760863bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(720552547bv32, v1$1), 2968985772bv32), v1$1), 909846893bv32), v1$1), 3113110578bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082709482bv32, v3$2), FADD32(FMUL32(1183468842bv32, v2$2), 1079760863bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(720552547bv32, v1$2), 2968985772bv32), v1$2), 909846893bv32), v1$2), 3113110578bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082709482bv32, v3$1), FADD32(FMUL32(1183468842bv32, v2$1), 1079760863bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(720552547bv32, v1$1), 2968985772bv32), v1$1), 909846893bv32), v1$1), 3113110578bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082709482bv32, v3$2), FADD32(FMUL32(1183468842bv32, v2$2), 1079760863bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(720552547bv32, v1$2), 2968985772bv32), v1$2), 909846893bv32), v1$2), 3113110578bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$EG(p1$1, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079990568bv32, v3$1), FADD32(FMUL32(3347728038bv32, v2$1), 1074094192bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2845724622bv32, v1$1), 798023260bv32), v1$1), 3029803226bv32), v1$1), 959039608bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079990568bv32, v3$2), FADD32(FMUL32(3347728038bv32, v2$2), 1074094192bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2845724622bv32, v1$2), 798023260bv32), v1$2), 3029803226bv32), v1$2), 959039608bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079990568bv32, v3$1), FADD32(FMUL32(3347728038bv32, v2$1), 1074094192bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2845724622bv32, v1$1), 798023260bv32), v1$1), 3029803226bv32), v1$1), 959039608bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079990568bv32, v3$2), FADD32(FMUL32(3347728038bv32, v2$2), 1074094192bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2845724622bv32, v1$2), 798023260bv32), v1$2), 3029803226bv32), v1$2), 959039608bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$EG(p1$1, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081135034bv32, v3$1), FADD32(FMUL32(3342054410bv32, v2$1), 1070072075bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700316797bv32, v1$1), 2947574776bv32), v1$1), 888804690bv32), v1$1), 972946409bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081135034bv32, v3$2), FADD32(FMUL32(3342054410bv32, v2$2), 1070072075bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700316797bv32, v1$2), 2947574776bv32), v1$2), 888804690bv32), v1$2), 972946409bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081135034bv32, v3$1), FADD32(FMUL32(3342054410bv32, v2$1), 1070072075bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700316797bv32, v1$1), 2947574776bv32), v1$1), 888804690bv32), v1$1), 972946409bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081135034bv32, v3$2), FADD32(FMUL32(3342054410bv32, v2$2), 1070072075bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(700316797bv32, v1$2), 2947574776bv32), v1$2), 888804690bv32), v1$2), 972946409bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$EG(p1$1, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082546935bv32, v3$1), FADD32(FMUL32(3343204561bv32, v2$1), 3208963323bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(702203753bv32, v1$1), 2954441673bv32), v1$1), 901262098bv32), v1$1), 3130726707bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082546935bv32, v3$2), FADD32(FMUL32(3343204561bv32, v2$2), 3208963323bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(702203753bv32, v1$2), 2954441673bv32), v1$2), 901262098bv32), v1$2), 3130726707bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082546935bv32, v3$1), FADD32(FMUL32(3343204561bv32, v2$1), 3208963323bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(702203753bv32, v1$1), 2954441673bv32), v1$1), 901262098bv32), v1$1), 3130726707bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082546935bv32, v3$2), FADD32(FMUL32(3343204561bv32, v2$2), 3208963323bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(702203753bv32, v1$2), 2954441673bv32), v1$2), 901262098bv32), v1$2), 3130726707bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$EG(p1$1, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080761371bv32, v3$1), FADD32(FMUL32(3330308607bv32, v2$1), 1070424669bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(705639641bv32, v1$1), 2954716414bv32), v1$1), 897593037bv32), v1$1), 981715500bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080761371bv32, v3$2), FADD32(FMUL32(3330308607bv32, v2$2), 1070424669bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(705639641bv32, v1$2), 2954716414bv32), v1$2), 897593037bv32), v1$2), 981715500bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080761371bv32, v3$1), FADD32(FMUL32(3330308607bv32, v2$1), 1070424669bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(705639641bv32, v1$1), 2954716414bv32), v1$1), 897593037bv32), v1$1), 981715500bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080761371bv32, v3$2), FADD32(FMUL32(3330308607bv32, v2$2), 1070424669bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(705639641bv32, v1$2), 2954716414bv32), v1$2), 897593037bv32), v1$2), 981715500bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$EG(p1$1, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1084541897bv32, v3$1), FADD32(FMUL32(1176509079bv32, v2$1), 3230958991bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(728406484bv32, v1$1), 2978663434bv32), v1$1), 923370613bv32), v1$1), 3152018494bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1084541897bv32, v3$2), FADD32(FMUL32(1176509079bv32, v2$2), 3230958991bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(728406484bv32, v1$2), 2978663434bv32), v1$2), 923370613bv32), v1$2), 3152018494bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1084541897bv32, v3$1), FADD32(FMUL32(1176509079bv32, v2$1), 3230958991bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(728406484bv32, v1$1), 2978663434bv32), v1$1), 923370613bv32), v1$1), 3152018494bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1084541897bv32, v3$2), FADD32(FMUL32(1176509079bv32, v2$2), 3230958991bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(728406484bv32, v1$2), 2978663434bv32), v1$2), 923370613bv32), v1$2), 3152018494bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$EG(p1$1, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080366868bv32, v3$1), FADD32(FMUL32(1180704856bv32, v2$1), 1080068551bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2840307846bv32, v1$1), 782644713bv32), v1$1), 875951949bv32), v1$1), 3114270756bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080366868bv32, v3$2), FADD32(FMUL32(1180704856bv32, v2$2), 1080068551bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2840307846bv32, v1$2), 782644713bv32), v1$2), 875951949bv32), v1$2), 3114270756bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080366868bv32, v3$1), FADD32(FMUL32(1180704856bv32, v2$1), 1080068551bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2840307846bv32, v1$1), 782644713bv32), v1$1), 875951949bv32), v1$1), 3114270756bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1080366868bv32, v3$2), FADD32(FMUL32(1180704856bv32, v2$2), 1080068551bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2840307846bv32, v1$2), 782644713bv32), v1$2), 875951949bv32), v1$2), 3114270756bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$EG(p1$1, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075238241bv32, v3$1), FADD32(FMUL32(1195176952bv32, v2$1), 1092512438bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2818666204bv32, v1$1), 794907488bv32), v1$1), 3047119349bv32), v1$1), 999502881bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075238241bv32, v3$2), FADD32(FMUL32(1195176952bv32, v2$2), 1092512438bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2818666204bv32, v1$2), 794907488bv32), v1$2), 3047119349bv32), v1$2), 999502881bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075238241bv32, v3$1), FADD32(FMUL32(1195176952bv32, v2$1), 1092512438bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2818666204bv32, v1$1), 794907488bv32), v1$1), 3047119349bv32), v1$1), 999502881bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1075238241bv32, v3$2), FADD32(FMUL32(1195176952bv32, v2$2), 1092512438bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2818666204bv32, v1$2), 794907488bv32), v1$2), 3047119349bv32), v1$2), 999502881bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$EG(p1$1, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082594292bv32, v3$1), FADD32(FMUL32(3312449802bv32, v2$1), 1079590246bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(712257711bv32, v1$1), 2962783811bv32), v1$1), 907681862bv32), v1$1), 3134494729bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082594292bv32, v3$2), FADD32(FMUL32(3312449802bv32, v2$2), 1079590246bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(712257711bv32, v1$2), 2962783811bv32), v1$2), 907681862bv32), v1$2), 3134494729bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082594292bv32, v3$1), FADD32(FMUL32(3312449802bv32, v2$1), 1079590246bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(712257711bv32, v1$1), 2962783811bv32), v1$1), 907681862bv32), v1$1), 3134494729bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082594292bv32, v3$2), FADD32(FMUL32(3312449802bv32, v2$2), 1079590246bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(712257711bv32, v1$2), 2962783811bv32), v1$2), 907681862bv32), v1$2), 3134494729bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$EG(p1$1, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083794990bv32, v3$1), FADD32(FMUL32(1180668884bv32, v2$1), 1058689522bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(725185562bv32, v1$1), 2975413199bv32), v1$1), 919648322bv32), v1$1), 3147978384bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083794990bv32, v3$2), FADD32(FMUL32(1180668884bv32, v2$2), 1058689522bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(725185562bv32, v1$2), 2975413199bv32), v1$2), 919648322bv32), v1$2), 3147978384bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083794990bv32, v3$1), FADD32(FMUL32(1180668884bv32, v2$1), 1058689522bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(725185562bv32, v1$1), 2975413199bv32), v1$1), 919648322bv32), v1$1), 3147978384bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083794990bv32, v3$2), FADD32(FMUL32(1180668884bv32, v2$2), 1058689522bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(725185562bv32, v1$2), 2975413199bv32), v1$2), 919648322bv32), v1$2), 3147978384bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$EG(p1$1, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074187276bv32, v3$1), FADD32(FMUL32(3295979128bv32, v2$1), 1095921489bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703181155bv32, v1$1), 2955476714bv32), v1$1), 896456405bv32), v1$1), 996964656bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074187276bv32, v3$2), FADD32(FMUL32(3295979128bv32, v2$2), 1095921489bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703181155bv32, v1$2), 2955476714bv32), v1$2), 896456405bv32), v1$2), 996964656bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074187276bv32, v3$1), FADD32(FMUL32(3295979128bv32, v2$1), 1095921489bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703181155bv32, v1$1), 2955476714bv32), v1$1), 896456405bv32), v1$1), 996964656bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074187276bv32, v3$2), FADD32(FMUL32(3295979128bv32, v2$2), 1095921489bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(703181155bv32, v1$2), 2955476714bv32), v1$2), 896456405bv32), v1$2), 996964656bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$EG(p1$1, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1062143417bv32, v3$1), FADD32(FMUL32(3335420406bv32, v2$1), 1096747272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2867807799bv32, v1$1), 824209096bv32), v1$1), 3066470497bv32), v1$1), 1010786496bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1062143417bv32, v3$2), FADD32(FMUL32(3335420406bv32, v2$2), 1096747272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2867807799bv32, v1$2), 824209096bv32), v1$2), 3066470497bv32), v1$2), 1010786496bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1062143417bv32, v3$1), FADD32(FMUL32(3335420406bv32, v2$1), 1096747272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2867807799bv32, v1$1), 824209096bv32), v1$1), 3066470497bv32), v1$1), 1010786496bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1062143417bv32, v3$2), FADD32(FMUL32(3335420406bv32, v2$2), 1096747272bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2867807799bv32, v1$2), 824209096bv32), v1$2), 3066470497bv32), v1$2), 1010786496bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$EG(p1$1, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079117027bv32, v3$1), FADD32(FMUL32(3342724555bv32, v2$1), 1086157784bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(693967467bv32, v1$1), 2933772521bv32), v1$1), 3033887743bv32), v1$1), 996449011bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079117027bv32, v3$2), FADD32(FMUL32(3342724555bv32, v2$2), 1086157784bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(693967467bv32, v1$2), 2933772521bv32), v1$2), 3033887743bv32), v1$2), 996449011bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079117027bv32, v3$1), FADD32(FMUL32(3342724555bv32, v2$1), 1086157784bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(693967467bv32, v1$1), 2933772521bv32), v1$1), 3033887743bv32), v1$1), 996449011bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079117027bv32, v3$2), FADD32(FMUL32(3342724555bv32, v2$2), 1086157784bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(693967467bv32, v1$2), 2933772521bv32), v1$2), 3033887743bv32), v1$2), 996449011bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$EG(p1$1, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078827277bv32, v3$1), FADD32(FMUL32(3339201497bv32, v2$1), 1091054380bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(726603952bv32, v1$1), 2974601522bv32), v1$1), 915469789bv32), v1$1), 977701881bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078827277bv32, v3$2), FADD32(FMUL32(3339201497bv32, v2$2), 1091054380bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(726603952bv32, v1$2), 2974601522bv32), v1$2), 915469789bv32), v1$2), 977701881bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078827277bv32, v3$1), FADD32(FMUL32(3339201497bv32, v2$1), 1091054380bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(726603952bv32, v1$1), 2974601522bv32), v1$1), 915469789bv32), v1$1), 977701881bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1078827277bv32, v3$2), FADD32(FMUL32(3339201497bv32, v2$2), 1091054380bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(726603952bv32, v1$2), 2974601522bv32), v1$2), 915469789bv32), v1$2), 977701881bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$EG(p1$1, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081959311bv32, v3$1), FADD32(FMUL32(3315535413bv32, v2$1), 1082334550bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733866508bv32, v1$1), 2982544894bv32), v1$1), 924821780bv32), v1$1), 3145208357bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081959311bv32, v3$2), FADD32(FMUL32(3315535413bv32, v2$2), 1082334550bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733866508bv32, v1$2), 2982544894bv32), v1$2), 924821780bv32), v1$2), 3145208357bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081959311bv32, v3$1), FADD32(FMUL32(3315535413bv32, v2$1), 1082334550bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733866508bv32, v1$1), 2982544894bv32), v1$1), 924821780bv32), v1$1), 3145208357bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1081959311bv32, v3$2), FADD32(FMUL32(3315535413bv32, v2$2), 1082334550bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733866508bv32, v1$2), 2982544894bv32), v1$2), 924821780bv32), v1$2), 3145208357bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 57} _LOG_WRITE_$$EG(p1$1, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082773137bv32, v3$1), FADD32(FMUL32(3326649986bv32, v2$1), 1083613557bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(732050640bv32, v1$1), 2980809842bv32), v1$1), 923468510bv32), v1$1), 3137941415bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 57} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082773137bv32, v3$2), FADD32(FMUL32(3326649986bv32, v2$2), 1083613557bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(732050640bv32, v1$2), 2980809842bv32), v1$2), 923468510bv32), v1$2), 3137941415bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082773137bv32, v3$1), FADD32(FMUL32(3326649986bv32, v2$1), 1083613557bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(732050640bv32, v1$1), 2980809842bv32), v1$1), 923468510bv32), v1$1), 3137941415bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082773137bv32, v3$2), FADD32(FMUL32(3326649986bv32, v2$2), 1083613557bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(732050640bv32, v1$2), 2980809842bv32), v1$2), 923468510bv32), v1$2), 3137941415bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(304128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$EG(p1$1, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082741594bv32, v3$1), FADD32(FMUL32(1177815250bv32, v2$1), 1076538683bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733811232bv32, v1$1), 2982861601bv32), v1$1), 925343095bv32), v1$1), 3140765257bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082741594bv32, v3$2), FADD32(FMUL32(1177815250bv32, v2$2), 1076538683bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733811232bv32, v1$2), 2982861601bv32), v1$2), 925343095bv32), v1$2), 3140765257bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082741594bv32, v3$1), FADD32(FMUL32(1177815250bv32, v2$1), 1076538683bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733811232bv32, v1$1), 2982861601bv32), v1$1), 925343095bv32), v1$1), 3140765257bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1082741594bv32, v3$2), FADD32(FMUL32(1177815250bv32, v2$2), 1076538683bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(733811232bv32, v1$2), 2982861601bv32), v1$2), 925343095bv32), v1$2), 3140765257bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(317952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$EG(p1$1, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074797620bv32, v3$1), FADD32(FMUL32(3332159206bv32, v2$1), 1095227583bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2861472728bv32, v1$1), 818273552bv32), v1$1), 3062150119bv32), v1$1), 1007722819bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074797620bv32, v3$2), FADD32(FMUL32(3332159206bv32, v2$2), 1095227583bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2861472728bv32, v1$2), 818273552bv32), v1$2), 3062150119bv32), v1$2), 1007722819bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074797620bv32, v3$1), FADD32(FMUL32(3332159206bv32, v2$1), 1095227583bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2861472728bv32, v1$1), 818273552bv32), v1$1), 3062150119bv32), v1$1), 1007722819bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074797620bv32, v3$2), FADD32(FMUL32(3332159206bv32, v2$2), 1095227583bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2861472728bv32, v1$2), 818273552bv32), v1$2), 3062150119bv32), v1$2), 1007722819bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(331776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$EG(p1$1, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074311563bv32, v3$1), FADD32(FMUL32(1172051800bv32, v2$1), 1094939467bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2850214452bv32, v1$1), 810944935bv32), v1$1), 3057815189bv32), v1$1), 1007971847bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074311563bv32, v3$2), FADD32(FMUL32(1172051800bv32, v2$2), 1094939467bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2850214452bv32, v1$2), 810944935bv32), v1$2), 3057815189bv32), v1$2), 1007971847bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074311563bv32, v3$1), FADD32(FMUL32(1172051800bv32, v2$1), 1094939467bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2850214452bv32, v1$1), 810944935bv32), v1$1), 3057815189bv32), v1$1), 1007971847bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1074311563bv32, v3$2), FADD32(FMUL32(1172051800bv32, v2$2), 1094939467bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(2850214452bv32, v1$2), 810944935bv32), v1$2), 3057815189bv32), v1$2), 1007971847bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(345600bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$EG(p1$1, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079651860bv32, v3$1), FADD32(FMUL32(3300798272bv32, v2$1), 1092166828bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(706833248bv32, v1$1), 807664224bv32), v1$1), 883507061bv32), v1$1), 1001386200bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079651860bv32, v3$2), FADD32(FMUL32(3300798272bv32, v2$2), 1092166828bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(706833248bv32, v1$2), 807664224bv32), v1$2), 883507061bv32), v1$2), 1001386200bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079651860bv32, v3$1), FADD32(FMUL32(3300798272bv32, v2$1), 1092166828bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(706833248bv32, v1$1), 807664224bv32), v1$1), 883507061bv32), v1$1), 1001386200bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1079651860bv32, v3$2), FADD32(FMUL32(3300798272bv32, v2$2), 1092166828bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(706833248bv32, v1$2), 807664224bv32), v1$2), 883507061bv32), v1$2), 1001386200bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(359424bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$EG(p1$1, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083660219bv32, v3$1), FADD32(FMUL32(1185450434bv32, v2$1), 1082346472bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(731534228bv32, v1$1), 2980349339bv32), v1$1), 923069138bv32), v1$1), 3134277234bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083660219bv32, v3$2), FADD32(FMUL32(1185450434bv32, v2$2), 1082346472bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(731534228bv32, v1$2), 2980349339bv32), v1$2), 923069138bv32), v1$2), 3134277234bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083660219bv32, v3$1), FADD32(FMUL32(1185450434bv32, v2$1), 1082346472bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(731534228bv32, v1$1), 2980349339bv32), v1$1), 923069138bv32), v1$1), 3134277234bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1083660219bv32, v3$2), FADD32(FMUL32(1185450434bv32, v2$2), 1082346472bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(731534228bv32, v1$2), 2980349339bv32), v1$2), 923069138bv32), v1$2), 3134277234bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(373248bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$EG(p1$1, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1068399820bv32, v3$1), FADD32(FMUL32(3331742530bv32, v2$1), 1099522750bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(727647562bv32, v1$1), 2973696963bv32), v1$1), 906741498bv32), v1$1), 1008881816bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1068399820bv32, v3$2), FADD32(FMUL32(3331742530bv32, v2$2), 1099522750bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(727647562bv32, v1$2), 2973696963bv32), v1$2), 906741498bv32), v1$2), 1008881816bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1068399820bv32, v3$1), FADD32(FMUL32(3331742530bv32, v2$1), 1099522750bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(727647562bv32, v1$1), 2973696963bv32), v1$1), 906741498bv32), v1$1), 1008881816bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1068399820bv32, v3$2), FADD32(FMUL32(3331742530bv32, v2$2), 1099522750bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(727647562bv32, v1$2), 2973696963bv32), v1$2), 906741498bv32), v1$2), 1008881816bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$EG(p1$1, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1069491375bv32, v3$1), FADD32(FMUL32(3297139311bv32, v2$1), 1098983848bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(717847521bv32, v1$1), 2965316868bv32), v1$1), 893959259bv32), v1$1), 1009478472bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1069491375bv32, v3$2), FADD32(FMUL32(3297139311bv32, v2$2), 1098983848bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(717847521bv32, v1$2), 2965316868bv32), v1$2), 893959259bv32), v1$2), 1009478472bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1069491375bv32, v3$1), FADD32(FMUL32(3297139311bv32, v2$1), 1098983848bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(717847521bv32, v1$1), 2965316868bv32), v1$1), 893959259bv32), v1$1), 1009478472bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1069491375bv32, v3$2), FADD32(FMUL32(3297139311bv32, v2$2), 1098983848bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(717847521bv32, v1$2), 2965316868bv32), v1$2), 893959259bv32), v1$2), 1009478472bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(400896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$EG(p1$1, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065765242bv32, v3$1), FADD32(FMUL32(3324060002bv32, v2$1), 1101600409bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721675843bv32, v1$1), 2967498121bv32), v1$1), 886220709bv32), v1$1), 1012207813bv32), v1$1)), 1069066811bv32)), $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(p1$2, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$EG(p1$2, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065765242bv32, v3$2), FADD32(FMUL32(3324060002bv32, v2$2), 1101600409bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721675843bv32, v1$2), 2967498121bv32), v1$2), 886220709bv32), v1$2), 1012207813bv32), v1$2)), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$EG"} true;
    $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := (if p1$1 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065765242bv32, v3$1), FADD32(FMUL32(3324060002bv32, v2$1), 1101600409bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721675843bv32, v1$1), 2967498121bv32), v1$1), 886220709bv32), v1$1), 1012207813bv32), v1$1)), 1069066811bv32)) else $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := (if p1$2 then FEXP32(FMUL32(FADD32(FADD32(FMUL32(1065765242bv32, v3$2), FADD32(FMUL32(3324060002bv32, v2$2), 1101600409bv32)), FMUL32(FADD32(FMUL32(FADD32(FMUL32(FADD32(FMUL32(721675843bv32, v1$2), 2967498121bv32), v1$2), 886220709bv32), v1$2), 1012207813bv32), v1$2)), 1069066811bv32)) else $$EG[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
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



const _WATCHED_VALUE_$$EG: bv32;

procedure {:inline 1} _LOG_READ_$$EG(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$EG;



implementation {:inline 1} _LOG_READ_$$EG(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then true else _READ_HAS_OCCURRED_$$EG);
    return;
}



procedure _CHECK_READ_$$EG(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$EG);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$EG: bool;

procedure {:inline 1} _LOG_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$EG, _WRITE_READ_BENIGN_FLAG_$$EG;



implementation {:inline 1} _LOG_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then true else _WRITE_HAS_OCCURRED_$$EG);
    _WRITE_READ_BENIGN_FLAG_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$EG);
    return;
}



procedure _CHECK_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG != _value);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG != _value);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$EG(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$EG;



implementation {:inline 1} _LOG_ATOMIC_$$EG(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$EG);
    return;
}



procedure _CHECK_ATOMIC_$$EG(_P: bool, _offset: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$EG;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$EG := (if _P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$EG);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
