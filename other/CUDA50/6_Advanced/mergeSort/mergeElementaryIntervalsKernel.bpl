type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_DstKey"} {:global} $$d_DstKey: [bv32]bv32;

axiom {:array_info "$$d_DstKey"} {:global} {:elem_width 32} {:source_name "d_DstKey"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_DstKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_DstKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_DstKey: bool;

var {:source_name "d_DstVal"} {:global} $$d_DstVal: [bv32]bv32;

axiom {:array_info "$$d_DstVal"} {:global} {:elem_width 32} {:source_name "d_DstVal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_DstVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_DstVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_DstVal: bool;

axiom {:array_info "$$d_SrcKey"} {:global} {:elem_width 32} {:source_name "d_SrcKey"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_SrcKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_SrcKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_SrcKey: bool;

axiom {:array_info "$$d_SrcVal"} {:global} {:elem_width 32} {:source_name "d_SrcVal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_SrcVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_SrcVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_SrcVal: bool;

axiom {:array_info "$$d_LimitsA"} {:global} {:elem_width 32} {:source_name "d_LimitsA"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_LimitsA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_LimitsA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_LimitsA: bool;

axiom {:array_info "$$d_LimitsB"} {:global} {:elem_width 32} {:source_name "d_LimitsB"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_LimitsB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_LimitsB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_LimitsB: bool;

var {:source_name "startSrcA"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:group_shared} {:elem_width 32} {:source_name "startSrcA"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: bool;

var {:source_name "startSrcB"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:group_shared} {:elem_width 32} {:source_name "startSrcB"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: bool;

var {:source_name "lenSrcA"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:group_shared} {:elem_width 32} {:source_name "lenSrcA"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: bool;

var {:source_name "lenSrcB"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:group_shared} {:elem_width 32} {:source_name "lenSrcB"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: bool;

var {:source_name "startDstA"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:group_shared} {:elem_width 32} {:source_name "startDstA"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: bool;

var {:source_name "startDstB"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:group_shared} {:elem_width 32} {:source_name "startDstB"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: bool;

var {:source_name "s_key"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:group_shared} {:elem_width 32} {:source_name "s_key"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: bool;

var {:source_name "s_val"} {:group_shared} $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:group_shared} {:elem_width 32} {:source_name "s_val"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: bool;

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

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "mergeElementaryIntervalsKernel<1>"} {:kernel} $_Z30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jj($stride: bv32, $N: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if BV32_AND($stride, BV32_SUB($stride, 1bv32)) == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV32_ULT($stride, $N) then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if BV32_UGT($stride, 1bv32) then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_DstKey && !_WRITE_HAS_OCCURRED_$$d_DstKey && !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
  requires !_READ_HAS_OCCURRED_$$d_DstVal && !_WRITE_HAS_OCCURRED_$$d_DstVal && !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
  requires !_READ_HAS_OCCURRED_$$d_SrcKey && !_WRITE_HAS_OCCURRED_$$d_SrcKey && !_ATOMIC_HAS_OCCURRED_$$d_SrcKey;
  requires !_READ_HAS_OCCURRED_$$d_SrcVal && !_WRITE_HAS_OCCURRED_$$d_SrcVal && !_ATOMIC_HAS_OCCURRED_$$d_SrcVal;
  requires !_READ_HAS_OCCURRED_$$d_LimitsA && !_WRITE_HAS_OCCURRED_$$d_LimitsA && !_ATOMIC_HAS_OCCURRED_$$d_LimitsA;
  requires !_READ_HAS_OCCURRED_$$d_LimitsB && !_WRITE_HAS_OCCURRED_$$d_LimitsB && !_ATOMIC_HAS_OCCURRED_$$d_LimitsB;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
  requires !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
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
  modifies $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$d_DstKey, $$d_DstVal, _TRACKING, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey, _WRITE_HAS_OCCURRED_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal, _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;



implementation {:source_name "mergeElementaryIntervalsKernel<1>"} {:kernel} $_Z30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jj($stride: bv32, $N: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $4$1: bv32;
  var $4$2: bv32;
  var $keyA.i.0$1: bv32;
  var $keyA.i.0$2: bv32;
  var $valA.i.0$1: bv32;
  var $valA.i.0$2: bv32;
  var $dstPosA.i.0$1: bv32;
  var $dstPosA.i.0$2: bv32;
  var $.02$1: bv32;
  var $.02$2: bv32;
  var $pos.i.i.0$1: bv32;
  var $pos.i.i.0$2: bv32;
  var $.03$1: bv32;
  var $.03$2: bv32;
  var $5$1: bv32;
  var $5$2: bv32;
  var $pos.i.i.1$1: bv32;
  var $pos.i.i.1$2: bv32;
  var $keyB.i.0$1: bv32;
  var $keyB.i.0$2: bv32;
  var $valB.i.0$1: bv32;
  var $valB.i.0$2: bv32;
  var $dstPosB.i.0$1: bv32;
  var $dstPosB.i.0$2: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $pos.i1.i.0$1: bv32;
  var $pos.i1.i.0$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $6$1: bv32;
  var $6$2: bv32;
  var $pos.i1.i.1$1: bv32;
  var $pos.i1.i.1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
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
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bool;
  var v33$2: bool;
  var v66$1: bv32;
  var v66$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v36$1: bool;
  var v36$2: bool;
  var v35$1: bv32;
  var v35$2: bv32;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bool;
  var v41$2: bool;
  var v69$1: bv32;
  var v69$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v44$1: bool;
  var v44$2: bool;
  var v43$1: bv32;
  var v43$2: bv32;
  var v45$1: bool;
  var v45$2: bool;
  var v46$1: bool;
  var v46$2: bool;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bool;
  var v48$2: bool;
  var v49$1: bool;
  var v49$2: bool;
  var v50$1: bool;
  var v50$2: bool;
  var v52$1: bool;
  var v52$2: bool;
  var v51$1: bv32;
  var v51$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bool;
  var v58$2: bool;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
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
  var p34$1: bool;
  var p34$2: bool;
  var p35$1: bool;
  var p35$2: bool;
  var p36$1: bool;
  var p36$2: bool;
  var p37$1: bool;
  var p37$2: bool;
  var p38$1: bool;
  var p38$2: bool;
  var p39$1: bool;
  var p39$2: bool;
  var p40$1: bool;
  var p40$2: bool;
  var p41$1: bool;
  var p41$2: bool;
  var p42$1: bool;
  var p42$2: bool;
  var p43$1: bool;
  var p43$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_AND(group_id_x$1, BV32_SUB(BV32_UDIV(BV32_MUL(2bv32, $stride), 128bv32), 1bv32));
    v0$2 := BV32_AND(group_id_x$2, BV32_SUB(BV32_UDIV(BV32_MUL(2bv32, $stride), 128bv32), 1bv32));
    v1$1 := BV32_MUL(BV32_SUB(group_id_x$1, v0$1), 128bv32);
    v1$2 := BV32_MUL(BV32_SUB(group_id_x$2, v0$2), 128bv32);
    v2$1 := local_id_x$1 == 0bv32;
    v2$2 := local_id_x$2 == 0bv32;
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
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
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
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p27$1 := false;
    p27$2 := false;
    p28$1 := false;
    p28$2 := false;
    p29$1 := false;
    p29$2 := false;
    p35$1 := false;
    p35$2 := false;
    p36$1 := false;
    p36$2 := false;
    p37$1 := false;
    p37$2 := false;
    p38$1 := false;
    p38$2 := false;
    p39$1 := false;
    p39$2 := false;
    p40$1 := false;
    p40$2 := false;
    p41$1 := false;
    p41$2 := false;
    p42$1 := false;
    p42$2 := false;
    p43$1 := false;
    p43$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    v3$1 := (if p0$1 then BV32_ULT($stride, BV32_SUB(BV32_SUB($N, v1$1), $stride)) else v3$1);
    v3$2 := (if p0$2 then BV32_ULT($stride, BV32_SUB(BV32_SUB($N, v1$2), $stride)) else v3$2);
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    p2$1 := (if p0$1 && !v3$1 then !v3$1 else p2$1);
    p2$2 := (if p0$2 && !v3$2 then !v3$2 else p2$2);
    $0$1 := (if p1$1 then $stride else $0$1);
    $0$2 := (if p1$2 then $stride else $0$2);
    $0$1 := (if p2$1 then BV32_SUB(BV32_SUB($N, v1$1), $stride) else $0$1);
    $0$2 := (if p2$2 then BV32_SUB(BV32_SUB($N, v1$2), $stride) else $0$2);
    v4$1 := (if p0$1 then BV32_UREM($stride, 128bv32) == 0bv32 else v4$1);
    v4$2 := (if p0$2 then BV32_UREM($stride, 128bv32) == 0bv32 else v4$2);
    p3$1 := (if p0$1 && v4$1 then v4$1 else p3$1);
    p3$2 := (if p0$2 && v4$2 then v4$2 else p3$2);
    p4$1 := (if p0$1 && !v4$1 then !v4$1 else p4$1);
    p4$2 := (if p0$2 && !v4$2 then !v4$2 else p4$2);
    $1$1 := (if p3$1 then BV32_UDIV($stride, 128bv32) else $1$1);
    $1$2 := (if p3$2 then BV32_UDIV($stride, 128bv32) else $1$2);
    $1$1 := (if p4$1 then BV32_ADD(BV32_UDIV($stride, 128bv32), 1bv32) else $1$1);
    $1$2 := (if p4$2 then BV32_ADD(BV32_UDIV($stride, 128bv32), 1bv32) else $1$2);
    v5$1 := (if p0$1 then BV32_UREM($0$1, 128bv32) == 0bv32 else v5$1);
    v5$2 := (if p0$2 then BV32_UREM($0$2, 128bv32) == 0bv32 else v5$2);
    p5$1 := (if p0$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p0$2 && v5$2 then v5$2 else p5$2);
    p6$1 := (if p0$1 && !v5$1 then !v5$1 else p6$1);
    p6$2 := (if p0$2 && !v5$2 then !v5$2 else p6$2);
    $2$1 := (if p5$1 then BV32_UDIV($0$1, 128bv32) else $2$1);
    $2$2 := (if p5$2 then BV32_UDIV($0$2, 128bv32) else $2$2);
    $2$1 := (if p6$1 then BV32_ADD(BV32_UDIV($0$1, 128bv32), 1bv32) else $2$1);
    $2$2 := (if p6$2 then BV32_ADD(BV32_UDIV($0$2, 128bv32), 1bv32) else $2$2);
    v6$1 := (if p0$1 then BV32_ADD($1$1, $2$1) else v6$1);
    v6$2 := (if p0$2 then BV32_ADD($1$2, $2$2) else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p0$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p0$2 then _HAVOC_bv32$2 else v7$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$1, 0bv32, v7$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$2, 0bv32, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32] := (if p0$1 then v7$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v7$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p0$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p0$2 then _HAVOC_bv32$2 else v8$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$1, 0bv32, v8$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$2, 0bv32, v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32] := (if p0$1 then v8$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v8$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    v9$1 := (if p0$1 then BV32_ULT(BV32_ADD(v0$1, 1bv32), v6$1) else v9$1);
    v9$2 := (if p0$2 then BV32_ULT(BV32_ADD(v0$2, 1bv32), v6$2) else v9$2);
    p7$1 := (if p0$1 && v9$1 then v9$1 else p7$1);
    p7$2 := (if p0$2 && v9$2 then v9$2 else p7$2);
    p8$1 := (if p0$1 && !v9$1 then !v9$1 else p8$1);
    p8$2 := (if p0$2 && !v9$2 then !v9$2 else p8$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p7$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p7$2 then _HAVOC_bv32$2 else v10$2);
    $3$1 := (if p7$1 then v10$1 else $3$1);
    $3$2 := (if p7$2 then v10$2 else $3$2);
    $3$1 := (if p8$1 then $stride else $3$1);
    $3$2 := (if p8$2 then $stride else $3$2);
    v11$1 := (if p0$1 then BV32_ULT(BV32_ADD(v0$1, 1bv32), v6$1) else v11$1);
    v11$2 := (if p0$2 then BV32_ULT(BV32_ADD(v0$2, 1bv32), v6$2) else v11$2);
    p9$1 := (if p0$1 && v11$1 then v11$1 else p9$1);
    p9$2 := (if p0$2 && v11$2 then v11$2 else p9$2);
    p10$1 := (if p0$1 && !v11$1 then !v11$1 else p10$1);
    p10$2 := (if p0$2 && !v11$2 then !v11$2 else p10$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p9$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p9$2 then _HAVOC_bv32$2 else v12$2);
    $4$1 := (if p9$1 then v12$1 else $4$1);
    $4$2 := (if p9$2 then v12$2 else $4$2);
    $4$1 := (if p10$1 then $0$1 else $4$1);
    $4$2 := (if p10$2 then $0$2 else $4$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} true;
    v13$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32] else v13$1);
    v13$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v13$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p0$1, 0bv32, BV32_SUB($3$1, v13$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p0$2, 0bv32, BV32_SUB($3$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32] := (if p0$1 then BV32_SUB($3$1, v13$1) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then BV32_SUB($3$2, v13$2) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} true;
    v14$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32] else v14$1);
    v14$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v14$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(p0$1, 0bv32, BV32_SUB($4$1, v14$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(p0$2, 0bv32, BV32_SUB($4$2, v14$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32] := (if p0$1 then BV32_SUB($4$1, v14$1) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then BV32_SUB($4$2, v14$2) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} true;
    v15$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32] else v15$1);
    v15$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v15$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} true;
    v16$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32] else v16$1);
    v16$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v16$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p0$1, 0bv32, BV32_ADD(v15$1, v16$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p0$2, 0bv32, BV32_ADD(v15$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32] := (if p0$1 then BV32_ADD(v15$1, v16$1) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then BV32_ADD(v15$2, v16$2) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} true;
    v17$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32] else v17$1);
    v17$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v17$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p0$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p0$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} true;
    v18$1 := (if p0$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32] else v18$1);
    v18$2 := (if p0$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v18$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p0$1, 0bv32, BV32_ADD(v17$1, v18$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p0$2, 0bv32, BV32_ADD(v17$2, v18$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32] := (if p0$1 then BV32_ADD(v17$1, v18$1) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then BV32_ADD(v17$2, v18$2) else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 37} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 38} true;
    v19$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32];
    v19$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v20$1 := BV32_ULT(local_id_x$1, v19$1);
    v20$2 := BV32_ULT(local_id_x$2, v19$2);
    p12$1 := (if v20$1 then v20$1 else p12$1);
    p12$2 := (if v20$2 then v20$2 else p12$2);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 40} true;
    v21$1 := (if p12$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32] else v21$1);
    v21$2 := (if p12$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v21$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v22$1 := (if p12$1 then _HAVOC_bv32$1 else v22$1);
    v22$2 := (if p12$2 then _HAVOC_bv32$2 else v22$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p12$1, local_id_x$1, v22$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p12$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p12$2, local_id_x$2, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1] := (if p12$1 then v22$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p12$2 then v22$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 43} true;
    v23$1 := (if p12$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[1bv1][0bv32] else v23$1);
    v23$2 := (if p12$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v23$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v24$1 := (if p12$1 then _HAVOC_bv32$1 else v24$1);
    v24$2 := (if p12$2 then _HAVOC_bv32$2 else v24$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p12$1, local_id_x$1, v24$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p12$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p12$2, local_id_x$2, v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1] := (if p12$1 then v24$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p12$2 then v24$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 47} true;
    v25$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32];
    v25$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v26$1 := BV32_ULT(local_id_x$1, v25$1);
    v26$2 := BV32_ULT(local_id_x$2, v25$2);
    p14$1 := (if v26$1 then v26$1 else p14$1);
    p14$2 := (if v26$2 then v26$2 else p14$2);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 49} true;
    v27$1 := (if p14$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32] else v27$1);
    v27$2 := (if p14$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v27$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v28$1 := (if p14$1 then _HAVOC_bv32$1 else v28$1);
    v28$2 := (if p14$2 then _HAVOC_bv32$2 else v28$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p14$1, BV32_ADD(local_id_x$1, 128bv32), v28$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(local_id_x$1, 128bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p14$2, BV32_ADD(local_id_x$2, 128bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p14$2, BV32_ADD(local_id_x$2, 128bv32), v28$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(local_id_x$1, 128bv32)] := (if p14$1 then v28$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(local_id_x$1, 128bv32)]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 128bv32)] := (if p14$2 then v28$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 128bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 52} true;
    v29$1 := (if p14$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[1bv1][0bv32] else v29$1);
    v29$2 := (if p14$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v29$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v30$1 := (if p14$1 then _HAVOC_bv32$1 else v30$1);
    v30$2 := (if p14$2 then _HAVOC_bv32$2 else v30$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p14$1, BV32_ADD(local_id_x$1, 128bv32), v30$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(local_id_x$1, 128bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p14$2, BV32_ADD(local_id_x$2, 128bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p14$2, BV32_ADD(local_id_x$2, 128bv32), v30$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(local_id_x$1, 128bv32)] := (if p14$1 then v30$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(local_id_x$1, 128bv32)]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 128bv32)] := (if p14$2 then v30$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 128bv32)]);
    goto __partitioned_block_$0_2;

  __partitioned_block_$0_2:
    call {:sourceloc_num 56} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 57} true;
    v31$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32];
    v31$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 58} true;
    v32$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32];
    v32$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v33$1 := BV32_ULT(local_id_x$1, v31$1);
    v33$2 := BV32_ULT(local_id_x$2, v31$2);
    p16$1 := (if v33$1 then v33$1 else p16$1);
    p16$2 := (if v33$2 then v33$2 else p16$2);
    p25$1 := (if !v33$1 then !v33$1 else p25$1);
    p25$2 := (if !v33$2 then !v33$2 else p25$2);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 60} true;
    v34$1 := (if p16$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1] else v34$1);
    v34$2 := (if p16$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v34$2);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 61} true;
    v35$1 := (if p16$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1] else v35$1);
    v35$2 := (if p16$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v35$2);
    v36$1 := (if p16$1 then v32$1 == 0bv32 else v36$1);
    v36$2 := (if p16$2 then v32$2 == 0bv32 else v36$2);
    p17$1 := (if p16$1 && v36$1 then v36$1 else p17$1);
    p17$2 := (if p16$2 && v36$2 then v36$2 else p17$2);
    p18$1 := (if p16$1 && !v36$1 then !v36$1 else p18$1);
    p18$2 := (if p16$2 && !v36$2 then !v36$2 else p18$2);
    $.02$1 := (if p17$1 then 0bv32 else $.02$1);
    $.02$2 := (if p17$2 then 0bv32 else $.02$2);
    $pos.i.i.0$1, $.03$1 := (if p18$1 then 0bv32 else $pos.i.i.0$1), (if p18$1 then 128bv32 else $.03$1);
    $pos.i.i.0$2, $.03$2 := (if p18$2 then 0bv32 else $pos.i.i.0$2), (if p18$2 then 128bv32 else $.03$2);
    p19$1 := (if p18$1 then true else p19$1);
    p19$2 := (if p18$2 then true else p19$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 64} p19$1 ==> true;
    v37$1 := (if p19$1 then BV32_UGT($.03$1, 0bv32) else v37$1);
    v37$2 := (if p19$2 then BV32_UGT($.03$2, 0bv32) else v37$2);
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
    p20$1 := (if p19$1 && v37$1 then v37$1 else p20$1);
    p20$2 := (if p19$2 && v37$2 then v37$2 else p20$2);
    p19$1 := (if p19$1 && !v37$1 then v37$1 else p19$1);
    p19$2 := (if p19$2 && !v37$2 then v37$2 else p19$2);
    v38$1 := (if p20$1 then BV32_ULT(BV32_ADD($pos.i.i.0$1, $.03$1), v32$1) else v38$1);
    v38$2 := (if p20$2 then BV32_ULT(BV32_ADD($pos.i.i.0$2, $.03$2), v32$2) else v38$2);
    p22$1 := (if p20$1 && v38$1 then v38$1 else p22$1);
    p22$2 := (if p20$2 && v38$2 then v38$2 else p22$2);
    p21$1 := (if p20$1 && !v38$1 then !v38$1 else p21$1);
    p21$2 := (if p20$2 && !v38$2 then !v38$2 else p21$2);
    $5$1 := (if p21$1 then v32$1 else $5$1);
    $5$2 := (if p21$2 then v32$2 else $5$2);
    $5$1 := (if p22$1 then BV32_ADD($pos.i.i.0$1, $.03$1) else $5$1);
    $5$2 := (if p22$2 then BV32_ADD($pos.i.i.0$2, $.03$2) else $5$2);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 69} true;
    v39$1 := (if p20$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(128bv32, BV32_SUB($5$1, 1bv32))] else v39$1);
    v39$2 := (if p20$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(128bv32, BV32_SUB($5$2, 1bv32))] else v39$2);
    v40$1 := (if p20$1 then BV32_ULT(v39$1, v34$1) else v40$1);
    v40$2 := (if p20$2 then BV32_ULT(v39$2, v34$2) else v40$2);
    p24$1 := (if p20$1 && v40$1 then v40$1 else p24$1);
    p24$2 := (if p20$2 && v40$2 then v40$2 else p24$2);
    p23$1 := (if p20$1 && !v40$1 then !v40$1 else p23$1);
    p23$2 := (if p20$2 && !v40$2 then !v40$2 else p23$2);
    $pos.i.i.1$1 := (if p23$1 then $pos.i.i.0$1 else $pos.i.i.1$1);
    $pos.i.i.1$2 := (if p23$2 then $pos.i.i.0$2 else $pos.i.i.1$2);
    $pos.i.i.1$1 := (if p24$1 then $5$1 else $pos.i.i.1$1);
    $pos.i.i.1$2 := (if p24$2 then $5$2 else $pos.i.i.1$2);
    $pos.i.i.0$1, $.03$1 := (if p20$1 then $pos.i.i.1$1 else $pos.i.i.0$1), (if p20$1 then BV32_LSHR($.03$1, 1bv32) else $.03$1);
    $pos.i.i.0$2, $.03$2 := (if p20$2 then $pos.i.i.1$2 else $pos.i.i.0$2), (if p20$2 then BV32_LSHR($.03$2, 1bv32) else $.03$2);
    p19$1 := (if p20$1 then true else p19$1);
    p19$2 := (if p20$2 then true else p19$2);
    goto $23.backedge, $23.tail;

  $23.tail:
    assume !p19$1 && !p19$2;
    $.02$1 := (if p18$1 then $pos.i.i.0$1 else $.02$1);
    $.02$2 := (if p18$2 then $pos.i.i.0$2 else $.02$2);
    $keyA.i.0$1, $valA.i.0$1, $dstPosA.i.0$1 := (if p16$1 then v34$1 else $keyA.i.0$1), (if p16$1 then v35$1 else $valA.i.0$1), (if p16$1 then BV32_ADD($.02$1, local_id_x$1) else $dstPosA.i.0$1);
    $keyA.i.0$2, $valA.i.0$2, $dstPosA.i.0$2 := (if p16$2 then v34$2 else $keyA.i.0$2), (if p16$2 then v35$2 else $valA.i.0$2), (if p16$2 then BV32_ADD($.02$2, local_id_x$2) else $dstPosA.i.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v65$1 := (if p25$1 then _HAVOC_bv32$1 else v65$1);
    v65$2 := (if p25$2 then _HAVOC_bv32$2 else v65$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v66$1 := (if p25$1 then _HAVOC_bv32$1 else v66$1);
    v66$2 := (if p25$2 then _HAVOC_bv32$2 else v66$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v67$1 := (if p25$1 then _HAVOC_bv32$1 else v67$1);
    v67$2 := (if p25$2 then _HAVOC_bv32$2 else v67$2);
    $keyA.i.0$1, $valA.i.0$1, $dstPosA.i.0$1 := (if p25$1 then v65$1 else $keyA.i.0$1), (if p25$1 then v66$1 else $valA.i.0$1), (if p25$1 then v67$1 else $dstPosA.i.0$1);
    $keyA.i.0$2, $valA.i.0$2, $dstPosA.i.0$2 := (if p25$2 then v65$2 else $keyA.i.0$2), (if p25$2 then v66$2 else $valA.i.0$2), (if p25$2 then v67$2 else $dstPosA.i.0$2);
    v41$1 := BV32_ULT(local_id_x$1, v32$1);
    v41$2 := BV32_ULT(local_id_x$2, v32$2);
    p26$1 := (if v41$1 then v41$1 else p26$1);
    p26$2 := (if v41$2 then v41$2 else p26$2);
    p35$1 := (if !v41$1 then !v41$1 else p35$1);
    p35$2 := (if !v41$2 then !v41$2 else p35$2);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 76} true;
    v42$1 := (if p26$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(128bv32, local_id_x$1)] else v42$1);
    v42$2 := (if p26$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(128bv32, local_id_x$2)] else v42$2);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 77} true;
    v43$1 := (if p26$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(128bv32, local_id_x$1)] else v43$1);
    v43$2 := (if p26$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(128bv32, local_id_x$2)] else v43$2);
    v44$1 := (if p26$1 then v31$1 == 0bv32 else v44$1);
    v44$2 := (if p26$2 then v31$2 == 0bv32 else v44$2);
    p27$1 := (if p26$1 && v44$1 then v44$1 else p27$1);
    p27$2 := (if p26$2 && v44$2 then v44$2 else p27$2);
    p28$1 := (if p26$1 && !v44$1 then !v44$1 else p28$1);
    p28$2 := (if p26$2 && !v44$2 then !v44$2 else p28$2);
    $.0$1 := (if p27$1 then 0bv32 else $.0$1);
    $.0$2 := (if p27$2 then 0bv32 else $.0$2);
    $pos.i1.i.0$1, $.01$1 := (if p28$1 then 0bv32 else $pos.i1.i.0$1), (if p28$1 then 128bv32 else $.01$1);
    $pos.i1.i.0$2, $.01$2 := (if p28$2 then 0bv32 else $pos.i1.i.0$2), (if p28$2 then 128bv32 else $.01$2);
    p29$1 := (if p28$1 then true else p29$1);
    p29$2 := (if p28$2 then true else p29$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $35;

  $35:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 80} p29$1 ==> true;
    v45$1 := (if p29$1 then BV32_UGT($.01$1, 0bv32) else v45$1);
    v45$2 := (if p29$2 then BV32_UGT($.01$2, 0bv32) else v45$2);
    p30$1 := false;
    p30$2 := false;
    p31$1 := false;
    p31$2 := false;
    p32$1 := false;
    p32$2 := false;
    p33$1 := false;
    p33$2 := false;
    p34$1 := false;
    p34$2 := false;
    p30$1 := (if p29$1 && v45$1 then v45$1 else p30$1);
    p30$2 := (if p29$2 && v45$2 then v45$2 else p30$2);
    p29$1 := (if p29$1 && !v45$1 then v45$1 else p29$1);
    p29$2 := (if p29$2 && !v45$2 then v45$2 else p29$2);
    v46$1 := (if p30$1 then BV32_ULT(BV32_ADD($pos.i1.i.0$1, $.01$1), v31$1) else v46$1);
    v46$2 := (if p30$2 then BV32_ULT(BV32_ADD($pos.i1.i.0$2, $.01$2), v31$2) else v46$2);
    p32$1 := (if p30$1 && v46$1 then v46$1 else p32$1);
    p32$2 := (if p30$2 && v46$2 then v46$2 else p32$2);
    p31$1 := (if p30$1 && !v46$1 then !v46$1 else p31$1);
    p31$2 := (if p30$2 && !v46$2 then !v46$2 else p31$2);
    $6$1 := (if p31$1 then v31$1 else $6$1);
    $6$2 := (if p31$2 then v31$2 else $6$2);
    $6$1 := (if p32$1 then BV32_ADD($pos.i1.i.0$1, $.01$1) else $6$1);
    $6$2 := (if p32$2 then BV32_ADD($pos.i1.i.0$2, $.01$2) else $6$2);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 85} true;
    v47$1 := (if p30$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_SUB($6$1, 1bv32)] else v47$1);
    v47$2 := (if p30$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB($6$2, 1bv32)] else v47$2);
    v48$1 := (if p30$1 then BV32_ULE(v47$1, v42$1) else v48$1);
    v48$2 := (if p30$2 then BV32_ULE(v47$2, v42$2) else v48$2);
    p34$1 := (if p30$1 && v48$1 then v48$1 else p34$1);
    p34$2 := (if p30$2 && v48$2 then v48$2 else p34$2);
    p33$1 := (if p30$1 && !v48$1 then !v48$1 else p33$1);
    p33$2 := (if p30$2 && !v48$2 then !v48$2 else p33$2);
    $pos.i1.i.1$1 := (if p33$1 then $pos.i1.i.0$1 else $pos.i1.i.1$1);
    $pos.i1.i.1$2 := (if p33$2 then $pos.i1.i.0$2 else $pos.i1.i.1$2);
    $pos.i1.i.1$1 := (if p34$1 then $6$1 else $pos.i1.i.1$1);
    $pos.i1.i.1$2 := (if p34$2 then $6$2 else $pos.i1.i.1$2);
    $pos.i1.i.0$1, $.01$1 := (if p30$1 then $pos.i1.i.1$1 else $pos.i1.i.0$1), (if p30$1 then BV32_LSHR($.01$1, 1bv32) else $.01$1);
    $pos.i1.i.0$2, $.01$2 := (if p30$2 then $pos.i1.i.1$2 else $pos.i1.i.0$2), (if p30$2 then BV32_LSHR($.01$2, 1bv32) else $.01$2);
    p29$1 := (if p30$1 then true else p29$1);
    p29$2 := (if p30$2 then true else p29$2);
    goto $35.backedge, __partitioned_block_$35.tail_0;

  __partitioned_block_$35.tail_0:
    assume !p29$1 && !p29$2;
    $.0$1 := (if p28$1 then $pos.i1.i.0$1 else $.0$1);
    $.0$2 := (if p28$2 then $pos.i1.i.0$2 else $.0$2);
    $keyB.i.0$1, $valB.i.0$1, $dstPosB.i.0$1 := (if p26$1 then v42$1 else $keyB.i.0$1), (if p26$1 then v43$1 else $valB.i.0$1), (if p26$1 then BV32_ADD($.0$1, local_id_x$1) else $dstPosB.i.0$1);
    $keyB.i.0$2, $valB.i.0$2, $dstPosB.i.0$2 := (if p26$2 then v42$2 else $keyB.i.0$2), (if p26$2 then v43$2 else $valB.i.0$2), (if p26$2 then BV32_ADD($.0$2, local_id_x$2) else $dstPosB.i.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v68$1 := (if p35$1 then _HAVOC_bv32$1 else v68$1);
    v68$2 := (if p35$2 then _HAVOC_bv32$2 else v68$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v69$1 := (if p35$1 then _HAVOC_bv32$1 else v69$1);
    v69$2 := (if p35$2 then _HAVOC_bv32$2 else v69$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v70$1 := (if p35$1 then _HAVOC_bv32$1 else v70$1);
    v70$2 := (if p35$2 then _HAVOC_bv32$2 else v70$2);
    $keyB.i.0$1, $valB.i.0$1, $dstPosB.i.0$1 := (if p35$1 then v68$1 else $keyB.i.0$1), (if p35$1 then v69$1 else $valB.i.0$1), (if p35$1 then v70$1 else $dstPosB.i.0$1);
    $keyB.i.0$2, $valB.i.0$2, $dstPosB.i.0$2 := (if p35$2 then v68$2 else $keyB.i.0$2), (if p35$2 then v69$2 else $valB.i.0$2), (if p35$2 then v70$2 else $dstPosB.i.0$2);
    goto __partitioned_block_$35.tail_1;

  __partitioned_block_$35.tail_1:
    call {:sourceloc_num 91} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v49$1 := BV32_ULT(local_id_x$1, v31$1);
    v49$2 := BV32_ULT(local_id_x$2, v31$2);
    p36$1 := (if v49$1 then v49$1 else p36$1);
    p36$2 := (if v49$2 then v49$2 else p36$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p36$1, $dstPosA.i.0$1, $keyA.i.0$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosA.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p36$2, $dstPosA.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 93} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p36$2, $dstPosA.i.0$2, $keyA.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosA.i.0$1] := (if p36$1 then $keyA.i.0$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosA.i.0$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosA.i.0$2] := (if p36$2 then $keyA.i.0$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosA.i.0$2]);
    call {:sourceloc} {:sourceloc_num 94} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p36$1, $dstPosA.i.0$1, $valA.i.0$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosA.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p36$2, $dstPosA.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 94} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p36$2, $dstPosA.i.0$2, $valA.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosA.i.0$1] := (if p36$1 then $valA.i.0$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosA.i.0$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosA.i.0$2] := (if p36$2 then $valA.i.0$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosA.i.0$2]);
    v50$1 := BV32_ULT(local_id_x$1, v32$1);
    v50$2 := BV32_ULT(local_id_x$2, v32$2);
    p38$1 := (if v50$1 then v50$1 else p38$1);
    p38$2 := (if v50$2 then v50$2 else p38$2);
    call {:sourceloc} {:sourceloc_num 97} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p38$1, $dstPosB.i.0$1, $keyB.i.0$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosB.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p38$2, $dstPosB.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 97} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p38$2, $dstPosB.i.0$2, $keyB.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosB.i.0$1] := (if p38$1 then $keyB.i.0$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][$dstPosB.i.0$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosB.i.0$2] := (if p38$2 then $keyB.i.0$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosB.i.0$2]);
    call {:sourceloc} {:sourceloc_num 98} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p38$1, $dstPosB.i.0$1, $valB.i.0$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosB.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p38$2, $dstPosB.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 98} _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p38$2, $dstPosB.i.0$2, $valB.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosB.i.0$1] := (if p38$1 then $valB.i.0$1 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][$dstPosB.i.0$1]);
    $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosB.i.0$2] := (if p38$2 then $valB.i.0$2 else $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$dstPosB.i.0$2]);
    goto __partitioned_block_$35.tail_2;

  __partitioned_block_$35.tail_2:
    call {:sourceloc_num 100} $bugle_barrier_duplicated_3(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 101} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(true, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 101} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(true, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} true;
    v51$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32];
    v51$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v52$1 := BV32_ULT(local_id_x$1, v51$1);
    v52$2 := BV32_ULT(local_id_x$2, v51$2);
    p40$1 := (if v52$1 then v52$1 else p40$1);
    p40$2 := (if v52$2 then v52$2 else p40$2);
    call {:sourceloc} {:sourceloc_num 103} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p40$1, local_id_x$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 103} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 103} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p40$2, local_id_x$2, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    v53$1 := (if p40$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][local_id_x$1] else v53$1);
    v53$2 := (if p40$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v53$2);
    call {:sourceloc} {:sourceloc_num 104} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p40$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 104} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 104} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p40$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} true;
    v54$1 := (if p40$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32] else v54$1);
    v54$2 := (if p40$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v54$2);
    call {:sourceloc} {:sourceloc_num 105} _LOG_WRITE_$$d_DstKey(p40$1, BV32_ADD(v1$1, BV32_ADD(v54$1, local_id_x$1)), v53$1, $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v54$1, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(p40$2, BV32_ADD(v1$2, BV32_ADD(v54$2, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 105} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 105} _CHECK_WRITE_$$d_DstKey(p40$2, BV32_ADD(v1$2, BV32_ADD(v54$2, local_id_x$2)), v53$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstKey"} true;
    $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v54$1, local_id_x$1))] := (if p40$1 then v53$1 else $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v54$1, local_id_x$1))]);
    $$d_DstKey[BV32_ADD(v1$2, BV32_ADD(v54$2, local_id_x$2))] := (if p40$2 then v53$2 else $$d_DstKey[BV32_ADD(v1$2, BV32_ADD(v54$2, local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 106} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p40$1, local_id_x$1, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 106} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 106} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p40$2, local_id_x$2, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    v55$1 := (if p40$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][local_id_x$1] else v55$1);
    v55$2 := (if p40$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v55$2);
    call {:sourceloc} {:sourceloc_num 107} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p40$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 107} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(p40$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} true;
    v56$1 := (if p40$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[1bv1][0bv32] else v56$1);
    v56$2 := (if p40$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v56$2);
    call {:sourceloc} {:sourceloc_num 108} _LOG_WRITE_$$d_DstVal(p40$1, BV32_ADD(v1$1, BV32_ADD(v56$1, local_id_x$1)), v55$1, $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v56$1, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(p40$2, BV32_ADD(v1$2, BV32_ADD(v56$2, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 108} _CHECK_WRITE_$$d_DstVal(p40$2, BV32_ADD(v1$2, BV32_ADD(v56$2, local_id_x$2)), v55$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstVal"} true;
    $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v56$1, local_id_x$1))] := (if p40$1 then v55$1 else $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v56$1, local_id_x$1))]);
    $$d_DstVal[BV32_ADD(v1$2, BV32_ADD(v56$2, local_id_x$2))] := (if p40$2 then v55$2 else $$d_DstVal[BV32_ADD(v1$2, BV32_ADD(v56$2, local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 110} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(true, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 110} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(true, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} true;
    v57$1 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[1bv1][0bv32];
    v57$2 := $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v58$1 := BV32_ULT(local_id_x$1, v57$1);
    v58$2 := BV32_ULT(local_id_x$2, v57$2);
    p42$1 := (if v58$1 then v58$1 else p42$1);
    p42$2 := (if v58$2 then v58$2 else p42$2);
    call {:sourceloc} {:sourceloc_num 112} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p42$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 112} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 112} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p42$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} true;
    v59$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32] else v59$1);
    v59$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v59$2);
    call {:sourceloc} {:sourceloc_num 113} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p42$1, BV32_ADD(v59$1, local_id_x$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(v59$1, local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 113} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(p42$2, BV32_ADD(v59$2, local_id_x$2), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v59$2, local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} true;
    v60$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[1bv1][BV32_ADD(v59$1, local_id_x$1)] else v60$1);
    v60$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v59$2, local_id_x$2)] else v60$2);
    call {:sourceloc} {:sourceloc_num 114} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p42$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 114} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p42$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} true;
    v61$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32] else v61$1);
    v61$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v61$2);
    call {:sourceloc} {:sourceloc_num 115} _LOG_WRITE_$$d_DstKey(p42$1, BV32_ADD(v1$1, BV32_ADD(v61$1, local_id_x$1)), v60$1, $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v61$1, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(p42$2, BV32_ADD(v1$2, BV32_ADD(v61$2, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 115} _CHECK_WRITE_$$d_DstKey(p42$2, BV32_ADD(v1$2, BV32_ADD(v61$2, local_id_x$2)), v60$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstKey"} true;
    $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v61$1, local_id_x$1))] := (if p42$1 then v60$1 else $$d_DstKey[BV32_ADD(v1$1, BV32_ADD(v61$1, local_id_x$1))]);
    $$d_DstKey[BV32_ADD(v1$2, BV32_ADD(v61$2, local_id_x$2))] := (if p42$2 then v60$2 else $$d_DstKey[BV32_ADD(v1$2, BV32_ADD(v61$2, local_id_x$2))]);
    call {:sourceloc} {:sourceloc_num 116} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p42$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 116} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(p42$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} true;
    v62$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[1bv1][0bv32] else v62$1);
    v62$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v62$2);
    call {:sourceloc} {:sourceloc_num 117} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p42$1, BV32_ADD(v62$1, local_id_x$1), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(v62$1, local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 117} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 117} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(p42$2, BV32_ADD(v62$2, local_id_x$2), $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v62$2, local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} true;
    v63$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[1bv1][BV32_ADD(v62$1, local_id_x$1)] else v63$1);
    v63$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v62$2, local_id_x$2)] else v63$2);
    call {:sourceloc} {:sourceloc_num 118} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p42$1, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 118} _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(p42$2, 0bv32, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} true;
    v64$1 := (if p42$1 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[1bv1][0bv32] else v64$1);
    v64$2 := (if p42$2 then $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v64$2);
    call {:sourceloc} {:sourceloc_num 119} _LOG_WRITE_$$d_DstVal(p42$1, BV32_ADD(v1$1, BV32_ADD(v64$1, local_id_x$1)), v63$1, $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v64$1, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(p42$2, BV32_ADD(v1$2, BV32_ADD(v64$2, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 119} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 119} _CHECK_WRITE_$$d_DstVal(p42$2, BV32_ADD(v1$2, BV32_ADD(v64$2, local_id_x$2)), v63$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstVal"} true;
    $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v64$1, local_id_x$1))] := (if p42$1 then v63$1 else $$d_DstVal[BV32_ADD(v1$1, BV32_ADD(v64$1, local_id_x$1))]);
    $$d_DstVal[BV32_ADD(v1$2, BV32_ADD(v64$2, local_id_x$2))] := (if p42$2 then v63$2 else $$d_DstVal[BV32_ADD(v1$2, BV32_ADD(v64$2, local_id_x$2))]);
    return;

  $35.backedge:
    assume {:backedge} p29$1 || p29$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $35;

  $23.backedge:
    assume {:backedge} p19$1 || p19$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $23;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32768bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 1bv1;
  modifies $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



