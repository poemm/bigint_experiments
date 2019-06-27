(module
  (type (;0;) (func (param i32 i32 i32 i32 i32)))
  (type (;1;) (func (param i32 i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32) (result i64)))
  (type (;5;) (func (param i32 i64 i64 i64 i64)))
  (func $montmul256_32bitlimbs (type 0) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i32 i32 i64 i32 i64 i32 i64 i32 i64 i32 i64 i32 i64 i32 i64 i32 i64 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i32 i32)
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
    local.tee 6
    i64.const 0
    i64.store
    local.get 5
    i32.const 24
    i32.add
    local.tee 7
    i64.const 0
    i64.store
    local.get 5
    i32.const 16
    i32.add
    local.tee 8
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
    local.set 9
    local.get 5
    i32.const 28
    i32.add
    local.set 10
    local.get 5
    i32.const 20
    i32.add
    local.set 11
    local.get 5
    i32.const 12
    i32.or
    local.set 12
    local.get 5
    i32.const 8
    i32.or
    local.set 13
    local.get 1
    i64.load32_u offset=28
    local.set 14
    local.get 1
    i64.load32_u offset=24
    local.set 15
    local.get 1
    i64.load32_u offset=20
    local.set 16
    local.get 1
    i64.load32_u offset=16
    local.set 17
    local.get 1
    i64.load32_u offset=12
    local.set 18
    local.get 1
    i64.load32_u offset=8
    local.set 19
    local.get 1
    i64.load32_u offset=4
    local.set 20
    local.get 3
    i32.load
    local.set 21
    local.get 2
    i32.load offset=28
    local.tee 22
    i64.extend_i32_u
    local.set 23
    local.get 2
    i32.load offset=24
    local.tee 24
    i64.extend_i32_u
    local.set 25
    local.get 2
    i32.load offset=20
    local.tee 26
    i64.extend_i32_u
    local.set 27
    local.get 2
    i32.load offset=16
    local.tee 28
    i64.extend_i32_u
    local.set 29
    local.get 2
    i32.load offset=12
    local.tee 30
    i64.extend_i32_u
    local.set 31
    local.get 2
    i32.load offset=8
    local.tee 32
    i64.extend_i32_u
    local.set 33
    local.get 2
    i32.load offset=4
    local.tee 34
    i64.extend_i32_u
    local.set 35
    local.get 2
    i32.load
    local.tee 36
    i64.extend_i32_u
    local.set 37
    local.get 1
    i32.load
    local.tee 38
    i64.extend_i32_u
    local.set 39
    i32.const 3
    local.set 40
    i32.const 5
    local.set 41
    i32.const 6
    local.set 42
    i32.const 7
    local.set 43
    i32.const 9
    local.set 44
    i32.const 8
    local.set 45
    i32.const 4
    local.set 46
    i32.const 2
    local.set 47
    i32.const 0
    local.set 48
    loop  ;; label = @1
      local.get 5
      local.get 48
      local.tee 49
      i32.const 2
      i32.shl
      local.tee 2
      i32.add
      local.tee 3
      local.get 0
      local.get 2
      i32.add
      i32.load
      local.tee 2
      local.get 38
      i32.mul
      local.get 3
      i32.load
      local.tee 1
      i32.add
      local.get 21
      i32.mul
      i64.extend_i32_u
      local.tee 50
      local.get 37
      i64.mul
      local.tee 51
      local.get 2
      i64.extend_i32_u
      local.tee 52
      local.get 39
      i64.mul
      local.get 1
      i64.extend_i32_u
      i64.add
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 47
        local.set 1
        local.get 13
        local.set 2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.ne
            br_if 1 (;@3;)
            local.get 2
            i32.const 0
            i32.store
            local.get 2
            i32.const 4
            i32.add
            local.set 2
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 2
        local.get 55
        i32.const 1
        i32.add
        i32.store
      end
      local.get 5
      local.get 49
      i32.const 1
      i32.add
      local.tee 48
      i32.const 2
      i32.shl
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 20
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 35
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 40
        local.set 1
        local.get 12
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 8
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 19
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 33
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 46
        local.set 1
        local.get 8
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 12
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 18
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 31
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 41
        local.set 1
        local.get 11
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 16
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 17
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 29
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 42
        local.set 1
        local.get 7
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 20
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 16
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 27
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 43
        local.set 1
        local.get 10
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 24
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 15
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 51
      local.get 50
      local.get 25
      i64.mul
      i64.add
      local.tee 53
      i64.store32
      local.get 53
      i64.const 32
      i64.shr_u
      local.set 54
      block  ;; label = @2
        local.get 53
        local.get 51
        i64.ge_u
        br_if 0 (;@2;)
        local.get 45
        local.set 1
        local.get 6
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 28
      i32.add
      local.tee 2
      local.get 54
      local.get 52
      local.get 14
      i64.mul
      i64.add
      local.get 2
      i64.load32_u
      i64.add
      local.tee 52
      local.get 50
      local.get 23
      i64.mul
      i64.add
      local.tee 50
      i64.store32
      local.get 50
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.set 56
      block  ;; label = @2
        local.get 50
        local.get 52
        i64.ge_u
        br_if 0 (;@2;)
        local.get 49
        i32.const 9
        i32.add
        i32.const 15
        i32.gt_u
        br_if 0 (;@2;)
        local.get 44
        local.set 1
        local.get 9
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load
            local.tee 55
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            local.get 55
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
          i32.const 1
          i32.add
          local.tee 1
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 32
      i32.add
      local.tee 2
      local.get 2
      i32.load
      local.get 56
      i32.add
      i32.store
      local.get 44
      i32.const 1
      i32.add
      local.set 44
      local.get 9
      i32.const 4
      i32.add
      local.set 9
      local.get 45
      i32.const 1
      i32.add
      local.set 45
      local.get 6
      i32.const 4
      i32.add
      local.set 6
      local.get 43
      i32.const 1
      i32.add
      local.set 43
      local.get 10
      i32.const 4
      i32.add
      local.set 10
      local.get 42
      i32.const 1
      i32.add
      local.set 42
      local.get 7
      i32.const 4
      i32.add
      local.set 7
      local.get 41
      i32.const 1
      i32.add
      local.set 41
      local.get 11
      i32.const 4
      i32.add
      local.set 11
      local.get 46
      i32.const 1
      i32.add
      local.set 46
      local.get 8
      i32.const 4
      i32.add
      local.set 8
      local.get 40
      i32.const 1
      i32.add
      local.set 40
      local.get 12
      i32.const 4
      i32.add
      local.set 12
      local.get 47
      i32.const 1
      i32.add
      local.set 47
      local.get 13
      i32.const 4
      i32.add
      local.set 13
      local.get 48
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
      local.tee 2
      local.get 22
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=24
      local.set 1
      block  ;; label = @2
        local.get 2
        local.get 22
        i32.gt_u
        br_if 0 (;@2;)
        local.get 24
        local.get 1
        i32.gt_u
        br_if 1 (;@1;)
        local.get 24
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 26
        local.get 4
        i32.load offset=20
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 26
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 28
        local.get 4
        i32.load offset=16
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 28
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 30
        local.get 4
        i32.load offset=12
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 30
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 32
        local.get 4
        i32.load offset=8
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 32
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 34
        local.get 4
        i32.load offset=4
        local.tee 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 34
        local.get 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 36
        local.get 4
        i32.load
        i32.gt_u
        br_if 1 (;@1;)
      end
      local.get 4
      local.get 4
      i32.load
      local.tee 3
      local.get 36
      i32.sub
      i32.store
      local.get 4
      local.get 4
      i32.load offset=4
      local.tee 55
      local.get 3
      local.get 36
      i32.lt_u
      i32.sub
      local.get 34
      i32.sub
      local.tee 3
      i32.store offset=4
      local.get 4
      local.get 4
      i32.load offset=8
      local.tee 48
      local.get 3
      local.get 55
      i32.gt_u
      i32.sub
      local.get 32
      i32.sub
      local.tee 3
      i32.store offset=8
      local.get 4
      local.get 4
      i32.load offset=12
      local.tee 55
      local.get 3
      local.get 48
      i32.gt_u
      i32.sub
      local.get 30
      i32.sub
      local.tee 3
      i32.store offset=12
      local.get 4
      local.get 4
      i32.load offset=16
      local.tee 48
      local.get 3
      local.get 55
      i32.gt_u
      i32.sub
      local.get 28
      i32.sub
      local.tee 3
      i32.store offset=16
      local.get 4
      local.get 4
      i32.load offset=20
      local.tee 55
      local.get 3
      local.get 48
      i32.gt_u
      i32.sub
      local.get 26
      i32.sub
      local.tee 3
      i32.store offset=20
      local.get 4
      local.get 1
      local.get 3
      local.get 55
      i32.gt_u
      i32.sub
      local.get 24
      i32.sub
      local.tee 3
      i32.store offset=24
      local.get 4
      local.get 2
      local.get 22
      i32.sub
      local.get 3
      local.get 1
      i32.gt_u
      i32.sub
      i32.store offset=28
    end)
  (func $montmul256_64bitlimbs (type 0) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 184
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 176
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i32.const 168
    i32.add
    local.tee 6
    i64.const 0
    i64.store
    local.get 5
    i32.const 128
    i32.add
    i32.const 32
    i32.add
    local.tee 7
    i64.const 0
    i64.store
    local.get 5
    i32.const 128
    i32.add
    i32.const 24
    i32.add
    local.tee 8
    i64.const 0
    i64.store
    local.get 5
    i32.const 128
    i32.add
    i32.const 16
    i32.add
    local.tee 9
    i64.const 0
    i64.store
    local.get 5
    i64.const 0
    i64.store offset=136
    local.get 5
    i64.const 0
    i64.store offset=128
    local.get 2
    i64.load offset=24
    local.set 10
    local.get 1
    i64.load offset=24
    local.set 11
    local.get 2
    i64.load offset=16
    local.set 12
    local.get 1
    i64.load offset=16
    local.set 13
    local.get 2
    i64.load offset=8
    local.set 14
    local.get 1
    i64.load offset=8
    local.set 15
    local.get 2
    i64.load
    local.set 16
    local.get 3
    i64.load
    local.set 17
    local.get 1
    i64.load
    local.set 18
    i32.const 0
    local.set 19
    i32.const 2
    local.set 20
    i32.const 5
    local.set 21
    i32.const 4
    local.set 22
    i32.const 3
    local.set 23
    loop  ;; label = @1
      local.get 5
      i32.const 112
      i32.add
      local.get 0
      local.get 19
      local.tee 24
      i32.const 3
      i32.shl
      local.tee 1
      i32.add
      i64.load
      local.tee 25
      i64.const 0
      local.get 18
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 96
      i32.add
      local.get 25
      local.get 18
      i64.mul
      local.get 5
      i32.const 128
      i32.add
      local.get 1
      i32.add
      local.tee 3
      i64.load
      local.tee 26
      i64.add
      local.get 17
      i64.mul
      local.tee 27
      i64.const 0
      local.get 16
      i64.const 0
      call $__multi3
      local.get 3
      local.get 5
      i64.load offset=96
      local.tee 28
      local.get 26
      local.get 5
      i64.load offset=112
      local.tee 29
      i64.add
      local.tee 30
      i64.add
      local.tee 26
      i64.store
      block  ;; label = @2
        local.get 26
        local.get 28
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 96
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.tee 26
        local.get 5
        i32.const 112
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 30
        local.get 29
        i64.lt_u
        i64.extend_i32_u
        i64.add
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 28
        local.get 26
        i64.lt_u
        local.get 28
        local.get 26
        i64.eq
        select
        i32.eqz
        br_if 0 (;@2;)
        local.get 20
        local.set 2
        local.get 9
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i64.load
            local.tee 26
            i64.const -1
            i64.ne
            br_if 1 (;@3;)
            local.get 1
            i64.const 0
            i64.store
            local.get 1
            i32.const 8
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            i32.const 8
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 1
        local.get 26
        i64.const 1
        i64.add
        i64.store
      end
      local.get 5
      i32.const 64
      i32.add
      local.get 25
      i64.const 0
      local.get 15
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 80
      i32.add
      local.get 27
      i64.const 0
      local.get 14
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 128
      i32.add
      local.get 24
      i32.const 1
      i32.add
      local.tee 19
      i32.const 3
      i32.shl
      i32.add
      local.tee 1
      local.get 28
      local.get 5
      i64.load offset=64
      i64.add
      local.tee 26
      local.get 1
      i64.load
      i64.add
      local.tee 29
      local.get 5
      i64.load offset=80
      i64.add
      local.tee 30
      i64.store
      block  ;; label = @2
        local.get 30
        local.get 29
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 26
        local.get 28
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 29
        local.get 26
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 26
        local.get 5
        i32.const 80
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 28
        local.get 26
        i64.lt_u
        local.get 28
        local.get 26
        i64.eq
        select
        i32.eqz
        br_if 0 (;@2;)
        local.get 23
        local.set 2
        local.get 8
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 26
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 26
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 32
      i32.add
      local.get 25
      i64.const 0
      local.get 13
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 48
      i32.add
      local.get 27
      i64.const 0
      local.get 12
      i64.const 0
      call $__multi3
      local.get 3
      i32.const 16
      i32.add
      local.tee 1
      local.get 28
      local.get 5
      i64.load offset=32
      i64.add
      local.tee 26
      local.get 1
      i64.load
      i64.add
      local.tee 29
      local.get 5
      i64.load offset=48
      i64.add
      local.tee 30
      i64.store
      block  ;; label = @2
        local.get 30
        local.get 29
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 32
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 26
        local.get 28
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 29
        local.get 26
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 26
        local.get 5
        i32.const 48
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 28
        local.get 26
        i64.lt_u
        local.get 28
        local.get 26
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 22
        local.set 2
        local.get 7
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 26
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 26
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 25
      i64.const 0
      local.get 11
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 16
      i32.add
      local.get 27
      i64.const 0
      local.get 10
      i64.const 0
      call $__multi3
      local.get 3
      i32.const 24
      i32.add
      local.tee 1
      local.get 28
      local.get 5
      i64.load
      i64.add
      local.tee 26
      local.get 1
      i64.load
      i64.add
      local.tee 25
      local.get 5
      i64.load offset=16
      i64.add
      local.tee 27
      i64.store
      block  ;; label = @2
        local.get 27
        local.get 25
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 8
        i32.add
        i64.load
        local.get 26
        local.get 28
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 25
        local.get 26
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 26
        local.get 5
        i32.const 16
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 25
        local.get 26
        i64.lt_u
        local.get 25
        local.get 26
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 24
        i32.const 5
        i32.add
        i32.const 7
        i32.gt_u
        br_if 0 (;@2;)
        local.get 21
        local.set 2
        local.get 6
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 26
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 26
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 2
          i32.const 1
          i32.add
          local.tee 2
          i32.const 8
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 32
      i32.add
      local.tee 1
      local.get 1
      i64.load
      local.get 25
      i64.add
      i64.store
      local.get 21
      i32.const 1
      i32.add
      local.set 21
      local.get 6
      i32.const 8
      i32.add
      local.set 6
      local.get 22
      i32.const 1
      i32.add
      local.set 22
      local.get 7
      i32.const 8
      i32.add
      local.set 7
      local.get 23
      i32.const 1
      i32.add
      local.set 23
      local.get 8
      i32.const 8
      i32.add
      local.set 8
      local.get 20
      i32.const 1
      i32.add
      local.set 20
      local.get 9
      i32.const 8
      i32.add
      local.set 9
      local.get 19
      i32.const 4
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 4
    local.get 5
    i64.load offset=160
    i64.store
    local.get 4
    i32.const 24
    i32.add
    local.get 5
    i32.const 184
    i32.add
    i64.load
    local.tee 26
    i64.store
    local.get 4
    i32.const 16
    i32.add
    local.get 5
    i32.const 176
    i32.add
    i64.load
    i64.store
    local.get 4
    i32.const 8
    i32.add
    local.get 5
    i32.const 168
    i32.add
    i64.load
    i64.store
    block  ;; label = @1
      local.get 26
      local.get 10
      i64.lt_u
      br_if 0 (;@1;)
      local.get 4
      i64.load offset=16
      local.set 25
      block  ;; label = @2
        local.get 26
        local.get 10
        i64.gt_u
        br_if 0 (;@2;)
        local.get 12
        local.get 25
        i64.gt_u
        br_if 1 (;@1;)
        local.get 12
        local.get 25
        i64.lt_u
        br_if 0 (;@2;)
        local.get 14
        local.get 4
        i64.load offset=8
        local.tee 27
        i64.gt_u
        br_if 1 (;@1;)
        local.get 14
        local.get 27
        i64.lt_u
        br_if 0 (;@2;)
        local.get 16
        local.get 4
        i64.load
        i64.gt_u
        br_if 1 (;@1;)
      end
      local.get 4
      local.get 4
      i64.load
      local.tee 27
      local.get 16
      i64.sub
      i64.store
      local.get 4
      local.get 4
      i64.load offset=8
      local.tee 28
      local.get 27
      local.get 16
      i64.lt_u
      i64.extend_i32_u
      i64.sub
      local.get 14
      i64.sub
      local.tee 27
      i64.store offset=8
      local.get 4
      local.get 25
      local.get 27
      local.get 28
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 12
      i64.sub
      local.tee 27
      i64.store offset=16
      local.get 4
      local.get 26
      local.get 10
      i64.sub
      local.get 27
      local.get 25
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      i64.store offset=24
    end
    local.get 5
    i32.const 192
    i32.add
    global.set 0)
  (func $subtract768_32bitlimbs (type 1) (param i32 i32 i32)
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
  (func $less_than_or_equal768_32bitlimbs (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load offset=92
      local.tee 3
      local.get 1
      i32.load offset=92
      local.tee 4
      i32.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=88
        local.tee 3
        local.get 1
        i32.load offset=88
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=84
        local.tee 3
        local.get 1
        i32.load offset=84
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=80
        local.tee 3
        local.get 1
        i32.load offset=80
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=76
        local.tee 3
        local.get 1
        i32.load offset=76
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=72
        local.tee 3
        local.get 1
        i32.load offset=72
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=68
        local.tee 3
        local.get 1
        i32.load offset=68
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=64
        local.tee 3
        local.get 1
        i32.load offset=64
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=60
        local.tee 3
        local.get 1
        i32.load offset=60
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=56
        local.tee 3
        local.get 1
        i32.load offset=56
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=52
        local.tee 3
        local.get 1
        i32.load offset=52
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=48
        local.tee 3
        local.get 1
        i32.load offset=48
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=44
        local.tee 3
        local.get 1
        i32.load offset=44
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=40
        local.tee 3
        local.get 1
        i32.load offset=40
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=36
        local.tee 3
        local.get 1
        i32.load offset=36
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=32
        local.tee 3
        local.get 1
        i32.load offset=32
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=28
        local.tee 3
        local.get 1
        i32.load offset=28
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=24
        local.tee 3
        local.get 1
        i32.load offset=24
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=20
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.tee 3
        local.get 1
        i32.load offset=16
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=12
        local.tee 3
        local.get 1
        i32.load offset=12
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=8
        local.tee 3
        local.get 1
        i32.load offset=8
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.tee 3
        local.get 1
        i32.load offset=4
        local.tee 4
        i32.gt_u
        br_if 1 (;@1;)
        i32.const 1
        local.set 2
        local.get 3
        local.get 4
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
      local.set 2
    end
    local.get 2)
  (func $montmul768_32bitlimbs (type 0) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i32 i32)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 0
    i32.const 192
    call $memset
    local.tee 6
    i32.const 100
    i32.add
    local.set 7
    local.get 6
    i32.const 96
    i32.add
    local.set 8
    local.get 6
    i32.const 92
    i32.add
    local.set 9
    local.get 6
    i32.const 88
    i32.add
    local.set 10
    local.get 6
    i32.const 84
    i32.add
    local.set 11
    local.get 6
    i32.const 80
    i32.add
    local.set 12
    local.get 6
    i32.const 76
    i32.add
    local.set 13
    local.get 6
    i32.const 72
    i32.add
    local.set 14
    local.get 6
    i32.const 68
    i32.add
    local.set 15
    local.get 6
    i32.const 64
    i32.add
    local.set 16
    local.get 6
    i32.const 60
    i32.add
    local.set 17
    local.get 6
    i32.const 56
    i32.add
    local.set 18
    local.get 6
    i32.const 52
    i32.add
    local.set 19
    local.get 6
    i32.const 48
    i32.add
    local.set 20
    local.get 6
    i32.const 44
    i32.add
    local.set 21
    local.get 6
    i32.const 40
    i32.add
    local.set 22
    local.get 6
    i32.const 36
    i32.add
    local.set 23
    local.get 6
    i32.const 32
    i32.add
    local.set 24
    local.get 6
    i32.const 28
    i32.add
    local.set 25
    local.get 6
    i32.const 24
    i32.add
    local.set 26
    local.get 6
    i32.const 20
    i32.add
    local.set 27
    local.get 6
    i32.const 16
    i32.add
    local.set 28
    local.get 6
    i32.const 12
    i32.or
    local.set 29
    local.get 6
    i32.const 8
    i32.or
    local.set 30
    local.get 2
    i64.load32_u offset=92
    local.set 31
    local.get 1
    i64.load32_u offset=92
    local.set 32
    local.get 2
    i64.load32_u offset=88
    local.set 33
    local.get 1
    i64.load32_u offset=88
    local.set 34
    local.get 2
    i64.load32_u offset=84
    local.set 35
    local.get 1
    i64.load32_u offset=84
    local.set 36
    local.get 2
    i64.load32_u offset=80
    local.set 37
    local.get 1
    i64.load32_u offset=80
    local.set 38
    local.get 2
    i64.load32_u offset=76
    local.set 39
    local.get 1
    i64.load32_u offset=76
    local.set 40
    local.get 2
    i64.load32_u offset=72
    local.set 41
    local.get 1
    i64.load32_u offset=72
    local.set 42
    local.get 2
    i64.load32_u offset=68
    local.set 43
    local.get 1
    i64.load32_u offset=68
    local.set 44
    local.get 2
    i64.load32_u offset=64
    local.set 45
    local.get 1
    i64.load32_u offset=64
    local.set 46
    local.get 2
    i64.load32_u offset=60
    local.set 47
    local.get 1
    i64.load32_u offset=60
    local.set 48
    local.get 2
    i64.load32_u offset=56
    local.set 49
    local.get 1
    i64.load32_u offset=56
    local.set 50
    local.get 2
    i64.load32_u offset=52
    local.set 51
    local.get 1
    i64.load32_u offset=52
    local.set 52
    local.get 2
    i64.load32_u offset=48
    local.set 53
    local.get 1
    i64.load32_u offset=48
    local.set 54
    local.get 2
    i64.load32_u offset=44
    local.set 55
    local.get 1
    i64.load32_u offset=44
    local.set 56
    local.get 2
    i64.load32_u offset=40
    local.set 57
    local.get 1
    i64.load32_u offset=40
    local.set 58
    local.get 2
    i64.load32_u offset=36
    local.set 59
    local.get 1
    i64.load32_u offset=36
    local.set 60
    local.get 2
    i64.load32_u offset=32
    local.set 61
    local.get 1
    i64.load32_u offset=32
    local.set 62
    local.get 2
    i64.load32_u offset=28
    local.set 63
    local.get 1
    i64.load32_u offset=28
    local.set 64
    local.get 2
    i64.load32_u offset=24
    local.set 65
    local.get 1
    i64.load32_u offset=24
    local.set 66
    local.get 2
    i64.load32_u offset=20
    local.set 67
    local.get 1
    i64.load32_u offset=20
    local.set 68
    local.get 2
    i64.load32_u offset=16
    local.set 69
    local.get 1
    i64.load32_u offset=16
    local.set 70
    local.get 2
    i64.load32_u offset=12
    local.set 71
    local.get 1
    i64.load32_u offset=12
    local.set 72
    local.get 2
    i64.load32_u offset=8
    local.set 73
    local.get 1
    i64.load32_u offset=8
    local.set 74
    local.get 2
    i64.load32_u offset=4
    local.set 75
    local.get 1
    i64.load32_u offset=4
    local.set 76
    local.get 2
    i64.load32_u
    local.set 77
    local.get 3
    i32.load
    local.set 78
    local.get 1
    i32.load
    local.tee 79
    i64.extend_i32_u
    local.set 80
    i32.const 3
    local.set 81
    i32.const 5
    local.set 82
    i32.const 6
    local.set 83
    i32.const 7
    local.set 84
    i32.const 9
    local.set 85
    i32.const 10
    local.set 86
    i32.const 11
    local.set 87
    i32.const 13
    local.set 88
    i32.const 14
    local.set 89
    i32.const 15
    local.set 90
    i32.const 17
    local.set 91
    i32.const 18
    local.set 92
    i32.const 19
    local.set 93
    i32.const 21
    local.set 94
    i32.const 22
    local.set 95
    i32.const 23
    local.set 96
    i32.const 25
    local.set 97
    i32.const 24
    local.set 98
    i32.const 20
    local.set 99
    i32.const 16
    local.set 100
    i32.const 12
    local.set 101
    i32.const 8
    local.set 102
    i32.const 4
    local.set 103
    i32.const 2
    local.set 104
    i32.const 0
    local.set 105
    loop  ;; label = @1
      local.get 6
      local.get 105
      local.tee 106
      i32.const 2
      i32.shl
      local.tee 1
      i32.add
      local.tee 3
      local.get 0
      local.get 1
      i32.add
      i32.load
      local.tee 1
      local.get 79
      i32.mul
      local.get 3
      i32.load
      local.tee 5
      i32.add
      local.get 78
      i32.mul
      i64.extend_i32_u
      local.tee 107
      local.get 77
      i64.mul
      local.tee 108
      local.get 1
      i64.extend_i32_u
      local.tee 109
      local.get 80
      i64.mul
      local.get 5
      i64.extend_i32_u
      i64.add
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 104
        local.set 5
        local.get 30
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.ne
            br_if 1 (;@3;)
            local.get 1
            i32.const 0
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 1
            i32.add
            local.tee 5
            i32.const 48
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 1
        local.get 112
        i32.const 1
        i32.add
        i32.store
      end
      local.get 6
      local.get 106
      i32.const 1
      i32.add
      local.tee 105
      i32.const 2
      i32.shl
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 76
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 75
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 81
        local.set 5
        local.get 29
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 8
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 74
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 73
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 103
        local.set 5
        local.get 28
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 12
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 72
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 71
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 82
        local.set 5
        local.get 27
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 16
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 70
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 69
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 83
        local.set 5
        local.get 26
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 20
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 68
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 67
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 84
        local.set 5
        local.get 25
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 24
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 66
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 65
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 102
        local.set 5
        local.get 24
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 28
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 64
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 63
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 85
        local.set 5
        local.get 23
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 32
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 62
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 61
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 86
        local.set 5
        local.get 22
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 36
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 60
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 59
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 87
        local.set 5
        local.get 21
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 40
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 58
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 57
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 101
        local.set 5
        local.get 20
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 44
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 56
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 55
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 88
        local.set 5
        local.get 19
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 48
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 54
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 53
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 89
        local.set 5
        local.get 18
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 52
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 52
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 51
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 90
        local.set 5
        local.get 17
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 56
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 50
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 49
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 100
        local.set 5
        local.get 16
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 60
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 48
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 47
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 91
        local.set 5
        local.get 15
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 64
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 46
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 45
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 92
        local.set 5
        local.get 14
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 68
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 44
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 43
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 93
        local.set 5
        local.get 13
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 72
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 42
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 41
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 99
        local.set 5
        local.get 12
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 76
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 40
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 39
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 94
        local.set 5
        local.get 11
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 80
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 38
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 37
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 95
        local.set 5
        local.get 10
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 84
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 36
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 35
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 96
        local.set 5
        local.get 9
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 88
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 34
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 108
      local.get 107
      local.get 33
      i64.mul
      i64.add
      local.tee 110
      i64.store32
      local.get 110
      i64.const 32
      i64.shr_u
      local.set 111
      block  ;; label = @2
        local.get 110
        local.get 108
        i64.ge_u
        br_if 0 (;@2;)
        local.get 98
        local.set 5
        local.get 8
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 92
      i32.add
      local.tee 1
      local.get 111
      local.get 109
      local.get 32
      i64.mul
      i64.add
      local.get 1
      i64.load32_u
      i64.add
      local.tee 109
      local.get 107
      local.get 31
      i64.mul
      i64.add
      local.tee 107
      i64.store32
      local.get 107
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      local.set 113
      block  ;; label = @2
        local.get 107
        local.get 109
        i64.ge_u
        br_if 0 (;@2;)
        local.get 106
        i32.const 25
        i32.add
        i32.const 47
        i32.gt_u
        br_if 0 (;@2;)
        local.get 97
        local.set 5
        local.get 7
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 112
            i32.const -1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 112
            i32.const 1
            i32.add
            i32.store
            br 2 (;@2;)
          end
          local.get 1
          i32.const 0
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 48
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.const 96
      i32.add
      local.tee 1
      local.get 1
      i32.load
      local.get 113
      i32.add
      i32.store
      local.get 97
      i32.const 1
      i32.add
      local.set 97
      local.get 7
      i32.const 4
      i32.add
      local.set 7
      local.get 98
      i32.const 1
      i32.add
      local.set 98
      local.get 8
      i32.const 4
      i32.add
      local.set 8
      local.get 96
      i32.const 1
      i32.add
      local.set 96
      local.get 9
      i32.const 4
      i32.add
      local.set 9
      local.get 95
      i32.const 1
      i32.add
      local.set 95
      local.get 10
      i32.const 4
      i32.add
      local.set 10
      local.get 94
      i32.const 1
      i32.add
      local.set 94
      local.get 11
      i32.const 4
      i32.add
      local.set 11
      local.get 99
      i32.const 1
      i32.add
      local.set 99
      local.get 12
      i32.const 4
      i32.add
      local.set 12
      local.get 93
      i32.const 1
      i32.add
      local.set 93
      local.get 13
      i32.const 4
      i32.add
      local.set 13
      local.get 92
      i32.const 1
      i32.add
      local.set 92
      local.get 14
      i32.const 4
      i32.add
      local.set 14
      local.get 91
      i32.const 1
      i32.add
      local.set 91
      local.get 15
      i32.const 4
      i32.add
      local.set 15
      local.get 100
      i32.const 1
      i32.add
      local.set 100
      local.get 16
      i32.const 4
      i32.add
      local.set 16
      local.get 90
      i32.const 1
      i32.add
      local.set 90
      local.get 17
      i32.const 4
      i32.add
      local.set 17
      local.get 89
      i32.const 1
      i32.add
      local.set 89
      local.get 18
      i32.const 4
      i32.add
      local.set 18
      local.get 88
      i32.const 1
      i32.add
      local.set 88
      local.get 19
      i32.const 4
      i32.add
      local.set 19
      local.get 101
      i32.const 1
      i32.add
      local.set 101
      local.get 20
      i32.const 4
      i32.add
      local.set 20
      local.get 87
      i32.const 1
      i32.add
      local.set 87
      local.get 21
      i32.const 4
      i32.add
      local.set 21
      local.get 86
      i32.const 1
      i32.add
      local.set 86
      local.get 22
      i32.const 4
      i32.add
      local.set 22
      local.get 85
      i32.const 1
      i32.add
      local.set 85
      local.get 23
      i32.const 4
      i32.add
      local.set 23
      local.get 102
      i32.const 1
      i32.add
      local.set 102
      local.get 24
      i32.const 4
      i32.add
      local.set 24
      local.get 84
      i32.const 1
      i32.add
      local.set 84
      local.get 25
      i32.const 4
      i32.add
      local.set 25
      local.get 83
      i32.const 1
      i32.add
      local.set 83
      local.get 26
      i32.const 4
      i32.add
      local.set 26
      local.get 82
      i32.const 1
      i32.add
      local.set 82
      local.get 27
      i32.const 4
      i32.add
      local.set 27
      local.get 103
      i32.const 1
      i32.add
      local.set 103
      local.get 28
      i32.const 4
      i32.add
      local.set 28
      local.get 81
      i32.const 1
      i32.add
      local.set 81
      local.get 29
      i32.const 4
      i32.add
      local.set 29
      local.get 104
      i32.const 1
      i32.add
      local.set 104
      local.get 30
      i32.const 4
      i32.add
      local.set 30
      local.get 105
      i32.const 24
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 2
      local.get 4
      local.get 6
      i32.const 96
      i32.add
      i32.const 96
      call $memcpy
      local.tee 1
      call $less_than_or_equal768_32bitlimbs
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      local.get 1
      call $subtract768_32bitlimbs
    end
    local.get 6
    i32.const 192
    i32.add
    global.set 0)
  (func $memset (type 3) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        local.get 1
        i32.store8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $memcpy (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $less_than_or_equal768_64bitlimbs (type 4) (param i32 i32) (result i64)
    (local i64 i64 i64)
    i64.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      i64.load offset=88
      local.tee 3
      local.get 1
      i64.load offset=88
      local.tee 4
      i64.gt_u
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=80
        local.tee 3
        local.get 1
        i64.load offset=80
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=72
        local.tee 3
        local.get 1
        i64.load offset=72
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=64
        local.tee 3
        local.get 1
        i64.load offset=64
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=56
        local.tee 3
        local.get 1
        i64.load offset=56
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=48
        local.tee 3
        local.get 1
        i64.load offset=48
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=40
        local.tee 3
        local.get 1
        i64.load offset=40
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=32
        local.tee 3
        local.get 1
        i64.load offset=32
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=24
        local.tee 3
        local.get 1
        i64.load offset=24
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=16
        local.tee 3
        local.get 1
        i64.load offset=16
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i64.lt_u
        br_if 0 (;@2;)
        local.get 0
        i64.load offset=8
        local.tee 3
        local.get 1
        i64.load offset=8
        local.tee 4
        i64.gt_u
        br_if 1 (;@1;)
        i64.const 1
        local.set 2
        local.get 3
        local.get 4
        i64.lt_u
        br_if 1 (;@1;)
        local.get 0
        i64.load
        local.get 1
        i64.load
        i64.le_u
        i64.extend_i32_u
        return
      end
      i64.const 1
      local.set 2
    end
    local.get 2)
  (func $montmul768_64bitlimbs (type 0) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 576
    i32.sub
    local.tee 5
    global.set 0
    i32.const 0
    local.set 6
    local.get 5
    i32.const 384
    i32.add
    i32.const 0
    i32.const 192
    call $memset
    drop
    local.get 5
    i32.const 488
    i32.add
    local.set 7
    local.get 5
    i32.const 384
    i32.add
    i32.const 96
    i32.add
    local.set 8
    local.get 5
    i32.const 384
    i32.add
    i32.const 88
    i32.add
    local.set 9
    local.get 5
    i32.const 384
    i32.add
    i32.const 80
    i32.add
    local.set 10
    local.get 5
    i32.const 384
    i32.add
    i32.const 72
    i32.add
    local.set 11
    local.get 5
    i32.const 384
    i32.add
    i32.const 64
    i32.add
    local.set 12
    local.get 5
    i32.const 384
    i32.add
    i32.const 56
    i32.add
    local.set 13
    local.get 5
    i32.const 384
    i32.add
    i32.const 48
    i32.add
    local.set 14
    local.get 5
    i32.const 384
    i32.add
    i32.const 40
    i32.add
    local.set 15
    local.get 5
    i32.const 384
    i32.add
    i32.const 32
    i32.add
    local.set 16
    local.get 5
    i32.const 384
    i32.add
    i32.const 24
    i32.add
    local.set 17
    local.get 5
    i32.const 384
    i32.add
    i32.const 16
    i32.add
    local.set 18
    local.get 2
    i64.load offset=88
    local.set 19
    local.get 1
    i64.load offset=88
    local.set 20
    local.get 2
    i64.load offset=80
    local.set 21
    local.get 1
    i64.load offset=80
    local.set 22
    local.get 2
    i64.load offset=72
    local.set 23
    local.get 1
    i64.load offset=72
    local.set 24
    local.get 2
    i64.load offset=64
    local.set 25
    local.get 1
    i64.load offset=64
    local.set 26
    local.get 2
    i64.load offset=56
    local.set 27
    local.get 1
    i64.load offset=56
    local.set 28
    local.get 2
    i64.load offset=48
    local.set 29
    local.get 1
    i64.load offset=48
    local.set 30
    local.get 2
    i64.load offset=40
    local.set 31
    local.get 1
    i64.load offset=40
    local.set 32
    local.get 2
    i64.load offset=32
    local.set 33
    local.get 1
    i64.load offset=32
    local.set 34
    local.get 2
    i64.load offset=24
    local.set 35
    local.get 1
    i64.load offset=24
    local.set 36
    local.get 2
    i64.load offset=16
    local.set 37
    local.get 1
    i64.load offset=16
    local.set 38
    local.get 2
    i64.load offset=8
    local.set 39
    local.get 1
    i64.load offset=8
    local.set 40
    local.get 2
    i64.load
    local.set 41
    local.get 3
    i64.load
    local.set 42
    local.get 1
    i64.load
    local.set 43
    i32.const 2
    local.set 44
    i32.const 4
    local.set 45
    i32.const 5
    local.set 46
    i32.const 6
    local.set 47
    i32.const 7
    local.set 48
    i32.const 9
    local.set 49
    i32.const 10
    local.set 50
    i32.const 11
    local.set 51
    i32.const 13
    local.set 52
    i32.const 12
    local.set 53
    i32.const 8
    local.set 54
    i32.const 3
    local.set 55
    loop  ;; label = @1
      local.get 5
      i32.const 368
      i32.add
      local.get 0
      local.get 6
      local.tee 56
      i32.const 3
      i32.shl
      local.tee 1
      i32.add
      i64.load
      local.tee 57
      i64.const 0
      local.get 43
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 352
      i32.add
      local.get 57
      local.get 43
      i64.mul
      local.get 5
      i32.const 384
      i32.add
      local.get 1
      i32.add
      local.tee 58
      i64.load
      local.tee 59
      i64.add
      local.get 42
      i64.mul
      local.tee 60
      i64.const 0
      local.get 41
      i64.const 0
      call $__multi3
      local.get 58
      local.get 5
      i64.load offset=352
      local.tee 61
      local.get 59
      local.get 5
      i64.load offset=368
      local.tee 62
      i64.add
      local.tee 63
      i64.add
      local.tee 59
      i64.store
      block  ;; label = @2
        local.get 59
        local.get 61
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 352
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.tee 59
        local.get 5
        i32.const 368
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 63
        local.get 62
        i64.lt_u
        i64.extend_i32_u
        i64.add
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.eqz
        br_if 0 (;@2;)
        local.get 44
        local.set 3
        local.get 18
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.ne
            br_if 1 (;@3;)
            local.get 1
            i64.const 0
            i64.store
            local.get 1
            i32.const 8
            i32.add
            local.set 1
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            i32.const 24
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 1
        local.get 59
        i64.const 1
        i64.add
        i64.store
      end
      local.get 5
      i32.const 320
      i32.add
      local.get 57
      i64.const 0
      local.get 40
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 336
      i32.add
      local.get 60
      i64.const 0
      local.get 39
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 384
      i32.add
      local.get 56
      i32.const 1
      i32.add
      local.tee 6
      i32.const 3
      i32.shl
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=320
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=336
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 320
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 336
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.eqz
        br_if 0 (;@2;)
        local.get 55
        local.set 3
        local.get 17
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 288
      i32.add
      local.get 57
      i64.const 0
      local.get 38
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 304
      i32.add
      local.get 60
      i64.const 0
      local.get 37
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 16
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=288
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=304
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 288
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 304
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 45
        local.set 3
        local.get 16
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 256
      i32.add
      local.get 57
      i64.const 0
      local.get 36
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 272
      i32.add
      local.get 60
      i64.const 0
      local.get 35
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 24
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=256
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=272
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 256
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 272
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 46
        local.set 3
        local.get 15
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 224
      i32.add
      local.get 57
      i64.const 0
      local.get 34
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 240
      i32.add
      local.get 60
      i64.const 0
      local.get 33
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 32
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=224
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=240
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 224
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 240
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 47
        local.set 3
        local.get 14
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 192
      i32.add
      local.get 57
      i64.const 0
      local.get 32
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 208
      i32.add
      local.get 60
      i64.const 0
      local.get 31
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 40
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=192
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=208
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 192
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 208
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 48
        local.set 3
        local.get 13
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 160
      i32.add
      local.get 57
      i64.const 0
      local.get 30
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 176
      i32.add
      local.get 60
      i64.const 0
      local.get 29
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 48
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=160
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=176
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 160
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 176
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 54
        local.set 3
        local.get 12
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 128
      i32.add
      local.get 57
      i64.const 0
      local.get 28
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 144
      i32.add
      local.get 60
      i64.const 0
      local.get 27
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 56
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=128
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=144
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 128
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 144
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 49
        local.set 3
        local.get 11
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 96
      i32.add
      local.get 57
      i64.const 0
      local.get 26
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 112
      i32.add
      local.get 60
      i64.const 0
      local.get 25
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 64
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=96
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=112
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 96
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 112
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 50
        local.set 3
        local.get 10
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 64
      i32.add
      local.get 57
      i64.const 0
      local.get 24
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 80
      i32.add
      local.get 60
      i64.const 0
      local.get 23
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 72
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=64
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=80
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 80
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 51
        local.set 3
        local.get 9
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      i32.const 32
      i32.add
      local.get 57
      i64.const 0
      local.get 22
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 48
      i32.add
      local.get 60
      i64.const 0
      local.get 21
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 80
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load offset=32
      i64.add
      local.tee 59
      local.get 1
      i64.load
      i64.add
      local.tee 62
      local.get 5
      i64.load offset=48
      i64.add
      local.tee 63
      i64.store
      block  ;; label = @2
        local.get 63
        local.get 62
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 32
        i32.add
        i32.const 8
        i32.add
        i64.load
        local.get 59
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 62
        local.get 59
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 59
        local.get 5
        i32.const 48
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 61
        local.get 59
        i64.lt_u
        local.get 61
        local.get 59
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 53
        local.set 3
        local.get 8
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 59
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 59
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 57
      i64.const 0
      local.get 20
      i64.const 0
      call $__multi3
      local.get 5
      i32.const 16
      i32.add
      local.get 60
      i64.const 0
      local.get 19
      i64.const 0
      call $__multi3
      local.get 58
      i32.const 88
      i32.add
      local.tee 1
      local.get 61
      local.get 5
      i64.load
      i64.add
      local.tee 57
      local.get 1
      i64.load
      i64.add
      local.tee 60
      local.get 5
      i64.load offset=16
      i64.add
      local.tee 59
      i64.store
      block  ;; label = @2
        local.get 59
        local.get 60
        i64.lt_u
        local.tee 1
        local.get 5
        i32.const 8
        i32.add
        i64.load
        local.get 57
        local.get 61
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.get 60
        local.get 57
        i64.lt_u
        i64.extend_i32_u
        i64.add
        local.tee 57
        local.get 5
        i32.const 16
        i32.add
        i32.const 8
        i32.add
        i64.load
        i64.add
        local.get 1
        i64.extend_i32_u
        i64.add
        local.tee 60
        local.get 57
        i64.lt_u
        local.get 60
        local.get 57
        i64.eq
        select
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 56
        i32.const 13
        i32.add
        i32.const 23
        i32.gt_u
        br_if 0 (;@2;)
        local.get 52
        local.set 3
        local.get 7
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.load
            local.tee 57
            i64.const -1
            i64.eq
            br_if 0 (;@4;)
            local.get 1
            local.get 57
            i64.const 1
            i64.add
            i64.store
            br 2 (;@2;)
          end
          local.get 1
          i64.const 0
          i64.store
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 24
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 58
      i32.const 96
      i32.add
      local.tee 1
      local.get 1
      i64.load
      local.get 60
      i64.add
      i64.store
      local.get 52
      i32.const 1
      i32.add
      local.set 52
      local.get 7
      i32.const 8
      i32.add
      local.set 7
      local.get 53
      i32.const 1
      i32.add
      local.set 53
      local.get 8
      i32.const 8
      i32.add
      local.set 8
      local.get 51
      i32.const 1
      i32.add
      local.set 51
      local.get 9
      i32.const 8
      i32.add
      local.set 9
      local.get 50
      i32.const 1
      i32.add
      local.set 50
      local.get 10
      i32.const 8
      i32.add
      local.set 10
      local.get 49
      i32.const 1
      i32.add
      local.set 49
      local.get 11
      i32.const 8
      i32.add
      local.set 11
      local.get 54
      i32.const 1
      i32.add
      local.set 54
      local.get 12
      i32.const 8
      i32.add
      local.set 12
      local.get 48
      i32.const 1
      i32.add
      local.set 48
      local.get 13
      i32.const 8
      i32.add
      local.set 13
      local.get 47
      i32.const 1
      i32.add
      local.set 47
      local.get 14
      i32.const 8
      i32.add
      local.set 14
      local.get 46
      i32.const 1
      i32.add
      local.set 46
      local.get 15
      i32.const 8
      i32.add
      local.set 15
      local.get 45
      i32.const 1
      i32.add
      local.set 45
      local.get 16
      i32.const 8
      i32.add
      local.set 16
      local.get 55
      i32.const 1
      i32.add
      local.set 55
      local.get 17
      i32.const 8
      i32.add
      local.set 17
      local.get 44
      i32.const 1
      i32.add
      local.set 44
      local.get 18
      i32.const 8
      i32.add
      local.set 18
      local.get 6
      i32.const 12
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 2
      local.get 4
      local.get 5
      i32.const 384
      i32.add
      i32.const 96
      i32.add
      i32.const 96
      call $memcpy
      local.tee 1
      call $less_than_or_equal768_64bitlimbs
      i64.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 1
      i64.load
      local.tee 57
      local.get 41
      i64.sub
      i64.store
      local.get 1
      local.get 1
      i64.load offset=8
      local.tee 60
      local.get 57
      local.get 41
      i64.lt_u
      i64.extend_i32_u
      i64.sub
      local.get 39
      i64.sub
      local.tee 57
      i64.store offset=8
      local.get 1
      local.get 1
      i64.load offset=16
      local.tee 59
      local.get 57
      local.get 60
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 37
      i64.sub
      local.tee 57
      i64.store offset=16
      local.get 1
      local.get 1
      i64.load offset=24
      local.tee 60
      local.get 57
      local.get 59
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 35
      i64.sub
      local.tee 57
      i64.store offset=24
      local.get 1
      local.get 1
      i64.load offset=32
      local.tee 59
      local.get 57
      local.get 60
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 33
      i64.sub
      local.tee 57
      i64.store offset=32
      local.get 1
      local.get 1
      i64.load offset=40
      local.tee 60
      local.get 57
      local.get 59
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 31
      i64.sub
      local.tee 57
      i64.store offset=40
      local.get 1
      local.get 1
      i64.load offset=48
      local.tee 59
      local.get 57
      local.get 60
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 29
      i64.sub
      local.tee 57
      i64.store offset=48
      local.get 1
      local.get 1
      i64.load offset=56
      local.tee 60
      local.get 57
      local.get 59
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 27
      i64.sub
      local.tee 57
      i64.store offset=56
      local.get 1
      local.get 1
      i64.load offset=64
      local.tee 59
      local.get 57
      local.get 60
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 25
      i64.sub
      local.tee 57
      i64.store offset=64
      local.get 1
      local.get 1
      i64.load offset=72
      local.tee 60
      local.get 57
      local.get 59
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 23
      i64.sub
      local.tee 57
      i64.store offset=72
      local.get 1
      local.get 1
      i64.load offset=80
      local.tee 59
      local.get 57
      local.get 60
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      local.get 21
      i64.sub
      local.tee 57
      i64.store offset=80
      local.get 1
      local.get 1
      i64.load offset=88
      local.get 19
      i64.sub
      local.get 57
      local.get 59
      i64.gt_u
      i64.extend_i32_u
      i64.sub
      i64.store offset=88
    end
    local.get 5
    i32.const 576
    i32.add
    global.set 0)
  (func $__multi3 (type 5) (param i32 i64 i64 i64 i64)
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
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 66560))
  (global (;2;) i32 (i32.const 1024))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "montmul256_32bitlimbs" (func $montmul256_32bitlimbs))
  (export "montmul256_64bitlimbs" (func $montmul256_64bitlimbs))
  (export "montmul768_32bitlimbs" (func $montmul768_32bitlimbs))
  (export "montmul768_64bitlimbs" (func $montmul768_64bitlimbs)))
