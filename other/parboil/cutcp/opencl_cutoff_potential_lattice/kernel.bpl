type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$binBaseAddr"} {:global} {:elem_width 32} {:source_name "binBaseAddr"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$binBaseAddr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$binBaseAddr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$binBaseAddr: bool;

var {:source_name "regionZeroAddr"} {:global} $$regionZeroAddr: [bv32]bv32;

axiom {:array_info "$$regionZeroAddr"} {:global} {:elem_width 32} {:source_name "regionZeroAddr"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$regionZeroAddr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$regionZeroAddr: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$regionZeroAddr: bool;

var {:source_name "NbrListLen"} {:constant} $$NbrListLen$1: [bv32]bv32;

var {:source_name "NbrListLen"} {:constant} $$NbrListLen$2: [bv32]bv32;

axiom {:array_info "$$NbrListLen"} {:constant} {:elem_width 32} {:source_name "NbrListLen"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "NbrList"} {:constant} $$NbrList$1: [bv32]bv32;

var {:source_name "NbrList"} {:constant} $$NbrList$2: [bv32]bv32;

axiom {:array_info "$$NbrList"} {:constant} {:elem_width 32} {:source_name "NbrList"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:source_name "myBinIndex"} {:group_shared} $$opencl_cutoff_potential_lattice.myBinIndex: [bv1][bv32]bv32;

axiom {:array_info "$$opencl_cutoff_potential_lattice.myBinIndex"} {:group_shared} {:elem_width 32} {:source_name "myBinIndex"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex: bool;

var {:source_name "AtomBinCache"} {:group_shared} $$opencl_cutoff_potential_lattice.AtomBinCache: [bv1][bv32]bv32;

axiom {:array_info "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:group_shared} {:elem_width 32} {:source_name "AtomBinCache"} {:source_elem_width 32} {:source_dimensions "1024"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache: bool;

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

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FEQ32(bv32, bv32) : bool;

function FFLOOR32(bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_SI32(bv32) : bv32;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function __other_bv32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "opencl_cutoff_potential_lattice"} {:kernel} $opencl_cutoff_potential_lattice($binDim_x: bv32, $binDim_y: bv32, $offset: bv32, $h: bv32, $cutoff2: bv32, $inv_cutoff2: bv32, $zRegionIndex: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $$NbrListLen$1[0bv32] == $$NbrListLen$2[0bv32] then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 0} {:thread 2} (if $$NbrListLen$2[0bv32] == $$NbrListLen$1[0bv32] then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if FEQ32($h, 1056964608bv32) then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$binBaseAddr && !_WRITE_HAS_OCCURRED_$$binBaseAddr && !_ATOMIC_HAS_OCCURRED_$$binBaseAddr;
  requires !_READ_HAS_OCCURRED_$$regionZeroAddr && !_WRITE_HAS_OCCURRED_$$regionZeroAddr && !_ATOMIC_HAS_OCCURRED_$$regionZeroAddr;
  requires !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
  requires !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
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
  modifies $$opencl_cutoff_potential_lattice.myBinIndex, $$opencl_cutoff_potential_lattice.AtomBinCache, _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex, _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex, _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache, $$regionZeroAddr, _TRACKING, _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache, _TRACKING, _WRITE_HAS_OCCURRED_$$regionZeroAddr, _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr, _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr;



implementation {:source_name "opencl_cutoff_potential_lattice"} {:kernel} $opencl_cutoff_potential_lattice($binDim_x: bv32, $binDim_y: bv32, $offset: bv32, $h: bv32, $cutoff2: bv32, $inv_cutoff2: bv32, $zRegionIndex: bv32)
{
  var $nbrid.0$1: bv32;
  var $nbrid.0$2: bv32;
  var $totalbins.0$1: bv32;
  var $totalbins.0$2: bv32;
  var $numbins.0$1: bv32;
  var $numbins.0$2: bv32;
  var $energy.0$1: bv32;
  var $energy.0$2: bv32;
  var $nbrid.1$1: bv32;
  var $nbrid.1$2: bv32;
  var $bincnt.0$1: bv32;
  var $bincnt.0$2: bv32;
  var $0$1: bv1;
  var $0$2: bv1;
  var $numbins.1$1: bv32;
  var $numbins.1$2: bv32;
  var $energy.1$1: bv32;
  var $energy.1$2: bv32;
  var $bincnt.1$1: bv32;
  var $bincnt.1$2: bv32;
  var $energy.2$1: bv32;
  var $energy.2$2: bv32;
  var $i1.0$1: bv32;
  var $i1.0$2: bv32;
  var $energy.3$1: bv32;
  var $energy.3$2: bv32;
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
  var v11$1: bv32;
  var v11$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
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
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
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
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50$1: bv32;
  var v50$2: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bool;
  var v54$2: bool;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bool;
  var v56$2: bool;
  var v57$1: bool;
  var v57$2: bool;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bool;
  var v62$2: bool;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bool;
  var v64$2: bool;
  var v65$1: bv32;
  var v65$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := $$NbrListLen$1[0bv32];
    v0$2 := $$NbrListLen$2[0bv32];
    v1$1 := $$NbrListLen$1[0bv32];
    v1$2 := $$NbrListLen$2[0bv32];
    v2$1 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_z$1, 8bv32), local_id_y$1), 8bv32), local_id_x$1);
    v2$2 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_z$2, 8bv32), local_id_y$2), 8bv32), local_id_x$2);
    v3$1 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($zRegionIndex, num_groups_y), group_id_y$1), BV32_LSHR(num_groups_x, 2bv32)), BV32_LSHR(group_id_x$1, 2bv32)), 512bv32);
    v3$2 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($zRegionIndex, num_groups_y), group_id_y$2), BV32_LSHR(num_groups_x, 2bv32)), BV32_LSHR(group_id_x$2, 2bv32)), 512bv32);
    v4$1 := BV32_MUL(BV32_AND(group_id_x$1, 3bv32), 128bv32);
    v4$2 := BV32_MUL(BV32_AND(group_id_x$2, 3bv32), 128bv32);
    v5$1 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$1, 2bv32)), local_id_x$1)), $h);
    v5$2 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$2, 2bv32)), local_id_x$2)), $h);
    v6$1 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$1), local_id_y$1)), $h);
    v6$2 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$2), local_id_y$2)), $h);
    v7$1 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), BV32_MUL(2bv32, BV32_AND(group_id_x$1, 3bv32))), local_id_z$1)), $h);
    v7$2 := FMUL32(UI32_TO_FP32(BV32_ADD(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), BV32_MUL(2bv32, BV32_AND(group_id_x$2, 3bv32))), local_id_z$2)), $h);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v8$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32];
    v8$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v9$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32];
    v9$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v10$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32];
    v10$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v11$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32];
    v11$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$1, 2bv32)), 4bv32)), $h), 1048576000bv32))), $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$2, 2bv32)), 4bv32)), $h), 1048576000bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$1, 2bv32)), 4bv32)), $h), 1048576000bv32)));
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, BV32_LSHR(group_id_x$2, 2bv32)), 4bv32)), $h), 1048576000bv32)));
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, v9$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] := v9$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] := v9$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, v10$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] := v10$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] := v10$2;
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v11$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] := v11$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] := v11$2;
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v12$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32];
    v12$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v13$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32];
    v13$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v14$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32];
    v14$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v15$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32];
    v15$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32];
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, v12$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] := v12$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := v12$2;
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$1), 4bv32)), $h), 1048576000bv32))), $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$2), 4bv32)), $h), 1048576000bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$1), 4bv32)), $h), 1048576000bv32)));
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, group_id_y$2), 4bv32)), $h), 1048576000bv32)));
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, v14$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] := v14$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] := v14$2;
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v15$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] := v15$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] := v15$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v16$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32];
    v16$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v17$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32];
    v17$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v18$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32];
    v18$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v19$1 := $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32];
    v19$2 := $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32];
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, v16$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 0bv32, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] := v16$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := v16$2;
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, v17$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 1bv32, v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] := v17$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] := v17$2;
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(SI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), 4bv32)), $h), 1048576000bv32))), $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 2bv32, FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(SI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), 4bv32)), $h), 1048576000bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(SI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), 4bv32)), $h), 1048576000bv32)));
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] := FP32_TO_SI32(FFLOOR32(FMUL32(FMUL32(SI32_TO_FP32(BV32_ADD(BV32_MUL(8bv32, $zRegionIndex), 4bv32)), $h), 1048576000bv32)));
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v19$1, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(true, 3bv32, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] := v19$1;
    $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] := v19$2;
    $nbrid.0$1, $totalbins.0$1, $numbins.0$1, $energy.0$1 := BV32_ASHR(v2$1, 4bv32), 0bv32, 32bv32, 0bv32;
    $nbrid.0$2, $totalbins.0$2, $numbins.0$2, $energy.0$2 := BV32_ASHR(v2$2, 4bv32), 0bv32, 32bv32, 0bv32;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 29} p0$1 ==> true;
    v20$1 := (if p0$1 then $$NbrListLen$1[0bv32] else v20$1);
    v20$2 := (if p0$2 then $$NbrListLen$2[0bv32] else v20$2);
    v21$1 := (if p0$1 then BV32_SLT($totalbins.0$1, v20$1) else v21$1);
    v21$2 := (if p0$2 then BV32_SLT($totalbins.0$2, v20$2) else v21$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p8$1 := false;
    p8$2 := false;
    p17$1 := false;
    p17$2 := false;
    p1$1 := (if p0$1 && v21$1 then v21$1 else p1$1);
    p1$2 := (if p0$2 && v21$2 then v21$2 else p1$2);
    p0$1 := (if p0$1 && !v21$1 then v21$1 else p0$1);
    p0$2 := (if p0$2 && !v21$2 then v21$2 else p0$2);
    $nbrid.1$1, $bincnt.0$1 := (if p1$1 then $nbrid.0$1 else $nbrid.1$1), (if p1$1 then 0bv32 else $bincnt.0$1);
    $nbrid.1$2, $bincnt.0$2 := (if p1$2 then $nbrid.0$2 else $nbrid.1$2), (if p1$2 then 0bv32 else $bincnt.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 32} p2$1 ==> true;
    v22$1 := (if p2$1 then BV32_SLT($bincnt.0$1, 4bv32) else v22$1);
    v22$2 := (if p2$2 then BV32_SLT($bincnt.0$2, 4bv32) else v22$2);
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
    p4$1 := (if p2$1 && v22$1 then v22$1 else p4$1);
    p4$2 := (if p2$2 && v22$2 then v22$2 else p4$2);
    p3$1 := (if p2$1 && !v22$1 then !v22$1 else p3$1);
    p3$2 := (if p2$2 && !v22$2 then !v22$2 else p3$2);
    $0$1 := (if p3$1 then 0bv1 else $0$1);
    $0$2 := (if p3$2 then 0bv1 else $0$2);
    v23$1 := (if p4$1 then $$NbrListLen$1[0bv32] else v23$1);
    v23$2 := (if p4$2 then $$NbrListLen$2[0bv32] else v23$2);
    $0$1 := (if p4$1 then (if BV32_SLT($nbrid.1$1, v23$1) then 1bv1 else 0bv1) else $0$1);
    $0$2 := (if p4$2 then (if BV32_SLT($nbrid.1$2, v23$2) then 1bv1 else 0bv1) else $0$2);
    p5$1 := (if p2$1 && $0$1 == 1bv1 then $0$1 == 1bv1 else p5$1);
    p5$2 := (if p2$2 && $0$2 == 1bv1 then $0$2 == 1bv1 else p5$2);
    p2$1 := (if p2$1 && !($0$1 == 1bv1) then $0$1 == 1bv1 else p2$1);
    p2$2 := (if p2$2 && !($0$2 == 1bv1) then $0$2 == 1bv1 else p2$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v24$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] else v24$1);
    v24$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v24$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v25$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] else v25$1);
    v25$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] else v25$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v26$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] else v26$1);
    v26$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] else v26$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v27$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] else v27$1);
    v27$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] else v27$2);
    v28$1 := (if p5$1 then $$NbrList$1[BV32_MUL($nbrid.1$1, 4bv32)] else v28$1);
    v28$2 := (if p5$2 then $$NbrList$2[BV32_MUL($nbrid.1$2, 4bv32)] else v28$2);
    v29$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 1bv32)] else v29$1);
    v29$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 1bv32)] else v29$2);
    v30$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 2bv32)] else v30$1);
    v30$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 2bv32)] else v30$2);
    v31$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 3bv32)] else v31$1);
    v31$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 3bv32)] else v31$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v32$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] else v32$1);
    v32$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v32$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v33$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] else v33$1);
    v33$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] else v33$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 47} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v34$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] else v34$1);
    v34$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] else v34$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v35$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] else v35$1);
    v35$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] else v35$2);
    v36$1 := (if p5$1 then $$NbrList$1[BV32_MUL($nbrid.1$1, 4bv32)] else v36$1);
    v36$2 := (if p5$2 then $$NbrList$2[BV32_MUL($nbrid.1$2, 4bv32)] else v36$2);
    v37$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 1bv32)] else v37$1);
    v37$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 1bv32)] else v37$2);
    v38$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 2bv32)] else v38$1);
    v38$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 2bv32)] else v38$2);
    v39$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 3bv32)] else v39$1);
    v39$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 3bv32)] else v39$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 0bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v40$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][0bv32] else v40$1);
    v40$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v40$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 1bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v41$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][1bv32] else v41$1);
    v41$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] else v41$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 2bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v42$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][2bv32] else v42$1);
    v42$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32] else v42$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$1, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(p5$2, 3bv32, $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex"} true;
    v43$1 := (if p5$1 then $$opencl_cutoff_potential_lattice.myBinIndex[1bv1][3bv32] else v43$1);
    v43$2 := (if p5$2 then $$opencl_cutoff_potential_lattice.myBinIndex[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32] else v43$2);
    v44$1 := (if p5$1 then $$NbrList$1[BV32_MUL($nbrid.1$1, 4bv32)] else v44$1);
    v44$2 := (if p5$2 then $$NbrList$2[BV32_MUL($nbrid.1$2, 4bv32)] else v44$2);
    v45$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 1bv32)] else v45$1);
    v45$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 1bv32)] else v45$2);
    v46$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 2bv32)] else v46$1);
    v46$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 2bv32)] else v46$2);
    v47$1 := (if p5$1 then $$NbrList$1[BV32_ADD(BV32_MUL($nbrid.1$1, 4bv32), 3bv32)] else v47$1);
    v47$2 := (if p5$2 then $$NbrList$2[BV32_ADD(BV32_MUL($nbrid.1$2, 4bv32), 3bv32)] else v47$2);
    v48$1 := (if p5$1 then BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v42$1, v46$1), $binDim_y), BV32_ADD(v33$1, v37$1)), $binDim_x), BV32_ADD(v24$1, v28$1)), 32bv32) else v48$1);
    v48$2 := (if p5$2 then BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v42$2, v46$2), $binDim_y), BV32_ADD(v33$2, v37$2)), $binDim_x), BV32_ADD(v24$2, v28$2)), 32bv32) else v48$2);
    v49$1 := (if p5$1 then BV32_AND(v2$1, 15bv32) else v49$1);
    v49$2 := (if p5$2 then BV32_AND(v2$2, 15bv32) else v49$2);
    v50$1 := (if p5$1 then BV32_ADD(BV32_MUL(32bv32, BV32_ASHR(v2$1, 4bv32)), BV32_MUL(BV32_MUL($bincnt.0$1, 8bv32), 32bv32)) else v50$1);
    v50$2 := (if p5$2 then BV32_ADD(BV32_MUL(32bv32, BV32_ASHR(v2$2, 4bv32)), BV32_MUL(BV32_MUL($bincnt.0$2, 8bv32), 32bv32)) else v50$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v51$1 := (if p5$1 then _HAVOC_bv32$1 else v51$1);
    v51$2 := (if p5$2 then _HAVOC_bv32$2 else v51$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$1, BV32_ADD(v50$1, v49$1), v51$1, $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(v50$1, v49$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$2, BV32_ADD(v50$2, v49$2));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$2, BV32_ADD(v50$2, v49$2), v51$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(v50$1, v49$1)] := (if p5$1 then v51$1 else $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(v50$1, v49$1)]);
    $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v50$2, v49$2)] := (if p5$2 then v51$2 else $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v50$2, v49$2)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v52$1 := (if p5$1 then _HAVOC_bv32$1 else v52$1);
    v52$2 := (if p5$2 then _HAVOC_bv32$2 else v52$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$1, BV32_ADD(BV32_ADD(v50$1, v49$1), 16bv32), v52$1, $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(v50$1, v49$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$2, BV32_ADD(BV32_ADD(v50$2, v49$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(p5$2, BV32_ADD(BV32_ADD(v50$2, v49$2), 16bv32), v52$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(v50$1, v49$1), 16bv32)] := (if p5$1 then v52$1 else $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(v50$1, v49$1), 16bv32)]);
    $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v50$2, v49$2), 16bv32)] := (if p5$2 then v52$2 else $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v50$2, v49$2), 16bv32)]);
    $nbrid.1$1, $bincnt.0$1 := (if p5$1 then BV32_ADD($nbrid.1$1, 8bv32) else $nbrid.1$1), (if p5$1 then BV32_ADD($bincnt.0$1, 1bv32) else $bincnt.0$1);
    $nbrid.1$2, $bincnt.0$2 := (if p5$2 then BV32_ADD($nbrid.1$2, 8bv32) else $nbrid.1$2), (if p5$2 then BV32_ADD($bincnt.0$2, 1bv32) else $bincnt.0$2);
    p2$1 := (if p5$1 then true else p2$1);
    p2$2 := (if p5$2 then true else p2$2);
    goto $3.backedge, __partitioned_block_$3.tail_0;

  __partitioned_block_$3.tail_0:
    assume !p2$1 && !p2$2;
    goto __partitioned_block_$3.tail_1;

  __partitioned_block_$3.tail_1:
    call {:sourceloc_num 67} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    v53$1 := (if p1$1 then $$NbrListLen$1[0bv32] else v53$1);
    v53$2 := (if p1$2 then $$NbrListLen$2[0bv32] else v53$2);
    v54$1 := (if p1$1 then BV32_SGT(BV32_ADD($totalbins.0$1, 32bv32), v53$1) else v54$1);
    v54$2 := (if p1$2 then BV32_SGT(BV32_ADD($totalbins.0$2, 32bv32), v53$2) else v54$2);
    p7$1 := (if p1$1 && v54$1 then v54$1 else p7$1);
    p7$2 := (if p1$2 && v54$2 then v54$2 else p7$2);
    p6$1 := (if p1$1 && !v54$1 then !v54$1 else p6$1);
    p6$2 := (if p1$2 && !v54$2 then !v54$2 else p6$2);
    $numbins.1$1 := (if p6$1 then $numbins.0$1 else $numbins.1$1);
    $numbins.1$2 := (if p6$2 then $numbins.0$2 else $numbins.1$2);
    v55$1 := (if p7$1 then $$NbrListLen$1[0bv32] else v55$1);
    v55$2 := (if p7$2 then $$NbrListLen$2[0bv32] else v55$2);
    $numbins.1$1 := (if p7$1 then BV32_SUB(v55$1, $totalbins.0$1) else $numbins.1$1);
    $numbins.1$2 := (if p7$2 then BV32_SUB(v55$2, $totalbins.0$2) else $numbins.1$2);
    $energy.1$1, $bincnt.1$1 := (if p1$1 then $energy.0$1 else $energy.1$1), (if p1$1 then 0bv32 else $bincnt.1$1);
    $energy.1$2, $bincnt.1$2 := (if p1$2 then $energy.0$2 else $energy.1$2), (if p1$2 then 0bv32 else $bincnt.1$2);
    p8$1 := (if p1$1 then true else p8$1);
    p8$2 := (if p1$2 then true else p8$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p8$1 ==> p0$1;
    assert p8$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 72} p8$1 ==> true;
    v56$1 := (if p8$1 then BV32_SLT($bincnt.1$1, $numbins.1$1) else v56$1);
    v56$2 := (if p8$2 then BV32_SLT($bincnt.1$2, $numbins.1$2) else v56$2);
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p9$1 := (if p8$1 && v56$1 then v56$1 else p9$1);
    p9$2 := (if p8$2 && v56$2 then v56$2 else p9$2);
    p8$1 := (if p8$1 && !v56$1 then v56$1 else p8$1);
    p8$2 := (if p8$2 && !v56$2 then v56$2 else p8$2);
    $energy.2$1, $i1.0$1 := (if p9$1 then $energy.1$1 else $energy.2$1), (if p9$1 then 0bv32 else $i1.0$1);
    $energy.2$2, $i1.0$2 := (if p9$2 then $energy.1$2 else $energy.2$2), (if p9$2 then 0bv32 else $i1.0$2);
    p10$1 := (if p9$1 then true else p10$1);
    p10$2 := (if p9$2 then true else p10$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p10$1 ==> p8$1;
    assert p10$2 ==> p8$2;
    assert p8$1 ==> p0$1;
    assert p8$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 74} p10$1 ==> true;
    v57$1 := (if p10$1 then BV32_SLT($i1.0$1, 8bv32) else v57$1);
    v57$2 := (if p10$2 then BV32_SLT($i1.0$2, 8bv32) else v57$2);
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
    p11$1 := (if p10$1 && v57$1 then v57$1 else p11$1);
    p11$2 := (if p10$2 && v57$2 then v57$2 else p11$2);
    p10$1 := (if p10$1 && !v57$1 then v57$1 else p10$1);
    p10$2 := (if p10$2 && !v57$2 then v57$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$1, BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$2, BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    v58$1 := (if p11$1 then $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32))] else v58$1);
    v58$2 := (if p11$2 then $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32))] else v58$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$1, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 1bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$2, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 1bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    v59$1 := (if p11$1 then $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 1bv32)] else v59$1);
    v59$2 := (if p11$2 then $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 1bv32)] else v59$2);
    call {:sourceloc} {:sourceloc_num 78} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$1, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 2bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 78} _CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$2, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 2bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    v60$1 := (if p11$1 then $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 2bv32)] else v60$1);
    v60$2 := (if p11$2 then $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 2bv32)] else v60$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$1, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 3bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(p11$2, BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 3bv32), $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache"} true;
    v61$1 := (if p11$1 then $$opencl_cutoff_potential_lattice.AtomBinCache[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$1, 32bv32), BV32_MUL($i1.0$1, 4bv32)), 3bv32)] else v61$1);
    v61$2 := (if p11$2 then $$opencl_cutoff_potential_lattice.AtomBinCache[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($bincnt.1$2, 32bv32), BV32_MUL($i1.0$2, 4bv32)), 3bv32)] else v61$2);
    v62$1 := (if p11$1 then FEQ32(0bv32, v61$1) else v62$1);
    v62$2 := (if p11$2 then FEQ32(0bv32, v61$2) else v62$2);
    p10$1 := (if p11$1 && v62$1 then !v62$1 else p10$1);
    p10$2 := (if p11$2 && v62$2 then !v62$2 else p10$2);
    p12$1 := (if p11$1 && !v62$1 then !v62$1 else p12$1);
    p12$2 := (if p11$2 && !v62$2 then !v62$2 else p12$2);
    v63$1 := (if p12$1 then FADD32(FMUL32(FSUB32(v60$1, v7$1), FSUB32(v60$1, v7$1)), FADD32(FMUL32(FSUB32(v58$1, v5$1), FSUB32(v58$1, v5$1)), FMUL32(FSUB32(v59$1, v6$1), FSUB32(v59$1, v6$1)))) else v63$1);
    v63$2 := (if p12$2 then FADD32(FMUL32(FSUB32(v60$2, v7$2), FSUB32(v60$2, v7$2)), FADD32(FMUL32(FSUB32(v58$2, v5$2), FSUB32(v58$2, v5$2)), FMUL32(FSUB32(v59$2, v6$2), FSUB32(v59$2, v6$2)))) else v63$2);
    v64$1 := (if p12$1 then FLT32(v63$1, $cutoff2) else v64$1);
    v64$2 := (if p12$2 then FLT32(v63$2, $cutoff2) else v64$2);
    p14$1 := (if p12$1 && v64$1 then v64$1 else p14$1);
    p14$2 := (if p12$2 && v64$2 then v64$2 else p14$2);
    p13$1 := (if p12$1 && !v64$1 then !v64$1 else p13$1);
    p13$2 := (if p12$2 && !v64$2 then !v64$2 else p13$2);
    $energy.3$1 := (if p13$1 then $energy.2$1 else $energy.3$1);
    $energy.3$2 := (if p13$2 then $energy.2$2 else $energy.3$2);
    v65$1 := (if p14$1 then FADD32(FMUL32(FSUB32(2147483648bv32, v63$1), $inv_cutoff2), 1065353216bv32) else v65$1);
    v65$2 := (if p14$2 then FADD32(FMUL32(FSUB32(2147483648bv32, v63$2), $inv_cutoff2), 1065353216bv32) else v65$2);
    $energy.3$1 := (if p14$1 then FADD32($energy.2$1, FMUL32(FMUL32(FMUL32(v61$1, FDIV32(1065353216bv32, FSQRT32(v63$1))), v65$1), v65$1)) else $energy.3$1);
    $energy.3$2 := (if p14$2 then FADD32($energy.2$2, FMUL32(FMUL32(FMUL32(v61$2, FDIV32(1065353216bv32, FSQRT32(v63$2))), v65$2), v65$2)) else $energy.3$2);
    $energy.2$1, $i1.0$1 := (if p12$1 then $energy.3$1 else $energy.2$1), (if p12$1 then BV32_ADD($i1.0$1, 1bv32) else $i1.0$1);
    $energy.2$2, $i1.0$2 := (if p12$2 then $energy.3$2 else $energy.2$2), (if p12$2 then BV32_ADD($i1.0$2, 1bv32) else $i1.0$2);
    p10$1 := (if p12$1 then true else p10$1);
    p10$2 := (if p12$2 then true else p10$2);
    goto $13.backedge, $13.tail;

  $13.tail:
    assume !p10$1 && !p10$2;
    $energy.1$1, $bincnt.1$1 := (if p9$1 then $energy.2$1 else $energy.1$1), (if p9$1 then BV32_ADD($bincnt.1$1, 1bv32) else $bincnt.1$1);
    $energy.1$2, $bincnt.1$2 := (if p9$2 then $energy.2$2 else $energy.1$2), (if p9$2 then BV32_ADD($bincnt.1$2, 1bv32) else $bincnt.1$2);
    p8$1 := (if p9$1 then true else p8$1);
    p8$2 := (if p9$2 then true else p8$2);
    goto $11.backedge, __partitioned_block_$11.tail_0;

  __partitioned_block_$11.tail_0:
    assume !p8$1 && !p8$2;
    goto __partitioned_block_$11.tail_1;

  __partitioned_block_$11.tail_1:
    call {:sourceloc_num 88} $bugle_barrier_duplicated_1(1bv1, 1bv1, p1$1, p1$2);
    $nbrid.0$1, $totalbins.0$1, $numbins.0$1, $energy.0$1 := (if p1$1 then $nbrid.1$1 else $nbrid.0$1), (if p1$1 then BV32_ADD($totalbins.0$1, $numbins.1$1) else $totalbins.0$1), (if p1$1 then $numbins.1$1 else $numbins.0$1), (if p1$1 then $energy.1$1 else $energy.0$1);
    $nbrid.0$2, $totalbins.0$2, $numbins.0$2, $energy.0$2 := (if p1$2 then $nbrid.1$2 else $nbrid.0$2), (if p1$2 then BV32_ADD($totalbins.0$2, $numbins.1$2) else $totalbins.0$2), (if p1$2 then $numbins.1$2 else $numbins.0$2), (if p1$2 then $energy.1$2 else $energy.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 91} _LOG_WRITE_$$regionZeroAddr(true, BV32_ADD(BV32_ADD(v3$1, v4$1), v2$1), $energy.0$1, $$regionZeroAddr[BV32_ADD(BV32_ADD(v3$1, v4$1), v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$regionZeroAddr(true, BV32_ADD(BV32_ADD(v3$2, v4$2), v2$2));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 91} _CHECK_WRITE_$$regionZeroAddr(true, BV32_ADD(BV32_ADD(v3$2, v4$2), v2$2), $energy.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$regionZeroAddr"} true;
    $$regionZeroAddr[BV32_ADD(BV32_ADD(v3$1, v4$1), v2$1)] := $energy.0$1;
    $$regionZeroAddr[BV32_ADD(BV32_ADD(v3$2, v4$2), v2$2)] := $energy.0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $11.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $11;

  $13.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $13;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $3;
}



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 44bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 11bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$opencl_cutoff_potential_lattice.myBinIndex, $$opencl_cutoff_potential_lattice.AtomBinCache, $$regionZeroAddr, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$opencl_cutoff_potential_lattice.myBinIndex, $$opencl_cutoff_potential_lattice.AtomBinCache, $$regionZeroAddr, _TRACKING;



const _WATCHED_VALUE_$$binBaseAddr: bv32;

procedure {:inline 1} _LOG_READ_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$binBaseAddr;



implementation {:inline 1} _LOG_READ_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$binBaseAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binBaseAddr == _value then true else _READ_HAS_OCCURRED_$$binBaseAddr);
    return;
}



