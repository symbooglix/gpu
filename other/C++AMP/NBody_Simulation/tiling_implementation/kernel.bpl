type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$data_in_pos"} {:global} {:elem_width 32} {:source_name "data_in_pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_in_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_in_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_in_pos: bool;

axiom {:array_info "$$data_in_vel"} {:global} {:elem_width 32} {:source_name "data_in_vel"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_in_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_in_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_in_vel: bool;

var {:source_name "data_out_pos"} {:global} $$data_out_pos: [bv32]bv32;

axiom {:array_info "$$data_out_pos"} {:global} {:elem_width 32} {:source_name "data_out_pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_out_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_out_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_out_pos: bool;

var {:source_name "data_out_vel"} {:global} $$data_out_vel: [bv32]bv32;

axiom {:array_info "$$data_out_vel"} {:global} {:elem_width 32} {:source_name "data_out_vel"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_out_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_out_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_out_vel: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i35"} {:elem_width 32} {:source_name "b.i35"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i34"} {:elem_width 32} {:source_name "a.i34"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i23"} {:elem_width 32} {:source_name "a.i2.i23"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i1.i24"} {:elem_width 32} {:source_name "b.i1.i24"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i25"} {:elem_width 32} {:source_name "a.i.i25"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i26"} {:elem_width 32} {:source_name "b.i.i26"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$my_curr_pos.i27"} {:elem_width 32} {:source_name "my_curr_pos.i27"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$other_element_old_pos.i28"} {:elem_width 32} {:source_name "other_element_old_pos.i28"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i29"} {:elem_width 32} {:source_name "r.i29"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i12"} {:elem_width 32} {:source_name "a.i2.i12"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i1.i13"} {:elem_width 32} {:source_name "b.i1.i13"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i14"} {:elem_width 32} {:source_name "a.i.i14"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i15"} {:elem_width 32} {:source_name "b.i.i15"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$my_curr_pos.i16"} {:elem_width 32} {:source_name "my_curr_pos.i16"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$other_element_old_pos.i17"} {:elem_width 32} {:source_name "other_element_old_pos.i17"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i18"} {:elem_width 32} {:source_name "r.i18"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i1"} {:elem_width 32} {:source_name "a.i2.i1"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i1.i2"} {:elem_width 32} {:source_name "b.i1.i2"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i3"} {:elem_width 32} {:source_name "a.i.i3"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i4"} {:elem_width 32} {:source_name "b.i.i4"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$my_curr_pos.i5"} {:elem_width 32} {:source_name "my_curr_pos.i5"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$other_element_old_pos.i6"} {:elem_width 32} {:source_name "other_element_old_pos.i6"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i7"} {:elem_width 32} {:source_name "r.i7"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$36"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$37"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$38"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$39"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$40"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$41"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i"} {:elem_width 32} {:source_name "a.i2.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$42"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i1.i"} {:elem_width 32} {:source_name "b.i1.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$43"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$44"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$45"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i"} {:elem_width 32} {:source_name "a.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i"} {:elem_width 32} {:source_name "b.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$my_curr_pos.i"} {:elem_width 32} {:source_name "my_curr_pos.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$other_element_old_pos.i"} {:elem_width 32} {:source_name "other_element_old_pos.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i"} {:elem_width 32} {:source_name "r.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$46"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$47"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$48"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$49"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$p_pos"} {:elem_width 32} {:source_name "p_pos"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$p_vel"} {:elem_width 32} {:source_name "p_vel"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$acc"} {:elem_width 32} {:source_name "acc"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$50"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$51"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$52"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$53"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$54"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$55"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$56"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$57"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$58"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$59"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$60"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$61"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "tile_mem"} {:group_shared} $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:group_shared} {:elem_width 32} {:source_name "tile_mem"} {:source_elem_width 128} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: bool;

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

function FMUL32(bv32, bv32) : bv32;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FRSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "tiling_implementation"} {:kernel} $_Z21tiling_implementationP6float4S0_S0_S0_iii($offset: bv32, $size: bv32, $num_bodies: bv32);
  requires !_READ_HAS_OCCURRED_$$data_in_pos && !_WRITE_HAS_OCCURRED_$$data_in_pos && !_ATOMIC_HAS_OCCURRED_$$data_in_pos;
  requires !_READ_HAS_OCCURRED_$$data_in_vel && !_WRITE_HAS_OCCURRED_$$data_in_vel && !_ATOMIC_HAS_OCCURRED_$$data_in_vel;
  requires !_READ_HAS_OCCURRED_$$data_out_pos && !_WRITE_HAS_OCCURRED_$$data_out_pos && !_ATOMIC_HAS_OCCURRED_$$data_out_pos;
  requires !_READ_HAS_OCCURRED_$$data_out_vel && !_WRITE_HAS_OCCURRED_$$data_out_vel && !_ATOMIC_HAS_OCCURRED_$$data_out_vel;
  requires !_READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && !_WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && !_ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
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
  modifies $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, _WRITE_HAS_OCCURRED_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos, _WRITE_HAS_OCCURRED_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel, _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, $$data_out_pos, $$data_out_vel, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;