const _WATCHED_VALUE_$$d_DstKey: bv32;

procedure {:inline 1} _LOG_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_DstKey;



implementation {:inline 1} _LOG_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then true else _READ_HAS_OCCURRED_$$d_DstKey);
    return;
}



procedure _CHECK_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_DstKey: bool;

procedure {:inline 1} _LOG_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey;



implementation {:inline 1} _LOG_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then true else _WRITE_HAS_OCCURRED_$$d_DstKey);
    _WRITE_READ_BENIGN_FLAG_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
    return;
}



procedure _CHECK_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey != _value);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey != _value);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_DstKey;



implementation {:inline 1} _LOG_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_DstKey);
    return;
}



procedure _CHECK_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_DstKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_DstKey := (if _P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
    return;
}



const _WATCHED_VALUE_$$d_DstVal: bv32;

procedure {:inline 1} _LOG_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_DstVal;



implementation {:inline 1} _LOG_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then true else _READ_HAS_OCCURRED_$$d_DstVal);
    return;
}



procedure _CHECK_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_DstVal: bool;

procedure {:inline 1} _LOG_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal;



implementation {:inline 1} _LOG_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then true else _WRITE_HAS_OCCURRED_$$d_DstVal);
    _WRITE_READ_BENIGN_FLAG_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
    return;
}



