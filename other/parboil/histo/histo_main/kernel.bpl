type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(_P$1: bool, x$1: [bv32]bv32, y$1: bv32, _P$2: bool, x$2: [bv32]bv32, y$2: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "sm_mappings"} {:global} $$sm_mappings: [bv32]bv8;

axiom {:array_info "$$sm_mappings"} {:global} {:elem_width 8} {:source_name "sm_mappings"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sm_mappings: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sm_mappings: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sm_mappings: bool;

var {:source_name "global_subhisto"} {:global} $$global_subhisto: [bv32]bv32;

axiom {:array_info "$$global_subhisto"} {:global} {:elem_width 32} {:source_name "global_subhisto"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_subhisto: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_subhisto: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_subhisto: bool;

var {:source_name "global_histo"} {:global} $$global_histo: [bv32]bv32;

axiom {:array_info "$$global_histo"} {:global} {:elem_width 32} {:source_name "global_histo"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_histo: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_histo: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_histo: bool;

var {:source_name "global_overflow"} {:global} $$global_overflow: [bv32]bv32;

axiom {:array_info "$$global_overflow"} {:global} {:elem_width 32} {:source_name "global_overflow"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_overflow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_overflow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_overflow: bool;

var {:source_name "sub_histo"} {:group_shared} $$histo_main_kernel.sub_histo: [bv1][bv32]bv32;

axiom {:array_info "$$histo_main_kernel.sub_histo"} {:group_shared} {:elem_width 32} {:source_name "sub_histo"} {:source_elem_width 32} {:source_dimensions "24,256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,256"} _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,256"} _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,256"} _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 16"} BV16_ZEXT32(bv16) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "histo_main_kernel"} {:kernel} $histo_main_kernel($num_elements: bv32, $sm_range_min: bv32, $sm_range_max: bv32, $histo_height: bv32, $histo_width: bv32);
  requires !_READ_HAS_OCCURRED_$$sm_mappings && !_WRITE_HAS_OCCURRED_$$sm_mappings && !_ATOMIC_HAS_OCCURRED_$$sm_mappings;
  requires !_READ_HAS_OCCURRED_$$global_subhisto && !_WRITE_HAS_OCCURRED_$$global_subhisto && !_ATOMIC_HAS_OCCURRED_$$global_subhisto;
  requires !_READ_HAS_OCCURRED_$$global_histo && !_WRITE_HAS_OCCURRED_$$global_histo && !_ATOMIC_HAS_OCCURRED_$$global_histo;
  requires !_READ_HAS_OCCURRED_$$global_overflow && !_WRITE_HAS_OCCURRED_$$global_overflow && !_ATOMIC_HAS_OCCURRED_$$global_overflow;
  requires !_READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo && !_WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo && !_ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
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
  modifies $$histo_main_kernel.sub_histo, _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo, _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo, _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo, $$global_subhisto, $$global_histo, $$global_overflow, _TRACKING, _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo, _ATOMIC_HAS_OCCURRED_$$global_overflow, _ATOMIC_HAS_OCCURRED_$$global_histo, _TRACKING, _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo, _ATOMIC_HAS_OCCURRED_$$global_subhisto;



implementation {:source_name "histo_main_kernel"} {:kernel} $histo_main_kernel($num_elements: bv32, $sm_range_min: bv32, $sm_range_max: bv32, $histo_height: bv32, $histo_width: bv32)
{
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var $bin_plus_1_add.i.0$1: bv32;
  var $bin_plus_1_add.i.0$2: bv32;
  var $bin_plus_2_add.i.0$1: bv32;
  var $bin_plus_2_add.i.0$2: bv32;
  var $bin_plus_3_add.i.0$1: bv32;
  var $bin_plus_3_add.i.0$2: bv32;
  var $local_scan_load.0$1: bv32;
  var $local_scan_load.0$2: bv32;
  var $bin_plus_1_add.i.3$1: bv32;
  var $bin_plus_1_add.i.3$2: bv32;
  var $bin_plus_2_add.i.3$1: bv32;
  var $bin_plus_2_add.i.3$2: bv32;
  var $bin_plus_3_add.i.3$1: bv32;
  var $bin_plus_3_add.i.3$2: bv32;
  var $bin_plus_1_add.i.2$1: bv32;
  var $bin_plus_1_add.i.2$2: bv32;
  var $bin_plus_2_add.i.2$1: bv32;
  var $bin_plus_2_add.i.2$2: bv32;
  var $bin_plus_3_add.i.2$1: bv32;
  var $bin_plus_3_add.i.2$2: bv32;
  var $overflow_into_bin_plus_1.i.0$1: bv8;
  var $overflow_into_bin_plus_1.i.0$2: bv8;
  var $overflow_into_bin_plus_2.i.0$1: bv8;
  var $overflow_into_bin_plus_2.i.0$2: bv8;
  var $overflow_into_bin_plus_3.i.0$1: bv8;
  var $overflow_into_bin_plus_3.i.0$2: bv8;
  var $bin_plus_1_add.i.1$1: bv32;
  var $bin_plus_1_add.i.1$2: bv32;
  var $bin_plus_2_add.i.1$1: bv32;
  var $bin_plus_2_add.i.1$2: bv32;
  var $bin_plus_3_add.i.1$1: bv32;
  var $bin_plus_3_add.i.1$2: bv32;
  var $bin_plus_1_add.i24.0$1: bv32;
  var $bin_plus_1_add.i24.0$2: bv32;
  var $bin_plus_2_add.i25.0$1: bv32;
  var $bin_plus_2_add.i25.0$2: bv32;
  var $bin_plus_3_add.i26.0$1: bv32;
  var $bin_plus_3_add.i26.0$2: bv32;
  var $local_scan_load.1$1: bv32;
  var $local_scan_load.1$2: bv32;
  var $bin_plus_1_add.i24.3$1: bv32;
  var $bin_plus_1_add.i24.3$2: bv32;
  var $bin_plus_2_add.i25.3$1: bv32;
  var $bin_plus_2_add.i25.3$2: bv32;
  var $bin_plus_3_add.i26.3$1: bv32;
  var $bin_plus_3_add.i26.3$2: bv32;
  var $bin_plus_1_add.i24.2$1: bv32;
  var $bin_plus_1_add.i24.2$2: bv32;
  var $bin_plus_2_add.i25.2$1: bv32;
  var $bin_plus_2_add.i25.2$2: bv32;
  var $bin_plus_3_add.i26.2$1: bv32;
  var $bin_plus_3_add.i26.2$2: bv32;
  var $overflow_into_bin_plus_1.i18.0$1: bv8;
  var $overflow_into_bin_plus_1.i18.0$2: bv8;
  var $overflow_into_bin_plus_2.i19.0$1: bv8;
  var $overflow_into_bin_plus_2.i19.0$2: bv8;
  var $overflow_into_bin_plus_3.i20.0$1: bv8;
  var $overflow_into_bin_plus_3.i20.0$2: bv8;
  var $bin_plus_1_add.i24.1$1: bv32;
  var $bin_plus_1_add.i24.1$2: bv32;
  var $bin_plus_2_add.i25.1$1: bv32;
  var $bin_plus_2_add.i25.1$2: bv32;
  var $bin_plus_3_add.i26.1$1: bv32;
  var $bin_plus_3_add.i26.1$2: bv32;
  var $i.i28.0$1: bv32;
  var $i.i28.0$2: bv32;
  var v0: bv32;
  var v1: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v45$1: bv32;
  var v45$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
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
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bool;
  var v30$2: bool;
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
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bool;
  var v42$2: bool;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bool;
  var v47$2: bool;
  var v48$1: bv8;
  var v48$2: bv8;
  var v49$1: bv8;
  var v49$2: bv8;
  var v50$1: bv8;
  var v50$2: bv8;
  var v51$1: bv8;
  var v51$2: bv8;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bool;
  var v56$2: bool;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bool;
  var v59$2: bool;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bool;
  var v61$2: bool;
  var v62$1: bool;
  var v62$2: bool;
  var v63$1: bool;
  var v63$2: bool;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bool;
  var v66$2: bool;
  var v67$1: bool;
  var v67$2: bool;
  var v68$1: bool;
  var v68$2: bool;
  var v69$1: bv32;
  var v69$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73$1: bool;
  var v73$2: bool;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76$1: bv32;
  var v76$2: bv32;
  var v77$1: bv32;
  var v77$2: bv32;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
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
  var p44$1: bool;
  var p44$2: bool;
  var p45$1: bool;
  var p45$2: bool;
  var p46$1: bool;
  var p46$2: bool;
  var p47$1: bool;
  var p47$2: bool;
  var p48$1: bool;
  var p48$2: bool;
  var p49$1: bool;
  var p49$2: bool;
  var p50$1: bool;
  var p50$2: bool;
  var p51$1: bool;
  var p51$2: bool;
  var p52$1: bool;
  var p52$2: bool;
  var p53$1: bool;
  var p53$2: bool;
  var p54$1: bool;
  var p54$2: bool;
  var p55$1: bool;
  var p55$2: bool;
  var p56$1: bool;
  var p56$2: bool;
  var p57$1: bool;
  var p57$2: bool;
  var p58$1: bool;
  var p58$2: bool;
  var p59$1: bool;
  var p59$2: bool;
  var p60$1: bool;
  var p60$2: bool;
  var p61$1: bool;
  var p61$2: bool;
  var p62$1: bool;
  var p62$2: bool;
  var p63$1: bool;
  var p63$2: bool;
  var p64$1: bool;
  var p64$2: bool;
  var p65$1: bool;
  var p65$2: bool;
  var p66$1: bool;
  var p66$2: bool;
  var p67$1: bool;
  var p67$2: bool;
  var p68$1: bool;
  var p68$2: bool;
  var p69$1: bool;
  var p69$2: bool;
  var p70$1: bool;
  var p70$2: bool;
  var p71$1: bool;
  var p71$2: bool;
  var p72$1: bool;
  var p72$2: bool;
  var p73$1: bool;
  var p73$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := group_size_x;
    v1 := num_groups_x;
    v2$1 := BV32_ADD($sm_range_min, group_id_y$1);
    v2$2 := BV32_ADD($sm_range_min, group_id_y$2);
    v3$1 := BV32_ADD(BV32_MUL(group_id_x$1, v0), local_id_x$1);
    v3$2 := BV32_ADD(BV32_MUL(group_id_x$2, v0), local_id_x$2);
    $i.i.0$1 := local_id_x$1;
    $i.i.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p4$1 := false;
    p4$2 := false;
    p42$1 := false;
    p42$2 := false;
    p72$1 := false;
    p72$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v4$1 := (if p0$1 then BV32_SLT($i.i.0$1, 6144bv32) else v4$1);
    v4$2 := (if p0$2 then BV32_SLT($i.i.0$2, 6144bv32) else v4$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p41$1 := false;
    p41$2 := false;
    p1$1 := (if p0$1 && v4$1 then v4$1 else p1$1);
    p1$2 := (if p0$2 && v4$2 then v4$2 else p1$2);
    p0$1 := (if p0$1 && !v4$1 then v4$1 else p0$1);
    p0$2 := (if p0$2 && !v4$2 then v4$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$histo_main_kernel.sub_histo(p1$1, $i.i.0$1, 0bv32, $$histo_main_kernel.sub_histo[1bv1][$i.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo(p1$2, $i.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$histo_main_kernel.sub_histo(p1$2, $i.i.0$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_main_kernel.sub_histo"} true;
    $$histo_main_kernel.sub_histo[1bv1][$i.i.0$1] := (if p1$1 then 0bv32 else $$histo_main_kernel.sub_histo[1bv1][$i.i.0$1]);
    $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i.0$2] := (if p1$2 then 0bv32 else $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i.0$2]);
    $i.i.0$1 := (if p1$1 then BV32_ADD($i.i.0$1, group_size_x) else $i.i.0$1);
    $i.i.0$2 := (if p1$2 then BV32_ADD($i.i.0$2, group_size_x) else $i.i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, __partitioned_block_$1.tail_0;

  __partitioned_block_$1.tail_0:
    assume !p0$1 && !p0$2;
    goto __partitioned_block_$1.tail_1;

  __partitioned_block_$1.tail_1:
    call {:sourceloc_num 5} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v5$1 := group_id_y$1 == 0bv32;
    v5$2 := group_id_y$2 == 0bv32;
    p3$1 := (if v5$1 then v5$1 else p3$1);
    p3$2 := (if v5$2 then v5$2 else p3$2);
    p41$1 := (if !v5$1 then !v5$1 else p41$1);
    p41$2 := (if !v5$2 then !v5$2 else p41$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p3$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p3$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p3$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p3$2 then _HAVOC_bv32$2 else v7$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p3$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p3$2 then _HAVOC_bv32$2 else v8$2);
    $bin_plus_1_add.i.0$1, $bin_plus_2_add.i.0$1, $bin_plus_3_add.i.0$1, $local_scan_load.0$1 := (if p3$1 then v6$1 else $bin_plus_1_add.i.0$1), (if p3$1 then v7$1 else $bin_plus_2_add.i.0$1), (if p3$1 then v8$1 else $bin_plus_3_add.i.0$1), (if p3$1 then v3$1 else $local_scan_load.0$1);
    $bin_plus_1_add.i.0$2, $bin_plus_2_add.i.0$2, $bin_plus_3_add.i.0$2, $local_scan_load.0$2 := (if p3$2 then v6$2 else $bin_plus_1_add.i.0$2), (if p3$2 then v7$2 else $bin_plus_2_add.i.0$2), (if p3$2 then v8$2 else $bin_plus_3_add.i.0$2), (if p3$2 then v3$2 else $local_scan_load.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 7} p4$1 ==> true;
    v9$1 := (if p4$1 then BV32_ULT($local_scan_load.0$1, $num_elements) else v9$1);
    v9$2 := (if p4$2 then BV32_ULT($local_scan_load.0$2, $num_elements) else v9$2);
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
    p5$1 := (if p4$1 && v9$1 then v9$1 else p5$1);
    p5$2 := (if p4$2 && v9$2 then v9$2 else p5$2);
    p4$1 := (if p4$1 && !v9$1 then v9$1 else p4$1);
    p4$2 := (if p4$2 && !v9$2 then v9$2 else p4$2);
    v10$1 := (if p5$1 then $$sm_mappings[BV32_MUL($local_scan_load.0$1, 4bv32)] else v10$1);
    v10$2 := (if p5$2 then $$sm_mappings[BV32_MUL($local_scan_load.0$2, 4bv32)] else v10$2);
    v11$1 := (if p5$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$1, 4bv32), 1bv32)] else v11$1);
    v11$2 := (if p5$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$2, 4bv32), 1bv32)] else v11$2);
    v12$1 := (if p5$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$1, 4bv32), 2bv32)] else v12$1);
    v12$2 := (if p5$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$2, 4bv32), 2bv32)] else v12$2);
    v13$1 := (if p5$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$1, 4bv32), 3bv32)] else v13$1);
    v13$2 := (if p5$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.0$2, 4bv32), 3bv32)] else v13$2);
    v14$1 := (if p5$1 then BV8_ZEXT32(v10$1) else v14$1);
    v14$2 := (if p5$2 then BV8_ZEXT32(v10$2) else v14$2);
    v15$1 := (if p5$1 then BV8_ZEXT32(v11$1) else v15$1);
    v15$2 := (if p5$2 then BV8_ZEXT32(v11$2) else v15$2);
    v16$1 := (if p5$1 then BV8_ZEXT32(v12$1) else v16$1);
    v16$2 := (if p5$2 then BV8_ZEXT32(v12$2) else v16$2);
    v17$1 := (if p5$1 then BV8_ZEXT32(v13$1) else v17$1);
    v17$2 := (if p5$2 then BV8_ZEXT32(v13$2) else v17$2);
    v18$1 := (if p5$1 then v14$1 == v2$1 else v18$1);
    v18$2 := (if p5$2 then v14$2 == v2$2 else v18$2);
    p7$1 := (if p5$1 && v18$1 then v18$1 else p7$1);
    p7$2 := (if p5$2 && v18$2 then v18$2 else p7$2);
    p6$1 := (if p5$1 && !v18$1 then !v18$1 else p6$1);
    p6$2 := (if p5$2 && !v18$2 then !v18$2 else p6$2);
    $bin_plus_1_add.i.3$1, $bin_plus_2_add.i.3$1, $bin_plus_3_add.i.3$1 := (if p6$1 then $bin_plus_1_add.i.0$1 else $bin_plus_1_add.i.3$1), (if p6$1 then $bin_plus_2_add.i.0$1 else $bin_plus_2_add.i.3$1), (if p6$1 then $bin_plus_3_add.i.0$1 else $bin_plus_3_add.i.3$1);
    $bin_plus_1_add.i.3$2, $bin_plus_2_add.i.3$2, $bin_plus_3_add.i.3$2 := (if p6$2 then $bin_plus_1_add.i.0$2 else $bin_plus_1_add.i.3$2), (if p6$2 then $bin_plus_2_add.i.0$2 else $bin_plus_2_add.i.3$2), (if p6$2 then $bin_plus_3_add.i.0$2 else $bin_plus_3_add.i.3$2);
    call {:sourceloc} {:sourceloc_num 14} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v17$1, 31bv32))} {:parts 1} {:part 1} _LOG_ATOMIC_$$histo_main_kernel.sub_histo(p7$1, BV32_SDIV(BV32_ADD(BV32_MUL(v15$1, 1024bv32), BV32_MUL(v16$1, 4bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 14} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v17$2, 31bv32))} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histo_main_kernel.sub_histo(p7$2, BV32_SDIV(BV32_ADD(BV32_MUL(v15$2, 1024bv32), BV32_MUL(v16$2, 4bv32)), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histo_main_kernel.sub_histo"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v19$1 := (if p7$1 then _HAVOC_bv32$1 else v19$1);
    v19$2 := (if p7$2 then _HAVOC_bv32$2 else v19$2);
    v20$1 := (if p7$1 then BV32_AND(BV32_LSHR(v19$1, BV32_AND(v17$1, 31bv32)), 255bv32) else v20$1);
    v20$2 := (if p7$2 then BV32_AND(BV32_LSHR(v19$2, BV32_AND(v17$2, 31bv32)), 255bv32) else v20$2);
    v21$1 := (if p7$1 then v20$1 == 255bv32 else v21$1);
    v21$2 := (if p7$2 then v20$2 == 255bv32 else v21$2);
    p9$1 := (if p7$1 && v21$1 then v21$1 else p9$1);
    p9$2 := (if p7$2 && v21$2 then v21$2 else p9$2);
    p8$1 := (if p7$1 && !v21$1 then !v21$1 else p8$1);
    p8$2 := (if p7$2 && !v21$2 then !v21$2 else p8$2);
    $bin_plus_1_add.i.2$1, $bin_plus_2_add.i.2$1, $bin_plus_3_add.i.2$1 := (if p8$1 then $bin_plus_1_add.i.0$1 else $bin_plus_1_add.i.2$1), (if p8$1 then $bin_plus_2_add.i.0$1 else $bin_plus_2_add.i.2$1), (if p8$1 then $bin_plus_3_add.i.0$1 else $bin_plus_3_add.i.2$1);
    $bin_plus_1_add.i.2$2, $bin_plus_2_add.i.2$2, $bin_plus_3_add.i.2$2 := (if p8$2 then $bin_plus_1_add.i.0$2 else $bin_plus_1_add.i.2$2), (if p8$2 then $bin_plus_2_add.i.0$2 else $bin_plus_2_add.i.2$2), (if p8$2 then $bin_plus_3_add.i.0$2 else $bin_plus_3_add.i.2$2);
    v22$1 := (if p9$1 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v14$1, 24576bv32), BV32_UDIV(v17$1, 8bv32)), BV32_SHL(v16$1, 2bv32)), BV32_SHL(v15$1, 10bv32)) else v22$1);
    v22$2 := (if p9$2 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v14$2, 24576bv32), BV32_UDIV(v17$2, 8bv32)), BV32_SHL(v16$2, 2bv32)), BV32_SHL(v15$2, 10bv32)) else v22$2);
    v23$1 := (if p9$1 then BV32_ULT(v17$1, 24bv32) else v23$1);
    v23$2 := (if p9$2 then BV32_ULT(v17$2, 24bv32) else v23$2);
    v24$1 := (if p9$1 then BV32_ULT(v17$1, 16bv32) else v24$1);
    v24$2 := (if p9$2 then BV32_ULT(v17$2, 16bv32) else v24$2);
    v25$1 := (if p9$1 then BV32_ULT(v17$1, 8bv32) else v25$1);
    v25$2 := (if p9$2 then BV32_ULT(v17$2, 8bv32) else v25$2);
    v26$1 := (if p9$1 then BV32_AND(BV32_LSHR(v19$1, BV32_AND(BV32_ADD(v17$1, 8bv32), 31bv32)), 255bv32) else v26$1);
    v26$2 := (if p9$2 then BV32_AND(BV32_LSHR(v19$2, BV32_AND(BV32_ADD(v17$2, 8bv32), 31bv32)), 255bv32) else v26$2);
    v27$1 := (if p9$1 then BV32_AND(BV32_LSHR(v19$1, BV32_AND(BV32_ADD(v17$1, 16bv32), 31bv32)), 255bv32) else v27$1);
    v27$2 := (if p9$2 then BV32_AND(BV32_LSHR(v19$2, BV32_AND(BV32_ADD(v17$2, 16bv32), 31bv32)), 255bv32) else v27$2);
    p11$1 := (if p9$1 && v23$1 then v23$1 else p11$1);
    p11$2 := (if p9$2 && v23$2 then v23$2 else p11$2);
    p10$1 := (if p9$1 && !v23$1 then !v23$1 else p10$1);
    p10$2 := (if p9$2 && !v23$2 then !v23$2 else p10$2);
    $overflow_into_bin_plus_1.i.0$1 := (if p10$1 then 0bv8 else $overflow_into_bin_plus_1.i.0$1);
    $overflow_into_bin_plus_1.i.0$2 := (if p10$2 then 0bv8 else $overflow_into_bin_plus_1.i.0$2);
    v28$1 := (if p11$1 then v20$1 == 255bv32 else v28$1);
    v28$2 := (if p11$2 then v20$2 == 255bv32 else v28$2);
    p13$1 := (if p11$1 && v28$1 then v28$1 else p13$1);
    p13$2 := (if p11$2 && v28$2 then v28$2 else p13$2);
    p12$1 := (if p11$1 && !v28$1 then !v28$1 else p12$1);
    p12$2 := (if p11$2 && !v28$2 then !v28$2 else p12$2);
    $overflow_into_bin_plus_1.i.0$1 := (if p12$1 then 0bv8 else $overflow_into_bin_plus_1.i.0$1);
    $overflow_into_bin_plus_1.i.0$2 := (if p12$2 then 0bv8 else $overflow_into_bin_plus_1.i.0$2);
    $overflow_into_bin_plus_1.i.0$1 := (if p13$1 then 1bv8 else $overflow_into_bin_plus_1.i.0$1);
    $overflow_into_bin_plus_1.i.0$2 := (if p13$2 then 1bv8 else $overflow_into_bin_plus_1.i.0$2);
    p15$1 := (if p9$1 && v24$1 then v24$1 else p15$1);
    p15$2 := (if p9$2 && v24$2 then v24$2 else p15$2);
    p14$1 := (if p9$1 && !v24$1 then !v24$1 else p14$1);
    p14$2 := (if p9$2 && !v24$2 then !v24$2 else p14$2);
    $overflow_into_bin_plus_2.i.0$1 := (if p14$1 then 0bv8 else $overflow_into_bin_plus_2.i.0$1);
    $overflow_into_bin_plus_2.i.0$2 := (if p14$2 then 0bv8 else $overflow_into_bin_plus_2.i.0$2);
    v29$1 := (if p15$1 then v26$1 == 255bv32 else v29$1);
    v29$2 := (if p15$2 then v26$2 == 255bv32 else v29$2);
    p17$1 := (if p15$1 && v29$1 then v29$1 else p17$1);
    p17$2 := (if p15$2 && v29$2 then v29$2 else p17$2);
    p16$1 := (if p15$1 && !v29$1 then !v29$1 else p16$1);
    p16$2 := (if p15$2 && !v29$2 then !v29$2 else p16$2);
    $overflow_into_bin_plus_2.i.0$1 := (if p16$1 then 0bv8 else $overflow_into_bin_plus_2.i.0$1);
    $overflow_into_bin_plus_2.i.0$2 := (if p16$2 then 0bv8 else $overflow_into_bin_plus_2.i.0$2);
    $overflow_into_bin_plus_2.i.0$1 := (if p17$1 then 1bv8 else $overflow_into_bin_plus_2.i.0$1);
    $overflow_into_bin_plus_2.i.0$2 := (if p17$2 then 1bv8 else $overflow_into_bin_plus_2.i.0$2);
    p19$1 := (if p9$1 && v25$1 then v25$1 else p19$1);
    p19$2 := (if p9$2 && v25$2 then v25$2 else p19$2);
    p18$1 := (if p9$1 && !v25$1 then !v25$1 else p18$1);
    p18$2 := (if p9$2 && !v25$2 then !v25$2 else p18$2);
    $overflow_into_bin_plus_3.i.0$1 := (if p18$1 then 0bv8 else $overflow_into_bin_plus_3.i.0$1);
    $overflow_into_bin_plus_3.i.0$2 := (if p18$2 then 0bv8 else $overflow_into_bin_plus_3.i.0$2);
    v30$1 := (if p19$1 then v27$1 == 255bv32 else v30$1);
    v30$2 := (if p19$2 then v27$2 == 255bv32 else v30$2);
    p21$1 := (if p19$1 && v30$1 then v30$1 else p21$1);
    p21$2 := (if p19$2 && v30$2 then v30$2 else p21$2);
    p20$1 := (if p19$1 && !v30$1 then !v30$1 else p20$1);
    p20$2 := (if p19$2 && !v30$2 then !v30$2 else p20$2);
    $overflow_into_bin_plus_3.i.0$1 := (if p20$1 then 0bv8 else $overflow_into_bin_plus_3.i.0$1);
    $overflow_into_bin_plus_3.i.0$2 := (if p20$2 then 0bv8 else $overflow_into_bin_plus_3.i.0$2);
    $overflow_into_bin_plus_3.i.0$1 := (if p21$1 then 1bv8 else $overflow_into_bin_plus_3.i.0$1);
    $overflow_into_bin_plus_3.i.0$2 := (if p21$2 then 1bv8 else $overflow_into_bin_plus_3.i.0$2);
    p23$1 := (if p9$1 && $overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1 else p23$1);
    p23$2 := (if p9$2 && $overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1 else p23$2);
    p22$1 := (if p9$1 && !($overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1) else p22$1);
    p22$2 := (if p9$2 && !($overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1) else p22$2);
    $bin_plus_1_add.i.1$1 := (if p22$1 then $bin_plus_1_add.i.0$1 else $bin_plus_1_add.i.1$1);
    $bin_plus_1_add.i.1$2 := (if p22$2 then $bin_plus_1_add.i.0$2 else $bin_plus_1_add.i.1$2);
    $bin_plus_1_add.i.1$1 := (if p23$1 then (if BV32_ULT(v26$1, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_1_add.i.1$1);
    $bin_plus_1_add.i.1$2 := (if p23$2 then (if BV32_ULT(v26$2, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_1_add.i.1$2);
    p25$1 := (if p9$1 && $overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1 else p25$1);
    p25$2 := (if p9$2 && $overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1 else p25$2);
    p24$1 := (if p9$1 && !($overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1) else p24$1);
    p24$2 := (if p9$2 && !($overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1) else p24$2);
    $bin_plus_2_add.i.1$1 := (if p24$1 then $bin_plus_2_add.i.0$1 else $bin_plus_2_add.i.1$1);
    $bin_plus_2_add.i.1$2 := (if p24$2 then $bin_plus_2_add.i.0$2 else $bin_plus_2_add.i.1$2);
    $bin_plus_2_add.i.1$1 := (if p25$1 then (if BV32_ULT(v27$1, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_2_add.i.1$1);
    $bin_plus_2_add.i.1$2 := (if p25$2 then (if BV32_ULT(v27$2, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_2_add.i.1$2);
    p27$1 := (if p9$1 && $overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1 else p27$1);
    p27$2 := (if p9$2 && $overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1 else p27$2);
    p26$1 := (if p9$1 && !($overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1) else p26$1);
    p26$2 := (if p9$2 && !($overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1) else p26$2);
    $bin_plus_3_add.i.1$1 := (if p26$1 then $bin_plus_3_add.i.0$1 else $bin_plus_3_add.i.1$1);
    $bin_plus_3_add.i.1$2 := (if p26$2 then $bin_plus_3_add.i.0$2 else $bin_plus_3_add.i.1$2);
    $bin_plus_3_add.i.1$1 := (if p27$1 then (if BV32_ULT(BV32_AND(BV32_LSHR(v19$1, BV32_AND(BV32_ADD(v17$1, 24bv32), 31bv32)), 255bv32), 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_3_add.i.1$1);
    $bin_plus_3_add.i.1$2 := (if p27$2 then (if BV32_ULT(BV32_AND(BV32_LSHR(v19$2, BV32_AND(BV32_ADD(v17$2, 24bv32), 31bv32)), 255bv32), 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_3_add.i.1$2);
    call {:sourceloc} {:sourceloc_num 31} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 256bv32} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p9$1, BV32_SDIV(BV32_MUL(v22$1, 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 31} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 256bv32} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p9$2, BV32_SDIV(BV32_MUL(v22$2, 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v31$1 := (if p9$1 then _HAVOC_bv32$1 else v31$1);
    v31$2 := (if p9$2 then _HAVOC_bv32$2 else v31$2);
    p29$1 := (if p9$1 && $overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_1.i.0$1[1:0] == 1bv1 else p29$1);
    p29$2 := (if p9$2 && $overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_1.i.0$2[1:0] == 1bv1 else p29$2);
    call {:sourceloc} {:sourceloc_num 33} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_1_add.i.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p29$1, BV32_SDIV(BV32_MUL(BV32_ADD(v22$1, 1bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 33} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_1_add.i.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p29$2, BV32_SDIV(BV32_MUL(BV32_ADD(v22$2, 1bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v32$1 := (if p29$1 then _HAVOC_bv32$1 else v32$1);
    v32$2 := (if p29$2 then _HAVOC_bv32$2 else v32$2);
    p31$1 := (if p9$1 && $overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_2.i.0$1[1:0] == 1bv1 else p31$1);
    p31$2 := (if p9$2 && $overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_2.i.0$2[1:0] == 1bv1 else p31$2);
    call {:sourceloc} {:sourceloc_num 36} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_2_add.i.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p31$1, BV32_SDIV(BV32_MUL(BV32_ADD(v22$1, 2bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 36} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_2_add.i.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p31$2, BV32_SDIV(BV32_MUL(BV32_ADD(v22$2, 2bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v33$1 := (if p31$1 then _HAVOC_bv32$1 else v33$1);
    v33$2 := (if p31$2 then _HAVOC_bv32$2 else v33$2);
    p33$1 := (if p9$1 && $overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_3.i.0$1[1:0] == 1bv1 else p33$1);
    p33$2 := (if p9$2 && $overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_3.i.0$2[1:0] == 1bv1 else p33$2);
    call {:sourceloc} {:sourceloc_num 39} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_3_add.i.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p33$1, BV32_SDIV(BV32_MUL(BV32_ADD(v22$1, 3bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 39} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_3_add.i.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p33$2, BV32_SDIV(BV32_MUL(BV32_ADD(v22$2, 3bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v34$1 := (if p33$1 then _HAVOC_bv32$1 else v34$1);
    v34$2 := (if p33$2 then _HAVOC_bv32$2 else v34$2);
    $bin_plus_1_add.i.2$1, $bin_plus_2_add.i.2$1, $bin_plus_3_add.i.2$1 := (if p9$1 then $bin_plus_1_add.i.1$1 else $bin_plus_1_add.i.2$1), (if p9$1 then $bin_plus_2_add.i.1$1 else $bin_plus_2_add.i.2$1), (if p9$1 then $bin_plus_3_add.i.1$1 else $bin_plus_3_add.i.2$1);
    $bin_plus_1_add.i.2$2, $bin_plus_2_add.i.2$2, $bin_plus_3_add.i.2$2 := (if p9$2 then $bin_plus_1_add.i.1$2 else $bin_plus_1_add.i.2$2), (if p9$2 then $bin_plus_2_add.i.1$2 else $bin_plus_2_add.i.2$2), (if p9$2 then $bin_plus_3_add.i.1$2 else $bin_plus_3_add.i.2$2);
    $bin_plus_1_add.i.3$1, $bin_plus_2_add.i.3$1, $bin_plus_3_add.i.3$1 := (if p7$1 then $bin_plus_1_add.i.2$1 else $bin_plus_1_add.i.3$1), (if p7$1 then $bin_plus_2_add.i.2$1 else $bin_plus_2_add.i.3$1), (if p7$1 then $bin_plus_3_add.i.2$1 else $bin_plus_3_add.i.3$1);
    $bin_plus_1_add.i.3$2, $bin_plus_2_add.i.3$2, $bin_plus_3_add.i.3$2 := (if p7$2 then $bin_plus_1_add.i.2$2 else $bin_plus_1_add.i.3$2), (if p7$2 then $bin_plus_2_add.i.2$2 else $bin_plus_2_add.i.3$2), (if p7$2 then $bin_plus_3_add.i.2$2 else $bin_plus_3_add.i.3$2);
    v35$1 := (if p5$1 then BV8_ZEXT32(v10$1) else v35$1);
    v35$2 := (if p5$2 then BV8_ZEXT32(v10$2) else v35$2);
    v36$1 := (if p5$1 then BV32_ULT(v35$1, $sm_range_min) else v36$1);
    v36$2 := (if p5$2 then BV32_ULT(v35$2, $sm_range_min) else v36$2);
    p38$1 := (if p5$1 && v36$1 then v36$1 else p38$1);
    p38$2 := (if p5$2 && v36$2 then v36$2 else p38$2);
    p35$1 := (if p5$1 && !v36$1 then !v36$1 else p35$1);
    p35$2 := (if p5$2 && !v36$2 then !v36$2 else p35$2);
    p38$1 := (if p34$1 then true else p38$1);
    p38$2 := (if p34$2 then true else p38$2);
    v37$1 := (if p35$1 then BV32_UGT(v35$1, $sm_range_max) else v37$1);
    v37$2 := (if p35$2 then BV32_UGT(v35$2, $sm_range_max) else v37$2);
    p38$1 := (if p35$1 && v37$1 then v37$1 else p38$1);
    p38$2 := (if p35$2 && v37$2 then v37$2 else p38$2);
    p38$1 := (if p37$1 then true else p38$1);
    p38$2 := (if p37$2 then true else p38$2);
    v38$1 := (if p38$1 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v35$1, 24576bv32), BV32_UDIV(BV8_ZEXT32(v13$1), 8bv32)), BV32_SHL(BV8_ZEXT32(v12$1), 2bv32)), BV32_SHL(BV8_ZEXT32(v11$1), 10bv32)) else v38$1);
    v38$2 := (if p38$2 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v35$2, 24576bv32), BV32_UDIV(BV8_ZEXT32(v13$2), 8bv32)), BV32_SHL(BV8_ZEXT32(v12$2), 2bv32)), BV32_SHL(BV8_ZEXT32(v11$2), 10bv32)) else v38$2);
    v39$1 := (if p38$1 then BV32_UDIV(v38$1, 2bv32) else v39$1);
    v39$2 := (if p38$2 then BV32_UDIV(v38$2, 2bv32) else v39$2);
    v40$1 := (if p38$1 then (if BV32_UREM(v38$1, 2bv32) == 1bv32 then 16bv32 else 0bv32) else v40$1);
    v40$2 := (if p38$2 then (if BV32_UREM(v38$2, 2bv32) == 1bv32 then 16bv32 else 0bv32) else v40$2);
    call {:sourceloc} {:sourceloc_num 45} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 0bv32} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_histo(p38$1, BV32_SDIV(BV32_MUL(v39$1, 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 45} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 0bv32} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_histo(p38$2, BV32_SDIV(BV32_MUL(v39$2, 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_histo"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v41$1 := (if p38$1 then _HAVOC_bv32$1 else v41$1);
    v41$2 := (if p38$2 then _HAVOC_bv32$2 else v41$2);
    v42$1 := (if p38$1 then BV32_SLT(BV16_ZEXT32(BV32_AND(BV32_LSHR(v41$1, BV32_AND(v40$1, 31bv32)), 65535bv32)[16:0]), 255bv32) else v42$1);
    v42$2 := (if p38$2 then BV32_SLT(BV16_ZEXT32(BV32_AND(BV32_LSHR(v41$2, BV32_AND(v40$2, 31bv32)), 65535bv32)[16:0]), 255bv32) else v42$2);
    p40$1 := (if p38$1 && v42$1 then v42$1 else p40$1);
    p40$2 := (if p38$2 && v42$2 then v42$2 else p40$2);
    call {:sourceloc} {:sourceloc_num 47} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v40$1, 31bv32))} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_histo(p40$1, BV32_SDIV(BV32_MUL(v39$1, 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 47} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v40$2, 31bv32))} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_histo(p40$2, BV32_SDIV(BV32_MUL(v39$2, 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_histo"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v43$1 := (if p40$1 then _HAVOC_bv32$1 else v43$1);
    v43$2 := (if p40$2 then _HAVOC_bv32$2 else v43$2);
    $bin_plus_1_add.i.0$1, $bin_plus_2_add.i.0$1, $bin_plus_3_add.i.0$1, $local_scan_load.0$1 := (if p5$1 then $bin_plus_1_add.i.3$1 else $bin_plus_1_add.i.0$1), (if p5$1 then $bin_plus_2_add.i.3$1 else $bin_plus_2_add.i.0$1), (if p5$1 then $bin_plus_3_add.i.3$1 else $bin_plus_3_add.i.0$1), (if p5$1 then BV32_ADD($local_scan_load.0$1, BV32_MUL(v0, v1)) else $local_scan_load.0$1);
    $bin_plus_1_add.i.0$2, $bin_plus_2_add.i.0$2, $bin_plus_3_add.i.0$2, $local_scan_load.0$2 := (if p5$2 then $bin_plus_1_add.i.3$2 else $bin_plus_1_add.i.0$2), (if p5$2 then $bin_plus_2_add.i.3$2 else $bin_plus_2_add.i.0$2), (if p5$2 then $bin_plus_3_add.i.3$2 else $bin_plus_3_add.i.0$2), (if p5$2 then BV32_ADD($local_scan_load.0$2, BV32_MUL(v0, v1)) else $local_scan_load.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p4$1 && !p4$2;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v44$1 := (if p41$1 then _HAVOC_bv32$1 else v44$1);
    v44$2 := (if p41$2 then _HAVOC_bv32$2 else v44$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v45$1 := (if p41$1 then _HAVOC_bv32$1 else v45$1);
    v45$2 := (if p41$2 then _HAVOC_bv32$2 else v45$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v46$1 := (if p41$1 then _HAVOC_bv32$1 else v46$1);
    v46$2 := (if p41$2 then _HAVOC_bv32$2 else v46$2);
    $bin_plus_1_add.i24.0$1, $bin_plus_2_add.i25.0$1, $bin_plus_3_add.i26.0$1, $local_scan_load.1$1 := (if p41$1 then v44$1 else $bin_plus_1_add.i24.0$1), (if p41$1 then v45$1 else $bin_plus_2_add.i25.0$1), (if p41$1 then v46$1 else $bin_plus_3_add.i26.0$1), (if p41$1 then v3$1 else $local_scan_load.1$1);
    $bin_plus_1_add.i24.0$2, $bin_plus_2_add.i25.0$2, $bin_plus_3_add.i26.0$2, $local_scan_load.1$2 := (if p41$2 then v44$2 else $bin_plus_1_add.i24.0$2), (if p41$2 then v45$2 else $bin_plus_2_add.i25.0$2), (if p41$2 then v46$2 else $bin_plus_3_add.i26.0$2), (if p41$2 then v3$2 else $local_scan_load.1$2);
    p42$1 := (if p41$1 then true else p42$1);
    p42$2 := (if p41$2 then true else p42$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $36;

  $36:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 52} p42$1 ==> true;
    v47$1 := (if p42$1 then BV32_ULT($local_scan_load.1$1, $num_elements) else v47$1);
    v47$2 := (if p42$2 then BV32_ULT($local_scan_load.1$2, $num_elements) else v47$2);
    p43$1 := false;
    p43$2 := false;
    p44$1 := false;
    p44$2 := false;
    p45$1 := false;
    p45$2 := false;
    p46$1 := false;
    p46$2 := false;
    p47$1 := false;
    p47$2 := false;
    p48$1 := false;
    p48$2 := false;
    p49$1 := false;
    p49$2 := false;
    p50$1 := false;
    p50$2 := false;
    p51$1 := false;
    p51$2 := false;
    p52$1 := false;
    p52$2 := false;
    p53$1 := false;
    p53$2 := false;
    p54$1 := false;
    p54$2 := false;
    p55$1 := false;
    p55$2 := false;
    p56$1 := false;
    p56$2 := false;
    p57$1 := false;
    p57$2 := false;
    p58$1 := false;
    p58$2 := false;
    p59$1 := false;
    p59$2 := false;
    p60$1 := false;
    p60$2 := false;
    p61$1 := false;
    p61$2 := false;
    p62$1 := false;
    p62$2 := false;
    p63$1 := false;
    p63$2 := false;
    p64$1 := false;
    p64$2 := false;
    p65$1 := false;
    p65$2 := false;
    p66$1 := false;
    p66$2 := false;
    p67$1 := false;
    p67$2 := false;
    p68$1 := false;
    p68$2 := false;
    p69$1 := false;
    p69$2 := false;
    p70$1 := false;
    p70$2 := false;
    p71$1 := false;
    p71$2 := false;
    p43$1 := (if p42$1 && v47$1 then v47$1 else p43$1);
    p43$2 := (if p42$2 && v47$2 then v47$2 else p43$2);
    p42$1 := (if p42$1 && !v47$1 then v47$1 else p42$1);
    p42$2 := (if p42$2 && !v47$2 then v47$2 else p42$2);
    v48$1 := (if p43$1 then $$sm_mappings[BV32_MUL($local_scan_load.1$1, 4bv32)] else v48$1);
    v48$2 := (if p43$2 then $$sm_mappings[BV32_MUL($local_scan_load.1$2, 4bv32)] else v48$2);
    v49$1 := (if p43$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$1, 4bv32), 1bv32)] else v49$1);
    v49$2 := (if p43$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$2, 4bv32), 1bv32)] else v49$2);
    v50$1 := (if p43$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$1, 4bv32), 2bv32)] else v50$1);
    v50$2 := (if p43$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$2, 4bv32), 2bv32)] else v50$2);
    v51$1 := (if p43$1 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$1, 4bv32), 3bv32)] else v51$1);
    v51$2 := (if p43$2 then $$sm_mappings[BV32_ADD(BV32_MUL($local_scan_load.1$2, 4bv32), 3bv32)] else v51$2);
    v52$1 := (if p43$1 then BV8_ZEXT32(v48$1) else v52$1);
    v52$2 := (if p43$2 then BV8_ZEXT32(v48$2) else v52$2);
    v53$1 := (if p43$1 then BV8_ZEXT32(v49$1) else v53$1);
    v53$2 := (if p43$2 then BV8_ZEXT32(v49$2) else v53$2);
    v54$1 := (if p43$1 then BV8_ZEXT32(v50$1) else v54$1);
    v54$2 := (if p43$2 then BV8_ZEXT32(v50$2) else v54$2);
    v55$1 := (if p43$1 then BV8_ZEXT32(v51$1) else v55$1);
    v55$2 := (if p43$2 then BV8_ZEXT32(v51$2) else v55$2);
    v56$1 := (if p43$1 then v52$1 == v2$1 else v56$1);
    v56$2 := (if p43$2 then v52$2 == v2$2 else v56$2);
    p45$1 := (if p43$1 && v56$1 then v56$1 else p45$1);
    p45$2 := (if p43$2 && v56$2 then v56$2 else p45$2);
    p44$1 := (if p43$1 && !v56$1 then !v56$1 else p44$1);
    p44$2 := (if p43$2 && !v56$2 then !v56$2 else p44$2);
    $bin_plus_1_add.i24.3$1, $bin_plus_2_add.i25.3$1, $bin_plus_3_add.i26.3$1 := (if p44$1 then $bin_plus_1_add.i24.0$1 else $bin_plus_1_add.i24.3$1), (if p44$1 then $bin_plus_2_add.i25.0$1 else $bin_plus_2_add.i25.3$1), (if p44$1 then $bin_plus_3_add.i26.0$1 else $bin_plus_3_add.i26.3$1);
    $bin_plus_1_add.i24.3$2, $bin_plus_2_add.i25.3$2, $bin_plus_3_add.i26.3$2 := (if p44$2 then $bin_plus_1_add.i24.0$2 else $bin_plus_1_add.i24.3$2), (if p44$2 then $bin_plus_2_add.i25.0$2 else $bin_plus_2_add.i25.3$2), (if p44$2 then $bin_plus_3_add.i26.0$2 else $bin_plus_3_add.i26.3$2);
    call {:sourceloc} {:sourceloc_num 59} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v55$1, 31bv32))} {:parts 1} {:part 1} _LOG_ATOMIC_$$histo_main_kernel.sub_histo(p45$1, BV32_SDIV(BV32_ADD(BV32_MUL(v53$1, 1024bv32), BV32_MUL(v54$1, 4bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 59} {:atomic} {:atomic_function "__bugle_atomic_add_local_uint"} {:arg1 BV32_SHL(1bv32, BV32_AND(v55$2, 31bv32))} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histo_main_kernel.sub_histo(p45$2, BV32_SDIV(BV32_ADD(BV32_MUL(v53$2, 1024bv32), BV32_MUL(v54$2, 4bv32)), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histo_main_kernel.sub_histo"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v57$1 := (if p45$1 then _HAVOC_bv32$1 else v57$1);
    v57$2 := (if p45$2 then _HAVOC_bv32$2 else v57$2);
    v58$1 := (if p45$1 then BV32_AND(BV32_LSHR(v57$1, BV32_AND(v55$1, 31bv32)), 255bv32) else v58$1);
    v58$2 := (if p45$2 then BV32_AND(BV32_LSHR(v57$2, BV32_AND(v55$2, 31bv32)), 255bv32) else v58$2);
    v59$1 := (if p45$1 then v58$1 == 255bv32 else v59$1);
    v59$2 := (if p45$2 then v58$2 == 255bv32 else v59$2);
    p47$1 := (if p45$1 && v59$1 then v59$1 else p47$1);
    p47$2 := (if p45$2 && v59$2 then v59$2 else p47$2);
    p46$1 := (if p45$1 && !v59$1 then !v59$1 else p46$1);
    p46$2 := (if p45$2 && !v59$2 then !v59$2 else p46$2);
    $bin_plus_1_add.i24.2$1, $bin_plus_2_add.i25.2$1, $bin_plus_3_add.i26.2$1 := (if p46$1 then $bin_plus_1_add.i24.0$1 else $bin_plus_1_add.i24.2$1), (if p46$1 then $bin_plus_2_add.i25.0$1 else $bin_plus_2_add.i25.2$1), (if p46$1 then $bin_plus_3_add.i26.0$1 else $bin_plus_3_add.i26.2$1);
    $bin_plus_1_add.i24.2$2, $bin_plus_2_add.i25.2$2, $bin_plus_3_add.i26.2$2 := (if p46$2 then $bin_plus_1_add.i24.0$2 else $bin_plus_1_add.i24.2$2), (if p46$2 then $bin_plus_2_add.i25.0$2 else $bin_plus_2_add.i25.2$2), (if p46$2 then $bin_plus_3_add.i26.0$2 else $bin_plus_3_add.i26.2$2);
    v60$1 := (if p47$1 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v52$1, 24576bv32), BV32_UDIV(v55$1, 8bv32)), BV32_SHL(v54$1, 2bv32)), BV32_SHL(v53$1, 10bv32)) else v60$1);
    v60$2 := (if p47$2 then BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(v52$2, 24576bv32), BV32_UDIV(v55$2, 8bv32)), BV32_SHL(v54$2, 2bv32)), BV32_SHL(v53$2, 10bv32)) else v60$2);
    v61$1 := (if p47$1 then BV32_ULT(v55$1, 24bv32) else v61$1);
    v61$2 := (if p47$2 then BV32_ULT(v55$2, 24bv32) else v61$2);
    v62$1 := (if p47$1 then BV32_ULT(v55$1, 16bv32) else v62$1);
    v62$2 := (if p47$2 then BV32_ULT(v55$2, 16bv32) else v62$2);
    v63$1 := (if p47$1 then BV32_ULT(v55$1, 8bv32) else v63$1);
    v63$2 := (if p47$2 then BV32_ULT(v55$2, 8bv32) else v63$2);
    v64$1 := (if p47$1 then BV32_AND(BV32_LSHR(v57$1, BV32_AND(BV32_ADD(v55$1, 8bv32), 31bv32)), 255bv32) else v64$1);
    v64$2 := (if p47$2 then BV32_AND(BV32_LSHR(v57$2, BV32_AND(BV32_ADD(v55$2, 8bv32), 31bv32)), 255bv32) else v64$2);
    v65$1 := (if p47$1 then BV32_AND(BV32_LSHR(v57$1, BV32_AND(BV32_ADD(v55$1, 16bv32), 31bv32)), 255bv32) else v65$1);
    v65$2 := (if p47$2 then BV32_AND(BV32_LSHR(v57$2, BV32_AND(BV32_ADD(v55$2, 16bv32), 31bv32)), 255bv32) else v65$2);
    p49$1 := (if p47$1 && v61$1 then v61$1 else p49$1);
    p49$2 := (if p47$2 && v61$2 then v61$2 else p49$2);
    p48$1 := (if p47$1 && !v61$1 then !v61$1 else p48$1);
    p48$2 := (if p47$2 && !v61$2 then !v61$2 else p48$2);
    $overflow_into_bin_plus_1.i18.0$1 := (if p48$1 then 0bv8 else $overflow_into_bin_plus_1.i18.0$1);
    $overflow_into_bin_plus_1.i18.0$2 := (if p48$2 then 0bv8 else $overflow_into_bin_plus_1.i18.0$2);
    v66$1 := (if p49$1 then v58$1 == 255bv32 else v66$1);
    v66$2 := (if p49$2 then v58$2 == 255bv32 else v66$2);
    p51$1 := (if p49$1 && v66$1 then v66$1 else p51$1);
    p51$2 := (if p49$2 && v66$2 then v66$2 else p51$2);
    p50$1 := (if p49$1 && !v66$1 then !v66$1 else p50$1);
    p50$2 := (if p49$2 && !v66$2 then !v66$2 else p50$2);
    $overflow_into_bin_plus_1.i18.0$1 := (if p50$1 then 0bv8 else $overflow_into_bin_plus_1.i18.0$1);
    $overflow_into_bin_plus_1.i18.0$2 := (if p50$2 then 0bv8 else $overflow_into_bin_plus_1.i18.0$2);
    $overflow_into_bin_plus_1.i18.0$1 := (if p51$1 then 1bv8 else $overflow_into_bin_plus_1.i18.0$1);
    $overflow_into_bin_plus_1.i18.0$2 := (if p51$2 then 1bv8 else $overflow_into_bin_plus_1.i18.0$2);
    p53$1 := (if p47$1 && v62$1 then v62$1 else p53$1);
    p53$2 := (if p47$2 && v62$2 then v62$2 else p53$2);
    p52$1 := (if p47$1 && !v62$1 then !v62$1 else p52$1);
    p52$2 := (if p47$2 && !v62$2 then !v62$2 else p52$2);
    $overflow_into_bin_plus_2.i19.0$1 := (if p52$1 then 0bv8 else $overflow_into_bin_plus_2.i19.0$1);
    $overflow_into_bin_plus_2.i19.0$2 := (if p52$2 then 0bv8 else $overflow_into_bin_plus_2.i19.0$2);
    v67$1 := (if p53$1 then v64$1 == 255bv32 else v67$1);
    v67$2 := (if p53$2 then v64$2 == 255bv32 else v67$2);
    p55$1 := (if p53$1 && v67$1 then v67$1 else p55$1);
    p55$2 := (if p53$2 && v67$2 then v67$2 else p55$2);
    p54$1 := (if p53$1 && !v67$1 then !v67$1 else p54$1);
    p54$2 := (if p53$2 && !v67$2 then !v67$2 else p54$2);
    $overflow_into_bin_plus_2.i19.0$1 := (if p54$1 then 0bv8 else $overflow_into_bin_plus_2.i19.0$1);
    $overflow_into_bin_plus_2.i19.0$2 := (if p54$2 then 0bv8 else $overflow_into_bin_plus_2.i19.0$2);
    $overflow_into_bin_plus_2.i19.0$1 := (if p55$1 then 1bv8 else $overflow_into_bin_plus_2.i19.0$1);
    $overflow_into_bin_plus_2.i19.0$2 := (if p55$2 then 1bv8 else $overflow_into_bin_plus_2.i19.0$2);
    p57$1 := (if p47$1 && v63$1 then v63$1 else p57$1);
    p57$2 := (if p47$2 && v63$2 then v63$2 else p57$2);
    p56$1 := (if p47$1 && !v63$1 then !v63$1 else p56$1);
    p56$2 := (if p47$2 && !v63$2 then !v63$2 else p56$2);
    $overflow_into_bin_plus_3.i20.0$1 := (if p56$1 then 0bv8 else $overflow_into_bin_plus_3.i20.0$1);
    $overflow_into_bin_plus_3.i20.0$2 := (if p56$2 then 0bv8 else $overflow_into_bin_plus_3.i20.0$2);
    v68$1 := (if p57$1 then v65$1 == 255bv32 else v68$1);
    v68$2 := (if p57$2 then v65$2 == 255bv32 else v68$2);
    p59$1 := (if p57$1 && v68$1 then v68$1 else p59$1);
    p59$2 := (if p57$2 && v68$2 then v68$2 else p59$2);
    p58$1 := (if p57$1 && !v68$1 then !v68$1 else p58$1);
    p58$2 := (if p57$2 && !v68$2 then !v68$2 else p58$2);
    $overflow_into_bin_plus_3.i20.0$1 := (if p58$1 then 0bv8 else $overflow_into_bin_plus_3.i20.0$1);
    $overflow_into_bin_plus_3.i20.0$2 := (if p58$2 then 0bv8 else $overflow_into_bin_plus_3.i20.0$2);
    $overflow_into_bin_plus_3.i20.0$1 := (if p59$1 then 1bv8 else $overflow_into_bin_plus_3.i20.0$1);
    $overflow_into_bin_plus_3.i20.0$2 := (if p59$2 then 1bv8 else $overflow_into_bin_plus_3.i20.0$2);
    p61$1 := (if p47$1 && $overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1 else p61$1);
    p61$2 := (if p47$2 && $overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1 else p61$2);
    p60$1 := (if p47$1 && !($overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1) else p60$1);
    p60$2 := (if p47$2 && !($overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1) else p60$2);
    $bin_plus_1_add.i24.1$1 := (if p60$1 then $bin_plus_1_add.i24.0$1 else $bin_plus_1_add.i24.1$1);
    $bin_plus_1_add.i24.1$2 := (if p60$2 then $bin_plus_1_add.i24.0$2 else $bin_plus_1_add.i24.1$2);
    $bin_plus_1_add.i24.1$1 := (if p61$1 then (if BV32_ULT(v64$1, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_1_add.i24.1$1);
    $bin_plus_1_add.i24.1$2 := (if p61$2 then (if BV32_ULT(v64$2, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_1_add.i24.1$2);
    p63$1 := (if p47$1 && $overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1 else p63$1);
    p63$2 := (if p47$2 && $overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1 else p63$2);
    p62$1 := (if p47$1 && !($overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1) else p62$1);
    p62$2 := (if p47$2 && !($overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1) else p62$2);
    $bin_plus_2_add.i25.1$1 := (if p62$1 then $bin_plus_2_add.i25.0$1 else $bin_plus_2_add.i25.1$1);
    $bin_plus_2_add.i25.1$2 := (if p62$2 then $bin_plus_2_add.i25.0$2 else $bin_plus_2_add.i25.1$2);
    $bin_plus_2_add.i25.1$1 := (if p63$1 then (if BV32_ULT(v65$1, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_2_add.i25.1$1);
    $bin_plus_2_add.i25.1$2 := (if p63$2 then (if BV32_ULT(v65$2, 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_2_add.i25.1$2);
    p65$1 := (if p47$1 && $overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1 else p65$1);
    p65$2 := (if p47$2 && $overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1 else p65$2);
    p64$1 := (if p47$1 && !($overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1) then !($overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1) else p64$1);
    p64$2 := (if p47$2 && !($overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1) then !($overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1) else p64$2);
    $bin_plus_3_add.i26.1$1 := (if p64$1 then $bin_plus_3_add.i26.0$1 else $bin_plus_3_add.i26.1$1);
    $bin_plus_3_add.i26.1$2 := (if p64$2 then $bin_plus_3_add.i26.0$2 else $bin_plus_3_add.i26.1$2);
    $bin_plus_3_add.i26.1$1 := (if p65$1 then (if BV32_ULT(BV32_AND(BV32_LSHR(v57$1, BV32_AND(BV32_ADD(v55$1, 24bv32), 31bv32)), 255bv32), 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_3_add.i26.1$1);
    $bin_plus_3_add.i26.1$2 := (if p65$2 then (if BV32_ULT(BV32_AND(BV32_LSHR(v57$2, BV32_AND(BV32_ADD(v55$2, 24bv32), 31bv32)), 255bv32), 255bv32) then 4294967295bv32 else 255bv32) else $bin_plus_3_add.i26.1$2);
    call {:sourceloc} {:sourceloc_num 76} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 256bv32} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p47$1, BV32_SDIV(BV32_MUL(v60$1, 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 76} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 256bv32} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p47$2, BV32_SDIV(BV32_MUL(v60$2, 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v69$1 := (if p47$1 then _HAVOC_bv32$1 else v69$1);
    v69$2 := (if p47$2 then _HAVOC_bv32$2 else v69$2);
    p67$1 := (if p47$1 && $overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_1.i18.0$1[1:0] == 1bv1 else p67$1);
    p67$2 := (if p47$2 && $overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_1.i18.0$2[1:0] == 1bv1 else p67$2);
    call {:sourceloc} {:sourceloc_num 78} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_1_add.i24.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p67$1, BV32_SDIV(BV32_MUL(BV32_ADD(v60$1, 1bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 78} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_1_add.i24.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p67$2, BV32_SDIV(BV32_MUL(BV32_ADD(v60$2, 1bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v70$1 := (if p67$1 then _HAVOC_bv32$1 else v70$1);
    v70$2 := (if p67$2 then _HAVOC_bv32$2 else v70$2);
    p69$1 := (if p47$1 && $overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_2.i19.0$1[1:0] == 1bv1 else p69$1);
    p69$2 := (if p47$2 && $overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_2.i19.0$2[1:0] == 1bv1 else p69$2);
    call {:sourceloc} {:sourceloc_num 81} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_2_add.i25.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p69$1, BV32_SDIV(BV32_MUL(BV32_ADD(v60$1, 2bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 81} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_2_add.i25.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p69$2, BV32_SDIV(BV32_MUL(BV32_ADD(v60$2, 2bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v71$1 := (if p69$1 then _HAVOC_bv32$1 else v71$1);
    v71$2 := (if p69$2 then _HAVOC_bv32$2 else v71$2);
    p71$1 := (if p47$1 && $overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1 then $overflow_into_bin_plus_3.i20.0$1[1:0] == 1bv1 else p71$1);
    p71$2 := (if p47$2 && $overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1 then $overflow_into_bin_plus_3.i20.0$2[1:0] == 1bv1 else p71$2);
    call {:sourceloc} {:sourceloc_num 84} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_3_add.i26.1$1} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_overflow(p71$1, BV32_SDIV(BV32_MUL(BV32_ADD(v60$1, 3bv32), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 84} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 $bin_plus_3_add.i26.1$2} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_overflow(p71$2, BV32_SDIV(BV32_MUL(BV32_ADD(v60$2, 3bv32), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_overflow"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v72$1 := (if p71$1 then _HAVOC_bv32$1 else v72$1);
    v72$2 := (if p71$2 then _HAVOC_bv32$2 else v72$2);
    $bin_plus_1_add.i24.2$1, $bin_plus_2_add.i25.2$1, $bin_plus_3_add.i26.2$1 := (if p47$1 then $bin_plus_1_add.i24.1$1 else $bin_plus_1_add.i24.2$1), (if p47$1 then $bin_plus_2_add.i25.1$1 else $bin_plus_2_add.i25.2$1), (if p47$1 then $bin_plus_3_add.i26.1$1 else $bin_plus_3_add.i26.2$1);
    $bin_plus_1_add.i24.2$2, $bin_plus_2_add.i25.2$2, $bin_plus_3_add.i26.2$2 := (if p47$2 then $bin_plus_1_add.i24.1$2 else $bin_plus_1_add.i24.2$2), (if p47$2 then $bin_plus_2_add.i25.1$2 else $bin_plus_2_add.i25.2$2), (if p47$2 then $bin_plus_3_add.i26.1$2 else $bin_plus_3_add.i26.2$2);
    $bin_plus_1_add.i24.3$1, $bin_plus_2_add.i25.3$1, $bin_plus_3_add.i26.3$1 := (if p45$1 then $bin_plus_1_add.i24.2$1 else $bin_plus_1_add.i24.3$1), (if p45$1 then $bin_plus_2_add.i25.2$1 else $bin_plus_2_add.i25.3$1), (if p45$1 then $bin_plus_3_add.i26.2$1 else $bin_plus_3_add.i26.3$1);
    $bin_plus_1_add.i24.3$2, $bin_plus_2_add.i25.3$2, $bin_plus_3_add.i26.3$2 := (if p45$2 then $bin_plus_1_add.i24.2$2 else $bin_plus_1_add.i24.3$2), (if p45$2 then $bin_plus_2_add.i25.2$2 else $bin_plus_2_add.i25.3$2), (if p45$2 then $bin_plus_3_add.i26.2$2 else $bin_plus_3_add.i26.3$2);
    $bin_plus_1_add.i24.0$1, $bin_plus_2_add.i25.0$1, $bin_plus_3_add.i26.0$1, $local_scan_load.1$1 := (if p43$1 then $bin_plus_1_add.i24.3$1 else $bin_plus_1_add.i24.0$1), (if p43$1 then $bin_plus_2_add.i25.3$1 else $bin_plus_2_add.i25.0$1), (if p43$1 then $bin_plus_3_add.i26.3$1 else $bin_plus_3_add.i26.0$1), (if p43$1 then BV32_ADD($local_scan_load.1$1, BV32_MUL(v0, v1)) else $local_scan_load.1$1);
    $bin_plus_1_add.i24.0$2, $bin_plus_2_add.i25.0$2, $bin_plus_3_add.i26.0$2, $local_scan_load.1$2 := (if p43$2 then $bin_plus_1_add.i24.3$2 else $bin_plus_1_add.i24.0$2), (if p43$2 then $bin_plus_2_add.i25.3$2 else $bin_plus_2_add.i25.0$2), (if p43$2 then $bin_plus_3_add.i26.3$2 else $bin_plus_3_add.i26.0$2), (if p43$2 then BV32_ADD($local_scan_load.1$2, BV32_MUL(v0, v1)) else $local_scan_load.1$2);
    p42$1 := (if p43$1 then true else p42$1);
    p42$2 := (if p43$2 then true else p42$2);
    goto $36.backedge, __partitioned_block_$36.tail_0;

  __partitioned_block_$36.tail_0:
    assume !p42$1 && !p42$2;
    goto __partitioned_block_$36.tail_1;

  __partitioned_block_$36.tail_1:
    call {:sourceloc_num 89} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    $i.i28.0$1 := local_id_x$1;
    $i.i28.0$2 := local_id_x$2;
    p72$1 := true;
    p72$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $64;

  $64:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 90} p72$1 ==> true;
    v73$1 := (if p72$1 then BV32_SLT($i.i28.0$1, 6144bv32) else v73$1);
    v73$2 := (if p72$2 then BV32_SLT($i.i28.0$2, 6144bv32) else v73$2);
    p73$1 := false;
    p73$2 := false;
    p73$1 := (if p72$1 && v73$1 then v73$1 else p73$1);
    p73$2 := (if p72$2 && v73$2 then v73$2 else p73$2);
    p72$1 := (if p72$1 && !v73$1 then v73$1 else p72$1);
    p72$2 := (if p72$2 && !v73$2 then v73$2 else p72$2);
    call {:sourceloc} {:sourceloc_num 92} _LOG_READ_$$histo_main_kernel.sub_histo(p73$1, $i.i28.0$1, $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 92} _CHECK_READ_$$histo_main_kernel.sub_histo(p73$2, $i.i28.0$2, $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_main_kernel.sub_histo"} true;
    v74$1 := (if p73$1 then $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1] else v74$1);
    v74$2 := (if p73$2 then $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2] else v74$2);
    call {:sourceloc} {:sourceloc_num 93} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(v74$1, 255bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_subhisto(p73$1, BV32_SDIV(BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$1, 4bv32), 4bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 93} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(v74$2, 255bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_subhisto(p73$2, BV32_SDIV(BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$2, 4bv32), 4bv32)), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_subhisto"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v75$1 := (if p73$1 then _HAVOC_bv32$1 else v75$1);
    v75$2 := (if p73$2 then _HAVOC_bv32$2 else v75$2);
    call {:sourceloc} {:sourceloc_num 94} _LOG_READ_$$histo_main_kernel.sub_histo(p73$1, $i.i28.0$1, $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 94} _CHECK_READ_$$histo_main_kernel.sub_histo(p73$2, $i.i28.0$2, $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_main_kernel.sub_histo"} true;
    v76$1 := (if p73$1 then $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1] else v76$1);
    v76$2 := (if p73$2 then $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2] else v76$2);
    call {:sourceloc} {:sourceloc_num 95} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v76$1, 8bv32), 255bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_subhisto(p73$1, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$1, 4bv32), 4bv32)), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 95} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v76$2, 8bv32), 255bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_subhisto(p73$2, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$2, 4bv32), 4bv32)), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_subhisto"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v77$1 := (if p73$1 then _HAVOC_bv32$1 else v77$1);
    v77$2 := (if p73$2 then _HAVOC_bv32$2 else v77$2);
    call {:sourceloc} {:sourceloc_num 96} _LOG_READ_$$histo_main_kernel.sub_histo(p73$1, $i.i28.0$1, $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 96} _CHECK_READ_$$histo_main_kernel.sub_histo(p73$2, $i.i28.0$2, $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_main_kernel.sub_histo"} true;
    v78$1 := (if p73$1 then $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1] else v78$1);
    v78$2 := (if p73$2 then $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2] else v78$2);
    call {:sourceloc} {:sourceloc_num 97} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v78$1, 16bv32), 255bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_subhisto(p73$1, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$1, 4bv32), 4bv32)), 8bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 97} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v78$2, 16bv32), 255bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_subhisto(p73$2, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$2, 4bv32), 4bv32)), 8bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_subhisto"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v79$1 := (if p73$1 then _HAVOC_bv32$1 else v79$1);
    v79$2 := (if p73$2 then _HAVOC_bv32$2 else v79$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_READ_$$histo_main_kernel.sub_histo(p73$1, $i.i28.0$1, $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 98} _CHECK_READ_$$histo_main_kernel.sub_histo(p73$2, $i.i28.0$2, $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_main_kernel.sub_histo"} true;
    v80$1 := (if p73$1 then $$histo_main_kernel.sub_histo[1bv1][$i.i28.0$1] else v80$1);
    v80$2 := (if p73$2 then $$histo_main_kernel.sub_histo[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$i.i28.0$2] else v80$2);
    call {:sourceloc} {:sourceloc_num 99} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v80$1, 24bv32), 255bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$global_subhisto(p73$1, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$1, 4bv32), 4bv32)), 12bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 99} {:atomic} {:atomic_function "__bugle_atomic_add_global_uint"} {:arg1 BV32_AND(BV32_LSHR(v80$2, 24bv32), 255bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$global_subhisto(p73$2, BV32_SDIV(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 24576bv32), 4bv32), BV32_MUL(BV32_MUL($i.i28.0$2, 4bv32), 4bv32)), 12bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$global_subhisto"} true;
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v81$1 := (if p73$1 then _HAVOC_bv32$1 else v81$1);
    v81$2 := (if p73$2 then _HAVOC_bv32$2 else v81$2);
    $i.i28.0$1 := (if p73$1 then BV32_ADD($i.i28.0$1, group_size_x) else $i.i28.0$1);
    $i.i28.0$2 := (if p73$2 then BV32_ADD($i.i28.0$2, group_size_x) else $i.i28.0$2);
    p72$1 := (if p73$1 then true else p72$1);
    p72$2 := (if p73$2 then true else p72$2);
    goto $64.backedge, $64.tail;

  $64.tail:
    assume !p72$1 && !p72$2;
    return;

  $64.backedge:
    assume {:backedge} p72$1 || p72$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $64;

  $36.backedge:
    assume {:backedge} p42$1 || p42$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $36;

  $4.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $4;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 768bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 14bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$histo_main_kernel.sub_histo, $$global_subhisto, $$global_histo, $$global_overflow, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$histo_main_kernel.sub_histo, $$global_subhisto, $$global_histo, $$global_overflow, _TRACKING;



const _WATCHED_VALUE_$$sm_mappings: bv8;

procedure {:inline 1} _LOG_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$sm_mappings;



implementation {:inline 1} _LOG_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then true else _READ_HAS_OCCURRED_$$sm_mappings);
    return;
}



procedure _CHECK_READ_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sm_mappings: bool;

procedure {:inline 1} _LOG_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$sm_mappings, _WRITE_READ_BENIGN_FLAG_$$sm_mappings;



implementation {:inline 1} _LOG_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then true else _WRITE_HAS_OCCURRED_$$sm_mappings);
    _WRITE_READ_BENIGN_FLAG_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
    return;
}



procedure _CHECK_WRITE_$$sm_mappings(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings != _value);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sm_mappings != _value);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sm_mappings;



implementation {:inline 1} _LOG_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sm_mappings := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sm_mappings);
    return;
}



procedure _CHECK_ATOMIC_$$sm_mappings(_P: bool, _offset: bv32);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);
  requires {:source_name "sm_mappings"} {:array "$$sm_mappings"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sm_mappings;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sm_mappings(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sm_mappings := (if _P && _WRITE_HAS_OCCURRED_$$sm_mappings && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sm_mappings);
    return;
}



const _WATCHED_VALUE_$$global_subhisto: bv32;

procedure {:inline 1} _LOG_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$global_subhisto;



implementation {:inline 1} _LOG_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then true else _READ_HAS_OCCURRED_$$global_subhisto);
    return;
}



procedure _CHECK_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_subhisto: bool;

procedure {:inline 1} _LOG_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$global_subhisto, _WRITE_READ_BENIGN_FLAG_$$global_subhisto;



implementation {:inline 1} _LOG_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then true else _WRITE_HAS_OCCURRED_$$global_subhisto);
    _WRITE_READ_BENIGN_FLAG_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
    return;
}