implementation {:source_name "tiling_implementation"} {:kernel} $_Z21tiling_implementationP6float4S0_S0_S0_iii($offset: bv32, $size: bv32, $num_bodies: bv32)
{
  var $particle_idx.0$1: bv32;
  var $particle_idx.0$2: bv32;
  var $tile.0: bv32;
  var $j.0: bv32;
  var v9: bool;
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
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14: bool;
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
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
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
  var v46$1: bv32;
  var v46$2: bv32;
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
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
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
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v69$1: bv32;
  var v69$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v73$1: bv32;
  var v73$2: bv32;
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
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bv32;
  var v83$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
  var v87$1: bv32;
  var v87$2: bv32;
  var v88$1: bv32;
  var v88$2: bv32;
  var v89$1: bv32;
  var v89$2: bv32;
  var v90$1: bv32;
  var v90$2: bv32;
  var v91$1: bv32;
  var v91$2: bv32;
  var v92$1: bv32;
  var v92$2: bv32;
  var v93$1: bv32;
  var v93$2: bv32;
  var v94$1: bv32;
  var v94$2: bv32;
  var v176$1: bv32;
  var v176$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v98$1: bv32;
  var v98$2: bv32;
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
  var v101$1: bv32;
  var v101$2: bv32;
  var v102$1: bv32;
  var v102$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv32;
  var v104$2: bv32;
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
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v113$1: bv32;
  var v113$2: bv32;
  var v114$1: bv32;
  var v114$2: bv32;
  var v115$1: bv32;
  var v115$2: bv32;
  var v116$1: bv32;
  var v116$2: bv32;
  var v117$1: bv32;
  var v117$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v119$1: bv32;
  var v119$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121$1: bv32;
  var v121$2: bv32;
  var v122$1: bv32;
  var v122$2: bv32;
  var v123$1: bv32;
  var v123$2: bv32;
  var v124$1: bv32;
  var v124$2: bv32;
  var v125$1: bv32;
  var v125$2: bv32;
  var v126$1: bv32;
  var v126$2: bv32;
  var v127$1: bv32;
  var v127$2: bv32;
  var v128$1: bv32;
  var v128$2: bv32;
  var v129$1: bv32;
  var v129$2: bv32;
  var v130$1: bv32;
  var v130$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
  var v131$1: bv32;
  var v131$2: bv32;
  var v134$1: bv32;
  var v134$2: bv32;
  var v135$1: bv32;
  var v135$2: bv32;
  var v136$1: bv32;
  var v136$2: bv32;
  var v137$1: bv32;
  var v137$2: bv32;
  var v138$1: bv32;
  var v138$2: bv32;
  var v139$1: bv32;
  var v139$2: bv32;
  var v140$1: bv32;
  var v140$2: bv32;
  var v141$1: bv32;
  var v141$2: bv32;
  var v142$1: bv32;
  var v142$2: bv32;
  var v143$1: bv32;
  var v143$2: bv32;
  var v144$1: bv32;
  var v144$2: bv32;
  var v145$1: bv32;
  var v145$2: bv32;
  var v146$1: bv32;
  var v146$2: bv32;
  var v147$1: bv32;
  var v147$2: bv32;
  var v148$1: bv32;
  var v148$2: bv32;
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
  var v155$1: bv32;
  var v155$2: bv32;
  var v156$1: bv32;
  var v156$2: bv32;
  var v157$1: bv32;
  var v157$2: bv32;
  var v158$1: bv32;
  var v158$2: bv32;
  var v159$1: bv32;
  var v159$2: bv32;
  var v160$1: bv32;
  var v160$2: bv32;
  var v161$1: bv32;
  var v161$2: bv32;
  var v162$1: bv32;
  var v162$2: bv32;
  var v163$1: bv32;
  var v163$2: bv32;
  var v164$1: bv32;
  var v164$2: bv32;
  var v165$1: bv32;
  var v165$2: bv32;
  var v166$1: bv32;
  var v166$2: bv32;
  var v168$1: bv32;
  var v168$2: bv32;
  var v167$1: bv32;
  var v167$2: bv32;
  var v169$1: bv32;
  var v169$2: bv32;
  var v170$1: bv32;
  var v170$2: bv32;
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
  var v335$1: bv32;
  var v335$2: bv32;
  var v177$1: bv32;
  var v177$2: bv32;
  var v178$1: bv32;
  var v178$2: bv32;
  var v179$1: bv32;
  var v179$2: bv32;
  var v180$1: bv32;
  var v180$2: bv32;
  var v181$1: bv32;
  var v181$2: bv32;
  var v182$1: bv32;
  var v182$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
  var v190$1: bv32;
  var v190$2: bv32;
  var v191$1: bv32;
  var v191$2: bv32;
  var v192$1: bv32;
  var v192$2: bv32;
  var v193$1: bv32;
  var v193$2: bv32;
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
  var v203$1: bv32;
  var v203$2: bv32;
  var v204$1: bv32;
  var v204$2: bv32;
  var v205$1: bv32;
  var v205$2: bv32;
  var v206$1: bv32;
  var v206$2: bv32;
  var v207$1: bv32;
  var v207$2: bv32;
  var v208$1: bv32;
  var v208$2: bv32;
  var v209$1: bv32;
  var v209$2: bv32;
  var v210$1: bv32;
  var v210$2: bv32;
  var v211$1: bv32;
  var v211$2: bv32;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv32;
  var v213$2: bv32;
  var v214$1: bv32;
  var v214$2: bv32;
  var v215$1: bv32;
  var v215$2: bv32;
  var v216$1: bv32;
  var v216$2: bv32;
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
  var v228$1: bv32;
  var v228$2: bv32;
  var v229$1: bv32;
  var v229$2: bv32;
  var v227$1: bv32;
  var v227$2: bv32;
  var v230$1: bv32;
  var v230$2: bv32;
  var v231$1: bv32;
  var v231$2: bv32;
  var v232$1: bv32;
  var v232$2: bv32;
  var v233$1: bv32;
  var v233$2: bv32;
  var v234$1: bv32;
  var v234$2: bv32;
  var v235$1: bv32;
  var v235$2: bv32;
  var v236$1: bv32;
  var v236$2: bv32;
  var v237$1: bv32;
  var v237$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
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
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251$1: bv32;
  var v251$2: bv32;
  var v252$1: bv32;
  var v252$2: bv32;
  var v253$1: bv32;
  var v253$2: bv32;
  var v254$1: bv32;
  var v254$2: bv32;
  var v255$1: bv32;
  var v255$2: bv32;
  var v256$1: bv32;
  var v256$2: bv32;
  var v257$1: bv32;
  var v257$2: bv32;
  var v258$1: bv32;
  var v258$2: bv32;
  var v259$1: bv32;
  var v259$2: bv32;
  var v260$1: bv32;
  var v260$2: bv32;
  var v261$1: bv32;
  var v261$2: bv32;
  var v262$1: bv32;
  var v262$2: bv32;
  var v264$1: bv32;
  var v264$2: bv32;
  var v263$1: bv32;
  var v263$2: bv32;
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
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v273$1: bv32;
  var v273$2: bv32;
  var v274$1: bv32;
  var v274$2: bv32;
  var v275$1: bv32;
  var v275$2: bv32;
  var v276$1: bv32;
  var v276$2: bv32;
  var v277$1: bv32;
  var v277$2: bv32;
  var v278$1: bv32;
  var v278$2: bv32;
  var v279$1: bv32;
  var v279$2: bv32;
  var v280$1: bv32;
  var v280$2: bv32;
  var v281$1: bv32;
  var v281$2: bv32;
  var v282$1: bv32;
  var v282$2: bv32;
  var v283$1: bv32;
  var v283$2: bv32;
  var v284$1: bv32;
  var v284$2: bv32;
  var v285$1: bv32;
  var v285$2: bv32;
  var v286$1: bv32;
  var v286$2: bv32;
  var v287$1: bv32;
  var v287$2: bv32;
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
  var v296$1: bv32;
  var v296$2: bv32;
  var v297$1: bv32;
  var v297$2: bv32;
  var v298$1: bv32;
  var v298$2: bv32;
  var v299$1: bv32;
  var v299$2: bv32;
  var v300$1: bv32;
  var v300$2: bv32;
  var v301$1: bv32;
  var v301$2: bv32;
  var v302$1: bv32;
  var v302$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v305$1: bv32;
  var v305$2: bv32;
  var v306$1: bv32;
  var v306$2: bv32;
  var v307$1: bv32;
  var v307$2: bv32;
  var v308$1: bv32;
  var v308$2: bv32;
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
  var v319$1: bv32;
  var v319$2: bv32;
  var v320$1: bv32;
  var v320$2: bv32;
  var v321$1: bv32;
  var v321$2: bv32;
  var v322$1: bv32;
  var v322$2: bv32;
  var v324$1: bv32;
  var v324$2: bv32;
  var v325$1: bv32;
  var v325$2: bv32;
  var v323$1: bv32;
  var v323$2: bv32;
  var v326$1: bv32;
  var v326$2: bv32;
  var v327$1: bv32;
  var v327$2: bv32;
  var v328$1: bv32;
  var v328$2: bv32;
  var v329$1: bv32;
  var v329$2: bv32;
  var v330$1: bv32;
  var v330$2: bv32;
  var v331$1: bv32;
  var v331$2: bv32;
  var v332$1: bv32;
  var v332$2: bv32;
  var v333$1: bv32;
  var v333$2: bv32;
  var v334$1: bv32;
  var v334$2: bv32;
  var v336$1: bv32;
  var v336$2: bv32;
  var v337$1: bv32;
  var v337$2: bv32;
  var v338$1: bv32;
  var v338$2: bv32;
  var v339$1: bv32;
  var v339$2: bv32;
  var v340$1: bv32;
  var v340$2: bv32;
  var v341$1: bv32;
  var v341$2: bv32;
  var v342$1: bv32;
  var v342$2: bv32;
  var v343$1: bv32;
  var v343$2: bv32;
  var v344$1: bv32;
  var v344$2: bv32;
  var v345$1: bv32;
  var v345$2: bv32;
  var v346$1: bv32;
  var v346$2: bv32;
  var v347$1: bv32;
  var v347$2: bv32;
  var v348$1: bv32;
  var v348$2: bv32;
  var v349$1: bv32;
  var v349$2: bv32;
  var v350$1: bv32;
  var v350$2: bv32;
  var v351$1: bv32;
  var v351$2: bv32;
  var v352$1: bv32;
  var v352$2: bv32;
  var v353$1: bv32;
  var v353$2: bv32;
  var v354$1: bv32;
  var v354$2: bv32;
  var v355$1: bv32;
  var v355$2: bv32;
  var v356$1: bv32;
  var v356$2: bv32;
  var v357$1: bv32;
  var v357$2: bv32;
  var v358$1: bv32;
  var v358$2: bv32;
  var v360$1: bv32;
  var v360$2: bv32;
  var v359$1: bv32;
  var v359$2: bv32;
  var v361$1: bv32;
  var v361$2: bv32;
  var v362$1: bv32;
  var v362$2: bv32;
  var v363$1: bv32;
  var v363$2: bv32;
  var v364$1: bv32;
  var v364$2: bv32;
  var v365$1: bv32;
  var v365$2: bv32;
  var v366$1: bv32;
  var v366$2: bv32;
  var v367$1: bv32;
  var v367$2: bv32;
  var v368$1: bv32;
  var v368$2: bv32;
  var v369$1: bv32;
  var v369$2: bv32;
  var v370$1: bv32;
  var v370$2: bv32;
  var v371$1: bv32;
  var v371$2: bv32;
  var v372$1: bv32;
  var v372$2: bv32;
  var v373$1: bv32;
  var v373$2: bv32;
  var v374$1: bv32;
  var v374$2: bv32;
  var v375$1: bv32;
  var v375$2: bv32;
  var v376$1: bv32;
  var v376$2: bv32;
  var v377$1: bv32;
  var v377$2: bv32;
  var v378$1: bv32;
  var v378$2: bv32;
  var v379$1: bv32;
  var v379$2: bv32;
  var v380$1: bv32;
  var v380$2: bv32;
  var v381$1: bv32;
  var v381$2: bv32;
  var v382$1: bv32;
  var v382$2: bv32;
  var v383$1: bv32;
  var v383$2: bv32;
  var v384$1: bv32;
  var v384$2: bv32;
  var v385$1: bv32;
  var v385$2: bv32;
  var v386$1: bv32;
  var v386$2: bv32;
  var v387$1: bv32;
  var v387$2: bv32;
  var v388$1: bv32;
  var v388$2: bv32;
  var v389$1: bv32;
  var v389$2: bv32;
  var v390$1: bv32;
  var v390$2: bv32;
  var v391$1: bv32;
  var v391$2: bv32;
  var v392$1: bv32;
  var v392$2: bv32;
  var v393$1: bv32;
  var v393$2: bv32;
  var v394$1: bv32;
  var v394$2: bv32;
  var v395$1: bv32;
  var v395$2: bv32;
  var v396$1: bv32;
  var v396$2: bv32;
  var v397$1: bv32;
  var v397$2: bv32;
  var v398$1: bv32;
  var v398$2: bv32;
  var v399$1: bv32;
  var v399$2: bv32;
  var v400$1: bv32;
  var v400$2: bv32;
  var v401$1: bv32;
  var v401$2: bv32;
  var v402$1: bv32;
  var v402$2: bv32;
  var v403$1: bv32;
  var v403$2: bv32;
  var v404$1: bv32;
  var v404$2: bv32;
  var v405$1: bv32;
  var v405$2: bv32;
  var v406$1: bv32;
  var v406$2: bv32;
  var v407$1: bv32;
  var v407$2: bv32;
  var v408$1: bv32;
  var v408$2: bv32;
  var v409$1: bv32;
  var v409$2: bv32;
  var v410$1: bv32;
  var v410$2: bv32;
  var v411$1: bv32;
  var v411$2: bv32;
  var v412$1: bv32;
  var v412$2: bv32;
  var v413$1: bv32;
  var v413$2: bv32;
  var v414$1: bv32;
  var v414$2: bv32;
  var v415$1: bv32;
  var v415$2: bv32;
  var v416$1: bv32;
  var v416$2: bv32;
  var v417$1: bv32;
  var v417$2: bv32;
  var v418$1: bv32;
  var v418$2: bv32;
  var v437$1: bv32;
  var v437$2: bv32;
  var v438$1: bv32;
  var v438$2: bv32;
  var v419$1: bv32;
  var v419$2: bv32;
  var v420$1: bv32;
  var v420$2: bv32;
  var v421$1: bv32;
  var v421$2: bv32;
  var v422$1: bv32;
  var v422$2: bv32;
  var v423$1: bv32;
  var v423$2: bv32;
  var v424$1: bv32;
  var v424$2: bv32;
  var v425$1: bv32;
  var v425$2: bv32;
  var v426$1: bv32;
  var v426$2: bv32;
  var v427$1: bv32;
  var v427$2: bv32;
  var v428$1: bv32;
  var v428$2: bv32;
  var v429$1: bv32;
  var v429$2: bv32;
  var v430$1: bv32;
  var v430$2: bv32;
  var v431$1: bv32;
  var v431$2: bv32;
  var v432$1: bv32;
  var v432$2: bv32;
  var v433$1: bv32;
  var v433$2: bv32;
  var v434$1: bv32;
  var v434$2: bv32;
  var v436$1: bv32;
  var v436$2: bv32;
  var v435$1: bv32;
  var v435$2: bv32;
  var v439$1: bv32;
  var v439$2: bv32;
  var v440$1: bv32;
  var v440$2: bv32;
  var v441$1: bv32;
  var v441$2: bv32;
  var v442$1: bv32;
  var v442$2: bv32;
  var v443$1: bv32;
  var v443$2: bv32;
  var v444$1: bv32;
  var v444$2: bv32;
  var v445$1: bv32;
  var v445$2: bv32;
  var v446$1: bv32;
  var v446$2: bv32;
  var v447$1: bv32;
  var v447$2: bv32;
  var v448$1: bv32;
  var v448$2: bv32;
  var v449$1: bv32;
  var v449$2: bv32;
  var v450$1: bv32;
  var v450$2: bv32;
  var v451$1: bv32;
  var v451$2: bv32;
  var v452$1: bv32;
  var v452$2: bv32;
  var v453$1: bv32;
  var v453$2: bv32;
  var v454$1: bv32;
  var v454$2: bv32;
  var v455$1: bv32;
  var v455$2: bv32;
  var v456$1: bv32;
  var v456$2: bv32;
  var v457$1: bv32;
  var v457$2: bv32;
  var v458$1: bv32;
  var v458$2: bv32;
  var v459$1: bv32;
  var v459$2: bv32;
  var v460$1: bv32;
  var v460$2: bv32;
  var v461$1: bv32;
  var v461$2: bv32;
  var v462$1: bv32;
  var v462$2: bv32;
  var v463$1: bv32;
  var v463$2: bv32;
  var v464$1: bv32;
  var v464$2: bv32;
  var v465$1: bv32;
  var v465$2: bv32;
  var v466$1: bv32;
  var v466$2: bv32;
  var v467$1: bv32;
  var v467$2: bv32;
  var v468$1: bv32;
  var v468$2: bv32;
  var v469$1: bv32;
  var v469$2: bv32;
  var v470$1: bv32;
  var v470$2: bv32;
  var v471$1: bv32;
  var v471$2: bv32;
  var v472$1: bv32;
  var v472$2: bv32;
  var v473$1: bv32;
  var v473$2: bv32;
  var v474$1: bv32;
  var v474$2: bv32;
  var v475$1: bv32;
  var v475$2: bv32;
  var v476$1: bv32;
  var v476$2: bv32;
  var v477$1: bv32;
  var v477$2: bv32;
  var v478$1: bv32;
  var v478$2: bv32;
  var v479$1: bv32;
  var v479$2: bv32;
  var v480$1: bv32;
  var v480$2: bv32;
  var v481$1: bv32;
  var v481$2: bv32;
  var v482$1: bv32;
  var v482$2: bv32;
  var v483$1: bv32;
  var v483$2: bv32;
  var v484$1: bv32;
  var v484$2: bv32;
  var v485$1: bv32;
  var v485$2: bv32;
  var v486$1: bv32;
  var v486$2: bv32;
  var v487$1: bv32;
  var v487$2: bv32;
  var v488$1: bv32;
  var v488$2: bv32;
  var v489$1: bv32;
  var v489$2: bv32;
  var v490$1: bv32;
  var v490$2: bv32;
  var v491$1: bv32;
  var v491$2: bv32;
  var v492$1: bv32;
  var v492$2: bv32;
  var v493$1: bv32;
  var v493$2: bv32;
  var v494$1: bv32;
  var v494$2: bv32;
  var v495$1: bv32;
  var v495$2: bv32;
  var v496$1: bv32;
  var v496$2: bv32;
  var v497$1: bv32;
  var v497$2: bv32;
  var v498$1: bv32;
  var v498$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $offset);
    v0$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $offset);
    havoc v1$1, v1$2;
    $$p_pos$0bv32$1 := v1$1;
    $$p_pos$0bv32$2 := v1$2;
    havoc v2$1, v2$2;
    $$p_pos$1bv32$1 := v2$1;
    $$p_pos$1bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$p_pos$2bv32$1 := v3$1;
    $$p_pos$2bv32$2 := v3$2;
    havoc v4$1, v4$2;
    $$p_pos$3bv32$1 := v4$1;
    $$p_pos$3bv32$2 := v4$2;
    havoc v5$1, v5$2;
    $$p_vel$0bv32$1 := v5$1;
    $$p_vel$0bv32$2 := v5$2;
    havoc v6$1, v6$2;
    $$p_vel$1bv32$1 := v6$1;
    $$p_vel$1bv32$2 := v6$2;
    havoc v7$1, v7$2;
    $$p_vel$2bv32$1 := v7$1;
    $$p_vel$2bv32$2 := v7$2;
    havoc v8$1, v8$2;
    $$p_vel$3bv32$1 := v8$1;
    $$p_vel$3bv32$2 := v8$2;
    $$acc$0bv32$1 := 0bv32;
    $$acc$0bv32$2 := 0bv32;
    $$acc$1bv32$1 := 0bv32;
    $$acc$1bv32$2 := 0bv32;
    $$acc$2bv32$1 := 0bv32;
    $$acc$2bv32$2 := 0bv32;
    $$acc$3bv32$1 := 0bv32;
    $$acc$3bv32$2 := 0bv32;
    $particle_idx.0$1, $tile.0 := local_id_x$1, 0bv32;
    $particle_idx.0$2 := local_id_x$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v9 := BV32_ULT($tile.0, BV32_SDIV($num_bodies, 256bv32));
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v9 && !v9;
    v399$1 := $$acc$0bv32$1;
    v399$2 := $$acc$0bv32$2;
    $$59$0bv32$1 := v399$1;
    $$59$0bv32$2 := v399$2;
    v400$1 := $$acc$1bv32$1;
    v400$2 := $$acc$1bv32$2;
    $$59$1bv32$1 := v400$1;
    $$59$1bv32$2 := v400$2;
    v401$1 := $$acc$2bv32$1;
    v401$2 := $$acc$2bv32$2;
    $$59$2bv32$1 := v401$1;
    $$59$2bv32$2 := v401$2;
    v402$1 := $$acc$3bv32$1;
    v402$2 := $$acc$3bv32$2;
    $$59$3bv32$1 := v402$1;
    $$59$3bv32$2 := v402$2;
    v403$1 := $$59$0bv32$1;
    v403$2 := $$59$0bv32$2;
    v404$1 := $$59$1bv32$1;
    v404$2 := $$59$1bv32$2;
    v405$1 := $$59$2bv32$1;
    v405$2 := $$59$2bv32$2;
    v406$1 := $$59$3bv32$1;
    v406$2 := $$59$3bv32$2;
    $$a.i$0bv32$1 := v403$1;
    $$a.i$0bv32$2 := v403$2;
    $$a.i$1bv32$1 := v404$1;
    $$a.i$1bv32$2 := v404$2;
    $$a.i$2bv32$1 := v405$1;
    $$a.i$2bv32$2 := v405$2;
    $$a.i$3bv32$1 := v406$1;
    $$a.i$3bv32$2 := v406$2;
    v407$1 := $$a.i$0bv32$1;
    v407$2 := $$a.i$0bv32$2;
    v408$1 := $$a.i$1bv32$1;
    v408$2 := $$a.i$1bv32$2;
    v409$1 := $$a.i$2bv32$1;
    v409$2 := $$a.i$2bv32$2;
    v410$1 := $$a.i$3bv32$1;
    v410$2 := $$a.i$3bv32$2;
    $$8$0bv32$1 := FMUL32(v407$1, 1036831949bv32);
    $$8$0bv32$2 := FMUL32(v407$2, 1036831949bv32);
    $$8$1bv32$1 := FMUL32(v408$1, 1036831949bv32);
    $$8$1bv32$2 := FMUL32(v408$2, 1036831949bv32);
    $$8$2bv32$1 := FMUL32(v409$1, 1036831949bv32);
    $$8$2bv32$2 := FMUL32(v409$2, 1036831949bv32);
    $$8$3bv32$1 := FMUL32(v410$1, 1036831949bv32);
    $$8$3bv32$2 := FMUL32(v410$2, 1036831949bv32);
    v411$1 := $$8$0bv32$1;
    v411$2 := $$8$0bv32$2;
    v412$1 := $$8$1bv32$1;
    v412$2 := $$8$1bv32$2;
    v413$1 := $$8$2bv32$1;
    v413$2 := $$8$2bv32$2;
    v414$1 := $$8$3bv32$1;
    v414$2 := $$8$3bv32$2;
    $$9$0bv32$1 := v411$1;
    $$9$0bv32$2 := v411$2;
    $$9$1bv32$1 := v412$1;
    $$9$1bv32$2 := v412$2;
    $$9$2bv32$1 := v413$1;
    $$9$2bv32$2 := v413$2;
    $$9$3bv32$1 := v414$1;
    $$9$3bv32$2 := v414$2;
    v415$1 := $$9$0bv32$1;
    v415$2 := $$9$0bv32$2;
    v416$1 := $$9$1bv32$1;
    v416$2 := $$9$1bv32$2;
    v417$1 := $$9$2bv32$1;
    v417$2 := $$9$2bv32$2;
    v418$1 := $$9$3bv32$1;
    v418$2 := $$9$3bv32$2;
    $$58$0bv32$1 := v415$1;
    $$58$0bv32$2 := v415$2;
    $$58$1bv32$1 := v416$1;
    $$58$1bv32$2 := v416$2;
    $$58$2bv32$1 := v417$1;
    $$58$2bv32$2 := v417$2;
    $$58$3bv32$1 := v418$1;
    $$58$3bv32$2 := v418$2;
    v419$1 := $$58$0bv32$1;
    v419$2 := $$58$0bv32$2;
    v420$1 := $$58$1bv32$1;
    v420$2 := $$58$1bv32$2;
    v421$1 := $$58$2bv32$1;
    v421$2 := $$58$2bv32$2;
    v422$1 := $$58$3bv32$1;
    v422$2 := $$58$3bv32$2;
    $$b.i35$0bv32$1 := v419$1;
    $$b.i35$0bv32$2 := v419$2;
    $$b.i35$1bv32$1 := v420$1;
    $$b.i35$1bv32$2 := v420$2;
    $$b.i35$2bv32$1 := v421$1;
    $$b.i35$2bv32$2 := v421$2;
    $$b.i35$3bv32$1 := v422$1;
    $$b.i35$3bv32$2 := v422$2;
    v423$1 := $$p_vel$0bv32$1;
    v423$2 := $$p_vel$0bv32$2;
    v424$1 := $$b.i35$0bv32$1;
    v424$2 := $$b.i35$0bv32$2;
    v425$1 := $$p_vel$1bv32$1;
    v425$2 := $$p_vel$1bv32$2;
    v426$1 := $$b.i35$1bv32$1;
    v426$2 := $$b.i35$1bv32$2;
    v427$1 := $$p_vel$2bv32$1;
    v427$2 := $$p_vel$2bv32$2;
    v428$1 := $$b.i35$2bv32$1;
    v428$2 := $$b.i35$2bv32$2;
    v429$1 := $$p_vel$3bv32$1;
    v429$2 := $$p_vel$3bv32$2;
    v430$1 := $$b.i35$3bv32$1;
    v430$2 := $$b.i35$3bv32$2;
    $$0$0bv32$1 := FADD32(v423$1, v424$1);
    $$0$0bv32$2 := FADD32(v423$2, v424$2);
    $$0$1bv32$1 := FADD32(v425$1, v426$1);
    $$0$1bv32$2 := FADD32(v425$2, v426$2);
    $$0$2bv32$1 := FADD32(v427$1, v428$1);
    $$0$2bv32$2 := FADD32(v427$2, v428$2);
    $$0$3bv32$1 := FADD32(v429$1, v430$1);
    $$0$3bv32$2 := FADD32(v429$2, v430$2);
    v431$1 := $$0$0bv32$1;
    v431$2 := $$0$0bv32$2;
    v432$1 := $$0$1bv32$1;
    v432$2 := $$0$1bv32$2;
    v433$1 := $$0$2bv32$1;
    v433$2 := $$0$2bv32$2;
    v434$1 := $$0$3bv32$1;
    v434$2 := $$0$3bv32$2;
    $$1$0bv32$1 := v431$1;
    $$1$0bv32$2 := v431$2;
    $$1$1bv32$1 := v432$1;
    $$1$1bv32$2 := v432$2;
    $$1$2bv32$1 := v433$1;
    $$1$2bv32$2 := v433$2;
    $$1$3bv32$1 := v434$1;
    $$1$3bv32$2 := v434$2;
    v435$1 := $$1$0bv32$1;
    v435$2 := $$1$0bv32$2;
    $$p_vel$0bv32$1 := v435$1;
    $$p_vel$0bv32$2 := v435$2;
    v436$1 := $$1$1bv32$1;
    v436$2 := $$1$1bv32$2;
    $$p_vel$1bv32$1 := v436$1;
    $$p_vel$1bv32$2 := v436$2;
    v437$1 := $$1$2bv32$1;
    v437$2 := $$1$2bv32$2;
    $$p_vel$2bv32$1 := v437$1;
    $$p_vel$2bv32$2 := v437$2;
    v438$1 := $$1$3bv32$1;
    v438$2 := $$1$3bv32$2;
    $$p_vel$3bv32$1 := v438$1;
    $$p_vel$3bv32$2 := v438$2;
    v439$1 := $$p_vel$0bv32$1;
    v439$2 := $$p_vel$0bv32$2;
    v440$1 := $$p_vel$1bv32$1;
    v440$2 := $$p_vel$1bv32$2;
    v441$1 := $$p_vel$2bv32$1;
    v441$2 := $$p_vel$2bv32$2;
    v442$1 := $$p_vel$3bv32$1;
    v442$2 := $$p_vel$3bv32$2;
    $$2$0bv32$1 := FMUL32(v439$1, 1065353216bv32);
    $$2$0bv32$2 := FMUL32(v439$2, 1065353216bv32);
    $$2$1bv32$1 := FMUL32(v440$1, 1065353216bv32);
    $$2$1bv32$2 := FMUL32(v440$2, 1065353216bv32);
    $$2$2bv32$1 := FMUL32(v441$1, 1065353216bv32);
    $$2$2bv32$2 := FMUL32(v441$2, 1065353216bv32);
    $$2$3bv32$1 := FMUL32(v442$1, 1065353216bv32);
    $$2$3bv32$2 := FMUL32(v442$2, 1065353216bv32);
    v443$1 := $$2$0bv32$1;
    v443$2 := $$2$0bv32$2;
    v444$1 := $$2$1bv32$1;
    v444$2 := $$2$1bv32$2;
    v445$1 := $$2$2bv32$1;
    v445$2 := $$2$2bv32$2;
    v446$1 := $$2$3bv32$1;
    v446$2 := $$2$3bv32$2;
    $$3$0bv32$1 := v443$1;
    $$3$0bv32$2 := v443$2;
    $$3$1bv32$1 := v444$1;
    $$3$1bv32$2 := v444$2;
    $$3$2bv32$1 := v445$1;
    $$3$2bv32$2 := v445$2;
    $$3$3bv32$1 := v446$1;
    $$3$3bv32$2 := v446$2;
    v447$1 := $$3$0bv32$1;
    v447$2 := $$3$0bv32$2;
    $$p_vel$0bv32$1 := v447$1;
    $$p_vel$0bv32$2 := v447$2;
    v448$1 := $$3$1bv32$1;
    v448$2 := $$3$1bv32$2;
    $$p_vel$1bv32$1 := v448$1;
    $$p_vel$1bv32$2 := v448$2;
    v449$1 := $$3$2bv32$1;
    v449$2 := $$3$2bv32$2;
    $$p_vel$2bv32$1 := v449$1;
    $$p_vel$2bv32$2 := v449$2;
    v450$1 := $$3$3bv32$1;
    v450$2 := $$3$3bv32$2;
    $$p_vel$3bv32$1 := v450$1;
    $$p_vel$3bv32$2 := v450$2;
    v451$1 := $$p_vel$0bv32$1;
    v451$2 := $$p_vel$0bv32$2;
    $$61$0bv32$1 := v451$1;
    $$61$0bv32$2 := v451$2;
    v452$1 := $$p_vel$1bv32$1;
    v452$2 := $$p_vel$1bv32$2;
    $$61$1bv32$1 := v452$1;
    $$61$1bv32$2 := v452$2;
    v453$1 := $$p_vel$2bv32$1;
    v453$2 := $$p_vel$2bv32$2;
    $$61$2bv32$1 := v453$1;
    $$61$2bv32$2 := v453$2;
    v454$1 := $$p_vel$3bv32$1;
    v454$2 := $$p_vel$3bv32$2;
    $$61$3bv32$1 := v454$1;
    $$61$3bv32$2 := v454$2;
    v455$1 := $$61$0bv32$1;
    v455$2 := $$61$0bv32$2;
    v456$1 := $$61$1bv32$1;
    v456$2 := $$61$1bv32$2;
    v457$1 := $$61$2bv32$1;
    v457$2 := $$61$2bv32$2;
    v458$1 := $$61$3bv32$1;
    v458$2 := $$61$3bv32$2;
    $$a.i34$0bv32$1 := v455$1;
    $$a.i34$0bv32$2 := v455$2;
    $$a.i34$1bv32$1 := v456$1;
    $$a.i34$1bv32$2 := v456$2;
    $$a.i34$2bv32$1 := v457$1;
    $$a.i34$2bv32$2 := v457$2;
    $$a.i34$3bv32$1 := v458$1;
    $$a.i34$3bv32$2 := v458$2;
    v459$1 := $$a.i34$0bv32$1;
    v459$2 := $$a.i34$0bv32$2;
    v460$1 := $$a.i34$1bv32$1;
    v460$2 := $$a.i34$1bv32$2;
    v461$1 := $$a.i34$2bv32$1;
    v461$2 := $$a.i34$2bv32$2;
    v462$1 := $$a.i34$3bv32$1;
    v462$2 := $$a.i34$3bv32$2;
    $$4$0bv32$1 := FMUL32(v459$1, 1036831949bv32);
    $$4$0bv32$2 := FMUL32(v459$2, 1036831949bv32);
    $$4$1bv32$1 := FMUL32(v460$1, 1036831949bv32);
    $$4$1bv32$2 := FMUL32(v460$2, 1036831949bv32);
    $$4$2bv32$1 := FMUL32(v461$1, 1036831949bv32);
    $$4$2bv32$2 := FMUL32(v461$2, 1036831949bv32);
    $$4$3bv32$1 := FMUL32(v462$1, 1036831949bv32);
    $$4$3bv32$2 := FMUL32(v462$2, 1036831949bv32);
    v463$1 := $$4$0bv32$1;
    v463$2 := $$4$0bv32$2;
    v464$1 := $$4$1bv32$1;
    v464$2 := $$4$1bv32$2;
    v465$1 := $$4$2bv32$1;
    v465$2 := $$4$2bv32$2;
    v466$1 := $$4$3bv32$1;
    v466$2 := $$4$3bv32$2;
    $$5$0bv32$1 := v463$1;
    $$5$0bv32$2 := v463$2;
    $$5$1bv32$1 := v464$1;
    $$5$1bv32$2 := v464$2;
    $$5$2bv32$1 := v465$1;
    $$5$2bv32$2 := v465$2;
    $$5$3bv32$1 := v466$1;
    $$5$3bv32$2 := v466$2;
    v467$1 := $$5$0bv32$1;
    v467$2 := $$5$0bv32$2;
    v468$1 := $$5$1bv32$1;
    v468$2 := $$5$1bv32$2;
    v469$1 := $$5$2bv32$1;
    v469$2 := $$5$2bv32$2;
    v470$1 := $$5$3bv32$1;
    v470$2 := $$5$3bv32$2;
    $$60$0bv32$1 := v467$1;
    $$60$0bv32$2 := v467$2;
    $$60$1bv32$1 := v468$1;
    $$60$1bv32$2 := v468$2;
    $$60$2bv32$1 := v469$1;
    $$60$2bv32$2 := v469$2;
    $$60$3bv32$1 := v470$1;
    $$60$3bv32$2 := v470$2;
    v471$1 := $$60$0bv32$1;
    v471$2 := $$60$0bv32$2;
    v472$1 := $$60$1bv32$1;
    v472$2 := $$60$1bv32$2;
    v473$1 := $$60$2bv32$1;
    v473$2 := $$60$2bv32$2;
    v474$1 := $$60$3bv32$1;
    v474$2 := $$60$3bv32$2;
    $$b.i$0bv32$1 := v471$1;
    $$b.i$0bv32$2 := v471$2;
    $$b.i$1bv32$1 := v472$1;
    $$b.i$1bv32$2 := v472$2;
    $$b.i$2bv32$1 := v473$1;
    $$b.i$2bv32$2 := v473$2;
    $$b.i$3bv32$1 := v474$1;
    $$b.i$3bv32$2 := v474$2;
    v475$1 := $$p_pos$0bv32$1;
    v475$2 := $$p_pos$0bv32$2;
    v476$1 := $$b.i$0bv32$1;
    v476$2 := $$b.i$0bv32$2;
    v477$1 := $$p_pos$1bv32$1;
    v477$2 := $$p_pos$1bv32$2;
    v478$1 := $$b.i$1bv32$1;
    v478$2 := $$b.i$1bv32$2;
    v479$1 := $$p_pos$2bv32$1;
    v479$2 := $$p_pos$2bv32$2;
    v480$1 := $$b.i$2bv32$1;
    v480$2 := $$b.i$2bv32$2;
    v481$1 := $$p_pos$3bv32$1;
    v481$2 := $$p_pos$3bv32$2;
    v482$1 := $$b.i$3bv32$1;
    v482$2 := $$b.i$3bv32$2;
    $$6$0bv32$1 := FADD32(v475$1, v476$1);
    $$6$0bv32$2 := FADD32(v475$2, v476$2);
    $$6$1bv32$1 := FADD32(v477$1, v478$1);
    $$6$1bv32$2 := FADD32(v477$2, v478$2);
    $$6$2bv32$1 := FADD32(v479$1, v480$1);
    $$6$2bv32$2 := FADD32(v479$2, v480$2);
    $$6$3bv32$1 := FADD32(v481$1, v482$1);
    $$6$3bv32$2 := FADD32(v481$2, v482$2);
    v483$1 := $$6$0bv32$1;
    v483$2 := $$6$0bv32$2;
    v484$1 := $$6$1bv32$1;
    v484$2 := $$6$1bv32$2;
    v485$1 := $$6$2bv32$1;
    v485$2 := $$6$2bv32$2;
    v486$1 := $$6$3bv32$1;
    v486$2 := $$6$3bv32$2;
    $$7$0bv32$1 := v483$1;
    $$7$0bv32$2 := v483$2;
    $$7$1bv32$1 := v484$1;
    $$7$1bv32$2 := v484$2;
    $$7$2bv32$1 := v485$1;
    $$7$2bv32$2 := v485$2;
    $$7$3bv32$1 := v486$1;
    $$7$3bv32$2 := v486$2;
    v487$1 := $$7$0bv32$1;
    v487$2 := $$7$0bv32$2;
    $$p_pos$0bv32$1 := v487$1;
    $$p_pos$0bv32$2 := v487$2;
    v488$1 := $$7$1bv32$1;
    v488$2 := $$7$1bv32$2;
    $$p_pos$1bv32$1 := v488$1;
    $$p_pos$1bv32$2 := v488$2;
    v489$1 := $$7$2bv32$1;
    v489$2 := $$7$2bv32$2;
    $$p_pos$2bv32$1 := v489$1;
    $$p_pos$2bv32$2 := v489$2;
    v490$1 := $$7$3bv32$1;
    v490$2 := $$7$3bv32$2;
    $$p_pos$3bv32$1 := v490$1;
    $$p_pos$3bv32$2 := v490$2;
    v491$1 := $$p_pos$0bv32$1;
    v491$2 := $$p_pos$0bv32$2;
    call {:sourceloc} {:sourceloc_num 912} _LOG_WRITE_$$data_out_pos(true, BV32_MUL(v0$1, 4bv32), v491$1, $$data_out_pos[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 912} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 912} _CHECK_WRITE_$$data_out_pos(true, BV32_MUL(v0$2, 4bv32), v491$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_MUL(v0$1, 4bv32)] := v491$1;
    $$data_out_pos[BV32_MUL(v0$2, 4bv32)] := v491$2;
    v492$1 := $$p_pos$1bv32$1;
    v492$2 := $$p_pos$1bv32$2;
    call {:sourceloc} {:sourceloc_num 914} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v492$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 914} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 914} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v492$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v492$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v492$2;
    v493$1 := $$p_pos$2bv32$1;
    v493$2 := $$p_pos$2bv32$2;
    call {:sourceloc} {:sourceloc_num 916} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v493$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 916} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 916} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v493$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v493$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v493$2;
    v494$1 := $$p_pos$3bv32$1;
    v494$2 := $$p_pos$3bv32$2;
    call {:sourceloc} {:sourceloc_num 918} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v494$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 918} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 918} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v494$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v494$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v494$2;
    v495$1 := $$p_vel$0bv32$1;
    v495$2 := $$p_vel$0bv32$2;
    call {:sourceloc} {:sourceloc_num 920} _LOG_WRITE_$$data_out_vel(true, BV32_MUL(v0$1, 4bv32), v495$1, $$data_out_vel[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 920} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 920} _CHECK_WRITE_$$data_out_vel(true, BV32_MUL(v0$2, 4bv32), v495$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_MUL(v0$1, 4bv32)] := v495$1;
    $$data_out_vel[BV32_MUL(v0$2, 4bv32)] := v495$2;
    v496$1 := $$p_vel$1bv32$1;
    v496$2 := $$p_vel$1bv32$2;
    call {:sourceloc} {:sourceloc_num 922} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v496$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 922} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 922} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v496$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v496$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v496$2;
    v497$1 := $$p_vel$2bv32$1;
    v497$2 := $$p_vel$2bv32$2;
    call {:sourceloc} {:sourceloc_num 924} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v497$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 924} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 924} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v497$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v497$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v497$2;
    v498$1 := $$p_vel$3bv32$1;
    v498$2 := $$p_vel$3bv32$2;
    call {:sourceloc} {:sourceloc_num 926} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v498$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 926} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 926} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v498$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v498$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v498$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v9 && v9;
    havoc v10$1, v10$2;
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_MUL(local_id_x$1, 4bv32), v10$1, $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL(local_id_x$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_MUL(local_id_x$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_MUL(local_id_x$2, 4bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} true;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL(local_id_x$1, 4bv32)] := v10$1;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(local_id_x$2, 4bv32)] := v10$2;
    havoc v11$1, v11$2;
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32), v11$1, $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} true;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 1bv32)] := v11$1;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 1bv32)] := v11$2;
    havoc v12$1, v12$2;
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32), v12$1, $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} true;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 2bv32)] := v12$1;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 2bv32)] := v12$2;
    havoc v13$1, v13$2;
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32), v13$1, $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(true, BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} true;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 4bv32), 3bv32)] := v13$1;
    $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 4bv32), 3bv32)] := v13$2;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 31} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $j.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 32} true;
    v14 := BV32_ULT($j.0, 256bv32);
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v14 && !v14;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 732} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $particle_idx.0$1, $tile.0 := BV32_ADD($particle_idx.0$1, 256bv32), BV32_ADD($tile.0, 1bv32);
    $particle_idx.0$2 := BV32_ADD($particle_idx.0$2, 256bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v14 && v14;
    v15$1 := $$p_pos$0bv32$1;
    v15$2 := $$p_pos$0bv32$2;
    $$50$0bv32$1 := v15$1;
    $$50$0bv32$2 := v15$2;
    v16$1 := $$p_pos$1bv32$1;
    v16$2 := $$p_pos$1bv32$2;
    $$50$1bv32$1 := v16$1;
    $$50$1bv32$2 := v16$2;
    v17$1 := $$p_pos$2bv32$1;
    v17$2 := $$p_pos$2bv32$2;
    $$50$2bv32$1 := v17$1;
    $$50$2bv32$2 := v17$2;
    v18$1 := $$p_pos$3bv32$1;
    v18$2 := $$p_pos$3bv32$2;
    $$50$3bv32$1 := v18$1;
    $$50$3bv32$2 := v18$2;
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 42} true;
    v19$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL($j.0, 4bv32)];
    v19$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($j.0, 4bv32)];
    $$51$0bv32$1 := v19$1;
    $$51$0bv32$2 := v19$2;
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 44} true;
    v20$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL($j.0, 4bv32), 1bv32)];
    v20$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0, 4bv32), 1bv32)];
    $$51$1bv32$1 := v20$1;
    $$51$1bv32$2 := v20$2;
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 46} true;
    v21$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL($j.0, 4bv32), 2bv32)];
    v21$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0, 4bv32), 2bv32)];
    $$51$2bv32$1 := v21$1;
    $$51$2bv32$2 := v21$2;
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 48} true;
    v22$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL($j.0, 4bv32), 3bv32)];
    v22$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0, 4bv32), 3bv32)];
    $$51$3bv32$1 := v22$1;
    $$51$3bv32$2 := v22$2;
    v23$1 := $$50$0bv32$1;
    v23$2 := $$50$0bv32$2;
    v24$1 := $$50$1bv32$1;
    v24$2 := $$50$1bv32$2;
    v25$1 := $$50$2bv32$1;
    v25$2 := $$50$2bv32$2;
    v26$1 := $$50$3bv32$1;
    v26$2 := $$50$3bv32$2;
    v27$1 := $$51$0bv32$1;
    v27$2 := $$51$0bv32$2;
    v28$1 := $$51$1bv32$1;
    v28$2 := $$51$1bv32$2;
    v29$1 := $$51$2bv32$1;
    v29$2 := $$51$2bv32$2;
    v30$1 := $$51$3bv32$1;
    v30$2 := $$51$3bv32$2;
    $$my_curr_pos.i$0bv32$1 := v23$1;
    $$my_curr_pos.i$0bv32$2 := v23$2;
    $$my_curr_pos.i$1bv32$1 := v24$1;
    $$my_curr_pos.i$1bv32$2 := v24$2;
    $$my_curr_pos.i$2bv32$1 := v25$1;
    $$my_curr_pos.i$2bv32$2 := v25$2;
    $$my_curr_pos.i$3bv32$1 := v26$1;
    $$my_curr_pos.i$3bv32$2 := v26$2;
    $$other_element_old_pos.i$0bv32$1 := v27$1;
    $$other_element_old_pos.i$0bv32$2 := v27$2;
    $$other_element_old_pos.i$1bv32$1 := v28$1;
    $$other_element_old_pos.i$1bv32$2 := v28$2;
    $$other_element_old_pos.i$2bv32$1 := v29$1;
    $$other_element_old_pos.i$2bv32$2 := v29$2;
    $$other_element_old_pos.i$3bv32$1 := v30$1;
    $$other_element_old_pos.i$3bv32$2 := v30$2;
    v31$1 := $$other_element_old_pos.i$0bv32$1;
    v31$2 := $$other_element_old_pos.i$0bv32$2;
    $$46$0bv32$1 := v31$1;
    $$46$0bv32$2 := v31$2;
    v32$1 := $$other_element_old_pos.i$1bv32$1;
    v32$2 := $$other_element_old_pos.i$1bv32$2;
    $$46$1bv32$1 := v32$1;
    $$46$1bv32$2 := v32$2;
    v33$1 := $$other_element_old_pos.i$2bv32$1;
    v33$2 := $$other_element_old_pos.i$2bv32$2;
    $$46$2bv32$1 := v33$1;
    $$46$2bv32$2 := v33$2;
    v34$1 := $$other_element_old_pos.i$3bv32$1;
    v34$2 := $$other_element_old_pos.i$3bv32$2;
    $$46$3bv32$1 := v34$1;
    $$46$3bv32$2 := v34$2;
    v35$1 := $$my_curr_pos.i$0bv32$1;
    v35$2 := $$my_curr_pos.i$0bv32$2;
    $$47$0bv32$1 := v35$1;
    $$47$0bv32$2 := v35$2;
    v36$1 := $$my_curr_pos.i$1bv32$1;
    v36$2 := $$my_curr_pos.i$1bv32$2;
    $$47$1bv32$1 := v36$1;
    $$47$1bv32$2 := v36$2;
    v37$1 := $$my_curr_pos.i$2bv32$1;
    v37$2 := $$my_curr_pos.i$2bv32$2;
    $$47$2bv32$1 := v37$1;
    $$47$2bv32$2 := v37$2;
    v38$1 := $$my_curr_pos.i$3bv32$1;
    v38$2 := $$my_curr_pos.i$3bv32$2;
    $$47$3bv32$1 := v38$1;
    $$47$3bv32$2 := v38$2;
    v39$1 := $$46$0bv32$1;
    v39$2 := $$46$0bv32$2;
    v40$1 := $$46$1bv32$1;
    v40$2 := $$46$1bv32$2;
    v41$1 := $$46$2bv32$1;
    v41$2 := $$46$2bv32$2;
    v42$1 := $$46$3bv32$1;
    v42$2 := $$46$3bv32$2;
    v43$1 := $$47$0bv32$1;
    v43$2 := $$47$0bv32$2;
    v44$1 := $$47$1bv32$1;
    v44$2 := $$47$1bv32$2;
    v45$1 := $$47$2bv32$1;
    v45$2 := $$47$2bv32$2;
    v46$1 := $$47$3bv32$1;
    v46$2 := $$47$3bv32$2;
    $$a.i.i$0bv32$1 := v39$1;
    $$a.i.i$0bv32$2 := v39$2;
    $$a.i.i$1bv32$1 := v40$1;
    $$a.i.i$1bv32$2 := v40$2;
    $$a.i.i$2bv32$1 := v41$1;
    $$a.i.i$2bv32$2 := v41$2;
    $$a.i.i$3bv32$1 := v42$1;
    $$a.i.i$3bv32$2 := v42$2;
    $$b.i.i$0bv32$1 := v43$1;
    $$b.i.i$0bv32$2 := v43$2;
    $$b.i.i$1bv32$1 := v44$1;
    $$b.i.i$1bv32$2 := v44$2;
    $$b.i.i$2bv32$1 := v45$1;
    $$b.i.i$2bv32$2 := v45$2;
    $$b.i.i$3bv32$1 := v46$1;
    $$b.i.i$3bv32$2 := v46$2;
    v47$1 := $$a.i.i$0bv32$1;
    v47$2 := $$a.i.i$0bv32$2;
    v48$1 := $$b.i.i$0bv32$1;
    v48$2 := $$b.i.i$0bv32$2;
    v49$1 := $$a.i.i$1bv32$1;
    v49$2 := $$a.i.i$1bv32$2;
    v50$1 := $$b.i.i$1bv32$1;
    v50$2 := $$b.i.i$1bv32$2;
    v51$1 := $$a.i.i$2bv32$1;
    v51$2 := $$a.i.i$2bv32$2;
    v52$1 := $$b.i.i$2bv32$1;
    v52$2 := $$b.i.i$2bv32$2;
    v53$1 := $$a.i.i$3bv32$1;
    v53$2 := $$a.i.i$3bv32$2;
    v54$1 := $$b.i.i$3bv32$1;
    v54$2 := $$b.i.i$3bv32$2;
    $$44$0bv32$1 := FSUB32(v47$1, v48$1);
    $$44$0bv32$2 := FSUB32(v47$2, v48$2);
    $$44$1bv32$1 := FSUB32(v49$1, v50$1);
    $$44$1bv32$2 := FSUB32(v49$2, v50$2);
    $$44$2bv32$1 := FSUB32(v51$1, v52$1);
    $$44$2bv32$2 := FSUB32(v51$2, v52$2);
    $$44$3bv32$1 := FSUB32(v53$1, v54$1);
    $$44$3bv32$2 := FSUB32(v53$2, v54$2);
    v55$1 := $$44$0bv32$1;
    v55$2 := $$44$0bv32$2;
    v56$1 := $$44$1bv32$1;
    v56$2 := $$44$1bv32$2;
    v57$1 := $$44$2bv32$1;
    v57$2 := $$44$2bv32$2;
    v58$1 := $$44$3bv32$1;
    v58$2 := $$44$3bv32$2;
    $$45$0bv32$1 := v55$1;
    $$45$0bv32$2 := v55$2;
    $$45$1bv32$1 := v56$1;
    $$45$1bv32$2 := v56$2;
    $$45$2bv32$1 := v57$1;
    $$45$2bv32$2 := v57$2;
    $$45$3bv32$1 := v58$1;
    $$45$3bv32$2 := v58$2;
    v59$1 := $$45$0bv32$1;
    v59$2 := $$45$0bv32$2;
    v60$1 := $$45$1bv32$1;
    v60$2 := $$45$1bv32$2;
    v61$1 := $$45$2bv32$1;
    v61$2 := $$45$2bv32$2;
    v62$1 := $$45$3bv32$1;
    v62$2 := $$45$3bv32$2;
    $$r.i$0bv32$1 := v59$1;
    $$r.i$0bv32$2 := v59$2;
    $$r.i$1bv32$1 := v60$1;
    $$r.i$1bv32$2 := v60$2;
    $$r.i$2bv32$1 := v61$1;
    $$r.i$2bv32$2 := v61$2;
    $$r.i$3bv32$1 := v62$1;
    $$r.i$3bv32$2 := v62$2;
    v63$1 := $$r.i$0bv32$1;
    v63$2 := $$r.i$0bv32$2;
    v64$1 := $$r.i$0bv32$1;
    v64$2 := $$r.i$0bv32$2;
    v65$1 := $$r.i$1bv32$1;
    v65$2 := $$r.i$1bv32$2;
    v66$1 := $$r.i$1bv32$1;
    v66$2 := $$r.i$1bv32$2;
    v67$1 := $$r.i$2bv32$1;
    v67$2 := $$r.i$2bv32$2;
    v68$1 := $$r.i$2bv32$1;
    v68$2 := $$r.i$2bv32$2;
    v69$1 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v63$1, v64$1), FMUL32(v65$1, v66$1)), FMUL32(v67$1, v68$1)), 902936343bv32))));
    v69$2 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v63$2, v64$2), FMUL32(v65$2, v66$2)), FMUL32(v67$2, v68$2)), 902936343bv32))));
    v70$1 := FMUL32(1116042691bv32, FMUL32(FMUL32(v69$1, v69$1), v69$1));
    v70$2 := FMUL32(1116042691bv32, FMUL32(FMUL32(v69$2, v69$2), v69$2));
    v71$1 := $$r.i$0bv32$1;
    v71$2 := $$r.i$0bv32$2;
    $$49$0bv32$1 := v71$1;
    $$49$0bv32$2 := v71$2;
    v72$1 := $$r.i$1bv32$1;
    v72$2 := $$r.i$1bv32$2;
    $$49$1bv32$1 := v72$1;
    $$49$1bv32$2 := v72$2;
    v73$1 := $$r.i$2bv32$1;
    v73$2 := $$r.i$2bv32$2;
    $$49$2bv32$1 := v73$1;
    $$49$2bv32$2 := v73$2;
    v74$1 := $$r.i$3bv32$1;
    v74$2 := $$r.i$3bv32$2;
    $$49$3bv32$1 := v74$1;
    $$49$3bv32$2 := v74$2;
    v75$1 := $$49$0bv32$1;
    v75$2 := $$49$0bv32$2;
    v76$1 := $$49$1bv32$1;
    v76$2 := $$49$1bv32$2;
    v77$1 := $$49$2bv32$1;
    v77$2 := $$49$2bv32$2;
    v78$1 := $$49$3bv32$1;
    v78$2 := $$49$3bv32$2;
    $$a.i2.i$0bv32$1 := v75$1;
    $$a.i2.i$0bv32$2 := v75$2;
    $$a.i2.i$1bv32$1 := v76$1;
    $$a.i2.i$1bv32$2 := v76$2;
    $$a.i2.i$2bv32$1 := v77$1;
    $$a.i2.i$2bv32$2 := v77$2;
    $$a.i2.i$3bv32$1 := v78$1;
    $$a.i2.i$3bv32$2 := v78$2;
    v79$1 := $$a.i2.i$0bv32$1;
    v79$2 := $$a.i2.i$0bv32$2;
    v80$1 := $$a.i2.i$1bv32$1;
    v80$2 := $$a.i2.i$1bv32$2;
    v81$1 := $$a.i2.i$2bv32$1;
    v81$2 := $$a.i2.i$2bv32$2;
    v82$1 := $$a.i2.i$3bv32$1;
    v82$2 := $$a.i2.i$3bv32$2;
    $$40$0bv32$1 := FMUL32(v79$1, v70$1);
    $$40$0bv32$2 := FMUL32(v79$2, v70$2);
    $$40$1bv32$1 := FMUL32(v80$1, v70$1);
    $$40$1bv32$2 := FMUL32(v80$2, v70$2);
    $$40$2bv32$1 := FMUL32(v81$1, v70$1);
    $$40$2bv32$2 := FMUL32(v81$2, v70$2);
    $$40$3bv32$1 := FMUL32(v82$1, v70$1);
    $$40$3bv32$2 := FMUL32(v82$2, v70$2);
    v83$1 := $$40$0bv32$1;
    v83$2 := $$40$0bv32$2;
    v84$1 := $$40$1bv32$1;
    v84$2 := $$40$1bv32$2;
    v85$1 := $$40$2bv32$1;
    v85$2 := $$40$2bv32$2;
    v86$1 := $$40$3bv32$1;
    v86$2 := $$40$3bv32$2;
    $$41$0bv32$1 := v83$1;
    $$41$0bv32$2 := v83$2;
    $$41$1bv32$1 := v84$1;
    $$41$1bv32$2 := v84$2;
    $$41$2bv32$1 := v85$1;
    $$41$2bv32$2 := v85$2;
    $$41$3bv32$1 := v86$1;
    $$41$3bv32$2 := v86$2;
    v87$1 := $$41$0bv32$1;
    v87$2 := $$41$0bv32$2;
    v88$1 := $$41$1bv32$1;
    v88$2 := $$41$1bv32$2;
    v89$1 := $$41$2bv32$1;
    v89$2 := $$41$2bv32$2;
    v90$1 := $$41$3bv32$1;
    v90$2 := $$41$3bv32$2;
    $$48$0bv32$1 := v87$1;
    $$48$0bv32$2 := v87$2;
    $$48$1bv32$1 := v88$1;
    $$48$1bv32$2 := v88$2;
    $$48$2bv32$1 := v89$1;
    $$48$2bv32$2 := v89$2;
    $$48$3bv32$1 := v90$1;
    $$48$3bv32$2 := v90$2;
    v91$1 := $$48$0bv32$1;
    v91$2 := $$48$0bv32$2;
    v92$1 := $$48$1bv32$1;
    v92$2 := $$48$1bv32$2;
    v93$1 := $$48$2bv32$1;
    v93$2 := $$48$2bv32$2;
    v94$1 := $$48$3bv32$1;
    v94$2 := $$48$3bv32$2;
    $$b.i1.i$0bv32$1 := v91$1;
    $$b.i1.i$0bv32$2 := v91$2;
    $$b.i1.i$1bv32$1 := v92$1;
    $$b.i1.i$1bv32$2 := v92$2;
    $$b.i1.i$2bv32$1 := v93$1;
    $$b.i1.i$2bv32$2 := v93$2;
    $$b.i1.i$3bv32$1 := v94$1;
    $$b.i1.i$3bv32$2 := v94$2;
    v95$1 := $$acc$0bv32$1;
    v95$2 := $$acc$0bv32$2;
    v96$1 := $$b.i1.i$0bv32$1;
    v96$2 := $$b.i1.i$0bv32$2;
    v97$1 := $$acc$1bv32$1;
    v97$2 := $$acc$1bv32$2;
    v98$1 := $$b.i1.i$1bv32$1;
    v98$2 := $$b.i1.i$1bv32$2;
    v99$1 := $$acc$2bv32$1;
    v99$2 := $$acc$2bv32$2;
    v100$1 := $$b.i1.i$2bv32$1;
    v100$2 := $$b.i1.i$2bv32$2;
    v101$1 := $$acc$3bv32$1;
    v101$2 := $$acc$3bv32$2;
    v102$1 := $$b.i1.i$3bv32$1;
    v102$2 := $$b.i1.i$3bv32$2;
    $$42$0bv32$1 := FADD32(v95$1, v96$1);
    $$42$0bv32$2 := FADD32(v95$2, v96$2);
    $$42$1bv32$1 := FADD32(v97$1, v98$1);
    $$42$1bv32$2 := FADD32(v97$2, v98$2);
    $$42$2bv32$1 := FADD32(v99$1, v100$1);
    $$42$2bv32$2 := FADD32(v99$2, v100$2);
    $$42$3bv32$1 := FADD32(v101$1, v102$1);
    $$42$3bv32$2 := FADD32(v101$2, v102$2);
    v103$1 := $$42$0bv32$1;
    v103$2 := $$42$0bv32$2;
    v104$1 := $$42$1bv32$1;
    v104$2 := $$42$1bv32$2;
    v105$1 := $$42$2bv32$1;
    v105$2 := $$42$2bv32$2;
    v106$1 := $$42$3bv32$1;
    v106$2 := $$42$3bv32$2;
    $$43$0bv32$1 := v103$1;
    $$43$0bv32$2 := v103$2;
    $$43$1bv32$1 := v104$1;
    $$43$1bv32$2 := v104$2;
    $$43$2bv32$1 := v105$1;
    $$43$2bv32$2 := v105$2;
    $$43$3bv32$1 := v106$1;
    $$43$3bv32$2 := v106$2;
    v107$1 := $$43$0bv32$1;
    v107$2 := $$43$0bv32$2;
    $$acc$0bv32$1 := v107$1;
    $$acc$0bv32$2 := v107$2;
    v108$1 := $$43$1bv32$1;
    v108$2 := $$43$1bv32$2;
    $$acc$1bv32$1 := v108$1;
    $$acc$1bv32$2 := v108$2;
    v109$1 := $$43$2bv32$1;
    v109$2 := $$43$2bv32$2;
    $$acc$2bv32$1 := v109$1;
    $$acc$2bv32$2 := v109$2;
    v110$1 := $$43$3bv32$1;
    v110$2 := $$43$3bv32$2;
    $$acc$3bv32$1 := v110$1;
    $$acc$3bv32$2 := v110$2;
    v111$1 := $$p_pos$0bv32$1;
    v111$2 := $$p_pos$0bv32$2;
    $$52$0bv32$1 := v111$1;
    $$52$0bv32$2 := v111$2;
    v112$1 := $$p_pos$1bv32$1;
    v112$2 := $$p_pos$1bv32$2;
    $$52$1bv32$1 := v112$1;
    $$52$1bv32$2 := v112$2;
    v113$1 := $$p_pos$2bv32$1;
    v113$2 := $$p_pos$2bv32$2;
    $$52$2bv32$1 := v113$1;
    $$52$2bv32$2 := v113$2;
    v114$1 := $$p_pos$3bv32$1;
    v114$2 := $$p_pos$3bv32$2;
    $$52$3bv32$1 := v114$1;
    $$52$3bv32$2 := v114$2;
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 216} true;
    v115$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32)];
    v115$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32)];
    $$53$0bv32$1 := v115$1;
    $$53$0bv32$2 := v115$2;
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 218} true;
    v116$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 1bv32)];
    v116$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 1bv32)];
    $$53$1bv32$1 := v116$1;
    $$53$1bv32$2 := v116$2;
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 220} true;
    v117$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 2bv32)];
    v117$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 2bv32)];
    $$53$2bv32$1 := v117$1;
    $$53$2bv32$2 := v117$2;
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 222} true;
    v118$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 3bv32)];
    v118$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 1bv32), 4bv32), 3bv32)];
    $$53$3bv32$1 := v118$1;
    $$53$3bv32$2 := v118$2;
    v119$1 := $$52$0bv32$1;
    v119$2 := $$52$0bv32$2;
    v120$1 := $$52$1bv32$1;
    v120$2 := $$52$1bv32$2;
    v121$1 := $$52$2bv32$1;
    v121$2 := $$52$2bv32$2;
    v122$1 := $$52$3bv32$1;
    v122$2 := $$52$3bv32$2;
    v123$1 := $$53$0bv32$1;
    v123$2 := $$53$0bv32$2;
    v124$1 := $$53$1bv32$1;
    v124$2 := $$53$1bv32$2;
    v125$1 := $$53$2bv32$1;
    v125$2 := $$53$2bv32$2;
    v126$1 := $$53$3bv32$1;
    v126$2 := $$53$3bv32$2;
    $$my_curr_pos.i5$0bv32$1 := v119$1;
    $$my_curr_pos.i5$0bv32$2 := v119$2;
    $$my_curr_pos.i5$1bv32$1 := v120$1;
    $$my_curr_pos.i5$1bv32$2 := v120$2;
    $$my_curr_pos.i5$2bv32$1 := v121$1;
    $$my_curr_pos.i5$2bv32$2 := v121$2;
    $$my_curr_pos.i5$3bv32$1 := v122$1;
    $$my_curr_pos.i5$3bv32$2 := v122$2;
    $$other_element_old_pos.i6$0bv32$1 := v123$1;
    $$other_element_old_pos.i6$0bv32$2 := v123$2;
    $$other_element_old_pos.i6$1bv32$1 := v124$1;
    $$other_element_old_pos.i6$1bv32$2 := v124$2;
    $$other_element_old_pos.i6$2bv32$1 := v125$1;
    $$other_element_old_pos.i6$2bv32$2 := v125$2;
    $$other_element_old_pos.i6$3bv32$1 := v126$1;
    $$other_element_old_pos.i6$3bv32$2 := v126$2;
    v127$1 := $$other_element_old_pos.i6$0bv32$1;
    v127$2 := $$other_element_old_pos.i6$0bv32$2;
    $$36$0bv32$1 := v127$1;
    $$36$0bv32$2 := v127$2;
    v128$1 := $$other_element_old_pos.i6$1bv32$1;
    v128$2 := $$other_element_old_pos.i6$1bv32$2;
    $$36$1bv32$1 := v128$1;
    $$36$1bv32$2 := v128$2;
    v129$1 := $$other_element_old_pos.i6$2bv32$1;
    v129$2 := $$other_element_old_pos.i6$2bv32$2;
    $$36$2bv32$1 := v129$1;
    $$36$2bv32$2 := v129$2;
    v130$1 := $$other_element_old_pos.i6$3bv32$1;
    v130$2 := $$other_element_old_pos.i6$3bv32$2;
    $$36$3bv32$1 := v130$1;
    $$36$3bv32$2 := v130$2;
    v131$1 := $$my_curr_pos.i5$0bv32$1;
    v131$2 := $$my_curr_pos.i5$0bv32$2;
    $$37$0bv32$1 := v131$1;
    $$37$0bv32$2 := v131$2;
    v132$1 := $$my_curr_pos.i5$1bv32$1;
    v132$2 := $$my_curr_pos.i5$1bv32$2;
    $$37$1bv32$1 := v132$1;
    $$37$1bv32$2 := v132$2;
    v133$1 := $$my_curr_pos.i5$2bv32$1;
    v133$2 := $$my_curr_pos.i5$2bv32$2;
    $$37$2bv32$1 := v133$1;
    $$37$2bv32$2 := v133$2;
    v134$1 := $$my_curr_pos.i5$3bv32$1;
    v134$2 := $$my_curr_pos.i5$3bv32$2;
    $$37$3bv32$1 := v134$1;
    $$37$3bv32$2 := v134$2;
    v135$1 := $$36$0bv32$1;
    v135$2 := $$36$0bv32$2;
    v136$1 := $$36$1bv32$1;
    v136$2 := $$36$1bv32$2;
    v137$1 := $$36$2bv32$1;
    v137$2 := $$36$2bv32$2;
    v138$1 := $$36$3bv32$1;
    v138$2 := $$36$3bv32$2;
    v139$1 := $$37$0bv32$1;
    v139$2 := $$37$0bv32$2;
    v140$1 := $$37$1bv32$1;
    v140$2 := $$37$1bv32$2;
    v141$1 := $$37$2bv32$1;
    v141$2 := $$37$2bv32$2;
    v142$1 := $$37$3bv32$1;
    v142$2 := $$37$3bv32$2;
    $$a.i.i3$0bv32$1 := v135$1;
    $$a.i.i3$0bv32$2 := v135$2;
    $$a.i.i3$1bv32$1 := v136$1;
    $$a.i.i3$1bv32$2 := v136$2;
    $$a.i.i3$2bv32$1 := v137$1;
    $$a.i.i3$2bv32$2 := v137$2;
    $$a.i.i3$3bv32$1 := v138$1;
    $$a.i.i3$3bv32$2 := v138$2;
    $$b.i.i4$0bv32$1 := v139$1;
    $$b.i.i4$0bv32$2 := v139$2;
    $$b.i.i4$1bv32$1 := v140$1;
    $$b.i.i4$1bv32$2 := v140$2;
    $$b.i.i4$2bv32$1 := v141$1;
    $$b.i.i4$2bv32$2 := v141$2;
    $$b.i.i4$3bv32$1 := v142$1;
    $$b.i.i4$3bv32$2 := v142$2;
    v143$1 := $$a.i.i3$0bv32$1;
    v143$2 := $$a.i.i3$0bv32$2;
    v144$1 := $$b.i.i4$0bv32$1;
    v144$2 := $$b.i.i4$0bv32$2;
    v145$1 := $$a.i.i3$1bv32$1;
    v145$2 := $$a.i.i3$1bv32$2;
    v146$1 := $$b.i.i4$1bv32$1;
    v146$2 := $$b.i.i4$1bv32$2;
    v147$1 := $$a.i.i3$2bv32$1;
    v147$2 := $$a.i.i3$2bv32$2;
    v148$1 := $$b.i.i4$2bv32$1;
    v148$2 := $$b.i.i4$2bv32$2;
    v149$1 := $$a.i.i3$3bv32$1;
    v149$2 := $$a.i.i3$3bv32$2;
    v150$1 := $$b.i.i4$3bv32$1;
    v150$2 := $$b.i.i4$3bv32$2;
    $$34$0bv32$1 := FSUB32(v143$1, v144$1);
    $$34$0bv32$2 := FSUB32(v143$2, v144$2);
    $$34$1bv32$1 := FSUB32(v145$1, v146$1);
    $$34$1bv32$2 := FSUB32(v145$2, v146$2);
    $$34$2bv32$1 := FSUB32(v147$1, v148$1);
    $$34$2bv32$2 := FSUB32(v147$2, v148$2);
    $$34$3bv32$1 := FSUB32(v149$1, v150$1);
    $$34$3bv32$2 := FSUB32(v149$2, v150$2);
    v151$1 := $$34$0bv32$1;
    v151$2 := $$34$0bv32$2;
    v152$1 := $$34$1bv32$1;
    v152$2 := $$34$1bv32$2;
    v153$1 := $$34$2bv32$1;
    v153$2 := $$34$2bv32$2;
    v154$1 := $$34$3bv32$1;
    v154$2 := $$34$3bv32$2;
    $$35$0bv32$1 := v151$1;
    $$35$0bv32$2 := v151$2;
    $$35$1bv32$1 := v152$1;
    $$35$1bv32$2 := v152$2;
    $$35$2bv32$1 := v153$1;
    $$35$2bv32$2 := v153$2;
    $$35$3bv32$1 := v154$1;
    $$35$3bv32$2 := v154$2;
    v155$1 := $$35$0bv32$1;
    v155$2 := $$35$0bv32$2;
    v156$1 := $$35$1bv32$1;
    v156$2 := $$35$1bv32$2;
    v157$1 := $$35$2bv32$1;
    v157$2 := $$35$2bv32$2;
    v158$1 := $$35$3bv32$1;
    v158$2 := $$35$3bv32$2;
    $$r.i7$0bv32$1 := v155$1;
    $$r.i7$0bv32$2 := v155$2;
    $$r.i7$1bv32$1 := v156$1;
    $$r.i7$1bv32$2 := v156$2;
    $$r.i7$2bv32$1 := v157$1;
    $$r.i7$2bv32$2 := v157$2;
    $$r.i7$3bv32$1 := v158$1;
    $$r.i7$3bv32$2 := v158$2;
    v159$1 := $$r.i7$0bv32$1;
    v159$2 := $$r.i7$0bv32$2;
    v160$1 := $$r.i7$0bv32$1;
    v160$2 := $$r.i7$0bv32$2;
    v161$1 := $$r.i7$1bv32$1;
    v161$2 := $$r.i7$1bv32$2;
    v162$1 := $$r.i7$1bv32$1;
    v162$2 := $$r.i7$1bv32$2;
    v163$1 := $$r.i7$2bv32$1;
    v163$2 := $$r.i7$2bv32$2;
    v164$1 := $$r.i7$2bv32$1;
    v164$2 := $$r.i7$2bv32$2;
    v165$1 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v159$1, v160$1), FMUL32(v161$1, v162$1)), FMUL32(v163$1, v164$1)), 902936343bv32))));
    v165$2 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v159$2, v160$2), FMUL32(v161$2, v162$2)), FMUL32(v163$2, v164$2)), 902936343bv32))));
    v166$1 := FMUL32(1116042691bv32, FMUL32(FMUL32(v165$1, v165$1), v165$1));
    v166$2 := FMUL32(1116042691bv32, FMUL32(FMUL32(v165$2, v165$2), v165$2));
    v167$1 := $$r.i7$0bv32$1;
    v167$2 := $$r.i7$0bv32$2;
    $$39$0bv32$1 := v167$1;
    $$39$0bv32$2 := v167$2;
    v168$1 := $$r.i7$1bv32$1;
    v168$2 := $$r.i7$1bv32$2;
    $$39$1bv32$1 := v168$1;
    $$39$1bv32$2 := v168$2;
    v169$1 := $$r.i7$2bv32$1;
    v169$2 := $$r.i7$2bv32$2;
    $$39$2bv32$1 := v169$1;
    $$39$2bv32$2 := v169$2;
    v170$1 := $$r.i7$3bv32$1;
    v170$2 := $$r.i7$3bv32$2;
    $$39$3bv32$1 := v170$1;
    $$39$3bv32$2 := v170$2;
    v171$1 := $$39$0bv32$1;
    v171$2 := $$39$0bv32$2;
    v172$1 := $$39$1bv32$1;
    v172$2 := $$39$1bv32$2;
    v173$1 := $$39$2bv32$1;
    v173$2 := $$39$2bv32$2;
    v174$1 := $$39$3bv32$1;
    v174$2 := $$39$3bv32$2;
    $$a.i2.i1$0bv32$1 := v171$1;
    $$a.i2.i1$0bv32$2 := v171$2;
    $$a.i2.i1$1bv32$1 := v172$1;
    $$a.i2.i1$1bv32$2 := v172$2;
    $$a.i2.i1$2bv32$1 := v173$1;
    $$a.i2.i1$2bv32$2 := v173$2;
    $$a.i2.i1$3bv32$1 := v174$1;
    $$a.i2.i1$3bv32$2 := v174$2;
    v175$1 := $$a.i2.i1$0bv32$1;
    v175$2 := $$a.i2.i1$0bv32$2;
    v176$1 := $$a.i2.i1$1bv32$1;
    v176$2 := $$a.i2.i1$1bv32$2;
    v177$1 := $$a.i2.i1$2bv32$1;
    v177$2 := $$a.i2.i1$2bv32$2;
    v178$1 := $$a.i2.i1$3bv32$1;
    v178$2 := $$a.i2.i1$3bv32$2;
    $$30$0bv32$1 := FMUL32(v175$1, v166$1);
    $$30$0bv32$2 := FMUL32(v175$2, v166$2);
    $$30$1bv32$1 := FMUL32(v176$1, v166$1);
    $$30$1bv32$2 := FMUL32(v176$2, v166$2);
    $$30$2bv32$1 := FMUL32(v177$1, v166$1);
    $$30$2bv32$2 := FMUL32(v177$2, v166$2);
    $$30$3bv32$1 := FMUL32(v178$1, v166$1);
    $$30$3bv32$2 := FMUL32(v178$2, v166$2);
    v179$1 := $$30$0bv32$1;
    v179$2 := $$30$0bv32$2;
    v180$1 := $$30$1bv32$1;
    v180$2 := $$30$1bv32$2;
    v181$1 := $$30$2bv32$1;
    v181$2 := $$30$2bv32$2;
    v182$1 := $$30$3bv32$1;
    v182$2 := $$30$3bv32$2;
    $$31$0bv32$1 := v179$1;
    $$31$0bv32$2 := v179$2;
    $$31$1bv32$1 := v180$1;
    $$31$1bv32$2 := v180$2;
    $$31$2bv32$1 := v181$1;
    $$31$2bv32$2 := v181$2;
    $$31$3bv32$1 := v182$1;
    $$31$3bv32$2 := v182$2;
    v183$1 := $$31$0bv32$1;
    v183$2 := $$31$0bv32$2;
    v184$1 := $$31$1bv32$1;
    v184$2 := $$31$1bv32$2;
    v185$1 := $$31$2bv32$1;
    v185$2 := $$31$2bv32$2;
    v186$1 := $$31$3bv32$1;
    v186$2 := $$31$3bv32$2;
    $$38$0bv32$1 := v183$1;
    $$38$0bv32$2 := v183$2;
    $$38$1bv32$1 := v184$1;
    $$38$1bv32$2 := v184$2;
    $$38$2bv32$1 := v185$1;
    $$38$2bv32$2 := v185$2;
    $$38$3bv32$1 := v186$1;
    $$38$3bv32$2 := v186$2;
    v187$1 := $$38$0bv32$1;
    v187$2 := $$38$0bv32$2;
    v188$1 := $$38$1bv32$1;
    v188$2 := $$38$1bv32$2;
    v189$1 := $$38$2bv32$1;
    v189$2 := $$38$2bv32$2;
    v190$1 := $$38$3bv32$1;
    v190$2 := $$38$3bv32$2;
    $$b.i1.i2$0bv32$1 := v187$1;
    $$b.i1.i2$0bv32$2 := v187$2;
    $$b.i1.i2$1bv32$1 := v188$1;
    $$b.i1.i2$1bv32$2 := v188$2;
    $$b.i1.i2$2bv32$1 := v189$1;
    $$b.i1.i2$2bv32$2 := v189$2;
    $$b.i1.i2$3bv32$1 := v190$1;
    $$b.i1.i2$3bv32$2 := v190$2;
    v191$1 := $$acc$0bv32$1;
    v191$2 := $$acc$0bv32$2;
    v192$1 := $$b.i1.i2$0bv32$1;
    v192$2 := $$b.i1.i2$0bv32$2;
    v193$1 := $$acc$1bv32$1;
    v193$2 := $$acc$1bv32$2;
    v194$1 := $$b.i1.i2$1bv32$1;
    v194$2 := $$b.i1.i2$1bv32$2;
    v195$1 := $$acc$2bv32$1;
    v195$2 := $$acc$2bv32$2;
    v196$1 := $$b.i1.i2$2bv32$1;
    v196$2 := $$b.i1.i2$2bv32$2;
    v197$1 := $$acc$3bv32$1;
    v197$2 := $$acc$3bv32$2;
    v198$1 := $$b.i1.i2$3bv32$1;
    v198$2 := $$b.i1.i2$3bv32$2;
    $$32$0bv32$1 := FADD32(v191$1, v192$1);
    $$32$0bv32$2 := FADD32(v191$2, v192$2);
    $$32$1bv32$1 := FADD32(v193$1, v194$1);
    $$32$1bv32$2 := FADD32(v193$2, v194$2);
    $$32$2bv32$1 := FADD32(v195$1, v196$1);
    $$32$2bv32$2 := FADD32(v195$2, v196$2);
    $$32$3bv32$1 := FADD32(v197$1, v198$1);
    $$32$3bv32$2 := FADD32(v197$2, v198$2);
    v199$1 := $$32$0bv32$1;
    v199$2 := $$32$0bv32$2;
    v200$1 := $$32$1bv32$1;
    v200$2 := $$32$1bv32$2;
    v201$1 := $$32$2bv32$1;
    v201$2 := $$32$2bv32$2;
    v202$1 := $$32$3bv32$1;
    v202$2 := $$32$3bv32$2;
    $$33$0bv32$1 := v199$1;
    $$33$0bv32$2 := v199$2;
    $$33$1bv32$1 := v200$1;
    $$33$1bv32$2 := v200$2;
    $$33$2bv32$1 := v201$1;
    $$33$2bv32$2 := v201$2;
    $$33$3bv32$1 := v202$1;
    $$33$3bv32$2 := v202$2;
    v203$1 := $$33$0bv32$1;
    v203$2 := $$33$0bv32$2;
    $$acc$0bv32$1 := v203$1;
    $$acc$0bv32$2 := v203$2;
    v204$1 := $$33$1bv32$1;
    v204$2 := $$33$1bv32$2;
    $$acc$1bv32$1 := v204$1;
    $$acc$1bv32$2 := v204$2;
    v205$1 := $$33$2bv32$1;
    v205$2 := $$33$2bv32$2;
    $$acc$2bv32$1 := v205$1;
    $$acc$2bv32$2 := v205$2;
    v206$1 := $$33$3bv32$1;
    v206$2 := $$33$3bv32$2;
    $$acc$3bv32$1 := v206$1;
    $$acc$3bv32$2 := v206$2;
    v207$1 := $$p_pos$0bv32$1;
    v207$2 := $$p_pos$0bv32$2;
    $$54$0bv32$1 := v207$1;
    $$54$0bv32$2 := v207$2;
    v208$1 := $$p_pos$1bv32$1;
    v208$2 := $$p_pos$1bv32$2;
    $$54$1bv32$1 := v208$1;
    $$54$1bv32$2 := v208$2;
    v209$1 := $$p_pos$2bv32$1;
    v209$2 := $$p_pos$2bv32$2;
    $$54$2bv32$1 := v209$1;
    $$54$2bv32$2 := v209$2;
    v210$1 := $$p_pos$3bv32$1;
    v210$2 := $$p_pos$3bv32$2;
    $$54$3bv32$1 := v210$1;
    $$54$3bv32$2 := v210$2;
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 390} true;
    v211$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32)];
    v211$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32)];
    $$55$0bv32$1 := v211$1;
    $$55$0bv32$2 := v211$2;
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 392} true;
    v212$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 1bv32)];
    v212$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 1bv32)];
    $$55$1bv32$1 := v212$1;
    $$55$1bv32$2 := v212$2;
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 394} true;
    v213$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 2bv32)];
    v213$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 2bv32)];
    $$55$2bv32$1 := v213$1;
    $$55$2bv32$2 := v213$2;
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 396} true;
    v214$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 3bv32)];
    v214$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 2bv32), 4bv32), 3bv32)];
    $$55$3bv32$1 := v214$1;
    $$55$3bv32$2 := v214$2;
    v215$1 := $$54$0bv32$1;
    v215$2 := $$54$0bv32$2;
    v216$1 := $$54$1bv32$1;
    v216$2 := $$54$1bv32$2;
    v217$1 := $$54$2bv32$1;
    v217$2 := $$54$2bv32$2;
    v218$1 := $$54$3bv32$1;
    v218$2 := $$54$3bv32$2;
    v219$1 := $$55$0bv32$1;
    v219$2 := $$55$0bv32$2;
    v220$1 := $$55$1bv32$1;
    v220$2 := $$55$1bv32$2;
    v221$1 := $$55$2bv32$1;
    v221$2 := $$55$2bv32$2;
    v222$1 := $$55$3bv32$1;
    v222$2 := $$55$3bv32$2;
    $$my_curr_pos.i16$0bv32$1 := v215$1;
    $$my_curr_pos.i16$0bv32$2 := v215$2;
    $$my_curr_pos.i16$1bv32$1 := v216$1;
    $$my_curr_pos.i16$1bv32$2 := v216$2;
    $$my_curr_pos.i16$2bv32$1 := v217$1;
    $$my_curr_pos.i16$2bv32$2 := v217$2;
    $$my_curr_pos.i16$3bv32$1 := v218$1;
    $$my_curr_pos.i16$3bv32$2 := v218$2;
    $$other_element_old_pos.i17$0bv32$1 := v219$1;
    $$other_element_old_pos.i17$0bv32$2 := v219$2;
    $$other_element_old_pos.i17$1bv32$1 := v220$1;
    $$other_element_old_pos.i17$1bv32$2 := v220$2;
    $$other_element_old_pos.i17$2bv32$1 := v221$1;
    $$other_element_old_pos.i17$2bv32$2 := v221$2;
    $$other_element_old_pos.i17$3bv32$1 := v222$1;
    $$other_element_old_pos.i17$3bv32$2 := v222$2;
    v223$1 := $$other_element_old_pos.i17$0bv32$1;
    v223$2 := $$other_element_old_pos.i17$0bv32$2;
    $$26$0bv32$1 := v223$1;
    $$26$0bv32$2 := v223$2;
    v224$1 := $$other_element_old_pos.i17$1bv32$1;
    v224$2 := $$other_element_old_pos.i17$1bv32$2;
    $$26$1bv32$1 := v224$1;
    $$26$1bv32$2 := v224$2;
    v225$1 := $$other_element_old_pos.i17$2bv32$1;
    v225$2 := $$other_element_old_pos.i17$2bv32$2;
    $$26$2bv32$1 := v225$1;
    $$26$2bv32$2 := v225$2;
    v226$1 := $$other_element_old_pos.i17$3bv32$1;
    v226$2 := $$other_element_old_pos.i17$3bv32$2;
    $$26$3bv32$1 := v226$1;
    $$26$3bv32$2 := v226$2;
    v227$1 := $$my_curr_pos.i16$0bv32$1;
    v227$2 := $$my_curr_pos.i16$0bv32$2;
    $$27$0bv32$1 := v227$1;
    $$27$0bv32$2 := v227$2;
    v228$1 := $$my_curr_pos.i16$1bv32$1;
    v228$2 := $$my_curr_pos.i16$1bv32$2;
    $$27$1bv32$1 := v228$1;
    $$27$1bv32$2 := v228$2;
    v229$1 := $$my_curr_pos.i16$2bv32$1;
    v229$2 := $$my_curr_pos.i16$2bv32$2;
    $$27$2bv32$1 := v229$1;
    $$27$2bv32$2 := v229$2;
    v230$1 := $$my_curr_pos.i16$3bv32$1;
    v230$2 := $$my_curr_pos.i16$3bv32$2;
    $$27$3bv32$1 := v230$1;
    $$27$3bv32$2 := v230$2;
    v231$1 := $$26$0bv32$1;
    v231$2 := $$26$0bv32$2;
    v232$1 := $$26$1bv32$1;
    v232$2 := $$26$1bv32$2;
    v233$1 := $$26$2bv32$1;
    v233$2 := $$26$2bv32$2;
    v234$1 := $$26$3bv32$1;
    v234$2 := $$26$3bv32$2;
    v235$1 := $$27$0bv32$1;
    v235$2 := $$27$0bv32$2;
    v236$1 := $$27$1bv32$1;
    v236$2 := $$27$1bv32$2;
    v237$1 := $$27$2bv32$1;
    v237$2 := $$27$2bv32$2;
    v238$1 := $$27$3bv32$1;
    v238$2 := $$27$3bv32$2;
    $$a.i.i14$0bv32$1 := v231$1;
    $$a.i.i14$0bv32$2 := v231$2;
    $$a.i.i14$1bv32$1 := v232$1;
    $$a.i.i14$1bv32$2 := v232$2;
    $$a.i.i14$2bv32$1 := v233$1;
    $$a.i.i14$2bv32$2 := v233$2;
    $$a.i.i14$3bv32$1 := v234$1;
    $$a.i.i14$3bv32$2 := v234$2;
    $$b.i.i15$0bv32$1 := v235$1;
    $$b.i.i15$0bv32$2 := v235$2;
    $$b.i.i15$1bv32$1 := v236$1;
    $$b.i.i15$1bv32$2 := v236$2;
    $$b.i.i15$2bv32$1 := v237$1;
    $$b.i.i15$2bv32$2 := v237$2;
    $$b.i.i15$3bv32$1 := v238$1;
    $$b.i.i15$3bv32$2 := v238$2;
    v239$1 := $$a.i.i14$0bv32$1;
    v239$2 := $$a.i.i14$0bv32$2;
    v240$1 := $$b.i.i15$0bv32$1;
    v240$2 := $$b.i.i15$0bv32$2;
    v241$1 := $$a.i.i14$1bv32$1;
    v241$2 := $$a.i.i14$1bv32$2;
    v242$1 := $$b.i.i15$1bv32$1;
    v242$2 := $$b.i.i15$1bv32$2;
    v243$1 := $$a.i.i14$2bv32$1;
    v243$2 := $$a.i.i14$2bv32$2;
    v244$1 := $$b.i.i15$2bv32$1;
    v244$2 := $$b.i.i15$2bv32$2;
    v245$1 := $$a.i.i14$3bv32$1;
    v245$2 := $$a.i.i14$3bv32$2;
    v246$1 := $$b.i.i15$3bv32$1;
    v246$2 := $$b.i.i15$3bv32$2;
    $$24$0bv32$1 := FSUB32(v239$1, v240$1);
    $$24$0bv32$2 := FSUB32(v239$2, v240$2);
    $$24$1bv32$1 := FSUB32(v241$1, v242$1);
    $$24$1bv32$2 := FSUB32(v241$2, v242$2);
    $$24$2bv32$1 := FSUB32(v243$1, v244$1);
    $$24$2bv32$2 := FSUB32(v243$2, v244$2);
    $$24$3bv32$1 := FSUB32(v245$1, v246$1);
    $$24$3bv32$2 := FSUB32(v245$2, v246$2);
    v247$1 := $$24$0bv32$1;
    v247$2 := $$24$0bv32$2;
    v248$1 := $$24$1bv32$1;
    v248$2 := $$24$1bv32$2;
    v249$1 := $$24$2bv32$1;
    v249$2 := $$24$2bv32$2;
    v250$1 := $$24$3bv32$1;
    v250$2 := $$24$3bv32$2;
    $$25$0bv32$1 := v247$1;
    $$25$0bv32$2 := v247$2;
    $$25$1bv32$1 := v248$1;
    $$25$1bv32$2 := v248$2;
    $$25$2bv32$1 := v249$1;
    $$25$2bv32$2 := v249$2;
    $$25$3bv32$1 := v250$1;
    $$25$3bv32$2 := v250$2;
    v251$1 := $$25$0bv32$1;
    v251$2 := $$25$0bv32$2;
    v252$1 := $$25$1bv32$1;
    v252$2 := $$25$1bv32$2;
    v253$1 := $$25$2bv32$1;
    v253$2 := $$25$2bv32$2;
    v254$1 := $$25$3bv32$1;
    v254$2 := $$25$3bv32$2;
    $$r.i18$0bv32$1 := v251$1;
    $$r.i18$0bv32$2 := v251$2;
    $$r.i18$1bv32$1 := v252$1;
    $$r.i18$1bv32$2 := v252$2;
    $$r.i18$2bv32$1 := v253$1;
    $$r.i18$2bv32$2 := v253$2;
    $$r.i18$3bv32$1 := v254$1;
    $$r.i18$3bv32$2 := v254$2;
    v255$1 := $$r.i18$0bv32$1;
    v255$2 := $$r.i18$0bv32$2;
    v256$1 := $$r.i18$0bv32$1;
    v256$2 := $$r.i18$0bv32$2;
    v257$1 := $$r.i18$1bv32$1;
    v257$2 := $$r.i18$1bv32$2;
    v258$1 := $$r.i18$1bv32$1;
    v258$2 := $$r.i18$1bv32$2;
    v259$1 := $$r.i18$2bv32$1;
    v259$2 := $$r.i18$2bv32$2;
    v260$1 := $$r.i18$2bv32$1;
    v260$2 := $$r.i18$2bv32$2;
    v261$1 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v255$1, v256$1), FMUL32(v257$1, v258$1)), FMUL32(v259$1, v260$1)), 902936343bv32))));
    v261$2 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v255$2, v256$2), FMUL32(v257$2, v258$2)), FMUL32(v259$2, v260$2)), 902936343bv32))));
    v262$1 := FMUL32(1116042691bv32, FMUL32(FMUL32(v261$1, v261$1), v261$1));
    v262$2 := FMUL32(1116042691bv32, FMUL32(FMUL32(v261$2, v261$2), v261$2));
    v263$1 := $$r.i18$0bv32$1;
    v263$2 := $$r.i18$0bv32$2;
    $$29$0bv32$1 := v263$1;
    $$29$0bv32$2 := v263$2;
    v264$1 := $$r.i18$1bv32$1;
    v264$2 := $$r.i18$1bv32$2;
    $$29$1bv32$1 := v264$1;
    $$29$1bv32$2 := v264$2;
    v265$1 := $$r.i18$2bv32$1;
    v265$2 := $$r.i18$2bv32$2;
    $$29$2bv32$1 := v265$1;
    $$29$2bv32$2 := v265$2;
    v266$1 := $$r.i18$3bv32$1;
    v266$2 := $$r.i18$3bv32$2;
    $$29$3bv32$1 := v266$1;
    $$29$3bv32$2 := v266$2;
    v267$1 := $$29$0bv32$1;
    v267$2 := $$29$0bv32$2;
    v268$1 := $$29$1bv32$1;
    v268$2 := $$29$1bv32$2;
    v269$1 := $$29$2bv32$1;
    v269$2 := $$29$2bv32$2;
    v270$1 := $$29$3bv32$1;
    v270$2 := $$29$3bv32$2;
    $$a.i2.i12$0bv32$1 := v267$1;
    $$a.i2.i12$0bv32$2 := v267$2;
    $$a.i2.i12$1bv32$1 := v268$1;
    $$a.i2.i12$1bv32$2 := v268$2;
    $$a.i2.i12$2bv32$1 := v269$1;
    $$a.i2.i12$2bv32$2 := v269$2;
    $$a.i2.i12$3bv32$1 := v270$1;
    $$a.i2.i12$3bv32$2 := v270$2;
    v271$1 := $$a.i2.i12$0bv32$1;
    v271$2 := $$a.i2.i12$0bv32$2;
    v272$1 := $$a.i2.i12$1bv32$1;
    v272$2 := $$a.i2.i12$1bv32$2;
    v273$1 := $$a.i2.i12$2bv32$1;
    v273$2 := $$a.i2.i12$2bv32$2;
    v274$1 := $$a.i2.i12$3bv32$1;
    v274$2 := $$a.i2.i12$3bv32$2;
    $$20$0bv32$1 := FMUL32(v271$1, v262$1);
    $$20$0bv32$2 := FMUL32(v271$2, v262$2);
    $$20$1bv32$1 := FMUL32(v272$1, v262$1);
    $$20$1bv32$2 := FMUL32(v272$2, v262$2);
    $$20$2bv32$1 := FMUL32(v273$1, v262$1);
    $$20$2bv32$2 := FMUL32(v273$2, v262$2);
    $$20$3bv32$1 := FMUL32(v274$1, v262$1);
    $$20$3bv32$2 := FMUL32(v274$2, v262$2);
    v275$1 := $$20$0bv32$1;
    v275$2 := $$20$0bv32$2;
    v276$1 := $$20$1bv32$1;
    v276$2 := $$20$1bv32$2;
    v277$1 := $$20$2bv32$1;
    v277$2 := $$20$2bv32$2;
    v278$1 := $$20$3bv32$1;
    v278$2 := $$20$3bv32$2;
    $$21$0bv32$1 := v275$1;
    $$21$0bv32$2 := v275$2;
    $$21$1bv32$1 := v276$1;
    $$21$1bv32$2 := v276$2;
    $$21$2bv32$1 := v277$1;
    $$21$2bv32$2 := v277$2;
    $$21$3bv32$1 := v278$1;
    $$21$3bv32$2 := v278$2;
    v279$1 := $$21$0bv32$1;
    v279$2 := $$21$0bv32$2;
    v280$1 := $$21$1bv32$1;
    v280$2 := $$21$1bv32$2;
    v281$1 := $$21$2bv32$1;
    v281$2 := $$21$2bv32$2;
    v282$1 := $$21$3bv32$1;
    v282$2 := $$21$3bv32$2;
    $$28$0bv32$1 := v279$1;
    $$28$0bv32$2 := v279$2;
    $$28$1bv32$1 := v280$1;
    $$28$1bv32$2 := v280$2;
    $$28$2bv32$1 := v281$1;
    $$28$2bv32$2 := v281$2;
    $$28$3bv32$1 := v282$1;
    $$28$3bv32$2 := v282$2;
    v283$1 := $$28$0bv32$1;
    v283$2 := $$28$0bv32$2;
    v284$1 := $$28$1bv32$1;
    v284$2 := $$28$1bv32$2;
    v285$1 := $$28$2bv32$1;
    v285$2 := $$28$2bv32$2;
    v286$1 := $$28$3bv32$1;
    v286$2 := $$28$3bv32$2;
    $$b.i1.i13$0bv32$1 := v283$1;
    $$b.i1.i13$0bv32$2 := v283$2;
    $$b.i1.i13$1bv32$1 := v284$1;
    $$b.i1.i13$1bv32$2 := v284$2;
    $$b.i1.i13$2bv32$1 := v285$1;
    $$b.i1.i13$2bv32$2 := v285$2;
    $$b.i1.i13$3bv32$1 := v286$1;
    $$b.i1.i13$3bv32$2 := v286$2;
    v287$1 := $$acc$0bv32$1;
    v287$2 := $$acc$0bv32$2;
    v288$1 := $$b.i1.i13$0bv32$1;
    v288$2 := $$b.i1.i13$0bv32$2;
    v289$1 := $$acc$1bv32$1;
    v289$2 := $$acc$1bv32$2;
    v290$1 := $$b.i1.i13$1bv32$1;
    v290$2 := $$b.i1.i13$1bv32$2;
    v291$1 := $$acc$2bv32$1;
    v291$2 := $$acc$2bv32$2;
    v292$1 := $$b.i1.i13$2bv32$1;
    v292$2 := $$b.i1.i13$2bv32$2;
    v293$1 := $$acc$3bv32$1;
    v293$2 := $$acc$3bv32$2;
    v294$1 := $$b.i1.i13$3bv32$1;
    v294$2 := $$b.i1.i13$3bv32$2;
    $$22$0bv32$1 := FADD32(v287$1, v288$1);
    $$22$0bv32$2 := FADD32(v287$2, v288$2);
    $$22$1bv32$1 := FADD32(v289$1, v290$1);
    $$22$1bv32$2 := FADD32(v289$2, v290$2);
    $$22$2bv32$1 := FADD32(v291$1, v292$1);
    $$22$2bv32$2 := FADD32(v291$2, v292$2);
    $$22$3bv32$1 := FADD32(v293$1, v294$1);
    $$22$3bv32$2 := FADD32(v293$2, v294$2);
    v295$1 := $$22$0bv32$1;
    v295$2 := $$22$0bv32$2;
    v296$1 := $$22$1bv32$1;
    v296$2 := $$22$1bv32$2;
    v297$1 := $$22$2bv32$1;
    v297$2 := $$22$2bv32$2;
    v298$1 := $$22$3bv32$1;
    v298$2 := $$22$3bv32$2;
    $$23$0bv32$1 := v295$1;
    $$23$0bv32$2 := v295$2;
    $$23$1bv32$1 := v296$1;
    $$23$1bv32$2 := v296$2;
    $$23$2bv32$1 := v297$1;
    $$23$2bv32$2 := v297$2;
    $$23$3bv32$1 := v298$1;
    $$23$3bv32$2 := v298$2;
    v299$1 := $$23$0bv32$1;
    v299$2 := $$23$0bv32$2;
    $$acc$0bv32$1 := v299$1;
    $$acc$0bv32$2 := v299$2;
    v300$1 := $$23$1bv32$1;
    v300$2 := $$23$1bv32$2;
    $$acc$1bv32$1 := v300$1;
    $$acc$1bv32$2 := v300$2;
    v301$1 := $$23$2bv32$1;
    v301$2 := $$23$2bv32$2;
    $$acc$2bv32$1 := v301$1;
    $$acc$2bv32$2 := v301$2;
    v302$1 := $$23$3bv32$1;
    v302$2 := $$23$3bv32$2;
    $$acc$3bv32$1 := v302$1;
    $$acc$3bv32$2 := v302$2;
    v303$1 := $$p_pos$0bv32$1;
    v303$2 := $$p_pos$0bv32$2;
    $$56$0bv32$1 := v303$1;
    $$56$0bv32$2 := v303$2;
    v304$1 := $$p_pos$1bv32$1;
    v304$2 := $$p_pos$1bv32$2;
    $$56$1bv32$1 := v304$1;
    $$56$1bv32$2 := v304$2;
    v305$1 := $$p_pos$2bv32$1;
    v305$2 := $$p_pos$2bv32$2;
    $$56$2bv32$1 := v305$1;
    $$56$2bv32$2 := v305$2;
    v306$1 := $$p_pos$3bv32$1;
    v306$2 := $$p_pos$3bv32$2;
    $$56$3bv32$1 := v306$1;
    $$56$3bv32$2 := v306$2;
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 564} true;
    v307$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32)];
    v307$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32)];
    $$57$0bv32$1 := v307$1;
    $$57$0bv32$2 := v307$2;
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 566} true;
    v308$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 1bv32)];
    v308$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 1bv32)];
    $$57$1bv32$1 := v308$1;
    $$57$1bv32$2 := v308$2;
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 568} true;
    v309$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 2bv32)];
    v309$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 2bv32)];
    $$57$2bv32$1 := v309$1;
    $$57$2bv32$2 := v309$2;
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 570} true;
    v310$1 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 3bv32)];
    v310$2 := $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($j.0, 3bv32), 4bv32), 3bv32)];
    $$57$3bv32$1 := v310$1;
    $$57$3bv32$2 := v310$2;
    v311$1 := $$56$0bv32$1;
    v311$2 := $$56$0bv32$2;
    v312$1 := $$56$1bv32$1;
    v312$2 := $$56$1bv32$2;
    v313$1 := $$56$2bv32$1;
    v313$2 := $$56$2bv32$2;
    v314$1 := $$56$3bv32$1;
    v314$2 := $$56$3bv32$2;
    v315$1 := $$57$0bv32$1;
    v315$2 := $$57$0bv32$2;
    v316$1 := $$57$1bv32$1;
    v316$2 := $$57$1bv32$2;
    v317$1 := $$57$2bv32$1;
    v317$2 := $$57$2bv32$2;
    v318$1 := $$57$3bv32$1;
    v318$2 := $$57$3bv32$2;
    $$my_curr_pos.i27$0bv32$1 := v311$1;
    $$my_curr_pos.i27$0bv32$2 := v311$2;
    $$my_curr_pos.i27$1bv32$1 := v312$1;
    $$my_curr_pos.i27$1bv32$2 := v312$2;
    $$my_curr_pos.i27$2bv32$1 := v313$1;
    $$my_curr_pos.i27$2bv32$2 := v313$2;
    $$my_curr_pos.i27$3bv32$1 := v314$1;
    $$my_curr_pos.i27$3bv32$2 := v314$2;
    $$other_element_old_pos.i28$0bv32$1 := v315$1;
    $$other_element_old_pos.i28$0bv32$2 := v315$2;
    $$other_element_old_pos.i28$1bv32$1 := v316$1;
    $$other_element_old_pos.i28$1bv32$2 := v316$2;
    $$other_element_old_pos.i28$2bv32$1 := v317$1;
    $$other_element_old_pos.i28$2bv32$2 := v317$2;
    $$other_element_old_pos.i28$3bv32$1 := v318$1;
    $$other_element_old_pos.i28$3bv32$2 := v318$2;
    v319$1 := $$other_element_old_pos.i28$0bv32$1;
    v319$2 := $$other_element_old_pos.i28$0bv32$2;
    $$16$0bv32$1 := v319$1;
    $$16$0bv32$2 := v319$2;
    v320$1 := $$other_element_old_pos.i28$1bv32$1;
    v320$2 := $$other_element_old_pos.i28$1bv32$2;
    $$16$1bv32$1 := v320$1;
    $$16$1bv32$2 := v320$2;
    v321$1 := $$other_element_old_pos.i28$2bv32$1;
    v321$2 := $$other_element_old_pos.i28$2bv32$2;
    $$16$2bv32$1 := v321$1;
    $$16$2bv32$2 := v321$2;
    v322$1 := $$other_element_old_pos.i28$3bv32$1;
    v322$2 := $$other_element_old_pos.i28$3bv32$2;
    $$16$3bv32$1 := v322$1;
    $$16$3bv32$2 := v322$2;
    v323$1 := $$my_curr_pos.i27$0bv32$1;
    v323$2 := $$my_curr_pos.i27$0bv32$2;
    $$17$0bv32$1 := v323$1;
    $$17$0bv32$2 := v323$2;
    v324$1 := $$my_curr_pos.i27$1bv32$1;
    v324$2 := $$my_curr_pos.i27$1bv32$2;
    $$17$1bv32$1 := v324$1;
    $$17$1bv32$2 := v324$2;
    v325$1 := $$my_curr_pos.i27$2bv32$1;
    v325$2 := $$my_curr_pos.i27$2bv32$2;
    $$17$2bv32$1 := v325$1;
    $$17$2bv32$2 := v325$2;
    v326$1 := $$my_curr_pos.i27$3bv32$1;
    v326$2 := $$my_curr_pos.i27$3bv32$2;
    $$17$3bv32$1 := v326$1;
    $$17$3bv32$2 := v326$2;
    v327$1 := $$16$0bv32$1;
    v327$2 := $$16$0bv32$2;
    v328$1 := $$16$1bv32$1;
    v328$2 := $$16$1bv32$2;
    v329$1 := $$16$2bv32$1;
    v329$2 := $$16$2bv32$2;
    v330$1 := $$16$3bv32$1;
    v330$2 := $$16$3bv32$2;
    v331$1 := $$17$0bv32$1;
    v331$2 := $$17$0bv32$2;
    v332$1 := $$17$1bv32$1;
    v332$2 := $$17$1bv32$2;
    v333$1 := $$17$2bv32$1;
    v333$2 := $$17$2bv32$2;
    v334$1 := $$17$3bv32$1;
    v334$2 := $$17$3bv32$2;
    $$a.i.i25$0bv32$1 := v327$1;
    $$a.i.i25$0bv32$2 := v327$2;
    $$a.i.i25$1bv32$1 := v328$1;
    $$a.i.i25$1bv32$2 := v328$2;
    $$a.i.i25$2bv32$1 := v329$1;
    $$a.i.i25$2bv32$2 := v329$2;
    $$a.i.i25$3bv32$1 := v330$1;
    $$a.i.i25$3bv32$2 := v330$2;
    $$b.i.i26$0bv32$1 := v331$1;
    $$b.i.i26$0bv32$2 := v331$2;
    $$b.i.i26$1bv32$1 := v332$1;
    $$b.i.i26$1bv32$2 := v332$2;
    $$b.i.i26$2bv32$1 := v333$1;
    $$b.i.i26$2bv32$2 := v333$2;
    $$b.i.i26$3bv32$1 := v334$1;
    $$b.i.i26$3bv32$2 := v334$2;
    v335$1 := $$a.i.i25$0bv32$1;
    v335$2 := $$a.i.i25$0bv32$2;
    v336$1 := $$b.i.i26$0bv32$1;
    v336$2 := $$b.i.i26$0bv32$2;
    v337$1 := $$a.i.i25$1bv32$1;
    v337$2 := $$a.i.i25$1bv32$2;
    v338$1 := $$b.i.i26$1bv32$1;
    v338$2 := $$b.i.i26$1bv32$2;
    v339$1 := $$a.i.i25$2bv32$1;
    v339$2 := $$a.i.i25$2bv32$2;
    v340$1 := $$b.i.i26$2bv32$1;
    v340$2 := $$b.i.i26$2bv32$2;
    v341$1 := $$a.i.i25$3bv32$1;
    v341$2 := $$a.i.i25$3bv32$2;
    v342$1 := $$b.i.i26$3bv32$1;
    v342$2 := $$b.i.i26$3bv32$2;
    $$14$0bv32$1 := FSUB32(v335$1, v336$1);
    $$14$0bv32$2 := FSUB32(v335$2, v336$2);
    $$14$1bv32$1 := FSUB32(v337$1, v338$1);
    $$14$1bv32$2 := FSUB32(v337$2, v338$2);
    $$14$2bv32$1 := FSUB32(v339$1, v340$1);
    $$14$2bv32$2 := FSUB32(v339$2, v340$2);
    $$14$3bv32$1 := FSUB32(v341$1, v342$1);
    $$14$3bv32$2 := FSUB32(v341$2, v342$2);
    v343$1 := $$14$0bv32$1;
    v343$2 := $$14$0bv32$2;
    v344$1 := $$14$1bv32$1;
    v344$2 := $$14$1bv32$2;
    v345$1 := $$14$2bv32$1;
    v345$2 := $$14$2bv32$2;
    v346$1 := $$14$3bv32$1;
    v346$2 := $$14$3bv32$2;
    $$15$0bv32$1 := v343$1;
    $$15$0bv32$2 := v343$2;
    $$15$1bv32$1 := v344$1;
    $$15$1bv32$2 := v344$2;
    $$15$2bv32$1 := v345$1;
    $$15$2bv32$2 := v345$2;
    $$15$3bv32$1 := v346$1;
    $$15$3bv32$2 := v346$2;
    v347$1 := $$15$0bv32$1;
    v347$2 := $$15$0bv32$2;
    v348$1 := $$15$1bv32$1;
    v348$2 := $$15$1bv32$2;
    v349$1 := $$15$2bv32$1;
    v349$2 := $$15$2bv32$2;
    v350$1 := $$15$3bv32$1;
    v350$2 := $$15$3bv32$2;
    $$r.i29$0bv32$1 := v347$1;
    $$r.i29$0bv32$2 := v347$2;
    $$r.i29$1bv32$1 := v348$1;
    $$r.i29$1bv32$2 := v348$2;
    $$r.i29$2bv32$1 := v349$1;
    $$r.i29$2bv32$2 := v349$2;
    $$r.i29$3bv32$1 := v350$1;
    $$r.i29$3bv32$2 := v350$2;
    v351$1 := $$r.i29$0bv32$1;
    v351$2 := $$r.i29$0bv32$2;
    v352$1 := $$r.i29$0bv32$1;
    v352$2 := $$r.i29$0bv32$2;
    v353$1 := $$r.i29$1bv32$1;
    v353$2 := $$r.i29$1bv32$2;
    v354$1 := $$r.i29$1bv32$1;
    v354$2 := $$r.i29$1bv32$2;
    v355$1 := $$r.i29$2bv32$1;
    v355$2 := $$r.i29$2bv32$2;
    v356$1 := $$r.i29$2bv32$1;
    v356$2 := $$r.i29$2bv32$2;
    v357$1 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v351$1, v352$1), FMUL32(v353$1, v354$1)), FMUL32(v355$1, v356$1)), 902936343bv32))));
    v357$2 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v351$2, v352$2), FMUL32(v353$2, v354$2)), FMUL32(v355$2, v356$2)), 902936343bv32))));
    v358$1 := FMUL32(1116042691bv32, FMUL32(FMUL32(v357$1, v357$1), v357$1));
    v358$2 := FMUL32(1116042691bv32, FMUL32(FMUL32(v357$2, v357$2), v357$2));
    v359$1 := $$r.i29$0bv32$1;
    v359$2 := $$r.i29$0bv32$2;
    $$19$0bv32$1 := v359$1;
    $$19$0bv32$2 := v359$2;
    v360$1 := $$r.i29$1bv32$1;
    v360$2 := $$r.i29$1bv32$2;
    $$19$1bv32$1 := v360$1;
    $$19$1bv32$2 := v360$2;
    v361$1 := $$r.i29$2bv32$1;
    v361$2 := $$r.i29$2bv32$2;
    $$19$2bv32$1 := v361$1;
    $$19$2bv32$2 := v361$2;
    v362$1 := $$r.i29$3bv32$1;
    v362$2 := $$r.i29$3bv32$2;
    $$19$3bv32$1 := v362$1;
    $$19$3bv32$2 := v362$2;
    v363$1 := $$19$0bv32$1;
    v363$2 := $$19$0bv32$2;
    v364$1 := $$19$1bv32$1;
    v364$2 := $$19$1bv32$2;
    v365$1 := $$19$2bv32$1;
    v365$2 := $$19$2bv32$2;
    v366$1 := $$19$3bv32$1;
    v366$2 := $$19$3bv32$2;
    $$a.i2.i23$0bv32$1 := v363$1;
    $$a.i2.i23$0bv32$2 := v363$2;
    $$a.i2.i23$1bv32$1 := v364$1;
    $$a.i2.i23$1bv32$2 := v364$2;
    $$a.i2.i23$2bv32$1 := v365$1;
    $$a.i2.i23$2bv32$2 := v365$2;
    $$a.i2.i23$3bv32$1 := v366$1;
    $$a.i2.i23$3bv32$2 := v366$2;
    v367$1 := $$a.i2.i23$0bv32$1;
    v367$2 := $$a.i2.i23$0bv32$2;
    v368$1 := $$a.i2.i23$1bv32$1;
    v368$2 := $$a.i2.i23$1bv32$2;
    v369$1 := $$a.i2.i23$2bv32$1;
    v369$2 := $$a.i2.i23$2bv32$2;
    v370$1 := $$a.i2.i23$3bv32$1;
    v370$2 := $$a.i2.i23$3bv32$2;
    $$10$0bv32$1 := FMUL32(v367$1, v358$1);
    $$10$0bv32$2 := FMUL32(v367$2, v358$2);
    $$10$1bv32$1 := FMUL32(v368$1, v358$1);
    $$10$1bv32$2 := FMUL32(v368$2, v358$2);
    $$10$2bv32$1 := FMUL32(v369$1, v358$1);
    $$10$2bv32$2 := FMUL32(v369$2, v358$2);
    $$10$3bv32$1 := FMUL32(v370$1, v358$1);
    $$10$3bv32$2 := FMUL32(v370$2, v358$2);
    v371$1 := $$10$0bv32$1;
    v371$2 := $$10$0bv32$2;
    v372$1 := $$10$1bv32$1;
    v372$2 := $$10$1bv32$2;
    v373$1 := $$10$2bv32$1;
    v373$2 := $$10$2bv32$2;
    v374$1 := $$10$3bv32$1;
    v374$2 := $$10$3bv32$2;
    $$11$0bv32$1 := v371$1;
    $$11$0bv32$2 := v371$2;
    $$11$1bv32$1 := v372$1;
    $$11$1bv32$2 := v372$2;
    $$11$2bv32$1 := v373$1;
    $$11$2bv32$2 := v373$2;
    $$11$3bv32$1 := v374$1;
    $$11$3bv32$2 := v374$2;
    v375$1 := $$11$0bv32$1;
    v375$2 := $$11$0bv32$2;
    v376$1 := $$11$1bv32$1;
    v376$2 := $$11$1bv32$2;
    v377$1 := $$11$2bv32$1;
    v377$2 := $$11$2bv32$2;
    v378$1 := $$11$3bv32$1;
    v378$2 := $$11$3bv32$2;
    $$18$0bv32$1 := v375$1;
    $$18$0bv32$2 := v375$2;
    $$18$1bv32$1 := v376$1;
    $$18$1bv32$2 := v376$2;
    $$18$2bv32$1 := v377$1;
    $$18$2bv32$2 := v377$2;
    $$18$3bv32$1 := v378$1;
    $$18$3bv32$2 := v378$2;
    v379$1 := $$18$0bv32$1;
    v379$2 := $$18$0bv32$2;
    v380$1 := $$18$1bv32$1;
    v380$2 := $$18$1bv32$2;
    v381$1 := $$18$2bv32$1;
    v381$2 := $$18$2bv32$2;
    v382$1 := $$18$3bv32$1;
    v382$2 := $$18$3bv32$2;
    $$b.i1.i24$0bv32$1 := v379$1;
    $$b.i1.i24$0bv32$2 := v379$2;
    $$b.i1.i24$1bv32$1 := v380$1;
    $$b.i1.i24$1bv32$2 := v380$2;
    $$b.i1.i24$2bv32$1 := v381$1;
    $$b.i1.i24$2bv32$2 := v381$2;
    $$b.i1.i24$3bv32$1 := v382$1;
    $$b.i1.i24$3bv32$2 := v382$2;
    v383$1 := $$acc$0bv32$1;
    v383$2 := $$acc$0bv32$2;
    v384$1 := $$b.i1.i24$0bv32$1;
    v384$2 := $$b.i1.i24$0bv32$2;
    v385$1 := $$acc$1bv32$1;
    v385$2 := $$acc$1bv32$2;
    v386$1 := $$b.i1.i24$1bv32$1;
    v386$2 := $$b.i1.i24$1bv32$2;
    v387$1 := $$acc$2bv32$1;
    v387$2 := $$acc$2bv32$2;
    v388$1 := $$b.i1.i24$2bv32$1;
    v388$2 := $$b.i1.i24$2bv32$2;
    v389$1 := $$acc$3bv32$1;
    v389$2 := $$acc$3bv32$2;
    v390$1 := $$b.i1.i24$3bv32$1;
    v390$2 := $$b.i1.i24$3bv32$2;
    $$12$0bv32$1 := FADD32(v383$1, v384$1);
    $$12$0bv32$2 := FADD32(v383$2, v384$2);
    $$12$1bv32$1 := FADD32(v385$1, v386$1);
    $$12$1bv32$2 := FADD32(v385$2, v386$2);
    $$12$2bv32$1 := FADD32(v387$1, v388$1);
    $$12$2bv32$2 := FADD32(v387$2, v388$2);
    $$12$3bv32$1 := FADD32(v389$1, v390$1);
    $$12$3bv32$2 := FADD32(v389$2, v390$2);
    v391$1 := $$12$0bv32$1;
    v391$2 := $$12$0bv32$2;
    v392$1 := $$12$1bv32$1;
    v392$2 := $$12$1bv32$2;
    v393$1 := $$12$2bv32$1;
    v393$2 := $$12$2bv32$2;
    v394$1 := $$12$3bv32$1;
    v394$2 := $$12$3bv32$2;
    $$13$0bv32$1 := v391$1;
    $$13$0bv32$2 := v391$2;
    $$13$1bv32$1 := v392$1;
    $$13$1bv32$2 := v392$2;
    $$13$2bv32$1 := v393$1;
    $$13$2bv32$2 := v393$2;
    $$13$3bv32$1 := v394$1;
    $$13$3bv32$2 := v394$2;
    v395$1 := $$13$0bv32$1;
    v395$2 := $$13$0bv32$2;
    $$acc$0bv32$1 := v395$1;
    $$acc$0bv32$2 := v395$2;
    v396$1 := $$13$1bv32$1;
    v396$2 := $$13$1bv32$2;
    $$acc$1bv32$1 := v396$1;
    $$acc$1bv32$2 := v396$2;
    v397$1 := $$13$2bv32$1;
    v397$2 := $$13$2bv32$2;
    $$acc$2bv32$1 := v397$1;
    $$acc$2bv32$2 := v397$2;
    v398$1 := $$13$3bv32$1;
    v398$2 := $$13$3bv32$2;
    $$acc$3bv32$1 := v398$1;
    $$acc$3bv32$2 := v398$2;
    $j.0 := BV32_ADD($j.0, 4bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, $$data_out_pos, $$data_out_vel, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, $$data_out_pos, $$data_out_vel, _TRACKING;



var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$0$3bv32$1: bv32;

var $$0$3bv32$2: bv32;

var $$b.i35$0bv32$1: bv32;

var $$b.i35$0bv32$2: bv32;

var $$b.i35$1bv32$1: bv32;

var $$b.i35$1bv32$2: bv32;

var $$b.i35$2bv32$1: bv32;

var $$b.i35$2bv32$2: bv32;

var $$b.i35$3bv32$1: bv32;

var $$b.i35$3bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$1$3bv32$1: bv32;

var $$1$3bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$2$3bv32$1: bv32;

var $$2$3bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$3$2bv32$1: bv32;

var $$3$2bv32$2: bv32;

var $$3$3bv32$1: bv32;

var $$3$3bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$4$3bv32$1: bv32;

var $$4$3bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$5$3bv32$1: bv32;

var $$5$3bv32$2: bv32;

var $$a.i34$0bv32$1: bv32;

var $$a.i34$0bv32$2: bv32;

var $$a.i34$1bv32$1: bv32;

var $$a.i34$1bv32$2: bv32;

var $$a.i34$2bv32$1: bv32;

var $$a.i34$2bv32$2: bv32;

var $$a.i34$3bv32$1: bv32;

var $$a.i34$3bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$6$3bv32$1: bv32;

var $$6$3bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$b.i$3bv32$1: bv32;

var $$b.i$3bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$7$3bv32$1: bv32;

var $$7$3bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$8$3bv32$1: bv32;

var $$8$3bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$9$3bv32$1: bv32;

var $$9$3bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$10$3bv32$1: bv32;

var $$10$3bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$11$2bv32$1: bv32;

var $$11$2bv32$2: bv32;

var $$11$3bv32$1: bv32;

var $$11$3bv32$2: bv32;

var $$a.i2.i23$0bv32$1: bv32;

var $$a.i2.i23$0bv32$2: bv32;

var $$a.i2.i23$1bv32$1: bv32;

var $$a.i2.i23$1bv32$2: bv32;

var $$a.i2.i23$2bv32$1: bv32;

var $$a.i2.i23$2bv32$2: bv32;

var $$a.i2.i23$3bv32$1: bv32;

var $$a.i2.i23$3bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$12$3bv32$1: bv32;

var $$12$3bv32$2: bv32;

var $$b.i1.i24$0bv32$1: bv32;

var $$b.i1.i24$0bv32$2: bv32;

var $$b.i1.i24$1bv32$1: bv32;

var $$b.i1.i24$1bv32$2: bv32;

var $$b.i1.i24$2bv32$1: bv32;

var $$b.i1.i24$2bv32$2: bv32;

var $$b.i1.i24$3bv32$1: bv32;

var $$b.i1.i24$3bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$13$2bv32$1: bv32;

var $$13$2bv32$2: bv32;

var $$13$3bv32$1: bv32;

var $$13$3bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$14$2bv32$1: bv32;

var $$14$2bv32$2: bv32;

var $$14$3bv32$1: bv32;

var $$14$3bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$15$2bv32$1: bv32;

var $$15$2bv32$2: bv32;

var $$15$3bv32$1: bv32;

var $$15$3bv32$2: bv32;

var $$a.i.i25$0bv32$1: bv32;

var $$a.i.i25$0bv32$2: bv32;

var $$a.i.i25$1bv32$1: bv32;

var $$a.i.i25$1bv32$2: bv32;

var $$a.i.i25$2bv32$1: bv32;

var $$a.i.i25$2bv32$2: bv32;

var $$a.i.i25$3bv32$1: bv32;

var $$a.i.i25$3bv32$2: bv32;

var $$b.i.i26$0bv32$1: bv32;

var $$b.i.i26$0bv32$2: bv32;

var $$b.i.i26$1bv32$1: bv32;

var $$b.i.i26$1bv32$2: bv32;

var $$b.i.i26$2bv32$1: bv32;

var $$b.i.i26$2bv32$2: bv32;

var $$b.i.i26$3bv32$1: bv32;

var $$b.i.i26$3bv32$2: bv32;

var $$my_curr_pos.i27$0bv32$1: bv32;

var $$my_curr_pos.i27$0bv32$2: bv32;

var $$my_curr_pos.i27$1bv32$1: bv32;

var $$my_curr_pos.i27$1bv32$2: bv32;

var $$my_curr_pos.i27$2bv32$1: bv32;

var $$my_curr_pos.i27$2bv32$2: bv32;

var $$my_curr_pos.i27$3bv32$1: bv32;

var $$my_curr_pos.i27$3bv32$2: bv32;

var $$other_element_old_pos.i28$0bv32$1: bv32;

var $$other_element_old_pos.i28$0bv32$2: bv32;

var $$other_element_old_pos.i28$1bv32$1: bv32;

var $$other_element_old_pos.i28$1bv32$2: bv32;

var $$other_element_old_pos.i28$2bv32$1: bv32;

var $$other_element_old_pos.i28$2bv32$2: bv32;

var $$other_element_old_pos.i28$3bv32$1: bv32;

var $$other_element_old_pos.i28$3bv32$2: bv32;

var $$r.i29$0bv32$1: bv32;

var $$r.i29$0bv32$2: bv32;

var $$r.i29$1bv32$1: bv32;

var $$r.i29$1bv32$2: bv32;

var $$r.i29$2bv32$1: bv32;

var $$r.i29$2bv32$2: bv32;

var $$r.i29$3bv32$1: bv32;

var $$r.i29$3bv32$2: bv32;

var $$16$0bv32$1: bv32;

var $$16$0bv32$2: bv32;

var $$16$1bv32$1: bv32;

var $$16$1bv32$2: bv32;

var $$16$2bv32$1: bv32;

var $$16$2bv32$2: bv32;

var $$16$3bv32$1: bv32;

var $$16$3bv32$2: bv32;

var $$17$0bv32$1: bv32;

var $$17$0bv32$2: bv32;

var $$17$1bv32$1: bv32;

var $$17$1bv32$2: bv32;

var $$17$2bv32$1: bv32;

var $$17$2bv32$2: bv32;

var $$17$3bv32$1: bv32;

var $$17$3bv32$2: bv32;

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$18$2bv32$1: bv32;

var $$18$2bv32$2: bv32;

var $$18$3bv32$1: bv32;

var $$18$3bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

var $$19$2bv32$1: bv32;

var $$19$2bv32$2: bv32;

var $$19$3bv32$1: bv32;

var $$19$3bv32$2: bv32;

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$20$3bv32$1: bv32;

var $$20$3bv32$2: bv32;

var $$21$0bv32$1: bv32;

var $$21$0bv32$2: bv32;

var $$21$1bv32$1: bv32;

var $$21$1bv32$2: bv32;

var $$21$2bv32$1: bv32;

var $$21$2bv32$2: bv32;

var $$21$3bv32$1: bv32;

var $$21$3bv32$2: bv32;

var $$a.i2.i12$0bv32$1: bv32;

var $$a.i2.i12$0bv32$2: bv32;

var $$a.i2.i12$1bv32$1: bv32;

var $$a.i2.i12$1bv32$2: bv32;

var $$a.i2.i12$2bv32$1: bv32;

var $$a.i2.i12$2bv32$2: bv32;

var $$a.i2.i12$3bv32$1: bv32;

var $$a.i2.i12$3bv32$2: bv32;

var $$22$0bv32$1: bv32;

var $$22$0bv32$2: bv32;

var $$22$1bv32$1: bv32;

var $$22$1bv32$2: bv32;

var $$22$2bv32$1: bv32;

var $$22$2bv32$2: bv32;

var $$22$3bv32$1: bv32;

var $$22$3bv32$2: bv32;

var $$b.i1.i13$0bv32$1: bv32;

var $$b.i1.i13$0bv32$2: bv32;

var $$b.i1.i13$1bv32$1: bv32;

var $$b.i1.i13$1bv32$2: bv32;

var $$b.i1.i13$2bv32$1: bv32;

var $$b.i1.i13$2bv32$2: bv32;

var $$b.i1.i13$3bv32$1: bv32;

var $$b.i1.i13$3bv32$2: bv32;

var $$23$0bv32$1: bv32;

var $$23$0bv32$2: bv32;

var $$23$1bv32$1: bv32;

var $$23$1bv32$2: bv32;

var $$23$2bv32$1: bv32;

var $$23$2bv32$2: bv32;

var $$23$3bv32$1: bv32;

var $$23$3bv32$2: bv32;

var $$24$0bv32$1: bv32;

var $$24$0bv32$2: bv32;

var $$24$1bv32$1: bv32;

var $$24$1bv32$2: bv32;

var $$24$2bv32$1: bv32;

var $$24$2bv32$2: bv32;

var $$24$3bv32$1: bv32;

var $$24$3bv32$2: bv32;

var $$25$0bv32$1: bv32;

var $$25$0bv32$2: bv32;

var $$25$1bv32$1: bv32;

var $$25$1bv32$2: bv32;

var $$25$2bv32$1: bv32;

var $$25$2bv32$2: bv32;

var $$25$3bv32$1: bv32;

var $$25$3bv32$2: bv32;

var $$a.i.i14$0bv32$1: bv32;

var $$a.i.i14$0bv32$2: bv32;

var $$a.i.i14$1bv32$1: bv32;

var $$a.i.i14$1bv32$2: bv32;

var $$a.i.i14$2bv32$1: bv32;

var $$a.i.i14$2bv32$2: bv32;

var $$a.i.i14$3bv32$1: bv32;

var $$a.i.i14$3bv32$2: bv32;

var $$b.i.i15$0bv32$1: bv32;

var $$b.i.i15$0bv32$2: bv32;

var $$b.i.i15$1bv32$1: bv32;

var $$b.i.i15$1bv32$2: bv32;

var $$b.i.i15$2bv32$1: bv32;

var $$b.i.i15$2bv32$2: bv32;

var $$b.i.i15$3bv32$1: bv32;

var $$b.i.i15$3bv32$2: bv32;

var $$my_curr_pos.i16$0bv32$1: bv32;

var $$my_curr_pos.i16$0bv32$2: bv32;

var $$my_curr_pos.i16$1bv32$1: bv32;

var $$my_curr_pos.i16$1bv32$2: bv32;

var $$my_curr_pos.i16$2bv32$1: bv32;

var $$my_curr_pos.i16$2bv32$2: bv32;

var $$my_curr_pos.i16$3bv32$1: bv32;

var $$my_curr_pos.i16$3bv32$2: bv32;

var $$other_element_old_pos.i17$0bv32$1: bv32;

var $$other_element_old_pos.i17$0bv32$2: bv32;

var $$other_element_old_pos.i17$1bv32$1: bv32;

var $$other_element_old_pos.i17$1bv32$2: bv32;

var $$other_element_old_pos.i17$2bv32$1: bv32;

var $$other_element_old_pos.i17$2bv32$2: bv32;

var $$other_element_old_pos.i17$3bv32$1: bv32;

var $$other_element_old_pos.i17$3bv32$2: bv32;

var $$r.i18$0bv32$1: bv32;

var $$r.i18$0bv32$2: bv32;

var $$r.i18$1bv32$1: bv32;

var $$r.i18$1bv32$2: bv32;

var $$r.i18$2bv32$1: bv32;

var $$r.i18$2bv32$2: bv32;

var $$r.i18$3bv32$1: bv32;

var $$r.i18$3bv32$2: bv32;

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$26$3bv32$1: bv32;

var $$26$3bv32$2: bv32;

var $$27$0bv32$1: bv32;

var $$27$0bv32$2: bv32;

var $$27$1bv32$1: bv32;

var $$27$1bv32$2: bv32;

var $$27$2bv32$1: bv32;

var $$27$2bv32$2: bv32;

var $$27$3bv32$1: bv32;

var $$27$3bv32$2: bv32;

var $$28$0bv32$1: bv32;

var $$28$0bv32$2: bv32;

var $$28$1bv32$1: bv32;

var $$28$1bv32$2: bv32;

var $$28$2bv32$1: bv32;

var $$28$2bv32$2: bv32;

var $$28$3bv32$1: bv32;

var $$28$3bv32$2: bv32;

var $$29$0bv32$1: bv32;

var $$29$0bv32$2: bv32;

var $$29$1bv32$1: bv32;

var $$29$1bv32$2: bv32;

var $$29$2bv32$1: bv32;

var $$29$2bv32$2: bv32;

var $$29$3bv32$1: bv32;

var $$29$3bv32$2: bv32;

var $$30$0bv32$1: bv32;

var $$30$0bv32$2: bv32;

var $$30$1bv32$1: bv32;

var $$30$1bv32$2: bv32;

var $$30$2bv32$1: bv32;

var $$30$2bv32$2: bv32;

var $$30$3bv32$1: bv32;

var $$30$3bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$31$3bv32$1: bv32;

var $$31$3bv32$2: bv32;

var $$a.i2.i1$0bv32$1: bv32;

var $$a.i2.i1$0bv32$2: bv32;

var $$a.i2.i1$1bv32$1: bv32;

var $$a.i2.i1$1bv32$2: bv32;

var $$a.i2.i1$2bv32$1: bv32;

var $$a.i2.i1$2bv32$2: bv32;

var $$a.i2.i1$3bv32$1: bv32;

var $$a.i2.i1$3bv32$2: bv32;

var $$32$0bv32$1: bv32;

var $$32$0bv32$2: bv32;

var $$32$1bv32$1: bv32;

var $$32$1bv32$2: bv32;

var $$32$2bv32$1: bv32;

var $$32$2bv32$2: bv32;

var $$32$3bv32$1: bv32;

var $$32$3bv32$2: bv32;

var $$b.i1.i2$0bv32$1: bv32;

var $$b.i1.i2$0bv32$2: bv32;

var $$b.i1.i2$1bv32$1: bv32;

var $$b.i1.i2$1bv32$2: bv32;

var $$b.i1.i2$2bv32$1: bv32;

var $$b.i1.i2$2bv32$2: bv32;

var $$b.i1.i2$3bv32$1: bv32;

var $$b.i1.i2$3bv32$2: bv32;

var $$33$0bv32$1: bv32;

var $$33$0bv32$2: bv32;

var $$33$1bv32$1: bv32;

var $$33$1bv32$2: bv32;

var $$33$2bv32$1: bv32;

var $$33$2bv32$2: bv32;

var $$33$3bv32$1: bv32;

var $$33$3bv32$2: bv32;

var $$34$0bv32$1: bv32;

var $$34$0bv32$2: bv32;

var $$34$1bv32$1: bv32;

var $$34$1bv32$2: bv32;

var $$34$2bv32$1: bv32;

var $$34$2bv32$2: bv32;

var $$34$3bv32$1: bv32;

var $$34$3bv32$2: bv32;

var $$35$0bv32$1: bv32;

var $$35$0bv32$2: bv32;

var $$35$1bv32$1: bv32;

var $$35$1bv32$2: bv32;

var $$35$2bv32$1: bv32;

var $$35$2bv32$2: bv32;

var $$35$3bv32$1: bv32;

var $$35$3bv32$2: bv32;

var $$a.i.i3$0bv32$1: bv32;

var $$a.i.i3$0bv32$2: bv32;

var $$a.i.i3$1bv32$1: bv32;

var $$a.i.i3$1bv32$2: bv32;

var $$a.i.i3$2bv32$1: bv32;

var $$a.i.i3$2bv32$2: bv32;

var $$a.i.i3$3bv32$1: bv32;

var $$a.i.i3$3bv32$2: bv32;

var $$b.i.i4$0bv32$1: bv32;

var $$b.i.i4$0bv32$2: bv32;

var $$b.i.i4$1bv32$1: bv32;

var $$b.i.i4$1bv32$2: bv32;

var $$b.i.i4$2bv32$1: bv32;

var $$b.i.i4$2bv32$2: bv32;

var $$b.i.i4$3bv32$1: bv32;

var $$b.i.i4$3bv32$2: bv32;

var $$my_curr_pos.i5$0bv32$1: bv32;

var $$my_curr_pos.i5$0bv32$2: bv32;

var $$my_curr_pos.i5$1bv32$1: bv32;

var $$my_curr_pos.i5$1bv32$2: bv32;

var $$my_curr_pos.i5$2bv32$1: bv32;

var $$my_curr_pos.i5$2bv32$2: bv32;

var $$my_curr_pos.i5$3bv32$1: bv32;

var $$my_curr_pos.i5$3bv32$2: bv32;

var $$other_element_old_pos.i6$0bv32$1: bv32;

var $$other_element_old_pos.i6$0bv32$2: bv32;

var $$other_element_old_pos.i6$1bv32$1: bv32;

var $$other_element_old_pos.i6$1bv32$2: bv32;

var $$other_element_old_pos.i6$2bv32$1: bv32;

var $$other_element_old_pos.i6$2bv32$2: bv32;

var $$other_element_old_pos.i6$3bv32$1: bv32;

var $$other_element_old_pos.i6$3bv32$2: bv32;

var $$r.i7$0bv32$1: bv32;

var $$r.i7$0bv32$2: bv32;

var $$r.i7$1bv32$1: bv32;

var $$r.i7$1bv32$2: bv32;

var $$r.i7$2bv32$1: bv32;

var $$r.i7$2bv32$2: bv32;

var $$r.i7$3bv32$1: bv32;

var $$r.i7$3bv32$2: bv32;

var $$36$0bv32$1: bv32;

var $$36$0bv32$2: bv32;

var $$36$1bv32$1: bv32;

var $$36$1bv32$2: bv32;

var $$36$2bv32$1: bv32;

var $$36$2bv32$2: bv32;

var $$36$3bv32$1: bv32;

var $$36$3bv32$2: bv32;

var $$37$0bv32$1: bv32;

var $$37$0bv32$2: bv32;

var $$37$1bv32$1: bv32;

var $$37$1bv32$2: bv32;

var $$37$2bv32$1: bv32;

var $$37$2bv32$2: bv32;

var $$37$3bv32$1: bv32;

var $$37$3bv32$2: bv32;

var $$38$0bv32$1: bv32;

var $$38$0bv32$2: bv32;

var $$38$1bv32$1: bv32;

var $$38$1bv32$2: bv32;

var $$38$2bv32$1: bv32;

var $$38$2bv32$2: bv32;

var $$38$3bv32$1: bv32;

var $$38$3bv32$2: bv32;

var $$39$0bv32$1: bv32;

var $$39$0bv32$2: bv32;

var $$39$1bv32$1: bv32;

var $$39$1bv32$2: bv32;

var $$39$2bv32$1: bv32;

var $$39$2bv32$2: bv32;

var $$39$3bv32$1: bv32;

var $$39$3bv32$2: bv32;

var $$40$0bv32$1: bv32;

var $$40$0bv32$2: bv32;

var $$40$1bv32$1: bv32;

var $$40$1bv32$2: bv32;

var $$40$2bv32$1: bv32;

var $$40$2bv32$2: bv32;

var $$40$3bv32$1: bv32;

var $$40$3bv32$2: bv32;

var $$41$0bv32$1: bv32;

var $$41$0bv32$2: bv32;

var $$41$1bv32$1: bv32;

var $$41$1bv32$2: bv32;

var $$41$2bv32$1: bv32;

var $$41$2bv32$2: bv32;

var $$41$3bv32$1: bv32;

var $$41$3bv32$2: bv32;

var $$a.i2.i$0bv32$1: bv32;

var $$a.i2.i$0bv32$2: bv32;

var $$a.i2.i$1bv32$1: bv32;

var $$a.i2.i$1bv32$2: bv32;

var $$a.i2.i$2bv32$1: bv32;

var $$a.i2.i$2bv32$2: bv32;

var $$a.i2.i$3bv32$1: bv32;

var $$a.i2.i$3bv32$2: bv32;

var $$42$0bv32$1: bv32;

var $$42$0bv32$2: bv32;

var $$42$1bv32$1: bv32;

var $$42$1bv32$2: bv32;

var $$42$2bv32$1: bv32;

var $$42$2bv32$2: bv32;

var $$42$3bv32$1: bv32;

var $$42$3bv32$2: bv32;

var $$b.i1.i$0bv32$1: bv32;

var $$b.i1.i$0bv32$2: bv32;

var $$b.i1.i$1bv32$1: bv32;

var $$b.i1.i$1bv32$2: bv32;

var $$b.i1.i$2bv32$1: bv32;

var $$b.i1.i$2bv32$2: bv32;

var $$b.i1.i$3bv32$1: bv32;

var $$b.i1.i$3bv32$2: bv32;

var $$43$0bv32$1: bv32;

var $$43$0bv32$2: bv32;

var $$43$1bv32$1: bv32;

var $$43$1bv32$2: bv32;

var $$43$2bv32$1: bv32;

var $$43$2bv32$2: bv32;

var $$43$3bv32$1: bv32;

var $$43$3bv32$2: bv32;

var $$44$0bv32$1: bv32;

var $$44$0bv32$2: bv32;

var $$44$1bv32$1: bv32;

var $$44$1bv32$2: bv32;

var $$44$2bv32$1: bv32;

var $$44$2bv32$2: bv32;

var $$44$3bv32$1: bv32;

var $$44$3bv32$2: bv32;

var $$45$0bv32$1: bv32;

var $$45$0bv32$2: bv32;

var $$45$1bv32$1: bv32;

var $$45$1bv32$2: bv32;

var $$45$2bv32$1: bv32;

var $$45$2bv32$2: bv32;

var $$45$3bv32$1: bv32;

var $$45$3bv32$2: bv32;

var $$a.i.i$0bv32$1: bv32;

var $$a.i.i$0bv32$2: bv32;

var $$a.i.i$1bv32$1: bv32;

var $$a.i.i$1bv32$2: bv32;

var $$a.i.i$2bv32$1: bv32;

var $$a.i.i$2bv32$2: bv32;

var $$a.i.i$3bv32$1: bv32;

var $$a.i.i$3bv32$2: bv32;

var $$b.i.i$0bv32$1: bv32;

var $$b.i.i$0bv32$2: bv32;

var $$b.i.i$1bv32$1: bv32;

var $$b.i.i$1bv32$2: bv32;

var $$b.i.i$2bv32$1: bv32;

var $$b.i.i$2bv32$2: bv32;

var $$b.i.i$3bv32$1: bv32;

var $$b.i.i$3bv32$2: bv32;

var $$my_curr_pos.i$0bv32$1: bv32;

var $$my_curr_pos.i$0bv32$2: bv32;

var $$my_curr_pos.i$1bv32$1: bv32;

var $$my_curr_pos.i$1bv32$2: bv32;

var $$my_curr_pos.i$2bv32$1: bv32;

var $$my_curr_pos.i$2bv32$2: bv32;

var $$my_curr_pos.i$3bv32$1: bv32;

var $$my_curr_pos.i$3bv32$2: bv32;

var $$other_element_old_pos.i$0bv32$1: bv32;

var $$other_element_old_pos.i$0bv32$2: bv32;

var $$other_element_old_pos.i$1bv32$1: bv32;

var $$other_element_old_pos.i$1bv32$2: bv32;

var $$other_element_old_pos.i$2bv32$1: bv32;

var $$other_element_old_pos.i$2bv32$2: bv32;

var $$other_element_old_pos.i$3bv32$1: bv32;

var $$other_element_old_pos.i$3bv32$2: bv32;

var $$r.i$0bv32$1: bv32;

var $$r.i$0bv32$2: bv32;

var $$r.i$1bv32$1: bv32;

var $$r.i$1bv32$2: bv32;

var $$r.i$2bv32$1: bv32;

var $$r.i$2bv32$2: bv32;

var $$r.i$3bv32$1: bv32;

var $$r.i$3bv32$2: bv32;

var $$46$0bv32$1: bv32;

var $$46$0bv32$2: bv32;

var $$46$1bv32$1: bv32;

var $$46$1bv32$2: bv32;

var $$46$2bv32$1: bv32;

var $$46$2bv32$2: bv32;

var $$46$3bv32$1: bv32;

var $$46$3bv32$2: bv32;

var $$47$0bv32$1: bv32;

var $$47$0bv32$2: bv32;

var $$47$1bv32$1: bv32;

var $$47$1bv32$2: bv32;

var $$47$2bv32$1: bv32;

var $$47$2bv32$2: bv32;

var $$47$3bv32$1: bv32;

var $$47$3bv32$2: bv32;

var $$48$0bv32$1: bv32;

var $$48$0bv32$2: bv32;

var $$48$1bv32$1: bv32;

var $$48$1bv32$2: bv32;

var $$48$2bv32$1: bv32;

var $$48$2bv32$2: bv32;

var $$48$3bv32$1: bv32;

var $$48$3bv32$2: bv32;

var $$49$0bv32$1: bv32;

var $$49$0bv32$2: bv32;

var $$49$1bv32$1: bv32;

var $$49$1bv32$2: bv32;

var $$49$2bv32$1: bv32;

var $$49$2bv32$2: bv32;

var $$49$3bv32$1: bv32;

var $$49$3bv32$2: bv32;

var $$p_pos$0bv32$1: bv32;

var $$p_pos$0bv32$2: bv32;

var $$p_pos$1bv32$1: bv32;

var $$p_pos$1bv32$2: bv32;

var $$p_pos$2bv32$1: bv32;

var $$p_pos$2bv32$2: bv32;

var $$p_pos$3bv32$1: bv32;

var $$p_pos$3bv32$2: bv32;

var $$p_vel$0bv32$1: bv32;

var $$p_vel$0bv32$2: bv32;

var $$p_vel$1bv32$1: bv32;

var $$p_vel$1bv32$2: bv32;

var $$p_vel$2bv32$1: bv32;

var $$p_vel$2bv32$2: bv32;

var $$p_vel$3bv32$1: bv32;

var $$p_vel$3bv32$2: bv32;

var $$acc$0bv32$1: bv32;

var $$acc$0bv32$2: bv32;

var $$acc$1bv32$1: bv32;

var $$acc$1bv32$2: bv32;

var $$acc$2bv32$1: bv32;

var $$acc$2bv32$2: bv32;

var $$acc$3bv32$1: bv32;

var $$acc$3bv32$2: bv32;

var $$50$0bv32$1: bv32;

var $$50$0bv32$2: bv32;

var $$50$1bv32$1: bv32;

var $$50$1bv32$2: bv32;

var $$50$2bv32$1: bv32;

var $$50$2bv32$2: bv32;

var $$50$3bv32$1: bv32;

var $$50$3bv32$2: bv32;

var $$51$0bv32$1: bv32;

var $$51$0bv32$2: bv32;

var $$51$1bv32$1: bv32;

var $$51$1bv32$2: bv32;

var $$51$2bv32$1: bv32;

var $$51$2bv32$2: bv32;

var $$51$3bv32$1: bv32;

var $$51$3bv32$2: bv32;

var $$52$0bv32$1: bv32;

var $$52$0bv32$2: bv32;

var $$52$1bv32$1: bv32;

var $$52$1bv32$2: bv32;

var $$52$2bv32$1: bv32;

var $$52$2bv32$2: bv32;

var $$52$3bv32$1: bv32;

var $$52$3bv32$2: bv32;

var $$53$0bv32$1: bv32;

var $$53$0bv32$2: bv32;

var $$53$1bv32$1: bv32;

var $$53$1bv32$2: bv32;

var $$53$2bv32$1: bv32;

var $$53$2bv32$2: bv32;

var $$53$3bv32$1: bv32;

var $$53$3bv32$2: bv32;

var $$54$0bv32$1: bv32;

var $$54$0bv32$2: bv32;

var $$54$1bv32$1: bv32;

var $$54$1bv32$2: bv32;

var $$54$2bv32$1: bv32;

var $$54$2bv32$2: bv32;

var $$54$3bv32$1: bv32;

var $$54$3bv32$2: bv32;

var $$55$0bv32$1: bv32;

var $$55$0bv32$2: bv32;

var $$55$1bv32$1: bv32;

var $$55$1bv32$2: bv32;

var $$55$2bv32$1: bv32;

var $$55$2bv32$2: bv32;

var $$55$3bv32$1: bv32;

var $$55$3bv32$2: bv32;

var $$56$0bv32$1: bv32;

var $$56$0bv32$2: bv32;

var $$56$1bv32$1: bv32;

var $$56$1bv32$2: bv32;

var $$56$2bv32$1: bv32;

var $$56$2bv32$2: bv32;

var $$56$3bv32$1: bv32;

var $$56$3bv32$2: bv32;

var $$57$0bv32$1: bv32;

var $$57$0bv32$2: bv32;

var $$57$1bv32$1: bv32;

var $$57$1bv32$2: bv32;

var $$57$2bv32$1: bv32;

var $$57$2bv32$2: bv32;

var $$57$3bv32$1: bv32;

var $$57$3bv32$2: bv32;

var $$58$0bv32$1: bv32;

var $$58$0bv32$2: bv32;

var $$58$1bv32$1: bv32;

var $$58$1bv32$2: bv32;

var $$58$2bv32$1: bv32;

var $$58$2bv32$2: bv32;

var $$58$3bv32$1: bv32;

var $$58$3bv32$2: bv32;

var $$59$0bv32$1: bv32;

var $$59$0bv32$2: bv32;

var $$59$1bv32$1: bv32;

var $$59$1bv32$2: bv32;

var $$59$2bv32$1: bv32;

var $$59$2bv32$2: bv32;

var $$59$3bv32$1: bv32;

var $$59$3bv32$2: bv32;

var $$60$0bv32$1: bv32;

var $$60$0bv32$2: bv32;

var $$60$1bv32$1: bv32;

var $$60$1bv32$2: bv32;

var $$60$2bv32$1: bv32;

var $$60$2bv32$2: bv32;

var $$60$3bv32$1: bv32;

var $$60$3bv32$2: bv32;

var $$61$0bv32$1: bv32;

var $$61$0bv32$2: bv32;

var $$61$1bv32$1: bv32;

var $$61$1bv32$2: bv32;

var $$61$2bv32$1: bv32;

var $$61$2bv32$2: bv32;

var $$61$3bv32$1: bv32;

var $$61$3bv32$2: bv32;

const _WATCHED_VALUE_$$data_in_pos: bv32;

procedure {:inline 1} _LOG_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_in_pos;



implementation {:inline 1} _LOG_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then true else _READ_HAS_OCCURRED_$$data_in_pos);
    return;
}



