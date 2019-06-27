(module
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32 i32 i32)))
  (type (;3;) (func (param i32 i32) (result i64)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32 i64 i64)))
  (func $subtract256_32bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i32 i32)
    loop  ;; label = @1
      local.get 3
      i32.const 32
      i32.ne
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.add
        local.get 0
        local.get 3
        i32.add
        i32.load
        local.tee 5
        local.get 4
        i32.sub
        local.get 1
        local.get 3
        i32.add
        i32.load
        i32.sub
        local.tee 4
        i32.store
        local.get 4
        local.get 5
        i32.gt_u
        local.set 4
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func $less_than_or_equal256_32bitlimbs (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 1
    i32.const 28
    i32.add
    local.set 1
    local.get 0
    i32.const 28
    i32.add
    local.set 0
    i32.const 8
    local.set 2
    loop  ;; label = @1
      local.get 2
      i32.const -1
      i32.add
      local.tee 2
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.load
        local.tee 4
        i32.gt_u
        if  ;; label = @3
          i32.const 0
          return
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        local.get 0
        i32.const -4
        i32.add
        local.set 0
        local.get 3
        local.get 4
        i32.ge_u
        br_if 1 (;@1;)
      end
    end
    i32.const 1)
  (func $montmul256_32bitlimbs (type 2) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64)
    global.get 0
    i32.const -64
    i32.add
    local.tee 5
    global.set 0
    local.get 5
    i32.const 64
    call $memset
    local.tee 9
    i32.const 8
    i32.or
    local.set 10
    local.get 3
    i32.load
    local.set 13
    local.get 1
    i32.load
    local.set 14
    i32.const 2
    local.set 11
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 8
        i32.eq
        if  ;; label = @3
          local.get 9
          i32.const 32
          i32.add
          local.set 0
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 0
        local.get 6
        i32.const 2
        i32.shl
        local.tee 3
        i32.add
        i32.load
        local.tee 5
        local.get 14
        i32.mul
        local.get 3
        local.get 9
        i32.add
        local.tee 15
        i32.load
        i32.add
        local.get 13
        i32.mul
        i64.extend_i32_u
        local.set 18
        local.get 5
        i64.extend_i32_u
        local.set 19
        i32.const 0
        local.set 7
        local.get 11
        local.set 5
        local.get 10
        local.set 12
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 7
          i32.const 8
          i32.eq
          if  ;; label = @4
            local.get 15
            i32.const 32
            i32.add
            local.tee 5
            local.get 5
            i32.load
            local.get 3
            i32.add
            i32.store
            local.get 11
            i32.const 1
            i32.add
            local.set 11
            local.get 10
            i32.const 4
            i32.add
            local.set 10
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 9
            local.get 6
            local.get 7
            i32.add
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            local.get 8
            i64.load32_u
            local.get 3
            i64.extend_i32_u
            local.get 1
            local.get 7
            i32.const 2
            i32.shl
            local.tee 3
            i32.add
            i64.load32_u
            local.get 19
            i64.mul
            i64.add
            i64.add
            local.tee 20
            local.get 2
            local.get 3
            i32.add
            i64.load32_u
            local.get 18
            i64.mul
            i64.add
            local.tee 17
            i64.store32
            local.get 17
            i64.const 32
            i64.shr_u
            block  ;; label = @5
              local.get 17
              local.get 20
              i64.ge_u
              br_if 0 (;@5;)
              local.get 5
              local.set 8
              local.get 12
              local.set 3
              loop  ;; label = @6
                local.get 8
                i32.const 15
                i32.gt_u
                br_if 1 (;@5;)
                local.get 3
                i32.load
                local.tee 16
                i32.const -1
                i32.eq
                if  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.store
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 3
                  i32.const 4
                  i32.add
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 3
              local.get 16
              i32.const 1
              i32.add
              i32.store
            end
            i32.wrap_i64
            local.set 3
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 12
            i32.const 4
            i32.add
            local.set 12
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 3
      i32.const 32
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 3
        i32.add
        i32.load
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    local.get 2
    local.get 4
    call $less_than_or_equal256_32bitlimbs
    if  ;; label = @1
      local.get 4
      local.get 2
      local.get 4
      call $subtract256_32bitlimbs
    end
    local.get 9
    i32.const -64
    i32.sub
    global.set 0)
  (func $memset (type 4) (param i32 i32) (result i32)
    loop  ;; label = @1
      local.get 1
      if  ;; label = @2
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
        local.set 1
        br 1 (;@1;)
      end
    end
    local.get 0)
  (func $subtract768_32bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i32 i32)
    loop  ;; label = @1
      local.get 3
      i32.const 96
      i32.ne
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.add
        local.get 0
        local.get 3
        i32.add
        i32.load
        local.tee 5
        local.get 4
        i32.sub
        local.get 1
        local.get 3
        i32.add
        i32.load
        i32.sub
        local.tee 4
        i32.store
        local.get 4
        local.get 5
        i32.gt_u
        local.set 4
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func $less_than_or_equal768_32bitlimbs (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 1
    i32.const 92
    i32.add
    local.set 1
    local.get 0
    i32.const 92
    i32.add
    local.set 0
    i32.const 24
    local.set 2
    loop  ;; label = @1
      local.get 2
      i32.const -1
      i32.add
      local.tee 2
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.load
        local.tee 4
        i32.gt_u
        if  ;; label = @3
          i32.const 0
          return
        end
        local.get 1
        i32.const -4
        i32.add
        local.set 1
        local.get 0
        i32.const -4
        i32.add
        local.set 0
        local.get 3
        local.get 4
        i32.ge_u
        br_if 1 (;@1;)
      end
    end
    i32.const 1)
  (func $montmul768_32bitlimbs (type 2) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 192
    call $memset
    local.tee 9
    i32.const 8
    i32.or
    local.set 10
    local.get 3
    i32.load
    local.set 13
    local.get 1
    i32.load
    local.set 14
    i32.const 2
    local.set 11
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 24
        i32.eq
        if  ;; label = @3
          local.get 9
          i32.const 96
          i32.add
          local.set 0
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 0
        local.get 6
        i32.const 2
        i32.shl
        local.tee 3
        i32.add
        i32.load
        local.tee 5
        local.get 14
        i32.mul
        local.get 3
        local.get 9
        i32.add
        local.tee 15
        i32.load
        i32.add
        local.get 13
        i32.mul
        i64.extend_i32_u
        local.set 18
        local.get 5
        i64.extend_i32_u
        local.set 19
        i32.const 0
        local.set 7
        local.get 11
        local.set 5
        local.get 10
        local.set 12
        i32.const 0
        local.set 3
        loop  ;; label = @3
          local.get 7
          i32.const 24
          i32.eq
          if  ;; label = @4
            local.get 15
            i32.const 96
            i32.add
            local.tee 5
            local.get 5
            i32.load
            local.get 3
            i32.add
            i32.store
            local.get 11
            i32.const 1
            i32.add
            local.set 11
            local.get 10
            i32.const 4
            i32.add
            local.set 10
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 9
            local.get 6
            local.get 7
            i32.add
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            local.get 8
            i64.load32_u
            local.get 3
            i64.extend_i32_u
            local.get 1
            local.get 7
            i32.const 2
            i32.shl
            local.tee 3
            i32.add
            i64.load32_u
            local.get 19
            i64.mul
            i64.add
            i64.add
            local.tee 20
            local.get 2
            local.get 3
            i32.add
            i64.load32_u
            local.get 18
            i64.mul
            i64.add
            local.tee 17
            i64.store32
            local.get 17
            i64.const 32
            i64.shr_u
            block  ;; label = @5
              local.get 17
              local.get 20
              i64.ge_u
              br_if 0 (;@5;)
              local.get 5
              local.set 8
              local.get 12
              local.set 3
              loop  ;; label = @6
                local.get 8
                i32.const 47
                i32.gt_u
                br_if 1 (;@5;)
                local.get 3
                i32.load
                local.tee 16
                i32.const -1
                i32.eq
                if  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.store
                  local.get 8
                  i32.const 1
                  i32.add
                  local.set 8
                  local.get 3
                  i32.const 4
                  i32.add
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 3
              local.get 16
              i32.const 1
              i32.add
              i32.store
            end
            i32.wrap_i64
            local.set 3
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 12
            i32.const 4
            i32.add
            local.set 12
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 3
      i32.const 96
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 3
        i32.add
        i32.load
        i32.store
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    local.get 2
    local.get 4
    call $less_than_or_equal768_32bitlimbs
    if  ;; label = @1
      local.get 4
      local.get 2
      local.get 4
      call $subtract768_32bitlimbs
    end
    local.get 9
    i32.const 192
    i32.add
    global.set 0)
  (func $subtract256_64bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i64 i64)
    loop  ;; label = @1
      local.get 3
      i32.const 32
      i32.ne
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.add
        local.get 0
        local.get 3
        i32.add
        i64.load
        local.tee 5
        local.get 4
        i64.sub
        local.get 1
        local.get 3
        i32.add
        i64.load
        i64.sub
        local.tee 4
        i64.store
        local.get 4
        local.get 5
        i64.gt_u
        i64.extend_i32_u
        local.set 4
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func $less_than_or_equal256_64bitlimbs (type 3) (param i32 i32) (result i64)
    (local i32 i64 i64)
    local.get 1
    i32.const 24
    i32.add
    local.set 1
    local.get 0
    i32.const 24
    i32.add
    local.set 0
    i32.const 4
    local.set 2
    loop  ;; label = @1
      local.get 2
      i32.const -1
      i32.add
      local.tee 2
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        i64.load
        local.tee 3
        local.get 1
        i64.load
        local.tee 4
        i64.gt_u
        if  ;; label = @3
          i64.const 0
          return
        end
        local.get 1
        i32.const -8
        i32.add
        local.set 1
        local.get 0
        i32.const -8
        i32.add
        local.set 0
        local.get 3
        local.get 4
        i64.ge_u
        br_if 1 (;@1;)
      end
    end
    i64.const 1)
  (func $montmul256_64bitlimbs (type 2) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 32
    i32.add
    i32.const 64
    call $memset
    drop
    local.get 5
    i32.const 48
    i32.add
    local.set 8
    local.get 3
    i64.load
    local.set 16
    local.get 1
    i64.load
    local.set 17
    i32.const 2
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 4
        i32.eq
        if  ;; label = @3
          local.get 5
          i32.const -64
          i32.sub
          local.set 0
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 0
        local.get 6
        i32.const 3
        i32.shl
        local.tee 3
        i32.add
        i64.load
        local.tee 18
        local.get 17
        i64.mul
        local.get 5
        i32.const 32
        i32.add
        local.get 3
        i32.add
        local.tee 13
        i64.load
        i64.add
        local.get 16
        i64.mul
        local.set 19
        i64.const 0
        local.set 14
        i32.const 0
        local.set 7
        local.get 9
        local.set 10
        local.get 8
        local.set 11
        loop  ;; label = @3
          local.get 7
          i32.const 4
          i32.eq
          if  ;; label = @4
            local.get 13
            i32.const 32
            i32.add
            local.tee 3
            local.get 3
            i64.load
            local.get 14
            i64.add
            i64.store
            local.get 9
            i32.const 1
            i32.add
            local.set 9
            local.get 8
            i32.const 8
            i32.add
            local.set 8
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 5
            i32.const 16
            i32.add
            local.get 1
            local.get 7
            i32.const 3
            i32.shl
            local.tee 3
            i32.add
            i64.load
            local.get 18
            call $__multi3
            local.get 5
            local.get 2
            local.get 3
            i32.add
            i64.load
            local.get 19
            call $__multi3
            local.get 5
            i32.const 32
            i32.add
            local.get 6
            local.get 7
            i32.add
            i32.const 3
            i32.shl
            i32.add
            local.tee 3
            local.get 5
            i64.load offset=16
            local.tee 20
            local.get 14
            i64.add
            local.tee 14
            local.get 3
            i64.load
            i64.add
            local.tee 15
            local.get 5
            i64.load
            i64.add
            local.tee 21
            i64.store
            block  ;; label = @5
              local.get 21
              local.get 15
              i64.lt_u
              local.tee 3
              local.get 3
              i64.extend_i32_u
              local.get 15
              local.get 14
              i64.lt_u
              i64.extend_i32_u
              local.get 5
              i32.const 24
              i32.add
              i64.load
              local.get 14
              local.get 20
              i64.lt_u
              i64.extend_i32_u
              i64.add
              i64.add
              local.tee 15
              local.get 5
              i32.const 8
              i32.add
              i64.load
              i64.add
              i64.add
              local.tee 14
              local.get 15
              i64.lt_u
              local.get 14
              local.get 15
              i64.eq
              select
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 10
              local.set 12
              local.get 11
              local.set 3
              loop  ;; label = @6
                local.get 12
                i32.const 7
                i32.gt_u
                br_if 1 (;@5;)
                local.get 3
                i64.load
                local.tee 15
                i64.const -1
                i64.eq
                if  ;; label = @7
                  local.get 3
                  i64.const 0
                  i64.store
                  local.get 12
                  i32.const 1
                  i32.add
                  local.set 12
                  local.get 3
                  i32.const 8
                  i32.add
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 3
              local.get 15
              i64.const 1
              i64.add
              i64.store
            end
            local.get 10
            i32.const 1
            i32.add
            local.set 10
            local.get 11
            i32.const 8
            i32.add
            local.set 11
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 3
      i32.const 32
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 3
        i32.add
        i64.load
        i64.store
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    local.get 2
    local.get 4
    call $less_than_or_equal256_64bitlimbs
    i64.eqz
    i32.eqz
    if  ;; label = @1
      local.get 4
      local.get 2
      local.get 4
      call $subtract256_64bitlimbs
    end
    local.get 5
    i32.const 96
    i32.add
    global.set 0)
  (func $subtract768_64bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i64 i64)
    loop  ;; label = @1
      local.get 3
      i32.const 96
      i32.ne
      if  ;; label = @2
        local.get 2
        local.get 3
        i32.add
        local.get 0
        local.get 3
        i32.add
        i64.load
        local.tee 5
        local.get 4
        i64.sub
        local.get 1
        local.get 3
        i32.add
        i64.load
        i64.sub
        local.tee 4
        i64.store
        local.get 4
        local.get 5
        i64.gt_u
        i64.extend_i32_u
        local.set 4
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func $less_than_or_equal768_64bitlimbs (type 3) (param i32 i32) (result i64)
    (local i32 i64 i64)
    local.get 1
    i32.const 88
    i32.add
    local.set 1
    local.get 0
    i32.const 88
    i32.add
    local.set 0
    i32.const 12
    local.set 2
    loop  ;; label = @1
      local.get 2
      i32.const -1
      i32.add
      local.tee 2
      i32.const 0
      i32.ge_s
      if  ;; label = @2
        local.get 0
        i64.load
        local.tee 3
        local.get 1
        i64.load
        local.tee 4
        i64.gt_u
        if  ;; label = @3
          i64.const 0
          return
        end
        local.get 1
        i32.const -8
        i32.add
        local.set 1
        local.get 0
        i32.const -8
        i32.add
        local.set 0
        local.get 3
        local.get 4
        i64.ge_u
        br_if 1 (;@1;)
      end
    end
    i64.const 1)
  (func $montmul768_64bitlimbs (type 2) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 224
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 32
    i32.add
    i32.const 192
    call $memset
    drop
    local.get 5
    i32.const 48
    i32.add
    local.set 8
    local.get 3
    i64.load
    local.set 16
    local.get 1
    i64.load
    local.set 17
    i32.const 2
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 12
        i32.eq
        if  ;; label = @3
          local.get 5
          i32.const 128
          i32.add
          local.set 0
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 0
        local.get 6
        i32.const 3
        i32.shl
        local.tee 3
        i32.add
        i64.load
        local.tee 18
        local.get 17
        i64.mul
        local.get 5
        i32.const 32
        i32.add
        local.get 3
        i32.add
        local.tee 13
        i64.load
        i64.add
        local.get 16
        i64.mul
        local.set 19
        i64.const 0
        local.set 14
        i32.const 0
        local.set 7
        local.get 9
        local.set 10
        local.get 8
        local.set 11
        loop  ;; label = @3
          local.get 7
          i32.const 12
          i32.eq
          if  ;; label = @4
            local.get 13
            i32.const 96
            i32.add
            local.tee 3
            local.get 3
            i64.load
            local.get 14
            i64.add
            i64.store
            local.get 9
            i32.const 1
            i32.add
            local.set 9
            local.get 8
            i32.const 8
            i32.add
            local.set 8
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 5
            i32.const 16
            i32.add
            local.get 1
            local.get 7
            i32.const 3
            i32.shl
            local.tee 3
            i32.add
            i64.load
            local.get 18
            call $__multi3
            local.get 5
            local.get 2
            local.get 3
            i32.add
            i64.load
            local.get 19
            call $__multi3
            local.get 5
            i32.const 32
            i32.add
            local.get 6
            local.get 7
            i32.add
            i32.const 3
            i32.shl
            i32.add
            local.tee 3
            local.get 5
            i64.load offset=16
            local.tee 20
            local.get 14
            i64.add
            local.tee 14
            local.get 3
            i64.load
            i64.add
            local.tee 15
            local.get 5
            i64.load
            i64.add
            local.tee 21
            i64.store
            block  ;; label = @5
              local.get 21
              local.get 15
              i64.lt_u
              local.tee 3
              local.get 3
              i64.extend_i32_u
              local.get 15
              local.get 14
              i64.lt_u
              i64.extend_i32_u
              local.get 5
              i32.const 24
              i32.add
              i64.load
              local.get 14
              local.get 20
              i64.lt_u
              i64.extend_i32_u
              i64.add
              i64.add
              local.tee 15
              local.get 5
              i32.const 8
              i32.add
              i64.load
              i64.add
              i64.add
              local.tee 14
              local.get 15
              i64.lt_u
              local.get 14
              local.get 15
              i64.eq
              select
              i32.const 1
              i32.ne
              br_if 0 (;@5;)
              local.get 10
              local.set 12
              local.get 11
              local.set 3
              loop  ;; label = @6
                local.get 12
                i32.const 23
                i32.gt_u
                br_if 1 (;@5;)
                local.get 3
                i64.load
                local.tee 15
                i64.const -1
                i64.eq
                if  ;; label = @7
                  local.get 3
                  i64.const 0
                  i64.store
                  local.get 12
                  i32.const 1
                  i32.add
                  local.set 12
                  local.get 3
                  i32.const 8
                  i32.add
                  local.set 3
                  br 1 (;@6;)
                end
              end
              local.get 3
              local.get 15
              i64.const 1
              i64.add
              i64.store
            end
            local.get 10
            i32.const 1
            i32.add
            local.set 10
            local.get 11
            i32.const 8
            i32.add
            local.set 11
            local.get 7
            i32.const 1
            i32.add
            local.set 7
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 3
      i32.const 96
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 3
        i32.add
        i64.load
        i64.store
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    local.get 2
    local.get 4
    call $less_than_or_equal768_64bitlimbs
    i64.eqz
    i32.eqz
    if  ;; label = @1
      local.get 4
      local.get 2
      local.get 4
      call $subtract768_64bitlimbs
    end
    local.get 5
    i32.const 224
    i32.add
    global.set 0)
  (func $__multi3 (type 5) (param i32 i64 i64)
    (local i64 i64 i64)
    local.get 0
    local.get 2
    i64.const 32
    i64.shr_u
    local.tee 3
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
    i64.mul
    i64.const 0
    i64.add
    local.get 2
    i64.const 4294967295
    i64.and
    local.tee 2
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 2
    local.get 4
    i64.mul
    i64.add
    local.tee 2
    i64.const 32
    i64.shr_u
    i64.add
    local.get 1
    local.get 3
    i64.mul
    local.get 2
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
  (export "montmul256_32bitlimbs" (func $montmul256_32bitlimbs))
  (export "montmul768_32bitlimbs" (func $montmul768_32bitlimbs))
  (export "montmul256_64bitlimbs" (func $montmul256_64bitlimbs))
  (export "montmul768_64bitlimbs" (func $montmul768_64bitlimbs)))