procedure _CHECK_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal != _value);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal != _value);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_DstVal;



implementation {:inline 1} _LOG_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_DstVal);
    return;
}



procedure _CHECK_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_DstVal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_DstVal := (if _P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
    return;
}



const _WATCHED_VALUE_$$d_SrcKey: bv32;

procedure {:inline 1} _LOG_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_SrcKey;



implementation {:inline 1} _LOG_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then true else _READ_HAS_OCCURRED_$$d_SrcKey);
    return;
}



procedure _CHECK_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_SrcKey: bool;

procedure {:inline 1} _LOG_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_SrcKey, _WRITE_READ_BENIGN_FLAG_$$d_SrcKey;



implementation {:inline 1} _LOG_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then true else _WRITE_HAS_OCCURRED_$$d_SrcKey);
    _WRITE_READ_BENIGN_FLAG_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
    return;
}



procedure _CHECK_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey != _value);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey != _value);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_SrcKey;



implementation {:inline 1} _LOG_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_SrcKey);
    return;
}



procedure _CHECK_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_SrcKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_SrcKey := (if _P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
    return;
}



const _WATCHED_VALUE_$$d_SrcVal: bv32;

procedure {:inline 1} _LOG_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_SrcVal;



implementation {:inline 1} _LOG_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then true else _READ_HAS_OCCURRED_$$d_SrcVal);
    return;
}



