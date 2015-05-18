type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$d_iN"} {:global} {:elem_width 32} {:source_name "d_iN"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_iN: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_iN: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_iN: bool;

axiom {:array_info "$$d_iS"} {:global} {:elem_width 32} {:source_name "d_iS"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_iS: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_iS: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_iS: bool;

axiom {:array_info "$$d_jE"} {:global} {:elem_width 32} {:source_name "d_jE"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_jE: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_jE: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_jE: bool;

axiom {:array_info "$$d_jW"} {:global} {:elem_width 32} {:source_name "d_jW"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_jW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_jW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_jW: bool;

axiom {:array_info "$$d_dN"} {:global} {:elem_width 32} {:source_name "d_dN"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_dN: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_dN: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_dN: bool;

axiom {:array_info "$$d_dS"} {:global} {:elem_width 32} {:source_name "d_dS"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_dS: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_dS: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_dS: bool;

axiom {:array_info "$$d_dE"} {:global} {:elem_width 32} {:source_name "d_dE"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_dE: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_dE: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_dE: bool;

axiom {:array_info "$$d_dW"} {:global} {:elem_width 32} {:source_name "d_dW"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_dW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_dW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_dW: bool;

axiom {:array_info "$$d_c"} {:global} {:elem_width 32} {:source_name "d_c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_c: bool;

var {:source_name "d_I"} {:global} $$d_I: [bv32]bv32;

axiom {:array_info "$$d_I"} {:global} {:elem_width 32} {:source_name "d_I"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_I: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_I: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_I: bool;

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

function FADD64(bv64, bv64) : bv64;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV64_SLT(bv64, bv64) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "sign_extend 32"} BV32_SEXT64(bv32) : bv64;

procedure {:source_name "srad2_kernel"} {:kernel} $srad2_kernel($d_lambda: bv32, $d_Nr: bv32, $d_Nc: bv32, $d_Ne: bv64);
  requires !_READ_HAS_OCCURRED_$$d_iN && !_WRITE_HAS_OCCURRED_$$d_iN && !_ATOMIC_HAS_OCCURRED_$$d_iN;
  requires !_READ_HAS_OCCURRED_$$d_iS && !_WRITE_HAS_OCCURRED_$$d_iS && !_ATOMIC_HAS_OCCURRED_$$d_iS;
  requires !_READ_HAS_OCCURRED_$$d_jE && !_WRITE_HAS_OCCURRED_$$d_jE && !_ATOMIC_HAS_OCCURRED_$$d_jE;
  requires !_READ_HAS_OCCURRED_$$d_jW && !_WRITE_HAS_OCCURRED_$$d_jW && !_ATOMIC_HAS_OCCURRED_$$d_jW;
  requires !_READ_HAS_OCCURRED_$$d_dN && !_WRITE_HAS_OCCURRED_$$d_dN && !_ATOMIC_HAS_OCCURRED_$$d_dN;
  requires !_READ_HAS_OCCURRED_$$d_dS && !_WRITE_HAS_OCCURRED_$$d_dS && !_ATOMIC_HAS_OCCURRED_$$d_dS;
  requires !_READ_HAS_OCCURRED_$$d_dE && !_WRITE_HAS_OCCURRED_$$d_dE && !_ATOMIC_HAS_OCCURRED_$$d_dE;
  requires !_READ_HAS_OCCURRED_$$d_dW && !_WRITE_HAS_OCCURRED_$$d_dW && !_ATOMIC_HAS_OCCURRED_$$d_dW;
  requires !_READ_HAS_OCCURRED_$$d_c && !_WRITE_HAS_OCCURRED_$$d_c && !_ATOMIC_HAS_OCCURRED_$$d_c;
  requires !_READ_HAS_OCCURRED_$$d_I && !_WRITE_HAS_OCCURRED_$$d_I && !_ATOMIC_HAS_OCCURRED_$$d_I;
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
  modifies _READ_HAS_OCCURRED_$$d_I, _WRITE_HAS_OCCURRED_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:source_name "srad2_kernel"} {:kernel} $srad2_kernel($d_lambda: bv32, $d_Nr: bv32, $d_Nc: bv32, $d_Ne: bv64)
{
  var $row.0$1: bv32;
  var $row.0$2: bv32;
  var $col.0$1: bv32;
  var $col.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
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
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 512bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 512bv32), local_id_x$2);
    v1$1 := BV32_SUB(BV32_ADD(BV32_SDIV(BV32_ADD(v0$1, 1bv32), $d_Nr), 1bv32), 1bv32);
    v1$2 := BV32_SUB(BV32_ADD(BV32_SDIV(BV32_ADD(v0$2, 1bv32), $d_Nr), 1bv32), 1bv32);
    v2$1 := BV32_SREM(BV32_ADD(v0$1, 1bv32), $d_Nr) == 0bv32;
    v2$2 := BV32_SREM(BV32_ADD(v0$2, 1bv32), $d_Nr) == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    p1$1 := (if !v2$1 then !v2$1 else p1$1);
    p1$2 := (if !v2$2 then !v2$2 else p1$2);
    $row.0$1, $col.0$1 := (if p0$1 then BV32_SUB($d_Nr, 1bv32) else $row.0$1), (if p0$1 then BV32_SUB(v1$1, 1bv32) else $col.0$1);
    $row.0$2, $col.0$2 := (if p0$2 then BV32_SUB($d_Nr, 1bv32) else $row.0$2), (if p0$2 then BV32_SUB(v1$2, 1bv32) else $col.0$2);
    $row.0$1, $col.0$1 := (if p1$1 then BV32_SUB(BV32_SREM(BV32_ADD(v0$1, 1bv32), $d_Nr), 1bv32) else $row.0$1), (if p1$1 then v1$1 else $col.0$1);
    $row.0$2, $col.0$2 := (if p1$2 then BV32_SUB(BV32_SREM(BV32_ADD(v0$2, 1bv32), $d_Nr), 1bv32) else $row.0$2), (if p1$2 then v1$2 else $col.0$2);
    v3$1 := BV64_SLT(BV32_SEXT64(v0$1), $d_Ne);
    v3$2 := BV64_SLT(BV32_SEXT64(v0$2), $d_Ne);
    p2$1 := (if v3$1 then v3$1 else p2$1);
    p2$2 := (if v3$2 then v3$2 else p2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p2$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p2$2 then _HAVOC_bv32$2 else v4$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p2$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p2$2 then _HAVOC_bv32$2 else v5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p2$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p2$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p2$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p2$2 then _HAVOC_bv32$2 else v7$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p2$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p2$2 then _HAVOC_bv32$2 else v8$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p2$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p2$2 then _HAVOC_bv32$2 else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p2$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p2$2 then _HAVOC_bv32$2 else v10$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p2$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p2$2 then _HAVOC_bv32$2 else v11$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p2$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p2$2 then _HAVOC_bv32$2 else v12$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v13$1 := (if p2$1 then _HAVOC_bv32$1 else v13$1);
    v13$2 := (if p2$2 then _HAVOC_bv32$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$d_I(p2$1, v0$1, $$d_I[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$d_I(p2$2, v0$2, $$d_I[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_I"} true;
    v14$1 := (if p2$1 then $$d_I[v0$1] else v14$1);
    v14$2 := (if p2$2 then $$d_I[v0$2] else v14$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$d_I(p2$1, v0$1, FP64_CONV32(FADD64(FMUL64(FMUL64(4598175219545276416bv64, FP32_CONV64($d_lambda)), FP32_CONV64(FADD32(FMUL32(v9$1, v13$1), FADD32(FMUL32(v7$1, v12$1), FADD32(FMUL32(v4$1, v10$1), FMUL32(v6$1, v11$1)))))), FP32_CONV64(v14$1))), $$d_I[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(p2$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$d_I(p2$2, v0$2, FP64_CONV32(FADD64(FMUL64(FMUL64(4598175219545276416bv64, FP32_CONV64($d_lambda)), FP32_CONV64(FADD32(FMUL32(v9$2, v13$2), FADD32(FMUL32(v7$2, v12$2), FADD32(FMUL32(v4$2, v10$2), FMUL32(v6$2, v11$2)))))), FP32_CONV64(v14$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_I"} true;
    $$d_I[v0$1] := (if p2$1 then FP64_CONV32(FADD64(FMUL64(FMUL64(4598175219545276416bv64, FP32_CONV64($d_lambda)), FP32_CONV64(FADD32(FMUL32(v9$1, v13$1), FADD32(FMUL32(v7$1, v12$1), FADD32(FMUL32(v4$1, v10$1), FMUL32(v6$1, v11$1)))))), FP32_CONV64(v14$1))) else $$d_I[v0$1]);
    $$d_I[v0$2] := (if p2$2 then FP64_CONV32(FADD64(FMUL64(FMUL64(4598175219545276416bv64, FP32_CONV64($d_lambda)), FP32_CONV64(FADD32(FMUL32(v9$2, v13$2), FADD32(FMUL32(v7$2, v12$2), FADD32(FMUL32(v4$2, v10$2), FMUL32(v6$2, v11$2)))))), FP32_CONV64(v14$2))) else $$d_I[v0$2]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 450bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_iN: bv32;

procedure {:inline 1} _LOG_READ_$$d_iN(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_iN;



implementation {:inline 1} _LOG_READ_$$d_iN(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_iN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iN == _value then true else _READ_HAS_OCCURRED_$$d_iN);
    return;
}



procedure _CHECK_READ_$$d_iN(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_iN);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_iN: bool;

procedure {:inline 1} _LOG_WRITE_$$d_iN(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_iN, _WRITE_READ_BENIGN_FLAG_$$d_iN;



implementation {:inline 1} _LOG_WRITE_$$d_iN(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_iN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iN == _value then true else _WRITE_HAS_OCCURRED_$$d_iN);
    _WRITE_READ_BENIGN_FLAG_$$d_iN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iN == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_iN);
    return;
}



procedure _CHECK_WRITE_$$d_iN(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iN != _value);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iN != _value);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_iN(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_iN;



implementation {:inline 1} _LOG_ATOMIC_$$d_iN(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_iN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_iN);
    return;
}



procedure _CHECK_ATOMIC_$$d_iN(_P: bool, _offset: bv32);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_iN"} {:array "$$d_iN"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_iN(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_iN;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_iN(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_iN := (if _P && _WRITE_HAS_OCCURRED_$$d_iN && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_iN);
    return;
}



const _WATCHED_VALUE_$$d_iS: bv32;

procedure {:inline 1} _LOG_READ_$$d_iS(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_iS;



implementation {:inline 1} _LOG_READ_$$d_iS(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_iS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iS == _value then true else _READ_HAS_OCCURRED_$$d_iS);
    return;
}



procedure _CHECK_READ_$$d_iS(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_iS);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_iS: bool;

procedure {:inline 1} _LOG_WRITE_$$d_iS(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_iS, _WRITE_READ_BENIGN_FLAG_$$d_iS;



implementation {:inline 1} _LOG_WRITE_$$d_iS(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_iS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iS == _value then true else _WRITE_HAS_OCCURRED_$$d_iS);
    _WRITE_READ_BENIGN_FLAG_$$d_iS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iS == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_iS);
    return;
}



procedure _CHECK_WRITE_$$d_iS(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iS != _value);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_iS != _value);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_iS(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_iS;



implementation {:inline 1} _LOG_ATOMIC_$$d_iS(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_iS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_iS);
    return;
}



procedure _CHECK_ATOMIC_$$d_iS(_P: bool, _offset: bv32);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_iS"} {:array "$$d_iS"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_iS(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_iS;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_iS(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_iS := (if _P && _WRITE_HAS_OCCURRED_$$d_iS && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_iS);
    return;
}



const _WATCHED_VALUE_$$d_jE: bv32;

procedure {:inline 1} _LOG_READ_$$d_jE(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_jE;



implementation {:inline 1} _LOG_READ_$$d_jE(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_jE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jE == _value then true else _READ_HAS_OCCURRED_$$d_jE);
    return;
}



procedure _CHECK_READ_$$d_jE(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_jE);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_jE: bool;

procedure {:inline 1} _LOG_WRITE_$$d_jE(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_jE, _WRITE_READ_BENIGN_FLAG_$$d_jE;



implementation {:inline 1} _LOG_WRITE_$$d_jE(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_jE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jE == _value then true else _WRITE_HAS_OCCURRED_$$d_jE);
    _WRITE_READ_BENIGN_FLAG_$$d_jE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jE == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_jE);
    return;
}



procedure _CHECK_WRITE_$$d_jE(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jE != _value);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jE != _value);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_jE(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_jE;



implementation {:inline 1} _LOG_ATOMIC_$$d_jE(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_jE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_jE);
    return;
}



procedure _CHECK_ATOMIC_$$d_jE(_P: bool, _offset: bv32);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_jE"} {:array "$$d_jE"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_jE(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_jE;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_jE(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_jE := (if _P && _WRITE_HAS_OCCURRED_$$d_jE && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_jE);
    return;
}



const _WATCHED_VALUE_$$d_jW: bv32;

procedure {:inline 1} _LOG_READ_$$d_jW(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_jW;



implementation {:inline 1} _LOG_READ_$$d_jW(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_jW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jW == _value then true else _READ_HAS_OCCURRED_$$d_jW);
    return;
}



procedure _CHECK_READ_$$d_jW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_jW);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_jW: bool;

procedure {:inline 1} _LOG_WRITE_$$d_jW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_jW, _WRITE_READ_BENIGN_FLAG_$$d_jW;



implementation {:inline 1} _LOG_WRITE_$$d_jW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_jW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jW == _value then true else _WRITE_HAS_OCCURRED_$$d_jW);
    _WRITE_READ_BENIGN_FLAG_$$d_jW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jW == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_jW);
    return;
}



procedure _CHECK_WRITE_$$d_jW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jW != _value);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_jW != _value);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_jW(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_jW;



implementation {:inline 1} _LOG_ATOMIC_$$d_jW(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_jW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_jW);
    return;
}



procedure _CHECK_ATOMIC_$$d_jW(_P: bool, _offset: bv32);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_jW"} {:array "$$d_jW"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_jW(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_jW;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_jW(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_jW := (if _P && _WRITE_HAS_OCCURRED_$$d_jW && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_jW);
    return;
}



const _WATCHED_VALUE_$$d_dN: bv32;

procedure {:inline 1} _LOG_READ_$$d_dN(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_dN;



implementation {:inline 1} _LOG_READ_$$d_dN(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_dN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dN == _value then true else _READ_HAS_OCCURRED_$$d_dN);
    return;
}



procedure _CHECK_READ_$$d_dN(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_dN);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_dN: bool;

procedure {:inline 1} _LOG_WRITE_$$d_dN(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_dN, _WRITE_READ_BENIGN_FLAG_$$d_dN;



implementation {:inline 1} _LOG_WRITE_$$d_dN(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_dN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dN == _value then true else _WRITE_HAS_OCCURRED_$$d_dN);
    _WRITE_READ_BENIGN_FLAG_$$d_dN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dN == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_dN);
    return;
}



procedure _CHECK_WRITE_$$d_dN(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dN != _value);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dN != _value);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_dN(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_dN;



implementation {:inline 1} _LOG_ATOMIC_$$d_dN(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_dN := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_dN);
    return;
}



procedure _CHECK_ATOMIC_$$d_dN(_P: bool, _offset: bv32);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_dN"} {:array "$$d_dN"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dN(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_dN;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dN(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_dN := (if _P && _WRITE_HAS_OCCURRED_$$d_dN && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_dN);
    return;
}



const _WATCHED_VALUE_$$d_dS: bv32;

procedure {:inline 1} _LOG_READ_$$d_dS(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_dS;



implementation {:inline 1} _LOG_READ_$$d_dS(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_dS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dS == _value then true else _READ_HAS_OCCURRED_$$d_dS);
    return;
}



procedure _CHECK_READ_$$d_dS(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_dS);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_dS: bool;

procedure {:inline 1} _LOG_WRITE_$$d_dS(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_dS, _WRITE_READ_BENIGN_FLAG_$$d_dS;



implementation {:inline 1} _LOG_WRITE_$$d_dS(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_dS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dS == _value then true else _WRITE_HAS_OCCURRED_$$d_dS);
    _WRITE_READ_BENIGN_FLAG_$$d_dS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dS == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_dS);
    return;
}



procedure _CHECK_WRITE_$$d_dS(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dS != _value);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dS != _value);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_dS(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_dS;



implementation {:inline 1} _LOG_ATOMIC_$$d_dS(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_dS := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_dS);
    return;
}



