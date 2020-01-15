(module
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i64 i64 i64 i64)))
  (func $mul256_64bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 256
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 48
    i32.add
    local.get 0
    i64.load
    local.tee 5
    i64.const 0
    local.get 1
    i64.load
    local.tee 4
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 32
    i32.add
    local.get 0
    i64.load offset=8
    local.tee 6
    i64.const 0
    local.get 4
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 96
    i32.add
    local.get 1
    i64.load offset=8
    local.tee 7
    i64.const 0
    local.get 5
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 16
    i32.add
    local.get 0
    i64.load offset=16
    local.tee 8
    i64.const 0
    local.get 4
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 144
    i32.add
    local.get 7
    i64.const 0
    local.get 6
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 80
    i32.add
    local.get 1
    i64.load offset=16
    local.tee 9
    i64.const 0
    local.get 5
    i64.const 0
    call $__multi3
    local.get 3
    local.get 0
    i64.load offset=24
    local.tee 10
    i64.const 0
    local.get 4
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 192
    i32.add
    local.get 7
    i64.const 0
    local.get 8
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 128
    i32.add
    local.get 9
    i64.const 0
    local.get 6
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 64
    i32.add
    local.get 1
    i64.load offset=24
    local.tee 4
    i64.const 0
    local.get 5
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 176
    i32.add
    local.get 9
    i64.const 0
    local.get 8
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 240
    i32.add
    local.get 7
    i64.const 0
    local.get 10
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 112
    i32.add
    local.get 4
    i64.const 0
    local.get 6
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 224
    i32.add
    local.get 9
    i64.const 0
    local.get 10
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 160
    i32.add
    local.get 4
    i64.const 0
    local.get 8
    i64.const 0
    call $__multi3
    local.get 3
    i32.const 208
    i32.add
    local.get 4
    i64.const 0
    local.get 10
    i64.const 0
    call $__multi3
    local.get 2
    local.get 3
    i64.load offset=48
    i64.store
    local.get 2
    local.get 3
    i64.load offset=96
    local.tee 6
    local.get 3
    i64.load offset=32
    local.tee 5
    local.get 3
    i32.const 56
    i32.add
    i64.load
    i64.add
    local.tee 4
    i64.add
    local.tee 7
    i64.store offset=8
    local.get 2
    local.get 3
    i32.const 40
    i32.add
    i64.load
    local.get 4
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 8
    local.get 3
    i64.load offset=16
    i64.add
    local.tee 5
    local.get 3
    i64.load offset=144
    i64.add
    local.tee 4
    local.get 3
    i32.const 104
    i32.add
    i64.load
    local.get 7
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 6
    local.get 3
    i64.load offset=80
    i64.add
    local.tee 7
    i64.store offset=16
    local.get 2
    local.get 3
    i32.const 88
    i32.add
    i64.load
    local.get 7
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 10
    local.get 3
    i64.load offset=128
    i64.add
    local.tee 7
    local.get 3
    i32.const 24
    i32.add
    i64.load
    local.get 5
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 11
    local.get 3
    i64.load
    i64.add
    local.tee 8
    local.get 3
    i64.load offset=192
    i64.add
    local.tee 9
    local.get 3
    i32.const 152
    i32.add
    i64.load
    local.get 4
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 6
    local.get 4
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 12
    i64.add
    local.tee 5
    local.get 3
    i64.load offset=64
    i64.add
    local.tee 4
    i64.store offset=24
    local.get 2
    local.get 3
    i32.const 72
    i32.add
    i64.load
    local.get 4
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 13
    local.get 3
    i64.load offset=112
    i64.add
    local.tee 4
    local.get 3
    i32.const 136
    i32.add
    i64.load
    local.get 7
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 5
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 7
    local.get 3
    i64.load offset=176
    i64.add
    local.tee 5
    local.get 3
    i32.const 8
    i32.add
    i64.load
    local.get 8
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 10
    local.get 3
    i64.load offset=240
    i64.add
    local.tee 6
    local.get 3
    i32.const 200
    i32.add
    i64.load
    local.get 9
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 12
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 8
    i64.add
    local.tee 9
    i64.add
    local.tee 11
    i64.store offset=32
    local.get 2
    local.get 3
    i32.const 120
    i32.add
    i64.load
    local.get 4
    local.get 13
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 11
    local.get 4
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 11
    local.get 3
    i64.load offset=160
    i64.add
    local.tee 4
    local.get 3
    i32.const 248
    i32.add
    i64.load
    local.get 6
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 8
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 8
    local.get 3
    i64.load offset=224
    i64.add
    local.tee 6
    local.get 3
    i32.const 184
    i32.add
    i64.load
    local.get 5
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 9
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 5
    i64.add
    local.tee 7
    i64.store offset=40
    local.get 2
    local.get 3
    i32.const 232
    i32.add
    i64.load
    local.get 6
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 6
    local.get 3
    i64.load offset=208
    i64.add
    local.tee 5
    local.get 3
    i32.const 168
    i32.add
    i64.load
    local.get 4
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 7
    local.get 4
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 4
    i64.store offset=48
    local.get 2
    local.get 3
    i32.const 216
    i32.add
    i64.load
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 4
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.store offset=56
    local.get 3
    i32.const 256
    i32.add
    global.set 0)
  (func $bench_mul256_64bitlimbs (type 1)
    (local i32)
    i32.const 10000
    local.set 0
    loop  ;; label = @1
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1216
      call $mul256_64bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1024
      call $mul256_64bitlimbs
      local.get 0
      i32.const -1
      i32.add
      local.tee 0
      br_if 0 (;@1;)
    end)
  (func $__multi3 (type 2) (param i32 i64 i64 i64 i64)
    (local i64)
    local.get 0
    local.get 4
    local.get 1
    i64.mul
    local.get 2
    local.get 3
    i64.mul
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 4
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 2
    i64.mul
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 3
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 3
    local.get 2
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.get 4
    local.get 1
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 3
    i64.const 32
    i64.shl
    local.get 5
    i64.const 4294967295
    i64.and
    i64.or
    i64.store)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66848))
  (export "memory" (memory 0))
  (export "bench_mul256_64bitlimbs" (func $bench_mul256_64bitlimbs))
  (data (;0;) (i32.const 1024) "\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01"))