procedure _CHECK_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto != _value);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto != _value);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_subhisto;



implementation {:inline 1} _LOG_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_subhisto);
    return;
}



procedure _CHECK_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_subhisto(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_subhisto;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_subhisto(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_subhisto := (if _P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
    return;
}



const _WATCHED_VALUE_$$global_histo: bv32;

procedure {:inline 1} _LOG_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$global_histo;



implementation {:inline 1} _LOG_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then true else _READ_HAS_OCCURRED_$$global_histo);
    return;
}



procedure _CHECK_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_histo);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_histo: bool;

procedure {:inline 1} _LOG_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$global_histo, _WRITE_READ_BENIGN_FLAG_$$global_histo;



implementation {:inline 1} _LOG_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then true else _WRITE_HAS_OCCURRED_$$global_histo);
    _WRITE_READ_BENIGN_FLAG_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_histo);
    return;
}



procedure _CHECK_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo != _value);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo != _value);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_histo(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_histo;



implementation {:inline 1} _LOG_ATOMIC_$$global_histo(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_histo);
    return;
}



procedure _CHECK_ATOMIC_$$global_histo(_P: bool, _offset: bv32);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_histo;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_histo := (if _P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_histo);
    return;
}



const _WATCHED_VALUE_$$global_overflow: bv32;