procedure _CHECK_ATOMIC_$$d_dS(_P: bool, _offset: bv32);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_dS"} {:array "$$d_dS"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dS(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_dS;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dS(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_dS := (if _P && _WRITE_HAS_OCCURRED_$$d_dS && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_dS);
    return;
}



const _WATCHED_VALUE_$$d_dE: bv32;

procedure {:inline 1} _LOG_READ_$$d_dE(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_dE;



implementation {:inline 1} _LOG_READ_$$d_dE(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_dE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dE == _value then true else _READ_HAS_OCCURRED_$$d_dE);
    return;
}



procedure _CHECK_READ_$$d_dE(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_dE);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_dE: bool;

procedure {:inline 1} _LOG_WRITE_$$d_dE(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_dE, _WRITE_READ_BENIGN_FLAG_$$d_dE;



implementation {:inline 1} _LOG_WRITE_$$d_dE(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_dE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dE == _value then true else _WRITE_HAS_OCCURRED_$$d_dE);
    _WRITE_READ_BENIGN_FLAG_$$d_dE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dE == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_dE);
    return;
}



procedure _CHECK_WRITE_$$d_dE(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dE != _value);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dE != _value);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_dE(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_dE;



implementation {:inline 1} _LOG_ATOMIC_$$d_dE(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_dE := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_dE);
    return;
}