procedure _CHECK_READ_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$binBaseAddr);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$binBaseAddr: bool;

procedure {:inline 1} _LOG_WRITE_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$binBaseAddr, _WRITE_READ_BENIGN_FLAG_$$binBaseAddr;



implementation {:inline 1} _LOG_WRITE_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$binBaseAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binBaseAddr == _value then true else _WRITE_HAS_OCCURRED_$$binBaseAddr);
    _WRITE_READ_BENIGN_FLAG_$$binBaseAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binBaseAddr == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$binBaseAddr);
    return;
}



procedure _CHECK_WRITE_$$binBaseAddr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binBaseAddr != _value);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binBaseAddr != _value);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$binBaseAddr(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$binBaseAddr;



implementation {:inline 1} _LOG_ATOMIC_$$binBaseAddr(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$binBaseAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$binBaseAddr);
    return;
}



procedure _CHECK_ATOMIC_$$binBaseAddr(_P: bool, _offset: bv32);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset);
  requires {:source_name "binBaseAddr"} {:array "$$binBaseAddr"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binBaseAddr(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$binBaseAddr;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binBaseAddr(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$binBaseAddr := (if _P && _WRITE_HAS_OCCURRED_$$binBaseAddr && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$binBaseAddr);
    return;
}



const _WATCHED_VALUE_$$regionZeroAddr: bv32;

procedure {:inline 1} _LOG_READ_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$regionZeroAddr;



implementation {:inline 1} _LOG_READ_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$regionZeroAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$regionZeroAddr == _value then true else _READ_HAS_OCCURRED_$$regionZeroAddr);
    return;
}



