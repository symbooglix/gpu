type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "d_output"} {:global} $$d_output: [bv32]bv32;

axiom {:array_info "$$d_output"} {:global} {:elem_width 32} {:source_name "d_output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_output: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i9.i"} {:elem_width 32} {:source_name "b.i9.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i7.i"} {:elem_width 32} {:source_name "a.i7.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i8.i"} {:elem_width 32} {:source_name "b.i8.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i6.i"} {:elem_width 32} {:source_name "a.i6.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5.i"} {:elem_width 32} {:source_name "a.i5.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i4.i"} {:elem_width 32} {:source_name "a.i4.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i"} {:elem_width 32} {:source_name "b.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i3.i"} {:elem_width 32} {:source_name "a.i3.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i7.i.i"} {:elem_width 32} {:source_name "a.i7.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i8.i.i"} {:elem_width 32} {:source_name "b.i8.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5.i.i"} {:elem_width 32} {:source_name "a.i5.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i6.i.i"} {:elem_width 32} {:source_name "b.i6.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i3.i.i"} {:elem_width 32} {:source_name "a.i3.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i4.i.i"} {:elem_width 32} {:source_name "b.i4.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i1.i1.i"} {:elem_width 32} {:source_name "a.i1.i1.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i2.i.i"} {:elem_width 32} {:source_name "b.i2.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i2.i"} {:elem_width 32} {:source_name "a.i.i2.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i.i"} {:elem_width 32} {:source_name "b.i.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i.i"} {:elem_width 32} {:source_name "r.i.i"} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$boxmin.i.i"} {:elem_width 32} {:source_name "boxmin.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$boxmax.i.i"} {:elem_width 32} {:source_name "boxmax.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$invR.i.i"} {:elem_width 32} {:source_name "invR.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tbot.i.i"} {:elem_width 32} {:source_name "tbot.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$ttop.i.i"} {:elem_width 32} {:source_name "ttop.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$36"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$37"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$38"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tmin.i.i"} {:elem_width 32} {:source_name "tmin.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$39"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$40"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tmax.i.i"} {:elem_width 32} {:source_name "tmax.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$41"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$42"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$43"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$44"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i.i"} {:elem_width 32} {:source_name "a.i2.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$45"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$46"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i1.i.i"} {:elem_width 32} {:source_name "a.i1.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$47"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$48"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i.i"} {:elem_width 32} {:source_name "a.i.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$49"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$50"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$51"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$52"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$53"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$54"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$55"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$56"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$57"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$58"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$59"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$60"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$61"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i"} {:elem_width 32} {:source_name "a.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$62"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$63"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$64"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$65"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$66"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$67"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$68"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$69"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$70"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i.i"} {:elem_width 32} {:source_name "rgba.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$71"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$boxMin.i"} {:elem_width 32} {:source_name "boxMin.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$boxMax.i"} {:elem_width 32} {:source_name "boxMax.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$eyeRay.i"} {:elem_width 32} {:source_name "eyeRay.i"} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$72"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$73"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$74"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$75"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$76"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$77"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$78"} {:elem_width 32} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$79"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$80"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$sum.i"} {:elem_width 32} {:source_name "sum.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$pos.i"} {:elem_width 32} {:source_name "pos.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$81"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$82"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$83"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$step.i"} {:elem_width 32} {:source_name "step.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$84"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$coord.i"} {:elem_width 32} {:source_name "coord.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$85"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$col.i"} {:elem_width 32} {:source_name "col.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$86"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$87"} {:elem_width 8} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$88"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$89"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$90"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$91"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$92"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$93"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "c_invViewMatrix"} {:constant} $$c_invViewMatrix$1: [bv32]bv32;

var {:source_name "c_invViewMatrix"} {:constant} $$c_invViewMatrix$2: [bv32]bv32;

axiom {:array_info "$$c_invViewMatrix"} {:constant} {:elem_width 32} {:source_name "c_invViewMatrix"} {:source_elem_width 384} {:source_dimensions "1"} true;

axiom {:array_info "$$volumeTex"} {:global} {:elem_width 8} {:source_name "volumeTex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$volumeTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$volumeTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$volumeTex: bool;

axiom {:array_info "$$transferLayerPreintTex"} {:global} {:elem_width 8} {:source_name "transferLayerPreintTex"} {:source_elem_width 192} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$transferLayerPreintTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$transferLayerPreintTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex: bool;

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

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_UI32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "d_render_preint"} {:kernel} $_Z15d_render_preintPjjjfffff($imageW: bv32, $imageH: bv32, $density: bv32, $brightness: bv32, $transferOffset: bv32, $transferScale: bv32, $transferWeight: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $imageW == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_output && !_WRITE_HAS_OCCURRED_$$d_output && !_ATOMIC_HAS_OCCURRED_$$d_output;
  requires !_READ_HAS_OCCURRED_$$volumeTex && !_WRITE_HAS_OCCURRED_$$volumeTex && !_ATOMIC_HAS_OCCURRED_$$volumeTex;
  requires !_READ_HAS_OCCURRED_$$transferLayerPreintTex && !_WRITE_HAS_OCCURRED_$$transferLayerPreintTex && !_ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex;
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
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:source_name "d_render_preint"} {:kernel} $_Z15d_render_preintPjjjfffff($imageW: bv32, $imageH: bv32, $density: bv32, $brightness: bv32, $transferOffset: bv32, $transferScale: bv32, $transferWeight: bv32)
{
  var $tnear.i.0$1: bv32;
  var $tnear.i.0$2: bv32;
  var $t.i.0$1: bv32;
  var $t.i.0$2: bv32;
  var $lastsample.i.0$1: bv32;
  var $lastsample.i.0$2: bv32;
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
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
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var v35$1: bv32;
  var v35$2: bv32;
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
  var v58$1: bv32;
  var v58$2: bv32;
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
  var v69$1: bv32;
  var v69$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
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
  var v91$1: bv96;
  var v91$2: bv96;
  var v92$1: bv32;
  var v92$2: bv32;
  var v93$1: bv32;
  var v93$2: bv32;
  var v94$1: bv32;
  var v94$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
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
  var v131$1: bv32;
  var v131$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
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
  var v167$1: bv32;
  var v167$2: bv32;
  var v168$1: bv32;
  var v168$2: bv32;
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
  var v176$1: bv32;
  var v176$2: bv32;
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
  var v185$1: bv32;
  var v185$2: bv32;
  var v182$1: bv32;
  var v182$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v184$1: bv32;
  var v184$2: bv32;
  var v347$1: bv32;
  var v347$2: bv32;
  var v348$1: bv96;
  var v348$2: bv96;
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
  var v227$1: bv32;
  var v227$2: bv32;
  var v228$1: bv32;
  var v228$2: bv32;
  var v229$1: bv32;
  var v229$2: bv32;
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
  var v323$1: bv32;
  var v323$2: bv32;
  var v325$1: bv32;
  var v325$2: bv32;
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
  var v335$1: bv96;
  var v335$2: bv96;
  var v337$1: bv32;
  var v337$2: bv32;
  var v338$1: bv32;
  var v338$2: bv32;
  var v336$1: bv32;
  var v336$2: bv32;
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
  var v359$1: bv32;
  var v359$2: bv32;
  var v360$1: bv32;
  var v360$2: bv32;
  var v361$1: bv32;
  var v361$2: bv32;
  var v362$1: bv32;
  var v362$2: bv32;
  var v363$1: bool;
  var v363$2: bool;
  var v364$1: bool;
  var v364$2: bool;
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
  var v424$1: bool;
  var v424$2: bool;
  var v425$1: bv32;
  var v425$2: bv32;
  var v426$1: bv32;
  var v426$2: bv32;
  var v427$1: bv32;
  var v427$2: bv32;
  var v433$1: bv8;
  var v433$2: bv8;
  var v428$1: bv32;
  var v428$2: bv32;
  var v429$1: bv32;
  var v429$2: bv32;
  var v430$1: bv32;
  var v430$2: bv32;
  var v431$1: bv8;
  var v431$2: bv8;
  var v432$1: bv8;
  var v432$2: bv8;
  var v450$1: bv8;
  var v450$2: bv8;
  var v434$1: bv8;
  var v434$2: bv8;
  var v435$1: bv8;
  var v435$2: bv8;
  var v436$1: bv8;
  var v436$2: bv8;
  var v437$1: bv8;
  var v437$2: bv8;
  var v438$1: bv8;
  var v438$2: bv8;
  var v439$1: bv8;
  var v439$2: bv8;
  var v440$1: bv8;
  var v440$2: bv8;
  var v441$1: bv8;
  var v441$2: bv8;
  var v442$1: bv8;
  var v442$2: bv8;
  var v443$1: bv32;
  var v443$2: bv32;
  var v444$1: bv32;
  var v444$2: bv32;
  var v445$1: bv32;
  var v445$2: bv32;
  var v446$1: bv8;
  var v446$2: bv8;
  var v447$1: bv8;
  var v447$2: bv8;
  var v448$1: bv8;
  var v448$2: bv8;
  var v449$1: bv8;
  var v449$2: bv8;
  var v482$1: bv8;
  var v482$2: bv8;
  var v483$1: bv8;
  var v483$2: bv8;
  var v484$1: bv8;
  var v484$2: bv8;
  var v485$1: bv8;
  var v485$2: bv8;
  var v486$1: bv8;
  var v486$2: bv8;
  var v487$1: bv8;
  var v487$2: bv8;
  var v451$1: bv8;
  var v451$2: bv8;
  var v452$1: bv8;
  var v452$2: bv8;
  var v453$1: bv8;
  var v453$2: bv8;
  var v454$1: bv8;
  var v454$2: bv8;
  var v455$1: bv32;
  var v455$2: bv32;
  var v456$1: bv32;
  var v456$2: bv32;
  var v479$1: bv8;
  var v479$2: bv8;
  var v457$1: bv8;
  var v457$2: bv8;
  var v458$1: bv8;
  var v458$2: bv8;
  var v459$1: bv8;
  var v459$2: bv8;
  var v460$1: bv8;
  var v460$2: bv8;
  var v461$1: bv8;
  var v461$2: bv8;
  var v462$1: bv8;
  var v462$2: bv8;
  var v463$1: bv8;
  var v463$2: bv8;
  var v464$1: bv8;
  var v464$2: bv8;
  var v465$1: bv8;
  var v465$2: bv8;
  var v466$1: bv8;
  var v466$2: bv8;
  var v467$1: bv8;
  var v467$2: bv8;
  var v468$1: bv8;
  var v468$2: bv8;
  var v469$1: bv8;
  var v469$2: bv8;
  var v470$1: bv8;
  var v470$2: bv8;
  var v471$1: bv8;
  var v471$2: bv8;
  var v472$1: bv8;
  var v472$2: bv8;
  var v473$1: bv8;
  var v473$2: bv8;
  var v474$1: bv8;
  var v474$2: bv8;
  var v475$1: bv8;
  var v475$2: bv8;
  var v476$1: bv8;
  var v476$2: bv8;
  var v477$1: bv8;
  var v477$2: bv8;
  var v478$1: bv8;
  var v478$2: bv8;
  var v480$1: bv8;
  var v480$2: bv8;
  var v481$1: bv8;
  var v481$2: bv8;
  var v538$1: bv32;
  var v538$2: bv32;
  var v488$1: bv8;
  var v488$2: bv8;
  var v489$1: bv8;
  var v489$2: bv8;
  var v490$1: bv8;
  var v490$2: bv8;
  var v491$1: bv8;
  var v491$2: bv8;
  var v492$1: bv8;
  var v492$2: bv8;
  var v493$1: bv8;
  var v493$2: bv8;
  var v494$1: bv8;
  var v494$2: bv8;
  var v495$1: bv8;
  var v495$2: bv8;
  var v496$1: bv8;
  var v496$2: bv8;
  var v497$1: bv8;
  var v497$2: bv8;
  var v498$1: bv8;
  var v498$2: bv8;
  var v499$1: bv8;
  var v499$2: bv8;
  var v500$1: bv8;
  var v500$2: bv8;
  var v501$1: bv8;
  var v501$2: bv8;
  var v502$1: bv8;
  var v502$2: bv8;
  var v503$1: bv8;
  var v503$2: bv8;
  var v504$1: bv8;
  var v504$2: bv8;
  var v505$1: bv128;
  var v505$2: bv128;
  var v506$1: bv32;
  var v506$2: bv32;
  var v507$1: bv32;
  var v507$2: bv32;
  var v508$1: bv32;
  var v508$2: bv32;
  var v509$1: bv32;
  var v509$2: bv32;
  var v510$1: bv32;
  var v510$2: bv32;
  var v511$1: bv32;
  var v511$2: bv32;
  var v512$1: bv32;
  var v512$2: bv32;
  var v513$1: bv32;
  var v513$2: bv32;
  var v514$1: bv32;
  var v514$2: bv32;
  var v515$1: bv32;
  var v515$2: bv32;
  var v516$1: bv32;
  var v516$2: bv32;
  var v537$1: bv32;
  var v537$2: bv32;
  var v517$1: bv32;
  var v517$2: bv32;
  var v518$1: bv32;
  var v518$2: bv32;
  var v519$1: bv32;
  var v519$2: bv32;
  var v520$1: bv32;
  var v520$2: bv32;
  var v521$1: bv32;
  var v521$2: bv32;
  var v522$1: bv32;
  var v522$2: bv32;
  var v523$1: bv32;
  var v523$2: bv32;
  var v524$1: bv32;
  var v524$2: bv32;
  var v525$1: bv32;
  var v525$2: bv32;
  var v526$1: bv32;
  var v526$2: bv32;
  var v527$1: bv32;
  var v527$2: bv32;
  var v528$1: bv32;
  var v528$2: bv32;
  var v529$1: bv32;
  var v529$2: bv32;
  var v530$1: bv32;
  var v530$2: bv32;
  var v531$1: bv32;
  var v531$2: bv32;
  var v532$1: bv32;
  var v532$2: bv32;
  var v533$1: bv32;
  var v533$2: bv32;
  var v534$1: bv32;
  var v534$2: bv32;
  var v535$1: bv32;
  var v535$2: bv32;
  var v536$1: bv32;
  var v536$2: bv32;
  var v539$1: bv32;
  var v539$2: bv32;
  var v540$1: bv32;
  var v540$2: bv32;
  var v541$1: bv32;
  var v541$2: bv32;
  var v542$1: bv32;
  var v542$2: bv32;
  var v543$1: bv32;
  var v543$2: bv32;
  var v544$1: bv32;
  var v544$2: bv32;
  var v545$1: bv32;
  var v545$2: bv32;
  var v546$1: bv32;
  var v546$2: bv32;
  var v547$1: bv32;
  var v547$2: bv32;
  var v548$1: bv32;
  var v548$2: bv32;
  var v549$1: bv32;
  var v549$2: bv32;
  var v550$1: bv32;
  var v550$2: bv32;
  var v551$1: bv32;
  var v551$2: bv32;
  var v552$1: bv32;
  var v552$2: bv32;
  var v553$1: bv32;
  var v553$2: bv32;
  var v554$1: bv32;
  var v554$2: bv32;
  var v555$1: bv32;
  var v555$2: bv32;
  var v556$1: bv32;
  var v556$2: bv32;
  var v557$1: bv32;
  var v557$2: bv32;
  var v558$1: bv32;
  var v558$2: bv32;
  var v559$1: bv32;
  var v559$2: bv32;
  var v560$1: bv32;
  var v560$2: bv32;
  var v561$1: bv32;
  var v561$2: bv32;
  var v562$1: bv32;
  var v562$2: bv32;
  var v563$1: bv32;
  var v563$2: bv32;
  var v564$1: bv32;
  var v564$2: bv32;
  var v565$1: bv32;
  var v565$2: bv32;
  var v566$1: bv32;
  var v566$2: bv32;
  var v567$1: bv32;
  var v567$2: bv32;
  var v568$1: bv32;
  var v568$2: bv32;
  var v569$1: bv32;
  var v569$2: bv32;
  var v570$1: bv32;
  var v570$2: bv32;
  var v571$1: bv32;
  var v571$2: bv32;
  var v572$1: bool;
  var v572$2: bool;
  var v573$1: bv32;
  var v573$2: bv32;
  var v574$1: bool;
  var v574$2: bool;
  var v595$1: bv32;
  var v595$2: bv32;
  var v575$1: bv32;
  var v575$2: bv32;
  var v576$1: bv32;
  var v576$2: bv32;
  var v577$1: bv32;
  var v577$2: bv32;
  var v578$1: bv32;
  var v578$2: bv32;
  var v579$1: bv32;
  var v579$2: bv32;
  var v580$1: bv32;
  var v580$2: bv32;
  var v581$1: bv32;
  var v581$2: bv32;
  var v582$1: bv32;
  var v582$2: bv32;
  var v583$1: bv32;
  var v583$2: bv32;
  var v584$1: bv32;
  var v584$2: bv32;
  var v585$1: bv32;
  var v585$2: bv32;
  var v586$1: bv32;
  var v586$2: bv32;
  var v587$1: bv32;
  var v587$2: bv32;
  var v588$1: bv32;
  var v588$2: bv32;
  var v589$1: bv32;
  var v589$2: bv32;
  var v590$1: bv32;
  var v590$2: bv32;
  var v591$1: bv32;
  var v591$2: bv32;
  var v592$1: bv32;
  var v592$2: bv32;
  var v593$1: bv32;
  var v593$2: bv32;
  var v594$1: bv32;
  var v594$2: bv32;
  var v596$1: bv32;
  var v596$2: bv32;
  var v597$1: bv32;
  var v597$2: bv32;
  var v598$1: bv32;
  var v598$2: bv32;
  var v599$1: bv32;
  var v599$2: bv32;
  var v600$1: bv32;
  var v600$2: bv32;
  var v601$1: bv32;
  var v601$2: bv32;
  var v602$1: bv32;
  var v602$2: bv32;
  var v603$1: bv32;
  var v603$2: bv32;
  var v604$1: bv32;
  var v604$2: bv32;
  var v605$1: bv32;
  var v605$2: bv32;
  var v606$1: bv32;
  var v606$2: bv32;
  var v607$1: bv32;
  var v607$2: bv32;
  var v608$1: bv32;
  var v608$2: bv32;
  var v609$1: bv32;
  var v609$2: bv32;
  var v610$1: bv32;
  var v610$2: bv32;
  var v611$1: bv32;
  var v611$2: bv32;
  var v612$1: bv32;
  var v612$2: bv32;
  var v613$1: bv32;
  var v613$2: bv32;
  var v614$1: bv32;
  var v614$2: bv32;
  var v615$1: bv32;
  var v615$2: bv32;
  var v616$1: bv32;
  var v616$2: bv32;
  var v617$1: bv32;
  var v617$2: bv32;
  var v618$1: bv32;
  var v618$2: bv32;
  var v619$1: bv32;
  var v619$2: bv32;
  var v620$1: bv32;
  var v620$2: bv32;
  var v621$1: bv32;
  var v621$2: bv32;
  var v622$1: bv32;
  var v622$2: bv32;
  var v623$1: bv32;
  var v623$2: bv32;
  var v624$1: bv32;
  var v624$2: bv32;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    $$71$0bv32$1 := 3212836864bv32;
    $$71$0bv32$2 := 3212836864bv32;
    $$71$1bv32$1 := 3212836864bv32;
    $$71$1bv32$2 := 3212836864bv32;
    $$71$2bv32$1 := 3212836864bv32;
    $$71$2bv32$2 := 3212836864bv32;
    v0$1 := $$71$0bv32$1;
    v0$2 := $$71$0bv32$2;
    v1$1 := $$71$1bv32$1;
    v1$2 := $$71$1bv32$2;
    v2$1 := $$71$2bv32$1;
    v2$2 := $$71$2bv32$2;
    $$boxMin.i$0bv32$1 := v0$1;
    $$boxMin.i$0bv32$2 := v0$2;
    $$boxMin.i$1bv32$1 := v1$1;
    $$boxMin.i$1bv32$2 := v1$2;
    $$boxMin.i$2bv32$1 := v2$1;
    $$boxMin.i$2bv32$2 := v2$2;
    $$70$0bv32$1 := 1065353216bv32;
    $$70$0bv32$2 := 1065353216bv32;
    $$70$1bv32$1 := 1065353216bv32;
    $$70$1bv32$2 := 1065353216bv32;
    $$70$2bv32$1 := 1065353216bv32;
    $$70$2bv32$2 := 1065353216bv32;
    v3$1 := $$70$0bv32$1;
    v3$2 := $$70$0bv32$2;
    v4$1 := $$70$1bv32$1;
    v4$2 := $$70$1bv32$2;
    v5$1 := $$70$2bv32$1;
    v5$2 := $$70$2bv32$2;
    $$boxMax.i$0bv32$1 := v3$1;
    $$boxMax.i$0bv32$2 := v3$2;
    $$boxMax.i$1bv32$1 := v4$1;
    $$boxMax.i$1bv32$2 := v4$2;
    $$boxMax.i$2bv32$1 := v5$1;
    $$boxMax.i$2bv32$2 := v5$2;
    v6$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v6$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v7$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v7$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v8$1 := BV32_UGE(v6$1, $imageW);
    v8$2 := BV32_UGE(v6$2, $imageW);
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
    p15$1 := false;
    p15$2 := false;
    p3$1 := (if v8$1 then v8$1 else p3$1);
    p3$2 := (if v8$2 then v8$2 else p3$2);
    p1$1 := (if !v8$1 then !v8$1 else p1$1);
    p1$2 := (if !v8$2 then !v8$2 else p1$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    v9$1 := (if p1$1 then BV32_UGE(v7$1, $imageH) else v9$1);
    v9$2 := (if p1$2 then BV32_UGE(v7$2, $imageH) else v9$2);
    p3$1 := (if p1$1 && v9$1 then v9$1 else p3$1);
    p3$2 := (if p1$2 && v9$2 then v9$2 else p3$2);
    p4$1 := (if p1$1 && !v9$1 then !v9$1 else p4$1);
    p4$2 := (if p1$2 && !v9$2 then !v9$2 else p4$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    $$69$0bv32$1 := (if p4$1 then 0bv32 else $$69$0bv32$1);
    $$69$0bv32$2 := (if p4$2 then 0bv32 else $$69$0bv32$2);
    $$69$1bv32$1 := (if p4$1 then 0bv32 else $$69$1bv32$1);
    $$69$1bv32$2 := (if p4$2 then 0bv32 else $$69$1bv32$2);
    $$69$2bv32$1 := (if p4$1 then 0bv32 else $$69$2bv32$1);
    $$69$2bv32$2 := (if p4$2 then 0bv32 else $$69$2bv32$2);
    $$69$3bv32$1 := (if p4$1 then 1065353216bv32 else $$69$3bv32$1);
    $$69$3bv32$2 := (if p4$2 then 1065353216bv32 else $$69$3bv32$2);
    v10$1 := (if p4$1 then $$69$0bv32$1 else v10$1);
    v10$2 := (if p4$2 then $$69$0bv32$2 else v10$2);
    v11$1 := (if p4$1 then $$69$1bv32$1 else v11$1);
    v11$2 := (if p4$2 then $$69$1bv32$2 else v11$2);
    v12$1 := (if p4$1 then $$69$2bv32$1 else v12$1);
    v12$2 := (if p4$2 then $$69$2bv32$2 else v12$2);
    v13$1 := (if p4$1 then $$69$3bv32$1 else v13$1);
    v13$2 := (if p4$2 then $$69$3bv32$2 else v13$2);
    $$74$0bv32$1 := (if p4$1 then v10$1 else $$74$0bv32$1);
    $$74$0bv32$2 := (if p4$2 then v10$2 else $$74$0bv32$2);
    $$74$1bv32$1 := (if p4$1 then v11$1 else $$74$1bv32$1);
    $$74$1bv32$2 := (if p4$2 then v11$2 else $$74$1bv32$2);
    $$74$2bv32$1 := (if p4$1 then v12$1 else $$74$2bv32$1);
    $$74$2bv32$2 := (if p4$2 then v12$2 else $$74$2bv32$2);
    $$74$3bv32$1 := (if p4$1 then v13$1 else $$74$3bv32$1);
    $$74$3bv32$2 := (if p4$2 then v13$2 else $$74$3bv32$2);
    v14$1 := (if p4$1 then $$74$0bv32$1 else v14$1);
    v14$2 := (if p4$2 then $$74$0bv32$2 else v14$2);
    $$63$0bv32$1 := (if p4$1 then v14$1 else $$63$0bv32$1);
    $$63$0bv32$2 := (if p4$2 then v14$2 else $$63$0bv32$2);
    v15$1 := (if p4$1 then $$74$1bv32$1 else v15$1);
    v15$2 := (if p4$2 then $$74$1bv32$2 else v15$2);
    $$63$1bv32$1 := (if p4$1 then v15$1 else $$63$1bv32$1);
    $$63$1bv32$2 := (if p4$2 then v15$2 else $$63$1bv32$2);
    v16$1 := (if p4$1 then $$74$2bv32$1 else v16$1);
    v16$2 := (if p4$2 then $$74$2bv32$2 else v16$2);
    $$63$2bv32$1 := (if p4$1 then v16$1 else $$63$2bv32$1);
    $$63$2bv32$2 := (if p4$2 then v16$2 else $$63$2bv32$2);
    v17$1 := (if p4$1 then $$74$3bv32$1 else v17$1);
    v17$2 := (if p4$2 then $$74$3bv32$2 else v17$2);
    $$63$3bv32$1 := (if p4$1 then v17$1 else $$63$3bv32$1);
    $$63$3bv32$2 := (if p4$2 then v17$2 else $$63$3bv32$2);
    v18$1 := (if p4$1 then $$c_invViewMatrix$1[0bv32] else v18$1);
    v18$2 := (if p4$2 then $$c_invViewMatrix$2[0bv32] else v18$2);
    $$64$0bv32$1 := (if p4$1 then v18$1 else $$64$0bv32$1);
    $$64$0bv32$2 := (if p4$2 then v18$2 else $$64$0bv32$2);
    v19$1 := (if p4$1 then $$c_invViewMatrix$1[1bv32] else v19$1);
    v19$2 := (if p4$2 then $$c_invViewMatrix$2[1bv32] else v19$2);
    $$64$1bv32$1 := (if p4$1 then v19$1 else $$64$1bv32$1);
    $$64$1bv32$2 := (if p4$2 then v19$2 else $$64$1bv32$2);
    v20$1 := (if p4$1 then $$c_invViewMatrix$1[2bv32] else v20$1);
    v20$2 := (if p4$2 then $$c_invViewMatrix$2[2bv32] else v20$2);
    $$64$2bv32$1 := (if p4$1 then v20$1 else $$64$2bv32$1);
    $$64$2bv32$2 := (if p4$2 then v20$2 else $$64$2bv32$2);
    v21$1 := (if p4$1 then $$c_invViewMatrix$1[3bv32] else v21$1);
    v21$2 := (if p4$2 then $$c_invViewMatrix$2[3bv32] else v21$2);
    $$64$3bv32$1 := (if p4$1 then v21$1 else $$64$3bv32$1);
    $$64$3bv32$2 := (if p4$2 then v21$2 else $$64$3bv32$2);
    v22$1 := (if p4$1 then $$63$0bv32$1 else v22$1);
    v22$2 := (if p4$2 then $$63$0bv32$2 else v22$2);
    v23$1 := (if p4$1 then $$63$1bv32$1 else v23$1);
    v23$2 := (if p4$2 then $$63$1bv32$2 else v23$2);
    v24$1 := (if p4$1 then $$63$2bv32$1 else v24$1);
    v24$2 := (if p4$2 then $$63$2bv32$2 else v24$2);
    v25$1 := (if p4$1 then $$63$3bv32$1 else v25$1);
    v25$2 := (if p4$2 then $$63$3bv32$2 else v25$2);
    v26$1 := (if p4$1 then $$64$0bv32$1 else v26$1);
    v26$2 := (if p4$2 then $$64$0bv32$2 else v26$2);
    v27$1 := (if p4$1 then $$64$1bv32$1 else v27$1);
    v27$2 := (if p4$2 then $$64$1bv32$2 else v27$2);
    v28$1 := (if p4$1 then $$64$2bv32$1 else v28$1);
    v28$2 := (if p4$2 then $$64$2bv32$2 else v28$2);
    v29$1 := (if p4$1 then $$64$3bv32$1 else v29$1);
    v29$2 := (if p4$2 then $$64$3bv32$2 else v29$2);
    call {:sourceloc_num 59} v30$1, v30$2 := $_Z3dot6float4S_(p4$1, v22$1, v23$1, v24$1, v25$1, v26$1, v27$1, v28$1, v29$1, p4$2, v22$2, v23$2, v24$2, v25$2, v26$2, v27$2, v28$2, v29$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float4S_"} true;
    $$62$0bv32$1 := (if p4$1 then v30$1 else $$62$0bv32$1);
    $$62$0bv32$2 := (if p4$2 then v30$2 else $$62$0bv32$2);
    v31$1 := (if p4$1 then $$74$0bv32$1 else v31$1);
    v31$2 := (if p4$2 then $$74$0bv32$2 else v31$2);
    $$65$0bv32$1 := (if p4$1 then v31$1 else $$65$0bv32$1);
    $$65$0bv32$2 := (if p4$2 then v31$2 else $$65$0bv32$2);
    v32$1 := (if p4$1 then $$74$1bv32$1 else v32$1);
    v32$2 := (if p4$2 then $$74$1bv32$2 else v32$2);
    $$65$1bv32$1 := (if p4$1 then v32$1 else $$65$1bv32$1);
    $$65$1bv32$2 := (if p4$2 then v32$2 else $$65$1bv32$2);
    v33$1 := (if p4$1 then $$74$2bv32$1 else v33$1);
    v33$2 := (if p4$2 then $$74$2bv32$2 else v33$2);
    $$65$2bv32$1 := (if p4$1 then v33$1 else $$65$2bv32$1);
    $$65$2bv32$2 := (if p4$2 then v33$2 else $$65$2bv32$2);
    v34$1 := (if p4$1 then $$74$3bv32$1 else v34$1);
    v34$2 := (if p4$2 then $$74$3bv32$2 else v34$2);
    $$65$3bv32$1 := (if p4$1 then v34$1 else $$65$3bv32$1);
    $$65$3bv32$2 := (if p4$2 then v34$2 else $$65$3bv32$2);
    v35$1 := (if p4$1 then $$c_invViewMatrix$1[4bv32] else v35$1);
    v35$2 := (if p4$2 then $$c_invViewMatrix$2[4bv32] else v35$2);
    $$66$0bv32$1 := (if p4$1 then v35$1 else $$66$0bv32$1);
    $$66$0bv32$2 := (if p4$2 then v35$2 else $$66$0bv32$2);
    v36$1 := (if p4$1 then $$c_invViewMatrix$1[5bv32] else v36$1);
    v36$2 := (if p4$2 then $$c_invViewMatrix$2[5bv32] else v36$2);
    $$66$1bv32$1 := (if p4$1 then v36$1 else $$66$1bv32$1);
    $$66$1bv32$2 := (if p4$2 then v36$2 else $$66$1bv32$2);
    v37$1 := (if p4$1 then $$c_invViewMatrix$1[6bv32] else v37$1);
    v37$2 := (if p4$2 then $$c_invViewMatrix$2[6bv32] else v37$2);
    $$66$2bv32$1 := (if p4$1 then v37$1 else $$66$2bv32$1);
    $$66$2bv32$2 := (if p4$2 then v37$2 else $$66$2bv32$2);
    v38$1 := (if p4$1 then $$c_invViewMatrix$1[7bv32] else v38$1);
    v38$2 := (if p4$2 then $$c_invViewMatrix$2[7bv32] else v38$2);
    $$66$3bv32$1 := (if p4$1 then v38$1 else $$66$3bv32$1);
    $$66$3bv32$2 := (if p4$2 then v38$2 else $$66$3bv32$2);
    v39$1 := (if p4$1 then $$65$0bv32$1 else v39$1);
    v39$2 := (if p4$2 then $$65$0bv32$2 else v39$2);
    v40$1 := (if p4$1 then $$65$1bv32$1 else v40$1);
    v40$2 := (if p4$2 then $$65$1bv32$2 else v40$2);
    v41$1 := (if p4$1 then $$65$2bv32$1 else v41$1);
    v41$2 := (if p4$2 then $$65$2bv32$2 else v41$2);
    v42$1 := (if p4$1 then $$65$3bv32$1 else v42$1);
    v42$2 := (if p4$2 then $$65$3bv32$2 else v42$2);
    v43$1 := (if p4$1 then $$66$0bv32$1 else v43$1);
    v43$2 := (if p4$2 then $$66$0bv32$2 else v43$2);
    v44$1 := (if p4$1 then $$66$1bv32$1 else v44$1);
    v44$2 := (if p4$2 then $$66$1bv32$2 else v44$2);
    v45$1 := (if p4$1 then $$66$2bv32$1 else v45$1);
    v45$2 := (if p4$2 then $$66$2bv32$2 else v45$2);
    v46$1 := (if p4$1 then $$66$3bv32$1 else v46$1);
    v46$2 := (if p4$2 then $$66$3bv32$2 else v46$2);
    call {:sourceloc_num 85} v47$1, v47$2 := $_Z3dot6float4S_(p4$1, v39$1, v40$1, v41$1, v42$1, v43$1, v44$1, v45$1, v46$1, p4$2, v39$2, v40$2, v41$2, v42$2, v43$2, v44$2, v45$2, v46$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float4S_"} true;
    $$62$1bv32$1 := (if p4$1 then v47$1 else $$62$1bv32$1);
    $$62$1bv32$2 := (if p4$2 then v47$2 else $$62$1bv32$2);
    v48$1 := (if p4$1 then $$74$0bv32$1 else v48$1);
    v48$2 := (if p4$2 then $$74$0bv32$2 else v48$2);
    $$67$0bv32$1 := (if p4$1 then v48$1 else $$67$0bv32$1);
    $$67$0bv32$2 := (if p4$2 then v48$2 else $$67$0bv32$2);
    v49$1 := (if p4$1 then $$74$1bv32$1 else v49$1);
    v49$2 := (if p4$2 then $$74$1bv32$2 else v49$2);
    $$67$1bv32$1 := (if p4$1 then v49$1 else $$67$1bv32$1);
    $$67$1bv32$2 := (if p4$2 then v49$2 else $$67$1bv32$2);
    v50$1 := (if p4$1 then $$74$2bv32$1 else v50$1);
    v50$2 := (if p4$2 then $$74$2bv32$2 else v50$2);
    $$67$2bv32$1 := (if p4$1 then v50$1 else $$67$2bv32$1);
    $$67$2bv32$2 := (if p4$2 then v50$2 else $$67$2bv32$2);
    v51$1 := (if p4$1 then $$74$3bv32$1 else v51$1);
    v51$2 := (if p4$2 then $$74$3bv32$2 else v51$2);
    $$67$3bv32$1 := (if p4$1 then v51$1 else $$67$3bv32$1);
    $$67$3bv32$2 := (if p4$2 then v51$2 else $$67$3bv32$2);
    v52$1 := (if p4$1 then $$c_invViewMatrix$1[8bv32] else v52$1);
    v52$2 := (if p4$2 then $$c_invViewMatrix$2[8bv32] else v52$2);
    $$68$0bv32$1 := (if p4$1 then v52$1 else $$68$0bv32$1);
    $$68$0bv32$2 := (if p4$2 then v52$2 else $$68$0bv32$2);
    v53$1 := (if p4$1 then $$c_invViewMatrix$1[9bv32] else v53$1);
    v53$2 := (if p4$2 then $$c_invViewMatrix$2[9bv32] else v53$2);
    $$68$1bv32$1 := (if p4$1 then v53$1 else $$68$1bv32$1);
    $$68$1bv32$2 := (if p4$2 then v53$2 else $$68$1bv32$2);
    v54$1 := (if p4$1 then $$c_invViewMatrix$1[10bv32] else v54$1);
    v54$2 := (if p4$2 then $$c_invViewMatrix$2[10bv32] else v54$2);
    $$68$2bv32$1 := (if p4$1 then v54$1 else $$68$2bv32$1);
    $$68$2bv32$2 := (if p4$2 then v54$2 else $$68$2bv32$2);
    v55$1 := (if p4$1 then $$c_invViewMatrix$1[11bv32] else v55$1);
    v55$2 := (if p4$2 then $$c_invViewMatrix$2[11bv32] else v55$2);
    $$68$3bv32$1 := (if p4$1 then v55$1 else $$68$3bv32$1);
    $$68$3bv32$2 := (if p4$2 then v55$2 else $$68$3bv32$2);
    v56$1 := (if p4$1 then $$67$0bv32$1 else v56$1);
    v56$2 := (if p4$2 then $$67$0bv32$2 else v56$2);
    v57$1 := (if p4$1 then $$67$1bv32$1 else v57$1);
    v57$2 := (if p4$2 then $$67$1bv32$2 else v57$2);
    v58$1 := (if p4$1 then $$67$2bv32$1 else v58$1);
    v58$2 := (if p4$2 then $$67$2bv32$2 else v58$2);
    v59$1 := (if p4$1 then $$67$3bv32$1 else v59$1);
    v59$2 := (if p4$2 then $$67$3bv32$2 else v59$2);
    v60$1 := (if p4$1 then $$68$0bv32$1 else v60$1);
    v60$2 := (if p4$2 then $$68$0bv32$2 else v60$2);
    v61$1 := (if p4$1 then $$68$1bv32$1 else v61$1);
    v61$2 := (if p4$2 then $$68$1bv32$2 else v61$2);
    v62$1 := (if p4$1 then $$68$2bv32$1 else v62$1);
    v62$2 := (if p4$2 then $$68$2bv32$2 else v62$2);
    v63$1 := (if p4$1 then $$68$3bv32$1 else v63$1);
    v63$2 := (if p4$2 then $$68$3bv32$2 else v63$2);
    call {:sourceloc_num 111} v64$1, v64$2 := $_Z3dot6float4S_(p4$1, v56$1, v57$1, v58$1, v59$1, v60$1, v61$1, v62$1, v63$1, p4$2, v56$2, v57$2, v58$2, v59$2, v60$2, v61$2, v62$2, v63$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float4S_"} true;
    $$62$2bv32$1 := (if p4$1 then v64$1 else $$62$2bv32$1);
    $$62$2bv32$2 := (if p4$2 then v64$2 else $$62$2bv32$2);
    $$62$3bv32$1 := (if p4$1 then 1065353216bv32 else $$62$3bv32$1);
    $$62$3bv32$2 := (if p4$2 then 1065353216bv32 else $$62$3bv32$2);
    v65$1 := (if p4$1 then $$62$0bv32$1 else v65$1);
    v65$2 := (if p4$2 then $$62$0bv32$2 else v65$2);
    v66$1 := (if p4$1 then $$62$1bv32$1 else v66$1);
    v66$2 := (if p4$2 then $$62$1bv32$2 else v66$2);
    v67$1 := (if p4$1 then $$62$2bv32$1 else v67$1);
    v67$2 := (if p4$2 then $$62$2bv32$2 else v67$2);
    v68$1 := (if p4$1 then $$62$3bv32$1 else v68$1);
    v68$2 := (if p4$2 then $$62$3bv32$2 else v68$2);
    $$73$0bv32$1 := (if p4$1 then v65$1 else $$73$0bv32$1);
    $$73$0bv32$2 := (if p4$2 then v65$2 else $$73$0bv32$2);
    $$73$1bv32$1 := (if p4$1 then v66$1 else $$73$1bv32$1);
    $$73$1bv32$2 := (if p4$2 then v66$2 else $$73$1bv32$2);
    $$73$2bv32$1 := (if p4$1 then v67$1 else $$73$2bv32$1);
    $$73$2bv32$2 := (if p4$2 then v67$2 else $$73$2bv32$2);
    $$73$3bv32$1 := (if p4$1 then v68$1 else $$73$3bv32$1);
    $$73$3bv32$2 := (if p4$2 then v68$2 else $$73$3bv32$2);
    v69$1 := (if p4$1 then $$73$0bv32$1 else v69$1);
    v69$2 := (if p4$2 then $$73$0bv32$2 else v69$2);
    v70$1 := (if p4$1 then $$73$1bv32$1 else v70$1);
    v70$2 := (if p4$2 then $$73$1bv32$2 else v70$2);
    v71$1 := (if p4$1 then $$73$2bv32$1 else v71$1);
    v71$2 := (if p4$2 then $$73$2bv32$2 else v71$2);
    v72$1 := (if p4$1 then $$73$3bv32$1 else v72$1);
    v72$2 := (if p4$2 then $$73$3bv32$2 else v72$2);
    $$a.i.i$0bv32$1 := (if p4$1 then v69$1 else $$a.i.i$0bv32$1);
    $$a.i.i$0bv32$2 := (if p4$2 then v69$2 else $$a.i.i$0bv32$2);
    $$a.i.i$1bv32$1 := (if p4$1 then v70$1 else $$a.i.i$1bv32$1);
    $$a.i.i$1bv32$2 := (if p4$2 then v70$2 else $$a.i.i$1bv32$2);
    $$a.i.i$2bv32$1 := (if p4$1 then v71$1 else $$a.i.i$2bv32$1);
    $$a.i.i$2bv32$2 := (if p4$2 then v71$2 else $$a.i.i$2bv32$2);
    $$a.i.i$3bv32$1 := (if p4$1 then v72$1 else $$a.i.i$3bv32$1);
    $$a.i.i$3bv32$2 := (if p4$2 then v72$2 else $$a.i.i$3bv32$2);
    v73$1 := (if p4$1 then $$a.i.i$0bv32$1 else v73$1);
    v73$2 := (if p4$2 then $$a.i.i$0bv32$2 else v73$2);
    v74$1 := (if p4$1 then $$a.i.i$1bv32$1 else v74$1);
    v74$2 := (if p4$2 then $$a.i.i$1bv32$2 else v74$2);
    v75$1 := (if p4$1 then $$a.i.i$2bv32$1 else v75$1);
    v75$2 := (if p4$2 then $$a.i.i$2bv32$2 else v75$2);
    $$60$0bv32$1 := (if p4$1 then v73$1 else $$60$0bv32$1);
    $$60$0bv32$2 := (if p4$2 then v73$2 else $$60$0bv32$2);
    $$60$1bv32$1 := (if p4$1 then v74$1 else $$60$1bv32$1);
    $$60$1bv32$2 := (if p4$2 then v74$2 else $$60$1bv32$2);
    $$60$2bv32$1 := (if p4$1 then v75$1 else $$60$2bv32$1);
    $$60$2bv32$2 := (if p4$2 then v75$2 else $$60$2bv32$2);
    v76$1 := (if p4$1 then $$60$0bv32$1 else v76$1);
    v76$2 := (if p4$2 then $$60$0bv32$2 else v76$2);
    v77$1 := (if p4$1 then $$60$1bv32$1 else v77$1);
    v77$2 := (if p4$2 then $$60$1bv32$2 else v77$2);
    v78$1 := (if p4$1 then $$60$2bv32$1 else v78$1);
    v78$2 := (if p4$2 then $$60$2bv32$2 else v78$2);
    $$61$0bv32$1 := (if p4$1 then v76$1 else $$61$0bv32$1);
    $$61$0bv32$2 := (if p4$2 then v76$2 else $$61$0bv32$2);
    $$61$1bv32$1 := (if p4$1 then v77$1 else $$61$1bv32$1);
    $$61$1bv32$2 := (if p4$2 then v77$2 else $$61$1bv32$2);
    $$61$2bv32$1 := (if p4$1 then v78$1 else $$61$2bv32$1);
    $$61$2bv32$2 := (if p4$2 then v78$2 else $$61$2bv32$2);
    v79$1 := (if p4$1 then $$61$0bv32$1 else v79$1);
    v79$2 := (if p4$2 then $$61$0bv32$2 else v79$2);
    v80$1 := (if p4$1 then $$61$1bv32$1 else v80$1);
    v80$2 := (if p4$2 then $$61$1bv32$2 else v80$2);
    v81$1 := (if p4$1 then $$61$2bv32$1 else v81$1);
    v81$2 := (if p4$2 then $$61$2bv32$2 else v81$2);
    $$72$0bv32$1 := (if p4$1 then v79$1 else $$72$0bv32$1);
    $$72$0bv32$2 := (if p4$2 then v79$2 else $$72$0bv32$2);
    $$72$1bv32$1 := (if p4$1 then v80$1 else $$72$1bv32$1);
    $$72$1bv32$2 := (if p4$2 then v80$2 else $$72$1bv32$2);
    $$72$2bv32$1 := (if p4$1 then v81$1 else $$72$2bv32$1);
    $$72$2bv32$2 := (if p4$2 then v81$2 else $$72$2bv32$2);
    v82$1 := (if p4$1 then $$72$0bv32$1 else v82$1);
    v82$2 := (if p4$2 then $$72$0bv32$2 else v82$2);
    $$eyeRay.i$0bv32$1 := (if p4$1 then v82$1 else $$eyeRay.i$0bv32$1);
    $$eyeRay.i$0bv32$2 := (if p4$2 then v82$2 else $$eyeRay.i$0bv32$2);
    v83$1 := (if p4$1 then $$72$1bv32$1 else v83$1);
    v83$2 := (if p4$2 then $$72$1bv32$2 else v83$2);
    $$eyeRay.i$1bv32$1 := (if p4$1 then v83$1 else $$eyeRay.i$1bv32$1);
    $$eyeRay.i$1bv32$2 := (if p4$2 then v83$2 else $$eyeRay.i$1bv32$2);
    v84$1 := (if p4$1 then $$72$2bv32$1 else v84$1);
    v84$2 := (if p4$2 then $$72$2bv32$2 else v84$2);
    $$eyeRay.i$2bv32$1 := (if p4$1 then v84$1 else $$eyeRay.i$2bv32$1);
    $$eyeRay.i$2bv32$2 := (if p4$2 then v84$2 else $$eyeRay.i$2bv32$2);
    $$59$0bv32$1 := (if p4$1 then FSUB32(FMUL32(FDIV32(UI32_TO_FP32(v6$1), UI32_TO_FP32($imageW)), 1073741824bv32), 1065353216bv32) else $$59$0bv32$1);
    $$59$0bv32$2 := (if p4$2 then FSUB32(FMUL32(FDIV32(UI32_TO_FP32(v6$2), UI32_TO_FP32($imageW)), 1073741824bv32), 1065353216bv32) else $$59$0bv32$2);
    $$59$1bv32$1 := (if p4$1 then FSUB32(FMUL32(FDIV32(UI32_TO_FP32(v7$1), UI32_TO_FP32($imageH)), 1073741824bv32), 1065353216bv32) else $$59$1bv32$1);
    $$59$1bv32$2 := (if p4$2 then FSUB32(FMUL32(FDIV32(UI32_TO_FP32(v7$2), UI32_TO_FP32($imageH)), 1073741824bv32), 1065353216bv32) else $$59$1bv32$2);
    $$59$2bv32$1 := (if p4$1 then 3221225472bv32 else $$59$2bv32$1);
    $$59$2bv32$2 := (if p4$2 then 3221225472bv32 else $$59$2bv32$2);
    v85$1 := (if p4$1 then $$59$0bv32$1 else v85$1);
    v85$2 := (if p4$2 then $$59$0bv32$2 else v85$2);
    v86$1 := (if p4$1 then $$59$1bv32$1 else v86$1);
    v86$2 := (if p4$2 then $$59$1bv32$2 else v86$2);
    v87$1 := (if p4$1 then $$59$2bv32$1 else v87$1);
    v87$2 := (if p4$2 then $$59$2bv32$2 else v87$2);
    $$76$0bv32$1 := (if p4$1 then v85$1 else $$76$0bv32$1);
    $$76$0bv32$2 := (if p4$2 then v85$2 else $$76$0bv32$2);
    $$76$1bv32$1 := (if p4$1 then v86$1 else $$76$1bv32$1);
    $$76$1bv32$2 := (if p4$2 then v86$2 else $$76$1bv32$2);
    $$76$2bv32$1 := (if p4$1 then v87$1 else $$76$2bv32$1);
    $$76$2bv32$2 := (if p4$2 then v87$2 else $$76$2bv32$2);
    v88$1 := (if p4$1 then $$76$0bv32$1 else v88$1);
    v88$2 := (if p4$2 then $$76$0bv32$2 else v88$2);
    v89$1 := (if p4$1 then $$76$1bv32$1 else v89$1);
    v89$2 := (if p4$2 then $$76$1bv32$2 else v89$2);
    v90$1 := (if p4$1 then $$76$2bv32$1 else v90$1);
    v90$2 := (if p4$2 then $$76$2bv32$2 else v90$2);
    call {:sourceloc_num 166} v91$1, v91$2 := $_Z9normalize6float3(p4$1, v88$1, v89$1, v90$1, p4$2, v88$2, v89$2, v90$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9normalize6float3"} true;
    $$75$0bv32$1 := (if p4$1 then v91$1[32:0] else $$75$0bv32$1);
    $$75$0bv32$2 := (if p4$2 then v91$2[32:0] else $$75$0bv32$2);
    $$75$1bv32$1 := (if p4$1 then v91$1[64:32] else $$75$1bv32$1);
    $$75$1bv32$2 := (if p4$2 then v91$2[64:32] else $$75$1bv32$2);
    $$75$2bv32$1 := (if p4$1 then v91$1[96:64] else $$75$2bv32$1);
    $$75$2bv32$2 := (if p4$2 then v91$2[96:64] else $$75$2bv32$2);
    v92$1 := (if p4$1 then $$75$0bv32$1 else v92$1);
    v92$2 := (if p4$2 then $$75$0bv32$2 else v92$2);
    $$eyeRay.i$3bv32$1 := (if p4$1 then v92$1 else $$eyeRay.i$3bv32$1);
    $$eyeRay.i$3bv32$2 := (if p4$2 then v92$2 else $$eyeRay.i$3bv32$2);
    v93$1 := (if p4$1 then $$75$1bv32$1 else v93$1);
    v93$2 := (if p4$2 then $$75$1bv32$2 else v93$2);
    $$eyeRay.i$4bv32$1 := (if p4$1 then v93$1 else $$eyeRay.i$4bv32$1);
    $$eyeRay.i$4bv32$2 := (if p4$2 then v93$2 else $$eyeRay.i$4bv32$2);
    v94$1 := (if p4$1 then $$75$2bv32$1 else v94$1);
    v94$2 := (if p4$2 then $$75$2bv32$2 else v94$2);
    $$eyeRay.i$5bv32$1 := (if p4$1 then v94$1 else $$eyeRay.i$5bv32$1);
    $$eyeRay.i$5bv32$2 := (if p4$2 then v94$2 else $$eyeRay.i$5bv32$2);
    v95$1 := (if p4$1 then $$eyeRay.i$3bv32$1 else v95$1);
    v95$2 := (if p4$2 then $$eyeRay.i$3bv32$2 else v95$2);
    $$50$0bv32$1 := (if p4$1 then v95$1 else $$50$0bv32$1);
    $$50$0bv32$2 := (if p4$2 then v95$2 else $$50$0bv32$2);
    v96$1 := (if p4$1 then $$eyeRay.i$4bv32$1 else v96$1);
    v96$2 := (if p4$2 then $$eyeRay.i$4bv32$2 else v96$2);
    $$50$1bv32$1 := (if p4$1 then v96$1 else $$50$1bv32$1);
    $$50$1bv32$2 := (if p4$2 then v96$2 else $$50$1bv32$2);
    v97$1 := (if p4$1 then $$eyeRay.i$5bv32$1 else v97$1);
    v97$2 := (if p4$2 then $$eyeRay.i$5bv32$2 else v97$2);
    $$50$2bv32$1 := (if p4$1 then v97$1 else $$50$2bv32$1);
    $$50$2bv32$2 := (if p4$2 then v97$2 else $$50$2bv32$2);
    v98$1 := (if p4$1 then $$c_invViewMatrix$1[0bv32] else v98$1);
    v98$2 := (if p4$2 then $$c_invViewMatrix$2[0bv32] else v98$2);
    $$52$0bv32$1 := (if p4$1 then v98$1 else $$52$0bv32$1);
    $$52$0bv32$2 := (if p4$2 then v98$2 else $$52$0bv32$2);
    v99$1 := (if p4$1 then $$c_invViewMatrix$1[1bv32] else v99$1);
    v99$2 := (if p4$2 then $$c_invViewMatrix$2[1bv32] else v99$2);
    $$52$1bv32$1 := (if p4$1 then v99$1 else $$52$1bv32$1);
    $$52$1bv32$2 := (if p4$2 then v99$2 else $$52$1bv32$2);
    v100$1 := (if p4$1 then $$c_invViewMatrix$1[2bv32] else v100$1);
    v100$2 := (if p4$2 then $$c_invViewMatrix$2[2bv32] else v100$2);
    $$52$2bv32$1 := (if p4$1 then v100$1 else $$52$2bv32$1);
    $$52$2bv32$2 := (if p4$2 then v100$2 else $$52$2bv32$2);
    v101$1 := (if p4$1 then $$c_invViewMatrix$1[3bv32] else v101$1);
    v101$2 := (if p4$2 then $$c_invViewMatrix$2[3bv32] else v101$2);
    $$52$3bv32$1 := (if p4$1 then v101$1 else $$52$3bv32$1);
    $$52$3bv32$2 := (if p4$2 then v101$2 else $$52$3bv32$2);
    v102$1 := (if p4$1 then $$52$0bv32$1 else v102$1);
    v102$2 := (if p4$2 then $$52$0bv32$2 else v102$2);
    v103$1 := (if p4$1 then $$52$1bv32$1 else v103$1);
    v103$2 := (if p4$2 then $$52$1bv32$2 else v103$2);
    v104$1 := (if p4$1 then $$52$2bv32$1 else v104$1);
    v104$2 := (if p4$2 then $$52$2bv32$2 else v104$2);
    v105$1 := (if p4$1 then $$52$3bv32$1 else v105$1);
    v105$2 := (if p4$2 then $$52$3bv32$2 else v105$2);
    $$a.i.i.i$0bv32$1 := (if p4$1 then v102$1 else $$a.i.i.i$0bv32$1);
    $$a.i.i.i$0bv32$2 := (if p4$2 then v102$2 else $$a.i.i.i$0bv32$2);
    $$a.i.i.i$1bv32$1 := (if p4$1 then v103$1 else $$a.i.i.i$1bv32$1);
    $$a.i.i.i$1bv32$2 := (if p4$2 then v103$2 else $$a.i.i.i$1bv32$2);
    $$a.i.i.i$2bv32$1 := (if p4$1 then v104$1 else $$a.i.i.i$2bv32$1);
    $$a.i.i.i$2bv32$2 := (if p4$2 then v104$2 else $$a.i.i.i$2bv32$2);
    $$a.i.i.i$3bv32$1 := (if p4$1 then v105$1 else $$a.i.i.i$3bv32$1);
    $$a.i.i.i$3bv32$2 := (if p4$2 then v105$2 else $$a.i.i.i$3bv32$2);
    v106$1 := (if p4$1 then $$a.i.i.i$0bv32$1 else v106$1);
    v106$2 := (if p4$2 then $$a.i.i.i$0bv32$2 else v106$2);
    v107$1 := (if p4$1 then $$a.i.i.i$1bv32$1 else v107$1);
    v107$2 := (if p4$2 then $$a.i.i.i$1bv32$2 else v107$2);
    v108$1 := (if p4$1 then $$a.i.i.i$2bv32$1 else v108$1);
    v108$2 := (if p4$2 then $$a.i.i.i$2bv32$2 else v108$2);
    $$47$0bv32$1 := (if p4$1 then v106$1 else $$47$0bv32$1);
    $$47$0bv32$2 := (if p4$2 then v106$2 else $$47$0bv32$2);
    $$47$1bv32$1 := (if p4$1 then v107$1 else $$47$1bv32$1);
    $$47$1bv32$2 := (if p4$2 then v107$2 else $$47$1bv32$2);
    $$47$2bv32$1 := (if p4$1 then v108$1 else $$47$2bv32$1);
    $$47$2bv32$2 := (if p4$2 then v108$2 else $$47$2bv32$2);
    v109$1 := (if p4$1 then $$47$0bv32$1 else v109$1);
    v109$2 := (if p4$2 then $$47$0bv32$2 else v109$2);
    v110$1 := (if p4$1 then $$47$1bv32$1 else v110$1);
    v110$2 := (if p4$2 then $$47$1bv32$2 else v110$2);
    v111$1 := (if p4$1 then $$47$2bv32$1 else v111$1);
    v111$2 := (if p4$2 then $$47$2bv32$2 else v111$2);
    $$48$0bv32$1 := (if p4$1 then v109$1 else $$48$0bv32$1);
    $$48$0bv32$2 := (if p4$2 then v109$2 else $$48$0bv32$2);
    $$48$1bv32$1 := (if p4$1 then v110$1 else $$48$1bv32$1);
    $$48$1bv32$2 := (if p4$2 then v110$2 else $$48$1bv32$2);
    $$48$2bv32$1 := (if p4$1 then v111$1 else $$48$2bv32$1);
    $$48$2bv32$2 := (if p4$2 then v111$2 else $$48$2bv32$2);
    v112$1 := (if p4$1 then $$48$0bv32$1 else v112$1);
    v112$2 := (if p4$2 then $$48$0bv32$2 else v112$2);
    v113$1 := (if p4$1 then $$48$1bv32$1 else v113$1);
    v113$2 := (if p4$2 then $$48$1bv32$2 else v113$2);
    v114$1 := (if p4$1 then $$48$2bv32$1 else v114$1);
    v114$2 := (if p4$2 then $$48$2bv32$2 else v114$2);
    $$51$0bv32$1 := (if p4$1 then v112$1 else $$51$0bv32$1);
    $$51$0bv32$2 := (if p4$2 then v112$2 else $$51$0bv32$2);
    $$51$1bv32$1 := (if p4$1 then v113$1 else $$51$1bv32$1);
    $$51$1bv32$2 := (if p4$2 then v113$2 else $$51$1bv32$2);
    $$51$2bv32$1 := (if p4$1 then v114$1 else $$51$2bv32$1);
    $$51$2bv32$2 := (if p4$2 then v114$2 else $$51$2bv32$2);
    v115$1 := (if p4$1 then $$50$0bv32$1 else v115$1);
    v115$2 := (if p4$2 then $$50$0bv32$2 else v115$2);
    v116$1 := (if p4$1 then $$50$1bv32$1 else v116$1);
    v116$2 := (if p4$2 then $$50$1bv32$2 else v116$2);
    v117$1 := (if p4$1 then $$50$2bv32$1 else v117$1);
    v117$2 := (if p4$2 then $$50$2bv32$2 else v117$2);
    v118$1 := (if p4$1 then $$51$0bv32$1 else v118$1);
    v118$2 := (if p4$2 then $$51$0bv32$2 else v118$2);
    v119$1 := (if p4$1 then $$51$1bv32$1 else v119$1);
    v119$2 := (if p4$2 then $$51$1bv32$2 else v119$2);
    v120$1 := (if p4$1 then $$51$2bv32$1 else v120$1);
    v120$2 := (if p4$2 then $$51$2bv32$2 else v120$2);
    call {:sourceloc_num 222} v121$1, v121$2 := $_Z3dot6float3S_(p4$1, v115$1, v116$1, v117$1, v118$1, v119$1, v120$1, p4$2, v115$2, v116$2, v117$2, v118$2, v119$2, v120$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float3S_"} true;
    $$49$0bv32$1 := (if p4$1 then v121$1 else $$49$0bv32$1);
    $$49$0bv32$2 := (if p4$2 then v121$2 else $$49$0bv32$2);
    v122$1 := (if p4$1 then $$eyeRay.i$3bv32$1 else v122$1);
    v122$2 := (if p4$2 then $$eyeRay.i$3bv32$2 else v122$2);
    $$53$0bv32$1 := (if p4$1 then v122$1 else $$53$0bv32$1);
    $$53$0bv32$2 := (if p4$2 then v122$2 else $$53$0bv32$2);
    v123$1 := (if p4$1 then $$eyeRay.i$4bv32$1 else v123$1);
    v123$2 := (if p4$2 then $$eyeRay.i$4bv32$2 else v123$2);
    $$53$1bv32$1 := (if p4$1 then v123$1 else $$53$1bv32$1);
    $$53$1bv32$2 := (if p4$2 then v123$2 else $$53$1bv32$2);
    v124$1 := (if p4$1 then $$eyeRay.i$5bv32$1 else v124$1);
    v124$2 := (if p4$2 then $$eyeRay.i$5bv32$2 else v124$2);
    $$53$2bv32$1 := (if p4$1 then v124$1 else $$53$2bv32$1);
    $$53$2bv32$2 := (if p4$2 then v124$2 else $$53$2bv32$2);
    v125$1 := (if p4$1 then $$c_invViewMatrix$1[4bv32] else v125$1);
    v125$2 := (if p4$2 then $$c_invViewMatrix$2[4bv32] else v125$2);
    $$55$0bv32$1 := (if p4$1 then v125$1 else $$55$0bv32$1);
    $$55$0bv32$2 := (if p4$2 then v125$2 else $$55$0bv32$2);
    v126$1 := (if p4$1 then $$c_invViewMatrix$1[5bv32] else v126$1);
    v126$2 := (if p4$2 then $$c_invViewMatrix$2[5bv32] else v126$2);
    $$55$1bv32$1 := (if p4$1 then v126$1 else $$55$1bv32$1);
    $$55$1bv32$2 := (if p4$2 then v126$2 else $$55$1bv32$2);
    v127$1 := (if p4$1 then $$c_invViewMatrix$1[6bv32] else v127$1);
    v127$2 := (if p4$2 then $$c_invViewMatrix$2[6bv32] else v127$2);
    $$55$2bv32$1 := (if p4$1 then v127$1 else $$55$2bv32$1);
    $$55$2bv32$2 := (if p4$2 then v127$2 else $$55$2bv32$2);
    v128$1 := (if p4$1 then $$c_invViewMatrix$1[7bv32] else v128$1);
    v128$2 := (if p4$2 then $$c_invViewMatrix$2[7bv32] else v128$2);
    $$55$3bv32$1 := (if p4$1 then v128$1 else $$55$3bv32$1);
    $$55$3bv32$2 := (if p4$2 then v128$2 else $$55$3bv32$2);
    v129$1 := (if p4$1 then $$55$0bv32$1 else v129$1);
    v129$2 := (if p4$2 then $$55$0bv32$2 else v129$2);
    v130$1 := (if p4$1 then $$55$1bv32$1 else v130$1);
    v130$2 := (if p4$2 then $$55$1bv32$2 else v130$2);
    v131$1 := (if p4$1 then $$55$2bv32$1 else v131$1);
    v131$2 := (if p4$2 then $$55$2bv32$2 else v131$2);
    v132$1 := (if p4$1 then $$55$3bv32$1 else v132$1);
    v132$2 := (if p4$2 then $$55$3bv32$2 else v132$2);
    $$a.i2.i.i$0bv32$1 := (if p4$1 then v129$1 else $$a.i2.i.i$0bv32$1);
    $$a.i2.i.i$0bv32$2 := (if p4$2 then v129$2 else $$a.i2.i.i$0bv32$2);
    $$a.i2.i.i$1bv32$1 := (if p4$1 then v130$1 else $$a.i2.i.i$1bv32$1);
    $$a.i2.i.i$1bv32$2 := (if p4$2 then v130$2 else $$a.i2.i.i$1bv32$2);
    $$a.i2.i.i$2bv32$1 := (if p4$1 then v131$1 else $$a.i2.i.i$2bv32$1);
    $$a.i2.i.i$2bv32$2 := (if p4$2 then v131$2 else $$a.i2.i.i$2bv32$2);
    $$a.i2.i.i$3bv32$1 := (if p4$1 then v132$1 else $$a.i2.i.i$3bv32$1);
    $$a.i2.i.i$3bv32$2 := (if p4$2 then v132$2 else $$a.i2.i.i$3bv32$2);
    v133$1 := (if p4$1 then $$a.i2.i.i$0bv32$1 else v133$1);
    v133$2 := (if p4$2 then $$a.i2.i.i$0bv32$2 else v133$2);
    v134$1 := (if p4$1 then $$a.i2.i.i$1bv32$1 else v134$1);
    v134$2 := (if p4$2 then $$a.i2.i.i$1bv32$2 else v134$2);
    v135$1 := (if p4$1 then $$a.i2.i.i$2bv32$1 else v135$1);
    v135$2 := (if p4$2 then $$a.i2.i.i$2bv32$2 else v135$2);
    $$43$0bv32$1 := (if p4$1 then v133$1 else $$43$0bv32$1);
    $$43$0bv32$2 := (if p4$2 then v133$2 else $$43$0bv32$2);
    $$43$1bv32$1 := (if p4$1 then v134$1 else $$43$1bv32$1);
    $$43$1bv32$2 := (if p4$2 then v134$2 else $$43$1bv32$2);
    $$43$2bv32$1 := (if p4$1 then v135$1 else $$43$2bv32$1);
    $$43$2bv32$2 := (if p4$2 then v135$2 else $$43$2bv32$2);
    v136$1 := (if p4$1 then $$43$0bv32$1 else v136$1);
    v136$2 := (if p4$2 then $$43$0bv32$2 else v136$2);
    v137$1 := (if p4$1 then $$43$1bv32$1 else v137$1);
    v137$2 := (if p4$2 then $$43$1bv32$2 else v137$2);
    v138$1 := (if p4$1 then $$43$2bv32$1 else v138$1);
    v138$2 := (if p4$2 then $$43$2bv32$2 else v138$2);
    $$44$0bv32$1 := (if p4$1 then v136$1 else $$44$0bv32$1);
    $$44$0bv32$2 := (if p4$2 then v136$2 else $$44$0bv32$2);
    $$44$1bv32$1 := (if p4$1 then v137$1 else $$44$1bv32$1);
    $$44$1bv32$2 := (if p4$2 then v137$2 else $$44$1bv32$2);
    $$44$2bv32$1 := (if p4$1 then v138$1 else $$44$2bv32$1);
    $$44$2bv32$2 := (if p4$2 then v138$2 else $$44$2bv32$2);
    v139$1 := (if p4$1 then $$44$0bv32$1 else v139$1);
    v139$2 := (if p4$2 then $$44$0bv32$2 else v139$2);
    v140$1 := (if p4$1 then $$44$1bv32$1 else v140$1);
    v140$2 := (if p4$2 then $$44$1bv32$2 else v140$2);
    v141$1 := (if p4$1 then $$44$2bv32$1 else v141$1);
    v141$2 := (if p4$2 then $$44$2bv32$2 else v141$2);
    $$54$0bv32$1 := (if p4$1 then v139$1 else $$54$0bv32$1);
    $$54$0bv32$2 := (if p4$2 then v139$2 else $$54$0bv32$2);
    $$54$1bv32$1 := (if p4$1 then v140$1 else $$54$1bv32$1);
    $$54$1bv32$2 := (if p4$2 then v140$2 else $$54$1bv32$2);
    $$54$2bv32$1 := (if p4$1 then v141$1 else $$54$2bv32$1);
    $$54$2bv32$2 := (if p4$2 then v141$2 else $$54$2bv32$2);
    v142$1 := (if p4$1 then $$53$0bv32$1 else v142$1);
    v142$2 := (if p4$2 then $$53$0bv32$2 else v142$2);
    v143$1 := (if p4$1 then $$53$1bv32$1 else v143$1);
    v143$2 := (if p4$2 then $$53$1bv32$2 else v143$2);
    v144$1 := (if p4$1 then $$53$2bv32$1 else v144$1);
    v144$2 := (if p4$2 then $$53$2bv32$2 else v144$2);
    v145$1 := (if p4$1 then $$54$0bv32$1 else v145$1);
    v145$2 := (if p4$2 then $$54$0bv32$2 else v145$2);
    v146$1 := (if p4$1 then $$54$1bv32$1 else v146$1);
    v146$2 := (if p4$2 then $$54$1bv32$2 else v146$2);
    v147$1 := (if p4$1 then $$54$2bv32$1 else v147$1);
    v147$2 := (if p4$2 then $$54$2bv32$2 else v147$2);
    call {:sourceloc_num 270} v148$1, v148$2 := $_Z3dot6float3S_(p4$1, v142$1, v143$1, v144$1, v145$1, v146$1, v147$1, p4$2, v142$2, v143$2, v144$2, v145$2, v146$2, v147$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float3S_"} true;
    $$49$1bv32$1 := (if p4$1 then v148$1 else $$49$1bv32$1);
    $$49$1bv32$2 := (if p4$2 then v148$2 else $$49$1bv32$2);
    v149$1 := (if p4$1 then $$eyeRay.i$3bv32$1 else v149$1);
    v149$2 := (if p4$2 then $$eyeRay.i$3bv32$2 else v149$2);
    $$56$0bv32$1 := (if p4$1 then v149$1 else $$56$0bv32$1);
    $$56$0bv32$2 := (if p4$2 then v149$2 else $$56$0bv32$2);
    v150$1 := (if p4$1 then $$eyeRay.i$4bv32$1 else v150$1);
    v150$2 := (if p4$2 then $$eyeRay.i$4bv32$2 else v150$2);
    $$56$1bv32$1 := (if p4$1 then v150$1 else $$56$1bv32$1);
    $$56$1bv32$2 := (if p4$2 then v150$2 else $$56$1bv32$2);
    v151$1 := (if p4$1 then $$eyeRay.i$5bv32$1 else v151$1);
    v151$2 := (if p4$2 then $$eyeRay.i$5bv32$2 else v151$2);
    $$56$2bv32$1 := (if p4$1 then v151$1 else $$56$2bv32$1);
    $$56$2bv32$2 := (if p4$2 then v151$2 else $$56$2bv32$2);
    v152$1 := (if p4$1 then $$c_invViewMatrix$1[8bv32] else v152$1);
    v152$2 := (if p4$2 then $$c_invViewMatrix$2[8bv32] else v152$2);
    $$58$0bv32$1 := (if p4$1 then v152$1 else $$58$0bv32$1);
    $$58$0bv32$2 := (if p4$2 then v152$2 else $$58$0bv32$2);
    v153$1 := (if p4$1 then $$c_invViewMatrix$1[9bv32] else v153$1);
    v153$2 := (if p4$2 then $$c_invViewMatrix$2[9bv32] else v153$2);
    $$58$1bv32$1 := (if p4$1 then v153$1 else $$58$1bv32$1);
    $$58$1bv32$2 := (if p4$2 then v153$2 else $$58$1bv32$2);
    v154$1 := (if p4$1 then $$c_invViewMatrix$1[10bv32] else v154$1);
    v154$2 := (if p4$2 then $$c_invViewMatrix$2[10bv32] else v154$2);
    $$58$2bv32$1 := (if p4$1 then v154$1 else $$58$2bv32$1);
    $$58$2bv32$2 := (if p4$2 then v154$2 else $$58$2bv32$2);
    v155$1 := (if p4$1 then $$c_invViewMatrix$1[11bv32] else v155$1);
    v155$2 := (if p4$2 then $$c_invViewMatrix$2[11bv32] else v155$2);
    $$58$3bv32$1 := (if p4$1 then v155$1 else $$58$3bv32$1);
    $$58$3bv32$2 := (if p4$2 then v155$2 else $$58$3bv32$2);
    v156$1 := (if p4$1 then $$58$0bv32$1 else v156$1);
    v156$2 := (if p4$2 then $$58$0bv32$2 else v156$2);
    v157$1 := (if p4$1 then $$58$1bv32$1 else v157$1);
    v157$2 := (if p4$2 then $$58$1bv32$2 else v157$2);
    v158$1 := (if p4$1 then $$58$2bv32$1 else v158$1);
    v158$2 := (if p4$2 then $$58$2bv32$2 else v158$2);
    v159$1 := (if p4$1 then $$58$3bv32$1 else v159$1);
    v159$2 := (if p4$2 then $$58$3bv32$2 else v159$2);
    $$a.i1.i.i$0bv32$1 := (if p4$1 then v156$1 else $$a.i1.i.i$0bv32$1);
    $$a.i1.i.i$0bv32$2 := (if p4$2 then v156$2 else $$a.i1.i.i$0bv32$2);
    $$a.i1.i.i$1bv32$1 := (if p4$1 then v157$1 else $$a.i1.i.i$1bv32$1);
    $$a.i1.i.i$1bv32$2 := (if p4$2 then v157$2 else $$a.i1.i.i$1bv32$2);
    $$a.i1.i.i$2bv32$1 := (if p4$1 then v158$1 else $$a.i1.i.i$2bv32$1);
    $$a.i1.i.i$2bv32$2 := (if p4$2 then v158$2 else $$a.i1.i.i$2bv32$2);
    $$a.i1.i.i$3bv32$1 := (if p4$1 then v159$1 else $$a.i1.i.i$3bv32$1);
    $$a.i1.i.i$3bv32$2 := (if p4$2 then v159$2 else $$a.i1.i.i$3bv32$2);
    v160$1 := (if p4$1 then $$a.i1.i.i$0bv32$1 else v160$1);
    v160$2 := (if p4$2 then $$a.i1.i.i$0bv32$2 else v160$2);
    v161$1 := (if p4$1 then $$a.i1.i.i$1bv32$1 else v161$1);
    v161$2 := (if p4$2 then $$a.i1.i.i$1bv32$2 else v161$2);
    v162$1 := (if p4$1 then $$a.i1.i.i$2bv32$1 else v162$1);
    v162$2 := (if p4$2 then $$a.i1.i.i$2bv32$2 else v162$2);
    $$45$0bv32$1 := (if p4$1 then v160$1 else $$45$0bv32$1);
    $$45$0bv32$2 := (if p4$2 then v160$2 else $$45$0bv32$2);
    $$45$1bv32$1 := (if p4$1 then v161$1 else $$45$1bv32$1);
    $$45$1bv32$2 := (if p4$2 then v161$2 else $$45$1bv32$2);
    $$45$2bv32$1 := (if p4$1 then v162$1 else $$45$2bv32$1);
    $$45$2bv32$2 := (if p4$2 then v162$2 else $$45$2bv32$2);
    v163$1 := (if p4$1 then $$45$0bv32$1 else v163$1);
    v163$2 := (if p4$2 then $$45$0bv32$2 else v163$2);
    v164$1 := (if p4$1 then $$45$1bv32$1 else v164$1);
    v164$2 := (if p4$2 then $$45$1bv32$2 else v164$2);
    v165$1 := (if p4$1 then $$45$2bv32$1 else v165$1);
    v165$2 := (if p4$2 then $$45$2bv32$2 else v165$2);
    $$46$0bv32$1 := (if p4$1 then v163$1 else $$46$0bv32$1);
    $$46$0bv32$2 := (if p4$2 then v163$2 else $$46$0bv32$2);
    $$46$1bv32$1 := (if p4$1 then v164$1 else $$46$1bv32$1);
    $$46$1bv32$2 := (if p4$2 then v164$2 else $$46$1bv32$2);
    $$46$2bv32$1 := (if p4$1 then v165$1 else $$46$2bv32$1);
    $$46$2bv32$2 := (if p4$2 then v165$2 else $$46$2bv32$2);
    v166$1 := (if p4$1 then $$46$0bv32$1 else v166$1);
    v166$2 := (if p4$2 then $$46$0bv32$2 else v166$2);
    v167$1 := (if p4$1 then $$46$1bv32$1 else v167$1);
    v167$2 := (if p4$2 then $$46$1bv32$2 else v167$2);
    v168$1 := (if p4$1 then $$46$2bv32$1 else v168$1);
    v168$2 := (if p4$2 then $$46$2bv32$2 else v168$2);
    $$57$0bv32$1 := (if p4$1 then v166$1 else $$57$0bv32$1);
    $$57$0bv32$2 := (if p4$2 then v166$2 else $$57$0bv32$2);
    $$57$1bv32$1 := (if p4$1 then v167$1 else $$57$1bv32$1);
    $$57$1bv32$2 := (if p4$2 then v167$2 else $$57$1bv32$2);
    $$57$2bv32$1 := (if p4$1 then v168$1 else $$57$2bv32$1);
    $$57$2bv32$2 := (if p4$2 then v168$2 else $$57$2bv32$2);
    v169$1 := (if p4$1 then $$56$0bv32$1 else v169$1);
    v169$2 := (if p4$2 then $$56$0bv32$2 else v169$2);
    v170$1 := (if p4$1 then $$56$1bv32$1 else v170$1);
    v170$2 := (if p4$2 then $$56$1bv32$2 else v170$2);
    v171$1 := (if p4$1 then $$56$2bv32$1 else v171$1);
    v171$2 := (if p4$2 then $$56$2bv32$2 else v171$2);
    v172$1 := (if p4$1 then $$57$0bv32$1 else v172$1);
    v172$2 := (if p4$2 then $$57$0bv32$2 else v172$2);
    v173$1 := (if p4$1 then $$57$1bv32$1 else v173$1);
    v173$2 := (if p4$2 then $$57$1bv32$2 else v173$2);
    v174$1 := (if p4$1 then $$57$2bv32$1 else v174$1);
    v174$2 := (if p4$2 then $$57$2bv32$2 else v174$2);
    call {:sourceloc_num 318} v175$1, v175$2 := $_Z3dot6float3S_(p4$1, v169$1, v170$1, v171$1, v172$1, v173$1, v174$1, p4$2, v169$2, v170$2, v171$2, v172$2, v173$2, v174$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float3S_"} true;
    $$49$2bv32$1 := (if p4$1 then v175$1 else $$49$2bv32$1);
    $$49$2bv32$2 := (if p4$2 then v175$2 else $$49$2bv32$2);
    v176$1 := (if p4$1 then $$49$0bv32$1 else v176$1);
    v176$2 := (if p4$2 then $$49$0bv32$2 else v176$2);
    v177$1 := (if p4$1 then $$49$1bv32$1 else v177$1);
    v177$2 := (if p4$2 then $$49$1bv32$2 else v177$2);
    v178$1 := (if p4$1 then $$49$2bv32$1 else v178$1);
    v178$2 := (if p4$2 then $$49$2bv32$2 else v178$2);
    $$77$0bv32$1 := (if p4$1 then v176$1 else $$77$0bv32$1);
    $$77$0bv32$2 := (if p4$2 then v176$2 else $$77$0bv32$2);
    $$77$1bv32$1 := (if p4$1 then v177$1 else $$77$1bv32$1);
    $$77$1bv32$2 := (if p4$2 then v177$2 else $$77$1bv32$2);
    $$77$2bv32$1 := (if p4$1 then v178$1 else $$77$2bv32$1);
    $$77$2bv32$2 := (if p4$2 then v178$2 else $$77$2bv32$2);
    v179$1 := (if p4$1 then $$77$0bv32$1 else v179$1);
    v179$2 := (if p4$2 then $$77$0bv32$2 else v179$2);
    $$eyeRay.i$3bv32$1 := (if p4$1 then v179$1 else $$eyeRay.i$3bv32$1);
    $$eyeRay.i$3bv32$2 := (if p4$2 then v179$2 else $$eyeRay.i$3bv32$2);
    v180$1 := (if p4$1 then $$77$1bv32$1 else v180$1);
    v180$2 := (if p4$2 then $$77$1bv32$2 else v180$2);
    $$eyeRay.i$4bv32$1 := (if p4$1 then v180$1 else $$eyeRay.i$4bv32$1);
    $$eyeRay.i$4bv32$2 := (if p4$2 then v180$2 else $$eyeRay.i$4bv32$2);
    v181$1 := (if p4$1 then $$77$2bv32$1 else v181$1);
    v181$2 := (if p4$2 then $$77$2bv32$2 else v181$2);
    $$eyeRay.i$5bv32$1 := (if p4$1 then v181$1 else $$eyeRay.i$5bv32$1);
    $$eyeRay.i$5bv32$2 := (if p4$2 then v181$2 else $$eyeRay.i$5bv32$2);
    v182$1 := (if p4$1 then $$eyeRay.i$0bv32$1 else v182$1);
    v182$2 := (if p4$2 then $$eyeRay.i$0bv32$2 else v182$2);
    $$78$0bv32$1 := (if p4$1 then v182$1 else $$78$0bv32$1);
    $$78$0bv32$2 := (if p4$2 then v182$2 else $$78$0bv32$2);
    v183$1 := (if p4$1 then $$eyeRay.i$1bv32$1 else v183$1);
    v183$2 := (if p4$2 then $$eyeRay.i$1bv32$2 else v183$2);
    $$78$1bv32$1 := (if p4$1 then v183$1 else $$78$1bv32$1);
    $$78$1bv32$2 := (if p4$2 then v183$2 else $$78$1bv32$2);
    v184$1 := (if p4$1 then $$eyeRay.i$2bv32$1 else v184$1);
    v184$2 := (if p4$2 then $$eyeRay.i$2bv32$2 else v184$2);
    $$78$2bv32$1 := (if p4$1 then v184$1 else $$78$2bv32$1);
    $$78$2bv32$2 := (if p4$2 then v184$2 else $$78$2bv32$2);
    v185$1 := (if p4$1 then $$eyeRay.i$3bv32$1 else v185$1);
    v185$2 := (if p4$2 then $$eyeRay.i$3bv32$2 else v185$2);
    $$78$3bv32$1 := (if p4$1 then v185$1 else $$78$3bv32$1);
    $$78$3bv32$2 := (if p4$2 then v185$2 else $$78$3bv32$2);
    v186$1 := (if p4$1 then $$eyeRay.i$4bv32$1 else v186$1);
    v186$2 := (if p4$2 then $$eyeRay.i$4bv32$2 else v186$2);
    $$78$4bv32$1 := (if p4$1 then v186$1 else $$78$4bv32$1);
    $$78$4bv32$2 := (if p4$2 then v186$2 else $$78$4bv32$2);
    v187$1 := (if p4$1 then $$eyeRay.i$5bv32$1 else v187$1);
    v187$2 := (if p4$2 then $$eyeRay.i$5bv32$2 else v187$2);
    $$78$5bv32$1 := (if p4$1 then v187$1 else $$78$5bv32$1);
    $$78$5bv32$2 := (if p4$2 then v187$2 else $$78$5bv32$2);
    v188$1 := (if p4$1 then $$boxMin.i$0bv32$1 else v188$1);
    v188$2 := (if p4$2 then $$boxMin.i$0bv32$2 else v188$2);
    $$79$0bv32$1 := (if p4$1 then v188$1 else $$79$0bv32$1);
    $$79$0bv32$2 := (if p4$2 then v188$2 else $$79$0bv32$2);
    v189$1 := (if p4$1 then $$boxMin.i$1bv32$1 else v189$1);
    v189$2 := (if p4$2 then $$boxMin.i$1bv32$2 else v189$2);
    $$79$1bv32$1 := (if p4$1 then v189$1 else $$79$1bv32$1);
    $$79$1bv32$2 := (if p4$2 then v189$2 else $$79$1bv32$2);
    v190$1 := (if p4$1 then $$boxMin.i$2bv32$1 else v190$1);
    v190$2 := (if p4$2 then $$boxMin.i$2bv32$2 else v190$2);
    $$79$2bv32$1 := (if p4$1 then v190$1 else $$79$2bv32$1);
    $$79$2bv32$2 := (if p4$2 then v190$2 else $$79$2bv32$2);
    v191$1 := (if p4$1 then $$boxMax.i$0bv32$1 else v191$1);
    v191$2 := (if p4$2 then $$boxMax.i$0bv32$2 else v191$2);
    $$80$0bv32$1 := (if p4$1 then v191$1 else $$80$0bv32$1);
    $$80$0bv32$2 := (if p4$2 then v191$2 else $$80$0bv32$2);
    v192$1 := (if p4$1 then $$boxMax.i$1bv32$1 else v192$1);
    v192$2 := (if p4$2 then $$boxMax.i$1bv32$2 else v192$2);
    $$80$1bv32$1 := (if p4$1 then v192$1 else $$80$1bv32$1);
    $$80$1bv32$2 := (if p4$2 then v192$2 else $$80$1bv32$2);
    v193$1 := (if p4$1 then $$boxMax.i$2bv32$1 else v193$1);
    v193$2 := (if p4$2 then $$boxMax.i$2bv32$2 else v193$2);
    $$80$2bv32$1 := (if p4$1 then v193$1 else $$80$2bv32$1);
    $$80$2bv32$2 := (if p4$2 then v193$2 else $$80$2bv32$2);
    v194$1 := (if p4$1 then $$78$0bv32$1 else v194$1);
    v194$2 := (if p4$2 then $$78$0bv32$2 else v194$2);
    v195$1 := (if p4$1 then $$78$1bv32$1 else v195$1);
    v195$2 := (if p4$2 then $$78$1bv32$2 else v195$2);
    v196$1 := (if p4$1 then $$78$2bv32$1 else v196$1);
    v196$2 := (if p4$2 then $$78$2bv32$2 else v196$2);
    v197$1 := (if p4$1 then $$78$3bv32$1 else v197$1);
    v197$2 := (if p4$2 then $$78$3bv32$2 else v197$2);
    v198$1 := (if p4$1 then $$78$4bv32$1 else v198$1);
    v198$2 := (if p4$2 then $$78$4bv32$2 else v198$2);
    v199$1 := (if p4$1 then $$78$5bv32$1 else v199$1);
    v199$2 := (if p4$2 then $$78$5bv32$2 else v199$2);
    v200$1 := (if p4$1 then $$79$0bv32$1 else v200$1);
    v200$2 := (if p4$2 then $$79$0bv32$2 else v200$2);
    v201$1 := (if p4$1 then $$79$1bv32$1 else v201$1);
    v201$2 := (if p4$2 then $$79$1bv32$2 else v201$2);
    v202$1 := (if p4$1 then $$79$2bv32$1 else v202$1);
    v202$2 := (if p4$2 then $$79$2bv32$2 else v202$2);
    v203$1 := (if p4$1 then $$80$0bv32$1 else v203$1);
    v203$2 := (if p4$2 then $$80$0bv32$2 else v203$2);
    v204$1 := (if p4$1 then $$80$1bv32$1 else v204$1);
    v204$2 := (if p4$2 then $$80$1bv32$2 else v204$2);
    v205$1 := (if p4$1 then $$80$2bv32$1 else v205$1);
    v205$2 := (if p4$2 then $$80$2bv32$2 else v205$2);
    $$r.i.i$0bv32$1 := (if p4$1 then v194$1 else $$r.i.i$0bv32$1);
    $$r.i.i$0bv32$2 := (if p4$2 then v194$2 else $$r.i.i$0bv32$2);
    $$r.i.i$1bv32$1 := (if p4$1 then v195$1 else $$r.i.i$1bv32$1);
    $$r.i.i$1bv32$2 := (if p4$2 then v195$2 else $$r.i.i$1bv32$2);
    $$r.i.i$2bv32$1 := (if p4$1 then v196$1 else $$r.i.i$2bv32$1);
    $$r.i.i$2bv32$2 := (if p4$2 then v196$2 else $$r.i.i$2bv32$2);
    $$r.i.i$3bv32$1 := (if p4$1 then v197$1 else $$r.i.i$3bv32$1);
    $$r.i.i$3bv32$2 := (if p4$2 then v197$2 else $$r.i.i$3bv32$2);
    $$r.i.i$4bv32$1 := (if p4$1 then v198$1 else $$r.i.i$4bv32$1);
    $$r.i.i$4bv32$2 := (if p4$2 then v198$2 else $$r.i.i$4bv32$2);
    $$r.i.i$5bv32$1 := (if p4$1 then v199$1 else $$r.i.i$5bv32$1);
    $$r.i.i$5bv32$2 := (if p4$2 then v199$2 else $$r.i.i$5bv32$2);
    $$boxmin.i.i$0bv32$1 := (if p4$1 then v200$1 else $$boxmin.i.i$0bv32$1);
    $$boxmin.i.i$0bv32$2 := (if p4$2 then v200$2 else $$boxmin.i.i$0bv32$2);
    $$boxmin.i.i$1bv32$1 := (if p4$1 then v201$1 else $$boxmin.i.i$1bv32$1);
    $$boxmin.i.i$1bv32$2 := (if p4$2 then v201$2 else $$boxmin.i.i$1bv32$2);
    $$boxmin.i.i$2bv32$1 := (if p4$1 then v202$1 else $$boxmin.i.i$2bv32$1);
    $$boxmin.i.i$2bv32$2 := (if p4$2 then v202$2 else $$boxmin.i.i$2bv32$2);
    $$boxmax.i.i$0bv32$1 := (if p4$1 then v203$1 else $$boxmax.i.i$0bv32$1);
    $$boxmax.i.i$0bv32$2 := (if p4$2 then v203$2 else $$boxmax.i.i$0bv32$2);
    $$boxmax.i.i$1bv32$1 := (if p4$1 then v204$1 else $$boxmax.i.i$1bv32$1);
    $$boxmax.i.i$1bv32$2 := (if p4$2 then v204$2 else $$boxmax.i.i$1bv32$2);
    $$boxmax.i.i$2bv32$1 := (if p4$1 then v205$1 else $$boxmax.i.i$2bv32$1);
    $$boxmax.i.i$2bv32$2 := (if p4$2 then v205$2 else $$boxmax.i.i$2bv32$2);
    $$27$0bv32$1 := (if p4$1 then 1065353216bv32 else $$27$0bv32$1);
    $$27$0bv32$2 := (if p4$2 then 1065353216bv32 else $$27$0bv32$2);
    $$27$1bv32$1 := (if p4$1 then 1065353216bv32 else $$27$1bv32$1);
    $$27$1bv32$2 := (if p4$2 then 1065353216bv32 else $$27$1bv32$2);
    $$27$2bv32$1 := (if p4$1 then 1065353216bv32 else $$27$2bv32$1);
    $$27$2bv32$2 := (if p4$2 then 1065353216bv32 else $$27$2bv32$2);
    v206$1 := (if p4$1 then $$27$0bv32$1 else v206$1);
    v206$2 := (if p4$2 then $$27$0bv32$2 else v206$2);
    v207$1 := (if p4$1 then $$27$1bv32$1 else v207$1);
    v207$2 := (if p4$2 then $$27$1bv32$2 else v207$2);
    v208$1 := (if p4$1 then $$27$2bv32$1 else v208$1);
    v208$2 := (if p4$2 then $$27$2bv32$2 else v208$2);
    $$28$0bv32$1 := (if p4$1 then v206$1 else $$28$0bv32$1);
    $$28$0bv32$2 := (if p4$2 then v206$2 else $$28$0bv32$2);
    $$28$1bv32$1 := (if p4$1 then v207$1 else $$28$1bv32$1);
    $$28$1bv32$2 := (if p4$2 then v207$2 else $$28$1bv32$2);
    $$28$2bv32$1 := (if p4$1 then v208$1 else $$28$2bv32$1);
    $$28$2bv32$2 := (if p4$2 then v208$2 else $$28$2bv32$2);
    v209$1 := (if p4$1 then $$28$0bv32$1 else v209$1);
    v209$2 := (if p4$2 then $$28$0bv32$2 else v209$2);
    v210$1 := (if p4$1 then $$28$1bv32$1 else v210$1);
    v210$2 := (if p4$2 then $$28$1bv32$2 else v210$2);
    v211$1 := (if p4$1 then $$28$2bv32$1 else v211$1);
    v211$2 := (if p4$2 then $$28$2bv32$2 else v211$2);
    $$29$0bv32$1 := (if p4$1 then v209$1 else $$29$0bv32$1);
    $$29$0bv32$2 := (if p4$2 then v209$2 else $$29$0bv32$2);
    $$29$1bv32$1 := (if p4$1 then v210$1 else $$29$1bv32$1);
    $$29$1bv32$2 := (if p4$2 then v210$2 else $$29$1bv32$2);
    $$29$2bv32$1 := (if p4$1 then v211$1 else $$29$2bv32$1);
    $$29$2bv32$2 := (if p4$2 then v211$2 else $$29$2bv32$2);
    v212$1 := (if p4$1 then $$r.i.i$3bv32$1 else v212$1);
    v212$2 := (if p4$2 then $$r.i.i$3bv32$2 else v212$2);
    $$30$0bv32$1 := (if p4$1 then v212$1 else $$30$0bv32$1);
    $$30$0bv32$2 := (if p4$2 then v212$2 else $$30$0bv32$2);
    v213$1 := (if p4$1 then $$r.i.i$4bv32$1 else v213$1);
    v213$2 := (if p4$2 then $$r.i.i$4bv32$2 else v213$2);
    $$30$1bv32$1 := (if p4$1 then v213$1 else $$30$1bv32$1);
    $$30$1bv32$2 := (if p4$2 then v213$2 else $$30$1bv32$2);
    v214$1 := (if p4$1 then $$r.i.i$5bv32$1 else v214$1);
    v214$2 := (if p4$2 then $$r.i.i$5bv32$2 else v214$2);
    $$30$2bv32$1 := (if p4$1 then v214$1 else $$30$2bv32$1);
    $$30$2bv32$2 := (if p4$2 then v214$2 else $$30$2bv32$2);
    v215$1 := (if p4$1 then $$29$0bv32$1 else v215$1);
    v215$2 := (if p4$2 then $$29$0bv32$2 else v215$2);
    v216$1 := (if p4$1 then $$29$1bv32$1 else v216$1);
    v216$2 := (if p4$2 then $$29$1bv32$2 else v216$2);
    v217$1 := (if p4$1 then $$29$2bv32$1 else v217$1);
    v217$2 := (if p4$2 then $$29$2bv32$2 else v217$2);
    v218$1 := (if p4$1 then $$30$0bv32$1 else v218$1);
    v218$2 := (if p4$2 then $$30$0bv32$2 else v218$2);
    v219$1 := (if p4$1 then $$30$1bv32$1 else v219$1);
    v219$2 := (if p4$2 then $$30$1bv32$2 else v219$2);
    v220$1 := (if p4$1 then $$30$2bv32$1 else v220$1);
    v220$2 := (if p4$2 then $$30$2bv32$2 else v220$2);
    $$a.i7.i.i$0bv32$1 := (if p4$1 then v215$1 else $$a.i7.i.i$0bv32$1);
    $$a.i7.i.i$0bv32$2 := (if p4$2 then v215$2 else $$a.i7.i.i$0bv32$2);
    $$a.i7.i.i$1bv32$1 := (if p4$1 then v216$1 else $$a.i7.i.i$1bv32$1);
    $$a.i7.i.i$1bv32$2 := (if p4$2 then v216$2 else $$a.i7.i.i$1bv32$2);
    $$a.i7.i.i$2bv32$1 := (if p4$1 then v217$1 else $$a.i7.i.i$2bv32$1);
    $$a.i7.i.i$2bv32$2 := (if p4$2 then v217$2 else $$a.i7.i.i$2bv32$2);
    $$b.i8.i.i$0bv32$1 := (if p4$1 then v218$1 else $$b.i8.i.i$0bv32$1);
    $$b.i8.i.i$0bv32$2 := (if p4$2 then v218$2 else $$b.i8.i.i$0bv32$2);
    $$b.i8.i.i$1bv32$1 := (if p4$1 then v219$1 else $$b.i8.i.i$1bv32$1);
    $$b.i8.i.i$1bv32$2 := (if p4$2 then v219$2 else $$b.i8.i.i$1bv32$2);
    $$b.i8.i.i$2bv32$1 := (if p4$1 then v220$1 else $$b.i8.i.i$2bv32$1);
    $$b.i8.i.i$2bv32$2 := (if p4$2 then v220$2 else $$b.i8.i.i$2bv32$2);
    v221$1 := (if p4$1 then $$a.i7.i.i$0bv32$1 else v221$1);
    v221$2 := (if p4$2 then $$a.i7.i.i$0bv32$2 else v221$2);
    v222$1 := (if p4$1 then $$b.i8.i.i$0bv32$1 else v222$1);
    v222$2 := (if p4$2 then $$b.i8.i.i$0bv32$2 else v222$2);
    v223$1 := (if p4$1 then $$a.i7.i.i$1bv32$1 else v223$1);
    v223$2 := (if p4$2 then $$a.i7.i.i$1bv32$2 else v223$2);
    v224$1 := (if p4$1 then $$b.i8.i.i$1bv32$1 else v224$1);
    v224$2 := (if p4$2 then $$b.i8.i.i$1bv32$2 else v224$2);
    v225$1 := (if p4$1 then $$a.i7.i.i$2bv32$1 else v225$1);
    v225$2 := (if p4$2 then $$a.i7.i.i$2bv32$2 else v225$2);
    v226$1 := (if p4$1 then $$b.i8.i.i$2bv32$1 else v226$1);
    v226$2 := (if p4$2 then $$b.i8.i.i$2bv32$2 else v226$2);
    $$17$0bv32$1 := (if p4$1 then FDIV32(v221$1, v222$1) else $$17$0bv32$1);
    $$17$0bv32$2 := (if p4$2 then FDIV32(v221$2, v222$2) else $$17$0bv32$2);
    $$17$1bv32$1 := (if p4$1 then FDIV32(v223$1, v224$1) else $$17$1bv32$1);
    $$17$1bv32$2 := (if p4$2 then FDIV32(v223$2, v224$2) else $$17$1bv32$2);
    $$17$2bv32$1 := (if p4$1 then FDIV32(v225$1, v226$1) else $$17$2bv32$1);
    $$17$2bv32$2 := (if p4$2 then FDIV32(v225$2, v226$2) else $$17$2bv32$2);
    v227$1 := (if p4$1 then $$17$0bv32$1 else v227$1);
    v227$2 := (if p4$2 then $$17$0bv32$2 else v227$2);
    v228$1 := (if p4$1 then $$17$1bv32$1 else v228$1);
    v228$2 := (if p4$2 then $$17$1bv32$2 else v228$2);
    v229$1 := (if p4$1 then $$17$2bv32$1 else v229$1);
    v229$2 := (if p4$2 then $$17$2bv32$2 else v229$2);
    $$18$0bv32$1 := (if p4$1 then v227$1 else $$18$0bv32$1);
    $$18$0bv32$2 := (if p4$2 then v227$2 else $$18$0bv32$2);
    $$18$1bv32$1 := (if p4$1 then v228$1 else $$18$1bv32$1);
    $$18$1bv32$2 := (if p4$2 then v228$2 else $$18$1bv32$2);
    $$18$2bv32$1 := (if p4$1 then v229$1 else $$18$2bv32$1);
    $$18$2bv32$2 := (if p4$2 then v229$2 else $$18$2bv32$2);
    v230$1 := (if p4$1 then $$18$0bv32$1 else v230$1);
    v230$2 := (if p4$2 then $$18$0bv32$2 else v230$2);
    v231$1 := (if p4$1 then $$18$1bv32$1 else v231$1);
    v231$2 := (if p4$2 then $$18$1bv32$2 else v231$2);
    v232$1 := (if p4$1 then $$18$2bv32$1 else v232$1);
    v232$2 := (if p4$2 then $$18$2bv32$2 else v232$2);
    $$invR.i.i$0bv32$1 := (if p4$1 then v230$1 else $$invR.i.i$0bv32$1);
    $$invR.i.i$0bv32$2 := (if p4$2 then v230$2 else $$invR.i.i$0bv32$2);
    $$invR.i.i$1bv32$1 := (if p4$1 then v231$1 else $$invR.i.i$1bv32$1);
    $$invR.i.i$1bv32$2 := (if p4$2 then v231$2 else $$invR.i.i$1bv32$2);
    $$invR.i.i$2bv32$1 := (if p4$1 then v232$1 else $$invR.i.i$2bv32$1);
    $$invR.i.i$2bv32$2 := (if p4$2 then v232$2 else $$invR.i.i$2bv32$2);
    v233$1 := (if p4$1 then $$invR.i.i$0bv32$1 else v233$1);
    v233$2 := (if p4$2 then $$invR.i.i$0bv32$2 else v233$2);
    $$31$0bv32$1 := (if p4$1 then v233$1 else $$31$0bv32$1);
    $$31$0bv32$2 := (if p4$2 then v233$2 else $$31$0bv32$2);
    v234$1 := (if p4$1 then $$invR.i.i$1bv32$1 else v234$1);
    v234$2 := (if p4$2 then $$invR.i.i$1bv32$2 else v234$2);
    $$31$1bv32$1 := (if p4$1 then v234$1 else $$31$1bv32$1);
    $$31$1bv32$2 := (if p4$2 then v234$2 else $$31$1bv32$2);
    v235$1 := (if p4$1 then $$invR.i.i$2bv32$1 else v235$1);
    v235$2 := (if p4$2 then $$invR.i.i$2bv32$2 else v235$2);
    $$31$2bv32$1 := (if p4$1 then v235$1 else $$31$2bv32$1);
    $$31$2bv32$2 := (if p4$2 then v235$2 else $$31$2bv32$2);
    v236$1 := (if p4$1 then $$boxmin.i.i$0bv32$1 else v236$1);
    v236$2 := (if p4$2 then $$boxmin.i.i$0bv32$2 else v236$2);
    $$33$0bv32$1 := (if p4$1 then v236$1 else $$33$0bv32$1);
    $$33$0bv32$2 := (if p4$2 then v236$2 else $$33$0bv32$2);
    v237$1 := (if p4$1 then $$boxmin.i.i$1bv32$1 else v237$1);
    v237$2 := (if p4$2 then $$boxmin.i.i$1bv32$2 else v237$2);
    $$33$1bv32$1 := (if p4$1 then v237$1 else $$33$1bv32$1);
    $$33$1bv32$2 := (if p4$2 then v237$2 else $$33$1bv32$2);
    v238$1 := (if p4$1 then $$boxmin.i.i$2bv32$1 else v238$1);
    v238$2 := (if p4$2 then $$boxmin.i.i$2bv32$2 else v238$2);
    $$33$2bv32$1 := (if p4$1 then v238$1 else $$33$2bv32$1);
    $$33$2bv32$2 := (if p4$2 then v238$2 else $$33$2bv32$2);
    v239$1 := (if p4$1 then $$r.i.i$0bv32$1 else v239$1);
    v239$2 := (if p4$2 then $$r.i.i$0bv32$2 else v239$2);
    $$34$0bv32$1 := (if p4$1 then v239$1 else $$34$0bv32$1);
    $$34$0bv32$2 := (if p4$2 then v239$2 else $$34$0bv32$2);
    v240$1 := (if p4$1 then $$r.i.i$1bv32$1 else v240$1);
    v240$2 := (if p4$2 then $$r.i.i$1bv32$2 else v240$2);
    $$34$1bv32$1 := (if p4$1 then v240$1 else $$34$1bv32$1);
    $$34$1bv32$2 := (if p4$2 then v240$2 else $$34$1bv32$2);
    v241$1 := (if p4$1 then $$r.i.i$2bv32$1 else v241$1);
    v241$2 := (if p4$2 then $$r.i.i$2bv32$2 else v241$2);
    $$34$2bv32$1 := (if p4$1 then v241$1 else $$34$2bv32$1);
    $$34$2bv32$2 := (if p4$2 then v241$2 else $$34$2bv32$2);
    v242$1 := (if p4$1 then $$33$0bv32$1 else v242$1);
    v242$2 := (if p4$2 then $$33$0bv32$2 else v242$2);
    v243$1 := (if p4$1 then $$33$1bv32$1 else v243$1);
    v243$2 := (if p4$2 then $$33$1bv32$2 else v243$2);
    v244$1 := (if p4$1 then $$33$2bv32$1 else v244$1);
    v244$2 := (if p4$2 then $$33$2bv32$2 else v244$2);
    v245$1 := (if p4$1 then $$34$0bv32$1 else v245$1);
    v245$2 := (if p4$2 then $$34$0bv32$2 else v245$2);
    v246$1 := (if p4$1 then $$34$1bv32$1 else v246$1);
    v246$2 := (if p4$2 then $$34$1bv32$2 else v246$2);
    v247$1 := (if p4$1 then $$34$2bv32$1 else v247$1);
    v247$2 := (if p4$2 then $$34$2bv32$2 else v247$2);
    $$a.i5.i.i$0bv32$1 := (if p4$1 then v242$1 else $$a.i5.i.i$0bv32$1);
    $$a.i5.i.i$0bv32$2 := (if p4$2 then v242$2 else $$a.i5.i.i$0bv32$2);
    $$a.i5.i.i$1bv32$1 := (if p4$1 then v243$1 else $$a.i5.i.i$1bv32$1);
    $$a.i5.i.i$1bv32$2 := (if p4$2 then v243$2 else $$a.i5.i.i$1bv32$2);
    $$a.i5.i.i$2bv32$1 := (if p4$1 then v244$1 else $$a.i5.i.i$2bv32$1);
    $$a.i5.i.i$2bv32$2 := (if p4$2 then v244$2 else $$a.i5.i.i$2bv32$2);
    $$b.i6.i.i$0bv32$1 := (if p4$1 then v245$1 else $$b.i6.i.i$0bv32$1);
    $$b.i6.i.i$0bv32$2 := (if p4$2 then v245$2 else $$b.i6.i.i$0bv32$2);
    $$b.i6.i.i$1bv32$1 := (if p4$1 then v246$1 else $$b.i6.i.i$1bv32$1);
    $$b.i6.i.i$1bv32$2 := (if p4$2 then v246$2 else $$b.i6.i.i$1bv32$2);
    $$b.i6.i.i$2bv32$1 := (if p4$1 then v247$1 else $$b.i6.i.i$2bv32$1);
    $$b.i6.i.i$2bv32$2 := (if p4$2 then v247$2 else $$b.i6.i.i$2bv32$2);
    v248$1 := (if p4$1 then $$a.i5.i.i$0bv32$1 else v248$1);
    v248$2 := (if p4$2 then $$a.i5.i.i$0bv32$2 else v248$2);
    v249$1 := (if p4$1 then $$b.i6.i.i$0bv32$1 else v249$1);
    v249$2 := (if p4$2 then $$b.i6.i.i$0bv32$2 else v249$2);
    v250$1 := (if p4$1 then $$a.i5.i.i$1bv32$1 else v250$1);
    v250$2 := (if p4$2 then $$a.i5.i.i$1bv32$2 else v250$2);
    v251$1 := (if p4$1 then $$b.i6.i.i$1bv32$1 else v251$1);
    v251$2 := (if p4$2 then $$b.i6.i.i$1bv32$2 else v251$2);
    v252$1 := (if p4$1 then $$a.i5.i.i$2bv32$1 else v252$1);
    v252$2 := (if p4$2 then $$a.i5.i.i$2bv32$2 else v252$2);
    v253$1 := (if p4$1 then $$b.i6.i.i$2bv32$1 else v253$1);
    v253$2 := (if p4$2 then $$b.i6.i.i$2bv32$2 else v253$2);
    $$19$0bv32$1 := (if p4$1 then FSUB32(v248$1, v249$1) else $$19$0bv32$1);
    $$19$0bv32$2 := (if p4$2 then FSUB32(v248$2, v249$2) else $$19$0bv32$2);
    $$19$1bv32$1 := (if p4$1 then FSUB32(v250$1, v251$1) else $$19$1bv32$1);
    $$19$1bv32$2 := (if p4$2 then FSUB32(v250$2, v251$2) else $$19$1bv32$2);
    $$19$2bv32$1 := (if p4$1 then FSUB32(v252$1, v253$1) else $$19$2bv32$1);
    $$19$2bv32$2 := (if p4$2 then FSUB32(v252$2, v253$2) else $$19$2bv32$2);
    v254$1 := (if p4$1 then $$19$0bv32$1 else v254$1);
    v254$2 := (if p4$2 then $$19$0bv32$2 else v254$2);
    v255$1 := (if p4$1 then $$19$1bv32$1 else v255$1);
    v255$2 := (if p4$2 then $$19$1bv32$2 else v255$2);
    v256$1 := (if p4$1 then $$19$2bv32$1 else v256$1);
    v256$2 := (if p4$2 then $$19$2bv32$2 else v256$2);
    $$20$0bv32$1 := (if p4$1 then v254$1 else $$20$0bv32$1);
    $$20$0bv32$2 := (if p4$2 then v254$2 else $$20$0bv32$2);
    $$20$1bv32$1 := (if p4$1 then v255$1 else $$20$1bv32$1);
    $$20$1bv32$2 := (if p4$2 then v255$2 else $$20$1bv32$2);
    $$20$2bv32$1 := (if p4$1 then v256$1 else $$20$2bv32$1);
    $$20$2bv32$2 := (if p4$2 then v256$2 else $$20$2bv32$2);
    v257$1 := (if p4$1 then $$20$0bv32$1 else v257$1);
    v257$2 := (if p4$2 then $$20$0bv32$2 else v257$2);
    v258$1 := (if p4$1 then $$20$1bv32$1 else v258$1);
    v258$2 := (if p4$2 then $$20$1bv32$2 else v258$2);
    v259$1 := (if p4$1 then $$20$2bv32$1 else v259$1);
    v259$2 := (if p4$2 then $$20$2bv32$2 else v259$2);
    $$32$0bv32$1 := (if p4$1 then v257$1 else $$32$0bv32$1);
    $$32$0bv32$2 := (if p4$2 then v257$2 else $$32$0bv32$2);
    $$32$1bv32$1 := (if p4$1 then v258$1 else $$32$1bv32$1);
    $$32$1bv32$2 := (if p4$2 then v258$2 else $$32$1bv32$2);
    $$32$2bv32$1 := (if p4$1 then v259$1 else $$32$2bv32$1);
    $$32$2bv32$2 := (if p4$2 then v259$2 else $$32$2bv32$2);
    v260$1 := (if p4$1 then $$31$0bv32$1 else v260$1);
    v260$2 := (if p4$2 then $$31$0bv32$2 else v260$2);
    v261$1 := (if p4$1 then $$31$1bv32$1 else v261$1);
    v261$2 := (if p4$2 then $$31$1bv32$2 else v261$2);
    v262$1 := (if p4$1 then $$31$2bv32$1 else v262$1);
    v262$2 := (if p4$2 then $$31$2bv32$2 else v262$2);
    v263$1 := (if p4$1 then $$32$0bv32$1 else v263$1);
    v263$2 := (if p4$2 then $$32$0bv32$2 else v263$2);
    v264$1 := (if p4$1 then $$32$1bv32$1 else v264$1);
    v264$2 := (if p4$2 then $$32$1bv32$2 else v264$2);
    v265$1 := (if p4$1 then $$32$2bv32$1 else v265$1);
    v265$2 := (if p4$2 then $$32$2bv32$2 else v265$2);
    $$a.i3.i.i$0bv32$1 := (if p4$1 then v260$1 else $$a.i3.i.i$0bv32$1);
    $$a.i3.i.i$0bv32$2 := (if p4$2 then v260$2 else $$a.i3.i.i$0bv32$2);
    $$a.i3.i.i$1bv32$1 := (if p4$1 then v261$1 else $$a.i3.i.i$1bv32$1);
    $$a.i3.i.i$1bv32$2 := (if p4$2 then v261$2 else $$a.i3.i.i$1bv32$2);
    $$a.i3.i.i$2bv32$1 := (if p4$1 then v262$1 else $$a.i3.i.i$2bv32$1);
    $$a.i3.i.i$2bv32$2 := (if p4$2 then v262$2 else $$a.i3.i.i$2bv32$2);
    $$b.i4.i.i$0bv32$1 := (if p4$1 then v263$1 else $$b.i4.i.i$0bv32$1);
    $$b.i4.i.i$0bv32$2 := (if p4$2 then v263$2 else $$b.i4.i.i$0bv32$2);
    $$b.i4.i.i$1bv32$1 := (if p4$1 then v264$1 else $$b.i4.i.i$1bv32$1);
    $$b.i4.i.i$1bv32$2 := (if p4$2 then v264$2 else $$b.i4.i.i$1bv32$2);
    $$b.i4.i.i$2bv32$1 := (if p4$1 then v265$1 else $$b.i4.i.i$2bv32$1);
    $$b.i4.i.i$2bv32$2 := (if p4$2 then v265$2 else $$b.i4.i.i$2bv32$2);
    v266$1 := (if p4$1 then $$a.i3.i.i$0bv32$1 else v266$1);
    v266$2 := (if p4$2 then $$a.i3.i.i$0bv32$2 else v266$2);
    v267$1 := (if p4$1 then $$b.i4.i.i$0bv32$1 else v267$1);
    v267$2 := (if p4$2 then $$b.i4.i.i$0bv32$2 else v267$2);
    v268$1 := (if p4$1 then $$a.i3.i.i$1bv32$1 else v268$1);
    v268$2 := (if p4$2 then $$a.i3.i.i$1bv32$2 else v268$2);
    v269$1 := (if p4$1 then $$b.i4.i.i$1bv32$1 else v269$1);
    v269$2 := (if p4$2 then $$b.i4.i.i$1bv32$2 else v269$2);
    v270$1 := (if p4$1 then $$a.i3.i.i$2bv32$1 else v270$1);
    v270$2 := (if p4$2 then $$a.i3.i.i$2bv32$2 else v270$2);
    v271$1 := (if p4$1 then $$b.i4.i.i$2bv32$1 else v271$1);
    v271$2 := (if p4$2 then $$b.i4.i.i$2bv32$2 else v271$2);
    $$21$0bv32$1 := (if p4$1 then FMUL32(v266$1, v267$1) else $$21$0bv32$1);
    $$21$0bv32$2 := (if p4$2 then FMUL32(v266$2, v267$2) else $$21$0bv32$2);
    $$21$1bv32$1 := (if p4$1 then FMUL32(v268$1, v269$1) else $$21$1bv32$1);
    $$21$1bv32$2 := (if p4$2 then FMUL32(v268$2, v269$2) else $$21$1bv32$2);
    $$21$2bv32$1 := (if p4$1 then FMUL32(v270$1, v271$1) else $$21$2bv32$1);
    $$21$2bv32$2 := (if p4$2 then FMUL32(v270$2, v271$2) else $$21$2bv32$2);
    v272$1 := (if p4$1 then $$21$0bv32$1 else v272$1);
    v272$2 := (if p4$2 then $$21$0bv32$2 else v272$2);
    v273$1 := (if p4$1 then $$21$1bv32$1 else v273$1);
    v273$2 := (if p4$2 then $$21$1bv32$2 else v273$2);
    v274$1 := (if p4$1 then $$21$2bv32$1 else v274$1);
    v274$2 := (if p4$2 then $$21$2bv32$2 else v274$2);
    $$22$0bv32$1 := (if p4$1 then v272$1 else $$22$0bv32$1);
    $$22$0bv32$2 := (if p4$2 then v272$2 else $$22$0bv32$2);
    $$22$1bv32$1 := (if p4$1 then v273$1 else $$22$1bv32$1);
    $$22$1bv32$2 := (if p4$2 then v273$2 else $$22$1bv32$2);
    $$22$2bv32$1 := (if p4$1 then v274$1 else $$22$2bv32$1);
    $$22$2bv32$2 := (if p4$2 then v274$2 else $$22$2bv32$2);
    v275$1 := (if p4$1 then $$22$0bv32$1 else v275$1);
    v275$2 := (if p4$2 then $$22$0bv32$2 else v275$2);
    v276$1 := (if p4$1 then $$22$1bv32$1 else v276$1);
    v276$2 := (if p4$2 then $$22$1bv32$2 else v276$2);
    v277$1 := (if p4$1 then $$22$2bv32$1 else v277$1);
    v277$2 := (if p4$2 then $$22$2bv32$2 else v277$2);
    $$tbot.i.i$0bv32$1 := (if p4$1 then v275$1 else $$tbot.i.i$0bv32$1);
    $$tbot.i.i$0bv32$2 := (if p4$2 then v275$2 else $$tbot.i.i$0bv32$2);
    $$tbot.i.i$1bv32$1 := (if p4$1 then v276$1 else $$tbot.i.i$1bv32$1);
    $$tbot.i.i$1bv32$2 := (if p4$2 then v276$2 else $$tbot.i.i$1bv32$2);
    $$tbot.i.i$2bv32$1 := (if p4$1 then v277$1 else $$tbot.i.i$2bv32$1);
    $$tbot.i.i$2bv32$2 := (if p4$2 then v277$2 else $$tbot.i.i$2bv32$2);
    v278$1 := (if p4$1 then $$invR.i.i$0bv32$1 else v278$1);
    v278$2 := (if p4$2 then $$invR.i.i$0bv32$2 else v278$2);
    $$35$0bv32$1 := (if p4$1 then v278$1 else $$35$0bv32$1);
    $$35$0bv32$2 := (if p4$2 then v278$2 else $$35$0bv32$2);
    v279$1 := (if p4$1 then $$invR.i.i$1bv32$1 else v279$1);
    v279$2 := (if p4$2 then $$invR.i.i$1bv32$2 else v279$2);
    $$35$1bv32$1 := (if p4$1 then v279$1 else $$35$1bv32$1);
    $$35$1bv32$2 := (if p4$2 then v279$2 else $$35$1bv32$2);
    v280$1 := (if p4$1 then $$invR.i.i$2bv32$1 else v280$1);
    v280$2 := (if p4$2 then $$invR.i.i$2bv32$2 else v280$2);
    $$35$2bv32$1 := (if p4$1 then v280$1 else $$35$2bv32$1);
    $$35$2bv32$2 := (if p4$2 then v280$2 else $$35$2bv32$2);
    v281$1 := (if p4$1 then $$boxmax.i.i$0bv32$1 else v281$1);
    v281$2 := (if p4$2 then $$boxmax.i.i$0bv32$2 else v281$2);
    $$37$0bv32$1 := (if p4$1 then v281$1 else $$37$0bv32$1);
    $$37$0bv32$2 := (if p4$2 then v281$2 else $$37$0bv32$2);
    v282$1 := (if p4$1 then $$boxmax.i.i$1bv32$1 else v282$1);
    v282$2 := (if p4$2 then $$boxmax.i.i$1bv32$2 else v282$2);
    $$37$1bv32$1 := (if p4$1 then v282$1 else $$37$1bv32$1);
    $$37$1bv32$2 := (if p4$2 then v282$2 else $$37$1bv32$2);
    v283$1 := (if p4$1 then $$boxmax.i.i$2bv32$1 else v283$1);
    v283$2 := (if p4$2 then $$boxmax.i.i$2bv32$2 else v283$2);
    $$37$2bv32$1 := (if p4$1 then v283$1 else $$37$2bv32$1);
    $$37$2bv32$2 := (if p4$2 then v283$2 else $$37$2bv32$2);
    v284$1 := (if p4$1 then $$r.i.i$0bv32$1 else v284$1);
    v284$2 := (if p4$2 then $$r.i.i$0bv32$2 else v284$2);
    $$38$0bv32$1 := (if p4$1 then v284$1 else $$38$0bv32$1);
    $$38$0bv32$2 := (if p4$2 then v284$2 else $$38$0bv32$2);
    v285$1 := (if p4$1 then $$r.i.i$1bv32$1 else v285$1);
    v285$2 := (if p4$2 then $$r.i.i$1bv32$2 else v285$2);
    $$38$1bv32$1 := (if p4$1 then v285$1 else $$38$1bv32$1);
    $$38$1bv32$2 := (if p4$2 then v285$2 else $$38$1bv32$2);
    v286$1 := (if p4$1 then $$r.i.i$2bv32$1 else v286$1);
    v286$2 := (if p4$2 then $$r.i.i$2bv32$2 else v286$2);
    $$38$2bv32$1 := (if p4$1 then v286$1 else $$38$2bv32$1);
    $$38$2bv32$2 := (if p4$2 then v286$2 else $$38$2bv32$2);
    v287$1 := (if p4$1 then $$37$0bv32$1 else v287$1);
    v287$2 := (if p4$2 then $$37$0bv32$2 else v287$2);
    v288$1 := (if p4$1 then $$37$1bv32$1 else v288$1);
    v288$2 := (if p4$2 then $$37$1bv32$2 else v288$2);
    v289$1 := (if p4$1 then $$37$2bv32$1 else v289$1);
    v289$2 := (if p4$2 then $$37$2bv32$2 else v289$2);
    v290$1 := (if p4$1 then $$38$0bv32$1 else v290$1);
    v290$2 := (if p4$2 then $$38$0bv32$2 else v290$2);
    v291$1 := (if p4$1 then $$38$1bv32$1 else v291$1);
    v291$2 := (if p4$2 then $$38$1bv32$2 else v291$2);
    v292$1 := (if p4$1 then $$38$2bv32$1 else v292$1);
    v292$2 := (if p4$2 then $$38$2bv32$2 else v292$2);
    $$a.i1.i1.i$0bv32$1 := (if p4$1 then v287$1 else $$a.i1.i1.i$0bv32$1);
    $$a.i1.i1.i$0bv32$2 := (if p4$2 then v287$2 else $$a.i1.i1.i$0bv32$2);
    $$a.i1.i1.i$1bv32$1 := (if p4$1 then v288$1 else $$a.i1.i1.i$1bv32$1);
    $$a.i1.i1.i$1bv32$2 := (if p4$2 then v288$2 else $$a.i1.i1.i$1bv32$2);
    $$a.i1.i1.i$2bv32$1 := (if p4$1 then v289$1 else $$a.i1.i1.i$2bv32$1);
    $$a.i1.i1.i$2bv32$2 := (if p4$2 then v289$2 else $$a.i1.i1.i$2bv32$2);
    $$b.i2.i.i$0bv32$1 := (if p4$1 then v290$1 else $$b.i2.i.i$0bv32$1);
    $$b.i2.i.i$0bv32$2 := (if p4$2 then v290$2 else $$b.i2.i.i$0bv32$2);
    $$b.i2.i.i$1bv32$1 := (if p4$1 then v291$1 else $$b.i2.i.i$1bv32$1);
    $$b.i2.i.i$1bv32$2 := (if p4$2 then v291$2 else $$b.i2.i.i$1bv32$2);
    $$b.i2.i.i$2bv32$1 := (if p4$1 then v292$1 else $$b.i2.i.i$2bv32$1);
    $$b.i2.i.i$2bv32$2 := (if p4$2 then v292$2 else $$b.i2.i.i$2bv32$2);
    v293$1 := (if p4$1 then $$a.i1.i1.i$0bv32$1 else v293$1);
    v293$2 := (if p4$2 then $$a.i1.i1.i$0bv32$2 else v293$2);
    v294$1 := (if p4$1 then $$b.i2.i.i$0bv32$1 else v294$1);
    v294$2 := (if p4$2 then $$b.i2.i.i$0bv32$2 else v294$2);
    v295$1 := (if p4$1 then $$a.i1.i1.i$1bv32$1 else v295$1);
    v295$2 := (if p4$2 then $$a.i1.i1.i$1bv32$2 else v295$2);
    v296$1 := (if p4$1 then $$b.i2.i.i$1bv32$1 else v296$1);
    v296$2 := (if p4$2 then $$b.i2.i.i$1bv32$2 else v296$2);
    v297$1 := (if p4$1 then $$a.i1.i1.i$2bv32$1 else v297$1);
    v297$2 := (if p4$2 then $$a.i1.i1.i$2bv32$2 else v297$2);
    v298$1 := (if p4$1 then $$b.i2.i.i$2bv32$1 else v298$1);
    v298$2 := (if p4$2 then $$b.i2.i.i$2bv32$2 else v298$2);
    $$23$0bv32$1 := (if p4$1 then FSUB32(v293$1, v294$1) else $$23$0bv32$1);
    $$23$0bv32$2 := (if p4$2 then FSUB32(v293$2, v294$2) else $$23$0bv32$2);
    $$23$1bv32$1 := (if p4$1 then FSUB32(v295$1, v296$1) else $$23$1bv32$1);
    $$23$1bv32$2 := (if p4$2 then FSUB32(v295$2, v296$2) else $$23$1bv32$2);
    $$23$2bv32$1 := (if p4$1 then FSUB32(v297$1, v298$1) else $$23$2bv32$1);
    $$23$2bv32$2 := (if p4$2 then FSUB32(v297$2, v298$2) else $$23$2bv32$2);
    v299$1 := (if p4$1 then $$23$0bv32$1 else v299$1);
    v299$2 := (if p4$2 then $$23$0bv32$2 else v299$2);
    v300$1 := (if p4$1 then $$23$1bv32$1 else v300$1);
    v300$2 := (if p4$2 then $$23$1bv32$2 else v300$2);
    v301$1 := (if p4$1 then $$23$2bv32$1 else v301$1);
    v301$2 := (if p4$2 then $$23$2bv32$2 else v301$2);
    $$24$0bv32$1 := (if p4$1 then v299$1 else $$24$0bv32$1);
    $$24$0bv32$2 := (if p4$2 then v299$2 else $$24$0bv32$2);
    $$24$1bv32$1 := (if p4$1 then v300$1 else $$24$1bv32$1);
    $$24$1bv32$2 := (if p4$2 then v300$2 else $$24$1bv32$2);
    $$24$2bv32$1 := (if p4$1 then v301$1 else $$24$2bv32$1);
    $$24$2bv32$2 := (if p4$2 then v301$2 else $$24$2bv32$2);
    v302$1 := (if p4$1 then $$24$0bv32$1 else v302$1);
    v302$2 := (if p4$2 then $$24$0bv32$2 else v302$2);
    v303$1 := (if p4$1 then $$24$1bv32$1 else v303$1);
    v303$2 := (if p4$2 then $$24$1bv32$2 else v303$2);
    v304$1 := (if p4$1 then $$24$2bv32$1 else v304$1);
    v304$2 := (if p4$2 then $$24$2bv32$2 else v304$2);
    $$36$0bv32$1 := (if p4$1 then v302$1 else $$36$0bv32$1);
    $$36$0bv32$2 := (if p4$2 then v302$2 else $$36$0bv32$2);
    $$36$1bv32$1 := (if p4$1 then v303$1 else $$36$1bv32$1);
    $$36$1bv32$2 := (if p4$2 then v303$2 else $$36$1bv32$2);
    $$36$2bv32$1 := (if p4$1 then v304$1 else $$36$2bv32$1);
    $$36$2bv32$2 := (if p4$2 then v304$2 else $$36$2bv32$2);
    v305$1 := (if p4$1 then $$35$0bv32$1 else v305$1);
    v305$2 := (if p4$2 then $$35$0bv32$2 else v305$2);
    v306$1 := (if p4$1 then $$35$1bv32$1 else v306$1);
    v306$2 := (if p4$2 then $$35$1bv32$2 else v306$2);
    v307$1 := (if p4$1 then $$35$2bv32$1 else v307$1);
    v307$2 := (if p4$2 then $$35$2bv32$2 else v307$2);
    v308$1 := (if p4$1 then $$36$0bv32$1 else v308$1);
    v308$2 := (if p4$2 then $$36$0bv32$2 else v308$2);
    v309$1 := (if p4$1 then $$36$1bv32$1 else v309$1);
    v309$2 := (if p4$2 then $$36$1bv32$2 else v309$2);
    v310$1 := (if p4$1 then $$36$2bv32$1 else v310$1);
    v310$2 := (if p4$2 then $$36$2bv32$2 else v310$2);
    $$a.i.i2.i$0bv32$1 := (if p4$1 then v305$1 else $$a.i.i2.i$0bv32$1);
    $$a.i.i2.i$0bv32$2 := (if p4$2 then v305$2 else $$a.i.i2.i$0bv32$2);
    $$a.i.i2.i$1bv32$1 := (if p4$1 then v306$1 else $$a.i.i2.i$1bv32$1);
    $$a.i.i2.i$1bv32$2 := (if p4$2 then v306$2 else $$a.i.i2.i$1bv32$2);
    $$a.i.i2.i$2bv32$1 := (if p4$1 then v307$1 else $$a.i.i2.i$2bv32$1);
    $$a.i.i2.i$2bv32$2 := (if p4$2 then v307$2 else $$a.i.i2.i$2bv32$2);
    $$b.i.i.i$0bv32$1 := (if p4$1 then v308$1 else $$b.i.i.i$0bv32$1);
    $$b.i.i.i$0bv32$2 := (if p4$2 then v308$2 else $$b.i.i.i$0bv32$2);
    $$b.i.i.i$1bv32$1 := (if p4$1 then v309$1 else $$b.i.i.i$1bv32$1);
    $$b.i.i.i$1bv32$2 := (if p4$2 then v309$2 else $$b.i.i.i$1bv32$2);
    $$b.i.i.i$2bv32$1 := (if p4$1 then v310$1 else $$b.i.i.i$2bv32$1);
    $$b.i.i.i$2bv32$2 := (if p4$2 then v310$2 else $$b.i.i.i$2bv32$2);
    v311$1 := (if p4$1 then $$a.i.i2.i$0bv32$1 else v311$1);
    v311$2 := (if p4$2 then $$a.i.i2.i$0bv32$2 else v311$2);
    v312$1 := (if p4$1 then $$b.i.i.i$0bv32$1 else v312$1);
    v312$2 := (if p4$2 then $$b.i.i.i$0bv32$2 else v312$2);
    v313$1 := (if p4$1 then $$a.i.i2.i$1bv32$1 else v313$1);
    v313$2 := (if p4$2 then $$a.i.i2.i$1bv32$2 else v313$2);
    v314$1 := (if p4$1 then $$b.i.i.i$1bv32$1 else v314$1);
    v314$2 := (if p4$2 then $$b.i.i.i$1bv32$2 else v314$2);
    v315$1 := (if p4$1 then $$a.i.i2.i$2bv32$1 else v315$1);
    v315$2 := (if p4$2 then $$a.i.i2.i$2bv32$2 else v315$2);
    v316$1 := (if p4$1 then $$b.i.i.i$2bv32$1 else v316$1);
    v316$2 := (if p4$2 then $$b.i.i.i$2bv32$2 else v316$2);
    $$25$0bv32$1 := (if p4$1 then FMUL32(v311$1, v312$1) else $$25$0bv32$1);
    $$25$0bv32$2 := (if p4$2 then FMUL32(v311$2, v312$2) else $$25$0bv32$2);
    $$25$1bv32$1 := (if p4$1 then FMUL32(v313$1, v314$1) else $$25$1bv32$1);
    $$25$1bv32$2 := (if p4$2 then FMUL32(v313$2, v314$2) else $$25$1bv32$2);
    $$25$2bv32$1 := (if p4$1 then FMUL32(v315$1, v316$1) else $$25$2bv32$1);
    $$25$2bv32$2 := (if p4$2 then FMUL32(v315$2, v316$2) else $$25$2bv32$2);
    v317$1 := (if p4$1 then $$25$0bv32$1 else v317$1);
    v317$2 := (if p4$2 then $$25$0bv32$2 else v317$2);
    v318$1 := (if p4$1 then $$25$1bv32$1 else v318$1);
    v318$2 := (if p4$2 then $$25$1bv32$2 else v318$2);
    v319$1 := (if p4$1 then $$25$2bv32$1 else v319$1);
    v319$2 := (if p4$2 then $$25$2bv32$2 else v319$2);
    $$26$0bv32$1 := (if p4$1 then v317$1 else $$26$0bv32$1);
    $$26$0bv32$2 := (if p4$2 then v317$2 else $$26$0bv32$2);
    $$26$1bv32$1 := (if p4$1 then v318$1 else $$26$1bv32$1);
    $$26$1bv32$2 := (if p4$2 then v318$2 else $$26$1bv32$2);
    $$26$2bv32$1 := (if p4$1 then v319$1 else $$26$2bv32$1);
    $$26$2bv32$2 := (if p4$2 then v319$2 else $$26$2bv32$2);
    v320$1 := (if p4$1 then $$26$0bv32$1 else v320$1);
    v320$2 := (if p4$2 then $$26$0bv32$2 else v320$2);
    v321$1 := (if p4$1 then $$26$1bv32$1 else v321$1);
    v321$2 := (if p4$2 then $$26$1bv32$2 else v321$2);
    v322$1 := (if p4$1 then $$26$2bv32$1 else v322$1);
    v322$2 := (if p4$2 then $$26$2bv32$2 else v322$2);
    $$ttop.i.i$0bv32$1 := (if p4$1 then v320$1 else $$ttop.i.i$0bv32$1);
    $$ttop.i.i$0bv32$2 := (if p4$2 then v320$2 else $$ttop.i.i$0bv32$2);
    $$ttop.i.i$1bv32$1 := (if p4$1 then v321$1 else $$ttop.i.i$1bv32$1);
    $$ttop.i.i$1bv32$2 := (if p4$2 then v321$2 else $$ttop.i.i$1bv32$2);
    $$ttop.i.i$2bv32$1 := (if p4$1 then v322$1 else $$ttop.i.i$2bv32$1);
    $$ttop.i.i$2bv32$2 := (if p4$2 then v322$2 else $$ttop.i.i$2bv32$2);
    v323$1 := (if p4$1 then $$ttop.i.i$0bv32$1 else v323$1);
    v323$2 := (if p4$2 then $$ttop.i.i$0bv32$2 else v323$2);
    $$39$0bv32$1 := (if p4$1 then v323$1 else $$39$0bv32$1);
    $$39$0bv32$2 := (if p4$2 then v323$2 else $$39$0bv32$2);
    v324$1 := (if p4$1 then $$ttop.i.i$1bv32$1 else v324$1);
    v324$2 := (if p4$2 then $$ttop.i.i$1bv32$2 else v324$2);
    $$39$1bv32$1 := (if p4$1 then v324$1 else $$39$1bv32$1);
    $$39$1bv32$2 := (if p4$2 then v324$2 else $$39$1bv32$2);
    v325$1 := (if p4$1 then $$ttop.i.i$2bv32$1 else v325$1);
    v325$2 := (if p4$2 then $$ttop.i.i$2bv32$2 else v325$2);
    $$39$2bv32$1 := (if p4$1 then v325$1 else $$39$2bv32$1);
    $$39$2bv32$2 := (if p4$2 then v325$2 else $$39$2bv32$2);
    v326$1 := (if p4$1 then $$tbot.i.i$0bv32$1 else v326$1);
    v326$2 := (if p4$2 then $$tbot.i.i$0bv32$2 else v326$2);
    $$40$0bv32$1 := (if p4$1 then v326$1 else $$40$0bv32$1);
    $$40$0bv32$2 := (if p4$2 then v326$2 else $$40$0bv32$2);
    v327$1 := (if p4$1 then $$tbot.i.i$1bv32$1 else v327$1);
    v327$2 := (if p4$2 then $$tbot.i.i$1bv32$2 else v327$2);
    $$40$1bv32$1 := (if p4$1 then v327$1 else $$40$1bv32$1);
    $$40$1bv32$2 := (if p4$2 then v327$2 else $$40$1bv32$2);
    v328$1 := (if p4$1 then $$tbot.i.i$2bv32$1 else v328$1);
    v328$2 := (if p4$2 then $$tbot.i.i$2bv32$2 else v328$2);
    $$40$2bv32$1 := (if p4$1 then v328$1 else $$40$2bv32$1);
    $$40$2bv32$2 := (if p4$2 then v328$2 else $$40$2bv32$2);
    v329$1 := (if p4$1 then $$39$0bv32$1 else v329$1);
    v329$2 := (if p4$2 then $$39$0bv32$2 else v329$2);
    v330$1 := (if p4$1 then $$39$1bv32$1 else v330$1);
    v330$2 := (if p4$2 then $$39$1bv32$2 else v330$2);
    v331$1 := (if p4$1 then $$39$2bv32$1 else v331$1);
    v331$2 := (if p4$2 then $$39$2bv32$2 else v331$2);
    v332$1 := (if p4$1 then $$40$0bv32$1 else v332$1);
    v332$2 := (if p4$2 then $$40$0bv32$2 else v332$2);
    v333$1 := (if p4$1 then $$40$1bv32$1 else v333$1);
    v333$2 := (if p4$2 then $$40$1bv32$2 else v333$2);
    v334$1 := (if p4$1 then $$40$2bv32$1 else v334$1);
    v334$2 := (if p4$2 then $$40$2bv32$2 else v334$2);
    call {:sourceloc_num 620} v335$1, v335$2 := $_Z5fminf6float3S_(p4$1, v329$1, v330$1, v331$1, v332$1, v333$1, v334$1, p4$2, v329$2, v330$2, v331$2, v332$2, v333$2, v334$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5fminf6float3S_"} true;
    $$tmin.i.i$0bv32$1 := (if p4$1 then v335$1[32:0] else $$tmin.i.i$0bv32$1);
    $$tmin.i.i$0bv32$2 := (if p4$2 then v335$2[32:0] else $$tmin.i.i$0bv32$2);
    $$tmin.i.i$1bv32$1 := (if p4$1 then v335$1[64:32] else $$tmin.i.i$1bv32$1);
    $$tmin.i.i$1bv32$2 := (if p4$2 then v335$2[64:32] else $$tmin.i.i$1bv32$2);
    $$tmin.i.i$2bv32$1 := (if p4$1 then v335$1[96:64] else $$tmin.i.i$2bv32$1);
    $$tmin.i.i$2bv32$2 := (if p4$2 then v335$2[96:64] else $$tmin.i.i$2bv32$2);
    v336$1 := (if p4$1 then $$ttop.i.i$0bv32$1 else v336$1);
    v336$2 := (if p4$2 then $$ttop.i.i$0bv32$2 else v336$2);
    $$41$0bv32$1 := (if p4$1 then v336$1 else $$41$0bv32$1);
    $$41$0bv32$2 := (if p4$2 then v336$2 else $$41$0bv32$2);
    v337$1 := (if p4$1 then $$ttop.i.i$1bv32$1 else v337$1);
    v337$2 := (if p4$2 then $$ttop.i.i$1bv32$2 else v337$2);
    $$41$1bv32$1 := (if p4$1 then v337$1 else $$41$1bv32$1);
    $$41$1bv32$2 := (if p4$2 then v337$2 else $$41$1bv32$2);
    v338$1 := (if p4$1 then $$ttop.i.i$2bv32$1 else v338$1);
    v338$2 := (if p4$2 then $$ttop.i.i$2bv32$2 else v338$2);
    $$41$2bv32$1 := (if p4$1 then v338$1 else $$41$2bv32$1);
    $$41$2bv32$2 := (if p4$2 then v338$2 else $$41$2bv32$2);
    v339$1 := (if p4$1 then $$tbot.i.i$0bv32$1 else v339$1);
    v339$2 := (if p4$2 then $$tbot.i.i$0bv32$2 else v339$2);
    $$42$0bv32$1 := (if p4$1 then v339$1 else $$42$0bv32$1);
    $$42$0bv32$2 := (if p4$2 then v339$2 else $$42$0bv32$2);
    v340$1 := (if p4$1 then $$tbot.i.i$1bv32$1 else v340$1);
    v340$2 := (if p4$2 then $$tbot.i.i$1bv32$2 else v340$2);
    $$42$1bv32$1 := (if p4$1 then v340$1 else $$42$1bv32$1);
    $$42$1bv32$2 := (if p4$2 then v340$2 else $$42$1bv32$2);
    v341$1 := (if p4$1 then $$tbot.i.i$2bv32$1 else v341$1);
    v341$2 := (if p4$2 then $$tbot.i.i$2bv32$2 else v341$2);
    $$42$2bv32$1 := (if p4$1 then v341$1 else $$42$2bv32$1);
    $$42$2bv32$2 := (if p4$2 then v341$2 else $$42$2bv32$2);
    v342$1 := (if p4$1 then $$41$0bv32$1 else v342$1);
    v342$2 := (if p4$2 then $$41$0bv32$2 else v342$2);
    v343$1 := (if p4$1 then $$41$1bv32$1 else v343$1);
    v343$2 := (if p4$2 then $$41$1bv32$2 else v343$2);
    v344$1 := (if p4$1 then $$41$2bv32$1 else v344$1);
    v344$2 := (if p4$2 then $$41$2bv32$2 else v344$2);
    v345$1 := (if p4$1 then $$42$0bv32$1 else v345$1);
    v345$2 := (if p4$2 then $$42$0bv32$2 else v345$2);
    v346$1 := (if p4$1 then $$42$1bv32$1 else v346$1);
    v346$2 := (if p4$2 then $$42$1bv32$2 else v346$2);
    v347$1 := (if p4$1 then $$42$2bv32$1 else v347$1);
    v347$2 := (if p4$2 then $$42$2bv32$2 else v347$2);
    call {:sourceloc_num 642} v348$1, v348$2 := $_Z5fmaxf6float3S_(p4$1, v342$1, v343$1, v344$1, v345$1, v346$1, v347$1, p4$2, v342$2, v343$2, v344$2, v345$2, v346$2, v347$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5fmaxf6float3S_"} true;
    $$tmax.i.i$0bv32$1 := (if p4$1 then v348$1[32:0] else $$tmax.i.i$0bv32$1);
    $$tmax.i.i$0bv32$2 := (if p4$2 then v348$2[32:0] else $$tmax.i.i$0bv32$2);
    $$tmax.i.i$1bv32$1 := (if p4$1 then v348$1[64:32] else $$tmax.i.i$1bv32$1);
    $$tmax.i.i$1bv32$2 := (if p4$2 then v348$2[64:32] else $$tmax.i.i$1bv32$2);
    $$tmax.i.i$2bv32$1 := (if p4$1 then v348$1[96:64] else $$tmax.i.i$2bv32$1);
    $$tmax.i.i$2bv32$2 := (if p4$2 then v348$2[96:64] else $$tmax.i.i$2bv32$2);
    v349$1 := (if p4$1 then $$tmin.i.i$0bv32$1 else v349$1);
    v349$2 := (if p4$2 then $$tmin.i.i$0bv32$2 else v349$2);
    v350$1 := (if p4$1 then $$tmin.i.i$1bv32$1 else v350$1);
    v350$2 := (if p4$2 then $$tmin.i.i$1bv32$2 else v350$2);
    call {:sourceloc_num 648} v351$1, v351$2 := $fmaxf(p4$1, v349$1, v350$1, p4$2, v349$2, v350$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fmaxf"} true;
    v352$1 := (if p4$1 then $$tmin.i.i$0bv32$1 else v352$1);
    v352$2 := (if p4$2 then $$tmin.i.i$0bv32$2 else v352$2);
    v353$1 := (if p4$1 then $$tmin.i.i$2bv32$1 else v353$1);
    v353$2 := (if p4$2 then $$tmin.i.i$2bv32$2 else v353$2);
    call {:sourceloc_num 651} v354$1, v354$2 := $fmaxf(p4$1, v352$1, v353$1, p4$2, v352$2, v353$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fmaxf"} true;
    call {:sourceloc_num 652} v355$1, v355$2 := $fmaxf(p4$1, v351$1, v354$1, p4$2, v351$2, v354$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fmaxf"} true;
    v356$1 := (if p4$1 then $$tmax.i.i$0bv32$1 else v356$1);
    v356$2 := (if p4$2 then $$tmax.i.i$0bv32$2 else v356$2);
    v357$1 := (if p4$1 then $$tmax.i.i$1bv32$1 else v357$1);
    v357$2 := (if p4$2 then $$tmax.i.i$1bv32$2 else v357$2);
    call {:sourceloc_num 655} v358$1, v358$2 := $fminf(p4$1, v356$1, v357$1, p4$2, v356$2, v357$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fminf"} true;
    v359$1 := (if p4$1 then $$tmax.i.i$0bv32$1 else v359$1);
    v359$2 := (if p4$2 then $$tmax.i.i$0bv32$2 else v359$2);
    v360$1 := (if p4$1 then $$tmax.i.i$2bv32$1 else v360$1);
    v360$2 := (if p4$2 then $$tmax.i.i$2bv32$2 else v360$2);
    call {:sourceloc_num 658} v361$1, v361$2 := $fminf(p4$1, v359$1, v360$1, p4$2, v359$2, v360$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fminf"} true;
    call {:sourceloc_num 659} v362$1, v362$2 := $fminf(p4$1, v358$1, v361$1, p4$2, v358$2, v361$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fminf"} true;
    v363$1 := (if p4$1 then BV1_ZEXT32((if FLT32(v355$1, v362$1) then 1bv1 else 0bv1)) != 0bv32 else v363$1);
    v363$2 := (if p4$2 then BV1_ZEXT32((if FLT32(v355$2, v362$2) then 1bv1 else 0bv1)) != 0bv32 else v363$2);
    p5$1 := (if p4$1 && v363$1 then v363$1 else p5$1);
    p5$2 := (if p4$2 && v363$2 then v363$2 else p5$2);
    v364$1 := (if p5$1 then FLT32(v355$1, 0bv32) else v364$1);
    v364$2 := (if p5$2 then FLT32(v355$2, 0bv32) else v364$2);
    p6$1 := (if p5$1 && v364$1 then v364$1 else p6$1);
    p6$2 := (if p5$2 && v364$2 then v364$2 else p6$2);
    p7$1 := (if p5$1 && !v364$1 then !v364$1 else p7$1);
    p7$2 := (if p5$2 && !v364$2 then !v364$2 else p7$2);
    $tnear.i.0$1 := (if p6$1 then 0bv32 else $tnear.i.0$1);
    $tnear.i.0$2 := (if p6$2 then 0bv32 else $tnear.i.0$2);
    $tnear.i.0$1 := (if p7$1 then v355$1 else $tnear.i.0$1);
    $tnear.i.0$2 := (if p7$2 then v355$2 else $tnear.i.0$2);
    $$15$0bv32$1 := (if p5$1 then 0bv32 else $$15$0bv32$1);
    $$15$0bv32$2 := (if p5$2 then 0bv32 else $$15$0bv32$2);
    $$15$1bv32$1 := (if p5$1 then 0bv32 else $$15$1bv32$1);
    $$15$1bv32$2 := (if p5$2 then 0bv32 else $$15$1bv32$2);
    $$15$2bv32$1 := (if p5$1 then 0bv32 else $$15$2bv32$1);
    $$15$2bv32$2 := (if p5$2 then 0bv32 else $$15$2bv32$2);
    $$15$3bv32$1 := (if p5$1 then 0bv32 else $$15$3bv32$1);
    $$15$3bv32$2 := (if p5$2 then 0bv32 else $$15$3bv32$2);
    v365$1 := (if p5$1 then $$15$0bv32$1 else v365$1);
    v365$2 := (if p5$2 then $$15$0bv32$2 else v365$2);
    v366$1 := (if p5$1 then $$15$1bv32$1 else v366$1);
    v366$2 := (if p5$2 then $$15$1bv32$2 else v366$2);
    v367$1 := (if p5$1 then $$15$2bv32$1 else v367$1);
    v367$2 := (if p5$2 then $$15$2bv32$2 else v367$2);
    v368$1 := (if p5$1 then $$15$3bv32$1 else v368$1);
    v368$2 := (if p5$2 then $$15$3bv32$2 else v368$2);
    $$16$0bv32$1 := (if p5$1 then v365$1 else $$16$0bv32$1);
    $$16$0bv32$2 := (if p5$2 then v365$2 else $$16$0bv32$2);
    $$16$1bv32$1 := (if p5$1 then v366$1 else $$16$1bv32$1);
    $$16$1bv32$2 := (if p5$2 then v366$2 else $$16$1bv32$2);
    $$16$2bv32$1 := (if p5$1 then v367$1 else $$16$2bv32$1);
    $$16$2bv32$2 := (if p5$2 then v367$2 else $$16$2bv32$2);
    $$16$3bv32$1 := (if p5$1 then v368$1 else $$16$3bv32$1);
    $$16$3bv32$2 := (if p5$2 then v368$2 else $$16$3bv32$2);
    v369$1 := (if p5$1 then $$16$0bv32$1 else v369$1);
    v369$2 := (if p5$2 then $$16$0bv32$2 else v369$2);
    v370$1 := (if p5$1 then $$16$1bv32$1 else v370$1);
    v370$2 := (if p5$2 then $$16$1bv32$2 else v370$2);
    v371$1 := (if p5$1 then $$16$2bv32$1 else v371$1);
    v371$2 := (if p5$2 then $$16$2bv32$2 else v371$2);
    v372$1 := (if p5$1 then $$16$3bv32$1 else v372$1);
    v372$2 := (if p5$2 then $$16$3bv32$2 else v372$2);
    $$sum.i$0bv32$1 := (if p5$1 then v369$1 else $$sum.i$0bv32$1);
    $$sum.i$0bv32$2 := (if p5$2 then v369$2 else $$sum.i$0bv32$2);
    $$sum.i$1bv32$1 := (if p5$1 then v370$1 else $$sum.i$1bv32$1);
    $$sum.i$1bv32$2 := (if p5$2 then v370$2 else $$sum.i$1bv32$2);
    $$sum.i$2bv32$1 := (if p5$1 then v371$1 else $$sum.i$2bv32$1);
    $$sum.i$2bv32$2 := (if p5$2 then v371$2 else $$sum.i$2bv32$2);
    $$sum.i$3bv32$1 := (if p5$1 then v372$1 else $$sum.i$3bv32$1);
    $$sum.i$3bv32$2 := (if p5$2 then v372$2 else $$sum.i$3bv32$2);
    v373$1 := (if p5$1 then $$eyeRay.i$0bv32$1 else v373$1);
    v373$2 := (if p5$2 then $$eyeRay.i$0bv32$2 else v373$2);
    $$81$0bv32$1 := (if p5$1 then v373$1 else $$81$0bv32$1);
    $$81$0bv32$2 := (if p5$2 then v373$2 else $$81$0bv32$2);
    v374$1 := (if p5$1 then $$eyeRay.i$1bv32$1 else v374$1);
    v374$2 := (if p5$2 then $$eyeRay.i$1bv32$2 else v374$2);
    $$81$1bv32$1 := (if p5$1 then v374$1 else $$81$1bv32$1);
    $$81$1bv32$2 := (if p5$2 then v374$2 else $$81$1bv32$2);
    v375$1 := (if p5$1 then $$eyeRay.i$2bv32$1 else v375$1);
    v375$2 := (if p5$2 then $$eyeRay.i$2bv32$2 else v375$2);
    $$81$2bv32$1 := (if p5$1 then v375$1 else $$81$2bv32$1);
    $$81$2bv32$2 := (if p5$2 then v375$2 else $$81$2bv32$2);
    v376$1 := (if p5$1 then $$eyeRay.i$3bv32$1 else v376$1);
    v376$2 := (if p5$2 then $$eyeRay.i$3bv32$2 else v376$2);
    $$83$0bv32$1 := (if p5$1 then v376$1 else $$83$0bv32$1);
    $$83$0bv32$2 := (if p5$2 then v376$2 else $$83$0bv32$2);
    v377$1 := (if p5$1 then $$eyeRay.i$4bv32$1 else v377$1);
    v377$2 := (if p5$2 then $$eyeRay.i$4bv32$2 else v377$2);
    $$83$1bv32$1 := (if p5$1 then v377$1 else $$83$1bv32$1);
    $$83$1bv32$2 := (if p5$2 then v377$2 else $$83$1bv32$2);
    v378$1 := (if p5$1 then $$eyeRay.i$5bv32$1 else v378$1);
    v378$2 := (if p5$2 then $$eyeRay.i$5bv32$2 else v378$2);
    $$83$2bv32$1 := (if p5$1 then v378$1 else $$83$2bv32$1);
    $$83$2bv32$2 := (if p5$2 then v378$2 else $$83$2bv32$2);
    v379$1 := (if p5$1 then $$83$0bv32$1 else v379$1);
    v379$2 := (if p5$2 then $$83$0bv32$2 else v379$2);
    v380$1 := (if p5$1 then $$83$1bv32$1 else v380$1);
    v380$2 := (if p5$2 then $$83$1bv32$2 else v380$2);
    v381$1 := (if p5$1 then $$83$2bv32$1 else v381$1);
    v381$2 := (if p5$2 then $$83$2bv32$2 else v381$2);
    $$a.i3.i$0bv32$1 := (if p5$1 then v379$1 else $$a.i3.i$0bv32$1);
    $$a.i3.i$0bv32$2 := (if p5$2 then v379$2 else $$a.i3.i$0bv32$2);
    $$a.i3.i$1bv32$1 := (if p5$1 then v380$1 else $$a.i3.i$1bv32$1);
    $$a.i3.i$1bv32$2 := (if p5$2 then v380$2 else $$a.i3.i$1bv32$2);
    $$a.i3.i$2bv32$1 := (if p5$1 then v381$1 else $$a.i3.i$2bv32$1);
    $$a.i3.i$2bv32$2 := (if p5$2 then v381$2 else $$a.i3.i$2bv32$2);
    v382$1 := (if p5$1 then $$a.i3.i$0bv32$1 else v382$1);
    v382$2 := (if p5$2 then $$a.i3.i$0bv32$2 else v382$2);
    v383$1 := (if p5$1 then $$a.i3.i$1bv32$1 else v383$1);
    v383$2 := (if p5$2 then $$a.i3.i$1bv32$2 else v383$2);
    v384$1 := (if p5$1 then $$a.i3.i$2bv32$1 else v384$1);
    v384$2 := (if p5$2 then $$a.i3.i$2bv32$2 else v384$2);
    $$13$0bv32$1 := (if p5$1 then FMUL32(v382$1, $tnear.i.0$1) else $$13$0bv32$1);
    $$13$0bv32$2 := (if p5$2 then FMUL32(v382$2, $tnear.i.0$2) else $$13$0bv32$2);
    $$13$1bv32$1 := (if p5$1 then FMUL32(v383$1, $tnear.i.0$1) else $$13$1bv32$1);
    $$13$1bv32$2 := (if p5$2 then FMUL32(v383$2, $tnear.i.0$2) else $$13$1bv32$2);
    $$13$2bv32$1 := (if p5$1 then FMUL32(v384$1, $tnear.i.0$1) else $$13$2bv32$1);
    $$13$2bv32$2 := (if p5$2 then FMUL32(v384$2, $tnear.i.0$2) else $$13$2bv32$2);
    v385$1 := (if p5$1 then $$13$0bv32$1 else v385$1);
    v385$2 := (if p5$2 then $$13$0bv32$2 else v385$2);
    v386$1 := (if p5$1 then $$13$1bv32$1 else v386$1);
    v386$2 := (if p5$2 then $$13$1bv32$2 else v386$2);
    v387$1 := (if p5$1 then $$13$2bv32$1 else v387$1);
    v387$2 := (if p5$2 then $$13$2bv32$2 else v387$2);
    $$14$0bv32$1 := (if p5$1 then v385$1 else $$14$0bv32$1);
    $$14$0bv32$2 := (if p5$2 then v385$2 else $$14$0bv32$2);
    $$14$1bv32$1 := (if p5$1 then v386$1 else $$14$1bv32$1);
    $$14$1bv32$2 := (if p5$2 then v386$2 else $$14$1bv32$2);
    $$14$2bv32$1 := (if p5$1 then v387$1 else $$14$2bv32$1);
    $$14$2bv32$2 := (if p5$2 then v387$2 else $$14$2bv32$2);
    v388$1 := (if p5$1 then $$14$0bv32$1 else v388$1);
    v388$2 := (if p5$2 then $$14$0bv32$2 else v388$2);
    v389$1 := (if p5$1 then $$14$1bv32$1 else v389$1);
    v389$2 := (if p5$2 then $$14$1bv32$2 else v389$2);
    v390$1 := (if p5$1 then $$14$2bv32$1 else v390$1);
    v390$2 := (if p5$2 then $$14$2bv32$2 else v390$2);
    $$82$0bv32$1 := (if p5$1 then v388$1 else $$82$0bv32$1);
    $$82$0bv32$2 := (if p5$2 then v388$2 else $$82$0bv32$2);
    $$82$1bv32$1 := (if p5$1 then v389$1 else $$82$1bv32$1);
    $$82$1bv32$2 := (if p5$2 then v389$2 else $$82$1bv32$2);
    $$82$2bv32$1 := (if p5$1 then v390$1 else $$82$2bv32$1);
    $$82$2bv32$2 := (if p5$2 then v390$2 else $$82$2bv32$2);
    v391$1 := (if p5$1 then $$81$0bv32$1 else v391$1);
    v391$2 := (if p5$2 then $$81$0bv32$2 else v391$2);
    v392$1 := (if p5$1 then $$81$1bv32$1 else v392$1);
    v392$2 := (if p5$2 then $$81$1bv32$2 else v392$2);
    v393$1 := (if p5$1 then $$81$2bv32$1 else v393$1);
    v393$2 := (if p5$2 then $$81$2bv32$2 else v393$2);
    v394$1 := (if p5$1 then $$82$0bv32$1 else v394$1);
    v394$2 := (if p5$2 then $$82$0bv32$2 else v394$2);
    v395$1 := (if p5$1 then $$82$1bv32$1 else v395$1);
    v395$2 := (if p5$2 then $$82$1bv32$2 else v395$2);
    v396$1 := (if p5$1 then $$82$2bv32$1 else v396$1);
    v396$2 := (if p5$2 then $$82$2bv32$2 else v396$2);
    $$a.i4.i$0bv32$1 := (if p5$1 then v391$1 else $$a.i4.i$0bv32$1);
    $$a.i4.i$0bv32$2 := (if p5$2 then v391$2 else $$a.i4.i$0bv32$2);
    $$a.i4.i$1bv32$1 := (if p5$1 then v392$1 else $$a.i4.i$1bv32$1);
    $$a.i4.i$1bv32$2 := (if p5$2 then v392$2 else $$a.i4.i$1bv32$2);
    $$a.i4.i$2bv32$1 := (if p5$1 then v393$1 else $$a.i4.i$2bv32$1);
    $$a.i4.i$2bv32$2 := (if p5$2 then v393$2 else $$a.i4.i$2bv32$2);
    $$b.i.i$0bv32$1 := (if p5$1 then v394$1 else $$b.i.i$0bv32$1);
    $$b.i.i$0bv32$2 := (if p5$2 then v394$2 else $$b.i.i$0bv32$2);
    $$b.i.i$1bv32$1 := (if p5$1 then v395$1 else $$b.i.i$1bv32$1);
    $$b.i.i$1bv32$2 := (if p5$2 then v395$2 else $$b.i.i$1bv32$2);
    $$b.i.i$2bv32$1 := (if p5$1 then v396$1 else $$b.i.i$2bv32$1);
    $$b.i.i$2bv32$2 := (if p5$2 then v396$2 else $$b.i.i$2bv32$2);
    v397$1 := (if p5$1 then $$a.i4.i$0bv32$1 else v397$1);
    v397$2 := (if p5$2 then $$a.i4.i$0bv32$2 else v397$2);
    v398$1 := (if p5$1 then $$b.i.i$0bv32$1 else v398$1);
    v398$2 := (if p5$2 then $$b.i.i$0bv32$2 else v398$2);
    v399$1 := (if p5$1 then $$a.i4.i$1bv32$1 else v399$1);
    v399$2 := (if p5$2 then $$a.i4.i$1bv32$2 else v399$2);
    v400$1 := (if p5$1 then $$b.i.i$1bv32$1 else v400$1);
    v400$2 := (if p5$2 then $$b.i.i$1bv32$2 else v400$2);
    v401$1 := (if p5$1 then $$a.i4.i$2bv32$1 else v401$1);
    v401$2 := (if p5$2 then $$a.i4.i$2bv32$2 else v401$2);
    v402$1 := (if p5$1 then $$b.i.i$2bv32$1 else v402$1);
    v402$2 := (if p5$2 then $$b.i.i$2bv32$2 else v402$2);
    $$11$0bv32$1 := (if p5$1 then FADD32(v397$1, v398$1) else $$11$0bv32$1);
    $$11$0bv32$2 := (if p5$2 then FADD32(v397$2, v398$2) else $$11$0bv32$2);
    $$11$1bv32$1 := (if p5$1 then FADD32(v399$1, v400$1) else $$11$1bv32$1);
    $$11$1bv32$2 := (if p5$2 then FADD32(v399$2, v400$2) else $$11$1bv32$2);
    $$11$2bv32$1 := (if p5$1 then FADD32(v401$1, v402$1) else $$11$2bv32$1);
    $$11$2bv32$2 := (if p5$2 then FADD32(v401$2, v402$2) else $$11$2bv32$2);
    v403$1 := (if p5$1 then $$11$0bv32$1 else v403$1);
    v403$2 := (if p5$2 then $$11$0bv32$2 else v403$2);
    v404$1 := (if p5$1 then $$11$1bv32$1 else v404$1);
    v404$2 := (if p5$2 then $$11$1bv32$2 else v404$2);
    v405$1 := (if p5$1 then $$11$2bv32$1 else v405$1);
    v405$2 := (if p5$2 then $$11$2bv32$2 else v405$2);
    $$12$0bv32$1 := (if p5$1 then v403$1 else $$12$0bv32$1);
    $$12$0bv32$2 := (if p5$2 then v403$2 else $$12$0bv32$2);
    $$12$1bv32$1 := (if p5$1 then v404$1 else $$12$1bv32$1);
    $$12$1bv32$2 := (if p5$2 then v404$2 else $$12$1bv32$2);
    $$12$2bv32$1 := (if p5$1 then v405$1 else $$12$2bv32$1);
    $$12$2bv32$2 := (if p5$2 then v405$2 else $$12$2bv32$2);
    v406$1 := (if p5$1 then $$12$0bv32$1 else v406$1);
    v406$2 := (if p5$2 then $$12$0bv32$2 else v406$2);
    v407$1 := (if p5$1 then $$12$1bv32$1 else v407$1);
    v407$2 := (if p5$2 then $$12$1bv32$2 else v407$2);
    v408$1 := (if p5$1 then $$12$2bv32$1 else v408$1);
    v408$2 := (if p5$2 then $$12$2bv32$2 else v408$2);
    $$pos.i$0bv32$1 := (if p5$1 then v406$1 else $$pos.i$0bv32$1);
    $$pos.i$0bv32$2 := (if p5$2 then v406$2 else $$pos.i$0bv32$2);
    $$pos.i$1bv32$1 := (if p5$1 then v407$1 else $$pos.i$1bv32$1);
    $$pos.i$1bv32$2 := (if p5$2 then v407$2 else $$pos.i$1bv32$2);
    $$pos.i$2bv32$1 := (if p5$1 then v408$1 else $$pos.i$2bv32$1);
    $$pos.i$2bv32$2 := (if p5$2 then v408$2 else $$pos.i$2bv32$2);
    v409$1 := (if p5$1 then $$eyeRay.i$3bv32$1 else v409$1);
    v409$2 := (if p5$2 then $$eyeRay.i$3bv32$2 else v409$2);
    $$84$0bv32$1 := (if p5$1 then v409$1 else $$84$0bv32$1);
    $$84$0bv32$2 := (if p5$2 then v409$2 else $$84$0bv32$2);
    v410$1 := (if p5$1 then $$eyeRay.i$4bv32$1 else v410$1);
    v410$2 := (if p5$2 then $$eyeRay.i$4bv32$2 else v410$2);
    $$84$1bv32$1 := (if p5$1 then v410$1 else $$84$1bv32$1);
    $$84$1bv32$2 := (if p5$2 then v410$2 else $$84$1bv32$2);
    v411$1 := (if p5$1 then $$eyeRay.i$5bv32$1 else v411$1);
    v411$2 := (if p5$2 then $$eyeRay.i$5bv32$2 else v411$2);
    $$84$2bv32$1 := (if p5$1 then v411$1 else $$84$2bv32$1);
    $$84$2bv32$2 := (if p5$2 then v411$2 else $$84$2bv32$2);
    v412$1 := (if p5$1 then $$84$0bv32$1 else v412$1);
    v412$2 := (if p5$2 then $$84$0bv32$2 else v412$2);
    v413$1 := (if p5$1 then $$84$1bv32$1 else v413$1);
    v413$2 := (if p5$2 then $$84$1bv32$2 else v413$2);
    v414$1 := (if p5$1 then $$84$2bv32$1 else v414$1);
    v414$2 := (if p5$2 then $$84$2bv32$2 else v414$2);
    $$a.i5.i$0bv32$1 := (if p5$1 then v412$1 else $$a.i5.i$0bv32$1);
    $$a.i5.i$0bv32$2 := (if p5$2 then v412$2 else $$a.i5.i$0bv32$2);
    $$a.i5.i$1bv32$1 := (if p5$1 then v413$1 else $$a.i5.i$1bv32$1);
    $$a.i5.i$1bv32$2 := (if p5$2 then v413$2 else $$a.i5.i$1bv32$2);
    $$a.i5.i$2bv32$1 := (if p5$1 then v414$1 else $$a.i5.i$2bv32$1);
    $$a.i5.i$2bv32$2 := (if p5$2 then v414$2 else $$a.i5.i$2bv32$2);
    v415$1 := (if p5$1 then $$a.i5.i$0bv32$1 else v415$1);
    v415$2 := (if p5$2 then $$a.i5.i$0bv32$2 else v415$2);
    v416$1 := (if p5$1 then $$a.i5.i$1bv32$1 else v416$1);
    v416$2 := (if p5$2 then $$a.i5.i$1bv32$2 else v416$2);
    v417$1 := (if p5$1 then $$a.i5.i$2bv32$1 else v417$1);
    v417$2 := (if p5$2 then $$a.i5.i$2bv32$2 else v417$2);
    $$9$0bv32$1 := (if p5$1 then FMUL32(v415$1, 1025758986bv32) else $$9$0bv32$1);
    $$9$0bv32$2 := (if p5$2 then FMUL32(v415$2, 1025758986bv32) else $$9$0bv32$2);
    $$9$1bv32$1 := (if p5$1 then FMUL32(v416$1, 1025758986bv32) else $$9$1bv32$1);
    $$9$1bv32$2 := (if p5$2 then FMUL32(v416$2, 1025758986bv32) else $$9$1bv32$2);
    $$9$2bv32$1 := (if p5$1 then FMUL32(v417$1, 1025758986bv32) else $$9$2bv32$1);
    $$9$2bv32$2 := (if p5$2 then FMUL32(v417$2, 1025758986bv32) else $$9$2bv32$2);
    v418$1 := (if p5$1 then $$9$0bv32$1 else v418$1);
    v418$2 := (if p5$2 then $$9$0bv32$2 else v418$2);
    v419$1 := (if p5$1 then $$9$1bv32$1 else v419$1);
    v419$2 := (if p5$2 then $$9$1bv32$2 else v419$2);
    v420$1 := (if p5$1 then $$9$2bv32$1 else v420$1);
    v420$2 := (if p5$2 then $$9$2bv32$2 else v420$2);
    $$10$0bv32$1 := (if p5$1 then v418$1 else $$10$0bv32$1);
    $$10$0bv32$2 := (if p5$2 then v418$2 else $$10$0bv32$2);
    $$10$1bv32$1 := (if p5$1 then v419$1 else $$10$1bv32$1);
    $$10$1bv32$2 := (if p5$2 then v419$2 else $$10$1bv32$2);
    $$10$2bv32$1 := (if p5$1 then v420$1 else $$10$2bv32$1);
    $$10$2bv32$2 := (if p5$2 then v420$2 else $$10$2bv32$2);
    v421$1 := (if p5$1 then $$10$0bv32$1 else v421$1);
    v421$2 := (if p5$2 then $$10$0bv32$2 else v421$2);
    v422$1 := (if p5$1 then $$10$1bv32$1 else v422$1);
    v422$2 := (if p5$2 then $$10$1bv32$2 else v422$2);
    v423$1 := (if p5$1 then $$10$2bv32$1 else v423$1);
    v423$2 := (if p5$2 then $$10$2bv32$2 else v423$2);
    $$step.i$0bv32$1 := (if p5$1 then v421$1 else $$step.i$0bv32$1);
    $$step.i$0bv32$2 := (if p5$2 then v421$2 else $$step.i$0bv32$2);
    $$step.i$1bv32$1 := (if p5$1 then v422$1 else $$step.i$1bv32$1);
    $$step.i$1bv32$2 := (if p5$2 then v422$2 else $$step.i$1bv32$2);
    $$step.i$2bv32$1 := (if p5$1 then v423$1 else $$step.i$2bv32$1);
    $$step.i$2bv32$2 := (if p5$2 then v423$2 else $$step.i$2bv32$2);
    $t.i.0$1, $lastsample.i.0$1, $i.i.0$1 := (if p5$1 then $tnear.i.0$1 else $t.i.0$1), (if p5$1 then 0bv32 else $lastsample.i.0$1), (if p5$1 then 0bv32 else $i.i.0$1);
    $t.i.0$2, $lastsample.i.0$2, $i.i.0$2 := (if p5$2 then $tnear.i.0$2 else $t.i.0$2), (if p5$2 then 0bv32 else $lastsample.i.0$2), (if p5$2 then 0bv32 else $i.i.0$2);
    p8$1 := (if p5$1 then true else p8$1);
    p8$2 := (if p5$2 then true else p8$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $8;

  $8:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 783} p8$1 ==> true;
    v424$1 := (if p8$1 then BV32_SLT($i.i.0$1, 512bv32) else v424$1);
    v424$2 := (if p8$2 then BV32_SLT($i.i.0$2, 512bv32) else v424$2);
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
    p9$1 := (if p8$1 && v424$1 then v424$1 else p9$1);
    p9$2 := (if p8$2 && v424$2 then v424$2 else p9$2);
    p8$1 := (if p8$1 && !v424$1 then v424$1 else p8$1);
    p8$2 := (if p8$2 && !v424$2 then v424$2 else p8$2);
    v425$1 := (if p9$1 then $$pos.i$0bv32$1 else v425$1);
    v425$2 := (if p9$2 then $$pos.i$0bv32$2 else v425$2);
    v426$1 := (if p9$1 then $$pos.i$1bv32$1 else v426$1);
    v426$2 := (if p9$2 then $$pos.i$1bv32$2 else v426$2);
    v427$1 := (if p9$1 then $$pos.i$2bv32$1 else v427$1);
    v427$2 := (if p9$2 then $$pos.i$2bv32$2 else v427$2);
    $$8$0bv32$1 := (if p9$1 then FADD32(FMUL32(v425$1, 1056964608bv32), 1056964608bv32) else $$8$0bv32$1);
    $$8$0bv32$2 := (if p9$2 then FADD32(FMUL32(v425$2, 1056964608bv32), 1056964608bv32) else $$8$0bv32$2);
    $$8$1bv32$1 := (if p9$1 then FADD32(FMUL32(v426$1, 1056964608bv32), 1056964608bv32) else $$8$1bv32$1);
    $$8$1bv32$2 := (if p9$2 then FADD32(FMUL32(v426$2, 1056964608bv32), 1056964608bv32) else $$8$1bv32$2);
    $$8$2bv32$1 := (if p9$1 then FADD32(FMUL32(v427$1, 1056964608bv32), 1056964608bv32) else $$8$2bv32$1);
    $$8$2bv32$2 := (if p9$2 then FADD32(FMUL32(v427$2, 1056964608bv32), 1056964608bv32) else $$8$2bv32$2);
    v428$1 := (if p9$1 then $$8$0bv32$1 else v428$1);
    v428$2 := (if p9$2 then $$8$0bv32$2 else v428$2);
    v429$1 := (if p9$1 then $$8$1bv32$1 else v429$1);
    v429$2 := (if p9$2 then $$8$1bv32$2 else v429$2);
    v430$1 := (if p9$1 then $$8$2bv32$1 else v430$1);
    v430$2 := (if p9$2 then $$8$2bv32$2 else v430$2);
    $$coord.i$0bv32$1 := (if p9$1 then v428$1 else $$coord.i$0bv32$1);
    $$coord.i$0bv32$2 := (if p9$2 then v428$2 else $$coord.i$0bv32$2);
    $$coord.i$1bv32$1 := (if p9$1 then v429$1 else $$coord.i$1bv32$1);
    $$coord.i$1bv32$2 := (if p9$2 then v429$2 else $$coord.i$1bv32$2);
    $$coord.i$2bv32$1 := (if p9$1 then v430$1 else $$coord.i$2bv32$1);
    $$coord.i$2bv32$2 := (if p9$2 then v430$2 else $$coord.i$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v431$1 := (if p9$1 then _HAVOC_bv8$1 else v431$1);
    v431$2 := (if p9$2 then _HAVOC_bv8$2 else v431$2);
    $$85$0bv32$1 := (if p9$1 then v431$1 else $$85$0bv32$1);
    $$85$0bv32$2 := (if p9$2 then v431$2 else $$85$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v432$1 := (if p9$1 then _HAVOC_bv8$1 else v432$1);
    v432$2 := (if p9$2 then _HAVOC_bv8$2 else v432$2);
    $$85$1bv32$1 := (if p9$1 then v432$1 else $$85$1bv32$1);
    $$85$1bv32$2 := (if p9$2 then v432$2 else $$85$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v433$1 := (if p9$1 then _HAVOC_bv8$1 else v433$1);
    v433$2 := (if p9$2 then _HAVOC_bv8$2 else v433$2);
    $$85$2bv32$1 := (if p9$1 then v433$1 else $$85$2bv32$1);
    $$85$2bv32$2 := (if p9$2 then v433$2 else $$85$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v434$1 := (if p9$1 then _HAVOC_bv8$1 else v434$1);
    v434$2 := (if p9$2 then _HAVOC_bv8$2 else v434$2);
    $$85$3bv32$1 := (if p9$1 then v434$1 else $$85$3bv32$1);
    $$85$3bv32$2 := (if p9$2 then v434$2 else $$85$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v435$1 := (if p9$1 then _HAVOC_bv8$1 else v435$1);
    v435$2 := (if p9$2 then _HAVOC_bv8$2 else v435$2);
    $$85$4bv32$1 := (if p9$1 then v435$1 else $$85$4bv32$1);
    $$85$4bv32$2 := (if p9$2 then v435$2 else $$85$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v436$1 := (if p9$1 then _HAVOC_bv8$1 else v436$1);
    v436$2 := (if p9$2 then _HAVOC_bv8$2 else v436$2);
    $$85$5bv32$1 := (if p9$1 then v436$1 else $$85$5bv32$1);
    $$85$5bv32$2 := (if p9$2 then v436$2 else $$85$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v437$1 := (if p9$1 then _HAVOC_bv8$1 else v437$1);
    v437$2 := (if p9$2 then _HAVOC_bv8$2 else v437$2);
    $$85$6bv32$1 := (if p9$1 then v437$1 else $$85$6bv32$1);
    $$85$6bv32$2 := (if p9$2 then v437$2 else $$85$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v438$1 := (if p9$1 then _HAVOC_bv8$1 else v438$1);
    v438$2 := (if p9$2 then _HAVOC_bv8$2 else v438$2);
    $$85$7bv32$1 := (if p9$1 then v438$1 else $$85$7bv32$1);
    $$85$7bv32$2 := (if p9$2 then v438$2 else $$85$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v439$1 := (if p9$1 then _HAVOC_bv8$1 else v439$1);
    v439$2 := (if p9$2 then _HAVOC_bv8$2 else v439$2);
    $$85$8bv32$1 := (if p9$1 then v439$1 else $$85$8bv32$1);
    $$85$8bv32$2 := (if p9$2 then v439$2 else $$85$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v440$1 := (if p9$1 then _HAVOC_bv8$1 else v440$1);
    v440$2 := (if p9$2 then _HAVOC_bv8$2 else v440$2);
    $$85$9bv32$1 := (if p9$1 then v440$1 else $$85$9bv32$1);
    $$85$9bv32$2 := (if p9$2 then v440$2 else $$85$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v441$1 := (if p9$1 then _HAVOC_bv8$1 else v441$1);
    v441$2 := (if p9$2 then _HAVOC_bv8$2 else v441$2);
    $$85$10bv32$1 := (if p9$1 then v441$1 else $$85$10bv32$1);
    $$85$10bv32$2 := (if p9$2 then v441$2 else $$85$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v442$1 := (if p9$1 then _HAVOC_bv8$1 else v442$1);
    v442$2 := (if p9$2 then _HAVOC_bv8$2 else v442$2);
    $$85$11bv32$1 := (if p9$1 then v442$1 else $$85$11bv32$1);
    $$85$11bv32$2 := (if p9$2 then v442$2 else $$85$11bv32$2);
    v443$1 := (if p9$1 then $$coord.i$0bv32$1 else v443$1);
    v443$2 := (if p9$2 then $$coord.i$0bv32$2 else v443$2);
    v444$1 := (if p9$1 then $$coord.i$1bv32$1 else v444$1);
    v444$2 := (if p9$2 then $$coord.i$1bv32$2 else v444$2);
    v445$1 := (if p9$1 then $$coord.i$2bv32$1 else v445$1);
    v445$2 := (if p9$2 then $$coord.i$2bv32$2 else v445$2);
    v446$1 := (if p9$1 then $$85$0bv32$1 else v446$1);
    v446$2 := (if p9$2 then $$85$0bv32$2 else v446$2);
    v447$1 := (if p9$1 then $$85$4bv32$1 else v447$1);
    v447$2 := (if p9$2 then $$85$4bv32$2 else v447$2);
    v448$1 := (if p9$1 then $$85$5bv32$1 else v448$1);
    v448$2 := (if p9$2 then $$85$5bv32$2 else v448$2);
    v449$1 := (if p9$1 then $$85$6bv32$1 else v449$1);
    v449$2 := (if p9$2 then $$85$6bv32$2 else v449$2);
    v450$1 := (if p9$1 then $$85$7bv32$1 else v450$1);
    v450$2 := (if p9$2 then $$85$7bv32$2 else v450$2);
    v451$1 := (if p9$1 then $$85$8bv32$1 else v451$1);
    v451$2 := (if p9$2 then $$85$8bv32$2 else v451$2);
    v452$1 := (if p9$1 then $$85$9bv32$1 else v452$1);
    v452$2 := (if p9$2 then $$85$9bv32$2 else v452$2);
    v453$1 := (if p9$1 then $$85$10bv32$1 else v453$1);
    v453$2 := (if p9$2 then $$85$10bv32$2 else v453$2);
    v454$1 := (if p9$1 then $$85$11bv32$1 else v454$1);
    v454$2 := (if p9$2 then $$85$11bv32$2 else v454$2);
    call {:sourceloc_num 833} v455$1, v455$2 := $_Z5tex3D7textureIhLi3EL19cudaTextureReadMode1EEfff(p9$1, v446$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1, v454$1 ++ v453$1 ++ v452$1 ++ v451$1, v443$1, v444$1, v445$1, p9$2, v446$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2, v454$2 ++ v453$2 ++ v452$2 ++ v451$2, v443$2, v444$2, v445$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex3D7textureIhLi3EL19cudaTextureReadMode1EEfff"} true;
    v456$1 := (if p9$1 then $$pos.i$0bv32$1 else v456$1);
    v456$2 := (if p9$2 then $$pos.i$0bv32$2 else v456$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v457$1 := (if p9$1 then _HAVOC_bv8$1 else v457$1);
    v457$2 := (if p9$2 then _HAVOC_bv8$2 else v457$2);
    $$87$0bv32$1 := (if p9$1 then v457$1 else $$87$0bv32$1);
    $$87$0bv32$2 := (if p9$2 then v457$2 else $$87$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v458$1 := (if p9$1 then _HAVOC_bv8$1 else v458$1);
    v458$2 := (if p9$2 then _HAVOC_bv8$2 else v458$2);
    $$87$1bv32$1 := (if p9$1 then v458$1 else $$87$1bv32$1);
    $$87$1bv32$2 := (if p9$2 then v458$2 else $$87$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v459$1 := (if p9$1 then _HAVOC_bv8$1 else v459$1);
    v459$2 := (if p9$2 then _HAVOC_bv8$2 else v459$2);
    $$87$2bv32$1 := (if p9$1 then v459$1 else $$87$2bv32$1);
    $$87$2bv32$2 := (if p9$2 then v459$2 else $$87$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v460$1 := (if p9$1 then _HAVOC_bv8$1 else v460$1);
    v460$2 := (if p9$2 then _HAVOC_bv8$2 else v460$2);
    $$87$3bv32$1 := (if p9$1 then v460$1 else $$87$3bv32$1);
    $$87$3bv32$2 := (if p9$2 then v460$2 else $$87$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v461$1 := (if p9$1 then _HAVOC_bv8$1 else v461$1);
    v461$2 := (if p9$2 then _HAVOC_bv8$2 else v461$2);
    $$87$4bv32$1 := (if p9$1 then v461$1 else $$87$4bv32$1);
    $$87$4bv32$2 := (if p9$2 then v461$2 else $$87$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v462$1 := (if p9$1 then _HAVOC_bv8$1 else v462$1);
    v462$2 := (if p9$2 then _HAVOC_bv8$2 else v462$2);
    $$87$5bv32$1 := (if p9$1 then v462$1 else $$87$5bv32$1);
    $$87$5bv32$2 := (if p9$2 then v462$2 else $$87$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v463$1 := (if p9$1 then _HAVOC_bv8$1 else v463$1);
    v463$2 := (if p9$2 then _HAVOC_bv8$2 else v463$2);
    $$87$6bv32$1 := (if p9$1 then v463$1 else $$87$6bv32$1);
    $$87$6bv32$2 := (if p9$2 then v463$2 else $$87$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v464$1 := (if p9$1 then _HAVOC_bv8$1 else v464$1);
    v464$2 := (if p9$2 then _HAVOC_bv8$2 else v464$2);
    $$87$7bv32$1 := (if p9$1 then v464$1 else $$87$7bv32$1);
    $$87$7bv32$2 := (if p9$2 then v464$2 else $$87$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v465$1 := (if p9$1 then _HAVOC_bv8$1 else v465$1);
    v465$2 := (if p9$2 then _HAVOC_bv8$2 else v465$2);
    $$87$8bv32$1 := (if p9$1 then v465$1 else $$87$8bv32$1);
    $$87$8bv32$2 := (if p9$2 then v465$2 else $$87$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v466$1 := (if p9$1 then _HAVOC_bv8$1 else v466$1);
    v466$2 := (if p9$2 then _HAVOC_bv8$2 else v466$2);
    $$87$9bv32$1 := (if p9$1 then v466$1 else $$87$9bv32$1);
    $$87$9bv32$2 := (if p9$2 then v466$2 else $$87$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v467$1 := (if p9$1 then _HAVOC_bv8$1 else v467$1);
    v467$2 := (if p9$2 then _HAVOC_bv8$2 else v467$2);
    $$87$10bv32$1 := (if p9$1 then v467$1 else $$87$10bv32$1);
    $$87$10bv32$2 := (if p9$2 then v467$2 else $$87$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v468$1 := (if p9$1 then _HAVOC_bv8$1 else v468$1);
    v468$2 := (if p9$2 then _HAVOC_bv8$2 else v468$2);
    $$87$11bv32$1 := (if p9$1 then v468$1 else $$87$11bv32$1);
    $$87$11bv32$2 := (if p9$2 then v468$2 else $$87$11bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v469$1 := (if p9$1 then _HAVOC_bv8$1 else v469$1);
    v469$2 := (if p9$2 then _HAVOC_bv8$2 else v469$2);
    $$87$12bv32$1 := (if p9$1 then v469$1 else $$87$12bv32$1);
    $$87$12bv32$2 := (if p9$2 then v469$2 else $$87$12bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v470$1 := (if p9$1 then _HAVOC_bv8$1 else v470$1);
    v470$2 := (if p9$2 then _HAVOC_bv8$2 else v470$2);
    $$87$13bv32$1 := (if p9$1 then v470$1 else $$87$13bv32$1);
    $$87$13bv32$2 := (if p9$2 then v470$2 else $$87$13bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v471$1 := (if p9$1 then _HAVOC_bv8$1 else v471$1);
    v471$2 := (if p9$2 then _HAVOC_bv8$2 else v471$2);
    $$87$14bv32$1 := (if p9$1 then v471$1 else $$87$14bv32$1);
    $$87$14bv32$2 := (if p9$2 then v471$2 else $$87$14bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v472$1 := (if p9$1 then _HAVOC_bv8$1 else v472$1);
    v472$2 := (if p9$2 then _HAVOC_bv8$2 else v472$2);
    $$87$15bv32$1 := (if p9$1 then v472$1 else $$87$15bv32$1);
    $$87$15bv32$2 := (if p9$2 then v472$2 else $$87$15bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v473$1 := (if p9$1 then _HAVOC_bv8$1 else v473$1);
    v473$2 := (if p9$2 then _HAVOC_bv8$2 else v473$2);
    $$87$16bv32$1 := (if p9$1 then v473$1 else $$87$16bv32$1);
    $$87$16bv32$2 := (if p9$2 then v473$2 else $$87$16bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v474$1 := (if p9$1 then _HAVOC_bv8$1 else v474$1);
    v474$2 := (if p9$2 then _HAVOC_bv8$2 else v474$2);
    $$87$17bv32$1 := (if p9$1 then v474$1 else $$87$17bv32$1);
    $$87$17bv32$2 := (if p9$2 then v474$2 else $$87$17bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v475$1 := (if p9$1 then _HAVOC_bv8$1 else v475$1);
    v475$2 := (if p9$2 then _HAVOC_bv8$2 else v475$2);
    $$87$18bv32$1 := (if p9$1 then v475$1 else $$87$18bv32$1);
    $$87$18bv32$2 := (if p9$2 then v475$2 else $$87$18bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v476$1 := (if p9$1 then _HAVOC_bv8$1 else v476$1);
    v476$2 := (if p9$2 then _HAVOC_bv8$2 else v476$2);
    $$87$19bv32$1 := (if p9$1 then v476$1 else $$87$19bv32$1);
    $$87$19bv32$2 := (if p9$2 then v476$2 else $$87$19bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v477$1 := (if p9$1 then _HAVOC_bv8$1 else v477$1);
    v477$2 := (if p9$2 then _HAVOC_bv8$2 else v477$2);
    $$87$20bv32$1 := (if p9$1 then v477$1 else $$87$20bv32$1);
    $$87$20bv32$2 := (if p9$2 then v477$2 else $$87$20bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v478$1 := (if p9$1 then _HAVOC_bv8$1 else v478$1);
    v478$2 := (if p9$2 then _HAVOC_bv8$2 else v478$2);
    $$87$21bv32$1 := (if p9$1 then v478$1 else $$87$21bv32$1);
    $$87$21bv32$2 := (if p9$2 then v478$2 else $$87$21bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v479$1 := (if p9$1 then _HAVOC_bv8$1 else v479$1);
    v479$2 := (if p9$2 then _HAVOC_bv8$2 else v479$2);
    $$87$22bv32$1 := (if p9$1 then v479$1 else $$87$22bv32$1);
    $$87$22bv32$2 := (if p9$2 then v479$2 else $$87$22bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v480$1 := (if p9$1 then _HAVOC_bv8$1 else v480$1);
    v480$2 := (if p9$2 then _HAVOC_bv8$2 else v480$2);
    $$87$23bv32$1 := (if p9$1 then v480$1 else $$87$23bv32$1);
    $$87$23bv32$2 := (if p9$2 then v480$2 else $$87$23bv32$2);
    v481$1 := (if p9$1 then $$87$0bv32$1 else v481$1);
    v481$2 := (if p9$2 then $$87$0bv32$2 else v481$2);
    v482$1 := (if p9$1 then $$87$1bv32$1 else v482$1);
    v482$2 := (if p9$2 then $$87$1bv32$2 else v482$2);
    v483$1 := (if p9$1 then $$87$2bv32$1 else v483$1);
    v483$2 := (if p9$2 then $$87$2bv32$2 else v483$2);
    v484$1 := (if p9$1 then $$87$3bv32$1 else v484$1);
    v484$2 := (if p9$2 then $$87$3bv32$2 else v484$2);
    v485$1 := (if p9$1 then $$87$4bv32$1 else v485$1);
    v485$2 := (if p9$2 then $$87$4bv32$2 else v485$2);
    v486$1 := (if p9$1 then $$87$5bv32$1 else v486$1);
    v486$2 := (if p9$2 then $$87$5bv32$2 else v486$2);
    v487$1 := (if p9$1 then $$87$6bv32$1 else v487$1);
    v487$2 := (if p9$2 then $$87$6bv32$2 else v487$2);
    v488$1 := (if p9$1 then $$87$7bv32$1 else v488$1);
    v488$2 := (if p9$2 then $$87$7bv32$2 else v488$2);
    v489$1 := (if p9$1 then $$87$8bv32$1 else v489$1);
    v489$2 := (if p9$2 then $$87$8bv32$2 else v489$2);
    v490$1 := (if p9$1 then $$87$9bv32$1 else v490$1);
    v490$2 := (if p9$2 then $$87$9bv32$2 else v490$2);
    v491$1 := (if p9$1 then $$87$10bv32$1 else v491$1);
    v491$2 := (if p9$2 then $$87$10bv32$2 else v491$2);
    v492$1 := (if p9$1 then $$87$11bv32$1 else v492$1);
    v492$2 := (if p9$2 then $$87$11bv32$2 else v492$2);
    v493$1 := (if p9$1 then $$87$12bv32$1 else v493$1);
    v493$2 := (if p9$2 then $$87$12bv32$2 else v493$2);
    v494$1 := (if p9$1 then $$87$13bv32$1 else v494$1);
    v494$2 := (if p9$2 then $$87$13bv32$2 else v494$2);
    v495$1 := (if p9$1 then $$87$14bv32$1 else v495$1);
    v495$2 := (if p9$2 then $$87$14bv32$2 else v495$2);
    v496$1 := (if p9$1 then $$87$15bv32$1 else v496$1);
    v496$2 := (if p9$2 then $$87$15bv32$2 else v496$2);
    v497$1 := (if p9$1 then $$87$16bv32$1 else v497$1);
    v497$2 := (if p9$2 then $$87$16bv32$2 else v497$2);
    v498$1 := (if p9$1 then $$87$17bv32$1 else v498$1);
    v498$2 := (if p9$2 then $$87$17bv32$2 else v498$2);
    v499$1 := (if p9$1 then $$87$18bv32$1 else v499$1);
    v499$2 := (if p9$2 then $$87$18bv32$2 else v499$2);
    v500$1 := (if p9$1 then $$87$19bv32$1 else v500$1);
    v500$2 := (if p9$2 then $$87$19bv32$2 else v500$2);
    v501$1 := (if p9$1 then $$87$20bv32$1 else v501$1);
    v501$2 := (if p9$2 then $$87$20bv32$2 else v501$2);
    v502$1 := (if p9$1 then $$87$21bv32$1 else v502$1);
    v502$2 := (if p9$2 then $$87$21bv32$2 else v502$2);
    v503$1 := (if p9$1 then $$87$22bv32$1 else v503$1);
    v503$2 := (if p9$2 then $$87$22bv32$2 else v503$2);
    v504$1 := (if p9$1 then $$87$23bv32$1 else v504$1);
    v504$2 := (if p9$2 then $$87$23bv32$2 else v504$2);
    call {:sourceloc_num 907} v505$1, v505$2 := $_Z12tex2DLayeredI6float4ET_7textureIS1_Li242EL19cudaTextureReadMode0EEffi(p9$1, v496$1 ++ v495$1 ++ v494$1 ++ v493$1 ++ v492$1 ++ v491$1 ++ v490$1 ++ v489$1 ++ v488$1 ++ v487$1 ++ v486$1 ++ v485$1 ++ v484$1 ++ v483$1 ++ v482$1 ++ v481$1, v500$1 ++ v499$1 ++ v498$1 ++ v497$1, v504$1 ++ v503$1 ++ v502$1 ++ v501$1, v455$1, $lastsample.i.0$1, BV1_ZEXT32((if FLT32(v456$1, 0bv32) then 1bv1 else 0bv1)), p9$2, v496$2 ++ v495$2 ++ v494$2 ++ v493$2 ++ v492$2 ++ v491$2 ++ v490$2 ++ v489$2 ++ v488$2 ++ v487$2 ++ v486$2 ++ v485$2 ++ v484$2 ++ v483$2 ++ v482$2 ++ v481$2, v500$2 ++ v499$2 ++ v498$2 ++ v497$2, v504$2 ++ v503$2 ++ v502$2 ++ v501$2, v455$2, $lastsample.i.0$2, BV1_ZEXT32((if FLT32(v456$2, 0bv32) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z12tex2DLayeredI6float4ET_7textureIS1_Li242EL19cudaTextureReadMode0EEffi"} true;
    $$86$0bv32$1 := (if p9$1 then v505$1[32:0] else $$86$0bv32$1);
    $$86$0bv32$2 := (if p9$2 then v505$2[32:0] else $$86$0bv32$2);
    $$86$1bv32$1 := (if p9$1 then v505$1[64:32] else $$86$1bv32$1);
    $$86$1bv32$2 := (if p9$2 then v505$2[64:32] else $$86$1bv32$2);
    $$86$2bv32$1 := (if p9$1 then v505$1[96:64] else $$86$2bv32$1);
    $$86$2bv32$2 := (if p9$2 then v505$2[96:64] else $$86$2bv32$2);
    $$86$3bv32$1 := (if p9$1 then v505$1[128:96] else $$86$3bv32$1);
    $$86$3bv32$2 := (if p9$2 then v505$2[128:96] else $$86$3bv32$2);
    v506$1 := (if p9$1 then $$86$0bv32$1 else v506$1);
    v506$2 := (if p9$2 then $$86$0bv32$2 else v506$2);
    $$col.i$0bv32$1 := (if p9$1 then v506$1 else $$col.i$0bv32$1);
    $$col.i$0bv32$2 := (if p9$2 then v506$2 else $$col.i$0bv32$2);
    v507$1 := (if p9$1 then $$86$1bv32$1 else v507$1);
    v507$2 := (if p9$2 then $$86$1bv32$2 else v507$2);
    $$col.i$1bv32$1 := (if p9$1 then v507$1 else $$col.i$1bv32$1);
    $$col.i$1bv32$2 := (if p9$2 then v507$2 else $$col.i$1bv32$2);
    v508$1 := (if p9$1 then $$86$2bv32$1 else v508$1);
    v508$2 := (if p9$2 then $$86$2bv32$2 else v508$2);
    $$col.i$2bv32$1 := (if p9$1 then v508$1 else $$col.i$2bv32$1);
    $$col.i$2bv32$2 := (if p9$2 then v508$2 else $$col.i$2bv32$2);
    v509$1 := (if p9$1 then $$86$3bv32$1 else v509$1);
    v509$2 := (if p9$2 then $$86$3bv32$2 else v509$2);
    $$col.i$3bv32$1 := (if p9$1 then v509$1 else $$col.i$3bv32$1);
    $$col.i$3bv32$2 := (if p9$2 then v509$2 else $$col.i$3bv32$2);
    v510$1 := (if p9$1 then $$col.i$3bv32$1 else v510$1);
    v510$2 := (if p9$2 then $$col.i$3bv32$2 else v510$2);
    $$col.i$3bv32$1 := (if p9$1 then FMUL32(v510$1, FMUL32($density, 1082130432bv32)) else $$col.i$3bv32$1);
    $$col.i$3bv32$2 := (if p9$2 then FMUL32(v510$2, FMUL32($density, 1082130432bv32)) else $$col.i$3bv32$2);
    v511$1 := (if p9$1 then $$col.i$3bv32$1 else v511$1);
    v511$2 := (if p9$2 then $$col.i$3bv32$2 else v511$2);
    v512$1 := (if p9$1 then $$col.i$0bv32$1 else v512$1);
    v512$2 := (if p9$2 then $$col.i$0bv32$2 else v512$2);
    $$col.i$0bv32$1 := (if p9$1 then FMUL32(v512$1, v511$1) else $$col.i$0bv32$1);
    $$col.i$0bv32$2 := (if p9$2 then FMUL32(v512$2, v511$2) else $$col.i$0bv32$2);
    v513$1 := (if p9$1 then $$col.i$3bv32$1 else v513$1);
    v513$2 := (if p9$2 then $$col.i$3bv32$2 else v513$2);
    v514$1 := (if p9$1 then $$col.i$1bv32$1 else v514$1);
    v514$2 := (if p9$2 then $$col.i$1bv32$2 else v514$2);
    $$col.i$1bv32$1 := (if p9$1 then FMUL32(v514$1, v513$1) else $$col.i$1bv32$1);
    $$col.i$1bv32$2 := (if p9$2 then FMUL32(v514$2, v513$2) else $$col.i$1bv32$2);
    v515$1 := (if p9$1 then $$col.i$3bv32$1 else v515$1);
    v515$2 := (if p9$2 then $$col.i$3bv32$2 else v515$2);
    v516$1 := (if p9$1 then $$col.i$2bv32$1 else v516$1);
    v516$2 := (if p9$2 then $$col.i$2bv32$2 else v516$2);
    $$col.i$2bv32$1 := (if p9$1 then FMUL32(v516$1, v515$1) else $$col.i$2bv32$1);
    $$col.i$2bv32$2 := (if p9$2 then FMUL32(v516$2, v515$2) else $$col.i$2bv32$2);
    v517$1 := (if p9$1 then $$sum.i$0bv32$1 else v517$1);
    v517$2 := (if p9$2 then $$sum.i$0bv32$2 else v517$2);
    $$89$0bv32$1 := (if p9$1 then v517$1 else $$89$0bv32$1);
    $$89$0bv32$2 := (if p9$2 then v517$2 else $$89$0bv32$2);
    v518$1 := (if p9$1 then $$sum.i$1bv32$1 else v518$1);
    v518$2 := (if p9$2 then $$sum.i$1bv32$2 else v518$2);
    $$89$1bv32$1 := (if p9$1 then v518$1 else $$89$1bv32$1);
    $$89$1bv32$2 := (if p9$2 then v518$2 else $$89$1bv32$2);
    v519$1 := (if p9$1 then $$sum.i$2bv32$1 else v519$1);
    v519$2 := (if p9$2 then $$sum.i$2bv32$2 else v519$2);
    $$89$2bv32$1 := (if p9$1 then v519$1 else $$89$2bv32$1);
    $$89$2bv32$2 := (if p9$2 then v519$2 else $$89$2bv32$2);
    v520$1 := (if p9$1 then $$sum.i$3bv32$1 else v520$1);
    v520$2 := (if p9$2 then $$sum.i$3bv32$2 else v520$2);
    $$89$3bv32$1 := (if p9$1 then v520$1 else $$89$3bv32$1);
    $$89$3bv32$2 := (if p9$2 then v520$2 else $$89$3bv32$2);
    v521$1 := (if p9$1 then $$col.i$0bv32$1 else v521$1);
    v521$2 := (if p9$2 then $$col.i$0bv32$2 else v521$2);
    $$91$0bv32$1 := (if p9$1 then v521$1 else $$91$0bv32$1);
    $$91$0bv32$2 := (if p9$2 then v521$2 else $$91$0bv32$2);
    v522$1 := (if p9$1 then $$col.i$1bv32$1 else v522$1);
    v522$2 := (if p9$2 then $$col.i$1bv32$2 else v522$2);
    $$91$1bv32$1 := (if p9$1 then v522$1 else $$91$1bv32$1);
    $$91$1bv32$2 := (if p9$2 then v522$2 else $$91$1bv32$2);
    v523$1 := (if p9$1 then $$col.i$2bv32$1 else v523$1);
    v523$2 := (if p9$2 then $$col.i$2bv32$2 else v523$2);
    $$91$2bv32$1 := (if p9$1 then v523$1 else $$91$2bv32$1);
    $$91$2bv32$2 := (if p9$2 then v523$2 else $$91$2bv32$2);
    v524$1 := (if p9$1 then $$col.i$3bv32$1 else v524$1);
    v524$2 := (if p9$2 then $$col.i$3bv32$2 else v524$2);
    $$91$3bv32$1 := (if p9$1 then v524$1 else $$91$3bv32$1);
    $$91$3bv32$2 := (if p9$2 then v524$2 else $$91$3bv32$2);
    v525$1 := (if p9$1 then $$sum.i$3bv32$1 else v525$1);
    v525$2 := (if p9$2 then $$sum.i$3bv32$2 else v525$2);
    v526$1 := (if p9$1 then FSUB32(1065353216bv32, v525$1) else v526$1);
    v526$2 := (if p9$2 then FSUB32(1065353216bv32, v525$2) else v526$2);
    v527$1 := (if p9$1 then $$91$0bv32$1 else v527$1);
    v527$2 := (if p9$2 then $$91$0bv32$2 else v527$2);
    v528$1 := (if p9$1 then $$91$1bv32$1 else v528$1);
    v528$2 := (if p9$2 then $$91$1bv32$2 else v528$2);
    v529$1 := (if p9$1 then $$91$2bv32$1 else v529$1);
    v529$2 := (if p9$2 then $$91$2bv32$2 else v529$2);
    v530$1 := (if p9$1 then $$91$3bv32$1 else v530$1);
    v530$2 := (if p9$2 then $$91$3bv32$2 else v530$2);
    $$a.i6.i$0bv32$1 := (if p9$1 then v527$1 else $$a.i6.i$0bv32$1);
    $$a.i6.i$0bv32$2 := (if p9$2 then v527$2 else $$a.i6.i$0bv32$2);
    $$a.i6.i$1bv32$1 := (if p9$1 then v528$1 else $$a.i6.i$1bv32$1);
    $$a.i6.i$1bv32$2 := (if p9$2 then v528$2 else $$a.i6.i$1bv32$2);
    $$a.i6.i$2bv32$1 := (if p9$1 then v529$1 else $$a.i6.i$2bv32$1);
    $$a.i6.i$2bv32$2 := (if p9$2 then v529$2 else $$a.i6.i$2bv32$2);
    $$a.i6.i$3bv32$1 := (if p9$1 then v530$1 else $$a.i6.i$3bv32$1);
    $$a.i6.i$3bv32$2 := (if p9$2 then v530$2 else $$a.i6.i$3bv32$2);
    v531$1 := (if p9$1 then $$a.i6.i$0bv32$1 else v531$1);
    v531$2 := (if p9$2 then $$a.i6.i$0bv32$2 else v531$2);
    v532$1 := (if p9$1 then $$a.i6.i$1bv32$1 else v532$1);
    v532$2 := (if p9$2 then $$a.i6.i$1bv32$2 else v532$2);
    v533$1 := (if p9$1 then $$a.i6.i$2bv32$1 else v533$1);
    v533$2 := (if p9$2 then $$a.i6.i$2bv32$2 else v533$2);
    v534$1 := (if p9$1 then $$a.i6.i$3bv32$1 else v534$1);
    v534$2 := (if p9$2 then $$a.i6.i$3bv32$2 else v534$2);
    $$6$0bv32$1 := (if p9$1 then FMUL32(v531$1, v526$1) else $$6$0bv32$1);
    $$6$0bv32$2 := (if p9$2 then FMUL32(v531$2, v526$2) else $$6$0bv32$2);
    $$6$1bv32$1 := (if p9$1 then FMUL32(v532$1, v526$1) else $$6$1bv32$1);
    $$6$1bv32$2 := (if p9$2 then FMUL32(v532$2, v526$2) else $$6$1bv32$2);
    $$6$2bv32$1 := (if p9$1 then FMUL32(v533$1, v526$1) else $$6$2bv32$1);
    $$6$2bv32$2 := (if p9$2 then FMUL32(v533$2, v526$2) else $$6$2bv32$2);
    $$6$3bv32$1 := (if p9$1 then FMUL32(v534$1, v526$1) else $$6$3bv32$1);
    $$6$3bv32$2 := (if p9$2 then FMUL32(v534$2, v526$2) else $$6$3bv32$2);
    v535$1 := (if p9$1 then $$6$0bv32$1 else v535$1);
    v535$2 := (if p9$2 then $$6$0bv32$2 else v535$2);
    v536$1 := (if p9$1 then $$6$1bv32$1 else v536$1);
    v536$2 := (if p9$2 then $$6$1bv32$2 else v536$2);
    v537$1 := (if p9$1 then $$6$2bv32$1 else v537$1);
    v537$2 := (if p9$2 then $$6$2bv32$2 else v537$2);
    v538$1 := (if p9$1 then $$6$3bv32$1 else v538$1);
    v538$2 := (if p9$2 then $$6$3bv32$2 else v538$2);
    $$7$0bv32$1 := (if p9$1 then v535$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p9$2 then v535$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p9$1 then v536$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p9$2 then v536$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p9$1 then v537$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p9$2 then v537$2 else $$7$2bv32$2);
    $$7$3bv32$1 := (if p9$1 then v538$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p9$2 then v538$2 else $$7$3bv32$2);
    v539$1 := (if p9$1 then $$7$0bv32$1 else v539$1);
    v539$2 := (if p9$2 then $$7$0bv32$2 else v539$2);
    v540$1 := (if p9$1 then $$7$1bv32$1 else v540$1);
    v540$2 := (if p9$2 then $$7$1bv32$2 else v540$2);
    v541$1 := (if p9$1 then $$7$2bv32$1 else v541$1);
    v541$2 := (if p9$2 then $$7$2bv32$2 else v541$2);
    v542$1 := (if p9$1 then $$7$3bv32$1 else v542$1);
    v542$2 := (if p9$2 then $$7$3bv32$2 else v542$2);
    $$90$0bv32$1 := (if p9$1 then v539$1 else $$90$0bv32$1);
    $$90$0bv32$2 := (if p9$2 then v539$2 else $$90$0bv32$2);
    $$90$1bv32$1 := (if p9$1 then v540$1 else $$90$1bv32$1);
    $$90$1bv32$2 := (if p9$2 then v540$2 else $$90$1bv32$2);
    $$90$2bv32$1 := (if p9$1 then v541$1 else $$90$2bv32$1);
    $$90$2bv32$2 := (if p9$2 then v541$2 else $$90$2bv32$2);
    $$90$3bv32$1 := (if p9$1 then v542$1 else $$90$3bv32$1);
    $$90$3bv32$2 := (if p9$2 then v542$2 else $$90$3bv32$2);
    v543$1 := (if p9$1 then $$89$0bv32$1 else v543$1);
    v543$2 := (if p9$2 then $$89$0bv32$2 else v543$2);
    v544$1 := (if p9$1 then $$89$1bv32$1 else v544$1);
    v544$2 := (if p9$2 then $$89$1bv32$2 else v544$2);
    v545$1 := (if p9$1 then $$89$2bv32$1 else v545$1);
    v545$2 := (if p9$2 then $$89$2bv32$2 else v545$2);
    v546$1 := (if p9$1 then $$89$3bv32$1 else v546$1);
    v546$2 := (if p9$2 then $$89$3bv32$2 else v546$2);
    v547$1 := (if p9$1 then $$90$0bv32$1 else v547$1);
    v547$2 := (if p9$2 then $$90$0bv32$2 else v547$2);
    v548$1 := (if p9$1 then $$90$1bv32$1 else v548$1);
    v548$2 := (if p9$2 then $$90$1bv32$2 else v548$2);
    v549$1 := (if p9$1 then $$90$2bv32$1 else v549$1);
    v549$2 := (if p9$2 then $$90$2bv32$2 else v549$2);
    v550$1 := (if p9$1 then $$90$3bv32$1 else v550$1);
    v550$2 := (if p9$2 then $$90$3bv32$2 else v550$2);
    $$a.i7.i$0bv32$1 := (if p9$1 then v543$1 else $$a.i7.i$0bv32$1);
    $$a.i7.i$0bv32$2 := (if p9$2 then v543$2 else $$a.i7.i$0bv32$2);
    $$a.i7.i$1bv32$1 := (if p9$1 then v544$1 else $$a.i7.i$1bv32$1);
    $$a.i7.i$1bv32$2 := (if p9$2 then v544$2 else $$a.i7.i$1bv32$2);
    $$a.i7.i$2bv32$1 := (if p9$1 then v545$1 else $$a.i7.i$2bv32$1);
    $$a.i7.i$2bv32$2 := (if p9$2 then v545$2 else $$a.i7.i$2bv32$2);
    $$a.i7.i$3bv32$1 := (if p9$1 then v546$1 else $$a.i7.i$3bv32$1);
    $$a.i7.i$3bv32$2 := (if p9$2 then v546$2 else $$a.i7.i$3bv32$2);
    $$b.i8.i$0bv32$1 := (if p9$1 then v547$1 else $$b.i8.i$0bv32$1);
    $$b.i8.i$0bv32$2 := (if p9$2 then v547$2 else $$b.i8.i$0bv32$2);
    $$b.i8.i$1bv32$1 := (if p9$1 then v548$1 else $$b.i8.i$1bv32$1);
    $$b.i8.i$1bv32$2 := (if p9$2 then v548$2 else $$b.i8.i$1bv32$2);
    $$b.i8.i$2bv32$1 := (if p9$1 then v549$1 else $$b.i8.i$2bv32$1);
    $$b.i8.i$2bv32$2 := (if p9$2 then v549$2 else $$b.i8.i$2bv32$2);
    $$b.i8.i$3bv32$1 := (if p9$1 then v550$1 else $$b.i8.i$3bv32$1);
    $$b.i8.i$3bv32$2 := (if p9$2 then v550$2 else $$b.i8.i$3bv32$2);
    v551$1 := (if p9$1 then $$a.i7.i$0bv32$1 else v551$1);
    v551$2 := (if p9$2 then $$a.i7.i$0bv32$2 else v551$2);
    v552$1 := (if p9$1 then $$b.i8.i$0bv32$1 else v552$1);
    v552$2 := (if p9$2 then $$b.i8.i$0bv32$2 else v552$2);
    v553$1 := (if p9$1 then $$a.i7.i$1bv32$1 else v553$1);
    v553$2 := (if p9$2 then $$a.i7.i$1bv32$2 else v553$2);
    v554$1 := (if p9$1 then $$b.i8.i$1bv32$1 else v554$1);
    v554$2 := (if p9$2 then $$b.i8.i$1bv32$2 else v554$2);
    v555$1 := (if p9$1 then $$a.i7.i$2bv32$1 else v555$1);
    v555$2 := (if p9$2 then $$a.i7.i$2bv32$2 else v555$2);
    v556$1 := (if p9$1 then $$b.i8.i$2bv32$1 else v556$1);
    v556$2 := (if p9$2 then $$b.i8.i$2bv32$2 else v556$2);
    v557$1 := (if p9$1 then $$a.i7.i$3bv32$1 else v557$1);
    v557$2 := (if p9$2 then $$a.i7.i$3bv32$2 else v557$2);
    v558$1 := (if p9$1 then $$b.i8.i$3bv32$1 else v558$1);
    v558$2 := (if p9$2 then $$b.i8.i$3bv32$2 else v558$2);
    $$4$0bv32$1 := (if p9$1 then FADD32(v551$1, v552$1) else $$4$0bv32$1);
    $$4$0bv32$2 := (if p9$2 then FADD32(v551$2, v552$2) else $$4$0bv32$2);
    $$4$1bv32$1 := (if p9$1 then FADD32(v553$1, v554$1) else $$4$1bv32$1);
    $$4$1bv32$2 := (if p9$2 then FADD32(v553$2, v554$2) else $$4$1bv32$2);
    $$4$2bv32$1 := (if p9$1 then FADD32(v555$1, v556$1) else $$4$2bv32$1);
    $$4$2bv32$2 := (if p9$2 then FADD32(v555$2, v556$2) else $$4$2bv32$2);
    $$4$3bv32$1 := (if p9$1 then FADD32(v557$1, v558$1) else $$4$3bv32$1);
    $$4$3bv32$2 := (if p9$2 then FADD32(v557$2, v558$2) else $$4$3bv32$2);
    v559$1 := (if p9$1 then $$4$0bv32$1 else v559$1);
    v559$2 := (if p9$2 then $$4$0bv32$2 else v559$2);
    v560$1 := (if p9$1 then $$4$1bv32$1 else v560$1);
    v560$2 := (if p9$2 then $$4$1bv32$2 else v560$2);
    v561$1 := (if p9$1 then $$4$2bv32$1 else v561$1);
    v561$2 := (if p9$2 then $$4$2bv32$2 else v561$2);
    v562$1 := (if p9$1 then $$4$3bv32$1 else v562$1);
    v562$2 := (if p9$2 then $$4$3bv32$2 else v562$2);
    $$5$0bv32$1 := (if p9$1 then v559$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p9$2 then v559$2 else $$5$0bv32$2);
    $$5$1bv32$1 := (if p9$1 then v560$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p9$2 then v560$2 else $$5$1bv32$2);
    $$5$2bv32$1 := (if p9$1 then v561$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p9$2 then v561$2 else $$5$2bv32$2);
    $$5$3bv32$1 := (if p9$1 then v562$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p9$2 then v562$2 else $$5$3bv32$2);
    v563$1 := (if p9$1 then $$5$0bv32$1 else v563$1);
    v563$2 := (if p9$2 then $$5$0bv32$2 else v563$2);
    v564$1 := (if p9$1 then $$5$1bv32$1 else v564$1);
    v564$2 := (if p9$2 then $$5$1bv32$2 else v564$2);
    v565$1 := (if p9$1 then $$5$2bv32$1 else v565$1);
    v565$2 := (if p9$2 then $$5$2bv32$2 else v565$2);
    v566$1 := (if p9$1 then $$5$3bv32$1 else v566$1);
    v566$2 := (if p9$2 then $$5$3bv32$2 else v566$2);
    $$88$0bv32$1 := (if p9$1 then v563$1 else $$88$0bv32$1);
    $$88$0bv32$2 := (if p9$2 then v563$2 else $$88$0bv32$2);
    $$88$1bv32$1 := (if p9$1 then v564$1 else $$88$1bv32$1);
    $$88$1bv32$2 := (if p9$2 then v564$2 else $$88$1bv32$2);
    $$88$2bv32$1 := (if p9$1 then v565$1 else $$88$2bv32$1);
    $$88$2bv32$2 := (if p9$2 then v565$2 else $$88$2bv32$2);
    $$88$3bv32$1 := (if p9$1 then v566$1 else $$88$3bv32$1);
    $$88$3bv32$2 := (if p9$2 then v566$2 else $$88$3bv32$2);
    v567$1 := (if p9$1 then $$88$0bv32$1 else v567$1);
    v567$2 := (if p9$2 then $$88$0bv32$2 else v567$2);
    $$sum.i$0bv32$1 := (if p9$1 then v567$1 else $$sum.i$0bv32$1);
    $$sum.i$0bv32$2 := (if p9$2 then v567$2 else $$sum.i$0bv32$2);
    v568$1 := (if p9$1 then $$88$1bv32$1 else v568$1);
    v568$2 := (if p9$2 then $$88$1bv32$2 else v568$2);
    $$sum.i$1bv32$1 := (if p9$1 then v568$1 else $$sum.i$1bv32$1);
    $$sum.i$1bv32$2 := (if p9$2 then v568$2 else $$sum.i$1bv32$2);
    v569$1 := (if p9$1 then $$88$2bv32$1 else v569$1);
    v569$2 := (if p9$2 then $$88$2bv32$2 else v569$2);
    $$sum.i$2bv32$1 := (if p9$1 then v569$1 else $$sum.i$2bv32$1);
    $$sum.i$2bv32$2 := (if p9$2 then v569$2 else $$sum.i$2bv32$2);
    v570$1 := (if p9$1 then $$88$3bv32$1 else v570$1);
    v570$2 := (if p9$2 then $$88$3bv32$2 else v570$2);
    $$sum.i$3bv32$1 := (if p9$1 then v570$1 else $$sum.i$3bv32$1);
    $$sum.i$3bv32$2 := (if p9$2 then v570$2 else $$sum.i$3bv32$2);
    v571$1 := (if p9$1 then $$sum.i$3bv32$1 else v571$1);
    v571$2 := (if p9$2 then $$sum.i$3bv32$2 else v571$2);
    v572$1 := (if p9$1 then FLT32(1064514355bv32, v571$1) else v572$1);
    v572$2 := (if p9$2 then FLT32(1064514355bv32, v571$2) else v572$2);
    p8$1 := (if p9$1 && v572$1 then !v572$1 else p8$1);
    p8$2 := (if p9$2 && v572$2 then !v572$2 else p8$2);
    p10$1 := (if p9$1 && !v572$1 then !v572$1 else p10$1);
    p10$2 := (if p9$2 && !v572$2 then !v572$2 else p10$2);
    v573$1 := (if p10$1 then FADD32($t.i.0$1, 1025758986bv32) else v573$1);
    v573$2 := (if p10$2 then FADD32($t.i.0$2, 1025758986bv32) else v573$2);
    v574$1 := (if p10$1 then FLT32(v362$1, v573$1) else v574$1);
    v574$2 := (if p10$2 then FLT32(v362$2, v573$2) else v574$2);
    p8$1 := (if p10$1 && v574$1 then !v574$1 else p8$1);
    p8$2 := (if p10$2 && v574$2 then !v574$2 else p8$2);
    p11$1 := (if p10$1 && !v574$1 then !v574$1 else p11$1);
    p11$2 := (if p10$2 && !v574$2 then !v574$2 else p11$2);
    v575$1 := (if p11$1 then $$step.i$0bv32$1 else v575$1);
    v575$2 := (if p11$2 then $$step.i$0bv32$2 else v575$2);
    $$92$0bv32$1 := (if p11$1 then v575$1 else $$92$0bv32$1);
    $$92$0bv32$2 := (if p11$2 then v575$2 else $$92$0bv32$2);
    v576$1 := (if p11$1 then $$step.i$1bv32$1 else v576$1);
    v576$2 := (if p11$2 then $$step.i$1bv32$2 else v576$2);
    $$92$1bv32$1 := (if p11$1 then v576$1 else $$92$1bv32$1);
    $$92$1bv32$2 := (if p11$2 then v576$2 else $$92$1bv32$2);
    v577$1 := (if p11$1 then $$step.i$2bv32$1 else v577$1);
    v577$2 := (if p11$2 then $$step.i$2bv32$2 else v577$2);
    $$92$2bv32$1 := (if p11$1 then v577$1 else $$92$2bv32$1);
    $$92$2bv32$2 := (if p11$2 then v577$2 else $$92$2bv32$2);
    v578$1 := (if p11$1 then $$92$0bv32$1 else v578$1);
    v578$2 := (if p11$2 then $$92$0bv32$2 else v578$2);
    v579$1 := (if p11$1 then $$92$1bv32$1 else v579$1);
    v579$2 := (if p11$2 then $$92$1bv32$2 else v579$2);
    v580$1 := (if p11$1 then $$92$2bv32$1 else v580$1);
    v580$2 := (if p11$2 then $$92$2bv32$2 else v580$2);
    $$b.i9.i$0bv32$1 := (if p11$1 then v578$1 else $$b.i9.i$0bv32$1);
    $$b.i9.i$0bv32$2 := (if p11$2 then v578$2 else $$b.i9.i$0bv32$2);
    $$b.i9.i$1bv32$1 := (if p11$1 then v579$1 else $$b.i9.i$1bv32$1);
    $$b.i9.i$1bv32$2 := (if p11$2 then v579$2 else $$b.i9.i$1bv32$2);
    $$b.i9.i$2bv32$1 := (if p11$1 then v580$1 else $$b.i9.i$2bv32$1);
    $$b.i9.i$2bv32$2 := (if p11$2 then v580$2 else $$b.i9.i$2bv32$2);
    v581$1 := (if p11$1 then $$pos.i$0bv32$1 else v581$1);
    v581$2 := (if p11$2 then $$pos.i$0bv32$2 else v581$2);
    v582$1 := (if p11$1 then $$b.i9.i$0bv32$1 else v582$1);
    v582$2 := (if p11$2 then $$b.i9.i$0bv32$2 else v582$2);
    v583$1 := (if p11$1 then $$pos.i$1bv32$1 else v583$1);
    v583$2 := (if p11$2 then $$pos.i$1bv32$2 else v583$2);
    v584$1 := (if p11$1 then $$b.i9.i$1bv32$1 else v584$1);
    v584$2 := (if p11$2 then $$b.i9.i$1bv32$2 else v584$2);
    v585$1 := (if p11$1 then $$pos.i$2bv32$1 else v585$1);
    v585$2 := (if p11$2 then $$pos.i$2bv32$2 else v585$2);
    v586$1 := (if p11$1 then $$b.i9.i$2bv32$1 else v586$1);
    v586$2 := (if p11$2 then $$b.i9.i$2bv32$2 else v586$2);
    $$2$0bv32$1 := (if p11$1 then FADD32(v581$1, v582$1) else $$2$0bv32$1);
    $$2$0bv32$2 := (if p11$2 then FADD32(v581$2, v582$2) else $$2$0bv32$2);
    $$2$1bv32$1 := (if p11$1 then FADD32(v583$1, v584$1) else $$2$1bv32$1);
    $$2$1bv32$2 := (if p11$2 then FADD32(v583$2, v584$2) else $$2$1bv32$2);
    $$2$2bv32$1 := (if p11$1 then FADD32(v585$1, v586$1) else $$2$2bv32$1);
    $$2$2bv32$2 := (if p11$2 then FADD32(v585$2, v586$2) else $$2$2bv32$2);
    v587$1 := (if p11$1 then $$2$0bv32$1 else v587$1);
    v587$2 := (if p11$2 then $$2$0bv32$2 else v587$2);
    v588$1 := (if p11$1 then $$2$1bv32$1 else v588$1);
    v588$2 := (if p11$2 then $$2$1bv32$2 else v588$2);
    v589$1 := (if p11$1 then $$2$2bv32$1 else v589$1);
    v589$2 := (if p11$2 then $$2$2bv32$2 else v589$2);
    $$3$0bv32$1 := (if p11$1 then v587$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p11$2 then v587$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p11$1 then v588$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p11$2 then v588$2 else $$3$1bv32$2);
    $$3$2bv32$1 := (if p11$1 then v589$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p11$2 then v589$2 else $$3$2bv32$2);
    v590$1 := (if p11$1 then $$3$0bv32$1 else v590$1);
    v590$2 := (if p11$2 then $$3$0bv32$2 else v590$2);
    $$pos.i$0bv32$1 := (if p11$1 then v590$1 else $$pos.i$0bv32$1);
    $$pos.i$0bv32$2 := (if p11$2 then v590$2 else $$pos.i$0bv32$2);
    v591$1 := (if p11$1 then $$3$1bv32$1 else v591$1);
    v591$2 := (if p11$2 then $$3$1bv32$2 else v591$2);
    $$pos.i$1bv32$1 := (if p11$1 then v591$1 else $$pos.i$1bv32$1);
    $$pos.i$1bv32$2 := (if p11$2 then v591$2 else $$pos.i$1bv32$2);
    v592$1 := (if p11$1 then $$3$2bv32$1 else v592$1);
    v592$2 := (if p11$2 then $$3$2bv32$2 else v592$2);
    $$pos.i$2bv32$1 := (if p11$1 then v592$1 else $$pos.i$2bv32$1);
    $$pos.i$2bv32$2 := (if p11$2 then v592$2 else $$pos.i$2bv32$2);
    $t.i.0$1, $lastsample.i.0$1, $i.i.0$1 := (if p11$1 then v573$1 else $t.i.0$1), (if p11$1 then v455$1 else $lastsample.i.0$1), (if p11$1 then BV32_ADD($i.i.0$1, 1bv32) else $i.i.0$1);
    $t.i.0$2, $lastsample.i.0$2, $i.i.0$2 := (if p11$2 then v573$2 else $t.i.0$2), (if p11$2 then v455$2 else $lastsample.i.0$2), (if p11$2 then BV32_ADD($i.i.0$2, 1bv32) else $i.i.0$2);
    p8$1 := (if p11$1 then true else p8$1);
    p8$2 := (if p11$2 then true else p8$2);
    goto $8.backedge, $8.tail;

  $8.tail:
    assume !p8$1 && !p8$2;
    v593$1 := (if p5$1 then $$sum.i$0bv32$1 else v593$1);
    v593$2 := (if p5$2 then $$sum.i$0bv32$2 else v593$2);
    v594$1 := (if p5$1 then $$sum.i$1bv32$1 else v594$1);
    v594$2 := (if p5$2 then $$sum.i$1bv32$2 else v594$2);
    v595$1 := (if p5$1 then $$sum.i$2bv32$1 else v595$1);
    v595$2 := (if p5$2 then $$sum.i$2bv32$2 else v595$2);
    v596$1 := (if p5$1 then $$sum.i$3bv32$1 else v596$1);
    v596$2 := (if p5$2 then $$sum.i$3bv32$2 else v596$2);
    $$0$0bv32$1 := (if p5$1 then FMUL32(v593$1, $brightness) else $$0$0bv32$1);
    $$0$0bv32$2 := (if p5$2 then FMUL32(v593$2, $brightness) else $$0$0bv32$2);
    $$0$1bv32$1 := (if p5$1 then FMUL32(v594$1, $brightness) else $$0$1bv32$1);
    $$0$1bv32$2 := (if p5$2 then FMUL32(v594$2, $brightness) else $$0$1bv32$2);
    $$0$2bv32$1 := (if p5$1 then FMUL32(v595$1, $brightness) else $$0$2bv32$1);
    $$0$2bv32$2 := (if p5$2 then FMUL32(v595$2, $brightness) else $$0$2bv32$2);
    $$0$3bv32$1 := (if p5$1 then FMUL32(v596$1, $brightness) else $$0$3bv32$1);
    $$0$3bv32$2 := (if p5$2 then FMUL32(v596$2, $brightness) else $$0$3bv32$2);
    v597$1 := (if p5$1 then $$0$0bv32$1 else v597$1);
    v597$2 := (if p5$2 then $$0$0bv32$2 else v597$2);
    v598$1 := (if p5$1 then $$0$1bv32$1 else v598$1);
    v598$2 := (if p5$2 then $$0$1bv32$2 else v598$2);
    v599$1 := (if p5$1 then $$0$2bv32$1 else v599$1);
    v599$2 := (if p5$2 then $$0$2bv32$2 else v599$2);
    v600$1 := (if p5$1 then $$0$3bv32$1 else v600$1);
    v600$2 := (if p5$2 then $$0$3bv32$2 else v600$2);
    $$1$0bv32$1 := (if p5$1 then v597$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p5$2 then v597$2 else $$1$0bv32$2);
    $$1$1bv32$1 := (if p5$1 then v598$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p5$2 then v598$2 else $$1$1bv32$2);
    $$1$2bv32$1 := (if p5$1 then v599$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p5$2 then v599$2 else $$1$2bv32$2);
    $$1$3bv32$1 := (if p5$1 then v600$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p5$2 then v600$2 else $$1$3bv32$2);
    v601$1 := (if p5$1 then $$1$0bv32$1 else v601$1);
    v601$2 := (if p5$2 then $$1$0bv32$2 else v601$2);
    $$sum.i$0bv32$1 := (if p5$1 then v601$1 else $$sum.i$0bv32$1);
    $$sum.i$0bv32$2 := (if p5$2 then v601$2 else $$sum.i$0bv32$2);
    v602$1 := (if p5$1 then $$1$1bv32$1 else v602$1);
    v602$2 := (if p5$2 then $$1$1bv32$2 else v602$2);
    $$sum.i$1bv32$1 := (if p5$1 then v602$1 else $$sum.i$1bv32$1);
    $$sum.i$1bv32$2 := (if p5$2 then v602$2 else $$sum.i$1bv32$2);
    v603$1 := (if p5$1 then $$1$2bv32$1 else v603$1);
    v603$2 := (if p5$2 then $$1$2bv32$2 else v603$2);
    $$sum.i$2bv32$1 := (if p5$1 then v603$1 else $$sum.i$2bv32$1);
    $$sum.i$2bv32$2 := (if p5$2 then v603$2 else $$sum.i$2bv32$2);
    v604$1 := (if p5$1 then $$1$3bv32$1 else v604$1);
    v604$2 := (if p5$2 then $$1$3bv32$2 else v604$2);
    $$sum.i$3bv32$1 := (if p5$1 then v604$1 else $$sum.i$3bv32$1);
    $$sum.i$3bv32$2 := (if p5$2 then v604$2 else $$sum.i$3bv32$2);
    v605$1 := (if p5$1 then $$sum.i$0bv32$1 else v605$1);
    v605$2 := (if p5$2 then $$sum.i$0bv32$2 else v605$2);
    $$93$0bv32$1 := (if p5$1 then v605$1 else $$93$0bv32$1);
    $$93$0bv32$2 := (if p5$2 then v605$2 else $$93$0bv32$2);
    v606$1 := (if p5$1 then $$sum.i$1bv32$1 else v606$1);
    v606$2 := (if p5$2 then $$sum.i$1bv32$2 else v606$2);
    $$93$1bv32$1 := (if p5$1 then v606$1 else $$93$1bv32$1);
    $$93$1bv32$2 := (if p5$2 then v606$2 else $$93$1bv32$2);
    v607$1 := (if p5$1 then $$sum.i$2bv32$1 else v607$1);
    v607$2 := (if p5$2 then $$sum.i$2bv32$2 else v607$2);
    $$93$2bv32$1 := (if p5$1 then v607$1 else $$93$2bv32$1);
    $$93$2bv32$2 := (if p5$2 then v607$2 else $$93$2bv32$2);
    v608$1 := (if p5$1 then $$sum.i$3bv32$1 else v608$1);
    v608$2 := (if p5$2 then $$sum.i$3bv32$2 else v608$2);
    $$93$3bv32$1 := (if p5$1 then v608$1 else $$93$3bv32$1);
    $$93$3bv32$2 := (if p5$2 then v608$2 else $$93$3bv32$2);
    v609$1 := (if p5$1 then $$93$0bv32$1 else v609$1);
    v609$2 := (if p5$2 then $$93$0bv32$2 else v609$2);
    v610$1 := (if p5$1 then $$93$1bv32$1 else v610$1);
    v610$2 := (if p5$2 then $$93$1bv32$2 else v610$2);
    v611$1 := (if p5$1 then $$93$2bv32$1 else v611$1);
    v611$2 := (if p5$2 then $$93$2bv32$2 else v611$2);
    v612$1 := (if p5$1 then $$93$3bv32$1 else v612$1);
    v612$2 := (if p5$2 then $$93$3bv32$2 else v612$2);
    $$rgba.i.i$0bv32$1 := (if p5$1 then v609$1 else $$rgba.i.i$0bv32$1);
    $$rgba.i.i$0bv32$2 := (if p5$2 then v609$2 else $$rgba.i.i$0bv32$2);
    $$rgba.i.i$1bv32$1 := (if p5$1 then v610$1 else $$rgba.i.i$1bv32$1);
    $$rgba.i.i$1bv32$2 := (if p5$2 then v610$2 else $$rgba.i.i$1bv32$2);
    $$rgba.i.i$2bv32$1 := (if p5$1 then v611$1 else $$rgba.i.i$2bv32$1);
    $$rgba.i.i$2bv32$2 := (if p5$2 then v611$2 else $$rgba.i.i$2bv32$2);
    $$rgba.i.i$3bv32$1 := (if p5$1 then v612$1 else $$rgba.i.i$3bv32$1);
    $$rgba.i.i$3bv32$2 := (if p5$2 then v612$2 else $$rgba.i.i$3bv32$2);
    v613$1 := (if p5$1 then $$rgba.i.i$0bv32$1 else v613$1);
    v613$2 := (if p5$2 then $$rgba.i.i$0bv32$2 else v613$2);
    call {:sourceloc_num 1112} v614$1, v614$2 := $__saturatef(p5$1, v613$1, p5$2, v613$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i.i$0bv32$1 := (if p5$1 then v614$1 else $$rgba.i.i$0bv32$1);
    $$rgba.i.i$0bv32$2 := (if p5$2 then v614$2 else $$rgba.i.i$0bv32$2);
    v615$1 := (if p5$1 then $$rgba.i.i$1bv32$1 else v615$1);
    v615$2 := (if p5$2 then $$rgba.i.i$1bv32$2 else v615$2);
    call {:sourceloc_num 1115} v616$1, v616$2 := $__saturatef(p5$1, v615$1, p5$2, v615$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i.i$1bv32$1 := (if p5$1 then v616$1 else $$rgba.i.i$1bv32$1);
    $$rgba.i.i$1bv32$2 := (if p5$2 then v616$2 else $$rgba.i.i$1bv32$2);
    v617$1 := (if p5$1 then $$rgba.i.i$2bv32$1 else v617$1);
    v617$2 := (if p5$2 then $$rgba.i.i$2bv32$2 else v617$2);
    call {:sourceloc_num 1118} v618$1, v618$2 := $__saturatef(p5$1, v617$1, p5$2, v617$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i.i$2bv32$1 := (if p5$1 then v618$1 else $$rgba.i.i$2bv32$1);
    $$rgba.i.i$2bv32$2 := (if p5$2 then v618$2 else $$rgba.i.i$2bv32$2);
    v619$1 := (if p5$1 then $$rgba.i.i$3bv32$1 else v619$1);
    v619$2 := (if p5$2 then $$rgba.i.i$3bv32$2 else v619$2);
    call {:sourceloc_num 1121} v620$1, v620$2 := $__saturatef(p5$1, v619$1, p5$2, v619$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i.i$3bv32$1 := (if p5$1 then v620$1 else $$rgba.i.i$3bv32$1);
    $$rgba.i.i$3bv32$2 := (if p5$2 then v620$2 else $$rgba.i.i$3bv32$2);
    v621$1 := (if p5$1 then $$rgba.i.i$3bv32$1 else v621$1);
    v621$2 := (if p5$2 then $$rgba.i.i$3bv32$2 else v621$2);
    v622$1 := (if p5$1 then $$rgba.i.i$2bv32$1 else v622$1);
    v622$2 := (if p5$2 then $$rgba.i.i$2bv32$2 else v622$2);
    v623$1 := (if p5$1 then $$rgba.i.i$1bv32$1 else v623$1);
    v623$2 := (if p5$2 then $$rgba.i.i$1bv32$2 else v623$2);
    v624$1 := (if p5$1 then $$rgba.i.i$0bv32$1 else v624$1);
    v624$2 := (if p5$2 then $$rgba.i.i$0bv32$2 else v624$2);
    call {:sourceloc} {:sourceloc_num 1127} _LOG_WRITE_$$d_output(p5$1, BV32_ADD(BV32_MUL(v7$1, $imageW), v6$1), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v621$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v622$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v623$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v624$1, 1132396544bv32))), $$d_output[BV32_ADD(BV32_MUL(v7$1, $imageW), v6$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p5$2, BV32_ADD(BV32_MUL(v7$2, $imageW), v6$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1127} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1127} _CHECK_WRITE_$$d_output(p5$2, BV32_ADD(BV32_MUL(v7$2, $imageW), v6$2), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v621$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v622$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v623$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v624$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(BV32_MUL(v7$1, $imageW), v6$1)] := (if p5$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v621$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v622$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v623$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v624$1, 1132396544bv32))) else $$d_output[BV32_ADD(BV32_MUL(v7$1, $imageW), v6$1)]);
    $$d_output[BV32_ADD(BV32_MUL(v7$2, $imageW), v6$2)] := (if p5$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v621$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v622$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v623$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v624$2, 1132396544bv32))) else $$d_output[BV32_ADD(BV32_MUL(v7$2, $imageW), v6$2)]);
    return;

  $8.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $8;
}



procedure {:source_name "_Z9normalize6float3"} $_Z9normalize6float3(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32) returns ($ret$1: bv96, $ret$2: bv96);



procedure {:source_name "_Z5tex3D7textureIhLi3EL19cudaTextureReadMode1EEfff"} $_Z5tex3D7textureIhLi3EL19cudaTextureReadMode1EEfff(_P$1: bool, $0$1: bv8, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv8, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z12tex2DLayeredI6float4ET_7textureIS1_Li242EL19cudaTextureReadMode0EEffi"} $_Z12tex2DLayeredI6float4ET_7textureIS1_Li242EL19cudaTextureReadMode0EEffi(_P$1: bool, $0$1: bv128, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv128, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



procedure {:source_name "__saturatef"} $__saturatef(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z5fminf6float3S_"} $_Z5fminf6float3S_(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv96, $ret$2: bv96);



procedure {:source_name "_Z5fmaxf6float3S_"} $_Z5fmaxf6float3S_(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv96, $ret$2: bv96);



procedure {:source_name "fmaxf"} $fmaxf(_P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "fminf"} $fminf(_P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z3dot6float3S_"} $_Z3dot6float3S_(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z3dot6float4S_"} $_Z3dot6float4S_(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, $6$1: bv32, $7$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32, $6$2: bv32, $7$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$0$3bv32$1: bv32;

var $$0$3bv32$2: bv32;

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

var $$b.i9.i$0bv32$1: bv32;

var $$b.i9.i$0bv32$2: bv32;

var $$b.i9.i$1bv32$1: bv32;

var $$b.i9.i$1bv32$2: bv32;

var $$b.i9.i$2bv32$1: bv32;

var $$b.i9.i$2bv32$2: bv32;

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

var $$a.i7.i$0bv32$1: bv32;

var $$a.i7.i$0bv32$2: bv32;

var $$a.i7.i$1bv32$1: bv32;

var $$a.i7.i$1bv32$2: bv32;

var $$a.i7.i$2bv32$1: bv32;

var $$a.i7.i$2bv32$2: bv32;

var $$a.i7.i$3bv32$1: bv32;

var $$a.i7.i$3bv32$2: bv32;

var $$b.i8.i$0bv32$1: bv32;

var $$b.i8.i$0bv32$2: bv32;

var $$b.i8.i$1bv32$1: bv32;

var $$b.i8.i$1bv32$2: bv32;

var $$b.i8.i$2bv32$1: bv32;

var $$b.i8.i$2bv32$2: bv32;

var $$b.i8.i$3bv32$1: bv32;

var $$b.i8.i$3bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$6$3bv32$1: bv32;

var $$6$3bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$7$3bv32$1: bv32;

var $$7$3bv32$2: bv32;

var $$a.i6.i$0bv32$1: bv32;

var $$a.i6.i$0bv32$2: bv32;

var $$a.i6.i$1bv32$1: bv32;

var $$a.i6.i$1bv32$2: bv32;

var $$a.i6.i$2bv32$1: bv32;

var $$a.i6.i$2bv32$2: bv32;

var $$a.i6.i$3bv32$1: bv32;

var $$a.i6.i$3bv32$2: bv32;

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

var $$a.i5.i$0bv32$1: bv32;

var $$a.i5.i$0bv32$2: bv32;

var $$a.i5.i$1bv32$1: bv32;

var $$a.i5.i$1bv32$2: bv32;

var $$a.i5.i$2bv32$1: bv32;

var $$a.i5.i$2bv32$2: bv32;

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

var $$a.i4.i$0bv32$1: bv32;

var $$a.i4.i$0bv32$2: bv32;

var $$a.i4.i$1bv32$1: bv32;

var $$a.i4.i$1bv32$2: bv32;

var $$a.i4.i$2bv32$1: bv32;

var $$a.i4.i$2bv32$2: bv32;

var $$b.i.i$0bv32$1: bv32;

var $$b.i.i$0bv32$2: bv32;

var $$b.i.i$1bv32$1: bv32;

var $$b.i.i$1bv32$2: bv32;

var $$b.i.i$2bv32$1: bv32;

var $$b.i.i$2bv32$2: bv32;

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

var $$a.i3.i$0bv32$1: bv32;

var $$a.i3.i$0bv32$2: bv32;

var $$a.i3.i$1bv32$1: bv32;

var $$a.i3.i$1bv32$2: bv32;

var $$a.i3.i$2bv32$1: bv32;

var $$a.i3.i$2bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$15$2bv32$1: bv32;

var $$15$2bv32$2: bv32;

var $$15$3bv32$1: bv32;

var $$15$3bv32$2: bv32;

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

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$18$2bv32$1: bv32;

var $$18$2bv32$2: bv32;

var $$a.i7.i.i$0bv32$1: bv32;

var $$a.i7.i.i$0bv32$2: bv32;

var $$a.i7.i.i$1bv32$1: bv32;

var $$a.i7.i.i$1bv32$2: bv32;

var $$a.i7.i.i$2bv32$1: bv32;

var $$a.i7.i.i$2bv32$2: bv32;

var $$b.i8.i.i$0bv32$1: bv32;

var $$b.i8.i.i$0bv32$2: bv32;

var $$b.i8.i.i$1bv32$1: bv32;

var $$b.i8.i.i$1bv32$2: bv32;

var $$b.i8.i.i$2bv32$1: bv32;

var $$b.i8.i.i$2bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

var $$19$2bv32$1: bv32;

var $$19$2bv32$2: bv32;

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$a.i5.i.i$0bv32$1: bv32;

var $$a.i5.i.i$0bv32$2: bv32;

var $$a.i5.i.i$1bv32$1: bv32;

var $$a.i5.i.i$1bv32$2: bv32;

var $$a.i5.i.i$2bv32$1: bv32;

var $$a.i5.i.i$2bv32$2: bv32;

var $$b.i6.i.i$0bv32$1: bv32;

var $$b.i6.i.i$0bv32$2: bv32;

var $$b.i6.i.i$1bv32$1: bv32;

var $$b.i6.i.i$1bv32$2: bv32;

var $$b.i6.i.i$2bv32$1: bv32;

var $$b.i6.i.i$2bv32$2: bv32;

var $$21$0bv32$1: bv32;

var $$21$0bv32$2: bv32;

var $$21$1bv32$1: bv32;

var $$21$1bv32$2: bv32;

var $$21$2bv32$1: bv32;

var $$21$2bv32$2: bv32;

var $$22$0bv32$1: bv32;

var $$22$0bv32$2: bv32;

var $$22$1bv32$1: bv32;

var $$22$1bv32$2: bv32;

var $$22$2bv32$1: bv32;

var $$22$2bv32$2: bv32;

var $$a.i3.i.i$0bv32$1: bv32;

var $$a.i3.i.i$0bv32$2: bv32;

var $$a.i3.i.i$1bv32$1: bv32;

var $$a.i3.i.i$1bv32$2: bv32;

var $$a.i3.i.i$2bv32$1: bv32;

var $$a.i3.i.i$2bv32$2: bv32;

var $$b.i4.i.i$0bv32$1: bv32;

var $$b.i4.i.i$0bv32$2: bv32;

var $$b.i4.i.i$1bv32$1: bv32;

var $$b.i4.i.i$1bv32$2: bv32;

var $$b.i4.i.i$2bv32$1: bv32;

var $$b.i4.i.i$2bv32$2: bv32;

var $$23$0bv32$1: bv32;

var $$23$0bv32$2: bv32;

var $$23$1bv32$1: bv32;

var $$23$1bv32$2: bv32;

var $$23$2bv32$1: bv32;

var $$23$2bv32$2: bv32;

var $$24$0bv32$1: bv32;

var $$24$0bv32$2: bv32;

var $$24$1bv32$1: bv32;

var $$24$1bv32$2: bv32;

var $$24$2bv32$1: bv32;

var $$24$2bv32$2: bv32;

var $$a.i1.i1.i$0bv32$1: bv32;

var $$a.i1.i1.i$0bv32$2: bv32;

var $$a.i1.i1.i$1bv32$1: bv32;

var $$a.i1.i1.i$1bv32$2: bv32;

var $$a.i1.i1.i$2bv32$1: bv32;

var $$a.i1.i1.i$2bv32$2: bv32;

var $$b.i2.i.i$0bv32$1: bv32;

var $$b.i2.i.i$0bv32$2: bv32;

var $$b.i2.i.i$1bv32$1: bv32;

var $$b.i2.i.i$1bv32$2: bv32;

var $$b.i2.i.i$2bv32$1: bv32;

var $$b.i2.i.i$2bv32$2: bv32;

var $$25$0bv32$1: bv32;

var $$25$0bv32$2: bv32;

var $$25$1bv32$1: bv32;

var $$25$1bv32$2: bv32;

var $$25$2bv32$1: bv32;

var $$25$2bv32$2: bv32;

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$a.i.i2.i$0bv32$1: bv32;

var $$a.i.i2.i$0bv32$2: bv32;

var $$a.i.i2.i$1bv32$1: bv32;

var $$a.i.i2.i$1bv32$2: bv32;

var $$a.i.i2.i$2bv32$1: bv32;

var $$a.i.i2.i$2bv32$2: bv32;

var $$b.i.i.i$0bv32$1: bv32;

var $$b.i.i.i$0bv32$2: bv32;

var $$b.i.i.i$1bv32$1: bv32;

var $$b.i.i.i$1bv32$2: bv32;

var $$b.i.i.i$2bv32$1: bv32;

var $$b.i.i.i$2bv32$2: bv32;

var $$27$0bv32$1: bv32;

var $$27$0bv32$2: bv32;

var $$27$1bv32$1: bv32;

var $$27$1bv32$2: bv32;

var $$27$2bv32$1: bv32;

var $$27$2bv32$2: bv32;

var $$28$0bv32$1: bv32;

var $$28$0bv32$2: bv32;

var $$28$1bv32$1: bv32;

var $$28$1bv32$2: bv32;

var $$28$2bv32$1: bv32;

var $$28$2bv32$2: bv32;

var $$r.i.i$0bv32$1: bv32;

var $$r.i.i$0bv32$2: bv32;

var $$r.i.i$1bv32$1: bv32;

var $$r.i.i$1bv32$2: bv32;

var $$r.i.i$2bv32$1: bv32;

var $$r.i.i$2bv32$2: bv32;

var $$r.i.i$3bv32$1: bv32;

var $$r.i.i$3bv32$2: bv32;

var $$r.i.i$4bv32$1: bv32;

var $$r.i.i$4bv32$2: bv32;

var $$r.i.i$5bv32$1: bv32;

var $$r.i.i$5bv32$2: bv32;

var $$boxmin.i.i$0bv32$1: bv32;

var $$boxmin.i.i$0bv32$2: bv32;

var $$boxmin.i.i$1bv32$1: bv32;

var $$boxmin.i.i$1bv32$2: bv32;

var $$boxmin.i.i$2bv32$1: bv32;

var $$boxmin.i.i$2bv32$2: bv32;

var $$boxmax.i.i$0bv32$1: bv32;

var $$boxmax.i.i$0bv32$2: bv32;

var $$boxmax.i.i$1bv32$1: bv32;

var $$boxmax.i.i$1bv32$2: bv32;

var $$boxmax.i.i$2bv32$1: bv32;

var $$boxmax.i.i$2bv32$2: bv32;

var $$invR.i.i$0bv32$1: bv32;

var $$invR.i.i$0bv32$2: bv32;

var $$invR.i.i$1bv32$1: bv32;

var $$invR.i.i$1bv32$2: bv32;

var $$invR.i.i$2bv32$1: bv32;

var $$invR.i.i$2bv32$2: bv32;

var $$29$0bv32$1: bv32;

var $$29$0bv32$2: bv32;

var $$29$1bv32$1: bv32;

var $$29$1bv32$2: bv32;

var $$29$2bv32$1: bv32;

var $$29$2bv32$2: bv32;

var $$30$0bv32$1: bv32;

var $$30$0bv32$2: bv32;

var $$30$1bv32$1: bv32;

var $$30$1bv32$2: bv32;

var $$30$2bv32$1: bv32;

var $$30$2bv32$2: bv32;

var $$tbot.i.i$0bv32$1: bv32;

var $$tbot.i.i$0bv32$2: bv32;

var $$tbot.i.i$1bv32$1: bv32;

var $$tbot.i.i$1bv32$2: bv32;

var $$tbot.i.i$2bv32$1: bv32;

var $$tbot.i.i$2bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$32$0bv32$1: bv32;

var $$32$0bv32$2: bv32;

var $$32$1bv32$1: bv32;

var $$32$1bv32$2: bv32;

var $$32$2bv32$1: bv32;

var $$32$2bv32$2: bv32;

var $$33$0bv32$1: bv32;

var $$33$0bv32$2: bv32;

var $$33$1bv32$1: bv32;

var $$33$1bv32$2: bv32;

var $$33$2bv32$1: bv32;

var $$33$2bv32$2: bv32;

var $$34$0bv32$1: bv32;

var $$34$0bv32$2: bv32;

var $$34$1bv32$1: bv32;

var $$34$1bv32$2: bv32;

var $$34$2bv32$1: bv32;

var $$34$2bv32$2: bv32;

var $$ttop.i.i$0bv32$1: bv32;

var $$ttop.i.i$0bv32$2: bv32;

var $$ttop.i.i$1bv32$1: bv32;

var $$ttop.i.i$1bv32$2: bv32;

var $$ttop.i.i$2bv32$1: bv32;

var $$ttop.i.i$2bv32$2: bv32;

var $$35$0bv32$1: bv32;

var $$35$0bv32$2: bv32;

var $$35$1bv32$1: bv32;

var $$35$1bv32$2: bv32;

var $$35$2bv32$1: bv32;

var $$35$2bv32$2: bv32;

var $$36$0bv32$1: bv32;

var $$36$0bv32$2: bv32;

var $$36$1bv32$1: bv32;

var $$36$1bv32$2: bv32;

var $$36$2bv32$1: bv32;

var $$36$2bv32$2: bv32;

var $$37$0bv32$1: bv32;

var $$37$0bv32$2: bv32;

var $$37$1bv32$1: bv32;

var $$37$1bv32$2: bv32;

var $$37$2bv32$1: bv32;

var $$37$2bv32$2: bv32;

var $$38$0bv32$1: bv32;

var $$38$0bv32$2: bv32;

var $$38$1bv32$1: bv32;

var $$38$1bv32$2: bv32;

var $$38$2bv32$1: bv32;

var $$38$2bv32$2: bv32;

var $$tmin.i.i$0bv32$1: bv32;

var $$tmin.i.i$0bv32$2: bv32;

var $$tmin.i.i$1bv32$1: bv32;

var $$tmin.i.i$1bv32$2: bv32;

var $$tmin.i.i$2bv32$1: bv32;

var $$tmin.i.i$2bv32$2: bv32;

var $$39$0bv32$1: bv32;

var $$39$0bv32$2: bv32;

var $$39$1bv32$1: bv32;

var $$39$1bv32$2: bv32;

var $$39$2bv32$1: bv32;

var $$39$2bv32$2: bv32;

var $$40$0bv32$1: bv32;

var $$40$0bv32$2: bv32;

var $$40$1bv32$1: bv32;

var $$40$1bv32$2: bv32;

var $$40$2bv32$1: bv32;

var $$40$2bv32$2: bv32;

var $$tmax.i.i$0bv32$1: bv32;

var $$tmax.i.i$0bv32$2: bv32;

var $$tmax.i.i$1bv32$1: bv32;

var $$tmax.i.i$1bv32$2: bv32;

var $$tmax.i.i$2bv32$1: bv32;

var $$tmax.i.i$2bv32$2: bv32;

var $$41$0bv32$1: bv32;

var $$41$0bv32$2: bv32;

var $$41$1bv32$1: bv32;

var $$41$1bv32$2: bv32;

var $$41$2bv32$1: bv32;

var $$41$2bv32$2: bv32;

var $$42$0bv32$1: bv32;

var $$42$0bv32$2: bv32;

var $$42$1bv32$1: bv32;

var $$42$1bv32$2: bv32;

var $$42$2bv32$1: bv32;

var $$42$2bv32$2: bv32;

var $$43$0bv32$1: bv32;

var $$43$0bv32$2: bv32;

var $$43$1bv32$1: bv32;

var $$43$1bv32$2: bv32;

var $$43$2bv32$1: bv32;

var $$43$2bv32$2: bv32;

var $$44$0bv32$1: bv32;

var $$44$0bv32$2: bv32;

var $$44$1bv32$1: bv32;

var $$44$1bv32$2: bv32;

var $$44$2bv32$1: bv32;

var $$44$2bv32$2: bv32;

var $$a.i2.i.i$0bv32$1: bv32;

var $$a.i2.i.i$0bv32$2: bv32;

var $$a.i2.i.i$1bv32$1: bv32;

var $$a.i2.i.i$1bv32$2: bv32;

var $$a.i2.i.i$2bv32$1: bv32;

var $$a.i2.i.i$2bv32$2: bv32;

var $$a.i2.i.i$3bv32$1: bv32;

var $$a.i2.i.i$3bv32$2: bv32;

var $$45$0bv32$1: bv32;

var $$45$0bv32$2: bv32;

var $$45$1bv32$1: bv32;

var $$45$1bv32$2: bv32;

var $$45$2bv32$1: bv32;

var $$45$2bv32$2: bv32;

var $$46$0bv32$1: bv32;

var $$46$0bv32$2: bv32;

var $$46$1bv32$1: bv32;

var $$46$1bv32$2: bv32;

var $$46$2bv32$1: bv32;

var $$46$2bv32$2: bv32;

var $$a.i1.i.i$0bv32$1: bv32;

var $$a.i1.i.i$0bv32$2: bv32;

var $$a.i1.i.i$1bv32$1: bv32;

var $$a.i1.i.i$1bv32$2: bv32;

var $$a.i1.i.i$2bv32$1: bv32;

var $$a.i1.i.i$2bv32$2: bv32;

var $$a.i1.i.i$3bv32$1: bv32;

var $$a.i1.i.i$3bv32$2: bv32;

var $$47$0bv32$1: bv32;

var $$47$0bv32$2: bv32;

var $$47$1bv32$1: bv32;

var $$47$1bv32$2: bv32;

var $$47$2bv32$1: bv32;

var $$47$2bv32$2: bv32;

var $$48$0bv32$1: bv32;

var $$48$0bv32$2: bv32;

var $$48$1bv32$1: bv32;

var $$48$1bv32$2: bv32;

var $$48$2bv32$1: bv32;

var $$48$2bv32$2: bv32;

var $$a.i.i.i$0bv32$1: bv32;

var $$a.i.i.i$0bv32$2: bv32;

var $$a.i.i.i$1bv32$1: bv32;

var $$a.i.i.i$1bv32$2: bv32;

var $$a.i.i.i$2bv32$1: bv32;

var $$a.i.i.i$2bv32$2: bv32;

var $$a.i.i.i$3bv32$1: bv32;

var $$a.i.i.i$3bv32$2: bv32;

var $$49$0bv32$1: bv32;

var $$49$0bv32$2: bv32;

var $$49$1bv32$1: bv32;

var $$49$1bv32$2: bv32;

var $$49$2bv32$1: bv32;

var $$49$2bv32$2: bv32;

var $$50$0bv32$1: bv32;

var $$50$0bv32$2: bv32;

var $$50$1bv32$1: bv32;

var $$50$1bv32$2: bv32;

var $$50$2bv32$1: bv32;

var $$50$2bv32$2: bv32;

var $$51$0bv32$1: bv32;

var $$51$0bv32$2: bv32;

var $$51$1bv32$1: bv32;

var $$51$1bv32$2: bv32;

var $$51$2bv32$1: bv32;

var $$51$2bv32$2: bv32;

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

var $$54$0bv32$1: bv32;

var $$54$0bv32$2: bv32;

var $$54$1bv32$1: bv32;

var $$54$1bv32$2: bv32;

var $$54$2bv32$1: bv32;

var $$54$2bv32$2: bv32;

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

var $$57$0bv32$1: bv32;

var $$57$0bv32$2: bv32;

var $$57$1bv32$1: bv32;

var $$57$1bv32$2: bv32;

var $$57$2bv32$1: bv32;

var $$57$2bv32$2: bv32;

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

var $$60$0bv32$1: bv32;

var $$60$0bv32$2: bv32;

var $$60$1bv32$1: bv32;

var $$60$1bv32$2: bv32;

var $$60$2bv32$1: bv32;

var $$60$2bv32$2: bv32;

var $$61$0bv32$1: bv32;

var $$61$0bv32$2: bv32;

var $$61$1bv32$1: bv32;

var $$61$1bv32$2: bv32;

var $$61$2bv32$1: bv32;

var $$61$2bv32$2: bv32;

var $$a.i.i$0bv32$1: bv32;

var $$a.i.i$0bv32$2: bv32;

var $$a.i.i$1bv32$1: bv32;

var $$a.i.i$1bv32$2: bv32;

var $$a.i.i$2bv32$1: bv32;

var $$a.i.i$2bv32$2: bv32;

var $$a.i.i$3bv32$1: bv32;

var $$a.i.i$3bv32$2: bv32;

var $$62$0bv32$1: bv32;

var $$62$0bv32$2: bv32;

var $$62$1bv32$1: bv32;

var $$62$1bv32$2: bv32;

var $$62$2bv32$1: bv32;

var $$62$2bv32$2: bv32;

var $$62$3bv32$1: bv32;

var $$62$3bv32$2: bv32;

var $$63$0bv32$1: bv32;

var $$63$0bv32$2: bv32;

var $$63$1bv32$1: bv32;

var $$63$1bv32$2: bv32;

var $$63$2bv32$1: bv32;

var $$63$2bv32$2: bv32;

var $$63$3bv32$1: bv32;

var $$63$3bv32$2: bv32;

var $$64$0bv32$1: bv32;

var $$64$0bv32$2: bv32;

var $$64$1bv32$1: bv32;

var $$64$1bv32$2: bv32;

var $$64$2bv32$1: bv32;

var $$64$2bv32$2: bv32;

var $$64$3bv32$1: bv32;

var $$64$3bv32$2: bv32;

var $$65$0bv32$1: bv32;

var $$65$0bv32$2: bv32;

var $$65$1bv32$1: bv32;

var $$65$1bv32$2: bv32;

var $$65$2bv32$1: bv32;

var $$65$2bv32$2: bv32;

var $$65$3bv32$1: bv32;

var $$65$3bv32$2: bv32;

var $$66$0bv32$1: bv32;

var $$66$0bv32$2: bv32;

var $$66$1bv32$1: bv32;

var $$66$1bv32$2: bv32;

var $$66$2bv32$1: bv32;

var $$66$2bv32$2: bv32;

var $$66$3bv32$1: bv32;

var $$66$3bv32$2: bv32;

var $$67$0bv32$1: bv32;

var $$67$0bv32$2: bv32;

var $$67$1bv32$1: bv32;

var $$67$1bv32$2: bv32;

var $$67$2bv32$1: bv32;

var $$67$2bv32$2: bv32;

var $$67$3bv32$1: bv32;

var $$67$3bv32$2: bv32;

var $$68$0bv32$1: bv32;

var $$68$0bv32$2: bv32;

var $$68$1bv32$1: bv32;

var $$68$1bv32$2: bv32;

var $$68$2bv32$1: bv32;

var $$68$2bv32$2: bv32;

var $$68$3bv32$1: bv32;

var $$68$3bv32$2: bv32;

var $$69$0bv32$1: bv32;

var $$69$0bv32$2: bv32;

var $$69$1bv32$1: bv32;

var $$69$1bv32$2: bv32;

var $$69$2bv32$1: bv32;

var $$69$2bv32$2: bv32;

var $$69$3bv32$1: bv32;

var $$69$3bv32$2: bv32;

var $$70$0bv32$1: bv32;

var $$70$0bv32$2: bv32;

var $$70$1bv32$1: bv32;

var $$70$1bv32$2: bv32;

var $$70$2bv32$1: bv32;

var $$70$2bv32$2: bv32;

var $$rgba.i.i$0bv32$1: bv32;

var $$rgba.i.i$0bv32$2: bv32;

var $$rgba.i.i$1bv32$1: bv32;

var $$rgba.i.i$1bv32$2: bv32;

var $$rgba.i.i$2bv32$1: bv32;

var $$rgba.i.i$2bv32$2: bv32;

var $$rgba.i.i$3bv32$1: bv32;

var $$rgba.i.i$3bv32$2: bv32;

var $$71$0bv32$1: bv32;

var $$71$0bv32$2: bv32;

var $$71$1bv32$1: bv32;

var $$71$1bv32$2: bv32;

var $$71$2bv32$1: bv32;

var $$71$2bv32$2: bv32;

var $$boxMin.i$0bv32$1: bv32;

var $$boxMin.i$0bv32$2: bv32;

var $$boxMin.i$1bv32$1: bv32;

var $$boxMin.i$1bv32$2: bv32;

var $$boxMin.i$2bv32$1: bv32;

var $$boxMin.i$2bv32$2: bv32;

var $$boxMax.i$0bv32$1: bv32;

var $$boxMax.i$0bv32$2: bv32;

var $$boxMax.i$1bv32$1: bv32;

var $$boxMax.i$1bv32$2: bv32;

var $$boxMax.i$2bv32$1: bv32;

var $$boxMax.i$2bv32$2: bv32;

var $$eyeRay.i$0bv32$1: bv32;

var $$eyeRay.i$0bv32$2: bv32;

var $$eyeRay.i$1bv32$1: bv32;

var $$eyeRay.i$1bv32$2: bv32;

var $$eyeRay.i$2bv32$1: bv32;

var $$eyeRay.i$2bv32$2: bv32;

var $$eyeRay.i$3bv32$1: bv32;

var $$eyeRay.i$3bv32$2: bv32;

var $$eyeRay.i$4bv32$1: bv32;

var $$eyeRay.i$4bv32$2: bv32;

var $$eyeRay.i$5bv32$1: bv32;

var $$eyeRay.i$5bv32$2: bv32;

var $$72$0bv32$1: bv32;

var $$72$0bv32$2: bv32;

var $$72$1bv32$1: bv32;

var $$72$1bv32$2: bv32;

var $$72$2bv32$1: bv32;

var $$72$2bv32$2: bv32;

var $$73$0bv32$1: bv32;

var $$73$0bv32$2: bv32;

var $$73$1bv32$1: bv32;

var $$73$1bv32$2: bv32;

var $$73$2bv32$1: bv32;

var $$73$2bv32$2: bv32;

var $$73$3bv32$1: bv32;

var $$73$3bv32$2: bv32;

var $$74$0bv32$1: bv32;

var $$74$0bv32$2: bv32;

var $$74$1bv32$1: bv32;

var $$74$1bv32$2: bv32;

var $$74$2bv32$1: bv32;

var $$74$2bv32$2: bv32;

var $$74$3bv32$1: bv32;

var $$74$3bv32$2: bv32;

var $$75$0bv32$1: bv32;

var $$75$0bv32$2: bv32;

var $$75$1bv32$1: bv32;

var $$75$1bv32$2: bv32;

var $$75$2bv32$1: bv32;

var $$75$2bv32$2: bv32;

var $$76$0bv32$1: bv32;

var $$76$0bv32$2: bv32;

var $$76$1bv32$1: bv32;

var $$76$1bv32$2: bv32;

var $$76$2bv32$1: bv32;

var $$76$2bv32$2: bv32;

var $$77$0bv32$1: bv32;

var $$77$0bv32$2: bv32;

var $$77$1bv32$1: bv32;

var $$77$1bv32$2: bv32;

var $$77$2bv32$1: bv32;

var $$77$2bv32$2: bv32;

var $$78$0bv32$1: bv32;

var $$78$0bv32$2: bv32;

var $$78$1bv32$1: bv32;

var $$78$1bv32$2: bv32;

var $$78$2bv32$1: bv32;

var $$78$2bv32$2: bv32;

var $$78$3bv32$1: bv32;

var $$78$3bv32$2: bv32;

var $$78$4bv32$1: bv32;

var $$78$4bv32$2: bv32;

var $$78$5bv32$1: bv32;

var $$78$5bv32$2: bv32;

var $$79$0bv32$1: bv32;

var $$79$0bv32$2: bv32;

var $$79$1bv32$1: bv32;

var $$79$1bv32$2: bv32;

var $$79$2bv32$1: bv32;

var $$79$2bv32$2: bv32;

var $$80$0bv32$1: bv32;

var $$80$0bv32$2: bv32;

var $$80$1bv32$1: bv32;

var $$80$1bv32$2: bv32;

var $$80$2bv32$1: bv32;

var $$80$2bv32$2: bv32;

var $$sum.i$0bv32$1: bv32;

var $$sum.i$0bv32$2: bv32;

var $$sum.i$1bv32$1: bv32;

var $$sum.i$1bv32$2: bv32;

var $$sum.i$2bv32$1: bv32;

var $$sum.i$2bv32$2: bv32;

var $$sum.i$3bv32$1: bv32;

var $$sum.i$3bv32$2: bv32;

var $$pos.i$0bv32$1: bv32;

var $$pos.i$0bv32$2: bv32;

var $$pos.i$1bv32$1: bv32;

var $$pos.i$1bv32$2: bv32;

var $$pos.i$2bv32$1: bv32;

var $$pos.i$2bv32$2: bv32;

var $$81$0bv32$1: bv32;

var $$81$0bv32$2: bv32;

var $$81$1bv32$1: bv32;

var $$81$1bv32$2: bv32;

var $$81$2bv32$1: bv32;

var $$81$2bv32$2: bv32;

var $$82$0bv32$1: bv32;

var $$82$0bv32$2: bv32;

var $$82$1bv32$1: bv32;

var $$82$1bv32$2: bv32;

var $$82$2bv32$1: bv32;

var $$82$2bv32$2: bv32;

var $$83$0bv32$1: bv32;

var $$83$0bv32$2: bv32;

var $$83$1bv32$1: bv32;

var $$83$1bv32$2: bv32;

var $$83$2bv32$1: bv32;

var $$83$2bv32$2: bv32;

var $$step.i$0bv32$1: bv32;

var $$step.i$0bv32$2: bv32;

var $$step.i$1bv32$1: bv32;

var $$step.i$1bv32$2: bv32;

var $$step.i$2bv32$1: bv32;

var $$step.i$2bv32$2: bv32;

var $$84$0bv32$1: bv32;

var $$84$0bv32$2: bv32;

var $$84$1bv32$1: bv32;

var $$84$1bv32$2: bv32;

var $$84$2bv32$1: bv32;

var $$84$2bv32$2: bv32;

var $$coord.i$0bv32$1: bv32;

var $$coord.i$0bv32$2: bv32;

var $$coord.i$1bv32$1: bv32;

var $$coord.i$1bv32$2: bv32;

var $$coord.i$2bv32$1: bv32;

var $$coord.i$2bv32$2: bv32;

var $$85$0bv32$1: bv8;

var $$85$0bv32$2: bv8;

var $$85$1bv32$1: bv8;

var $$85$1bv32$2: bv8;

var $$85$2bv32$1: bv8;

var $$85$2bv32$2: bv8;

var $$85$3bv32$1: bv8;

var $$85$3bv32$2: bv8;

var $$85$4bv32$1: bv8;

var $$85$4bv32$2: bv8;

var $$85$5bv32$1: bv8;

var $$85$5bv32$2: bv8;

var $$85$6bv32$1: bv8;

var $$85$6bv32$2: bv8;

var $$85$7bv32$1: bv8;

var $$85$7bv32$2: bv8;

var $$85$8bv32$1: bv8;

var $$85$8bv32$2: bv8;

var $$85$9bv32$1: bv8;

var $$85$9bv32$2: bv8;

var $$85$10bv32$1: bv8;

var $$85$10bv32$2: bv8;

var $$85$11bv32$1: bv8;

var $$85$11bv32$2: bv8;

var $$col.i$0bv32$1: bv32;

var $$col.i$0bv32$2: bv32;

var $$col.i$1bv32$1: bv32;

var $$col.i$1bv32$2: bv32;

var $$col.i$2bv32$1: bv32;

var $$col.i$2bv32$2: bv32;

var $$col.i$3bv32$1: bv32;

var $$col.i$3bv32$2: bv32;

var $$86$0bv32$1: bv32;

var $$86$0bv32$2: bv32;

var $$86$1bv32$1: bv32;

var $$86$1bv32$2: bv32;

var $$86$2bv32$1: bv32;

var $$86$2bv32$2: bv32;

var $$86$3bv32$1: bv32;

var $$86$3bv32$2: bv32;

var $$87$0bv32$1: bv8;

var $$87$0bv32$2: bv8;

var $$87$1bv32$1: bv8;

var $$87$1bv32$2: bv8;

var $$87$2bv32$1: bv8;

var $$87$2bv32$2: bv8;

var $$87$3bv32$1: bv8;

var $$87$3bv32$2: bv8;

var $$87$4bv32$1: bv8;

var $$87$4bv32$2: bv8;

var $$87$5bv32$1: bv8;

var $$87$5bv32$2: bv8;

var $$87$6bv32$1: bv8;

var $$87$6bv32$2: bv8;

var $$87$7bv32$1: bv8;

var $$87$7bv32$2: bv8;

var $$87$8bv32$1: bv8;

var $$87$8bv32$2: bv8;

var $$87$9bv32$1: bv8;

var $$87$9bv32$2: bv8;

var $$87$10bv32$1: bv8;

var $$87$10bv32$2: bv8;

var $$87$11bv32$1: bv8;

var $$87$11bv32$2: bv8;

var $$87$12bv32$1: bv8;

var $$87$12bv32$2: bv8;

var $$87$13bv32$1: bv8;

var $$87$13bv32$2: bv8;

var $$87$14bv32$1: bv8;

var $$87$14bv32$2: bv8;

var $$87$15bv32$1: bv8;

var $$87$15bv32$2: bv8;

var $$87$16bv32$1: bv8;

var $$87$16bv32$2: bv8;

var $$87$17bv32$1: bv8;

var $$87$17bv32$2: bv8;

var $$87$18bv32$1: bv8;

var $$87$18bv32$2: bv8;

var $$87$19bv32$1: bv8;

var $$87$19bv32$2: bv8;

var $$87$20bv32$1: bv8;

var $$87$20bv32$2: bv8;

var $$87$21bv32$1: bv8;

var $$87$21bv32$2: bv8;

var $$87$22bv32$1: bv8;

var $$87$22bv32$2: bv8;

var $$87$23bv32$1: bv8;

var $$87$23bv32$2: bv8;

var $$88$0bv32$1: bv32;

var $$88$0bv32$2: bv32;

var $$88$1bv32$1: bv32;

var $$88$1bv32$2: bv32;

var $$88$2bv32$1: bv32;

var $$88$2bv32$2: bv32;

var $$88$3bv32$1: bv32;

var $$88$3bv32$2: bv32;

var $$89$0bv32$1: bv32;

var $$89$0bv32$2: bv32;

var $$89$1bv32$1: bv32;

var $$89$1bv32$2: bv32;

var $$89$2bv32$1: bv32;

var $$89$2bv32$2: bv32;

var $$89$3bv32$1: bv32;

var $$89$3bv32$2: bv32;

var $$90$0bv32$1: bv32;

var $$90$0bv32$2: bv32;

var $$90$1bv32$1: bv32;

var $$90$1bv32$2: bv32;

var $$90$2bv32$1: bv32;

var $$90$2bv32$2: bv32;

var $$90$3bv32$1: bv32;

var $$90$3bv32$2: bv32;

var $$91$0bv32$1: bv32;

var $$91$0bv32$2: bv32;

var $$91$1bv32$1: bv32;

var $$91$1bv32$2: bv32;

var $$91$2bv32$1: bv32;

var $$91$2bv32$2: bv32;

var $$91$3bv32$1: bv32;

var $$91$3bv32$2: bv32;

var $$92$0bv32$1: bv32;

var $$92$0bv32$2: bv32;

var $$92$1bv32$1: bv32;

var $$92$1bv32$2: bv32;

var $$92$2bv32$1: bv32;

var $$92$2bv32$2: bv32;

var $$93$0bv32$1: bv32;

var $$93$0bv32$2: bv32;

var $$93$1bv32$1: bv32;

var $$93$1bv32$2: bv32;

var $$93$2bv32$1: bv32;

var $$93$2bv32$2: bv32;

var $$93$3bv32$1: bv32;

var $$93$3bv32$2: bv32;

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



const _WATCHED_VALUE_$$volumeTex: bv8;

procedure {:inline 1} _LOG_READ_$$volumeTex(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$volumeTex;



implementation {:inline 1} _LOG_READ_$$volumeTex(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$volumeTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volumeTex == _value then true else _READ_HAS_OCCURRED_$$volumeTex);
    return;
}



procedure _CHECK_READ_$$volumeTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$volumeTex);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$volumeTex: bool;

procedure {:inline 1} _LOG_WRITE_$$volumeTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$volumeTex, _WRITE_READ_BENIGN_FLAG_$$volumeTex;



implementation {:inline 1} _LOG_WRITE_$$volumeTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$volumeTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volumeTex == _value then true else _WRITE_HAS_OCCURRED_$$volumeTex);
    _WRITE_READ_BENIGN_FLAG_$$volumeTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volumeTex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$volumeTex);
    return;
}



procedure _CHECK_WRITE_$$volumeTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volumeTex != _value);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volumeTex != _value);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$volumeTex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$volumeTex;



implementation {:inline 1} _LOG_ATOMIC_$$volumeTex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$volumeTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$volumeTex);
    return;
}



procedure _CHECK_ATOMIC_$$volumeTex(_P: bool, _offset: bv32);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset);
  requires {:source_name "volumeTex"} {:array "$$volumeTex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$volumeTex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$volumeTex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$volumeTex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$volumeTex := (if _P && _WRITE_HAS_OCCURRED_$$volumeTex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$volumeTex);
    return;
}



const _WATCHED_VALUE_$$transferLayerPreintTex: bv8;

procedure {:inline 1} _LOG_READ_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$transferLayerPreintTex;



implementation {:inline 1} _LOG_READ_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$transferLayerPreintTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$transferLayerPreintTex == _value then true else _READ_HAS_OCCURRED_$$transferLayerPreintTex);
    return;
}



procedure _CHECK_READ_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex: bool;

procedure {:inline 1} _LOG_WRITE_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$transferLayerPreintTex, _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex;



implementation {:inline 1} _LOG_WRITE_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$transferLayerPreintTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$transferLayerPreintTex == _value then true else _WRITE_HAS_OCCURRED_$$transferLayerPreintTex);
    _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$transferLayerPreintTex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex);
    return;
}



procedure _CHECK_WRITE_$$transferLayerPreintTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$transferLayerPreintTex != _value);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$transferLayerPreintTex != _value);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$transferLayerPreintTex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex;



implementation {:inline 1} _LOG_ATOMIC_$$transferLayerPreintTex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$transferLayerPreintTex);
    return;
}



procedure _CHECK_ATOMIC_$$transferLayerPreintTex(_P: bool, _offset: bv32);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset);
  requires {:source_name "transferLayerPreintTex"} {:array "$$transferLayerPreintTex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex := (if _P && _WRITE_HAS_OCCURRED_$$transferLayerPreintTex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$transferLayerPreintTex);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