procedure _CHECK_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_in_pos: bool;

procedure {:inline 1} _LOG_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_in_pos, _WRITE_READ_BENIGN_FLAG_$$data_in_pos;



implementation {:inline 1} _LOG_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then true else _WRITE_HAS_OCCURRED_$$data_in_pos);
    _WRITE_READ_BENIGN_FLAG_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
    return;
}



procedure _CHECK_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos != _value);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos != _value);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_in_pos;



implementation {:inline 1} _LOG_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_in_pos);
    return;
}



procedure _CHECK_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_in_pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_in_pos := (if _P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
    return;
}



const _WATCHED_VALUE_$$data_in_vel: bv32;

procedure {:inline 1} _LOG_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_in_vel;



implementation {:inline 1} _LOG_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then true else _READ_HAS_OCCURRED_$$data_in_vel);
    return;
}



procedure _CHECK_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_in_vel: bool;

procedure {:inline 1} _LOG_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_in_vel, _WRITE_READ_BENIGN_FLAG_$$data_in_vel;



implementation {:inline 1} _LOG_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then true else _WRITE_HAS_OCCURRED_$$data_in_vel);
    _WRITE_READ_BENIGN_FLAG_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
    return;
}



procedure _CHECK_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel != _value);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel != _value);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_in_vel;



