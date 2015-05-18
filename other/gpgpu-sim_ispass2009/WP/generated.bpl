type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$th"} {:global} {:elem_width 32} {:source_name "th"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$th: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$th: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$th: bool;

axiom {:array_info "$$pii"} {:global} {:elem_width 32} {:source_name "pii"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pii: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pii: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pii: bool;

axiom {:array_info "$$q"} {:global} {:elem_width 32} {:source_name "q"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$q: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$q: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$q: bool;

axiom {:array_info "$$qc"} {:global} {:elem_width 32} {:source_name "qc"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$qc: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$qc: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$qc: bool;

axiom {:array_info "$$qi"} {:global} {:elem_width 32} {:source_name "qi"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$qi: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$qi: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$qi: bool;

axiom {:array_info "$$qr"} {:global} {:elem_width 32} {:source_name "qr"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$qr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$qr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$qr: bool;

axiom {:array_info "$$qs"} {:global} {:elem_width 32} {:source_name "qs"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$qs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$qs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$qs: bool;

axiom {:array_info "$$den"} {:global} {:elem_width 32} {:source_name "den"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$den: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$den: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$den: bool;

axiom {:array_info "$$p"} {:global} {:elem_width 32} {:source_name "p"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$p: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$p: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$p: bool;

axiom {:array_info "$$delz"} {:global} {:elem_width 32} {:source_name "delz"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$delz: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$delz: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$delz: bool;

axiom {:array_info "$$rain"} {:global} {:elem_width 32} {:source_name "rain"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rain: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rain: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rain: bool;

axiom {:array_info "$$rainncv"} {:global} {:elem_width 32} {:source_name "rainncv"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rainncv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rainncv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rainncv: bool;

axiom {:array_info "$$sr"} {:global} {:elem_width 32} {:source_name "sr"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sr: bool;

axiom {:array_info "$$snow"} {:global} {:elem_width 32} {:source_name "snow"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$snow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$snow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$snow: bool;

axiom {:array_info "$$snowncv"} {:global} {:elem_width 32} {:source_name "snowncv"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$snowncv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$snowncv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$snowncv: bool;

axiom {:array_info "$$retvals"} {:global} {:elem_width 32} {:source_name "retvals"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$retvals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$retvals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$retvals: bool;

var {:source_name "t"} $$t$1: [bv32]bv32;

var {:source_name "t"} $$t$2: [bv32]bv32;

axiom {:array_info "$$t"} {:elem_width 32} {:source_name "t"} {:source_elem_width 32} {:source_dimensions "28"} true;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "wsm5_gpu"} {:kernel} $_Z8wsm5_gpuPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_fS_iiiiiiiiiiiiiiiiii($delt: bv32, $ids: bv32, $ide: bv32, $jds: bv32, $jde: bv32, $kds: bv32, $kde: bv32, $ims: bv32, $ime: bv32, $jms: bv32, $jme: bv32, $kms: bv32, $kme: bv32, $ips: bv32, $ipe: bv32, $jps: bv32, $jpe: bv32, $kps: bv32, $kpe: bv32);
  requires !_READ_HAS_OCCURRED_$$th && !_WRITE_HAS_OCCURRED_$$th && !_ATOMIC_HAS_OCCURRED_$$th;
  requires !_READ_HAS_OCCURRED_$$pii && !_WRITE_HAS_OCCURRED_$$pii && !_ATOMIC_HAS_OCCURRED_$$pii;
  requires !_READ_HAS_OCCURRED_$$q && !_WRITE_HAS_OCCURRED_$$q && !_ATOMIC_HAS_OCCURRED_$$q;
  requires !_READ_HAS_OCCURRED_$$qc && !_WRITE_HAS_OCCURRED_$$qc && !_ATOMIC_HAS_OCCURRED_$$qc;
  requires !_READ_HAS_OCCURRED_$$qi && !_WRITE_HAS_OCCURRED_$$qi && !_ATOMIC_HAS_OCCURRED_$$qi;
  requires !_READ_HAS_OCCURRED_$$qr && !_WRITE_HAS_OCCURRED_$$qr && !_ATOMIC_HAS_OCCURRED_$$qr;
  requires !_READ_HAS_OCCURRED_$$qs && !_WRITE_HAS_OCCURRED_$$qs && !_ATOMIC_HAS_OCCURRED_$$qs;
  requires !_READ_HAS_OCCURRED_$$den && !_WRITE_HAS_OCCURRED_$$den && !_ATOMIC_HAS_OCCURRED_$$den;
  requires !_READ_HAS_OCCURRED_$$p && !_WRITE_HAS_OCCURRED_$$p && !_ATOMIC_HAS_OCCURRED_$$p;
  requires !_READ_HAS_OCCURRED_$$delz && !_WRITE_HAS_OCCURRED_$$delz && !_ATOMIC_HAS_OCCURRED_$$delz;
  requires !_READ_HAS_OCCURRED_$$rain && !_WRITE_HAS_OCCURRED_$$rain && !_ATOMIC_HAS_OCCURRED_$$rain;
  requires !_READ_HAS_OCCURRED_$$rainncv && !_WRITE_HAS_OCCURRED_$$rainncv && !_ATOMIC_HAS_OCCURRED_$$rainncv;
  requires !_READ_HAS_OCCURRED_$$sr && !_WRITE_HAS_OCCURRED_$$sr && !_ATOMIC_HAS_OCCURRED_$$sr;
  requires !_READ_HAS_OCCURRED_$$snow && !_WRITE_HAS_OCCURRED_$$snow && !_ATOMIC_HAS_OCCURRED_$$snow;
  requires !_READ_HAS_OCCURRED_$$snowncv && !_WRITE_HAS_OCCURRED_$$snowncv && !_ATOMIC_HAS_OCCURRED_$$snowncv;
  requires !_READ_HAS_OCCURRED_$$retvals && !_WRITE_HAS_OCCURRED_$$retvals && !_ATOMIC_HAS_OCCURRED_$$retvals;
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



implementation {:source_name "wsm5_gpu"} {:kernel} $_Z8wsm5_gpuPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_fS_iiiiiiiiiiiiiiiiii($delt: bv32, $ids: bv32, $ide: bv32, $jds: bv32, $jde: bv32, $kds: bv32, $kde: bv32, $ims: bv32, $ime: bv32, $jms: bv32, $jme: bv32, $kms: bv32, $kme: bv32, $ips: bv32, $ipe: bv32, $jps: bv32, $jpe: bv32, $kps: bv32, $kpe: bv32)
{
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv64;
  var v2$2: bv64;
  var v3$1: bv64;
  var v3$2: bv64;
  var v4$1: bv64;
  var v4$2: bv64;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ULT(BV32_SUB(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x)), $ips), $ims), BV32_ADD(BV32_SUB($ide, $ids), 1bv32));
    v0$2 := BV32_ULT(BV32_SUB(BV32_ADD(BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x)), $ips), $ims), BV32_ADD(BV32_SUB($ide, $ids), 1bv32));
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := (if v0$1 then v0$1 else p0$1);
    p0$2 := (if v0$2 then v0$2 else p0$2);
    v1$1 := (if p0$1 then BV32_ULT(BV32_SUB(BV32_ADD(BV32_ADD(local_id_y$1, BV32_MUL(group_id_y$1, group_size_y)), $jps), $jms), BV32_ADD(BV32_SUB($jde, $jds), 1bv32)) else v1$1);
    v1$2 := (if p0$2 then BV32_ULT(BV32_SUB(BV32_ADD(BV32_ADD(local_id_y$2, BV32_MUL(group_id_y$2, group_size_y)), $jps), $jms), BV32_ADD(BV32_SUB($jde, $jds), 1bv32)) else v1$2);
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    call {:sourceloc_num 3} v2$1, v2$2 := $pow(4778730805012725760bv64, 4599676419421066581bv64, p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$pow"} true;
    call {:sourceloc_num 4} v3$1, v3$2 := $pow(4608443426566832126bv64, 4608683618675807573bv64, p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$pow"} true;
    call {:sourceloc_num 5} v4$1, v4$2 := $pow(4557750909289998844bv64, 4620693217682128896bv64, p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$pow"} true;
    $k.0$1 := (if p1$1 then BV32_SUB($kps, 1bv32) else $k.0$1);
    $k.0$2 := (if p1$2 then BV32_SUB($kps, 1bv32) else $k.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 6} p2$1 ==> true;
    v5$1 := (if p2$1 then BV32_SLE($k.0$1, BV32_SUB($kpe, 1bv32)) else v5$1);
    v5$2 := (if p2$2 then BV32_SLE($k.0$2, BV32_SUB($kpe, 1bv32)) else v5$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p2$2 && v5$2 then v5$2 else p3$2);
    p2$1 := (if p2$1 && !v5$1 then v5$1 else p2$1);
    p2$2 := (if p2$2 && !v5$2 then v5$2 else p2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p3$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p3$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p3$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p3$2 then _HAVOC_bv32$2 else v7$2);
    $$t$1[$k.0$1] := (if p3$1 then FMUL32(v6$1, v7$1) else $$t$1[$k.0$1]);
    $$t$2[$k.0$2] := (if p3$2 then FMUL32(v6$2, v7$2) else $$t$2[$k.0$2]);
    $k.0$1 := (if p3$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1);
    $k.0$2 := (if p3$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    return;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;
}



procedure {:source_name "pow"} $pow($0: bv64, $1: bv64, _P$1: bool, _P$2: bool) returns ($ret$1: bv64, $ret$2: bv64);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$th: bv32;

procedure {:inline 1} _LOG_READ_$$th(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$th;



implementation {:inline 1} _LOG_READ_$$th(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$th := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$th == _value then true else _READ_HAS_OCCURRED_$$th);
    return;
}



procedure _CHECK_READ_$$th(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "th"} {:array "$$th"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$th);
  requires {:source_name "th"} {:array "$$th"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$th: bool;

procedure {:inline 1} _LOG_WRITE_$$th(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$th, _WRITE_READ_BENIGN_FLAG_$$th;



implementation {:inline 1} _LOG_WRITE_$$th(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$th := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$th == _value then true else _WRITE_HAS_OCCURRED_$$th);
    _WRITE_READ_BENIGN_FLAG_$$th := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$th == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$th);
    return;
}



procedure _CHECK_WRITE_$$th(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "th"} {:array "$$th"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$th != _value);
  requires {:source_name "th"} {:array "$$th"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$th != _value);
  requires {:source_name "th"} {:array "$$th"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$th(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$th;



implementation {:inline 1} _LOG_ATOMIC_$$th(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$th := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$th);
    return;
}



procedure _CHECK_ATOMIC_$$th(_P: bool, _offset: bv32);
  requires {:source_name "th"} {:array "$$th"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset);
  requires {:source_name "th"} {:array "$$th"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$th(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$th;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$th(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$th := (if _P && _WRITE_HAS_OCCURRED_$$th && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$th);
    return;
}



const _WATCHED_VALUE_$$pii: bv32;

procedure {:inline 1} _LOG_READ_$$pii(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pii;



implementation {:inline 1} _LOG_READ_$$pii(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pii := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pii == _value then true else _READ_HAS_OCCURRED_$$pii);
    return;
}



procedure _CHECK_READ_$$pii(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pii);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pii: bool;

procedure {:inline 1} _LOG_WRITE_$$pii(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pii, _WRITE_READ_BENIGN_FLAG_$$pii;



implementation {:inline 1} _LOG_WRITE_$$pii(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pii := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pii == _value then true else _WRITE_HAS_OCCURRED_$$pii);
    _WRITE_READ_BENIGN_FLAG_$$pii := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pii == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pii);
    return;
}



procedure _CHECK_WRITE_$$pii(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pii != _value);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pii != _value);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pii(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pii;



implementation {:inline 1} _LOG_ATOMIC_$$pii(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pii := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pii);
    return;
}



procedure _CHECK_ATOMIC_$$pii(_P: bool, _offset: bv32);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset);
  requires {:source_name "pii"} {:array "$$pii"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pii(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pii;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pii(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pii := (if _P && _WRITE_HAS_OCCURRED_$$pii && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pii);
    return;
}



const _WATCHED_VALUE_$$q: bv32;

procedure {:inline 1} _LOG_READ_$$q(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$q;



implementation {:inline 1} _LOG_READ_$$q(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then true else _READ_HAS_OCCURRED_$$q);
    return;
}



procedure _CHECK_READ_$$q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$q);
  requires {:source_name "q"} {:array "$$q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$q: bool;

procedure {:inline 1} _LOG_WRITE_$$q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$q, _WRITE_READ_BENIGN_FLAG_$$q;



implementation {:inline 1} _LOG_WRITE_$$q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then true else _WRITE_HAS_OCCURRED_$$q);
    _WRITE_READ_BENIGN_FLAG_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$q);
    return;
}



procedure _CHECK_WRITE_$$q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q != _value);
  requires {:source_name "q"} {:array "$$q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q != _value);
  requires {:source_name "q"} {:array "$$q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$q;



implementation {:inline 1} _LOG_ATOMIC_$$q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$q);
    return;
}



procedure _CHECK_ATOMIC_$$q(_P: bool, _offset: bv32);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);
  requires {:source_name "q"} {:array "$$q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$q := (if _P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$q);
    return;
}



const _WATCHED_VALUE_$$qc: bv32;

procedure {:inline 1} _LOG_READ_$$qc(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$qc;



implementation {:inline 1} _LOG_READ_$$qc(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$qc := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qc == _value then true else _READ_HAS_OCCURRED_$$qc);
    return;
}



procedure _CHECK_READ_$$qc(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$qc);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$qc: bool;

procedure {:inline 1} _LOG_WRITE_$$qc(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$qc, _WRITE_READ_BENIGN_FLAG_$$qc;



implementation {:inline 1} _LOG_WRITE_$$qc(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$qc := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qc == _value then true else _WRITE_HAS_OCCURRED_$$qc);
    _WRITE_READ_BENIGN_FLAG_$$qc := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qc == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$qc);
    return;
}



procedure _CHECK_WRITE_$$qc(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qc != _value);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qc != _value);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$qc(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$qc;



implementation {:inline 1} _LOG_ATOMIC_$$qc(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$qc := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$qc);
    return;
}



procedure _CHECK_ATOMIC_$$qc(_P: bool, _offset: bv32);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset);
  requires {:source_name "qc"} {:array "$$qc"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qc(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$qc;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qc(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$qc := (if _P && _WRITE_HAS_OCCURRED_$$qc && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$qc);
    return;
}



const _WATCHED_VALUE_$$qi: bv32;

procedure {:inline 1} _LOG_READ_$$qi(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$qi;



implementation {:inline 1} _LOG_READ_$$qi(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qi == _value then true else _READ_HAS_OCCURRED_$$qi);
    return;
}



procedure _CHECK_READ_$$qi(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$qi);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$qi: bool;

procedure {:inline 1} _LOG_WRITE_$$qi(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$qi, _WRITE_READ_BENIGN_FLAG_$$qi;



implementation {:inline 1} _LOG_WRITE_$$qi(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qi == _value then true else _WRITE_HAS_OCCURRED_$$qi);
    _WRITE_READ_BENIGN_FLAG_$$qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qi == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$qi);
    return;
}



procedure _CHECK_WRITE_$$qi(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qi != _value);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qi != _value);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$qi(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$qi;



implementation {:inline 1} _LOG_ATOMIC_$$qi(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$qi := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$qi);
    return;
}



procedure _CHECK_ATOMIC_$$qi(_P: bool, _offset: bv32);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset);
  requires {:source_name "qi"} {:array "$$qi"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qi(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$qi;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qi(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$qi := (if _P && _WRITE_HAS_OCCURRED_$$qi && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$qi);
    return;
}



const _WATCHED_VALUE_$$qr: bv32;

procedure {:inline 1} _LOG_READ_$$qr(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$qr;



implementation {:inline 1} _LOG_READ_$$qr(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qr == _value then true else _READ_HAS_OCCURRED_$$qr);
    return;
}



procedure _CHECK_READ_$$qr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$qr);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$qr: bool;

procedure {:inline 1} _LOG_WRITE_$$qr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$qr, _WRITE_READ_BENIGN_FLAG_$$qr;



implementation {:inline 1} _LOG_WRITE_$$qr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qr == _value then true else _WRITE_HAS_OCCURRED_$$qr);
    _WRITE_READ_BENIGN_FLAG_$$qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qr == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$qr);
    return;
}



procedure _CHECK_WRITE_$$qr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qr != _value);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qr != _value);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$qr(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$qr;



implementation {:inline 1} _LOG_ATOMIC_$$qr(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$qr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$qr);
    return;
}



procedure _CHECK_ATOMIC_$$qr(_P: bool, _offset: bv32);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset);
  requires {:source_name "qr"} {:array "$$qr"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qr(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$qr;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qr(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$qr := (if _P && _WRITE_HAS_OCCURRED_$$qr && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$qr);
    return;
}



const _WATCHED_VALUE_$$qs: bv32;

procedure {:inline 1} _LOG_READ_$$qs(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$qs;



implementation {:inline 1} _LOG_READ_$$qs(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$qs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qs == _value then true else _READ_HAS_OCCURRED_$$qs);
    return;
}



procedure _CHECK_READ_$$qs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$qs);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$qs: bool;

procedure {:inline 1} _LOG_WRITE_$$qs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$qs, _WRITE_READ_BENIGN_FLAG_$$qs;



implementation {:inline 1} _LOG_WRITE_$$qs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$qs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qs == _value then true else _WRITE_HAS_OCCURRED_$$qs);
    _WRITE_READ_BENIGN_FLAG_$$qs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qs == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$qs);
    return;
}



