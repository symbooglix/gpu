type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$input"} {:global} {:elem_width 8} {:source_name "input"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "output"} {:global} $$output: [bv32]bv8;

axiom {:array_info "$$output"} {:global} {:elem_width 8} {:source_name "output"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

var {:source_name "imageSampler"} {:constant} $$imageSampler$1: [bv32]bv32;

var {:source_name "imageSampler"} {:constant} $$imageSampler$2: [bv32]bv32;

axiom {:array_info "$$imageSampler"} {:constant} {:elem_width 32} {:source_name "imageSampler"} {:source_elem_width 32} {:source_dimensions "1"} true;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

procedure {:source_name "image3dCopy"} {:kernel} $image3dCopy();
  requires $$imageSampler$1[0bv32] == 7bv32;
  requires $$imageSampler$2[0bv32] == 7bv32;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
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
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:source_name "image3dCopy"} {:kernel} $image3dCopy()
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
  var $5$1: bv32;
  var $5$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v36$1: bv8;
  var v36$2: bv8;
  var v37$1: bv8;
  var v37$2: bv8;
  var v38$1: bv8;
  var v38$2: bv8;
  var v39$1: bv8;
  var v39$2: bv8;
  var v40$1: bv8;
  var v40$2: bv8;
  var v41$1: bv8;
  var v41$2: bv8;
  var v42$1: bv8;
  var v42$2: bv8;
  var v43$1: bv8;
  var v43$2: bv8;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := $$imageSampler$1[0bv32];
    v2$2 := $$imageSampler$2[0bv32];
    v3$1 := BV32_UGE(v0$1, 1024bv32);
    v3$2 := BV32_UGE(v0$2, 1024bv32);
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
    p0$1 := (if v3$1 then v3$1 else p0$1);
    p0$2 := (if v3$2 then v3$2 else p0$2);
    p1$1 := (if !v3$1 then !v3$1 else p1$1);
    p1$2 := (if !v3$2 then !v3$2 else p1$2);
    $0$1 := (if p0$1 then 1023bv32 else $0$1);
    $0$2 := (if p0$2 then 1023bv32 else $0$2);
    $0$1 := (if p1$1 then v0$1 else $0$1);
    $0$2 := (if p1$2 then v0$2 else $0$2);
    v4$1 := BV32_UGE(v1$1, 1024bv32);
    v4$2 := BV32_UGE(v1$2, 1024bv32);
    p2$1 := (if v4$1 then v4$1 else p2$1);
    p2$2 := (if v4$2 then v4$2 else p2$2);
    p3$1 := (if !v4$1 then !v4$1 else p3$1);
    p3$2 := (if !v4$2 then !v4$2 else p3$2);
    $1$1 := (if p2$1 then 1023bv32 else $1$1);
    $1$2 := (if p2$2 then 1023bv32 else $1$2);
    $1$1 := (if p3$1 then v1$1 else $1$1);
    $1$2 := (if p3$2 then v1$2 else $1$2);
    v5$1 := BV32_UGE(v1$1, 1024bv32);
    v5$2 := BV32_UGE(v1$2, 1024bv32);
    p4$1 := (if v5$1 then v5$1 else p4$1);
    p4$2 := (if v5$2 then v5$2 else p4$2);
    p5$1 := (if !v5$1 then !v5$1 else p5$1);
    p5$2 := (if !v5$2 then !v5$2 else p5$2);
    $2$1 := (if p4$1 then 1023bv32 else $2$1);
    $2$2 := (if p4$2 then 1023bv32 else $2$2);
    $2$1 := (if p5$1 then v1$1 else $2$1);
    $2$2 := (if p5$2 then v1$2 else $2$2);
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    havoc v18$1, v18$2;
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    v22$1 := $$imageSampler$1[0bv32];
    v22$2 := $$imageSampler$2[0bv32];
    v23$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v23$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v24$1 := BV32_SUB(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), BV32_UDIV(BV32_MUL(group_size_y, num_groups_y), 2bv32));
    v24$2 := BV32_SUB(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), BV32_UDIV(BV32_MUL(group_size_y, num_groups_y), 2bv32));
    v25$1 := BV32_UGE(v23$1, 1024bv32);
    v25$2 := BV32_UGE(v23$2, 1024bv32);
    p6$1 := (if v25$1 then v25$1 else p6$1);
    p6$2 := (if v25$2 then v25$2 else p6$2);
    p7$1 := (if !v25$1 then !v25$1 else p7$1);
    p7$2 := (if !v25$2 then !v25$2 else p7$2);
    $3$1 := (if p6$1 then 1023bv32 else $3$1);
    $3$2 := (if p6$2 then 1023bv32 else $3$2);
    $3$1 := (if p7$1 then v23$1 else $3$1);
    $3$2 := (if p7$2 then v23$2 else $3$2);
    v26$1 := BV32_UGE(v24$1, 1024bv32);
    v26$2 := BV32_UGE(v24$2, 1024bv32);
    p8$1 := (if v26$1 then v26$1 else p8$1);
    p8$2 := (if v26$2 then v26$2 else p8$2);
    p9$1 := (if !v26$1 then !v26$1 else p9$1);
    p9$2 := (if !v26$2 then !v26$2 else p9$2);
    $4$1 := (if p8$1 then 1023bv32 else $4$1);
    $4$2 := (if p8$2 then 1023bv32 else $4$2);
    $4$1 := (if p9$1 then v24$1 else $4$1);
    $4$2 := (if p9$2 then v24$2 else $4$2);
    v27$1 := BV32_UGE(v24$1, 1024bv32);
    v27$2 := BV32_UGE(v24$2, 1024bv32);
    p10$1 := (if v27$1 then v27$1 else p10$1);
    p10$2 := (if v27$2 then v27$2 else p10$2);
    p11$1 := (if !v27$1 then !v27$1 else p11$1);
    p11$2 := (if !v27$2 then !v27$2 else p11$2);
    $5$1 := (if p10$1 then 1023bv32 else $5$1);
    $5$2 := (if p10$2 then 1023bv32 else $5$2);
    $5$1 := (if p11$1 then v24$1 else $5$1);
    $5$2 := (if p11$2 then v24$2 else $5$2);
    havoc v28$1, v28$2;
    havoc v29$1, v29$2;
    havoc v30$1, v30$2;
    havoc v31$1, v31$2;
    havoc v32$1, v32$2;
    havoc v33$1, v33$2;
    havoc v34$1, v34$2;
    havoc v35$1, v35$2;
    havoc v36$1, v36$2;
    havoc v37$1, v37$2;
    havoc v38$1, v38$2;
    havoc v39$1, v39$2;
    havoc v40$1, v40$2;
    havoc v41$1, v41$2;
    havoc v42$1, v42$2;
    havoc v43$1, v43$2;
    v44$1 := BV32_ADD(v9$1 ++ v8$1 ++ v7$1 ++ v6$1, v31$1 ++ v30$1 ++ v29$1 ++ v28$1);
    v44$2 := BV32_ADD(v9$2 ++ v8$2 ++ v7$2 ++ v6$2, v31$2 ++ v30$2 ++ v29$2 ++ v28$2);
    v45$1 := BV32_ADD(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v35$1 ++ v34$1 ++ v33$1 ++ v32$1);
    v45$2 := BV32_ADD(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v35$2 ++ v34$2 ++ v33$2 ++ v32$2);
    v46$1 := BV32_ADD(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v39$1 ++ v38$1 ++ v37$1 ++ v36$1);
    v46$2 := BV32_ADD(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v39$2 ++ v38$2 ++ v37$2 ++ v36$2);
    v47$1 := BV32_ADD(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v43$1 ++ v42$1 ++ v41$1 ++ v40$1);
    v47$2 := BV32_ADD(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v43$2 ++ v42$2 ++ v41$2 ++ v40$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$output(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), v44$1[8:0], $$output[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$output(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), v44$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32)] := v44$1[8:0];
    $$output[BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32)] := v44$2[8:0];
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 1bv32), v44$1[16:8], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 1bv32), v44$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 1bv32)] := v44$1[16:8];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 1bv32)] := v44$2[16:8];
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 2bv32), v44$1[24:16], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 2bv32), v44$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 2bv32)] := v44$1[24:16];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 2bv32)] := v44$2[24:16];
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 3bv32), v44$1[32:24], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 3bv32), v44$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 3bv32)] := v44$1[32:24];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 3bv32)] := v44$2[32:24];
    call {:sourceloc} {:sourceloc_num 57} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 4bv32), v45$1[8:0], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 57} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 4bv32), v45$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 4bv32)] := v45$1[8:0];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 4bv32)] := v45$2[8:0];
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 5bv32), v45$1[16:8], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 5bv32), v45$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 5bv32)] := v45$1[16:8];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 5bv32)] := v45$2[16:8];
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 6bv32), v45$1[24:16], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 6bv32), v45$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 6bv32)] := v45$1[24:16];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 6bv32)] := v45$2[24:16];
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 7bv32), v45$1[32:24], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 7bv32), v45$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 7bv32)] := v45$1[32:24];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 7bv32)] := v45$2[32:24];
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 8bv32), v46$1[8:0], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 8bv32), v46$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 8bv32)] := v46$1[8:0];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 8bv32)] := v46$2[8:0];
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 9bv32), v46$1[16:8], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 9bv32), v46$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 9bv32)] := v46$1[16:8];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 9bv32)] := v46$2[16:8];
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 10bv32), v46$1[24:16], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 10bv32), v46$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 10bv32)] := v46$1[24:16];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 10bv32)] := v46$2[24:16];
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 11bv32), v46$1[32:24], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 11bv32), v46$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 11bv32)] := v46$1[32:24];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 11bv32)] := v46$2[32:24];
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 12bv32), v47$1[8:0], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 12bv32), v47$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 12bv32)] := v47$1[8:0];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 12bv32)] := v47$2[8:0];
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 13bv32), v47$1[16:8], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 13bv32), v47$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 13bv32)] := v47$1[16:8];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 13bv32)] := v47$2[16:8];
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 14bv32), v47$1[24:16], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 14bv32), v47$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 14bv32)] := v47$1[24:16];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 14bv32)] := v47$2[24:16];
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 15bv32), v47$1[32:24], $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 15bv32), v47$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 32768bv32), v0$1), 16bv32), 15bv32)] := v47$1[32:24];
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 32768bv32), v0$2), 16bv32), 15bv32)] := v47$2[32:24];
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 512bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$input: bv8;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$output: bv8;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
