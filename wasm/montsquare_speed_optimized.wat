(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32 i32 i32 i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i64 i64 i64)))
  (func $memcpy (type 4) (param i32 i32)
    (local i32)
    i32.const 96
    local.set 2
    loop  ;; label = @1
      local.get 0
      local.get 1
      i64.load
      i64.store
      local.get 1
      i32.const 8
      i32.add
      local.set 1
      local.get 0
      i32.const 8
      i32.add
      local.set 0
      local.get 2
      i32.const -8
      i32.add
      local.tee 2
      i32.const 7
      i32.gt_u
      br_if 0 (;@1;)
    end)
  (func $memset (type 5) (param i32) (result i32)
    (local i32)
    i32.const 384
    local.set 1
    loop  ;; label = @1
      local.get 0
      i64.const 0
      i64.store
      local.get 0
      i32.const 8
      i32.add
      local.set 0
      local.get 1
      i32.const -8
      i32.add
      local.tee 1
      i32.const 7
      i32.gt_u
      br_if 0 (;@1;)
    end
    i32.const 0
    local.tee 1
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 0
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $square256_32bitlimbs (type 0) (param i32 i32)
    (local i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    local.get 0
    i64.load32_u offset=28
    local.set 10
    local.get 0
    i64.load32_u offset=24
    local.set 11
    local.get 0
    i64.load32_u offset=20
    local.set 9
    local.get 0
    i64.load32_u offset=16
    local.set 4
    local.get 0
    i64.load32_u offset=12
    local.set 5
    local.get 0
    i64.load32_u offset=8
    local.set 6
    local.get 0
    i64.load32_u offset=4
    local.set 7
    local.get 1
    local.get 0
    i64.load32_u
    local.tee 2
    local.get 2
    i64.mul
    local.tee 3
    i64.store32
    local.get 1
    local.get 7
    local.get 2
    i64.const 1
    i64.shl
    local.tee 2
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.store32 offset=4
    local.get 1
    local.get 7
    local.get 7
    i64.mul
    local.get 2
    local.get 6
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 8
    i64.store32 offset=8
    local.get 1
    local.get 6
    local.get 7
    i64.const 1
    i64.shl
    local.tee 7
    i64.mul
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.get 2
    local.get 5
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 8
    i64.store32 offset=12
    local.get 1
    local.get 6
    local.get 6
    i64.mul
    local.get 5
    local.get 7
    i64.mul
    local.get 2
    local.get 4
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 8
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 12
    i64.store32 offset=16
    local.get 1
    local.get 5
    local.get 6
    i64.const 1
    i64.shl
    local.tee 6
    i64.mul
    local.get 12
    i64.const 32
    i64.shr_u
    i64.add
    local.get 4
    local.get 7
    i64.mul
    local.get 2
    local.get 9
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 8
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 12
    i64.store32 offset=20
    local.get 1
    local.get 5
    local.get 5
    i64.mul
    local.get 4
    local.get 6
    i64.mul
    local.get 12
    i64.const 32
    i64.shr_u
    i64.add
    local.get 7
    local.get 9
    i64.mul
    local.get 2
    local.get 11
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 8
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 12
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 13
    i64.store32 offset=24
    local.get 1
    local.get 4
    local.get 5
    i64.const 1
    i64.shl
    local.tee 5
    i64.mul
    local.get 13
    i64.const 32
    i64.shr_u
    i64.add
    local.get 6
    local.get 9
    i64.mul
    local.get 12
    i64.const 32
    i64.shr_u
    i64.add
    local.get 7
    local.get 11
    i64.mul
    local.get 2
    local.get 10
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 2
    i64.const 4294967295
    i64.and
    i64.add
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 8
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 12
    i64.store32 offset=28
    local.get 1
    local.get 4
    local.get 4
    i64.mul
    local.get 5
    local.get 9
    i64.mul
    local.get 12
    i64.const 32
    i64.shr_u
    i64.add
    local.get 6
    local.get 11
    i64.mul
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.get 7
    local.get 10
    i64.mul
    local.get 2
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 2
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 7
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 3
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 8
    i64.store32 offset=32
    local.get 1
    local.get 9
    local.get 4
    i64.const 1
    i64.shl
    local.tee 4
    i64.mul
    local.get 8
    i64.const 32
    i64.shr_u
    i64.add
    local.get 5
    local.get 11
    i64.mul
    local.get 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 6
    local.get 10
    i64.mul
    local.get 2
    i64.const 32
    i64.shr_u
    i64.add
    local.get 7
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 2
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 6
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 7
    i64.store32 offset=36
    local.get 1
    local.get 9
    local.get 9
    i64.mul
    local.get 4
    local.get 11
    i64.mul
    local.get 7
    i64.const 32
    i64.shr_u
    i64.add
    local.get 5
    local.get 10
    i64.mul
    local.get 2
    i64.const 32
    i64.shr_u
    i64.add
    local.get 6
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 5
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 2
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 6
    i64.store32 offset=40
    local.get 1
    local.get 11
    local.get 9
    i64.const 1
    i64.shl
    local.tee 9
    i64.mul
    local.get 6
    i64.const 32
    i64.shr_u
    i64.add
    local.get 4
    local.get 10
    i64.mul
    local.get 5
    i64.const 32
    i64.shr_u
    i64.add
    local.get 2
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 4
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 5
    i64.store32 offset=44
    local.get 1
    local.get 11
    local.get 11
    i64.mul
    local.get 9
    local.get 10
    i64.mul
    local.get 4
    i64.const 32
    i64.shr_u
    i64.add
    local.get 5
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 9
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 4
    i64.store32 offset=48
    local.get 1
    local.get 10
    local.get 11
    i64.mul
    i64.const 1
    i64.shl
    local.get 9
    i64.const 32
    i64.shr_u
    i64.add
    local.get 4
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 11
    i64.store32 offset=52
    local.get 1
    local.get 10
    local.get 10
    i64.mul
    local.get 11
    i64.const 32
    i64.shr_u
    i64.add
    local.tee 10
    i64.store32 offset=56
    local.get 1
    local.get 10
    i64.const 32
    i64.shr_u
    i64.store32 offset=60)
  (func $montreduce256_32bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    local.get 0
    i32.const 36
    i32.add
    local.set 9
    i32.const 8
    local.set 10
    loop  ;; label = @1
      local.get 0
      local.get 8
      i32.const 2
      i32.shl
      i32.add
      local.tee 4
      local.get 4
      i32.load
      local.tee 5
      local.get 2
      i32.load
      i32.mul
      local.tee 6
      local.get 1
      i32.load
      i32.mul
      i64.extend_i32_u
      local.get 5
      i64.extend_i32_u
      i64.add
      local.tee 13
      i64.store32
      local.get 0
      local.get 8
      i32.const 1
      i32.add
      local.tee 8
      i32.const 2
      i32.shl
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=4
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 8
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=8
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 12
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=12
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 16
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=16
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 20
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=20
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 24
      i32.add
      local.tee 5
      local.get 5
      i64.load32_u
      local.get 1
      i32.load offset=24
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      local.get 4
      i32.const 28
      i32.add
      local.tee 4
      local.get 4
      i64.load32_u
      local.get 1
      i32.load offset=28
      local.get 6
      i32.mul
      i64.extend_i32_u
      local.get 13
      i64.const 32
      i64.shr_u
      i64.add
      i64.add
      local.tee 13
      i64.store32
      block  ;; label = @2
        local.get 13
        i64.const 12884901888
        i64.and
        i64.eqz
        br_if 0 (;@2;)
        i64.const 1
        local.set 13
        local.get 10
        local.set 6
        local.get 9
        local.set 4
        loop  ;; label = @3
          local.get 6
          i32.const 1
          i32.add
          local.tee 6
          i32.const 15
          i32.gt_u
          br_if 1 (;@2;)
          local.get 4
          local.get 13
          local.get 4
          i64.load32_u
          i64.add
          local.tee 13
          i64.store32
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 13
          i64.const 32
          i64.shr_u
          local.tee 13
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
        end
      end
      local.get 10
      i32.const 1
      i32.add
      local.set 10
      local.get 9
      i32.const 4
      i32.add
      local.set 9
      local.get 8
      i32.const 8
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    local.get 0
    i32.load offset=32
    local.tee 5
    i32.store
    local.get 3
    local.get 0
    i32.load offset=36
    local.tee 2
    i32.store offset=4
    local.get 3
    local.get 0
    i32.load offset=40
    local.tee 4
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=44
    local.tee 9
    i32.store offset=12
    local.get 3
    local.get 0
    i32.load offset=48
    local.tee 10
    i32.store offset=16
    local.get 3
    local.get 0
    i32.load offset=52
    local.tee 6
    i32.store offset=20
    local.get 3
    local.get 0
    i32.load offset=56
    local.tee 8
    i32.store offset=24
    local.get 3
    local.get 0
    i32.load offset=60
    local.tee 0
    i32.store offset=28
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.load offset=28
      local.tee 12
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=24
      local.set 11
      block  ;; label = @2
        local.get 0
        local.get 12
        i32.gt_u
        br_if 0 (;@2;)
        local.get 11
        local.get 8
        i32.gt_u
        br_if 1 (;@1;)
        local.get 11
        local.get 8
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 7
        local.get 6
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 6
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=16
        local.tee 7
        local.get 10
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=12
        local.tee 7
        local.get 9
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 9
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=8
        local.tee 7
        local.get 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.tee 7
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        i32.load
        local.get 5
        i32.gt_u
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 5
      local.get 1
      i32.load
      local.tee 7
      i32.sub
      i32.store
      local.get 3
      local.get 2
      local.get 5
      local.get 7
      i32.lt_u
      i32.sub
      local.get 1
      i32.load offset=4
      i32.sub
      local.tee 5
      i32.store offset=4
      local.get 3
      local.get 4
      local.get 5
      local.get 2
      i32.gt_u
      i32.sub
      local.get 1
      i32.load offset=8
      i32.sub
      local.tee 2
      i32.store offset=8
      local.get 3
      local.get 9
      local.get 2
      local.get 4
      i32.gt_u
      i32.sub
      local.get 1
      i32.load offset=12
      i32.sub
      local.tee 2
      i32.store offset=12
      local.get 3
      local.get 10
      local.get 2
      local.get 9
      i32.gt_u
      i32.sub
      local.get 1
      i32.load offset=16
      i32.sub
      local.tee 2
      i32.store offset=16
      local.get 3
      local.get 6
      local.get 2
      local.get 10
      i32.gt_u
      i32.sub
      local.get 1
      i32.load offset=20
      i32.sub
      local.tee 1
      i32.store offset=20
      local.get 3
      local.get 8
      local.get 1
      local.get 6
      i32.gt_u
      i32.sub
      local.get 11
      i32.sub
      local.tee 1
      i32.store offset=24
      local.get 3
      local.get 0
      local.get 12
      i32.sub
      local.get 1
      local.get 8
      i32.gt_u
      i32.sub
      i32.store offset=28
    end)
  (func $montsquare256_32bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 4
    global.set 0
    local.get 0
    local.get 4
    call $square256_32bitlimbs
    local.get 0
    local.get 4
    local.get 2
    local.get 3
    call $montreduce256_32bitlimbs
    local.get 1
    i32.const 24
    i32.add
    local.get 4
    i32.const 24
    i32.add
    i64.load
    i64.store align=4
    local.get 1
    i32.const 16
    i32.add
    local.get 4
    i32.const 16
    i32.add
    i64.load
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 4
    i64.load offset=8
    i64.store align=4
    local.get 1
    local.get 4
    i64.load
    i64.store align=4
    local.get 4
    i32.const -64
    i32.sub
    global.set 0)
  (func $subtract768_32bitlimbs (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    local.get 2
    local.get 0
    i32.load
    local.tee 3
    local.get 1
    i32.load
    local.tee 4
    i32.sub
    i32.store
    local.get 2
    local.get 0
    i32.load offset=4
    local.tee 5
    local.get 3
    local.get 4
    i32.lt_u
    i32.sub
    local.get 1
    i32.load offset=4
    i32.sub
    local.tee 3
    i32.store offset=4
    local.get 2
    local.get 0
    i32.load offset=8
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=8
    i32.sub
    local.tee 3
    i32.store offset=8
    local.get 2
    local.get 0
    i32.load offset=12
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=12
    i32.sub
    local.tee 3
    i32.store offset=12
    local.get 2
    local.get 0
    i32.load offset=16
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=16
    i32.sub
    local.tee 3
    i32.store offset=16
    local.get 2
    local.get 0
    i32.load offset=20
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=20
    i32.sub
    local.tee 3
    i32.store offset=20
    local.get 2
    local.get 0
    i32.load offset=24
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=24
    i32.sub
    local.tee 3
    i32.store offset=24
    local.get 2
    local.get 0
    i32.load offset=28
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=28
    i32.sub
    local.tee 3
    i32.store offset=28
    local.get 2
    local.get 0
    i32.load offset=32
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=32
    i32.sub
    local.tee 3
    i32.store offset=32
    local.get 2
    local.get 0
    i32.load offset=36
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=36
    i32.sub
    local.tee 3
    i32.store offset=36
    local.get 2
    local.get 0
    i32.load offset=40
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=40
    i32.sub
    local.tee 3
    i32.store offset=40
    local.get 2
    local.get 0
    i32.load offset=44
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=44
    i32.sub
    local.tee 3
    i32.store offset=44
    local.get 2
    local.get 0
    i32.load offset=48
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=48
    i32.sub
    local.tee 3
    i32.store offset=48
    local.get 2
    local.get 0
    i32.load offset=52
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=52
    i32.sub
    local.tee 3
    i32.store offset=52
    local.get 2
    local.get 0
    i32.load offset=56
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=56
    i32.sub
    local.tee 3
    i32.store offset=56
    local.get 2
    local.get 0
    i32.load offset=60
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=60
    i32.sub
    local.tee 3
    i32.store offset=60
    local.get 2
    local.get 0
    i32.load offset=64
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=64
    i32.sub
    local.tee 3
    i32.store offset=64
    local.get 2
    local.get 0
    i32.load offset=68
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=68
    i32.sub
    local.tee 3
    i32.store offset=68
    local.get 2
    local.get 0
    i32.load offset=72
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=72
    i32.sub
    local.tee 3
    i32.store offset=72
    local.get 2
    local.get 0
    i32.load offset=76
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=76
    i32.sub
    local.tee 3
    i32.store offset=76
    local.get 2
    local.get 0
    i32.load offset=80
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=80
    i32.sub
    local.tee 3
    i32.store offset=80
    local.get 2
    local.get 0
    i32.load offset=84
    local.tee 5
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=84
    i32.sub
    local.tee 3
    i32.store offset=84
    local.get 2
    local.get 0
    i32.load offset=88
    local.tee 4
    local.get 3
    local.get 5
    i32.gt_u
    i32.sub
    local.get 1
    i32.load offset=88
    i32.sub
    local.tee 3
    i32.store offset=88
    local.get 2
    local.get 0
    i32.load offset=92
    local.get 1
    i32.load offset=92
    i32.sub
    local.get 3
    local.get 4
    i32.gt_u
    i32.sub
    i32.store offset=92)
  (func $less_than_or_equal768_32bitlimbs (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=92
      local.tee 2
      local.get 1
      i32.load offset=92
      local.tee 3
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=88
        local.tee 2
        local.get 1
        i32.load offset=88
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=84
        local.tee 2
        local.get 1
        i32.load offset=84
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=80
        local.tee 2
        local.get 1
        i32.load offset=80
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=76
        local.tee 2
        local.get 1
        i32.load offset=76
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=72
        local.tee 2
        local.get 1
        i32.load offset=72
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=68
        local.tee 2
        local.get 1
        i32.load offset=68
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=64
        local.tee 2
        local.get 1
        i32.load offset=64
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=60
        local.tee 2
        local.get 1
        i32.load offset=60
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=56
        local.tee 2
        local.get 1
        i32.load offset=56
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=52
        local.tee 2
        local.get 1
        i32.load offset=52
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=48
        local.tee 2
        local.get 1
        i32.load offset=48
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=44
        local.tee 2
        local.get 1
        i32.load offset=44
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=40
        local.tee 2
        local.get 1
        i32.load offset=40
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=36
        local.tee 2
        local.get 1
        i32.load offset=36
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=32
        local.tee 2
        local.get 1
        i32.load offset=32
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=28
        local.tee 2
        local.get 1
        i32.load offset=28
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=24
        local.tee 2
        local.get 1
        i32.load offset=24
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.tee 2
        local.get 1
        i32.load offset=20
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.tee 2
        local.get 1
        i32.load offset=16
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=12
        local.tee 2
        local.get 1
        i32.load offset=12
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=8
        local.tee 2
        local.get 1
        i32.load offset=8
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 2
        local.get 1
        i32.load offset=4
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        i32.const 1
        local.set 4
        local.get 2
        local.get 3
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.get 1
        i32.load
        i32.le_u
        return
      end
      i32.const 1
      local.set 4
    end
    local.get 4)
  (func $square768_32bitlimbs (type 0) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 384
    i32.sub
    local.tee 3
    global.set 0
    local.get 0
    i32.const 4
    i32.add
    local.set 5
    local.get 3
    call $memset
    local.tee 2
    i32.const 8
    i32.or
    local.set 6
    i32.const 23
    local.set 7
    loop  ;; label = @1
      local.get 2
      local.get 4
      i32.const 4
      i32.shl
      i32.add
      local.tee 3
      local.get 3
      i64.load
      local.get 0
      local.get 4
      i32.const 2
      i32.shl
      i32.add
      i64.load32_u
      local.tee 12
      local.get 12
      i64.mul
      i64.add
      local.tee 11
      i64.const 4294967295
      i64.and
      i64.store
      local.get 11
      i64.const 32
      i64.shr_u
      local.set 11
      local.get 4
      i32.const 1
      i32.add
      local.tee 10
      i32.const 23
      i32.le_u
      if  ;; label = @2
        local.get 12
        i64.const 1
        i64.shl
        local.set 12
        local.get 5
        local.set 8
        local.get 7
        local.set 9
        local.get 6
        local.set 3
        loop  ;; label = @3
          local.get 3
          local.get 3
          i64.load
          local.get 11
          i64.add
          local.get 12
          local.get 8
          i64.load32_u
          i64.mul
          i64.add
          local.tee 11
          i64.const 4294967295
          i64.and
          i64.store
          local.get 11
          i64.const 32
          i64.shr_u
          local.set 11
          local.get 8
          i32.const 4
          i32.add
          local.set 8
          local.get 3
          i32.const 8
          i32.add
          local.set 3
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 2
      local.get 4
      i32.const 3
      i32.shl
      i32.add
      i32.const 192
      i32.add
      local.get 11
      i64.store
      local.get 5
      i32.const 4
      i32.add
      local.set 5
      local.get 7
      i32.const -1
      i32.add
      local.set 7
      local.get 6
      i32.const 16
      i32.add
      local.set 6
      local.get 10
      local.tee 4
      i32.const 24
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 1
    local.get 2
    i64.load
    i64.store32
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store32 offset=4
    local.get 1
    local.get 2
    i64.load offset=16
    i64.store32 offset=8
    local.get 1
    local.get 2
    i64.load offset=24
    i64.store32 offset=12
    local.get 1
    local.get 2
    i64.load offset=32
    i64.store32 offset=16
    local.get 1
    local.get 2
    i64.load offset=40
    i64.store32 offset=20
    local.get 1
    local.get 2
    i64.load offset=48
    i64.store32 offset=24
    local.get 1
    local.get 2
    i64.load offset=56
    i64.store32 offset=28
    local.get 1
    local.get 2
    i64.load offset=64
    i64.store32 offset=32
    local.get 1
    local.get 2
    i64.load offset=72
    i64.store32 offset=36
    local.get 1
    local.get 2
    i64.load offset=80
    i64.store32 offset=40
    local.get 1
    local.get 2
    i64.load offset=88
    i64.store32 offset=44
    local.get 1
    local.get 2
    i64.load offset=96
    i64.store32 offset=48
    local.get 1
    local.get 2
    i64.load offset=104
    i64.store32 offset=52
    local.get 1
    local.get 2
    i64.load offset=112
    i64.store32 offset=56
    local.get 1
    local.get 2
    i64.load offset=120
    i64.store32 offset=60
    local.get 1
    local.get 2
    i64.load offset=128
    i64.store32 offset=64
    local.get 1
    local.get 2
    i64.load offset=136
    i64.store32 offset=68
    local.get 1
    local.get 2
    i64.load offset=144
    i64.store32 offset=72
    local.get 1
    local.get 2
    i64.load offset=152
    i64.store32 offset=76
    local.get 1
    local.get 2
    i64.load offset=160
    i64.store32 offset=80
    local.get 1
    local.get 2
    i64.load offset=168
    i64.store32 offset=84
    local.get 1
    local.get 2
    i64.load offset=176
    i64.store32 offset=88
    local.get 1
    local.get 2
    i64.load offset=184
    i64.store32 offset=92
    local.get 1
    local.get 2
    i64.load offset=192
    i64.store32 offset=96
    local.get 1
    local.get 2
    i64.load offset=200
    i64.store32 offset=100
    local.get 1
    local.get 2
    i64.load offset=208
    i64.store32 offset=104
    local.get 1
    local.get 2
    i64.load offset=216
    i64.store32 offset=108
    local.get 1
    local.get 2
    i64.load offset=224
    i64.store32 offset=112
    local.get 1
    local.get 2
    i64.load offset=232
    i64.store32 offset=116
    local.get 1
    local.get 2
    i64.load offset=240
    i64.store32 offset=120
    local.get 1
    local.get 2
    i64.load offset=248
    i64.store32 offset=124
    local.get 1
    local.get 2
    i64.load offset=256
    i64.store32 offset=128
    local.get 1
    local.get 2
    i64.load offset=264
    i64.store32 offset=132
    local.get 1
    local.get 2
    i64.load offset=272
    i64.store32 offset=136
    local.get 1
    local.get 2
    i64.load offset=280
    i64.store32 offset=140
    local.get 1
    local.get 2
    i64.load offset=288
    i64.store32 offset=144
    local.get 1
    local.get 2
    i64.load offset=296
    i64.store32 offset=148
    local.get 1
    local.get 2
    i64.load offset=304
    i64.store32 offset=152
    local.get 1
    local.get 2
    i64.load offset=312
    i64.store32 offset=156
    local.get 1
    local.get 2
    i64.load offset=320
    i64.store32 offset=160
    local.get 1
    local.get 2
    i64.load offset=328
    i64.store32 offset=164
    local.get 1
    local.get 2
    i64.load offset=336
    i64.store32 offset=168
    local.get 1
    local.get 2
    i64.load offset=344
    i64.store32 offset=172
    local.get 1
    local.get 2
    i64.load offset=352
    i64.store32 offset=176
    local.get 1
    local.get 2
    i64.load offset=360
    i64.store32 offset=180
    local.get 1
    local.get 2
    i64.load offset=368
    i64.store32 offset=184
    local.get 1
    local.get 2
    i64.load offset=376
    i64.store32 offset=188
    local.get 2
    i32.const 384
    i32.add
    global.set 0)
  (func $montreduce768_32bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    local.get 0
    i32.const 100
    i32.add
    local.set 6
    i32.const 24
    local.set 8
    local.get 0
    local.set 9
    loop  ;; label = @1
      local.get 2
      i32.load
      local.get 0
      local.get 7
      i32.const 2
      i32.shl
      i32.add
      i32.load
      i32.mul
      local.set 5
      i32.const 0
      local.set 4
      i64.const 0
      local.set 11
      loop  ;; label = @2
        local.get 4
        local.get 9
        i32.add
        local.tee 10
        local.get 10
        i64.load32_u
        local.get 11
        local.get 5
        local.get 1
        local.get 4
        i32.add
        i32.load
        i32.mul
        i64.extend_i32_u
        i64.add
        i64.add
        local.tee 11
        i64.store32
        local.get 11
        i64.const 32
        i64.shr_u
        local.set 11
        local.get 4
        i32.const 4
        i32.add
        local.tee 4
        i32.const 96
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 8
      local.set 5
      local.get 6
      local.set 4
      block  ;; label = @2
        local.get 11
        i64.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 47
          i32.gt_u
          br_if 1 (;@2;)
          local.get 4
          local.get 11
          local.get 4
          i64.load32_u
          i64.add
          local.tee 11
          i64.store32
          local.get 4
          i32.const 4
          i32.add
          local.set 4
          local.get 11
          i64.const 32
          i64.shr_u
          local.tee 11
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.const 1
      i32.add
      local.set 8
      local.get 6
      i32.const 4
      i32.add
      local.set 6
      local.get 9
      i32.const 4
      i32.add
      local.set 9
      local.get 7
      i32.const 1
      i32.add
      local.tee 7
      i32.const 24
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    local.get 0
    i32.load offset=96
    i32.store
    local.get 3
    local.get 0
    i32.load offset=100
    i32.store offset=4
    local.get 3
    local.get 0
    i32.load offset=104
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=108
    i32.store offset=12
    local.get 3
    local.get 0
    i32.load offset=112
    i32.store offset=16
    local.get 3
    local.get 0
    i32.load offset=116
    i32.store offset=20
    local.get 3
    local.get 0
    i32.load offset=120
    i32.store offset=24
    local.get 3
    local.get 0
    i32.load offset=124
    i32.store offset=28
    local.get 3
    local.get 0
    i32.load offset=128
    i32.store offset=32
    local.get 3
    local.get 0
    i32.load offset=132
    i32.store offset=36
    local.get 3
    local.get 0
    i32.load offset=136
    i32.store offset=40
    local.get 3
    local.get 0
    i32.load offset=140
    i32.store offset=44
    local.get 3
    local.get 0
    i32.load offset=144
    i32.store offset=48
    local.get 3
    local.get 0
    i32.load offset=148
    i32.store offset=52
    local.get 3
    local.get 0
    i32.load offset=152
    i32.store offset=56
    local.get 3
    local.get 0
    i32.load offset=156
    i32.store offset=60
    local.get 3
    local.get 0
    i32.load offset=160
    i32.store offset=64
    local.get 3
    local.get 0
    i32.load offset=164
    i32.store offset=68
    local.get 3
    local.get 0
    i32.load offset=168
    i32.store offset=72
    local.get 3
    local.get 0
    i32.load offset=172
    i32.store offset=76
    local.get 3
    local.get 0
    i32.load offset=176
    i32.store offset=80
    local.get 3
    local.get 0
    i32.load offset=180
    i32.store offset=84
    local.get 3
    local.get 0
    i32.load offset=184
    i32.store offset=88
    local.get 3
    local.get 0
    i32.load offset=188
    i32.store offset=92
    local.get 1
    local.get 3
    call $less_than_or_equal768_32bitlimbs
    if  ;; label = @1
      local.get 3
      local.get 1
      local.get 3
      call $subtract768_32bitlimbs
    end)
  (func $montsquare768_32bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    local.get 4
    call $square768_32bitlimbs
    local.get 0
    local.get 4
    local.get 2
    local.get 3
    call $montreduce768_32bitlimbs
    local.get 1
    local.get 4
    call $memcpy
    local.get 4
    i32.const 192
    i32.add
    global.set 0)
  (func $montreduce256_64bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32 i32 i64 i64 i64 i64 i64 i64 i64)
    local.get 0
    local.get 0
    i64.load
    local.tee 8
    local.get 2
    i64.load
    i64.mul
    local.tee 6
    local.get 1
    i64.load
    i64.mul
    local.tee 9
    local.get 8
    i64.add
    local.tee 8
    i64.store
    local.get 0
    local.get 8
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    local.tee 10
    local.get 1
    i64.load offset=8
    local.get 6
    i64.mul
    i64.add
    local.tee 9
    local.get 0
    i64.load offset=8
    i64.add
    local.tee 8
    i64.store offset=8
    local.get 0
    local.get 9
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    local.get 8
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 7
    local.get 1
    i64.load offset=16
    local.get 6
    i64.mul
    i64.add
    local.tee 10
    local.get 0
    i64.load offset=16
    i64.add
    local.tee 9
    i64.store offset=16
    local.get 0
    local.get 10
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    local.get 9
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 7
    local.get 1
    i64.load offset=24
    local.get 6
    i64.mul
    i64.add
    local.tee 6
    local.get 0
    i64.load offset=24
    i64.add
    local.tee 10
    i64.store offset=24
    block  ;; label = @1
      local.get 6
      local.get 7
      i64.lt_u
      i64.extend_i32_u
      local.get 10
      local.get 6
      i64.lt_u
      i64.extend_i32_u
      i64.add
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 40
      i32.add
      local.set 4
      i64.const 1
      local.set 6
      i32.const 4
      local.set 5
      loop  ;; label = @2
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.const 7
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 6
        local.get 4
        i64.load
        i64.add
        local.tee 7
        i64.store
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        local.get 7
        local.get 6
        i64.lt_u
        i64.extend_i32_u
        i64.const 0
        i64.add
        local.tee 6
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 8
    local.get 2
    i64.load
    local.get 8
    i64.mul
    local.tee 6
    local.get 1
    i64.load
    i64.mul
    i64.add
    local.tee 11
    i64.store offset=8
    local.get 0
    local.get 9
    local.get 1
    i64.load offset=8
    local.get 6
    i64.mul
    i64.add
    local.tee 7
    local.get 11
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 8
    i64.store offset=16
    local.get 0
    local.get 10
    local.get 1
    i64.load offset=16
    local.get 6
    i64.mul
    i64.add
    local.tee 11
    local.get 7
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    local.get 8
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 9
    i64.store offset=24
    local.get 0
    local.get 0
    i64.load offset=32
    local.tee 7
    local.get 1
    i64.load offset=24
    local.get 6
    i64.mul
    i64.add
    local.tee 6
    local.get 11
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    local.get 9
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 10
    i64.store offset=32
    block  ;; label = @1
      local.get 6
      local.get 7
      i64.lt_u
      i64.extend_i32_u
      local.get 10
      local.get 6
      i64.lt_u
      i64.extend_i32_u
      i64.add
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 48
      i32.add
      local.set 4
      i64.const 1
      local.set 6
      i32.const 5
      local.set 5
      loop  ;; label = @2
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.const 7
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 6
        local.get 4
        i64.load
        i64.add
        local.tee 7
        i64.store
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        local.get 7
        local.get 6
        i64.lt_u
        i64.extend_i32_u
        i64.const 0
        i64.add
        local.tee 6
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 8
    local.get 2
    i64.load
    local.get 8
    i64.mul
    local.tee 6
    local.get 1
    i64.load
    i64.mul
    i64.add
    local.tee 11
    i64.store offset=16
    local.get 0
    local.get 9
    local.get 1
    i64.load offset=8
    local.get 6
    i64.mul
    i64.add
    local.tee 7
    local.get 11
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 8
    i64.store offset=24
    local.get 0
    local.get 10
    local.get 1
    i64.load offset=16
    local.get 6
    i64.mul
    i64.add
    local.tee 11
    local.get 7
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    local.get 8
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 9
    i64.store offset=32
    local.get 0
    local.get 0
    i64.load offset=40
    local.tee 7
    local.get 1
    i64.load offset=24
    local.get 6
    i64.mul
    i64.add
    local.tee 6
    local.get 11
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    local.get 9
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 10
    i64.store offset=40
    block  ;; label = @1
      local.get 6
      local.get 7
      i64.lt_u
      i64.extend_i32_u
      local.get 10
      local.get 6
      i64.lt_u
      i64.extend_i32_u
      i64.add
      i64.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 56
      i32.add
      local.set 4
      i64.const 1
      local.set 6
      i32.const 6
      local.set 5
      loop  ;; label = @2
        local.get 5
        i32.const 1
        i32.add
        local.tee 5
        i32.const 7
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 6
        local.get 4
        i64.load
        i64.add
        local.tee 7
        i64.store
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        local.get 7
        local.get 6
        i64.lt_u
        i64.extend_i32_u
        i64.const 0
        i64.add
        local.tee 6
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 8
    local.get 2
    i64.load
    local.get 8
    i64.mul
    local.tee 7
    local.get 1
    i64.load
    i64.mul
    i64.add
    local.tee 6
    i64.store offset=24
    local.get 0
    local.get 9
    local.get 1
    i64.load offset=8
    local.get 7
    i64.mul
    i64.add
    local.tee 11
    local.get 6
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 6
    i64.store offset=32
    local.get 0
    local.get 10
    local.get 1
    i64.load offset=16
    local.get 7
    i64.mul
    i64.add
    local.tee 8
    local.get 11
    local.get 9
    i64.lt_u
    i64.extend_i32_u
    local.get 6
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 9
    i64.store offset=40
    local.get 0
    local.get 0
    i64.load offset=48
    local.get 1
    i64.load offset=24
    local.get 7
    i64.mul
    i64.add
    local.get 8
    local.get 10
    i64.lt_u
    i64.extend_i32_u
    local.get 9
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    i64.store offset=48
    local.get 3
    local.get 6
    i64.store
    local.get 3
    local.get 0
    i64.load offset=40
    local.tee 8
    i64.store offset=8
    local.get 3
    local.get 0
    i64.load offset=48
    local.tee 9
    i64.store offset=16
    local.get 3
    local.get 0
    i64.load offset=56
    local.tee 10
    i64.store offset=24
    block  ;; label = @1
      local.get 10
      local.get 1
      i64.load offset=24
      local.tee 11
      i64.lt_u
      br_if 0 (;@1;)
      local.get 1
      i64.load offset=16
      local.set 7
      block  ;; label = @2
        local.get 10
        local.get 11
        i64.gt_u
        br_if 0 (;@2;)
        local.get 7
        local.get 9
        i64.gt_u
        br_if 1 (;@1;)
        local.get 7
        local.get 9
        i64.lt_u
        br_if 0 (;@2;)
        local.get 1
        i64.load offset=8
        local.tee 12
        local.get 8
        i64.gt_u
        br_if 1 (;@1;)
        local.get 12
        local.get 8
        i64.lt_u
        br_if 0 (;@2;)
        local.get 1
        i64.load
        local.get 6
        i64.gt_u
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 6
      local.get 1
      i64.load
      local.tee 12
      i64.sub
      i64.store
      local.get 3
      local.get 8
      local.get 12
      local.get 6
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 1
      i64.load offset=8
      i64.sub
      local.tee 6
      i64.store offset=8
      local.get 3
      local.get 9
      local.get 6
      local.get 8
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 7
      i64.sub
      local.tee 6
      i64.store offset=16
      local.get 3
      local.get 10
      local.get 11
      i64.sub
      local.get 6
      local.get 9
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      i64.store offset=24
    end)
  (func $montsquare256_64bitlimbs (type 1) (param i32 i32 i32 i32)
    (local i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 224
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    i32.const 48
    i32.add
    local.get 0
    i64.load
    local.tee 8
    i64.const 1
    i64.shl
    local.tee 6
    local.get 8
    i64.const 63
    i64.shr_u
    local.tee 9
    local.get 0
    i64.load offset=8
    local.tee 7
    call $__multi3
    local.get 4
    i32.const 32
    i32.add
    local.get 6
    local.get 9
    local.get 0
    i64.load offset=16
    local.tee 5
    call $__multi3
    local.get 4
    i32.const 16
    i32.add
    local.get 6
    local.get 9
    local.get 0
    i64.load offset=24
    local.tee 6
    call $__multi3
    local.get 4
    i32.const 80
    i32.add
    local.get 7
    i64.const 1
    i64.shl
    local.tee 9
    local.get 7
    i64.const 63
    i64.shr_u
    local.tee 10
    local.get 6
    call $__multi3
    local.get 4
    i32.const 96
    i32.add
    local.get 9
    local.get 10
    local.get 5
    call $__multi3
    local.get 4
    i32.const 128
    i32.add
    local.get 5
    i64.const 0
    local.get 6
    call $__multi3
    local.get 4
    local.get 8
    i64.const 0
    local.get 8
    call $__multi3
    local.get 4
    i32.const -64
    i32.sub
    local.get 7
    i64.const 0
    local.get 7
    call $__multi3
    local.get 4
    i32.const 112
    i32.add
    local.get 5
    i64.const 0
    local.get 5
    call $__multi3
    local.get 4
    i32.const 144
    i32.add
    local.get 6
    i64.const 0
    local.get 6
    call $__multi3
    local.get 4
    local.get 4
    i64.load
    i64.store offset=160
    local.get 4
    local.get 4
    i32.const 8
    i32.add
    i64.load
    local.tee 7
    local.get 4
    i64.load offset=48
    i64.add
    local.tee 5
    i64.store offset=168
    local.get 4
    i32.const 40
    i32.add
    i64.load
    local.set 6
    local.get 4
    i64.load offset=16
    local.set 8
    local.get 4
    i32.const 24
    i32.add
    i64.load
    local.set 9
    local.get 4
    i64.load offset=80
    local.set 10
    local.get 4
    i32.const 88
    i32.add
    i64.load
    local.set 12
    local.get 4
    local.get 4
    i32.const 56
    i32.add
    i64.load
    local.get 5
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 11
    local.get 4
    i64.load offset=32
    i64.add
    local.tee 7
    local.get 4
    i64.load offset=64
    i64.add
    local.tee 5
    i64.store offset=176
    local.get 4
    i32.const 104
    i32.add
    i64.load
    local.set 13
    local.get 4
    local.get 4
    i32.const 72
    i32.add
    i64.load
    local.get 5
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 14
    local.get 4
    i64.load offset=96
    i64.add
    local.tee 5
    local.get 8
    local.get 6
    local.get 7
    local.get 11
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 6
    i64.add
    local.tee 8
    i64.add
    local.tee 11
    i64.store offset=184
    local.get 4
    i64.load offset=128
    local.set 7
    local.get 4
    i32.const 136
    i32.add
    i64.load
    local.set 15
    local.get 4
    local.get 10
    local.get 9
    local.get 8
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.tee 8
    i64.add
    local.tee 6
    local.get 11
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    local.get 13
    local.get 5
    local.get 14
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    i64.add
    local.tee 5
    local.get 4
    i64.load offset=112
    i64.add
    local.tee 9
    i64.store offset=192
    local.get 4
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    local.get 12
    local.get 6
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 8
    local.get 7
    i64.const 1
    i64.shl
    i64.add
    local.tee 6
    local.get 4
    i32.const 120
    i32.add
    i64.load
    local.get 9
    local.get 5
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.add
    local.tee 5
    i64.store offset=200
    local.get 4
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    local.get 6
    local.get 8
    i64.lt_u
    i64.extend_i32_u
    local.get 15
    i64.const 1
    i64.shl
    local.get 7
    i64.const 63
    i64.shr_u
    i64.or
    i64.add
    i64.add
    local.tee 7
    local.get 4
    i64.load offset=144
    i64.add
    local.tee 5
    i64.store offset=208
    local.get 4
    local.get 4
    i32.const 152
    i32.add
    i64.load
    local.get 5
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    i64.store offset=216
    local.get 0
    local.get 4
    i32.const 160
    i32.add
    local.get 2
    local.get 3
    call $montreduce256_64bitlimbs
    local.get 1
    i32.const 24
    i32.add
    local.get 4
    i64.load offset=184
    i64.store
    local.get 1
    i32.const 16
    i32.add
    local.get 4
    i64.load offset=176
    i64.store
    local.get 1
    i32.const 8
    i32.add
    local.get 4
    i64.load offset=168
    i64.store
    local.get 1
    local.get 4
    i64.load offset=160
    i64.store
    local.get 4
    i32.const 224
    i32.add
    global.set 0)
  (func $__multi3 (type 6) (param i32 i64 i64 i64)
    (local i64 i64)
    local.get 0
    local.get 2
    local.get 3
    i64.mul
    i64.const 0
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 2
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
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
    local.get 4
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 1
    local.get 2
    i64.mul
    local.get 3
    i64.const 4294967295
    i64.and
    i64.add
    local.tee 1
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 5
    i64.const 4294967295
    i64.and
    local.get 1
    i64.const 32
    i64.shl
    i64.or
    i64.store)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 66560))
  (global (;2;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "montsquare256_32bitlimbs" (func $montsquare256_32bitlimbs))
  (export "montsquare768_32bitlimbs" (func $montsquare768_32bitlimbs))
  (export "montsquare256_64bitlimbs" (func $montsquare256_64bitlimbs)))