implementation {:inline 1} _LOG_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_in_vel);
    return;
}



procedure _CHECK_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_vel(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_in_vel;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_vel(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_in_vel := (if _P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
    return;
}



const _WATCHED_VALUE_$$data_out_pos: bv32;

procedure {:inline 1} _LOG_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_out_pos;



implementation {:inline 1} _LOG_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then true else _READ_HAS_OCCURRED_$$data_out_pos);
    return;
}



procedure _CHECK_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_out_pos: bool;

procedure {:inline 1} _LOG_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos;



implementation {:inline 1} _LOG_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then true else _WRITE_HAS_OCCURRED_$$data_out_pos);
    _WRITE_READ_BENIGN_FLAG_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
    return;
}



procedure _CHECK_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos != _value);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos != _value);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_out_pos;



implementation {:inline 1} _LOG_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_out_pos);
    return;
}



procedure _CHECK_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_out_pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_out_pos := (if _P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
    return;
}



const _WATCHED_VALUE_$$data_out_vel: bv32;

procedure {:inline 1} _LOG_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_out_vel;



implementation {:inline 1} _LOG_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then true else _READ_HAS_OCCURRED_$$data_out_vel);
    return;
}



procedure _CHECK_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_out_vel: bool;

procedure {:inline 1} _LOG_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel;



implementation {:inline 1} _LOG_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then true else _WRITE_HAS_OCCURRED_$$data_out_vel);
    _WRITE_READ_BENIGN_FLAG_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
    return;
}



procedure _CHECK_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel != _value);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel != _value);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_out_vel;



implementation {:inline 1} _LOG_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_out_vel);
    return;
}



procedure _CHECK_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_out_vel;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_out_vel := (if _P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
    return;
}



const _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;



implementation {:inline 1} _LOG_READ_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem == _value then true else _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem);
    return;
}



procedure _CHECK_READ_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem, _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;



implementation {:inline 1} _LOG_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem);
    return;
}



procedure _CHECK_WRITE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile_mem"} {:array "$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data_out_pos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data_out_pos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data_out_pos;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data_out_vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data_out_vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data_out_vel;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data_out_pos;
    goto anon7;

  anon7:
    havoc $$data_out_vel;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data_out_pos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data_out_pos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data_out_pos;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data_out_vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data_out_vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data_out_vel;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data_out_pos;
    goto anon7;

  anon7:
    havoc $$data_out_vel;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21tiling_implementationP6float4S0_S0_S0_iiiE8tile_mem;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