procedure _CHECK_WRITE_$$qs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qs != _value);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$qs != _value);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$qs(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$qs;



implementation {:inline 1} _LOG_ATOMIC_$$qs(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$qs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$qs);
    return;
}



procedure _CHECK_ATOMIC_$$qs(_P: bool, _offset: bv32);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset);
  requires {:source_name "qs"} {:array "$$qs"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qs(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$qs;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$qs(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$qs := (if _P && _WRITE_HAS_OCCURRED_$$qs && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$qs);
    return;
}



const _WATCHED_VALUE_$$den: bv32;

procedure {:inline 1} _LOG_READ_$$den(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$den;



implementation {:inline 1} _LOG_READ_$$den(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$den := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$den == _value then true else _READ_HAS_OCCURRED_$$den);
    return;
}



procedure _CHECK_READ_$$den(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "den"} {:array "$$den"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$den);
  requires {:source_name "den"} {:array "$$den"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$den: bool;

procedure {:inline 1} _LOG_WRITE_$$den(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$den, _WRITE_READ_BENIGN_FLAG_$$den;



implementation {:inline 1} _LOG_WRITE_$$den(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$den := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$den == _value then true else _WRITE_HAS_OCCURRED_$$den);
    _WRITE_READ_BENIGN_FLAG_$$den := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$den == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$den);
    return;
}



procedure _CHECK_WRITE_$$den(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "den"} {:array "$$den"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$den != _value);
  requires {:source_name "den"} {:array "$$den"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$den != _value);
  requires {:source_name "den"} {:array "$$den"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$den(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$den;



implementation {:inline 1} _LOG_ATOMIC_$$den(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$den := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$den);
    return;
}



procedure _CHECK_ATOMIC_$$den(_P: bool, _offset: bv32);
  requires {:source_name "den"} {:array "$$den"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset);
  requires {:source_name "den"} {:array "$$den"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$den(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$den;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$den(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$den := (if _P && _WRITE_HAS_OCCURRED_$$den && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$den);
    return;
}



const _WATCHED_VALUE_$$p: bv32;

procedure {:inline 1} _LOG_READ_$$p(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$p;



implementation {:inline 1} _LOG_READ_$$p(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then true else _READ_HAS_OCCURRED_$$p);
    return;
}



procedure _CHECK_READ_$$p(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$p);
  requires {:source_name "p"} {:array "$$p"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$p: bool;

procedure {:inline 1} _LOG_WRITE_$$p(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$p, _WRITE_READ_BENIGN_FLAG_$$p;



implementation {:inline 1} _LOG_WRITE_$$p(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then true else _WRITE_HAS_OCCURRED_$$p);
    _WRITE_READ_BENIGN_FLAG_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$p);
    return;
}



procedure _CHECK_WRITE_$$p(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p != _value);
  requires {:source_name "p"} {:array "$$p"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p != _value);
  requires {:source_name "p"} {:array "$$p"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$p(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$p;



implementation {:inline 1} _LOG_ATOMIC_$$p(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$p);
    return;
}



procedure _CHECK_ATOMIC_$$p(_P: bool, _offset: bv32);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);
  requires {:source_name "p"} {:array "$$p"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$p(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$p;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$p(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$p := (if _P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$p);
    return;
}



const _WATCHED_VALUE_$$delz: bv32;

procedure {:inline 1} _LOG_READ_$$delz(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$delz;



implementation {:inline 1} _LOG_READ_$$delz(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$delz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$delz == _value then true else _READ_HAS_OCCURRED_$$delz);
    return;
}



procedure _CHECK_READ_$$delz(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$delz);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$delz: bool;

procedure {:inline 1} _LOG_WRITE_$$delz(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$delz, _WRITE_READ_BENIGN_FLAG_$$delz;



implementation {:inline 1} _LOG_WRITE_$$delz(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$delz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$delz == _value then true else _WRITE_HAS_OCCURRED_$$delz);
    _WRITE_READ_BENIGN_FLAG_$$delz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$delz == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$delz);
    return;
}



procedure _CHECK_WRITE_$$delz(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$delz != _value);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$delz != _value);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$delz(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$delz;



implementation {:inline 1} _LOG_ATOMIC_$$delz(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$delz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$delz);
    return;
}



procedure _CHECK_ATOMIC_$$delz(_P: bool, _offset: bv32);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset);
  requires {:source_name "delz"} {:array "$$delz"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$delz(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$delz;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$delz(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$delz := (if _P && _WRITE_HAS_OCCURRED_$$delz && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$delz);
    return;
}



const _WATCHED_VALUE_$$rain: bv32;

procedure {:inline 1} _LOG_READ_$$rain(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rain;



implementation {:inline 1} _LOG_READ_$$rain(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rain := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rain == _value then true else _READ_HAS_OCCURRED_$$rain);
    return;
}



procedure _CHECK_READ_$$rain(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rain);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rain: bool;

procedure {:inline 1} _LOG_WRITE_$$rain(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rain, _WRITE_READ_BENIGN_FLAG_$$rain;



implementation {:inline 1} _LOG_WRITE_$$rain(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rain := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rain == _value then true else _WRITE_HAS_OCCURRED_$$rain);
    _WRITE_READ_BENIGN_FLAG_$$rain := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rain == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rain);
    return;
}



procedure _CHECK_WRITE_$$rain(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rain != _value);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rain != _value);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rain(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rain;



implementation {:inline 1} _LOG_ATOMIC_$$rain(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rain := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rain);
    return;
}



procedure _CHECK_ATOMIC_$$rain(_P: bool, _offset: bv32);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset);
  requires {:source_name "rain"} {:array "$$rain"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rain(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rain;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rain(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rain := (if _P && _WRITE_HAS_OCCURRED_$$rain && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rain);
    return;
}



const _WATCHED_VALUE_$$rainncv: bv32;

procedure {:inline 1} _LOG_READ_$$rainncv(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rainncv;



implementation {:inline 1} _LOG_READ_$$rainncv(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rainncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rainncv == _value then true else _READ_HAS_OCCURRED_$$rainncv);
    return;
}



procedure _CHECK_READ_$$rainncv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rainncv);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rainncv: bool;

procedure {:inline 1} _LOG_WRITE_$$rainncv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rainncv, _WRITE_READ_BENIGN_FLAG_$$rainncv;



implementation {:inline 1} _LOG_WRITE_$$rainncv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rainncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rainncv == _value then true else _WRITE_HAS_OCCURRED_$$rainncv);
    _WRITE_READ_BENIGN_FLAG_$$rainncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rainncv == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rainncv);
    return;
}



procedure _CHECK_WRITE_$$rainncv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rainncv != _value);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rainncv != _value);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rainncv(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rainncv;



implementation {:inline 1} _LOG_ATOMIC_$$rainncv(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rainncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rainncv);
    return;
}



