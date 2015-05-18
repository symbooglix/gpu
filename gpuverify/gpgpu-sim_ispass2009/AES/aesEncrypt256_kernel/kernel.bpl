type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "result"} {:global} $$result: [bv32]bv32;

axiom {:array_info "$$result"} {:global} {:elem_width 32} {:source_name "result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$result: bool;

axiom {:array_info "$$inData"} {:global} {:elem_width 32} {:source_name "inData"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inData: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:source_name "stageBlock1"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE11stageBlock1: [bv1][bv32]bv8;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:group_shared} {:elem_width 8} {:source_name "stageBlock1"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1: bool;

var {:source_name "TBox0"} {:constant} $$TBox0$1: [bv32]bv32;

var {:source_name "TBox0"} {:constant} $$TBox0$2: [bv32]bv32;

axiom {:array_info "$$TBox0"} {:constant} {:elem_width 32} {:source_name "TBox0"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:source_name "tBox0Block"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE10tBox0Block: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:group_shared} {:elem_width 32} {:source_name "tBox0Block"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block: bool;

var {:source_name "TBox1"} {:constant} $$TBox1$1: [bv32]bv32;

var {:source_name "TBox1"} {:constant} $$TBox1$2: [bv32]bv32;

axiom {:array_info "$$TBox1"} {:constant} {:elem_width 32} {:source_name "TBox1"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:source_name "tBox1Block"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE10tBox1Block: [bv1][bv32]bv8;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:group_shared} {:elem_width 8} {:source_name "tBox1Block"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block: bool;

var {:source_name "TBox2"} {:constant} $$TBox2$1: [bv32]bv32;

var {:source_name "TBox2"} {:constant} $$TBox2$2: [bv32]bv32;

axiom {:array_info "$$TBox2"} {:constant} {:elem_width 32} {:source_name "TBox2"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:source_name "tBox2Block"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE10tBox2Block: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:group_shared} {:elem_width 32} {:source_name "tBox2Block"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block: bool;

var {:source_name "TBox3"} {:constant} $$TBox3$1: [bv32]bv32;

var {:source_name "TBox3"} {:constant} $$TBox3$2: [bv32]bv32;

axiom {:array_info "$$TBox3"} {:constant} {:elem_width 32} {:source_name "TBox3"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:source_name "tBox3Block"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE10tBox3Block: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:group_shared} {:elem_width 32} {:source_name "tBox3Block"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block: bool;

axiom {:array_info "$$texEKey"} {:global} {:elem_width 32} {:source_name "texEKey"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texEKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texEKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texEKey: bool;

var {:source_name "stageBlock2"} {:group_shared} $$_ZZ13aesEncrypt256PjS_iE11stageBlock2: [bv1][bv32]bv8;

axiom {:array_info "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:group_shared} {:elem_width 8} {:source_name "stageBlock2"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2: bool;

var {:source_name "posIdx_E"} {:constant} $$posIdx_E$1: [bv32]bv8;

var {:source_name "posIdx_E"} {:constant} $$posIdx_E$2: [bv32]bv8;

axiom {:array_info "$$posIdx_E"} {:constant} {:elem_width 8} {:source_name "posIdx_E"} {:source_elem_width 8} {:source_dimensions "32"} true;

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

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "aesEncrypt256"} {:kernel} $_Z13aesEncrypt256PjS_i($inputSize: bv32);
  requires !_READ_HAS_OCCURRED_$$result && !_WRITE_HAS_OCCURRED_$$result && !_ATOMIC_HAS_OCCURRED_$$result;
  requires !_READ_HAS_OCCURRED_$$inData && !_WRITE_HAS_OCCURRED_$$inData && !_ATOMIC_HAS_OCCURRED_$$inData;
  requires !_READ_HAS_OCCURRED_$$texEKey && !_WRITE_HAS_OCCURRED_$$texEKey && !_ATOMIC_HAS_OCCURRED_$$texEKey;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
  requires !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
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
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$result, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block, _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$result, _WRITE_READ_BENIGN_FLAG_$$result, _WRITE_READ_BENIGN_FLAG_$$result, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block, _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;



implementation {:source_name "aesEncrypt256"} {:kernel} $_Z13aesEncrypt256PjS_i($inputSize: bv32)
{
  var $cnt.0: bv32;
  var v322$1: bv8;
  var v322$2: bv8;
  var v323$1: bv8;
  var v323$2: bv8;
  var v324$1: bv8;
  var v324$2: bv8;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv8;
  var v75$2: bv8;
  var v76$1: bv8;
  var v76$2: bv8;
  var v77$1: bv8;
  var v77$2: bv8;
  var v78$1: bv8;
  var v78$2: bv8;
  var v7$1: bv32;
  var v7$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v15$1: bv8;
  var v15$2: bv8;
  var v51$1: bv32;
  var v51$2: bv32;
  var v50$1: bv8;
  var v50$2: bv8;
  var v87$1: bv32;
  var v87$2: bv32;
  var v88$1: bv32;
  var v88$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
  var v49$1: bv8;
  var v49$2: bv8;
  var v91$1: bv8;
  var v91$2: bv8;
  var v92$1: bv8;
  var v92$2: bv8;
  var v6$1: bv32;
  var v6$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v325$1: bv8;
  var v325$2: bv8;
  var v326$1: bv8;
  var v326$2: bv8;
  var v327$1: bv32;
  var v327$2: bv32;
  var v328$1: bv32;
  var v328$2: bv32;
  var v329$1: bv32;
  var v329$2: bv32;
  var v52$1: bv8;
  var v52$2: bv8;
  var v53$1: bv8;
  var v53$2: bv8;
  var v54$1: bv8;
  var v54$2: bv8;
  var v55$1: bv8;
  var v55$2: bv8;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v165$1: bv8;
  var v165$2: bv8;
  var v166$1: bv32;
  var v166$2: bv32;
  var v168$1: bv8;
  var v168$2: bv8;
  var v167$1: bv8;
  var v167$2: bv8;
  var v180$1: bv32;
  var v180$2: bv32;
  var v181$1: bv8;
  var v181$2: bv8;
  var v139$1: bv8;
  var v139$2: bv8;
  var v140$1: bv8;
  var v140$2: bv8;
  var v0$1: bv32;
  var v0$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv8;
  var v112$2: bv8;
  var v19$1: bv32;
  var v19$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v188$1: bv8;
  var v188$2: bv8;
  var v189$1: bv32;
  var v189$2: bv32;
  var v190$1: bv8;
  var v190$2: bv8;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v93$1: bv8;
  var v93$2: bv8;
  var v12$1: bv32;
  var v12$2: bv32;
  var v314$1: bv32;
  var v314$2: bv32;
  var v315$1: bv32;
  var v315$2: bv32;
  var v316$1: bv32;
  var v316$2: bv32;
  var v317$1: bv32;
  var v317$2: bv32;
  var v318$1: bv32;
  var v318$2: bv32;
  var v191$1: bv8;
  var v191$2: bv8;
  var v192$1: bv8;
  var v192$2: bv8;
  var v193$1: bv8;
  var v193$2: bv8;
  var v194$1: bv32;
  var v194$2: bv32;
  var v195$1: bv32;
  var v195$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv32;
  var v197$2: bv32;
  var v198$1: bv32;
  var v198$2: bv32;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv32;
  var v201$2: bv32;
  var v202$1: bv32;
  var v202$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v24$1: bv8;
  var v24$2: bv8;
  var v176$1: bv32;
  var v176$2: bv32;
  var v177$1: bv32;
  var v177$2: bv32;
  var v178$1: bv32;
  var v178$2: bv32;
  var v179$1: bv32;
  var v179$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v137$1: bv8;
  var v137$2: bv8;
  var v138$1: bv8;
  var v138$2: bv8;
  var v307$1: bv8;
  var v307$2: bv8;
  var v308$1: bv8;
  var v308$2: bv8;
  var v309$1: bv32;
  var v309$2: bv32;
  var v310$1: bv32;
  var v310$2: bv32;
  var v311$1: bv32;
  var v311$2: bv32;
  var v312$1: bv32;
  var v312$2: bv32;
  var v313$1: bv32;
  var v313$2: bv32;
  var v203$1: bv32;
  var v203$2: bv32;
  var v204$1: bv8;
  var v204$2: bv8;
  var v205$1: bv8;
  var v205$2: bv8;
  var v206$1: bv8;
  var v206$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv8;
  var v26$2: bv8;
  var v182$1: bv8;
  var v182$2: bv8;
  var v183$1: bv8;
  var v183$2: bv8;
  var v105$1: bv32;
  var v105$2: bv32;
  var v106$1: bv32;
  var v106$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v207$1: bv8;
  var v207$2: bv8;
  var v208$1: bv8;
  var v208$2: bv8;
  var v209$1: bv8;
  var v209$2: bv8;
  var v210$1: bv8;
  var v210$2: bv8;
  var v89$1: bv8;
  var v89$2: bv8;
  var v90$1: bv8;
  var v90$2: bv8;
  var v10$1: bv32;
  var v10$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bv32;
  var v83$2: bv32;
  var v27$1: bv8;
  var v27$2: bv8;
  var v4$1: bv32;
  var v4$2: bv32;
  var v169$1: bv8;
  var v169$2: bv8;
  var v170$1: bv8;
  var v170$2: bv8;
  var v171$1: bv32;
  var v171$2: bv32;
  var v172$1: bv32;
  var v172$2: bv32;
  var v173$1: bv32;
  var v173$2: bv32;
  var v174$1: bv32;
  var v174$2: bv32;
  var v175$1: bv32;
  var v175$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
  var v113$1: bv8;
  var v113$2: bv8;
  var v211$1: bv8;
  var v211$2: bv8;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv8;
  var v213$2: bv8;
  var v214$1: bv8;
  var v214$2: bv8;
  var v215$1: bv8;
  var v215$2: bv8;
  var v216$1: bv8;
  var v216$2: bv8;
  var v217$1: bv32;
  var v217$2: bv32;
  var v218$1: bv32;
  var v218$2: bv32;
  var v219$1: bv32;
  var v219$2: bv32;
  var v220$1: bv32;
  var v220$2: bv32;
  var v221$1: bv32;
  var v221$2: bv32;
  var v222$1: bv32;
  var v222$2: bv32;
  var v223$1: bv32;
  var v223$2: bv32;
  var v224$1: bv32;
  var v224$2: bv32;
  var v225$1: bv32;
  var v225$2: bv32;
  var v226$1: bv32;
  var v226$2: bv32;
  var v48$1: bv8;
  var v48$2: bv8;
  var v28$1: bv32;
  var v28$2: bv32;
  var v30$1: bv8;
  var v30$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v143$1: bv32;
  var v143$2: bv32;
  var v145$1: bv8;
  var v145$2: bv8;
  var v144$1: bv8;
  var v144$2: bv8;
  var v146$1: bv8;
  var v146$2: bv8;
  var v147$1: bv8;
  var v147$2: bv8;
  var v148$1: bv32;
  var v148$2: bv32;
  var v66$1: bv8;
  var v66$2: bv8;
  var v114$1: bv8;
  var v114$2: bv8;
  var v115$1: bv8;
  var v115$2: bv8;
  var v227$1: bv8;
  var v227$2: bv8;
  var v228$1: bv8;
  var v228$2: bv8;
  var v229$1: bv8;
  var v229$2: bv8;
  var v230$1: bv8;
  var v230$2: bv8;
  var v231$1: bv8;
  var v231$2: bv8;
  var v33$1: bv32;
  var v33$2: bv32;
  var v20$1: bv8;
  var v20$2: bv8;
  var v149$1: bv32;
  var v149$2: bv32;
  var v150$1: bv32;
  var v150$2: bv32;
  var v151$1: bv32;
  var v151$2: bv32;
  var v152$1: bv32;
  var v152$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
  var v154$1: bv32;
  var v154$2: bv32;
  var v67$1: bv8;
  var v67$2: bv8;
  var v116$1: bv8;
  var v116$2: bv8;
  var v117$1: bv8;
  var v117$2: bv8;
  var v232$1: bv8;
  var v232$2: bv8;
  var v233$1: bv8;
  var v233$2: bv8;
  var v234$1: bv8;
  var v234$2: bv8;
  var v235$1: bv32;
  var v235$2: bv32;
  var v236$1: bv8;
  var v236$2: bv8;
  var v237$1: bv8;
  var v237$2: bv8;
  var v238$1: bv8;
  var v238$2: bv8;
  var v239$1: bv8;
  var v239$2: bv8;
  var v240$1: bv32;
  var v240$2: bv32;
  var v241$1: bv32;
  var v241$2: bv32;
  var v242$1: bv32;
  var v242$2: bv32;
  var v243$1: bv32;
  var v243$2: bv32;
  var v244$1: bv32;
  var v244$2: bv32;
  var v245$1: bv32;
  var v245$2: bv32;
  var v246$1: bv32;
  var v246$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v21$1: bv8;
  var v21$2: bv8;
  var v155$1: bv32;
  var v155$2: bv32;
  var v156$1: bv32;
  var v156$2: bv32;
  var v157$1: bv32;
  var v157$2: bv32;
  var v68$1: bv8;
  var v68$2: bv8;
  var v2$1: bv32;
  var v2$2: bv32;
  var v118$1: bv8;
  var v118$2: bv8;
  var v119$1: bv8;
  var v119$2: bv8;
  var v330$1: bv32;
  var v330$2: bv32;
  var v331$1: bv32;
  var v331$2: bv32;
  var v332$1: bv32;
  var v332$2: bv32;
  var v333$1: bv32;
  var v333$2: bv32;
  var v334$1: bv8;
  var v334$2: bv8;
  var v335$1: bv8;
  var v335$2: bv8;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v186$1: bv8;
  var v186$2: bv8;
  var v187$1: bv8;
  var v187$2: bv8;
  var v69$1: bv8;
  var v69$2: bv8;
  var v141$1: bv8;
  var v141$2: bv8;
  var v142$1: bv8;
  var v142$2: bv8;
  var v250$1: bv8;
  var v250$2: bv8;
  var v251$1: bv8;
  var v251$2: bv8;
  var v252$1: bv8;
  var v252$2: bv8;
  var v253$1: bv8;
  var v253$2: bv8;
  var v254$1: bv8;
  var v254$2: bv8;
  var v255$1: bv8;
  var v255$2: bv8;
  var v42$1: bv32;
  var v42$2: bv32;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v70$1: bv8;
  var v70$2: bv8;
  var v3: bool;
  var v120$1: bv32;
  var v120$2: bv32;
  var v122$1: bv8;
  var v122$2: bv8;
  var v121$1: bv8;
  var v121$2: bv8;
  var v123$1: bv8;
  var v123$2: bv8;
  var v124$1: bv8;
  var v124$2: bv8;
  var v125$1: bv32;
  var v125$2: bv32;
  var v126$1: bv32;
  var v126$2: bv32;
  var v256$1: bv8;
  var v256$2: bv8;
  var v257$1: bv8;
  var v257$2: bv8;
  var v258$1: bv32;
  var v258$2: bv32;
  var v260$1: bv8;
  var v260$2: bv8;
  var v259$1: bv8;
  var v259$2: bv8;
  var v261$1: bv8;
  var v261$2: bv8;
  var v262$1: bv8;
  var v262$2: bv8;
  var v263$1: bv32;
  var v263$2: bv32;
  var v264$1: bv32;
  var v264$2: bv32;
  var v265$1: bv32;
  var v265$2: bv32;
  var v266$1: bv32;
  var v266$2: bv32;
  var v267$1: bv32;
  var v267$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v269$1: bv32;
  var v269$2: bv32;
  var v270$1: bv32;
  var v270$2: bv32;
  var v43$1: bv8;
  var v43$2: bv8;
  var v158$1: bv8;
  var v158$2: bv8;
  var v159$1: bv8;
  var v159$2: bv8;
  var v71$1: bv8;
  var v71$2: bv8;
  var v127$1: bv32;
  var v127$2: bv32;
  var v128$1: bv32;
  var v128$2: bv32;
  var v129$1: bv32;
  var v129$2: bv32;
  var v130$1: bv32;
  var v130$2: bv32;
  var v131$1: bv32;
  var v131$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v273$1: bv8;
  var v273$2: bv8;
  var v274$1: bv8;
  var v274$2: bv8;
  var v275$1: bv8;
  var v275$2: bv8;
  var v276$1: bv8;
  var v276$2: bv8;
  var v44$1: bv8;
  var v44$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v160$1: bv8;
  var v160$2: bv8;
  var v133$1: bv32;
  var v133$2: bv32;
  var v134$1: bv32;
  var v134$2: bv32;
  var v277$1: bv8;
  var v277$2: bv8;
  var v278$1: bv8;
  var v278$2: bv8;
  var v279$1: bv8;
  var v279$2: bv8;
  var v280$1: bv8;
  var v280$2: bv8;
  var v281$1: bv32;
  var v281$2: bv32;
  var v283$1: bv8;
  var v283$2: bv8;
  var v282$1: bv8;
  var v282$2: bv8;
  var v284$1: bv8;
  var v284$2: bv8;
  var v285$1: bv8;
  var v285$2: bv8;
  var v286$1: bv32;
  var v286$2: bv32;
  var v287$1: bv32;
  var v287$2: bv32;
  var v45$1: bv8;
  var v45$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v161$1: bv8;
  var v161$2: bv8;
  var v162$1: bv8;
  var v162$2: bv8;
  var v72$1: bv8;
  var v72$2: bv8;
  var v98$1: bv8;
  var v98$2: bv8;
  var v101$1: bv8;
  var v101$2: bv8;
  var v102$1: bv32;
  var v102$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv32;
  var v104$2: bv32;
  var v288$1: bv32;
  var v288$2: bv32;
  var v289$1: bv32;
  var v289$2: bv32;
  var v290$1: bv32;
  var v290$2: bv32;
  var v291$1: bv32;
  var v291$2: bv32;
  var v292$1: bv32;
  var v292$2: bv32;
  var v293$1: bv32;
  var v293$2: bv32;
  var v294$1: bv32;
  var v294$2: bv32;
  var v295$1: bv32;
  var v295$2: bv32;
  var v296$1: bv8;
  var v296$2: bv8;
  var v297$1: bv8;
  var v297$2: bv8;
  var v298$1: bv8;
  var v298$2: bv8;
  var v46$1: bv8;
  var v46$2: bv8;
  var v47$1: bv8;
  var v47$2: bv8;
  var v5$1: bv32;
  var v5$2: bv32;
  var v163$1: bv8;
  var v163$2: bv8;
  var v164$1: bv8;
  var v164$2: bv8;
  var v73$1: bv8;
  var v73$2: bv8;
  var v135$1: bv8;
  var v135$2: bv8;
  var v136$1: bv8;
  var v136$2: bv8;
  var v299$1: bv8;
  var v299$2: bv8;
  var v300$1: bv8;
  var v300$2: bv8;
  var v301$1: bv8;
  var v301$2: bv8;
  var v302$1: bv8;
  var v302$2: bv8;
  var v303$1: bv8;
  var v303$2: bv8;
  var v304$1: bv32;
  var v304$2: bv32;
  var v305$1: bv8;
  var v305$2: bv8;
  var v306$1: bv8;
  var v306$2: bv8;
  var v184$1: bv8;
  var v184$2: bv8;
  var v185$1: bv8;
  var v185$2: bv8;
  var v94$1: bv8;
  var v94$2: bv8;
  var v95$1: bv8;
  var v95$2: bv8;
  var v320$1: bv8;
  var v320$2: bv8;
  var v321$1: bv8;
  var v321$2: bv8;
  var v319$1: bv8;
  var v319$2: bv8;
  var v96$1: bv8;
  var v96$2: bv8;
  var v97$1: bv32;
  var v97$2: bv32;
  var v99$1: bv8;
  var v99$2: bv8;
  var v100$1: bv8;
  var v100$2: bv8;
  var v336$1: bv8;
  var v336$2: bv8;
  var v337$1: bv8;
  var v337$2: bv8;
  var v338$1: bv8;
  var v338$2: bv8;
  var v339$1: bv8;
  var v339$2: bv8;
  var v340$1: bv8;
  var v340$2: bv8;
  var v341$1: bv8;
  var v341$2: bv8;


  $0:
    v0$1 := BV32_UREM(local_id_x$1, 4bv32);
    v0$2 := BV32_UREM(local_id_x$2, 4bv32);
    v1$1 := BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 4bv32);
    v1$2 := BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 4bv32);
    havoc v2$1, v2$2;
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v2$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v2$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v2$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v2$2[8:0];
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v2$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v2$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v2$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v2$2[16:8];
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v2$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v2$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v2$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v2$2[24:16];
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v2$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v2$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v2$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v2$2[32:24];
    $cnt.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b4 ==> _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(BV32_ADD(0bv32, local_id_x$1), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_x$1), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_x$1), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_x$1), 4bv32), 3bv32));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($cnt.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($cnt.0, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v3 := BV32_ULT($cnt.0, 1bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v3 && !v3;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 21} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    havoc v8$1, v8$2;
    $$0$0bv32$1 := v8$1;
    $$0$0bv32$2 := v8$2;
    havoc v9$1, v9$2;
    $$0$1bv32$1 := v9$1;
    $$0$1bv32$2 := v9$2;
    havoc v10$1, v10$2;
    $$0$2bv32$1 := v10$1;
    $$0$2bv32$2 := v10$2;
    v11$1 := $$0$0bv32$1;
    v11$2 := $$0$0bv32$2;
    v12$1 := $$0$1bv32$1;
    v12$2 := $$0$1bv32$2;
    v13$1 := $$0$2bv32$1;
    v13$2 := $$0$2bv32$2;
    call {:sourceloc_num 31} v14$1, v14$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v11$1, v12$1, v13$1, v0$1, v11$2, v12$2, v13$2, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 32} true;
    v15$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)];
    v15$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 33} true;
    v16$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)];
    v16$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 34} true;
    v17$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)];
    v17$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 35} true;
    v18$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)];
    v18$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)];
    v19$1 := BV32_XOR(v18$1 ++ v17$1 ++ v16$1 ++ v15$1, v14$1);
    v19$2 := BV32_XOR(v18$2 ++ v17$2 ++ v16$2 ++ v15$2, v14$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v19$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v19$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v19$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v19$2[8:0];
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v19$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v19$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v19$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v19$2[16:8];
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v19$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v19$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v19$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v19$2[24:16];
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v19$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v19$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v19$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v19$2[32:24];
    goto __partitioned_block_$falsebb_2;

  __partitioned_block_$falsebb_2:
    call {:sourceloc_num 40} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v20$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v20$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 42} true;
    v21$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v20$1), v1$1), 4bv32)];
    v21$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v20$2), v1$2), 4bv32)];
    v22$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v22$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 44} true;
    v23$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v22$1), v1$1), 4bv32), 1bv32)];
    v23$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v22$2), v1$2), 4bv32), 1bv32)];
    v24$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v24$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 46} true;
    v25$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v24$1), v1$1), 4bv32), 2bv32)];
    v25$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v24$2), v1$2), 4bv32), 2bv32)];
    v26$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v26$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 48} true;
    v27$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v26$1), v1$1), 4bv32), 3bv32)];
    v27$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v26$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 49} true;
    v28$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v21$1)];
    v28$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v21$2)];
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 50} true;
    v29$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v23$1), 4bv32)];
    v29$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v23$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 51} true;
    v30$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$1), 4bv32), 1bv32)];
    v30$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 52} true;
    v31$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$1), 4bv32), 2bv32)];
    v31$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 53} true;
    v32$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$1), 4bv32), 3bv32)];
    v32$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v23$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 54} true;
    v33$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v25$1)];
    v33$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v25$2)];
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 55} true;
    v34$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v27$1)];
    v34$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v27$2)];
    havoc v35$1, v35$2;
    $$1$0bv32$1 := v35$1;
    $$1$0bv32$2 := v35$2;
    havoc v36$1, v36$2;
    $$1$1bv32$1 := v36$1;
    $$1$1bv32$2 := v36$2;
    havoc v37$1, v37$2;
    $$1$2bv32$1 := v37$1;
    $$1$2bv32$2 := v37$2;
    v38$1 := $$1$0bv32$1;
    v38$2 := $$1$0bv32$2;
    v39$1 := $$1$1bv32$1;
    v39$2 := $$1$1bv32$2;
    v40$1 := $$1$2bv32$1;
    v40$2 := $$1$2bv32$2;
    call {:sourceloc_num 65} v41$1, v41$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v38$1, v39$1, v40$1, BV32_ADD(v0$1, 4bv32), v38$2, v39$2, v40$2, BV32_ADD(v0$2, 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v42$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v28$1, v32$1 ++ v31$1 ++ v30$1 ++ v29$1), v33$1), v34$1), v41$1);
    v42$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v28$2, v32$2 ++ v31$2 ++ v30$2 ++ v29$2), v33$2), v34$2), v41$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v42$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v42$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v42$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v42$2[8:0];
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v42$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v42$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v42$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v42$2[16:8];
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v42$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v42$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v42$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v42$2[24:16];
    call {:sourceloc} {:sourceloc_num 69} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v42$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 69} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v42$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v42$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v42$2[32:24];
    goto __partitioned_block_$falsebb_3;

  __partitioned_block_$falsebb_3:
    call {:sourceloc_num 70} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v43$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v43$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 72} true;
    v44$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v43$1), v1$1), 4bv32)];
    v44$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v43$2), v1$2), 4bv32)];
    v45$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v45$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 74} true;
    v46$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v45$1), v1$1), 4bv32), 1bv32)];
    v46$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v45$2), v1$2), 4bv32), 1bv32)];
    v47$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v47$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 76} true;
    v48$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v47$1), v1$1), 4bv32), 2bv32)];
    v48$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v47$2), v1$2), 4bv32), 2bv32)];
    v49$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v49$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 78} true;
    v50$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v49$1), v1$1), 4bv32), 3bv32)];
    v50$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v49$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 79} true;
    v51$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v44$1)];
    v51$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v44$2)];
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 80} true;
    v52$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v46$1), 4bv32)];
    v52$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v46$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 81} true;
    v53$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$1), 4bv32), 1bv32)];
    v53$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 82} true;
    v54$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$1), 4bv32), 2bv32)];
    v54$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 83} true;
    v55$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$1), 4bv32), 3bv32)];
    v55$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v46$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 84} true;
    v56$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v48$1)];
    v56$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v48$2)];
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 85} true;
    v57$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v50$1)];
    v57$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v50$2)];
    havoc v58$1, v58$2;
    $$2$0bv32$1 := v58$1;
    $$2$0bv32$2 := v58$2;
    havoc v59$1, v59$2;
    $$2$1bv32$1 := v59$1;
    $$2$1bv32$2 := v59$2;
    havoc v60$1, v60$2;
    $$2$2bv32$1 := v60$1;
    $$2$2bv32$2 := v60$2;
    v61$1 := $$2$0bv32$1;
    v61$2 := $$2$0bv32$2;
    v62$1 := $$2$1bv32$1;
    v62$2 := $$2$1bv32$2;
    v63$1 := $$2$2bv32$1;
    v63$2 := $$2$2bv32$2;
    call {:sourceloc_num 95} v64$1, v64$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v61$1, v62$1, v63$1, BV32_ADD(v0$1, 8bv32), v61$2, v62$2, v63$2, BV32_ADD(v0$2, 8bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v65$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v51$1, v55$1 ++ v54$1 ++ v53$1 ++ v52$1), v56$1), v57$1), v64$1);
    v65$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v51$2, v55$2 ++ v54$2 ++ v53$2 ++ v52$2), v56$2), v57$2), v64$2);
    call {:sourceloc} {:sourceloc_num 96} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v65$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 96} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v65$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v65$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v65$2[8:0];
    call {:sourceloc} {:sourceloc_num 97} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v65$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 97} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v65$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v65$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v65$2[16:8];
    call {:sourceloc} {:sourceloc_num 98} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v65$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 98} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v65$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v65$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v65$2[24:16];
    call {:sourceloc} {:sourceloc_num 99} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v65$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 99} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v65$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v65$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v65$2[32:24];
    goto __partitioned_block_$falsebb_4;

  __partitioned_block_$falsebb_4:
    call {:sourceloc_num 100} $bugle_barrier_duplicated_3(1bv1, 1bv1);
    v66$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v66$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 102} true;
    v67$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v66$1), v1$1), 4bv32)];
    v67$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v66$2), v1$2), 4bv32)];
    v68$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v68$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 104} true;
    v69$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v68$1), v1$1), 4bv32), 1bv32)];
    v69$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v68$2), v1$2), 4bv32), 1bv32)];
    v70$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v70$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 106} true;
    v71$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v70$1), v1$1), 4bv32), 2bv32)];
    v71$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v70$2), v1$2), 4bv32), 2bv32)];
    v72$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v72$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 108} true;
    v73$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v72$1), v1$1), 4bv32), 3bv32)];
    v73$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v72$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 109} true;
    v74$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v67$1)];
    v74$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v67$2)];
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 110} true;
    v75$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v69$1), 4bv32)];
    v75$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v69$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 111} true;
    v76$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$1), 4bv32), 1bv32)];
    v76$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 112} true;
    v77$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$1), 4bv32), 2bv32)];
    v77$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 113} true;
    v78$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$1), 4bv32), 3bv32)];
    v78$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v69$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 114} true;
    v79$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v71$1)];
    v79$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v71$2)];
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 115} true;
    v80$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v73$1)];
    v80$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v73$2)];
    havoc v81$1, v81$2;
    $$3$0bv32$1 := v81$1;
    $$3$0bv32$2 := v81$2;
    havoc v82$1, v82$2;
    $$3$1bv32$1 := v82$1;
    $$3$1bv32$2 := v82$2;
    havoc v83$1, v83$2;
    $$3$2bv32$1 := v83$1;
    $$3$2bv32$2 := v83$2;
    v84$1 := $$3$0bv32$1;
    v84$2 := $$3$0bv32$2;
    v85$1 := $$3$1bv32$1;
    v85$2 := $$3$1bv32$2;
    v86$1 := $$3$2bv32$1;
    v86$2 := $$3$2bv32$2;
    call {:sourceloc_num 125} v87$1, v87$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v84$1, v85$1, v86$1, BV32_ADD(v0$1, 12bv32), v84$2, v85$2, v86$2, BV32_ADD(v0$2, 12bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v88$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v74$1, v78$1 ++ v77$1 ++ v76$1 ++ v75$1), v79$1), v80$1), v87$1);
    v88$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v74$2, v78$2 ++ v77$2 ++ v76$2 ++ v75$2), v79$2), v80$2), v87$2);
    call {:sourceloc} {:sourceloc_num 126} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v88$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 126} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 126} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v88$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v88$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v88$2[8:0];
    call {:sourceloc} {:sourceloc_num 127} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v88$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 127} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 127} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v88$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v88$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v88$2[16:8];
    call {:sourceloc} {:sourceloc_num 128} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v88$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 128} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 128} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v88$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v88$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v88$2[24:16];
    call {:sourceloc} {:sourceloc_num 129} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v88$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 129} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 129} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v88$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v88$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v88$2[32:24];
    goto __partitioned_block_$falsebb_5;

  __partitioned_block_$falsebb_5:
    call {:sourceloc_num 130} $bugle_barrier_duplicated_4(1bv1, 1bv1);
    v89$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v89$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 132} true;
    v90$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v89$1), v1$1), 4bv32)];
    v90$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v89$2), v1$2), 4bv32)];
    v91$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v91$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 134} true;
    v92$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v91$1), v1$1), 4bv32), 1bv32)];
    v92$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v91$2), v1$2), 4bv32), 1bv32)];
    v93$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v93$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 136} true;
    v94$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v93$1), v1$1), 4bv32), 2bv32)];
    v94$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v93$2), v1$2), 4bv32), 2bv32)];
    v95$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v95$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 138} true;
    v96$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v95$1), v1$1), 4bv32), 3bv32)];
    v96$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v95$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 139} true;
    v97$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v90$1)];
    v97$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v90$2)];
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 140} true;
    v98$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v92$1), 4bv32)];
    v98$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v92$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 141} true;
    v99$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$1), 4bv32), 1bv32)];
    v99$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 142} true;
    v100$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$1), 4bv32), 2bv32)];
    v100$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 143} true;
    v101$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$1), 4bv32), 3bv32)];
    v101$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v92$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 144} true;
    v102$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v94$1)];
    v102$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v94$2)];
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 145} true;
    v103$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v96$1)];
    v103$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v96$2)];
    havoc v104$1, v104$2;
    $$4$0bv32$1 := v104$1;
    $$4$0bv32$2 := v104$2;
    havoc v105$1, v105$2;
    $$4$1bv32$1 := v105$1;
    $$4$1bv32$2 := v105$2;
    havoc v106$1, v106$2;
    $$4$2bv32$1 := v106$1;
    $$4$2bv32$2 := v106$2;
    v107$1 := $$4$0bv32$1;
    v107$2 := $$4$0bv32$2;
    v108$1 := $$4$1bv32$1;
    v108$2 := $$4$1bv32$2;
    v109$1 := $$4$2bv32$1;
    v109$2 := $$4$2bv32$2;
    call {:sourceloc_num 155} v110$1, v110$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v107$1, v108$1, v109$1, BV32_ADD(v0$1, 16bv32), v107$2, v108$2, v109$2, BV32_ADD(v0$2, 16bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v111$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v97$1, v101$1 ++ v100$1 ++ v99$1 ++ v98$1), v102$1), v103$1), v110$1);
    v111$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v97$2, v101$2 ++ v100$2 ++ v99$2 ++ v98$2), v102$2), v103$2), v110$2);
    call {:sourceloc} {:sourceloc_num 156} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v111$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 156} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 156} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v111$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v111$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v111$2[8:0];
    call {:sourceloc} {:sourceloc_num 157} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v111$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 157} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 157} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v111$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v111$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v111$2[16:8];
    call {:sourceloc} {:sourceloc_num 158} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v111$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 158} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v111$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v111$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v111$2[24:16];
    call {:sourceloc} {:sourceloc_num 159} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v111$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 159} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 159} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v111$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v111$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v111$2[32:24];
    goto __partitioned_block_$falsebb_6;

  __partitioned_block_$falsebb_6:
    call {:sourceloc_num 160} $bugle_barrier_duplicated_5(1bv1, 1bv1);
    v112$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v112$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 162} true;
    v113$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v112$1), v1$1), 4bv32)];
    v113$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v112$2), v1$2), 4bv32)];
    v114$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v114$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 164} true;
    v115$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v114$1), v1$1), 4bv32), 1bv32)];
    v115$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v114$2), v1$2), 4bv32), 1bv32)];
    v116$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v116$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 166} true;
    v117$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v116$1), v1$1), 4bv32), 2bv32)];
    v117$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v116$2), v1$2), 4bv32), 2bv32)];
    v118$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v118$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 168} true;
    v119$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v118$1), v1$1), 4bv32), 3bv32)];
    v119$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v118$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 169} true;
    v120$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v113$1)];
    v120$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v113$2)];
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 170} true;
    v121$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v115$1), 4bv32)];
    v121$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v115$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 171} true;
    v122$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$1), 4bv32), 1bv32)];
    v122$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 172} true;
    v123$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$1), 4bv32), 2bv32)];
    v123$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 173} true;
    v124$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$1), 4bv32), 3bv32)];
    v124$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v115$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 174} true;
    v125$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v117$1)];
    v125$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v117$2)];
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 175} true;
    v126$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v119$1)];
    v126$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v119$2)];
    havoc v127$1, v127$2;
    $$5$0bv32$1 := v127$1;
    $$5$0bv32$2 := v127$2;
    havoc v128$1, v128$2;
    $$5$1bv32$1 := v128$1;
    $$5$1bv32$2 := v128$2;
    havoc v129$1, v129$2;
    $$5$2bv32$1 := v129$1;
    $$5$2bv32$2 := v129$2;
    v130$1 := $$5$0bv32$1;
    v130$2 := $$5$0bv32$2;
    v131$1 := $$5$1bv32$1;
    v131$2 := $$5$1bv32$2;
    v132$1 := $$5$2bv32$1;
    v132$2 := $$5$2bv32$2;
    call {:sourceloc_num 185} v133$1, v133$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v130$1, v131$1, v132$1, BV32_ADD(v0$1, 20bv32), v130$2, v131$2, v132$2, BV32_ADD(v0$2, 20bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v134$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v120$1, v124$1 ++ v123$1 ++ v122$1 ++ v121$1), v125$1), v126$1), v133$1);
    v134$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v120$2, v124$2 ++ v123$2 ++ v122$2 ++ v121$2), v125$2), v126$2), v133$2);
    call {:sourceloc} {:sourceloc_num 186} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v134$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 186} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 186} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v134$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v134$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v134$2[8:0];
    call {:sourceloc} {:sourceloc_num 187} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v134$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 187} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 187} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v134$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v134$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v134$2[16:8];
    call {:sourceloc} {:sourceloc_num 188} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v134$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 188} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 188} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v134$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v134$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v134$2[24:16];
    call {:sourceloc} {:sourceloc_num 189} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v134$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 189} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 189} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v134$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v134$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v134$2[32:24];
    goto __partitioned_block_$falsebb_7;

  __partitioned_block_$falsebb_7:
    call {:sourceloc_num 190} $bugle_barrier_duplicated_6(1bv1, 1bv1);
    v135$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v135$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 192} true;
    v136$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v135$1), v1$1), 4bv32)];
    v136$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v135$2), v1$2), 4bv32)];
    v137$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v137$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 194} true;
    v138$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v137$1), v1$1), 4bv32), 1bv32)];
    v138$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v137$2), v1$2), 4bv32), 1bv32)];
    v139$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v139$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 196} true;
    v140$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v139$1), v1$1), 4bv32), 2bv32)];
    v140$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v139$2), v1$2), 4bv32), 2bv32)];
    v141$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v141$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 198} true;
    v142$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v141$1), v1$1), 4bv32), 3bv32)];
    v142$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v141$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 199} true;
    v143$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v136$1)];
    v143$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v136$2)];
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 200} true;
    v144$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v138$1), 4bv32)];
    v144$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v138$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 201} true;
    v145$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$1), 4bv32), 1bv32)];
    v145$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 202} true;
    v146$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$1), 4bv32), 2bv32)];
    v146$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 203} true;
    v147$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$1), 4bv32), 3bv32)];
    v147$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v138$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 204} true;
    v148$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v140$1)];
    v148$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v140$2)];
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 205} true;
    v149$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v142$1)];
    v149$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v142$2)];
    havoc v150$1, v150$2;
    $$6$0bv32$1 := v150$1;
    $$6$0bv32$2 := v150$2;
    havoc v151$1, v151$2;
    $$6$1bv32$1 := v151$1;
    $$6$1bv32$2 := v151$2;
    havoc v152$1, v152$2;
    $$6$2bv32$1 := v152$1;
    $$6$2bv32$2 := v152$2;
    v153$1 := $$6$0bv32$1;
    v153$2 := $$6$0bv32$2;
    v154$1 := $$6$1bv32$1;
    v154$2 := $$6$1bv32$2;
    v155$1 := $$6$2bv32$1;
    v155$2 := $$6$2bv32$2;
    call {:sourceloc_num 215} v156$1, v156$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v153$1, v154$1, v155$1, BV32_ADD(v0$1, 24bv32), v153$2, v154$2, v155$2, BV32_ADD(v0$2, 24bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v157$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v143$1, v147$1 ++ v146$1 ++ v145$1 ++ v144$1), v148$1), v149$1), v156$1);
    v157$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v143$2, v147$2 ++ v146$2 ++ v145$2 ++ v144$2), v148$2), v149$2), v156$2);
    call {:sourceloc} {:sourceloc_num 216} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v157$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 216} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 216} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v157$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v157$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v157$2[8:0];
    call {:sourceloc} {:sourceloc_num 217} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v157$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 217} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 217} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v157$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v157$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v157$2[16:8];
    call {:sourceloc} {:sourceloc_num 218} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v157$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 218} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 218} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v157$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v157$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v157$2[24:16];
    call {:sourceloc} {:sourceloc_num 219} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v157$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 219} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 219} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v157$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v157$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v157$2[32:24];
    goto __partitioned_block_$falsebb_8;

  __partitioned_block_$falsebb_8:
    call {:sourceloc_num 220} $bugle_barrier_duplicated_7(1bv1, 1bv1);
    v158$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v158$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 222} true;
    v159$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v158$1), v1$1), 4bv32)];
    v159$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v158$2), v1$2), 4bv32)];
    v160$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v160$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 224} true;
    v161$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v160$1), v1$1), 4bv32), 1bv32)];
    v161$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v160$2), v1$2), 4bv32), 1bv32)];
    v162$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v162$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 226} true;
    v163$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v162$1), v1$1), 4bv32), 2bv32)];
    v163$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v162$2), v1$2), 4bv32), 2bv32)];
    v164$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v164$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 228} true;
    v165$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v164$1), v1$1), 4bv32), 3bv32)];
    v165$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v164$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 229} true;
    v166$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v159$1)];
    v166$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v159$2)];
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 230} true;
    v167$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v161$1), 4bv32)];
    v167$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v161$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 231} true;
    v168$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$1), 4bv32), 1bv32)];
    v168$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 232} true;
    v169$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$1), 4bv32), 2bv32)];
    v169$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 233} true;
    v170$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$1), 4bv32), 3bv32)];
    v170$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v161$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 234} true;
    v171$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v163$1)];
    v171$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v163$2)];
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 235} true;
    v172$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v165$1)];
    v172$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v165$2)];
    havoc v173$1, v173$2;
    $$7$0bv32$1 := v173$1;
    $$7$0bv32$2 := v173$2;
    havoc v174$1, v174$2;
    $$7$1bv32$1 := v174$1;
    $$7$1bv32$2 := v174$2;
    havoc v175$1, v175$2;
    $$7$2bv32$1 := v175$1;
    $$7$2bv32$2 := v175$2;
    v176$1 := $$7$0bv32$1;
    v176$2 := $$7$0bv32$2;
    v177$1 := $$7$1bv32$1;
    v177$2 := $$7$1bv32$2;
    v178$1 := $$7$2bv32$1;
    v178$2 := $$7$2bv32$2;
    call {:sourceloc_num 245} v179$1, v179$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v176$1, v177$1, v178$1, BV32_ADD(v0$1, 28bv32), v176$2, v177$2, v178$2, BV32_ADD(v0$2, 28bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v180$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v166$1, v170$1 ++ v169$1 ++ v168$1 ++ v167$1), v171$1), v172$1), v179$1);
    v180$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v166$2, v170$2 ++ v169$2 ++ v168$2 ++ v167$2), v171$2), v172$2), v179$2);
    call {:sourceloc} {:sourceloc_num 246} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v180$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 246} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 246} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v180$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v180$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v180$2[8:0];
    call {:sourceloc} {:sourceloc_num 247} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v180$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 247} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 247} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v180$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v180$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v180$2[16:8];
    call {:sourceloc} {:sourceloc_num 248} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v180$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 248} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 248} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v180$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v180$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v180$2[24:16];
    call {:sourceloc} {:sourceloc_num 249} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v180$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 249} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 249} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v180$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v180$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v180$2[32:24];
    goto __partitioned_block_$falsebb_9;

  __partitioned_block_$falsebb_9:
    call {:sourceloc_num 250} $bugle_barrier_duplicated_8(1bv1, 1bv1);
    v181$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v181$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 252} true;
    v182$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v181$1), v1$1), 4bv32)];
    v182$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v181$2), v1$2), 4bv32)];
    v183$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v183$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 254} true;
    v184$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v183$1), v1$1), 4bv32), 1bv32)];
    v184$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v183$2), v1$2), 4bv32), 1bv32)];
    v185$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v185$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 256} true;
    v186$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v185$1), v1$1), 4bv32), 2bv32)];
    v186$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v185$2), v1$2), 4bv32), 2bv32)];
    v187$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v187$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 258} true;
    v188$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v187$1), v1$1), 4bv32), 3bv32)];
    v188$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v187$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 259} true;
    v189$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v182$1)];
    v189$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v182$2)];
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 260} true;
    v190$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v184$1), 4bv32)];
    v190$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v184$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 261} true;
    v191$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$1), 4bv32), 1bv32)];
    v191$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 262} true;
    v192$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$1), 4bv32), 2bv32)];
    v192$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 263} true;
    v193$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$1), 4bv32), 3bv32)];
    v193$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v184$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 264} true;
    v194$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v186$1)];
    v194$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v186$2)];
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 265} true;
    v195$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v188$1)];
    v195$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v188$2)];
    havoc v196$1, v196$2;
    $$8$0bv32$1 := v196$1;
    $$8$0bv32$2 := v196$2;
    havoc v197$1, v197$2;
    $$8$1bv32$1 := v197$1;
    $$8$1bv32$2 := v197$2;
    havoc v198$1, v198$2;
    $$8$2bv32$1 := v198$1;
    $$8$2bv32$2 := v198$2;
    v199$1 := $$8$0bv32$1;
    v199$2 := $$8$0bv32$2;
    v200$1 := $$8$1bv32$1;
    v200$2 := $$8$1bv32$2;
    v201$1 := $$8$2bv32$1;
    v201$2 := $$8$2bv32$2;
    call {:sourceloc_num 275} v202$1, v202$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v199$1, v200$1, v201$1, BV32_ADD(v0$1, 32bv32), v199$2, v200$2, v201$2, BV32_ADD(v0$2, 32bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v203$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v189$1, v193$1 ++ v192$1 ++ v191$1 ++ v190$1), v194$1), v195$1), v202$1);
    v203$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v189$2, v193$2 ++ v192$2 ++ v191$2 ++ v190$2), v194$2), v195$2), v202$2);
    call {:sourceloc} {:sourceloc_num 276} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v203$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_128"} {:captureState "check_state_128"} {:sourceloc} {:sourceloc_num 276} true;
    call {:check_id "check_state_128"} {:sourceloc} {:sourceloc_num 276} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v203$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v203$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v203$2[8:0];
    call {:sourceloc} {:sourceloc_num 277} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v203$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_129"} {:captureState "check_state_129"} {:sourceloc} {:sourceloc_num 277} true;
    call {:check_id "check_state_129"} {:sourceloc} {:sourceloc_num 277} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v203$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v203$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v203$2[16:8];
    call {:sourceloc} {:sourceloc_num 278} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v203$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_130"} {:captureState "check_state_130"} {:sourceloc} {:sourceloc_num 278} true;
    call {:check_id "check_state_130"} {:sourceloc} {:sourceloc_num 278} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v203$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v203$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v203$2[24:16];
    call {:sourceloc} {:sourceloc_num 279} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v203$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_131"} {:captureState "check_state_131"} {:sourceloc} {:sourceloc_num 279} true;
    call {:check_id "check_state_131"} {:sourceloc} {:sourceloc_num 279} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v203$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v203$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v203$2[32:24];
    goto __partitioned_block_$falsebb_10;

  __partitioned_block_$falsebb_10:
    call {:sourceloc_num 280} $bugle_barrier_duplicated_9(1bv1, 1bv1);
    v204$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v204$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_132"} {:captureState "check_state_132"} {:sourceloc} {:sourceloc_num 282} true;
    v205$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v204$1), v1$1), 4bv32)];
    v205$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v204$2), v1$2), 4bv32)];
    v206$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v206$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_133"} {:captureState "check_state_133"} {:sourceloc} {:sourceloc_num 284} true;
    v207$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v206$1), v1$1), 4bv32), 1bv32)];
    v207$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v206$2), v1$2), 4bv32), 1bv32)];
    v208$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v208$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_134"} {:captureState "check_state_134"} {:sourceloc} {:sourceloc_num 286} true;
    v209$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v208$1), v1$1), 4bv32), 2bv32)];
    v209$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v208$2), v1$2), 4bv32), 2bv32)];
    v210$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v210$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_135"} {:captureState "check_state_135"} {:sourceloc} {:sourceloc_num 288} true;
    v211$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v210$1), v1$1), 4bv32), 3bv32)];
    v211$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v210$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_136"} {:captureState "check_state_136"} {:sourceloc} {:sourceloc_num 289} true;
    v212$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v205$1)];
    v212$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v205$2)];
    assume {:do_not_predicate} {:check_id "check_state_137"} {:captureState "check_state_137"} {:sourceloc} {:sourceloc_num 290} true;
    v213$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v207$1), 4bv32)];
    v213$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v207$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_138"} {:captureState "check_state_138"} {:sourceloc} {:sourceloc_num 291} true;
    v214$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$1), 4bv32), 1bv32)];
    v214$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_139"} {:captureState "check_state_139"} {:sourceloc} {:sourceloc_num 292} true;
    v215$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$1), 4bv32), 2bv32)];
    v215$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_140"} {:captureState "check_state_140"} {:sourceloc} {:sourceloc_num 293} true;
    v216$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$1), 4bv32), 3bv32)];
    v216$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v207$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_141"} {:captureState "check_state_141"} {:sourceloc} {:sourceloc_num 294} true;
    v217$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v209$1)];
    v217$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v209$2)];
    assume {:do_not_predicate} {:check_id "check_state_142"} {:captureState "check_state_142"} {:sourceloc} {:sourceloc_num 295} true;
    v218$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v211$1)];
    v218$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v211$2)];
    havoc v219$1, v219$2;
    $$9$0bv32$1 := v219$1;
    $$9$0bv32$2 := v219$2;
    havoc v220$1, v220$2;
    $$9$1bv32$1 := v220$1;
    $$9$1bv32$2 := v220$2;
    havoc v221$1, v221$2;
    $$9$2bv32$1 := v221$1;
    $$9$2bv32$2 := v221$2;
    v222$1 := $$9$0bv32$1;
    v222$2 := $$9$0bv32$2;
    v223$1 := $$9$1bv32$1;
    v223$2 := $$9$1bv32$2;
    v224$1 := $$9$2bv32$1;
    v224$2 := $$9$2bv32$2;
    call {:sourceloc_num 305} v225$1, v225$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v222$1, v223$1, v224$1, BV32_ADD(v0$1, 36bv32), v222$2, v223$2, v224$2, BV32_ADD(v0$2, 36bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v226$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v212$1, v216$1 ++ v215$1 ++ v214$1 ++ v213$1), v217$1), v218$1), v225$1);
    v226$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v212$2, v216$2 ++ v215$2 ++ v214$2 ++ v213$2), v217$2), v218$2), v225$2);
    call {:sourceloc} {:sourceloc_num 306} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v226$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_143"} {:captureState "check_state_143"} {:sourceloc} {:sourceloc_num 306} true;
    call {:check_id "check_state_143"} {:sourceloc} {:sourceloc_num 306} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v226$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v226$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v226$2[8:0];
    call {:sourceloc} {:sourceloc_num 307} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v226$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_144"} {:captureState "check_state_144"} {:sourceloc} {:sourceloc_num 307} true;
    call {:check_id "check_state_144"} {:sourceloc} {:sourceloc_num 307} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v226$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v226$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v226$2[16:8];
    call {:sourceloc} {:sourceloc_num 308} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v226$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_145"} {:captureState "check_state_145"} {:sourceloc} {:sourceloc_num 308} true;
    call {:check_id "check_state_145"} {:sourceloc} {:sourceloc_num 308} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v226$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v226$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v226$2[24:16];
    call {:sourceloc} {:sourceloc_num 309} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v226$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_146"} {:captureState "check_state_146"} {:sourceloc} {:sourceloc_num 309} true;
    call {:check_id "check_state_146"} {:sourceloc} {:sourceloc_num 309} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v226$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v226$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v226$2[32:24];
    goto __partitioned_block_$falsebb_11;

  __partitioned_block_$falsebb_11:
    call {:sourceloc_num 310} $bugle_barrier_duplicated_10(1bv1, 1bv1);
    v227$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v227$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_147"} {:captureState "check_state_147"} {:sourceloc} {:sourceloc_num 312} true;
    v228$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v227$1), v1$1), 4bv32)];
    v228$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v227$2), v1$2), 4bv32)];
    v229$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v229$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_148"} {:captureState "check_state_148"} {:sourceloc} {:sourceloc_num 314} true;
    v230$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v229$1), v1$1), 4bv32), 1bv32)];
    v230$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v229$2), v1$2), 4bv32), 1bv32)];
    v231$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v231$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_149"} {:captureState "check_state_149"} {:sourceloc} {:sourceloc_num 316} true;
    v232$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v231$1), v1$1), 4bv32), 2bv32)];
    v232$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v231$2), v1$2), 4bv32), 2bv32)];
    v233$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v233$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_150"} {:captureState "check_state_150"} {:sourceloc} {:sourceloc_num 318} true;
    v234$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v233$1), v1$1), 4bv32), 3bv32)];
    v234$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v233$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_151"} {:captureState "check_state_151"} {:sourceloc} {:sourceloc_num 319} true;
    v235$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v228$1)];
    v235$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v228$2)];
    assume {:do_not_predicate} {:check_id "check_state_152"} {:captureState "check_state_152"} {:sourceloc} {:sourceloc_num 320} true;
    v236$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v230$1), 4bv32)];
    v236$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v230$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_153"} {:captureState "check_state_153"} {:sourceloc} {:sourceloc_num 321} true;
    v237$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$1), 4bv32), 1bv32)];
    v237$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_154"} {:captureState "check_state_154"} {:sourceloc} {:sourceloc_num 322} true;
    v238$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$1), 4bv32), 2bv32)];
    v238$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_155"} {:captureState "check_state_155"} {:sourceloc} {:sourceloc_num 323} true;
    v239$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$1), 4bv32), 3bv32)];
    v239$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v230$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_156"} {:captureState "check_state_156"} {:sourceloc} {:sourceloc_num 324} true;
    v240$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v232$1)];
    v240$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v232$2)];
    assume {:do_not_predicate} {:check_id "check_state_157"} {:captureState "check_state_157"} {:sourceloc} {:sourceloc_num 325} true;
    v241$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v234$1)];
    v241$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v234$2)];
    havoc v242$1, v242$2;
    $$10$0bv32$1 := v242$1;
    $$10$0bv32$2 := v242$2;
    havoc v243$1, v243$2;
    $$10$1bv32$1 := v243$1;
    $$10$1bv32$2 := v243$2;
    havoc v244$1, v244$2;
    $$10$2bv32$1 := v244$1;
    $$10$2bv32$2 := v244$2;
    v245$1 := $$10$0bv32$1;
    v245$2 := $$10$0bv32$2;
    v246$1 := $$10$1bv32$1;
    v246$2 := $$10$1bv32$2;
    v247$1 := $$10$2bv32$1;
    v247$2 := $$10$2bv32$2;
    call {:sourceloc_num 335} v248$1, v248$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v245$1, v246$1, v247$1, BV32_ADD(v0$1, 40bv32), v245$2, v246$2, v247$2, BV32_ADD(v0$2, 40bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v249$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v235$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), v240$1), v241$1), v248$1);
    v249$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v235$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), v240$2), v241$2), v248$2);
    call {:sourceloc} {:sourceloc_num 336} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v249$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_158"} {:captureState "check_state_158"} {:sourceloc} {:sourceloc_num 336} true;
    call {:check_id "check_state_158"} {:sourceloc} {:sourceloc_num 336} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v249$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v249$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v249$2[8:0];
    call {:sourceloc} {:sourceloc_num 337} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v249$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_159"} {:captureState "check_state_159"} {:sourceloc} {:sourceloc_num 337} true;
    call {:check_id "check_state_159"} {:sourceloc} {:sourceloc_num 337} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v249$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v249$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v249$2[16:8];
    call {:sourceloc} {:sourceloc_num 338} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v249$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_160"} {:captureState "check_state_160"} {:sourceloc} {:sourceloc_num 338} true;
    call {:check_id "check_state_160"} {:sourceloc} {:sourceloc_num 338} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v249$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v249$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v249$2[24:16];
    call {:sourceloc} {:sourceloc_num 339} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v249$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_161"} {:captureState "check_state_161"} {:sourceloc} {:sourceloc_num 339} true;
    call {:check_id "check_state_161"} {:sourceloc} {:sourceloc_num 339} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v249$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v249$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v249$2[32:24];
    goto __partitioned_block_$falsebb_12;

  __partitioned_block_$falsebb_12:
    call {:sourceloc_num 340} $bugle_barrier_duplicated_11(1bv1, 1bv1);
    v250$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v250$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_162"} {:captureState "check_state_162"} {:sourceloc} {:sourceloc_num 342} true;
    v251$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v250$1), v1$1), 4bv32)];
    v251$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v250$2), v1$2), 4bv32)];
    v252$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v252$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_163"} {:captureState "check_state_163"} {:sourceloc} {:sourceloc_num 344} true;
    v253$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v252$1), v1$1), 4bv32), 1bv32)];
    v253$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v252$2), v1$2), 4bv32), 1bv32)];
    v254$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v254$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_164"} {:captureState "check_state_164"} {:sourceloc} {:sourceloc_num 346} true;
    v255$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v254$1), v1$1), 4bv32), 2bv32)];
    v255$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v254$2), v1$2), 4bv32), 2bv32)];
    v256$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v256$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_165"} {:captureState "check_state_165"} {:sourceloc} {:sourceloc_num 348} true;
    v257$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v256$1), v1$1), 4bv32), 3bv32)];
    v257$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v256$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_166"} {:captureState "check_state_166"} {:sourceloc} {:sourceloc_num 349} true;
    v258$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v251$1)];
    v258$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v251$2)];
    assume {:do_not_predicate} {:check_id "check_state_167"} {:captureState "check_state_167"} {:sourceloc} {:sourceloc_num 350} true;
    v259$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v253$1), 4bv32)];
    v259$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v253$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_168"} {:captureState "check_state_168"} {:sourceloc} {:sourceloc_num 351} true;
    v260$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$1), 4bv32), 1bv32)];
    v260$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_169"} {:captureState "check_state_169"} {:sourceloc} {:sourceloc_num 352} true;
    v261$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$1), 4bv32), 2bv32)];
    v261$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_170"} {:captureState "check_state_170"} {:sourceloc} {:sourceloc_num 353} true;
    v262$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$1), 4bv32), 3bv32)];
    v262$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v253$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_171"} {:captureState "check_state_171"} {:sourceloc} {:sourceloc_num 354} true;
    v263$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v255$1)];
    v263$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v255$2)];
    assume {:do_not_predicate} {:check_id "check_state_172"} {:captureState "check_state_172"} {:sourceloc} {:sourceloc_num 355} true;
    v264$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v257$1)];
    v264$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v257$2)];
    havoc v265$1, v265$2;
    $$11$0bv32$1 := v265$1;
    $$11$0bv32$2 := v265$2;
    havoc v266$1, v266$2;
    $$11$1bv32$1 := v266$1;
    $$11$1bv32$2 := v266$2;
    havoc v267$1, v267$2;
    $$11$2bv32$1 := v267$1;
    $$11$2bv32$2 := v267$2;
    v268$1 := $$11$0bv32$1;
    v268$2 := $$11$0bv32$2;
    v269$1 := $$11$1bv32$1;
    v269$2 := $$11$1bv32$2;
    v270$1 := $$11$2bv32$1;
    v270$2 := $$11$2bv32$2;
    call {:sourceloc_num 365} v271$1, v271$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v268$1, v269$1, v270$1, BV32_ADD(v0$1, 44bv32), v268$2, v269$2, v270$2, BV32_ADD(v0$2, 44bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v272$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v258$1, v262$1 ++ v261$1 ++ v260$1 ++ v259$1), v263$1), v264$1), v271$1);
    v272$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v258$2, v262$2 ++ v261$2 ++ v260$2 ++ v259$2), v263$2), v264$2), v271$2);
    call {:sourceloc} {:sourceloc_num 366} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v272$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_173"} {:captureState "check_state_173"} {:sourceloc} {:sourceloc_num 366} true;
    call {:check_id "check_state_173"} {:sourceloc} {:sourceloc_num 366} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v272$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v272$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v272$2[8:0];
    call {:sourceloc} {:sourceloc_num 367} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v272$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_174"} {:captureState "check_state_174"} {:sourceloc} {:sourceloc_num 367} true;
    call {:check_id "check_state_174"} {:sourceloc} {:sourceloc_num 367} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v272$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v272$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v272$2[16:8];
    call {:sourceloc} {:sourceloc_num 368} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v272$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_175"} {:captureState "check_state_175"} {:sourceloc} {:sourceloc_num 368} true;
    call {:check_id "check_state_175"} {:sourceloc} {:sourceloc_num 368} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v272$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v272$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v272$2[24:16];
    call {:sourceloc} {:sourceloc_num 369} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v272$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_176"} {:captureState "check_state_176"} {:sourceloc} {:sourceloc_num 369} true;
    call {:check_id "check_state_176"} {:sourceloc} {:sourceloc_num 369} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v272$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v272$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v272$2[32:24];
    goto __partitioned_block_$falsebb_13;

  __partitioned_block_$falsebb_13:
    call {:sourceloc_num 370} $bugle_barrier_duplicated_12(1bv1, 1bv1);
    v273$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v273$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_177"} {:captureState "check_state_177"} {:sourceloc} {:sourceloc_num 372} true;
    v274$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v273$1), v1$1), 4bv32)];
    v274$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v273$2), v1$2), 4bv32)];
    v275$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v275$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_178"} {:captureState "check_state_178"} {:sourceloc} {:sourceloc_num 374} true;
    v276$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v275$1), v1$1), 4bv32), 1bv32)];
    v276$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v275$2), v1$2), 4bv32), 1bv32)];
    v277$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v277$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_179"} {:captureState "check_state_179"} {:sourceloc} {:sourceloc_num 376} true;
    v278$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v277$1), v1$1), 4bv32), 2bv32)];
    v278$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v277$2), v1$2), 4bv32), 2bv32)];
    v279$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v279$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_180"} {:captureState "check_state_180"} {:sourceloc} {:sourceloc_num 378} true;
    v280$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v279$1), v1$1), 4bv32), 3bv32)];
    v280$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v279$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_181"} {:captureState "check_state_181"} {:sourceloc} {:sourceloc_num 379} true;
    v281$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v274$1)];
    v281$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v274$2)];
    assume {:do_not_predicate} {:check_id "check_state_182"} {:captureState "check_state_182"} {:sourceloc} {:sourceloc_num 380} true;
    v282$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v276$1), 4bv32)];
    v282$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v276$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_183"} {:captureState "check_state_183"} {:sourceloc} {:sourceloc_num 381} true;
    v283$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$1), 4bv32), 1bv32)];
    v283$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_184"} {:captureState "check_state_184"} {:sourceloc} {:sourceloc_num 382} true;
    v284$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$1), 4bv32), 2bv32)];
    v284$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_185"} {:captureState "check_state_185"} {:sourceloc} {:sourceloc_num 383} true;
    v285$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$1), 4bv32), 3bv32)];
    v285$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v276$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_186"} {:captureState "check_state_186"} {:sourceloc} {:sourceloc_num 384} true;
    v286$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v278$1)];
    v286$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v278$2)];
    assume {:do_not_predicate} {:check_id "check_state_187"} {:captureState "check_state_187"} {:sourceloc} {:sourceloc_num 385} true;
    v287$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v280$1)];
    v287$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v280$2)];
    havoc v288$1, v288$2;
    $$12$0bv32$1 := v288$1;
    $$12$0bv32$2 := v288$2;
    havoc v289$1, v289$2;
    $$12$1bv32$1 := v289$1;
    $$12$1bv32$2 := v289$2;
    havoc v290$1, v290$2;
    $$12$2bv32$1 := v290$1;
    $$12$2bv32$2 := v290$2;
    v291$1 := $$12$0bv32$1;
    v291$2 := $$12$0bv32$2;
    v292$1 := $$12$1bv32$1;
    v292$2 := $$12$1bv32$2;
    v293$1 := $$12$2bv32$1;
    v293$2 := $$12$2bv32$2;
    call {:sourceloc_num 395} v294$1, v294$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v291$1, v292$1, v293$1, BV32_ADD(v0$1, 48bv32), v291$2, v292$2, v293$2, BV32_ADD(v0$2, 48bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v295$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v281$1, v285$1 ++ v284$1 ++ v283$1 ++ v282$1), v286$1), v287$1), v294$1);
    v295$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v281$2, v285$2 ++ v284$2 ++ v283$2 ++ v282$2), v286$2), v287$2), v294$2);
    call {:sourceloc} {:sourceloc_num 396} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), v295$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_188"} {:captureState "check_state_188"} {:sourceloc} {:sourceloc_num 396} true;
    call {:check_id "check_state_188"} {:sourceloc} {:sourceloc_num 396} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), v295$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v295$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v295$2[8:0];
    call {:sourceloc} {:sourceloc_num 397} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v295$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_189"} {:captureState "check_state_189"} {:sourceloc} {:sourceloc_num 397} true;
    call {:check_id "check_state_189"} {:sourceloc} {:sourceloc_num 397} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v295$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v295$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v295$2[16:8];
    call {:sourceloc} {:sourceloc_num 398} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v295$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_190"} {:captureState "check_state_190"} {:sourceloc} {:sourceloc_num 398} true;
    call {:check_id "check_state_190"} {:sourceloc} {:sourceloc_num 398} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v295$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v295$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v295$2[24:16];
    call {:sourceloc} {:sourceloc_num 399} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v295$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_191"} {:captureState "check_state_191"} {:sourceloc} {:sourceloc_num 399} true;
    call {:check_id "check_state_191"} {:sourceloc} {:sourceloc_num 399} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v295$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v295$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v295$2[32:24];
    goto __partitioned_block_$falsebb_14;

  __partitioned_block_$falsebb_14:
    call {:sourceloc_num 400} $bugle_barrier_duplicated_13(1bv1, 1bv1);
    v296$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v296$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_192"} {:captureState "check_state_192"} {:sourceloc} {:sourceloc_num 402} true;
    v297$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v296$1), v1$1), 4bv32)];
    v297$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v296$2), v1$2), 4bv32)];
    v298$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v298$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_193"} {:captureState "check_state_193"} {:sourceloc} {:sourceloc_num 404} true;
    v299$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v298$1), v1$1), 4bv32), 1bv32)];
    v299$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v298$2), v1$2), 4bv32), 1bv32)];
    v300$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v300$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_194"} {:captureState "check_state_194"} {:sourceloc} {:sourceloc_num 406} true;
    v301$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v300$1), v1$1), 4bv32), 2bv32)];
    v301$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v300$2), v1$2), 4bv32), 2bv32)];
    v302$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v302$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_195"} {:captureState "check_state_195"} {:sourceloc} {:sourceloc_num 408} true;
    v303$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v302$1), v1$1), 4bv32), 3bv32)];
    v303$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v302$2), v1$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_196"} {:captureState "check_state_196"} {:sourceloc} {:sourceloc_num 409} true;
    v304$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV8_ZEXT32(v297$1)];
    v304$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v297$2)];
    assume {:do_not_predicate} {:check_id "check_state_197"} {:captureState "check_state_197"} {:sourceloc} {:sourceloc_num 410} true;
    v305$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV8_ZEXT32(v299$1), 4bv32)];
    v305$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV8_ZEXT32(v299$2), 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_198"} {:captureState "check_state_198"} {:sourceloc} {:sourceloc_num 411} true;
    v306$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$1), 4bv32), 1bv32)];
    v306$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$2), 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_199"} {:captureState "check_state_199"} {:sourceloc} {:sourceloc_num 412} true;
    v307$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$1), 4bv32), 2bv32)];
    v307$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$2), 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_200"} {:captureState "check_state_200"} {:sourceloc} {:sourceloc_num 413} true;
    v308$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$1), 4bv32), 3bv32)];
    v308$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v299$2), 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_201"} {:captureState "check_state_201"} {:sourceloc} {:sourceloc_num 414} true;
    v309$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV8_ZEXT32(v301$1)];
    v309$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v301$2)];
    assume {:do_not_predicate} {:check_id "check_state_202"} {:captureState "check_state_202"} {:sourceloc} {:sourceloc_num 415} true;
    v310$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV8_ZEXT32(v303$1)];
    v310$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV8_ZEXT32(v303$2)];
    havoc v311$1, v311$2;
    $$13$0bv32$1 := v311$1;
    $$13$0bv32$2 := v311$2;
    havoc v312$1, v312$2;
    $$13$1bv32$1 := v312$1;
    $$13$1bv32$2 := v312$2;
    havoc v313$1, v313$2;
    $$13$2bv32$1 := v313$1;
    $$13$2bv32$2 := v313$2;
    v314$1 := $$13$0bv32$1;
    v314$2 := $$13$0bv32$2;
    v315$1 := $$13$1bv32$1;
    v315$2 := $$13$1bv32$2;
    v316$1 := $$13$2bv32$1;
    v316$2 := $$13$2bv32$2;
    call {:sourceloc_num 425} v317$1, v317$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v314$1, v315$1, v316$1, BV32_ADD(v0$1, 52bv32), v314$2, v315$2, v316$2, BV32_ADD(v0$2, 52bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v318$1 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v304$1, v308$1 ++ v307$1 ++ v306$1 ++ v305$1), v309$1), v310$1), v317$1);
    v318$2 := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR(v304$2, v308$2 ++ v307$2 ++ v306$2 ++ v305$2), v309$2), v310$2), v317$2);
    call {:sourceloc} {:sourceloc_num 426} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$1, 4bv32), v318$1[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_203"} {:captureState "check_state_203"} {:sourceloc} {:sourceloc_num 426} true;
    call {:check_id "check_state_203"} {:sourceloc} {:sourceloc_num 426} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_MUL(local_id_x$2, 4bv32), v318$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v318$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v318$2[8:0];
    call {:sourceloc} {:sourceloc_num 427} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v318$1[16:8], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_204"} {:captureState "check_state_204"} {:sourceloc} {:sourceloc_num 427} true;
    call {:check_id "check_state_204"} {:sourceloc} {:sourceloc_num 427} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v318$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v318$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v318$2[16:8];
    call {:sourceloc} {:sourceloc_num 428} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v318$1[24:16], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_205"} {:captureState "check_state_205"} {:sourceloc} {:sourceloc_num 428} true;
    call {:check_id "check_state_205"} {:sourceloc} {:sourceloc_num 428} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v318$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v318$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v318$2[24:16];
    call {:sourceloc} {:sourceloc_num 429} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v318$1[32:24], $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_206"} {:captureState "check_state_206"} {:sourceloc} {:sourceloc_num 429} true;
    call {:check_id "check_state_206"} {:sourceloc} {:sourceloc_num 429} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v318$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v318$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v318$2[32:24];
    goto __partitioned_block_$falsebb_15;

  __partitioned_block_$falsebb_15:
    call {:sourceloc_num 430} $bugle_barrier_duplicated_14(1bv1, 1bv1);
    v319$1 := $$posIdx_E$1[BV32_MUL(v0$1, 4bv32)];
    v319$2 := $$posIdx_E$2[BV32_MUL(v0$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_207"} {:captureState "check_state_207"} {:sourceloc} {:sourceloc_num 432} true;
    v320$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_MUL(BV32_ADD(BV8_ZEXT32(v319$1), v1$1), 4bv32)];
    v320$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV8_ZEXT32(v319$2), v1$2), 4bv32)];
    v321$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v321$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_208"} {:captureState "check_state_208"} {:sourceloc} {:sourceloc_num 434} true;
    v322$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v321$1), v1$1), 4bv32), 1bv32)];
    v322$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v321$2), v1$2), 4bv32), 1bv32)];
    v323$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v323$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_209"} {:captureState "check_state_209"} {:sourceloc} {:sourceloc_num 436} true;
    v324$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v323$1), v1$1), 4bv32), 2bv32)];
    v324$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v323$2), v1$2), 4bv32), 2bv32)];
    v325$1 := $$posIdx_E$1[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v325$2 := $$posIdx_E$2[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    assume {:do_not_predicate} {:check_id "check_state_210"} {:captureState "check_state_210"} {:sourceloc} {:sourceloc_num 438} true;
    v326$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v325$1), v1$1), 4bv32), 3bv32)];
    v326$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV8_ZEXT32(v325$2), v1$2), 4bv32), 3bv32)];
    havoc v327$1, v327$2;
    $$14$0bv32$1 := v327$1;
    $$14$0bv32$2 := v327$2;
    havoc v328$1, v328$2;
    $$14$1bv32$1 := v328$1;
    $$14$1bv32$2 := v328$2;
    havoc v329$1, v329$2;
    $$14$2bv32$1 := v329$1;
    $$14$2bv32$2 := v329$2;
    v330$1 := $$14$0bv32$1;
    v330$2 := $$14$0bv32$2;
    v331$1 := $$14$1bv32$1;
    v331$2 := $$14$1bv32$2;
    v332$1 := $$14$2bv32$1;
    v332$2 := $$14$2bv32$2;
    call {:sourceloc_num 448} v333$1, v333$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v330$1, v331$1, v332$1, BV32_ADD(v0$1, 56bv32), v330$2, v331$2, v332$2, BV32_ADD(v0$2, 56bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    assume {:do_not_predicate} {:check_id "check_state_211"} {:captureState "check_state_211"} {:sourceloc} {:sourceloc_num 449} true;
    v334$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v326$1), 4bv32), 3bv32)];
    v334$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v326$2), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 450} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), BV32_XOR(BV8_ZEXT32(v334$1), BV32_LSHR(v333$1, 24bv32))[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_212"} {:captureState "check_state_212"} {:sourceloc} {:sourceloc_num 450} true;
    call {:check_id "check_state_212"} {:sourceloc} {:sourceloc_num 450} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), BV32_XOR(BV8_ZEXT32(v334$2), BV32_LSHR(v333$2, 24bv32))[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := BV32_XOR(BV8_ZEXT32(v334$1), BV32_LSHR(v333$1, 24bv32))[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := BV32_XOR(BV8_ZEXT32(v334$2), BV32_LSHR(v333$2, 24bv32))[8:0];
    assume {:do_not_predicate} {:check_id "check_state_213"} {:captureState "check_state_213"} {:sourceloc} {:sourceloc_num 451} true;
    v335$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v324$1), 4bv32), 3bv32)];
    v335$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v324$2), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 452} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), BV32_XOR(BV8_ZEXT32(v335$1), BV32_AND(BV32_LSHR(v333$1, 16bv32), 255bv32))[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_214"} {:captureState "check_state_214"} {:sourceloc} {:sourceloc_num 452} true;
    call {:check_id "check_state_214"} {:sourceloc} {:sourceloc_num 452} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), BV32_XOR(BV8_ZEXT32(v335$2), BV32_AND(BV32_LSHR(v333$2, 16bv32), 255bv32))[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := BV32_XOR(BV8_ZEXT32(v335$1), BV32_AND(BV32_LSHR(v333$1, 16bv32), 255bv32))[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := BV32_XOR(BV8_ZEXT32(v335$2), BV32_AND(BV32_LSHR(v333$2, 16bv32), 255bv32))[8:0];
    assume {:do_not_predicate} {:check_id "check_state_215"} {:captureState "check_state_215"} {:sourceloc} {:sourceloc_num 453} true;
    v336$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v322$1), 4bv32), 3bv32)];
    v336$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v322$2), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 454} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), BV32_XOR(BV8_ZEXT32(v336$1), BV32_AND(BV32_LSHR(v333$1, 8bv32), 255bv32))[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_216"} {:captureState "check_state_216"} {:sourceloc} {:sourceloc_num 454} true;
    call {:check_id "check_state_216"} {:sourceloc} {:sourceloc_num 454} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), BV32_XOR(BV8_ZEXT32(v336$2), BV32_AND(BV32_LSHR(v333$2, 8bv32), 255bv32))[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := BV32_XOR(BV8_ZEXT32(v336$1), BV32_AND(BV32_LSHR(v333$1, 8bv32), 255bv32))[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := BV32_XOR(BV8_ZEXT32(v336$2), BV32_AND(BV32_LSHR(v333$2, 8bv32), 255bv32))[8:0];
    assume {:do_not_predicate} {:check_id "check_state_217"} {:captureState "check_state_217"} {:sourceloc} {:sourceloc_num 455} true;
    v337$1 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV8_ZEXT32(v320$1), 4bv32), 3bv32)];
    v337$2 := $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV8_ZEXT32(v320$2), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 456} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), BV32_XOR(BV8_ZEXT32(v337$1), BV32_AND(v333$1, 255bv32))[8:0], $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_218"} {:captureState "check_state_218"} {:sourceloc} {:sourceloc_num 456} true;
    call {:check_id "check_state_218"} {:sourceloc} {:sourceloc_num 456} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), BV32_XOR(BV8_ZEXT32(v337$2), BV32_AND(v333$2, 255bv32))[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := BV32_XOR(BV8_ZEXT32(v337$1), BV32_AND(v333$1, 255bv32))[8:0];
    $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := BV32_XOR(BV8_ZEXT32(v337$2), BV32_AND(v333$2, 255bv32))[8:0];
    goto __partitioned_block_$falsebb_16;

  __partitioned_block_$falsebb_16:
    call {:sourceloc_num 457} $bugle_barrier_duplicated_15(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 458} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$1, 4bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_219"} {:captureState "check_state_219"} {:sourceloc} {:sourceloc_num 458} true;
    call {:check_id "check_state_219"} {:sourceloc} {:sourceloc_num 458} _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_MUL(local_id_x$2, 4bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    v338$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_MUL(local_id_x$1, 4bv32)];
    v338$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 459} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_220"} {:captureState "check_state_220"} {:sourceloc} {:sourceloc_num 459} true;
    call {:check_id "check_state_220"} {:sourceloc} {:sourceloc_num 459} _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    v339$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)];
    v339$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 460} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_221"} {:captureState "check_state_221"} {:sourceloc} {:sourceloc_num 460} true;
    call {:check_id "check_state_221"} {:sourceloc} {:sourceloc_num 460} _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    v340$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)];
    v340$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 461} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_222"} {:captureState "check_state_222"} {:sourceloc} {:sourceloc_num 461} true;
    call {:check_id "check_state_222"} {:sourceloc} {:sourceloc_num 461} _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} true;
    v341$1 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)];
    v341$2 := $$_ZZ13aesEncrypt256PjS_iE11stageBlock2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 462} _LOG_WRITE_$$result(true, BV32_ADD(BV32_MUL(256bv32, group_id_x$1), local_id_x$1), v341$1 ++ v340$1 ++ v339$1 ++ v338$1, $$result[BV32_ADD(BV32_MUL(256bv32, group_id_x$1), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(true, BV32_ADD(BV32_MUL(256bv32, group_id_x$2), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_223"} {:captureState "check_state_223"} {:sourceloc} {:sourceloc_num 462} true;
    call {:check_id "check_state_223"} {:sourceloc} {:sourceloc_num 462} _CHECK_WRITE_$$result(true, BV32_ADD(BV32_MUL(256bv32, group_id_x$2), local_id_x$2), v341$2 ++ v340$2 ++ v339$2 ++ v338$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$result"} true;
    $$result[BV32_ADD(BV32_MUL(256bv32, group_id_x$1), local_id_x$1)] := v341$1 ++ v340$1 ++ v339$1 ++ v338$1;
    $$result[BV32_ADD(BV32_MUL(256bv32, group_id_x$2), local_id_x$2)] := v341$2 ++ v340$2 ++ v339$2 ++ v338$2;
    return;

  $truebb:
    assume {:partition} v3 && v3;
    v4$1 := $$TBox0$1[BV32_ADD(local_id_x$1, $cnt.0)];
    v4$2 := $$TBox0$2[BV32_ADD(local_id_x$2, $cnt.0)];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(true, BV32_ADD(local_id_x$1, $cnt.0), v4$1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(true, BV32_ADD(local_id_x$2, $cnt.0));
    assume {:do_not_predicate} {:check_id "check_state_224"} {:captureState "check_state_224"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_224"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(true, BV32_ADD(local_id_x$2, $cnt.0), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)] := v4$1;
    $$_ZZ13aesEncrypt256PjS_iE10tBox0Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $cnt.0)] := v4$2;
    v5$1 := $$TBox1$1[BV32_ADD(local_id_x$1, $cnt.0)];
    v5$2 := $$TBox1$2[BV32_ADD(local_id_x$2, $cnt.0)];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), v5$1[8:0], $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_225"} {:captureState "check_state_225"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_225"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), v5$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32)] := v5$1[8:0];
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32)] := v5$2[8:0];
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 1bv32), v5$1[16:8], $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_226"} {:captureState "check_state_226"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_226"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 1bv32), v5$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 1bv32)] := v5$1[16:8];
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 1bv32)] := v5$2[16:8];
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 2bv32), v5$1[24:16], $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_227"} {:captureState "check_state_227"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_227"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 2bv32), v5$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 2bv32)] := v5$1[24:16];
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 2bv32)] := v5$2[24:16];
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 3bv32), v5$1[32:24], $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_228"} {:captureState "check_state_228"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_228"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 3bv32), v5$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, $cnt.0), 4bv32), 3bv32)] := v5$1[32:24];
    $$_ZZ13aesEncrypt256PjS_iE10tBox1Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, $cnt.0), 4bv32), 3bv32)] := v5$2[32:24];
    v6$1 := $$TBox2$1[BV32_ADD(local_id_x$1, $cnt.0)];
    v6$2 := $$TBox2$2[BV32_ADD(local_id_x$2, $cnt.0)];
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(true, BV32_ADD(local_id_x$1, $cnt.0), v6$1, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(true, BV32_ADD(local_id_x$2, $cnt.0));
    assume {:do_not_predicate} {:check_id "check_state_229"} {:captureState "check_state_229"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_229"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(true, BV32_ADD(local_id_x$2, $cnt.0), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)] := v6$1;
    $$_ZZ13aesEncrypt256PjS_iE10tBox2Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $cnt.0)] := v6$2;
    v7$1 := $$TBox3$1[BV32_ADD(local_id_x$1, $cnt.0)];
    v7$2 := $$TBox3$2[BV32_ADD(local_id_x$2, $cnt.0)];
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(true, BV32_ADD(local_id_x$1, $cnt.0), v7$1, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(true, BV32_ADD(local_id_x$2, $cnt.0));
    assume {:do_not_predicate} {:check_id "check_state_230"} {:captureState "check_state_230"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_230"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(true, BV32_ADD(local_id_x$2, $cnt.0), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} true;
    $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[1bv1][BV32_ADD(local_id_x$1, $cnt.0)] := v7$1;
    $$_ZZ13aesEncrypt256PjS_iE10tBox3Block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $cnt.0)] := v7$2;
    $cnt.0 := BV32_ADD($cnt.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



procedure {:source_name "_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi($0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_5($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_6($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_7($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_8($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_9($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_10($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_11($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_12($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_13($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_14($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_15($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13aesEncrypt256PjS_iE11stageBlock1, $$_ZZ13aesEncrypt256PjS_iE10tBox0Block, $$_ZZ13aesEncrypt256PjS_iE10tBox1Block, $$_ZZ13aesEncrypt256PjS_iE10tBox2Block, $$_ZZ13aesEncrypt256PjS_iE10tBox3Block, $$_ZZ13aesEncrypt256PjS_iE11stageBlock2, $$result, _TRACKING;



var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$3$2bv32$1: bv32;

var $$3$2bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$11$2bv32$1: bv32;

var $$11$2bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$13$2bv32$1: bv32;

var $$13$2bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$14$2bv32$1: bv32;

var $$14$2bv32$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$result: bv32;

procedure {:inline 1} _LOG_READ_$$result(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$result;



implementation {:inline 1} _LOG_READ_$$result(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then true else _READ_HAS_OCCURRED_$$result);
    return;
}



procedure _CHECK_READ_$$result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$result);
  requires {:source_name "result"} {:array "$$result"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$result: bool;

procedure {:inline 1} _LOG_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$result, _WRITE_READ_BENIGN_FLAG_$$result;



implementation {:inline 1} _LOG_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then true else _WRITE_HAS_OCCURRED_$$result);
    _WRITE_READ_BENIGN_FLAG_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$result);
    return;
}