procedure {:inline 1} _LOG_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$global_overflow;



implementation {:inline 1} _LOG_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then true else _READ_HAS_OCCURRED_$$global_overflow);
    return;
}



procedure _CHECK_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_overflow);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_overflow: bool;

procedure {:inline 1} _LOG_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$global_overflow, _WRITE_READ_BENIGN_FLAG_$$global_overflow;



implementation {:inline 1} _LOG_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then true else _WRITE_HAS_OCCURRED_$$global_overflow);
    _WRITE_READ_BENIGN_FLAG_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_overflow);
    return;
}



procedure _CHECK_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow != _value);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow != _value);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_overflow(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_overflow;



implementation {:inline 1} _LOG_ATOMIC_$$global_overflow(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_overflow);
    return;
}



procedure _CHECK_ATOMIC_$$global_overflow(_P: bool, _offset: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_overflow;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_overflow := (if _P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_overflow);
    return;
}



const _WATCHED_VALUE_$$histo_main_kernel.sub_histo: bv32;

procedure {:inline 1} _LOG_READ_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo;



implementation {:inline 1} _LOG_READ_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_main_kernel.sub_histo == _value then true else _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo);
    return;
}



procedure _CHECK_READ_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo: bool;

procedure {:inline 1} _LOG_WRITE_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo, _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo;