procedure _CHECK_ATOMIC_$$rainncv(_P: bool, _offset: bv32);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset);
  requires {:source_name "rainncv"} {:array "$$rainncv"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rainncv(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rainncv;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rainncv(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rainncv := (if _P && _WRITE_HAS_OCCURRED_$$rainncv && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rainncv);
    return;
}



const _WATCHED_VALUE_$$sr: bv32;

procedure {:inline 1} _LOG_READ_$$sr(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sr;



implementation {:inline 1} _LOG_READ_$$sr(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sr == _value then true else _READ_HAS_OCCURRED_$$sr);
    return;
}



procedure _CHECK_READ_$$sr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sr);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sr: bool;

procedure {:inline 1} _LOG_WRITE_$$sr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sr, _WRITE_READ_BENIGN_FLAG_$$sr;



implementation {:inline 1} _LOG_WRITE_$$sr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sr == _value then true else _WRITE_HAS_OCCURRED_$$sr);
    _WRITE_READ_BENIGN_FLAG_$$sr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sr == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sr);
    return;
}



procedure _CHECK_WRITE_$$sr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sr != _value);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sr != _value);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sr(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sr;



implementation {:inline 1} _LOG_ATOMIC_$$sr(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sr);
    return;
}



procedure _CHECK_ATOMIC_$$sr(_P: bool, _offset: bv32);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset);
  requires {:source_name "sr"} {:array "$$sr"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sr(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sr;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sr(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sr := (if _P && _WRITE_HAS_OCCURRED_$$sr && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sr);
    return;
}



const _WATCHED_VALUE_$$snow: bv32;

procedure {:inline 1} _LOG_READ_$$snow(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$snow;



implementation {:inline 1} _LOG_READ_$$snow(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$snow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snow == _value then true else _READ_HAS_OCCURRED_$$snow);
    return;
}



procedure _CHECK_READ_$$snow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$snow);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$snow: bool;

procedure {:inline 1} _LOG_WRITE_$$snow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$snow, _WRITE_READ_BENIGN_FLAG_$$snow;



implementation {:inline 1} _LOG_WRITE_$$snow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$snow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snow == _value then true else _WRITE_HAS_OCCURRED_$$snow);
    _WRITE_READ_BENIGN_FLAG_$$snow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snow == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$snow);
    return;
}