procedure _CHECK_WRITE_$$result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result != _value);
  requires {:source_name "result"} {:array "$$result"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$result != _value);
  requires {:source_name "result"} {:array "$$result"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$result(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$result;



implementation {:inline 1} _LOG_ATOMIC_$$result(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$result);
    return;
}



procedure _CHECK_ATOMIC_$$result(_P: bool, _offset: bv32);
  requires {:source_name "result"} {:array "$$result"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);
  requires {:source_name "result"} {:array "$$result"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$result;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$result(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$result := (if _P && _WRITE_HAS_OCCURRED_$$result && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$result);
    return;
}



const _WATCHED_VALUE_$$inData: bv32;

procedure {:inline 1} _LOG_READ_$$inData(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$inData;



implementation {:inline 1} _LOG_READ_$$inData(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inData == _value then true else _READ_HAS_OCCURRED_$$inData);
    return;
}



procedure _CHECK_READ_$$inData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inData);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inData: bool;

procedure {:inline 1} _LOG_WRITE_$$inData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$inData, _WRITE_READ_BENIGN_FLAG_$$inData;



implementation {:inline 1} _LOG_WRITE_$$inData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inData == _value then true else _WRITE_HAS_OCCURRED_$$inData);
    _WRITE_READ_BENIGN_FLAG_$$inData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inData == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inData);
    return;
}