procedure _CHECK_ATOMIC_$$d_dE(_P: bool, _offset: bv32);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_dE"} {:array "$$d_dE"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dE(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_dE;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dE(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_dE := (if _P && _WRITE_HAS_OCCURRED_$$d_dE && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_dE);
    return;
}



const _WATCHED_VALUE_$$d_dW: bv32;

procedure {:inline 1} _LOG_READ_$$d_dW(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_dW;



implementation {:inline 1} _LOG_READ_$$d_dW(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_dW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dW == _value then true else _READ_HAS_OCCURRED_$$d_dW);
    return;
}



procedure _CHECK_READ_$$d_dW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_dW);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_dW: bool;

procedure {:inline 1} _LOG_WRITE_$$d_dW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_dW, _WRITE_READ_BENIGN_FLAG_$$d_dW;



implementation {:inline 1} _LOG_WRITE_$$d_dW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_dW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dW == _value then true else _WRITE_HAS_OCCURRED_$$d_dW);
    _WRITE_READ_BENIGN_FLAG_$$d_dW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dW == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_dW);
    return;
}



procedure _CHECK_WRITE_$$d_dW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dW != _value);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_dW != _value);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_dW(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_dW;



implementation {:inline 1} _LOG_ATOMIC_$$d_dW(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_dW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_dW);
    return;
}