procedure _CHECK_READ_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr: bool;

procedure {:inline 1} _LOG_WRITE_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$regionZeroAddr, _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr;



implementation {:inline 1} _LOG_WRITE_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$regionZeroAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$regionZeroAddr == _value then true else _WRITE_HAS_OCCURRED_$$regionZeroAddr);
    _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$regionZeroAddr == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr);
    return;
}



procedure _CHECK_WRITE_$$regionZeroAddr(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$regionZeroAddr != _value);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$regionZeroAddr != _value);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$regionZeroAddr(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$regionZeroAddr;



implementation {:inline 1} _LOG_ATOMIC_$$regionZeroAddr(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$regionZeroAddr := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$regionZeroAddr);
    return;
}



procedure _CHECK_ATOMIC_$$regionZeroAddr(_P: bool, _offset: bv32);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset);
  requires {:source_name "regionZeroAddr"} {:array "$$regionZeroAddr"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$regionZeroAddr(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$regionZeroAddr(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr := (if _P && _WRITE_HAS_OCCURRED_$$regionZeroAddr && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$regionZeroAddr);
    return;
}



const _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex: bv32;

procedure {:inline 1} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;



implementation {:inline 1} _LOG_READ_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex == _value then true else _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex);
    return;
}



procedure _CHECK_READ_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex: bool;