procedure _CHECK_WRITE_$$inData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inData != _value);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inData != _value);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$inData(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inData;



implementation {:inline 1} _LOG_ATOMIC_$$inData(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inData);
    return;
}



procedure _CHECK_ATOMIC_$$inData(_P: bool, _offset: bv32);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset);
  requires {:source_name "inData"} {:array "$$inData"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inData(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inData;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inData(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inData := (if _P && _WRITE_HAS_OCCURRED_$$inData && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inData);
    return;
}



const _WATCHED_VALUE_$$texEKey: bv32;

procedure {:inline 1} _LOG_READ_$$texEKey(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$texEKey;



implementation {:inline 1} _LOG_READ_$$texEKey(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$texEKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texEKey == _value then true else _READ_HAS_OCCURRED_$$texEKey);
    return;
}



procedure _CHECK_READ_$$texEKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$texEKey);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$texEKey: bool;

procedure {:inline 1} _LOG_WRITE_$$texEKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$texEKey, _WRITE_READ_BENIGN_FLAG_$$texEKey;



implementation {:inline 1} _LOG_WRITE_$$texEKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$texEKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texEKey == _value then true else _WRITE_HAS_OCCURRED_$$texEKey);
    _WRITE_READ_BENIGN_FLAG_$$texEKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texEKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$texEKey);
    return;
}



