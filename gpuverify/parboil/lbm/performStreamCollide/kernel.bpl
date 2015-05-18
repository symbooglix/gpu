type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "srcGrid"} {:global} $$srcGrid: [bv32]bv32;

axiom {:array_info "$$srcGrid"} {:global} {:elem_width 32} {:source_name "srcGrid"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$srcGrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$srcGrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$srcGrid: bool;

var {:source_name "dstGrid"} {:global} $$dstGrid: [bv32]bv32;

axiom {:array_info "$$dstGrid"} {:global} {:elem_width 32} {:source_name "dstGrid"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dstGrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dstGrid: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dstGrid: bool;

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

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "performStreamCollide_kernel"} {:kernel} $performStreamCollide_kernel();
  requires !_READ_HAS_OCCURRED_$$srcGrid && !_WRITE_HAS_OCCURRED_$$srcGrid && !_ATOMIC_HAS_OCCURRED_$$srcGrid;
  requires !_READ_HAS_OCCURRED_$$dstGrid && !_WRITE_HAS_OCCURRED_$$dstGrid && !_ATOMIC_HAS_OCCURRED_$$dstGrid;
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
  modifies _WRITE_HAS_OCCURRED_$$dstGrid, _WRITE_READ_BENIGN_FLAG_$$dstGrid, _WRITE_READ_BENIGN_FLAG_$$dstGrid;



implementation {:source_name "performStreamCollide_kernel"} {:kernel} $performStreamCollide_kernel()
{
  var $tempWT.0$1: bv32;
  var $tempWT.0$2: bv32;
  var $tempEB.0$1: bv32;
  var $tempEB.0$2: bv32;
  var $tempET.0$1: bv32;
  var $tempET.0$2: bv32;
  var $tempSB.0$1: bv32;
  var $tempSB.0$2: bv32;
  var $tempST.0$1: bv32;
  var $tempST.0$2: bv32;
  var $tempNB.0$1: bv32;
  var $tempNB.0$2: bv32;
  var $tempNT.0$1: bv32;
  var $tempNT.0$2: bv32;
  var $tempSW.0$1: bv32;
  var $tempSW.0$2: bv32;
  var $tempSE.0$1: bv32;
  var $tempSE.0$2: bv32;
  var $tempNW.0$1: bv32;
  var $tempNW.0$2: bv32;
  var $tempNE.0$1: bv32;
  var $tempNE.0$2: bv32;
  var $tempB.0$1: bv32;
  var $tempB.0$2: bv32;
  var $tempT.0$1: bv32;
  var $tempT.0$2: bv32;
  var $tempW.0$1: bv32;
  var $tempW.0$2: bv32;
  var $tempE.0$1: bv32;
  var $tempE.0$2: bv32;
  var $tempS.0$1: bv32;
  var $tempS.0$2: bv32;
  var $tempN.0$1: bv32;
  var $tempN.0$2: bv32;
  var $tempC.0$1: bv32;
  var $tempC.0$2: bv32;
  var $tempWB.0$1: bv32;
  var $tempWB.0$2: bv32;
  var $ux.0$1: bv32;
  var $ux.0$2: bv32;
  var $uy.0$1: bv32;
  var $uy.0$2: bv32;
  var $uz.0$1: bv32;
  var $uz.0$2: bv32;
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
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := group_id_x$1;
    v1$2 := group_id_x$2;
    v2$1 := group_id_y$1;
    v2$2 := group_id_y$2;
    v3$1 := $$srcGrid[BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))))];
    v3$2 := $$srcGrid[BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))))];
    v4$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(4294967295bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614401bv32)];
    v4$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(4294967295bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614401bv32)];
    v5$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(1bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614402bv32)];
    v5$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(1bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614402bv32)];
    v6$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614403bv32)];
    v6$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614403bv32)];
    v7$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614404bv32)];
    v7$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614404bv32)];
    v8$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$1), 128bv32), 120bv32))), 614405bv32)];
    v8$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$2), 128bv32), 120bv32))), 614405bv32)];
    v9$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$1), 128bv32), 120bv32))), 614406bv32)];
    v9$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$2), 128bv32), 120bv32))), 614406bv32)];
    v10$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$1), BV32_MUL(BV32_ADD(4294967295bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614407bv32)];
    v10$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$2), BV32_MUL(BV32_ADD(4294967295bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614407bv32)];
    v11$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$1), BV32_MUL(BV32_ADD(4294967295bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614408bv32)];
    v11$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$2), BV32_MUL(BV32_ADD(4294967295bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614408bv32)];
    v12$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$1), BV32_MUL(BV32_ADD(1bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614409bv32)];
    v12$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$2), BV32_MUL(BV32_ADD(1bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614409bv32)];
    v13$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$1), BV32_MUL(BV32_ADD(1bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614410bv32)];
    v13$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$2), BV32_MUL(BV32_ADD(1bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614410bv32)];
    v14$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(4294967295bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$1), 128bv32), 120bv32))), 614411bv32)];
    v14$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(4294967295bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$2), 128bv32), 120bv32))), 614411bv32)];
    v15$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(4294967295bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$1), 128bv32), 120bv32))), 614412bv32)];
    v15$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(4294967295bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$2), 128bv32), 120bv32))), 614412bv32)];
    v16$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(1bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$1), 128bv32), 120bv32))), 614413bv32)];
    v16$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(1bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$2), 128bv32), 120bv32))), 614413bv32)];
    v17$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(1bv32, v1$1), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$1), 128bv32), 120bv32))), 614414bv32)];
    v17$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(1bv32, v1$2), 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$2), 128bv32), 120bv32))), 614414bv32)];
    v18$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$1), 128bv32), 120bv32))), 614415bv32)];
    v18$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$2), 128bv32), 120bv32))), 614415bv32)];
    v19$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$1), 128bv32), 120bv32))), 614416bv32)];
    v19$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(4294967295bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$2), 128bv32), 120bv32))), 614416bv32)];
    v20$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$1), 128bv32), 120bv32))), 614417bv32)];
    v20$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(4294967295bv32, v2$2), 128bv32), 120bv32))), 614417bv32)];
    v21$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$1), BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$1), 128bv32), 120bv32))), 614418bv32)];
    v21$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(BV32_ADD(1bv32, v0$2), BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(BV32_ADD(1bv32, v2$2), 128bv32), 120bv32))), 614418bv32)];
    v22$1 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614419bv32)];
    v22$2 := $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614419bv32)];
    v23$1 := BV32_AND(v22$1, 1bv32) != 0bv32;
    v23$2 := BV32_AND(v22$2, 1bv32) != 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v23$1 then v23$1 else p0$1);
    p0$2 := (if v23$2 then v23$2 else p0$2);
    p1$1 := (if !v23$1 then !v23$1 else p1$1);
    p1$2 := (if !v23$2 then !v23$2 else p1$2);
    $tempWT.0$1, $tempEB.0$1, $tempET.0$1, $tempSB.0$1, $tempST.0$1, $tempNB.0$1, $tempNT.0$1, $tempSW.0$1, $tempSE.0$1, $tempNW.0$1, $tempNE.0$1, $tempB.0$1, $tempT.0$1, $tempW.0$1, $tempE.0$1, $tempS.0$1, $tempN.0$1, $tempC.0$1, $tempWB.0$1 := (if p0$1 then v19$1 else $tempWT.0$1), (if p0$1 then v20$1 else $tempEB.0$1), (if p0$1 then v21$1 else $tempET.0$1), (if p0$1 then v14$1 else $tempSB.0$1), (if p0$1 then v15$1 else $tempST.0$1), (if p0$1 then v16$1 else $tempNB.0$1), (if p0$1 then v17$1 else $tempNT.0$1), (if p0$1 then v10$1 else $tempSW.0$1), (if p0$1 then v11$1 else $tempSE.0$1), (if p0$1 then v12$1 else $tempNW.0$1), (if p0$1 then v13$1 else $tempNE.0$1), (if p0$1 then v8$1 else $tempB.0$1), (if p0$1 then v9$1 else $tempT.0$1), (if p0$1 then v6$1 else $tempW.0$1), (if p0$1 then v7$1 else $tempE.0$1), (if p0$1 then v4$1 else $tempS.0$1), (if p0$1 then v5$1 else $tempN.0$1), (if p0$1 then v3$1 else $tempC.0$1), (if p0$1 then v18$1 else $tempWB.0$1);
    $tempWT.0$2, $tempEB.0$2, $tempET.0$2, $tempSB.0$2, $tempST.0$2, $tempNB.0$2, $tempNT.0$2, $tempSW.0$2, $tempSE.0$2, $tempNW.0$2, $tempNE.0$2, $tempB.0$2, $tempT.0$2, $tempW.0$2, $tempE.0$2, $tempS.0$2, $tempN.0$2, $tempC.0$2, $tempWB.0$2 := (if p0$2 then v19$2 else $tempWT.0$2), (if p0$2 then v20$2 else $tempEB.0$2), (if p0$2 then v21$2 else $tempET.0$2), (if p0$2 then v14$2 else $tempSB.0$2), (if p0$2 then v15$2 else $tempST.0$2), (if p0$2 then v16$2 else $tempNB.0$2), (if p0$2 then v17$2 else $tempNT.0$2), (if p0$2 then v10$2 else $tempSW.0$2), (if p0$2 then v11$2 else $tempSE.0$2), (if p0$2 then v12$2 else $tempNW.0$2), (if p0$2 then v13$2 else $tempNE.0$2), (if p0$2 then v8$2 else $tempB.0$2), (if p0$2 then v9$2 else $tempT.0$2), (if p0$2 then v6$2 else $tempW.0$2), (if p0$2 then v7$2 else $tempE.0$2), (if p0$2 then v4$2 else $tempS.0$2), (if p0$2 then v5$2 else $tempN.0$2), (if p0$2 then v3$2 else $tempC.0$2), (if p0$2 then v18$2 else $tempWB.0$2);
    v24$1 := (if p1$1 then FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v3$1, v4$1), v5$1), v6$1), v7$1), v8$1), v9$1), v10$1), v11$1), v12$1), v13$1), v14$1), v15$1), v16$1), v17$1), v18$1), v19$1), v20$1), v21$1) else v24$1);
    v24$2 := (if p1$2 then FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v3$2, v4$2), v5$2), v6$2), v7$2), v8$2), v9$2), v10$2), v11$2), v12$2), v13$2), v14$2), v15$2), v16$2), v17$2), v18$2), v19$2), v20$2), v21$2) else v24$2);
    v25$1 := (if p1$1 then $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614419bv32)] else v25$1);
    v25$2 := (if p1$2 then $$srcGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614419bv32)] else v25$2);
    v26$1 := (if p1$1 then BV32_AND(v25$1, 2bv32) != 0bv32 else v26$1);
    v26$2 := (if p1$2 then BV32_AND(v25$2, 2bv32) != 0bv32 else v26$2);
    p2$1 := (if p1$1 && v26$1 then v26$1 else p2$1);
    p2$2 := (if p1$2 && v26$2 then v26$2 else p2$2);
    p3$1 := (if p1$1 && !v26$1 then !v26$1 else p3$1);
    p3$2 := (if p1$2 && !v26$2 then !v26$2 else p3$2);
    $ux.0$1, $uy.0$1, $uz.0$1 := (if p2$1 then 1000593162bv32 else $ux.0$1), (if p2$1 then 990057071bv32 else $uy.0$1), (if p2$1 then 0bv32 else $uz.0$1);
    $ux.0$2, $uy.0$2, $uz.0$2 := (if p2$2 then 1000593162bv32 else $ux.0$2), (if p2$2 then 990057071bv32 else $uy.0$2), (if p2$2 then 0bv32 else $uz.0$2);
    $ux.0$1, $uy.0$1, $uz.0$1 := (if p3$1 then FDIV32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(v6$1, v7$1), v10$1), v11$1), v12$1), v13$1), v18$1), v19$1), v20$1), v21$1), v24$1) else $ux.0$1), (if p3$1 then FDIV32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(v4$1, v5$1), v10$1), v11$1), v12$1), v13$1), v14$1), v15$1), v16$1), v17$1), v24$1) else $uy.0$1), (if p3$1 then FDIV32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(v8$1, v9$1), v14$1), v15$1), v16$1), v17$1), v18$1), v19$1), v20$1), v21$1), v24$1) else $uz.0$1);
    $ux.0$2, $uy.0$2, $uz.0$2 := (if p3$2 then FDIV32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(v6$2, v7$2), v10$2), v11$2), v12$2), v13$2), v18$2), v19$2), v20$2), v21$2), v24$2) else $ux.0$2), (if p3$2 then FDIV32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(v4$2, v5$2), v10$2), v11$2), v12$2), v13$2), v14$2), v15$2), v16$2), v17$2), v24$2) else $uy.0$2), (if p3$2 then FDIV32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(v8$2, v9$2), v14$2), v15$2), v16$2), v17$2), v18$2), v19$2), v20$2), v21$2), v24$2) else $uz.0$2);
    v27$1 := (if p1$1 then FADD32(FMUL32(1069547520bv32, FADD32(FMUL32($uz.0$1, $uz.0$1), FADD32(FMUL32($ux.0$1, $ux.0$1), FMUL32($uy.0$1, $uy.0$1)))), 3212836864bv32) else v27$1);
    v27$2 := (if p1$2 then FADD32(FMUL32(1069547520bv32, FADD32(FMUL32($uz.0$2, $uz.0$2), FADD32(FMUL32($ux.0$2, $ux.0$2), FMUL32($uy.0$2, $uy.0$2)))), 3212836864bv32) else v27$2);
    v28$1 := (if p1$1 then FMUL32(1073322394bv32, v24$1) else v28$1);
    v28$2 := (if p1$2 then FMUL32(1073322394bv32, v24$2) else v28$2);
    v29$1 := (if p1$1 then FMUL32(1029934649bv32, v28$1) else v29$1);
    v29$2 := (if p1$2 then FMUL32(1029934649bv32, v28$2) else v29$2);
    v30$1 := (if p1$1 then FMUL32(1021546041bv32, v28$1) else v30$1);
    v30$2 := (if p1$2 then FMUL32(1021546041bv32, v28$2) else v30$2);
    $tempWT.0$1, $tempEB.0$1, $tempET.0$1, $tempSB.0$1, $tempST.0$1, $tempNB.0$1, $tempNT.0$1, $tempSW.0$1, $tempSE.0$1, $tempNW.0$1, $tempNE.0$1, $tempB.0$1, $tempT.0$1, $tempW.0$1, $tempE.0$1, $tempS.0$1, $tempN.0$1, $tempC.0$1, $tempWB.0$1 := (if p1$1 then FADD32(FMUL32(3211998004bv32, v20$1), FMUL32(v30$1, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $ux.0$1), $uz.0$1), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $ux.0$1), $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempWT.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v19$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32($ux.0$1, $uz.0$1), FADD32(FMUL32(1083179008bv32, FSUB32($ux.0$1, $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempEB.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v18$1), FMUL32(v30$1, FADD32(FMUL32(FADD32($ux.0$1, $uz.0$1), FADD32(FMUL32(1083179008bv32, FADD32($ux.0$1, $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempET.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v17$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $uy.0$1), $uz.0$1), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $uy.0$1), $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempSB.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v16$1), FMUL32(v30$1, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $uy.0$1), $uz.0$1), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $uy.0$1), $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempST.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v15$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32($uy.0$1, $uz.0$1), FADD32(FMUL32(1083179008bv32, FSUB32($uy.0$1, $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempNB.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v14$1), FMUL32(v30$1, FADD32(FMUL32(FADD32($uy.0$1, $uz.0$1), FADD32(FMUL32(1083179008bv32, FADD32($uy.0$1, $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempNT.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v13$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $ux.0$1), $uy.0$1), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $ux.0$1), $uy.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempSW.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v12$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32($ux.0$1, $uy.0$1), FADD32(FMUL32(1083179008bv32, FSUB32($ux.0$1, $uy.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempSE.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v11$1), FMUL32(v30$1, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $ux.0$1), $uy.0$1), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $ux.0$1), $uy.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempNW.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v10$1), FMUL32(v30$1, FADD32(FMUL32(FADD32($ux.0$1, $uy.0$1), FADD32(FMUL32(1083179008bv32, FADD32($ux.0$1, $uy.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempNE.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v9$1), FMUL32(v29$1, FADD32(FMUL32($uz.0$1, FADD32(FMUL32(1083179008bv32, $uz.0$1), 3225419776bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempB.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v8$1), FMUL32(v29$1, FADD32(FMUL32($uz.0$1, FADD32(FMUL32(1083179008bv32, $uz.0$1), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempT.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v7$1), FMUL32(v29$1, FADD32(FMUL32($ux.0$1, FADD32(FMUL32(1083179008bv32, $ux.0$1), 3225419776bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempW.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v6$1), FMUL32(v29$1, FADD32(FMUL32($ux.0$1, FADD32(FMUL32(1083179008bv32, $ux.0$1), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempE.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v5$1), FMUL32(v29$1, FADD32(FMUL32($uy.0$1, FADD32(FMUL32(1083179008bv32, $uy.0$1), 3225419776bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempS.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v4$1), FMUL32(v29$1, FADD32(FMUL32($uy.0$1, FADD32(FMUL32(1083179008bv32, $uy.0$1), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempN.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v3$1), FMUL32(FMUL32(1051372203bv32, v28$1), FSUB32(2147483648bv32, v27$1))) else $tempC.0$1), (if p1$1 then FADD32(FMUL32(3211998004bv32, v21$1), FMUL32(v30$1, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $ux.0$1), $uz.0$1), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $ux.0$1), $uz.0$1)), 1077936128bv32)), FSUB32(2147483648bv32, v27$1)))) else $tempWB.0$1);
    $tempWT.0$2, $tempEB.0$2, $tempET.0$2, $tempSB.0$2, $tempST.0$2, $tempNB.0$2, $tempNT.0$2, $tempSW.0$2, $tempSE.0$2, $tempNW.0$2, $tempNE.0$2, $tempB.0$2, $tempT.0$2, $tempW.0$2, $tempE.0$2, $tempS.0$2, $tempN.0$2, $tempC.0$2, $tempWB.0$2 := (if p1$2 then FADD32(FMUL32(3211998004bv32, v20$2), FMUL32(v30$2, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $ux.0$2), $uz.0$2), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $ux.0$2), $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempWT.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v19$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32($ux.0$2, $uz.0$2), FADD32(FMUL32(1083179008bv32, FSUB32($ux.0$2, $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempEB.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v18$2), FMUL32(v30$2, FADD32(FMUL32(FADD32($ux.0$2, $uz.0$2), FADD32(FMUL32(1083179008bv32, FADD32($ux.0$2, $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempET.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v17$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $uy.0$2), $uz.0$2), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $uy.0$2), $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempSB.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v16$2), FMUL32(v30$2, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $uy.0$2), $uz.0$2), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $uy.0$2), $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempST.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v15$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32($uy.0$2, $uz.0$2), FADD32(FMUL32(1083179008bv32, FSUB32($uy.0$2, $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempNB.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v14$2), FMUL32(v30$2, FADD32(FMUL32(FADD32($uy.0$2, $uz.0$2), FADD32(FMUL32(1083179008bv32, FADD32($uy.0$2, $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempNT.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v13$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $ux.0$2), $uy.0$2), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $ux.0$2), $uy.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempSW.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v12$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32($ux.0$2, $uy.0$2), FADD32(FMUL32(1083179008bv32, FSUB32($ux.0$2, $uy.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempSE.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v11$2), FMUL32(v30$2, FADD32(FMUL32(FADD32(FSUB32(2147483648bv32, $ux.0$2), $uy.0$2), FADD32(FMUL32(1083179008bv32, FADD32(FSUB32(2147483648bv32, $ux.0$2), $uy.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempNW.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v10$2), FMUL32(v30$2, FADD32(FMUL32(FADD32($ux.0$2, $uy.0$2), FADD32(FMUL32(1083179008bv32, FADD32($ux.0$2, $uy.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempNE.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v9$2), FMUL32(v29$2, FADD32(FMUL32($uz.0$2, FADD32(FMUL32(1083179008bv32, $uz.0$2), 3225419776bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempB.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v8$2), FMUL32(v29$2, FADD32(FMUL32($uz.0$2, FADD32(FMUL32(1083179008bv32, $uz.0$2), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempT.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v7$2), FMUL32(v29$2, FADD32(FMUL32($ux.0$2, FADD32(FMUL32(1083179008bv32, $ux.0$2), 3225419776bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempW.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v6$2), FMUL32(v29$2, FADD32(FMUL32($ux.0$2, FADD32(FMUL32(1083179008bv32, $ux.0$2), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempE.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v5$2), FMUL32(v29$2, FADD32(FMUL32($uy.0$2, FADD32(FMUL32(1083179008bv32, $uy.0$2), 3225419776bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempS.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v4$2), FMUL32(v29$2, FADD32(FMUL32($uy.0$2, FADD32(FMUL32(1083179008bv32, $uy.0$2), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempN.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v3$2), FMUL32(FMUL32(1051372203bv32, v28$2), FSUB32(2147483648bv32, v27$2))) else $tempC.0$2), (if p1$2 then FADD32(FMUL32(3211998004bv32, v21$2), FMUL32(v30$2, FADD32(FMUL32(FSUB32(FSUB32(2147483648bv32, $ux.0$2), $uz.0$2), FADD32(FMUL32(1083179008bv32, FSUB32(FSUB32(2147483648bv32, $ux.0$2), $uz.0$2)), 1077936128bv32)), FSUB32(2147483648bv32, v27$2)))) else $tempWB.0$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$dstGrid(true, BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32)))), $tempC.0$1, $$dstGrid[BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32)))));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32)))), $tempC.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))))] := $tempC.0$1;
    $$dstGrid[BV32_ADD(614400bv32, BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))))] := $tempC.0$2;
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614401bv32), $tempN.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614401bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614401bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614401bv32), $tempN.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614401bv32)] := $tempN.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614401bv32)] := $tempN.0$2;
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614402bv32), $tempS.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614402bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614402bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614402bv32), $tempS.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614402bv32)] := $tempS.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614402bv32)] := $tempS.0$2;
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614403bv32), $tempE.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614403bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614403bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614403bv32), $tempE.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614403bv32)] := $tempE.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614403bv32)] := $tempE.0$2;
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614404bv32), $tempW.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614404bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614404bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614404bv32), $tempW.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614404bv32)] := $tempW.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614404bv32)] := $tempW.0$2;
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614405bv32), $tempT.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614405bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614405bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614405bv32), $tempT.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614405bv32)] := $tempT.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614405bv32)] := $tempT.0$2;
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614406bv32), $tempB.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614406bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614406bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614406bv32), $tempB.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614406bv32)] := $tempB.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614406bv32)] := $tempB.0$2;
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614407bv32), $tempNE.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614407bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614407bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614407bv32), $tempNE.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614407bv32)] := $tempNE.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614407bv32)] := $tempNE.0$2;
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614408bv32), $tempNW.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614408bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614408bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614408bv32), $tempNW.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614408bv32)] := $tempNW.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614408bv32)] := $tempNW.0$2;
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614409bv32), $tempSE.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614409bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614409bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614409bv32), $tempSE.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614409bv32)] := $tempSE.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614409bv32)] := $tempSE.0$2;
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614410bv32), $tempSW.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614410bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614410bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614410bv32), $tempSW.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614410bv32)] := $tempSW.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614410bv32)] := $tempSW.0$2;
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614411bv32), $tempNT.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614411bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614411bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614411bv32), $tempNT.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614411bv32)] := $tempNT.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614411bv32)] := $tempNT.0$2;
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614412bv32), $tempNB.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614412bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614412bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614412bv32), $tempNB.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614412bv32)] := $tempNB.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614412bv32)] := $tempNB.0$2;
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614413bv32), $tempST.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614413bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614413bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614413bv32), $tempST.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614413bv32)] := $tempST.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614413bv32)] := $tempST.0$2;
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614414bv32), $tempSB.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614414bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614414bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614414bv32), $tempSB.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614414bv32)] := $tempSB.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614414bv32)] := $tempSB.0$2;
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614415bv32), $tempET.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614415bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614415bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614415bv32), $tempET.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614415bv32)] := $tempET.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614415bv32)] := $tempET.0$2;
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614416bv32), $tempEB.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614416bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614416bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614416bv32), $tempEB.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614416bv32)] := $tempEB.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614416bv32)] := $tempEB.0$2;
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614417bv32), $tempWT.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614417bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614417bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614417bv32), $tempWT.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614417bv32)] := $tempWT.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614417bv32)] := $tempWT.0$2;
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614418bv32), $tempWB.0$1, $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614418bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614418bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$dstGrid(true, BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614418bv32), $tempWB.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dstGrid"} true;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$1, BV32_MUL(v1$1, 128bv32)), BV32_MUL(BV32_MUL(v2$1, 128bv32), 120bv32))), 614418bv32)] := $tempWB.0$1;
    $$dstGrid[BV32_ADD(BV32_MUL(20bv32, BV32_ADD(BV32_ADD(v0$2, BV32_MUL(v1$2, 128bv32)), BV32_MUL(BV32_MUL(v2$2, 128bv32), 120bv32))), 614418bv32)] := $tempWB.0$2;
    return;
}



