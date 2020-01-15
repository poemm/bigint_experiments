(module
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func))
  (func $mul256_32bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    local.get 2
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 56
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 48
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 40
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 32
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 24
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 16
    i32.add
    i64.const 0
    i64.store align=4
    local.get 2
    i32.const 8
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0
    i64.load32_u offset=28
    local.set 13
    local.get 0
    i64.load32_u offset=24
    local.set 14
    local.get 0
    i64.load32_u offset=20
    local.set 15
    local.get 0
    i64.load32_u offset=16
    local.set 16
    local.get 0
    i64.load32_u offset=12
    local.set 17
    local.get 0
    i64.load32_u offset=8
    local.set 18
    local.get 0
    i64.load32_u offset=4
    local.set 19
    local.get 0
    i64.load32_u
    local.set 20
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      local.tee 0
      local.get 1
      local.get 3
      i32.add
      i64.load32_u
      local.tee 4
      local.get 20
      i64.mul
      local.get 5
      i64.const 4294967295
      i64.and
      i64.add
      local.tee 5
      i64.store32
      local.get 0
      i32.const 4
      i32.add
      local.get 4
      local.get 19
      i64.mul
      local.get 11
      i64.const 4294967295
      i64.and
      i64.add
      local.get 5
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 5
      i64.store32
      local.get 0
      i32.const 8
      i32.add
      local.get 4
      local.get 18
      i64.mul
      local.get 10
      i64.const 4294967295
      i64.and
      i64.add
      local.get 5
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 11
      i64.store32
      local.get 0
      i32.const 12
      i32.add
      local.get 4
      local.get 17
      i64.mul
      local.get 9
      i64.const 4294967295
      i64.and
      i64.add
      local.get 11
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 10
      i64.store32
      local.get 0
      i32.const 16
      i32.add
      local.get 4
      local.get 16
      i64.mul
      local.get 8
      i64.const 4294967295
      i64.and
      i64.add
      local.get 10
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 9
      i64.store32
      local.get 0
      i32.const 20
      i32.add
      local.get 4
      local.get 15
      i64.mul
      local.get 7
      i64.const 4294967295
      i64.and
      i64.add
      local.get 9
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 8
      i64.store32
      local.get 0
      i32.const 24
      i32.add
      local.get 4
      local.get 14
      i64.mul
      local.get 6
      i64.const 4294967295
      i64.and
      i64.add
      local.get 8
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 7
      i64.store32
      local.get 0
      i32.const 28
      i32.add
      local.get 4
      local.get 13
      i64.mul
      local.get 12
      i64.add
      local.get 7
      i64.const 32
      i64.shr_u
      i64.add
      local.tee 6
      i64.store32
      local.get 0
      i32.const 32
      i32.add
      local.get 6
      i64.const 32
      i64.shr_u
      local.tee 12
      i64.store32
      local.get 3
      i32.const 4
      i32.add
      local.tee 3
      i32.const 32
      i32.ne
      br_if 0 (;@1;)
    end)
  (func $bench_mul256_32bitlimbs (type 1)
    (local i32)
    i32.const 10000
    local.set 0
    loop  ;; label = @1
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_32bitlimbs
      local.get 0
      i32.const -1
      i32.add
      local.tee 0
      br_if 0 (;@1;)
    end)
  (memory (;0;) 2)
  (export "memory" (memory 0))
  (export "bench_mul256_32bitlimbs" (func $bench_mul256_32bitlimbs))
  (data (;0;) (i32.const 1024) "\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01"))