procedure _CHECK_WRITE_$$texEKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texEKey != _value);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texEKey != _value);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$texEKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$texEKey;



implementation {:inline 1} _LOG_ATOMIC_$$texEKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$texEKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$texEKey);
    return;
}



procedure _CHECK_ATOMIC_$$texEKey(_P: bool, _offset: bv32);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "texEKey"} {:array "$$texEKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texEKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$texEKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texEKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$texEKey := (if _P && _WRITE_HAS_OCCURRED_$$texEKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$texEKey);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1: bv8;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock1"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox0Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox0Block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block: bv8;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox1Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox1Block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox2Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox2Block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tBox3Block"} {:array "$$_ZZ13aesEncrypt256PjS_iE10tBox3Block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block);
    return;
}



const _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2: bv8;

procedure {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;



implementation {:inline 1} _LOG_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 == _value then true else _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2);
    return;
}



procedure _CHECK_READ_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2, _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "stageBlock2"} {:array "$$_ZZ13aesEncrypt256PjS_iE11stageBlock2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_5($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_6($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_7($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_8($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_9($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_10($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_11($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_12($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_13($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_14($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_15($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon2;

  anon2:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon3;

  anon3:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon4;

  anon4:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon5;

  anon5:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon6;

  anon6:
    goto anon18_Then, anon18_Else;

  anon18_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon13;

  anon13:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$result;
    goto anon14;

  anon14:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon16;

  anon16:
    havoc _TRACKING;
    return;

  anon19_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$result;
    goto anon16;

  anon18_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock1;
    goto anon8;

  anon8:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox0Block;
    goto anon9;

  anon9:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox1Block;
    goto anon10;

  anon10:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox2Block;
    goto anon11;

  anon11:
    havoc $$_ZZ13aesEncrypt256PjS_iE10tBox3Block;
    goto anon12;

  anon12:
    havoc $$_ZZ13aesEncrypt256PjS_iE11stageBlock2;
    goto anon13;

  anon17_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b4: bool;