axiom (if group_size_x == 120bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 120bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 150bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$srcGrid: bv32;

procedure {:inline 1} _LOG_READ_$$srcGrid(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$srcGrid;



implementation {:inline 1} _LOG_READ_$$srcGrid(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$srcGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$srcGrid == _value then true else _READ_HAS_OCCURRED_$$srcGrid);
    return;
}



procedure _CHECK_READ_$$srcGrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$srcGrid);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$srcGrid: bool;

procedure {:inline 1} _LOG_WRITE_$$srcGrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$srcGrid, _WRITE_READ_BENIGN_FLAG_$$srcGrid;



implementation {:inline 1} _LOG_WRITE_$$srcGrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$srcGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$srcGrid == _value then true else _WRITE_HAS_OCCURRED_$$srcGrid);
    _WRITE_READ_BENIGN_FLAG_$$srcGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$srcGrid == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$srcGrid);
    return;
}



procedure _CHECK_WRITE_$$srcGrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$srcGrid != _value);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$srcGrid != _value);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$srcGrid(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$srcGrid;



implementation {:inline 1} _LOG_ATOMIC_$$srcGrid(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$srcGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$srcGrid);
    return;
}



procedure _CHECK_ATOMIC_$$srcGrid(_P: bool, _offset: bv32);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset);
  requires {:source_name "srcGrid"} {:array "$$srcGrid"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$srcGrid(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$srcGrid;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$srcGrid(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$srcGrid := (if _P && _WRITE_HAS_OCCURRED_$$srcGrid && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$srcGrid);
    return;
}



const _WATCHED_VALUE_$$dstGrid: bv32;

procedure {:inline 1} _LOG_READ_$$dstGrid(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dstGrid;



implementation {:inline 1} _LOG_READ_$$dstGrid(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dstGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dstGrid == _value then true else _READ_HAS_OCCURRED_$$dstGrid);
    return;
}



procedure _CHECK_READ_$$dstGrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dstGrid);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dstGrid: bool;

procedure {:inline 1} _LOG_WRITE_$$dstGrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dstGrid, _WRITE_READ_BENIGN_FLAG_$$dstGrid;



implementation {:inline 1} _LOG_WRITE_$$dstGrid(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dstGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dstGrid == _value then true else _WRITE_HAS_OCCURRED_$$dstGrid);
    _WRITE_READ_BENIGN_FLAG_$$dstGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dstGrid == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dstGrid);
    return;
}



procedure _CHECK_WRITE_$$dstGrid(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dstGrid != _value);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dstGrid != _value);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dstGrid(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dstGrid;



implementation {:inline 1} _LOG_ATOMIC_$$dstGrid(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dstGrid := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dstGrid);
    return;
}



procedure _CHECK_ATOMIC_$$dstGrid(_P: bool, _offset: bv32);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset);
  requires {:source_name "dstGrid"} {:array "$$dstGrid"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dstGrid;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dstGrid(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dstGrid := (if _P && _WRITE_HAS_OCCURRED_$$dstGrid && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dstGrid);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
