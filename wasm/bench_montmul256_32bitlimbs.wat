(module
  (type (;0;) (func (param i32 i32 i32 i32 i32)))
  (type (;1;) (func))
  (func $montmul256_32bitlimbs (type 0) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 5
    i32.const 56
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 48
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 40
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 32
    i32.add
    local.tee 7
    i64.const 0
    i64.store
    local.get 5
    i32.const 24
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i64.const 0
    i64.store offset=8
    local.get 5
    i64.const 0
    i64.store
    local.get 5
    i32.const 36
    i32.add
    local.set 14
    local.get 1
    i64.load32_u offset=28
    local.set 35
    local.get 1
    i64.load32_u offset=24
    local.set 36
    local.get 1
    i64.load32_u offset=20
    local.set 37
    local.get 1
    i64.load32_u offset=16
    local.set 38
    local.get 1
    i64.load32_u offset=12
    local.set 39
    local.get 1
    i64.load32_u offset=8
    local.set 40
    local.get 1
    i64.load32_u offset=4
    local.set 41
    local.get 3
    i32.load
    local.set 27
    local.get 2
    i32.load offset=28
    local.tee 15
    i64.extend_i32_u
    local.set 42
    local.get 2
    i32.load offset=24
    local.tee 8
    i64.extend_i32_u
    local.set 43
    local.get 2
    i32.load offset=20
    local.tee 9
    i64.extend_i32_u
    local.set 44
    local.get 2
    i32.load offset=16
    local.tee 10
    i64.extend_i32_u
    local.set 45
    local.get 2
    i32.load offset=12
    local.tee 11
    i64.extend_i32_u
    local.set 46
    local.get 2
    i32.load offset=8
    local.tee 12
    i64.extend_i32_u
    local.set 47
    local.get 2
    i32.load offset=4
    local.tee 13
    i64.extend_i32_u
    local.set 48
    local.get 2
    i32.load
    local.tee 16
    i64.extend_i32_u
    local.set 49
    local.get 1
    i32.load
    local.tee 28
    i64.extend_i32_u
    local.set 50
    i32.const 7
    local.set 17
    i32.const 28
    local.set 19
    i32.const 24
    local.set 20
    i32.const 20
    local.set 21
    i32.const 16
    local.set 22
    i32.const 12
    local.set 23
    i32.const 8
    local.set 24
    loop  ;; label = @1
      local.get 5
      local.get 25
      local.tee 26
      i32.const 2
      i32.shl
      local.tee 6
      i32.add
      local.tee 2
      local.get 0
      local.get 6
      i32.add
      i32.load
      local.tee 1
      local.get 28
      i32.mul
      local.get 2
      i32.load
      local.tee 2
      i32.add
      local.get 27
      i32.mul
      i64.extend_i32_u
      local.tee 33
      local.get 49
      i64.mul
      local.tee 31
      local.get 1
      i64.extend_i32_u
      local.tee 34
      local.get 50
      i64.mul
      local.get 2
      i64.extend_i32_u
      i64.add
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 24
        local.set 2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            local.get 2
            i32.add
            local.tee 1
            i32.load
            local.tee 3
            i32.const -1
            i32.ne
            br_if 1 (;@3;)
            local.get 1
            i32.const 0
            i32.store
            local.get 2
            i32.const 4
            i32.add
            local.tee 2
            i32.const 64
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
          unreachable
        end
        local.get 1
        local.get 3
        i32.const 1
        i32.add
        i32.store
      end
      local.get 5
      local.get 26
      i32.const 1
      i32.add
      local.tee 25
      i32.const 2
      i32.shl
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 41
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 48
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 23
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 64
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      local.get 5
      i32.add
      local.tee 6
      i32.const 8
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 40
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 47
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 22
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 64
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 12
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 39
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 46
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 21
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 64
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 16
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 38
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 45
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 20
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 64
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 20
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 37
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 44
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 19
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 64
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 24
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 36
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 31
      local.get 33
      local.get 43
      i64.mul
      i64.add
      local.tee 30
      i64.store32
      local.get 30
      i64.const 32
      i64.shr_u
      local.set 32
      block  ;; label = @2
        local.get 30
        local.get 31
        i64.ge_u
        br_if 0 (;@2;)
        local.get 18
        local.set 2
        loop  ;; label = @3
          local.get 7
          local.get 2
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 32
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 28
      i32.add
      local.tee 2
      local.get 32
      local.get 34
      local.get 35
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 34
      local.get 33
      local.get 42
      i64.mul
      i64.add
      local.tee 33
      i64.store32
      local.get 33
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.set 29
      block  ;; label = @2
        local.get 33
        local.get 34
        i64.ge_u
        br_if 0 (;@2;)
        local.get 26
        i32.const 9
        i32.add
        i32.const 15
        i32.gt_u
        br_if 0 (;@2;)
        local.get 17
        local.set 1
        local.get 14
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.load
          local.tee 3
          i32.const -1
          i32.ne
          if  ;; label = @4
            local.get 2
            local.get 3
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 2
          i32.const 0
          i32.store
          local.get 2
          i32.const 4
          i32.add
          local.set 2
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.const 32
      i32.add
      local.tee 2
      local.get 2
      i32.load
      local.get 29
      i32.add
      i32.store
      local.get 17
      i32.const -1
      i32.add
      local.set 17
      local.get 14
      i32.const 4
      i32.add
      local.set 14
      local.get 18
      i32.const 4
      i32.add
      local.set 18
      local.get 19
      i32.const 4
      i32.add
      local.set 19
      local.get 20
      i32.const 4
      i32.add
      local.set 20
      local.get 21
      i32.const 4
      i32.add
      local.set 21
      local.get 22
      i32.const 4
      i32.add
      local.set 22
      local.get 23
      i32.const 4
      i32.add
      local.set 23
      local.get 24
      i32.const 4
      i32.add
      local.set 24
      local.get 25
      i32.const 8
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 4
    i32.const 24
    i32.add
    local.get 5
    i32.const 56
    i32.add
    i64.load
    i64.store align=4
    local.get 4
    local.get 5
    i64.load offset=32
    i64.store align=4
    local.get 4
    i32.const 16
    i32.add
    local.get 5
    i32.const 48
    i32.add
    i64.load
    i64.store align=4
    local.get 4
    i32.const 8
    i32.add
    local.get 5
    i32.const 40
    i32.add
    i64.load
    i64.store align=4
    block  ;; label = @1
      local.get 4
      i32.load offset=28
      local.tee 5
      local.get 15
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=24
      local.set 2
      block  ;; label = @2
        local.get 5
        local.get 15
        i32.gt_u
        br_if 0 (;@2;)
        local.get 8
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 8
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 9
        local.get 4
        i32.load offset=20
        local.tee 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 9
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 10
        local.get 4
        i32.load offset=16
        local.tee 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 10
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 11
        local.get 4
        i32.load offset=12
        local.tee 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 11
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 12
        local.get 4
        i32.load offset=8
        local.tee 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 12
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 13
        local.get 4
        i32.load offset=4
        local.tee 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 13
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 16
        local.get 4
        i32.load
        i32.gt_u
        br_if 1 (;@1;)
      end
      local.get 4
      local.get 4
      i32.load
      local.tee 1
      local.get 16
      i32.sub
      i32.store
      local.get 4
      local.get 4
      i32.load offset=4
      local.tee 3
      local.get 1
      local.get 16
      i32.lt_u
      local.tee 1
      i32.sub
      local.tee 7
      local.get 13
      i32.sub
      i32.store offset=4
      local.get 4
      local.get 4
      i32.load offset=8
      local.tee 6
      local.get 3
      local.get 1
      i32.lt_u
      local.get 7
      local.get 13
      i32.lt_u
      i32.or
      local.tee 1
      i32.sub
      local.tee 3
      local.get 12
      i32.sub
      i32.store offset=8
      local.get 4
      local.get 4
      i32.load offset=12
      local.tee 7
      local.get 6
      local.get 1
      i32.lt_u
      local.get 3
      local.get 12
      i32.lt_u
      i32.or
      local.tee 1
      i32.sub
      local.tee 3
      local.get 11
      i32.sub
      i32.store offset=12
      local.get 4
      local.get 4
      i32.load offset=16
      local.tee 6
      local.get 7
      local.get 1
      i32.lt_u
      local.get 3
      local.get 11
      i32.lt_u
      i32.or
      local.tee 1
      i32.sub
      local.tee 3
      local.get 10
      i32.sub
      i32.store offset=16
      local.get 4
      local.get 4
      i32.load offset=20
      local.tee 7
      local.get 6
      local.get 1
      i32.lt_u
      local.get 3
      local.get 10
      i32.lt_u
      i32.or
      local.tee 1
      i32.sub
      local.tee 3
      local.get 9
      i32.sub
      i32.store offset=20
      local.get 4
      local.get 2
      local.get 7
      local.get 1
      i32.lt_u
      local.get 3
      local.get 9
      i32.lt_u
      i32.or
      local.tee 1
      i32.sub
      local.tee 3
      local.get 8
      i32.sub
      i32.store offset=24
      local.get 4
      local.get 5
      local.get 15
      i32.sub
      local.get 2
      local.get 1
      i32.lt_u
      local.get 3
      local.get 8
      i32.lt_u
      i32.or
      i32.sub
      i32.store offset=28
    end)
  (func $bench_montmul256_32bitlimbs (type 1)
    (local i32)
    i32.const 10000
    local.set 0
    loop  ;; label = @1
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      i32.const 1024
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1216
      call $montmul256_32bitlimbs
      i32.const 1216
      i32.const 1120
      i32.const 1312
      i32.const 1408
      i32.const 1024
      call $montmul256_32bitlimbs
      local.get 0
      i32.const -1
      i32.add
      local.tee 0
      br_if 0 (;@1;)
    end)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 67040))
  (export "memory" (memory 0))
  (export "bench_montmul256_32bitlimbs" (func $bench_montmul256_32bitlimbs))
  (data (;0;) (i32.const 1024) "\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\01"))
