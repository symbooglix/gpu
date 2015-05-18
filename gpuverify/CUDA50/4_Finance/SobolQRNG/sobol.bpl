type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$d_directions"} {:global} {:elem_width 32} {:source_name "d_directions"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_directions: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_directions: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_directions: bool;

var {:source_name "d_output"} {:global} $$d_output: [bv32]bv32;

axiom {:array_info "$$d_output"} {:global} {:elem_width 32} {:source_name "d_output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_output: bool;

var {:source_name "v"} {:group_shared} $$_ZZ15sobolGPU_kerneljjPjPfE1v: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:group_shared} {:elem_width 32} {:source_name "v"} {:source_elem_width 32} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v: bool;

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

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FMUL32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure BV32_CTLZ(isZeroUndef: bool, _P$1: bool, val$1: bv32, _P$2: bool, val$2: bv32) returns (count$1: bv32, count$2: bv32);
  requires _P$1 ==> isZeroUndef == false;
  requires _P$2 ==> isZeroUndef == false;
  ensures _P$1 ==> val$1 == 0bv32 && !isZeroUndef ==> count$1 == 32bv32;
  ensures _P$2 ==> val$2 == 0bv32 && !isZeroUndef ==> count$2 == 32bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 1bv32) == 0bv32 && BV32_LSHR(val$1, 0bv32) != 0bv32 ==> count$1 == 31bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 1bv32) == 0bv32 && BV32_LSHR(val$2, 0bv32) != 0bv32 ==> count$2 == 31bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 2bv32) == 0bv32 && BV32_LSHR(val$1, 1bv32) != 0bv32 ==> count$1 == 30bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 2bv32) == 0bv32 && BV32_LSHR(val$2, 1bv32) != 0bv32 ==> count$2 == 30bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 3bv32) == 0bv32 && BV32_LSHR(val$1, 2bv32) != 0bv32 ==> count$1 == 29bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 3bv32) == 0bv32 && BV32_LSHR(val$2, 2bv32) != 0bv32 ==> count$2 == 29bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 4bv32) == 0bv32 && BV32_LSHR(val$1, 3bv32) != 0bv32 ==> count$1 == 28bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 4bv32) == 0bv32 && BV32_LSHR(val$2, 3bv32) != 0bv32 ==> count$2 == 28bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 5bv32) == 0bv32 && BV32_LSHR(val$1, 4bv32) != 0bv32 ==> count$1 == 27bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 5bv32) == 0bv32 && BV32_LSHR(val$2, 4bv32) != 0bv32 ==> count$2 == 27bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 6bv32) == 0bv32 && BV32_LSHR(val$1, 5bv32) != 0bv32 ==> count$1 == 26bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 6bv32) == 0bv32 && BV32_LSHR(val$2, 5bv32) != 0bv32 ==> count$2 == 26bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 7bv32) == 0bv32 && BV32_LSHR(val$1, 6bv32) != 0bv32 ==> count$1 == 25bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 7bv32) == 0bv32 && BV32_LSHR(val$2, 6bv32) != 0bv32 ==> count$2 == 25bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 8bv32) == 0bv32 && BV32_LSHR(val$1, 7bv32) != 0bv32 ==> count$1 == 24bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 8bv32) == 0bv32 && BV32_LSHR(val$2, 7bv32) != 0bv32 ==> count$2 == 24bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 9bv32) == 0bv32 && BV32_LSHR(val$1, 8bv32) != 0bv32 ==> count$1 == 23bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 9bv32) == 0bv32 && BV32_LSHR(val$2, 8bv32) != 0bv32 ==> count$2 == 23bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 10bv32) == 0bv32 && BV32_LSHR(val$1, 9bv32) != 0bv32 ==> count$1 == 22bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 10bv32) == 0bv32 && BV32_LSHR(val$2, 9bv32) != 0bv32 ==> count$2 == 22bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 11bv32) == 0bv32 && BV32_LSHR(val$1, 10bv32) != 0bv32 ==> count$1 == 21bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 11bv32) == 0bv32 && BV32_LSHR(val$2, 10bv32) != 0bv32 ==> count$2 == 21bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 12bv32) == 0bv32 && BV32_LSHR(val$1, 11bv32) != 0bv32 ==> count$1 == 20bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 12bv32) == 0bv32 && BV32_LSHR(val$2, 11bv32) != 0bv32 ==> count$2 == 20bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 13bv32) == 0bv32 && BV32_LSHR(val$1, 12bv32) != 0bv32 ==> count$1 == 19bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 13bv32) == 0bv32 && BV32_LSHR(val$2, 12bv32) != 0bv32 ==> count$2 == 19bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 14bv32) == 0bv32 && BV32_LSHR(val$1, 13bv32) != 0bv32 ==> count$1 == 18bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 14bv32) == 0bv32 && BV32_LSHR(val$2, 13bv32) != 0bv32 ==> count$2 == 18bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 15bv32) == 0bv32 && BV32_LSHR(val$1, 14bv32) != 0bv32 ==> count$1 == 17bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 15bv32) == 0bv32 && BV32_LSHR(val$2, 14bv32) != 0bv32 ==> count$2 == 17bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 16bv32) == 0bv32 && BV32_LSHR(val$1, 15bv32) != 0bv32 ==> count$1 == 16bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 16bv32) == 0bv32 && BV32_LSHR(val$2, 15bv32) != 0bv32 ==> count$2 == 16bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 17bv32) == 0bv32 && BV32_LSHR(val$1, 16bv32) != 0bv32 ==> count$1 == 15bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 17bv32) == 0bv32 && BV32_LSHR(val$2, 16bv32) != 0bv32 ==> count$2 == 15bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 18bv32) == 0bv32 && BV32_LSHR(val$1, 17bv32) != 0bv32 ==> count$1 == 14bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 18bv32) == 0bv32 && BV32_LSHR(val$2, 17bv32) != 0bv32 ==> count$2 == 14bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 19bv32) == 0bv32 && BV32_LSHR(val$1, 18bv32) != 0bv32 ==> count$1 == 13bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 19bv32) == 0bv32 && BV32_LSHR(val$2, 18bv32) != 0bv32 ==> count$2 == 13bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 20bv32) == 0bv32 && BV32_LSHR(val$1, 19bv32) != 0bv32 ==> count$1 == 12bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 20bv32) == 0bv32 && BV32_LSHR(val$2, 19bv32) != 0bv32 ==> count$2 == 12bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 21bv32) == 0bv32 && BV32_LSHR(val$1, 20bv32) != 0bv32 ==> count$1 == 11bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 21bv32) == 0bv32 && BV32_LSHR(val$2, 20bv32) != 0bv32 ==> count$2 == 11bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 22bv32) == 0bv32 && BV32_LSHR(val$1, 21bv32) != 0bv32 ==> count$1 == 10bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 22bv32) == 0bv32 && BV32_LSHR(val$2, 21bv32) != 0bv32 ==> count$2 == 10bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 23bv32) == 0bv32 && BV32_LSHR(val$1, 22bv32) != 0bv32 ==> count$1 == 9bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 23bv32) == 0bv32 && BV32_LSHR(val$2, 22bv32) != 0bv32 ==> count$2 == 9bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 24bv32) == 0bv32 && BV32_LSHR(val$1, 23bv32) != 0bv32 ==> count$1 == 8bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 24bv32) == 0bv32 && BV32_LSHR(val$2, 23bv32) != 0bv32 ==> count$2 == 8bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 25bv32) == 0bv32 && BV32_LSHR(val$1, 24bv32) != 0bv32 ==> count$1 == 7bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 25bv32) == 0bv32 && BV32_LSHR(val$2, 24bv32) != 0bv32 ==> count$2 == 7bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 26bv32) == 0bv32 && BV32_LSHR(val$1, 25bv32) != 0bv32 ==> count$1 == 6bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 26bv32) == 0bv32 && BV32_LSHR(val$2, 25bv32) != 0bv32 ==> count$2 == 6bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 27bv32) == 0bv32 && BV32_LSHR(val$1, 26bv32) != 0bv32 ==> count$1 == 5bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 27bv32) == 0bv32 && BV32_LSHR(val$2, 26bv32) != 0bv32 ==> count$2 == 5bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 28bv32) == 0bv32 && BV32_LSHR(val$1, 27bv32) != 0bv32 ==> count$1 == 4bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 28bv32) == 0bv32 && BV32_LSHR(val$2, 27bv32) != 0bv32 ==> count$2 == 4bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 29bv32) == 0bv32 && BV32_LSHR(val$1, 28bv32) != 0bv32 ==> count$1 == 3bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 29bv32) == 0bv32 && BV32_LSHR(val$2, 28bv32) != 0bv32 ==> count$2 == 3bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 30bv32) == 0bv32 && BV32_LSHR(val$1, 29bv32) != 0bv32 ==> count$1 == 2bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 30bv32) == 0bv32 && BV32_LSHR(val$2, 29bv32) != 0bv32 ==> count$2 == 2bv32;
  ensures _P$1 ==> BV32_LSHR(val$1, 31bv32) == 0bv32 && BV32_LSHR(val$1, 30bv32) != 0bv32 ==> count$1 == 1bv32;
  ensures _P$2 ==> BV32_LSHR(val$2, 31bv32) == 0bv32 && BV32_LSHR(val$2, 30bv32) != 0bv32 ==> count$2 == 1bv32;