procedure _CHECK_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_SrcVal: bool;

procedure {:inline 1} _LOG_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_SrcVal, _WRITE_READ_BENIGN_FLAG_$$d_SrcVal;



implementation {:inline 1} _LOG_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then true else _WRITE_HAS_OCCURRED_$$d_SrcVal);
    _WRITE_READ_BENIGN_FLAG_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
    return;
}



procedure _CHECK_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal != _value);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal != _value);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_SrcVal;



implementation {:inline 1} _LOG_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_SrcVal);
    return;
}



procedure _CHECK_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcVal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_SrcVal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcVal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_SrcVal := (if _P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
    return;
}



const _WATCHED_VALUE_$$d_LimitsA: bv32;

procedure {:inline 1} _LOG_READ_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_LimitsA;



implementation {:inline 1} _LOG_READ_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_LimitsA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsA == _value then true else _READ_HAS_OCCURRED_$$d_LimitsA);
    return;
}



procedure _CHECK_READ_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_LimitsA);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_LimitsA: bool;

procedure {:inline 1} _LOG_WRITE_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_LimitsA, _WRITE_READ_BENIGN_FLAG_$$d_LimitsA;



implementation {:inline 1} _LOG_WRITE_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_LimitsA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsA == _value then true else _WRITE_HAS_OCCURRED_$$d_LimitsA);
    _WRITE_READ_BENIGN_FLAG_$$d_LimitsA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_LimitsA);
    return;
}