procedure _CHECK_ATOMIC_$$d_dW(_P: bool, _offset: bv32);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_dW"} {:array "$$d_dW"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dW(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_dW;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_dW(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_dW := (if _P && _WRITE_HAS_OCCURRED_$$d_dW && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_dW);
    return;
}



const _WATCHED_VALUE_$$d_c: bv32;

procedure {:inline 1} _LOG_READ_$$d_c(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_c;



implementation {:inline 1} _LOG_READ_$$d_c(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_c == _value then true else _READ_HAS_OCCURRED_$$d_c);
    return;
}



procedure _CHECK_READ_$$d_c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_c);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_c: bool;

procedure {:inline 1} _LOG_WRITE_$$d_c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_c, _WRITE_READ_BENIGN_FLAG_$$d_c;



implementation {:inline 1} _LOG_WRITE_$$d_c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_c == _value then true else _WRITE_HAS_OCCURRED_$$d_c);
    _WRITE_READ_BENIGN_FLAG_$$d_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_c == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_c);
    return;
}



procedure _CHECK_WRITE_$$d_c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_c != _value);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_c != _value);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_c(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_c;



implementation {:inline 1} _LOG_ATOMIC_$$d_c(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_c);
    return;
}



procedure _CHECK_ATOMIC_$$d_c(_P: bool, _offset: bv32);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_c"} {:array "$$d_c"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_c(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_c;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_c(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_c := (if _P && _WRITE_HAS_OCCURRED_$$d_c && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_c);
    return;
}



const _WATCHED_VALUE_$$d_I: bv32;

procedure {:inline 1} _LOG_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_I;



implementation {:inline 1} _LOG_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then true else _READ_HAS_OCCURRED_$$d_I);
    return;
}



procedure _CHECK_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_I);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_I: bool;

procedure {:inline 1} _LOG_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:inline 1} _LOG_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then true else _WRITE_HAS_OCCURRED_$$d_I);
    _WRITE_READ_BENIGN_FLAG_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_I);
    return;
}



procedure _CHECK_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I != _value);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I != _value);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_I(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_I;



implementation {:inline 1} _LOG_ATOMIC_$$d_I(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_I);
    return;
}



procedure _CHECK_ATOMIC_$$d_I(_P: bool, _offset: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_I := (if _P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_I);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