implementation {:inline 1} _LOG_WRITE_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_main_kernel.sub_histo == _value then true else _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo);
    _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_main_kernel.sub_histo == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo);
    return;
}



procedure _CHECK_WRITE_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_main_kernel.sub_histo != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_main_kernel.sub_histo != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo;



implementation {:inline 1} _LOG_ATOMIC_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo);
    return;
}



procedure _CHECK_ATOMIC_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sub_histo"} {:array "$$histo_main_kernel.sub_histo"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo := (if _P && _WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histo_main_kernel.sub_histo);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    goto anon1;

  anon1:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_subhisto;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_subhisto;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_subhisto;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_histo;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_histo;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_histo;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_overflow;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_overflow;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_overflow;
    goto anon6;

  anon6:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$global_subhisto;
    goto anon8;

  anon8:
    havoc $$global_histo;
    goto anon9;

  anon9:
    havoc $$global_overflow;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$histo_main_kernel.sub_histo;
    goto anon3;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histo_main_kernel.sub_histo;
    goto anon1;

  anon1:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_subhisto;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_subhisto;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_subhisto;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_histo;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_histo;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_histo;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$global_overflow;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$global_overflow;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$global_overflow;
    goto anon6;

  anon6:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$global_subhisto;
    goto anon8;

  anon8:
    havoc $$global_histo;
    goto anon9;

  anon9:
    havoc $$global_overflow;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$histo_main_kernel.sub_histo;
    goto anon3;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