procedure _CHECK_WRITE_$$d_LimitsA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsA != _value);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsA != _value);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_LimitsA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_LimitsA;



implementation {:inline 1} _LOG_ATOMIC_$$d_LimitsA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_LimitsA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_LimitsA);
    return;
}



procedure _CHECK_ATOMIC_$$d_LimitsA(_P: bool, _offset: bv32);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_LimitsA"} {:array "$$d_LimitsA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_LimitsA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_LimitsA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_LimitsA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_LimitsA := (if _P && _WRITE_HAS_OCCURRED_$$d_LimitsA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_LimitsA);
    return;
}



const _WATCHED_VALUE_$$d_LimitsB: bv32;

procedure {:inline 1} _LOG_READ_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_LimitsB;



implementation {:inline 1} _LOG_READ_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_LimitsB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsB == _value then true else _READ_HAS_OCCURRED_$$d_LimitsB);
    return;
}



procedure _CHECK_READ_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_LimitsB);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_LimitsB: bool;

procedure {:inline 1} _LOG_WRITE_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_LimitsB, _WRITE_READ_BENIGN_FLAG_$$d_LimitsB;



implementation {:inline 1} _LOG_WRITE_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_LimitsB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsB == _value then true else _WRITE_HAS_OCCURRED_$$d_LimitsB);
    _WRITE_READ_BENIGN_FLAG_$$d_LimitsB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_LimitsB);
    return;
}