procedure {:source_name "sobolGPU_kernel"} {:kernel} $_Z15sobolGPU_kerneljjPjPf($n_vectors: bv32, $n_dimensions: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n_vectors == 100000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $n_dimensions == 100bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_directions && !_WRITE_HAS_OCCURRED_$$d_directions && !_ATOMIC_HAS_OCCURRED_$$d_directions;
  requires !_READ_HAS_OCCURRED_$$d_output && !_WRITE_HAS_OCCURRED_$$d_output && !_ATOMIC_HAS_OCCURRED_$$d_output;
  requires !_READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && !_WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && !_ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;
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
  modifies $$_ZZ15sobolGPU_kerneljjPjPfE1v, _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v, _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v, _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v, $$d_output, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v, _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:source_name "sobolGPU_kernel"} {:kernel} $_Z15sobolGPU_kerneljjPjPf($n_vectors: bv32, $n_dimensions: bv32)
{
  var $g.0$1: bv32;
  var $g.0$2: bv32;
  var $X.0$1: bv32;
  var $X.0$2: bv32;
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var $X.1$1: bv32;
  var $X.1$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_MUL(32bv32, group_id_y$1);
    v0$2 := BV32_MUL(32bv32, group_id_y$2);
    v1$1 := BV32_MUL($n_vectors, group_id_y$1);
    v1$2 := BV32_MUL($n_vectors, group_id_y$2);
    v2$1 := BV32_ULT(local_id_x$1, 32bv32);
    v2$2 := BV32_ULT(local_id_x$2, 32bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p7$1 := false;
    p7$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p0$1, local_id_x$1, v3$1, $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p0$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p0$2, local_id_x$2, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v"} true;
    $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][local_id_x$1] := (if p0$1 then v3$1 else $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][local_id_x$1]);
    $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p0$2 then v3$2 else $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v4$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x));
    v4$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x));
    v5 := BV32_MUL(num_groups_x, group_size_x);
    $g.0$1, $X.0$1, $k.0$1 := BV32_XOR(v4$1, BV32_ASHR(v4$1, 1bv32)), 0bv32, 0bv32;
    $g.0$2, $X.0$2, $k.0$2 := BV32_XOR(v4$2, BV32_ASHR(v4$2, 1bv32)), 0bv32, 0bv32;
    p2$1 := true;
    p2$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "pow2NotZero"} _b14 ==> $g.0$2 != 0bv32;
    assert {:tag "pow2"} _b13 ==> $g.0$2 == 0bv32 || BV32_AND($g.0$2, BV32_SUB($g.0$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b12 ==> $g.0$1 != 0bv32;
    assert {:tag "pow2"} _b11 ==> $g.0$1 == 0bv32 || BV32_AND($g.0$1, BV32_SUB($g.0$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b4 ==> BV32_ULT($k.0$1, BV32_SUB(BV32_SUB(32bv32, v6$1), 1bv32)) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b4 ==> BV32_ULT($k.0$2, BV32_SUB(BV32_SUB(32bv32, v6$2), 1bv32)) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b3 ==> BV32_UGE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b3 ==> BV32_UGE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b2 ==> BV32_ULE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b2 ==> BV32_ULE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b1 ==> BV32_SGE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b1 ==> BV32_SGE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b0 ==> BV32_SLE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b0 ==> BV32_SLE($k.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 8} p2$1 ==> true;
    call v6$1, v6$2 := BV32_CTLZ(false, p2$1, BV32_AND(v5, BV32_SUB(0bv32, v5)), p2$2, BV32_AND(v5, BV32_SUB(0bv32, v5)));
    assume {:captureState "call_return_state_0"} {:procedureName "BV32_CTLZ"} true;
    v7$1 := (if p2$1 then BV32_ULT($k.0$1, BV32_SUB(BV32_SUB(32bv32, v6$1), 1bv32)) else v7$1);
    v7$2 := (if p2$2 then BV32_ULT($k.0$2, BV32_SUB(BV32_SUB(32bv32, v6$2), 1bv32)) else v7$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p3$1 := (if p2$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p2$2 && v7$2 then v7$2 else p3$2);
    p2$1 := (if p2$1 && !v7$1 then v7$1 else p2$1);
    p2$2 := (if p2$2 && !v7$2 then v7$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p3$1, $k.0$1, $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][$k.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p3$2, $k.0$2, $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$k.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v"} true;
    v8$1 := (if p3$1 then $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][$k.0$1] else v8$1);
    v8$2 := (if p3$2 then $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$k.0$2] else v8$2);
    $g.0$1, $X.0$1, $k.0$1 := (if p3$1 then BV32_LSHR($g.0$1, 1bv32) else $g.0$1), (if p3$1 then BV32_XOR($X.0$1, BV32_AND(BV32_SUB(0bv32, BV32_AND($g.0$1, 1bv32)), v8$1)) else $X.0$1), (if p3$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1);
    $g.0$2, $X.0$2, $k.0$2 := (if p3$2 then BV32_LSHR($g.0$2, 1bv32) else $g.0$2), (if p3$2 then BV32_XOR($X.0$2, BV32_AND(BV32_SUB(0bv32, BV32_AND($g.0$2, 1bv32)), v8$2)) else $X.0$2), (if p3$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    v9$1 := BV32_ULT(v4$1, $n_vectors);
    v9$2 := BV32_ULT(v4$2, $n_vectors);
    p5$1 := (if v9$1 then v9$1 else p5$1);
    p5$2 := (if v9$2 then v9$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$d_output(p5$1, BV32_ADD(v1$1, v4$1), FMUL32(UI32_TO_FP32($X.0$1), 796917760bv32), $$d_output[BV32_ADD(v1$1, v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p5$2, BV32_ADD(v1$2, v4$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$d_output(p5$2, BV32_ADD(v1$2, v4$2), FMUL32(UI32_TO_FP32($X.0$2), 796917760bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(v1$1, v4$1)] := (if p5$1 then FMUL32(UI32_TO_FP32($X.0$1), 796917760bv32) else $$d_output[BV32_ADD(v1$1, v4$1)]);
    $$d_output[BV32_ADD(v1$2, v4$2)] := (if p5$2 then FMUL32(UI32_TO_FP32($X.0$2), 796917760bv32) else $$d_output[BV32_ADD(v1$2, v4$2)]);
    call v10$1, v10$2 := BV32_CTLZ(false, true, BV32_AND(v5, BV32_SUB(0bv32, v5)), true, BV32_AND(v5, BV32_SUB(0bv32, v5)));
    assume {:captureState "call_return_state_0"} {:procedureName "BV32_CTLZ"} true;
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(true, BV32_SUB(BV32_SUB(32bv32, v10$1), 2bv32), $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][BV32_SUB(BV32_SUB(32bv32, v10$1), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(true, BV32_SUB(BV32_SUB(32bv32, v10$2), 2bv32), $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_SUB(32bv32, v10$2), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v"} true;
    v11$1 := $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][BV32_SUB(BV32_SUB(32bv32, v10$1), 2bv32)];
    v11$2 := $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_SUB(32bv32, v10$2), 2bv32)];
    $X.1$1, $i.0$1 := $X.0$1, BV32_ADD(v4$1, v5);
    $X.1$2, $i.0$2 := $X.0$2, BV32_ADD(v4$2, v5);
    p7$1 := true;
    p7$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b18 ==> _WRITE_HAS_OCCURRED_$$d_output ==> group_id_y$1 == BV32_DIV(_WATCHED_OFFSET, $n_vectors);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _WRITE_HAS_OCCURRED_$$d_output ==> BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x)), BV32_MUL(num_groups_x, group_size_x)), BV32_MUL($n_vectors, group_id_y$1)));
    assert {:tag "accessUpperBoundBlock"} _b16 ==> _WRITE_HAS_OCCURRED_$$d_output ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL($n_vectors, BV32_ADD(group_id_y$1, 1bv32)));
    assert {:tag "accessLowerBoundBlock"} _b15 ==> _WRITE_HAS_OCCURRED_$$d_output ==> BV32_SLE(BV32_MUL($n_vectors, group_id_y$1), _WATCHED_OFFSET);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b10 ==> BV32_ULT($i.0$1, $n_vectors) ==> p7$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b10 ==> BV32_ULT($i.0$2, $n_vectors) ==> p7$2;
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b9 ==> BV32_UGE($i.0$1, BV32_ADD(v4$1, v5));
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b9 ==> BV32_UGE($i.0$2, BV32_ADD(v4$2, v5));
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b8 ==> BV32_ULE($i.0$1, BV32_ADD(v4$1, v5));
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b8 ==> BV32_ULE($i.0$2, BV32_ADD(v4$2, v5));
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b7 ==> BV32_SGE($i.0$1, BV32_ADD(v4$1, v5));
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b7 ==> BV32_SGE($i.0$2, BV32_ADD(v4$2, v5));
    assert {:tag "loopBound"} {:thread 1} p7$1 ==> _b6 ==> BV32_SLE($i.0$1, BV32_ADD(v4$1, v5));
    assert {:tag "loopBound"} {:thread 2} p7$2 ==> _b6 ==> BV32_SLE($i.0$2, BV32_ADD(v4$2, v5));
    assert {:tag "loopCounterIsStrided"} {:thread 1} p7$1 ==> _b5 ==> BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), $i.0$1) == BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), BV32_ADD(BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x)), BV32_MUL(num_groups_x, group_size_x)));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p7$2 ==> _b5 ==> BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), $i.0$2) == BV32_AND(BV32_SUB(BV32_MUL(num_groups_x, group_size_x), 1bv32), BV32_ADD(BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x)), BV32_MUL(num_groups_x, group_size_x)));
    assert {:block_sourceloc} {:sourceloc_num 17} p7$1 ==> true;
    v12$1 := (if p7$1 then BV32_ULT($i.0$1, $n_vectors) else v12$1);
    v12$2 := (if p7$2 then BV32_ULT($i.0$2, $n_vectors) else v12$2);
    p8$1 := false;
    p8$2 := false;
    p8$1 := (if p7$1 && v12$1 then v12$1 else p8$1);
    p8$2 := (if p7$2 && v12$2 then v12$2 else p8$2);
    p7$1 := (if p7$1 && !v12$1 then v12$1 else p7$1);
    p7$2 := (if p7$2 && !v12$2 then v12$2 else p7$2);
    v13$1 := (if p8$1 then BV32_XOR(BV32_OR(BV32_SUB($i.0$1, v5), BV32_SUB(v5, 1bv32)), 4294967295bv32) else v13$1);
    v13$2 := (if p8$2 then BV32_XOR(BV32_OR(BV32_SUB($i.0$2, v5), BV32_SUB(v5, 1bv32)), 4294967295bv32) else v13$2);
    call v14$1, v14$2 := BV32_CTLZ(false, p8$1, BV32_AND(v13$1, BV32_SUB(0bv32, v13$1)), p8$2, BV32_AND(v13$2, BV32_SUB(0bv32, v13$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "BV32_CTLZ"} true;
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p8$1, BV32_SUB(BV32_SUB(32bv32, v14$1), 1bv32), $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][BV32_SUB(BV32_SUB(32bv32, v14$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(p8$2, BV32_SUB(BV32_SUB(32bv32, v14$2), 1bv32), $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_SUB(32bv32, v14$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v"} true;
    v15$1 := (if p8$1 then $$_ZZ15sobolGPU_kerneljjPjPfE1v[1bv1][BV32_SUB(BV32_SUB(32bv32, v14$1), 1bv32)] else v15$1);
    v15$2 := (if p8$2 then $$_ZZ15sobolGPU_kerneljjPjPfE1v[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(BV32_SUB(32bv32, v14$2), 1bv32)] else v15$2);
    v16$1 := (if p8$1 then BV32_XOR($X.1$1, BV32_XOR(v11$1, v15$1)) else v16$1);
    v16$2 := (if p8$2 then BV32_XOR($X.1$2, BV32_XOR(v11$2, v15$2)) else v16$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$d_output(p8$1, BV32_ADD(v1$1, $i.0$1), FMUL32(UI32_TO_FP32(v16$1), 796917760bv32), $$d_output[BV32_ADD(v1$1, $i.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p8$2, BV32_ADD(v1$2, $i.0$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$d_output(p8$2, BV32_ADD(v1$2, $i.0$2), FMUL32(UI32_TO_FP32(v16$2), 796917760bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(v1$1, $i.0$1)] := (if p8$1 then FMUL32(UI32_TO_FP32(v16$1), 796917760bv32) else $$d_output[BV32_ADD(v1$1, $i.0$1)]);
    $$d_output[BV32_ADD(v1$2, $i.0$2)] := (if p8$2 then FMUL32(UI32_TO_FP32(v16$2), 796917760bv32) else $$d_output[BV32_ADD(v1$2, $i.0$2)]);
    $X.1$1, $i.0$1 := (if p8$1 then v16$1 else $X.1$1), (if p8$1 then BV32_ADD($i.0$1, v5) else $i.0$1);
    $X.1$2, $i.0$2 := (if p8$2 then v16$2 else $X.1$2), (if p8$2 then BV32_ADD($i.0$2, v5) else $i.0$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $9.backedge, $9.tail;

  $9.tail:
    assume !p7$1 && !p7$2;
    return;

  $9.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 100bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ15sobolGPU_kerneljjPjPfE1v, $$d_output, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const _WATCHED_VALUE_$$d_directions: bv32;

procedure {:inline 1} _LOG_READ_$$d_directions(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_directions;



implementation {:inline 1} _LOG_READ_$$d_directions(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_directions := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_directions == _value then true else _READ_HAS_OCCURRED_$$d_directions);
    return;
}



procedure _CHECK_READ_$$d_directions(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_directions);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_directions: bool;

procedure {:inline 1} _LOG_WRITE_$$d_directions(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_directions, _WRITE_READ_BENIGN_FLAG_$$d_directions;



implementation {:inline 1} _LOG_WRITE_$$d_directions(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_directions := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_directions == _value then true else _WRITE_HAS_OCCURRED_$$d_directions);
    _WRITE_READ_BENIGN_FLAG_$$d_directions := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_directions == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_directions);
    return;
}



procedure _CHECK_WRITE_$$d_directions(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_directions != _value);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_directions != _value);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_directions(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_directions;



implementation {:inline 1} _LOG_ATOMIC_$$d_directions(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_directions := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_directions);
    return;
}



procedure _CHECK_ATOMIC_$$d_directions(_P: bool, _offset: bv32);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_directions"} {:array "$$d_directions"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_directions(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_directions;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_directions(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_directions := (if _P && _WRITE_HAS_OCCURRED_$$d_directions && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_directions);
    return;
}



const _WATCHED_VALUE_$$d_output: bv32;

procedure {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _READ_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_output);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _WRITE_HAS_OCCURRED_$$d_output);
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



procedure _CHECK_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



const _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;



implementation {:inline 1} _LOG_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v == _value then true else _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v);
    return;
}



procedure _CHECK_READ_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v, _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v;



implementation {:inline 1} _LOG_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v);
    return;
}



procedure _CHECK_WRITE_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15sobolGPU_kerneljjPjPfE1v != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "v"} {:array "$$_ZZ15sobolGPU_kerneljjPjPfE1v"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ15sobolGPU_kerneljjPjPfE1v);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ15sobolGPU_kerneljjPjPfE1v;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_output;
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
    havoc $$d_output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ15sobolGPU_kerneljjPjPfE1v;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b18: bool;
