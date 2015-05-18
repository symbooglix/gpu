type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Limits"} {:global} $$d_Limits: [bv32]bv32;

axiom {:array_info "$$d_Limits"} {:global} {:elem_width 32} {:source_name "d_Limits"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Limits: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Limits: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Limits: bool;

var {:source_name "d_Ranks"} {:global} $$d_Ranks: [bv32]bv32;

axiom {:array_info "$$d_Ranks"} {:global} {:elem_width 32} {:source_name "d_Ranks"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Ranks: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Ranks: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Ranks: bool;

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

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

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



procedure {:source_name "mergeRanksAndIndicesKernel"} {:kernel} $_Z26mergeRanksAndIndicesKernelPjS_jjj($stride: bv32, $N: bv32, $threadCount: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if BV32_AND($stride, BV1_ZEXT32((if BV32_SUB($stride, 1bv32) == 0bv32 then 1bv1 else 0bv1))) != 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV32_ULT($stride, $N) then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Limits && !_WRITE_HAS_OCCURRED_$$d_Limits && !_ATOMIC_HAS_OCCURRED_$$d_Limits;
  requires !_READ_HAS_OCCURRED_$$d_Ranks && !_WRITE_HAS_OCCURRED_$$d_Ranks && !_ATOMIC_HAS_OCCURRED_$$d_Ranks;
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
  modifies _WRITE_HAS_OCCURRED_$$d_Limits, _WRITE_READ_BENIGN_FLAG_$$d_Limits, _WRITE_READ_BENIGN_FLAG_$$d_Limits;



implementation {:source_name "mergeRanksAndIndicesKernel"} {:kernel} $_Z26mergeRanksAndIndicesKernelPjS_jjj($stride: bv32, $N: bv32, $threadCount: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $pos.i3.0$1: bv32;
  var $pos.i3.0$2: bv32;
  var $.02$1: bv32;
  var $.02$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $pos.i3.1$1: bv32;
  var $pos.i3.1$2: bv32;
  var $.03$1: bv32;
  var $.03$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $pos.i.0$1: bv32;
  var $pos.i.0$2: bv32;
  var $4$1: bv32;
  var $4$2: bv32;
  var $pos.i.1$1: bv32;
  var $pos.i.1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bv32;
  var v26$2: bv32;
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
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_UGE(v0$1, $threadCount);
    v1$2 := BV32_UGE(v0$2, $threadCount);
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
    p27$1 := false;
    p27$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    v2$1 := (if p1$1 then BV32_AND(v0$1, BV32_SUB(BV32_UDIV($stride, 128bv32), 1bv32)) else v2$1);
    v2$2 := (if p1$2 then BV32_AND(v0$2, BV32_SUB(BV32_UDIV($stride, 128bv32), 1bv32)) else v2$2);
    v3$1 := (if p1$1 then BV32_MUL(BV32_SUB(v0$1, v2$1), 256bv32) else v3$1);
    v3$2 := (if p1$2 then BV32_MUL(BV32_SUB(v0$2, v2$2), 256bv32) else v3$2);
    v4$1 := (if p1$1 then BV32_MUL(BV32_SUB(v0$1, v2$1), 2bv32) else v4$1);
    v4$2 := (if p1$2 then BV32_MUL(BV32_SUB(v0$2, v2$2), 2bv32) else v4$2);
    v5$1 := (if p1$1 then BV32_MUL(BV32_SUB(v0$1, v2$1), 2bv32) else v5$1);
    v5$2 := (if p1$2 then BV32_MUL(BV32_SUB(v0$2, v2$2), 2bv32) else v5$2);
    v6$1 := (if p1$1 then BV32_ULT($stride, BV32_SUB(BV32_SUB($N, v3$1), $stride)) else v6$1);
    v6$2 := (if p1$2 then BV32_ULT($stride, BV32_SUB(BV32_SUB($N, v3$2), $stride)) else v6$2);
    p2$1 := (if p1$1 && v6$1 then v6$1 else p2$1);
    p2$2 := (if p1$2 && v6$2 then v6$2 else p2$2);
    p3$1 := (if p1$1 && !v6$1 then !v6$1 else p3$1);
    p3$2 := (if p1$2 && !v6$2 then !v6$2 else p3$2);
    $0$1 := (if p2$1 then $stride else $0$1);
    $0$2 := (if p2$2 then $stride else $0$2);
    $0$1 := (if p3$1 then BV32_SUB(BV32_SUB($N, v3$1), $stride) else $0$1);
    $0$2 := (if p3$2 then BV32_SUB(BV32_SUB($N, v3$2), $stride) else $0$2);
    v7$1 := (if p1$1 then BV32_UREM($stride, 128bv32) == 0bv32 else v7$1);
    v7$2 := (if p1$2 then BV32_UREM($stride, 128bv32) == 0bv32 else v7$2);
    p4$1 := (if p1$1 && v7$1 then v7$1 else p4$1);
    p4$2 := (if p1$2 && v7$2 then v7$2 else p4$2);
    p5$1 := (if p1$1 && !v7$1 then !v7$1 else p5$1);
    p5$2 := (if p1$2 && !v7$2 then !v7$2 else p5$2);
    $1$1 := (if p4$1 then BV32_UDIV($stride, 128bv32) else $1$1);
    $1$2 := (if p4$2 then BV32_UDIV($stride, 128bv32) else $1$2);
    $1$1 := (if p5$1 then BV32_ADD(BV32_UDIV($stride, 128bv32), 1bv32) else $1$1);
    $1$2 := (if p5$2 then BV32_ADD(BV32_UDIV($stride, 128bv32), 1bv32) else $1$2);
    v8$1 := (if p1$1 then BV32_UREM($0$1, 128bv32) == 0bv32 else v8$1);
    v8$2 := (if p1$2 then BV32_UREM($0$2, 128bv32) == 0bv32 else v8$2);
    p6$1 := (if p1$1 && v8$1 then v8$1 else p6$1);
    p6$2 := (if p1$2 && v8$2 then v8$2 else p6$2);
    p7$1 := (if p1$1 && !v8$1 then !v8$1 else p7$1);
    p7$2 := (if p1$2 && !v8$2 then !v8$2 else p7$2);
    $2$1 := (if p6$1 then BV32_UDIV($0$1, 128bv32) else $2$1);
    $2$2 := (if p6$2 then BV32_UDIV($0$2, 128bv32) else $2$2);
    $2$1 := (if p7$1 then BV32_ADD(BV32_UDIV($0$1, 128bv32), 1bv32) else $2$1);
    $2$2 := (if p7$2 then BV32_ADD(BV32_UDIV($0$2, 128bv32), 1bv32) else $2$2);
    v9$1 := (if p1$1 then BV32_ULT(v2$1, $1$1) else v9$1);
    v9$2 := (if p1$2 then BV32_ULT(v2$2, $1$2) else v9$2);
    p8$1 := (if p1$1 && v9$1 then v9$1 else p8$1);
    p8$2 := (if p1$2 && v9$2 then v9$2 else p8$2);
    v10$1 := (if p8$1 then $$d_Ranks[BV32_ADD(v4$1, v2$1)] else v10$1);
    v10$2 := (if p8$2 then $$d_Ranks[BV32_ADD(v4$2, v2$2)] else v10$2);
    call v11$1, v11$2 := BV32_CTLZ(false, p8$1, BV32_SUB($2$1, 1bv32), p8$2, BV32_SUB($2$2, 1bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "BV32_CTLZ"} true;
    v12$1 := (if p8$1 then $2$1 == 0bv32 else v12$1);
    v12$2 := (if p8$2 then $2$2 == 0bv32 else v12$2);
    p9$1 := (if p8$1 && v12$1 then v12$1 else p9$1);
    p9$2 := (if p8$2 && v12$2 then v12$2 else p9$2);
    p10$1 := (if p8$1 && !v12$1 then !v12$1 else p10$1);
    p10$2 := (if p8$2 && !v12$2 then !v12$2 else p10$2);
    $.0$1 := (if p9$1 then 0bv32 else $.0$1);
    $.0$2 := (if p9$2 then 0bv32 else $.0$2);
    $pos.i3.0$1, $.02$1 := (if p10$1 then 0bv32 else $pos.i3.0$1), (if p10$1 then BV32_SHL(1bv32, BV32_SUB(32bv32, v11$1)) else $.02$1);
    $pos.i3.0$2, $.02$2 := (if p10$2 then 0bv32 else $pos.i3.0$2), (if p10$2 then BV32_SHL(1bv32, BV32_SUB(32bv32, v11$2)) else $.02$2);
    p11$1 := (if p10$1 then true else p11$1);
    p11$2 := (if p10$2 then true else p11$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 18} p11$1 ==> true;
    v13$1 := (if p11$1 then BV32_UGT($.02$1, 0bv32) else v13$1);
    v13$2 := (if p11$2 then BV32_UGT($.02$2, 0bv32) else v13$2);
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
    p12$1 := (if p11$1 && v13$1 then v13$1 else p12$1);
    p12$2 := (if p11$2 && v13$2 then v13$2 else p12$2);
    p11$1 := (if p11$1 && !v13$1 then v13$1 else p11$1);
    p11$2 := (if p11$2 && !v13$2 then v13$2 else p11$2);
    v14$1 := (if p12$1 then BV32_ULT(BV32_ADD($pos.i3.0$1, $.02$1), $2$1) else v14$1);
    v14$2 := (if p12$2 then BV32_ULT(BV32_ADD($pos.i3.0$2, $.02$2), $2$2) else v14$2);
    p14$1 := (if p12$1 && v14$1 then v14$1 else p14$1);
    p14$2 := (if p12$2 && v14$2 then v14$2 else p14$2);
    p13$1 := (if p12$1 && !v14$1 then !v14$1 else p13$1);
    p13$2 := (if p12$2 && !v14$2 then !v14$2 else p13$2);
    $3$1 := (if p13$1 then $2$1 else $3$1);
    $3$2 := (if p13$2 then $2$2 else $3$2);
    $3$1 := (if p14$1 then BV32_ADD($pos.i3.0$1, $.02$1) else $3$1);
    $3$2 := (if p14$2 then BV32_ADD($pos.i3.0$2, $.02$2) else $3$2);
    v15$1 := (if p12$1 then $$d_Ranks[BV32_ADD(BV32_ADD(v4$1, $1$1), BV32_SUB($3$1, 1bv32))] else v15$1);
    v15$2 := (if p12$2 then $$d_Ranks[BV32_ADD(BV32_ADD(v4$2, $1$2), BV32_SUB($3$2, 1bv32))] else v15$2);
    v16$1 := (if p12$1 then BV32_ULT(v15$1, v10$1) else v16$1);
    v16$2 := (if p12$2 then BV32_ULT(v15$2, v10$2) else v16$2);
    p16$1 := (if p12$1 && v16$1 then v16$1 else p16$1);
    p16$2 := (if p12$2 && v16$2 then v16$2 else p16$2);
    p15$1 := (if p12$1 && !v16$1 then !v16$1 else p15$1);
    p15$2 := (if p12$2 && !v16$2 then !v16$2 else p15$2);
    $pos.i3.1$1 := (if p15$1 then $pos.i3.0$1 else $pos.i3.1$1);
    $pos.i3.1$2 := (if p15$2 then $pos.i3.0$2 else $pos.i3.1$2);
    $pos.i3.1$1 := (if p16$1 then $3$1 else $pos.i3.1$1);
    $pos.i3.1$2 := (if p16$2 then $3$2 else $pos.i3.1$2);
    $pos.i3.0$1, $.02$1 := (if p12$1 then $pos.i3.1$1 else $pos.i3.0$1), (if p12$1 then BV32_LSHR($.02$1, 1bv32) else $.02$1);
    $pos.i3.0$2, $.02$2 := (if p12$2 then $pos.i3.1$2 else $pos.i3.0$2), (if p12$2 then BV32_LSHR($.02$2, 1bv32) else $.02$2);
    p11$1 := (if p12$1 then true else p11$1);
    p11$2 := (if p12$2 then true else p11$2);
    goto $13.backedge, $13.tail;

  $13.tail:
    assume !p11$1 && !p11$2;
    $.0$1 := (if p10$1 then $pos.i3.0$1 else $.0$1);
    $.0$2 := (if p10$2 then $pos.i3.0$2 else $.0$2);
    v17$1 := (if p8$1 then $$d_Ranks[BV32_ADD(v4$1, v2$1)] else v17$1);
    v17$2 := (if p8$2 then $$d_Ranks[BV32_ADD(v4$2, v2$2)] else v17$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$d_Limits(p8$1, BV32_ADD(v5$1, BV32_ADD($.0$1, v2$1)), v17$1, $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.0$1, v2$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Limits(p8$2, BV32_ADD(v5$2, BV32_ADD($.0$2, v2$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$d_Limits(p8$2, BV32_ADD(v5$2, BV32_ADD($.0$2, v2$2)), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Limits"} true;
    $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.0$1, v2$1))] := (if p8$1 then v17$1 else $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.0$1, v2$1))]);
    $$d_Limits[BV32_ADD(v5$2, BV32_ADD($.0$2, v2$2))] := (if p8$2 then v17$2 else $$d_Limits[BV32_ADD(v5$2, BV32_ADD($.0$2, v2$2))]);
    v18$1 := (if p1$1 then BV32_ULT(v2$1, $2$1) else v18$1);
    v18$2 := (if p1$2 then BV32_ULT(v2$2, $2$2) else v18$2);
    p18$1 := (if p1$1 && v18$1 then v18$1 else p18$1);
    p18$2 := (if p1$2 && v18$2 then v18$2 else p18$2);
    v19$1 := (if p18$1 then $$d_Ranks[BV32_ADD(v4$1, BV32_ADD($1$1, v2$1))] else v19$1);
    v19$2 := (if p18$2 then $$d_Ranks[BV32_ADD(v4$2, BV32_ADD($1$2, v2$2))] else v19$2);
    call v20$1, v20$2 := BV32_CTLZ(false, p18$1, BV32_SUB($1$1, 1bv32), p18$2, BV32_SUB($1$2, 1bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "BV32_CTLZ"} true;
    v21$1 := (if p18$1 then $1$1 == 0bv32 else v21$1);
    v21$2 := (if p18$2 then $1$2 == 0bv32 else v21$2);
    p19$1 := (if p18$1 && v21$1 then v21$1 else p19$1);
    p19$2 := (if p18$2 && v21$2 then v21$2 else p19$2);
    p20$1 := (if p18$1 && !v21$1 then !v21$1 else p20$1);
    p20$2 := (if p18$2 && !v21$2 then !v21$2 else p20$2);
    $.03$1 := (if p19$1 then 0bv32 else $.03$1);
    $.03$2 := (if p19$2 then 0bv32 else $.03$2);
    $.01$1, $pos.i.0$1 := (if p20$1 then BV32_SHL(1bv32, BV32_SUB(32bv32, v20$1)) else $.01$1), (if p20$1 then 0bv32 else $pos.i.0$1);
    $.01$2, $pos.i.0$2 := (if p20$2 then BV32_SHL(1bv32, BV32_SUB(32bv32, v20$2)) else $.01$2), (if p20$2 then 0bv32 else $pos.i.0$2);
    p21$1 := (if p20$1 then true else p21$1);
    p21$2 := (if p20$2 then true else p21$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $25;

  $25:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 35} p21$1 ==> true;
    v22$1 := (if p21$1 then BV32_UGT($.01$1, 0bv32) else v22$1);
    v22$2 := (if p21$2 then BV32_UGT($.01$2, 0bv32) else v22$2);
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
    p22$1 := (if p21$1 && v22$1 then v22$1 else p22$1);
    p22$2 := (if p21$2 && v22$2 then v22$2 else p22$2);
    p21$1 := (if p21$1 && !v22$1 then v22$1 else p21$1);
    p21$2 := (if p21$2 && !v22$2 then v22$2 else p21$2);
    v23$1 := (if p22$1 then BV32_ULT(BV32_ADD($pos.i.0$1, $.01$1), $1$1) else v23$1);
    v23$2 := (if p22$2 then BV32_ULT(BV32_ADD($pos.i.0$2, $.01$2), $1$2) else v23$2);
    p24$1 := (if p22$1 && v23$1 then v23$1 else p24$1);
    p24$2 := (if p22$2 && v23$2 then v23$2 else p24$2);
    p23$1 := (if p22$1 && !v23$1 then !v23$1 else p23$1);
    p23$2 := (if p22$2 && !v23$2 then !v23$2 else p23$2);
    $4$1 := (if p23$1 then $1$1 else $4$1);
    $4$2 := (if p23$2 then $1$2 else $4$2);
    $4$1 := (if p24$1 then BV32_ADD($pos.i.0$1, $.01$1) else $4$1);
    $4$2 := (if p24$2 then BV32_ADD($pos.i.0$2, $.01$2) else $4$2);
    v24$1 := (if p22$1 then $$d_Ranks[BV32_ADD(v4$1, BV32_SUB($4$1, 1bv32))] else v24$1);
    v24$2 := (if p22$2 then $$d_Ranks[BV32_ADD(v4$2, BV32_SUB($4$2, 1bv32))] else v24$2);
    v25$1 := (if p22$1 then BV32_ULE(v24$1, v19$1) else v25$1);
    v25$2 := (if p22$2 then BV32_ULE(v24$2, v19$2) else v25$2);
    p26$1 := (if p22$1 && v25$1 then v25$1 else p26$1);
    p26$2 := (if p22$2 && v25$2 then v25$2 else p26$2);
    p25$1 := (if p22$1 && !v25$1 then !v25$1 else p25$1);
    p25$2 := (if p22$2 && !v25$2 then !v25$2 else p25$2);
    $pos.i.1$1 := (if p25$1 then $pos.i.0$1 else $pos.i.1$1);
    $pos.i.1$2 := (if p25$2 then $pos.i.0$2 else $pos.i.1$2);
    $pos.i.1$1 := (if p26$1 then $4$1 else $pos.i.1$1);
    $pos.i.1$2 := (if p26$2 then $4$2 else $pos.i.1$2);
    $.01$1, $pos.i.0$1 := (if p22$1 then BV32_LSHR($.01$1, 1bv32) else $.01$1), (if p22$1 then $pos.i.1$1 else $pos.i.0$1);
    $.01$2, $pos.i.0$2 := (if p22$2 then BV32_LSHR($.01$2, 1bv32) else $.01$2), (if p22$2 then $pos.i.1$2 else $pos.i.0$2);
    p21$1 := (if p22$1 then true else p21$1);
    p21$2 := (if p22$2 then true else p21$2);
    goto $25.backedge, $25.tail;

  $25.tail:
    assume !p21$1 && !p21$2;
    $.03$1 := (if p20$1 then $pos.i.0$1 else $.03$1);
    $.03$2 := (if p20$2 then $pos.i.0$2 else $.03$2);
    v26$1 := (if p18$1 then $$d_Ranks[BV32_ADD(v4$1, BV32_ADD($1$1, v2$1))] else v26$1);
    v26$2 := (if p18$2 then $$d_Ranks[BV32_ADD(v4$2, BV32_ADD($1$2, v2$2))] else v26$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$d_Limits(p18$1, BV32_ADD(v5$1, BV32_ADD($.03$1, v2$1)), v26$1, $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.03$1, v2$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Limits(p18$2, BV32_ADD(v5$2, BV32_ADD($.03$2, v2$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$d_Limits(p18$2, BV32_ADD(v5$2, BV32_ADD($.03$2, v2$2)), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Limits"} true;
    $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.03$1, v2$1))] := (if p18$1 then v26$1 else $$d_Limits[BV32_ADD(v5$1, BV32_ADD($.03$1, v2$1))]);
    $$d_Limits[BV32_ADD(v5$2, BV32_ADD($.03$2, v2$2))] := (if p18$2 then v26$2 else $$d_Limits[BV32_ADD(v5$2, BV32_ADD($.03$2, v2$2))]);
    return;

  $25.backedge:
    assume {:backedge} p21$1 || p21$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $25;

  $13.backedge:
    assume {:backedge} p11$1 || p11$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $13;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_Limits: bv32;

procedure {:inline 1} _LOG_READ_$$d_Limits(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Limits;



implementation {:inline 1} _LOG_READ_$$d_Limits(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Limits := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Limits == _value then true else _READ_HAS_OCCURRED_$$d_Limits);
    return;
}



procedure _CHECK_READ_$$d_Limits(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Limits);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Limits: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Limits(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Limits, _WRITE_READ_BENIGN_FLAG_$$d_Limits;



implementation {:inline 1} _LOG_WRITE_$$d_Limits(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Limits := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Limits == _value then true else _WRITE_HAS_OCCURRED_$$d_Limits);
    _WRITE_READ_BENIGN_FLAG_$$d_Limits := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Limits == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Limits);
    return;
}



procedure _CHECK_WRITE_$$d_Limits(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Limits != _value);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Limits != _value);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Limits(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Limits;



implementation {:inline 1} _LOG_ATOMIC_$$d_Limits(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Limits := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Limits);
    return;
}



procedure _CHECK_ATOMIC_$$d_Limits(_P: bool, _offset: bv32);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Limits"} {:array "$$d_Limits"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Limits(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Limits;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Limits(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Limits := (if _P && _WRITE_HAS_OCCURRED_$$d_Limits && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Limits);
    return;
}



const _WATCHED_VALUE_$$d_Ranks: bv32;

procedure {:inline 1} _LOG_READ_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Ranks;



implementation {:inline 1} _LOG_READ_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Ranks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Ranks == _value then true else _READ_HAS_OCCURRED_$$d_Ranks);
    return;
}



procedure _CHECK_READ_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Ranks);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Ranks: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Ranks, _WRITE_READ_BENIGN_FLAG_$$d_Ranks;



implementation {:inline 1} _LOG_WRITE_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Ranks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Ranks == _value then true else _WRITE_HAS_OCCURRED_$$d_Ranks);
    _WRITE_READ_BENIGN_FLAG_$$d_Ranks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Ranks == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Ranks);
    return;
}



procedure _CHECK_WRITE_$$d_Ranks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Ranks != _value);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Ranks != _value);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Ranks(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Ranks;



implementation {:inline 1} _LOG_ATOMIC_$$d_Ranks(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Ranks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Ranks);
    return;
}



procedure _CHECK_ATOMIC_$$d_Ranks(_P: bool, _offset: bv32);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Ranks"} {:array "$$d_Ranks"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Ranks(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Ranks;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Ranks(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Ranks := (if _P && _WRITE_HAS_OCCURRED_$$d_Ranks && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Ranks);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