procedure _CHECK_WRITE_$$d_LimitsB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsB != _value);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_LimitsB != _value);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_LimitsB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_LimitsB;



implementation {:inline 1} _LOG_ATOMIC_$$d_LimitsB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_LimitsB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_LimitsB);
    return;
}



procedure _CHECK_ATOMIC_$$d_LimitsB(_P: bool, _offset: bv32);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_LimitsB"} {:array "$$d_LimitsB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_LimitsB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_LimitsB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_LimitsB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_LimitsB := (if _P && _WRITE_HAS_OCCURRED_$$d_LimitsB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_LimitsB);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lenSrcB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstA"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "startDstB"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key);
    return;
}



const _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;



implementation {:inline 1} _LOG_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val == _value then true else _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val);
    return;
}



procedure _CHECK_READ_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;



implementation {:inline 1} _LOG_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val);
    return;
}



procedure _CHECK_WRITE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon23_Then, anon23_Else;

  anon23_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon6;

  anon6:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon7;

  anon7:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon8;

  anon8:
    goto anon24_Then, anon24_Else;

  anon24_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon17;

  anon17:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon18;

  anon18:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon19;

  anon19:
    goto anon25_Then, anon25_Else;

  anon25_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon22;

  anon22:
    havoc _TRACKING;
    return;

  anon25_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon21;

  anon21:
    havoc $$d_DstVal;
    goto anon22;

  anon24_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon10;

  anon10:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon11;

  anon11:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon12;

  anon12:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon13;

  anon13:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon14;

  anon14:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon15;

  anon15:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon16;

  anon16:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon17;

  anon23_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon23_Then, anon23_Else;

  anon23_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon6;

  anon6:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon7;

  anon7:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon8;

  anon8:
    goto anon24_Then, anon24_Else;

  anon24_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon17;

  anon17:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon18;

  anon18:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon19;

  anon19:
    goto anon25_Then, anon25_Else;

  anon25_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon22;

  anon22:
    havoc _TRACKING;
    return;

  anon25_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon21;

  anon21:
    havoc $$d_DstVal;
    goto anon22;

  anon24_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon10;

  anon10:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon11;

  anon11:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon12;

  anon12:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon13;

  anon13:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon14;

  anon14:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon15;

  anon15:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon16;

  anon16:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon17;

  anon23_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon23_Then, anon23_Else;

  anon23_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon6;

  anon6:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon7;

  anon7:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon8;

  anon8:
    goto anon24_Then, anon24_Else;

  anon24_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon17;

  anon17:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon18;

  anon18:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon19;

  anon19:
    goto anon25_Then, anon25_Else;

  anon25_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon22;

  anon22:
    havoc _TRACKING;
    return;

  anon25_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon21;

  anon21:
    havoc $$d_DstVal;
    goto anon22;

  anon24_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon10;

  anon10:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon11;

  anon11:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon12;

  anon12:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon13;

  anon13:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon14;

  anon14:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon15;

  anon15:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon16;

  anon16:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon17;

  anon23_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon23_Then, anon23_Else;

  anon23_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon6;

  anon6:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon7;

  anon7:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon8;

  anon8:
    goto anon24_Then, anon24_Else;

  anon24_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon17;

  anon17:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon18;

  anon18:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon19;

  anon19:
    goto anon25_Then, anon25_Else;

  anon25_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon22;

  anon22:
    havoc _TRACKING;
    return;

  anon25_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon21;

  anon21:
    havoc $$d_DstVal;
    goto anon22;

  anon24_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcA;
    goto anon10;

  anon10:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startSrcB;
    goto anon11;

  anon11:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcA;
    goto anon12;

  anon12:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE7lenSrcB;
    goto anon13;

  anon13:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstA;
    goto anon14;

  anon14:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE9startDstB;
    goto anon15;

  anon15:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_key;
    goto anon16;

  anon16:
    havoc $$_ZZ30mergeElementaryIntervalsKernelILj1EEvPjS0_S0_S0_S0_S0_jjE5s_val;
    goto anon17;

  anon23_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