procedure _CHECK_WRITE_$$snow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snow != _value);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snow != _value);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$snow(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$snow;



implementation {:inline 1} _LOG_ATOMIC_$$snow(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$snow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$snow);
    return;
}



procedure _CHECK_ATOMIC_$$snow(_P: bool, _offset: bv32);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset);
  requires {:source_name "snow"} {:array "$$snow"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$snow(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$snow;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$snow(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$snow := (if _P && _WRITE_HAS_OCCURRED_$$snow && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$snow);
    return;
}



const _WATCHED_VALUE_$$snowncv: bv32;

procedure {:inline 1} _LOG_READ_$$snowncv(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$snowncv;



implementation {:inline 1} _LOG_READ_$$snowncv(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$snowncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snowncv == _value then true else _READ_HAS_OCCURRED_$$snowncv);
    return;
}



procedure _CHECK_READ_$$snowncv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$snowncv);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$snowncv: bool;

procedure {:inline 1} _LOG_WRITE_$$snowncv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$snowncv, _WRITE_READ_BENIGN_FLAG_$$snowncv;



implementation {:inline 1} _LOG_WRITE_$$snowncv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$snowncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snowncv == _value then true else _WRITE_HAS_OCCURRED_$$snowncv);
    _WRITE_READ_BENIGN_FLAG_$$snowncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snowncv == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$snowncv);
    return;
}