procedure {:inline 1} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex;



implementation {:inline 1} _LOG_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex == _value then true else _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex);
    _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex);
    return;
}



procedure _CHECK_WRITE_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.myBinIndex != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;



implementation {:inline 1} _LOG_ATOMIC_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex);
    return;
}



procedure _CHECK_ATOMIC_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "myBinIndex"} {:array "$$opencl_cutoff_potential_lattice.myBinIndex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex := (if _P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.myBinIndex);
    return;
}



const _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache: bv32;

procedure {:inline 1} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;



implementation {:inline 1} _LOG_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache == _value then true else _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache);
    return;
}



procedure _CHECK_READ_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache: bool;

procedure {:inline 1} _LOG_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache, _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache;



implementation {:inline 1} _LOG_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache == _value then true else _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache);
    _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache);
    return;
}



procedure _CHECK_WRITE_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$opencl_cutoff_potential_lattice.AtomBinCache != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;



implementation {:inline 1} _LOG_ATOMIC_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache);
    return;
}



procedure _CHECK_ATOMIC_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "AtomBinCache"} {:array "$$opencl_cutoff_potential_lattice.AtomBinCache"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache := (if _P && _WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$opencl_cutoff_potential_lattice.AtomBinCache);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$regionZeroAddr;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$regionZeroAddr;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$regionZeroAddr;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$regionZeroAddr;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$opencl_cutoff_potential_lattice.myBinIndex;
    goto anon4;

  anon4:
    havoc $$opencl_cutoff_potential_lattice.AtomBinCache;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.myBinIndex;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$opencl_cutoff_potential_lattice.AtomBinCache;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$regionZeroAddr;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$regionZeroAddr;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$regionZeroAddr;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$regionZeroAddr;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$opencl_cutoff_potential_lattice.myBinIndex;
    goto anon4;

  anon4:
    havoc $$opencl_cutoff_potential_lattice.AtomBinCache;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