procedure _CHECK_WRITE_$$snowncv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snowncv != _value);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$snowncv != _value);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$snowncv(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$snowncv;



implementation {:inline 1} _LOG_ATOMIC_$$snowncv(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$snowncv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$snowncv);
    return;
}



procedure _CHECK_ATOMIC_$$snowncv(_P: bool, _offset: bv32);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset);
  requires {:source_name "snowncv"} {:array "$$snowncv"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$snowncv(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$snowncv;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$snowncv(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$snowncv := (if _P && _WRITE_HAS_OCCURRED_$$snowncv && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$snowncv);
    return;
}



const _WATCHED_VALUE_$$retvals: bv32;

procedure {:inline 1} _LOG_READ_$$retvals(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$retvals;



implementation {:inline 1} _LOG_READ_$$retvals(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$retvals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$retvals == _value then true else _READ_HAS_OCCURRED_$$retvals);
    return;
}



procedure _CHECK_READ_$$retvals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$retvals);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$retvals: bool;

procedure {:inline 1} _LOG_WRITE_$$retvals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$retvals, _WRITE_READ_BENIGN_FLAG_$$retvals;



implementation {:inline 1} _LOG_WRITE_$$retvals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$retvals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$retvals == _value then true else _WRITE_HAS_OCCURRED_$$retvals);
    _WRITE_READ_BENIGN_FLAG_$$retvals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$retvals == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$retvals);
    return;
}



procedure _CHECK_WRITE_$$retvals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$retvals != _value);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$retvals != _value);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$retvals(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$retvals;



implementation {:inline 1} _LOG_ATOMIC_$$retvals(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$retvals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$retvals);
    return;
}



procedure _CHECK_ATOMIC_$$retvals(_P: bool, _offset: bv32);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset);
  requires {:source_name "retvals"} {:array "$$retvals"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$retvals(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$retvals;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$retvals(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$retvals := (if _P && _WRITE_HAS_OCCURRED_$$retvals && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$retvals);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
