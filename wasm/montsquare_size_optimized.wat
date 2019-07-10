(module
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32) (result i64)))
  (type (;5;) (func (param i32 i64 i64 i64)))
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
  (func $square256_32bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64)
    global.get 0
    i32.const 128
    i32.sub
    local.set 5
    loop  ;; label = @1
      local.get 2
      i32.const 128
      i32.eq
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.add
          local.set 6
          local.get 5
          i32.const 8
          i32.or
          local.set 7
          i32.const 7
          local.set 8
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.eq
            if  ;; label = @5
              local.get 5
              local.set 3
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 64
                i32.eq
                br_if 3 (;@3;)
                local.get 1
                local.get 2
                i32.add
                local.get 3
                i64.load
                i64.store32
                local.get 2
                i32.const 4
                i32.add
                local.set 2
                local.get 3
                i32.const 8
                i32.add
                local.set 3
                br 0 (;@6;)
              end
              unreachable
            end
            local.get 5
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
            local.tee 11
            local.get 11
            i64.mul
            i64.add
            local.tee 12
            i64.const 4294967295
            i64.and
            i64.store
            local.get 4
            i32.const 1
            i32.add
            local.set 10
            local.get 11
            i64.const 1
            i64.shl
            local.set 13
            local.get 8
            local.set 3
            local.get 6
            local.set 9
            local.get 7
            local.set 2
            loop  ;; label = @5
              local.get 12
              i64.const 32
              i64.shr_u
              local.set 11
              local.get 3
              if  ;; label = @6
                local.get 2
                local.get 2
                i64.load
                local.get 11
                i64.add
                local.get 13
                local.get 9
                i64.load32_u
                i64.mul
                i64.add
                local.tee 12
                i64.const 4294967295
                i64.and
                i64.store
                local.get 3
                i32.const -1
                i32.add
                local.set 3
                local.get 9
                i32.const 4
                i32.add
                local.set 9
                local.get 2
                i32.const 8
                i32.add
                local.set 2
                br 1 (;@5;)
              else
                local.get 5
                local.get 4
                i32.const 3
                i32.shl
                i32.add
                i32.const -64
                i32.sub
                local.get 11
                i64.store
                local.get 8
                i32.const -1
                i32.add
                local.set 8
                local.get 6
                i32.const 4
                i32.add
                local.set 6
                local.get 7
                i32.const 16
                i32.add
                local.set 7
                local.get 10
                local.set 4
                br 2 (;@4;)
              end
              unreachable
            end
            unreachable
          end
          unreachable
        end
      else
        local.get 2
        local.get 5
        i32.add
        i64.const 0
        i64.store
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end)
  (func $montreduce256_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    local.get 0
    i32.const 36
    i32.add
    local.set 7
    i32.const 9
    local.set 8
    local.get 0
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 8
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const 32
          i32.add
          local.set 0
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.load
        local.get 0
        local.get 6
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.mul
        local.set 5
        i64.const 0
        local.set 11
        i32.const 0
        local.set 4
        loop  ;; label = @3
          local.get 4
          i32.const 32
          i32.eq
          if  ;; label = @4
            local.get 8
            local.set 5
            local.get 7
            local.set 4
            loop  ;; label = @5
              local.get 11
              i64.eqz
              local.get 5
              i32.const 15
              i32.gt_u
              i32.or
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 11
                local.get 4
                i64.load32_u
                i64.add
                local.tee 11
                i64.store32
                local.get 5
                i32.const 1
                i32.add
                local.set 5
                local.get 4
                i32.const 4
                i32.add
                local.set 4
                local.get 11
                i64.const 32
                i64.shr_u
                local.set 11
                br 1 (;@5;)
              end
            end
            local.get 8
            i32.const 1
            i32.add
            local.set 8
            local.get 7
            i32.const 4
            i32.add
            local.set 7
            local.get 9
            i32.const 4
            i32.add
            local.set 9
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
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
            local.set 4
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 32
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 4
        i32.add
        i32.load
        i32.store
        local.get 4
        i32.const 4
        i32.add
        local.set 4
        br 1 (;@1;)
      end
    end
    local.get 1
    local.get 3
    call $less_than_or_equal256_32bitlimbs
    if  ;; label = @1
      local.get 3
      local.get 1
      local.get 3
      call $subtract256_32bitlimbs
    end)
  (func $montsquare256_32bitlimbs (type 3) (param i32 i32 i32 i32)
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
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 32
      i32.eq
      if  ;; label = @2
        local.get 4
        i32.const -64
        i32.sub
        global.set 0
      else
        local.get 0
        local.get 1
        i32.add
        local.get 0
        local.get 4
        i32.add
        i32.load
        i32.store
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
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
  (func $square768_32bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64)
    global.get 0
    i32.const 384
    i32.sub
    local.tee 4
    global.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 384
      i32.eq
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.add
          local.set 6
          local.get 4
          i32.const 8
          i32.or
          local.set 7
          i32.const 23
          local.set 8
          loop  ;; label = @4
            local.get 5
            i32.const 24
            i32.eq
            if  ;; label = @5
              local.get 4
              local.set 3
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 192
                i32.eq
                br_if 3 (;@3;)
                local.get 1
                local.get 2
                i32.add
                local.get 3
                i64.load
                i64.store32
                local.get 2
                i32.const 4
                i32.add
                local.set 2
                local.get 3
                i32.const 8
                i32.add
                local.set 3
                br 0 (;@6;)
              end
              unreachable
            end
            local.get 4
            local.get 5
            i32.const 4
            i32.shl
            i32.add
            local.tee 3
            local.get 3
            i64.load
            local.get 0
            local.get 5
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
            local.get 5
            i32.const 1
            i32.add
            local.set 10
            local.get 12
            i64.const 1
            i64.shl
            local.set 12
            local.get 8
            local.set 3
            local.get 6
            local.set 9
            local.get 7
            local.set 2
            loop  ;; label = @5
              local.get 11
              i64.const 32
              i64.shr_u
              local.set 11
              local.get 3
              if  ;; label = @6
                local.get 2
                local.get 2
                i64.load
                local.get 11
                i64.add
                local.get 12
                local.get 9
                i64.load32_u
                i64.mul
                i64.add
                local.tee 11
                i64.const 4294967295
                i64.and
                i64.store
                local.get 3
                i32.const -1
                i32.add
                local.set 3
                local.get 9
                i32.const 4
                i32.add
                local.set 9
                local.get 2
                i32.const 8
                i32.add
                local.set 2
                br 1 (;@5;)
              else
                local.get 4
                local.get 5
                i32.const 3
                i32.shl
                i32.add
                i32.const 192
                i32.add
                local.get 11
                i64.store
                local.get 8
                i32.const -1
                i32.add
                local.set 8
                local.get 6
                i32.const 4
                i32.add
                local.set 6
                local.get 7
                i32.const 16
                i32.add
                local.set 7
                local.get 10
                local.set 5
                br 2 (;@4;)
              end
              unreachable
            end
            unreachable
          end
          unreachable
        end
      else
        local.get 2
        local.get 4
        i32.add
        i64.const 0
        i64.store
        local.get 2
        i32.const 8
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 4
    i32.const 384
    i32.add
    global.set 0)
  (func $montreduce768_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    local.get 0
    i32.const 100
    i32.add
    local.set 7
    i32.const 25
    local.set 8
    local.get 0
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 24
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const 96
          i32.add
          local.set 0
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.load
        local.get 0
        local.get 6
        i32.const 2
        i32.shl
        i32.add
        i32.load
        i32.mul
        local.set 5
        i64.const 0
        local.set 11
        i32.const 0
        local.set 4
        loop  ;; label = @3
          local.get 4
          i32.const 96
          i32.eq
          if  ;; label = @4
            local.get 8
            local.set 5
            local.get 7
            local.set 4
            loop  ;; label = @5
              local.get 11
              i64.eqz
              local.get 5
              i32.const 47
              i32.gt_u
              i32.or
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 11
                local.get 4
                i64.load32_u
                i64.add
                local.tee 11
                i64.store32
                local.get 5
                i32.const 1
                i32.add
                local.set 5
                local.get 4
                i32.const 4
                i32.add
                local.set 4
                local.get 11
                i64.const 32
                i64.shr_u
                local.set 11
                br 1 (;@5;)
              end
            end
            local.get 8
            i32.const 1
            i32.add
            local.set 8
            local.get 7
            i32.const 4
            i32.add
            local.set 7
            local.get 9
            i32.const 4
            i32.add
            local.set 9
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
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
            local.set 4
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 96
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 4
        i32.add
        i32.load
        i32.store
        local.get 4
        i32.const 4
        i32.add
        local.set 4
        br 1 (;@1;)
      end
    end
    local.get 1
    local.get 3
    call $less_than_or_equal768_32bitlimbs
    if  ;; label = @1
      local.get 3
      local.get 1
      local.get 3
      call $subtract768_32bitlimbs
    end)
  (func $montsquare768_32bitlimbs (type 3) (param i32 i32 i32 i32)
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
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 96
      i32.eq
      if  ;; label = @2
        local.get 4
        i32.const 192
        i32.add
        global.set 0
      else
        local.get 0
        local.get 1
        i32.add
        local.get 0
        local.get 4
        i32.add
        i32.load
        i32.store
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
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
  (func $less_than_or_equal256_64bitlimbs (type 4) (param i32 i32) (result i64)
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
  (func $square256_64bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 3
    global.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 128
      i32.eq
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 8
          i32.add
          local.set 7
          local.get 3
          i32.const 48
          i32.add
          local.set 8
          i32.const 3
          local.set 9
          loop  ;; label = @4
            local.get 4
            i32.const 4
            i32.eq
            if  ;; label = @5
              local.get 3
              i32.const 32
              i32.add
              local.set 5
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 64
                i32.eq
                br_if 3 (;@3;)
                local.get 1
                local.get 2
                i32.add
                local.get 5
                i64.load
                i64.store
                local.get 2
                i32.const 8
                i32.add
                local.set 2
                local.get 5
                i32.const 16
                i32.add
                local.set 5
                br 0 (;@6;)
              end
              unreachable
            end
            local.get 3
            i32.const 16
            i32.add
            local.get 0
            local.get 4
            i32.const 3
            i32.shl
            i32.add
            i64.load
            local.tee 13
            i64.const 0
            local.get 13
            call $__multi3
            local.get 3
            i32.const 32
            i32.add
            local.get 4
            i32.const 5
            i32.shl
            i32.add
            local.tee 6
            i64.load offset=8
            local.set 14
            local.get 6
            i64.const 0
            i64.store offset=8
            local.get 6
            local.get 3
            i64.load offset=16
            local.tee 15
            local.get 6
            i64.load
            i64.add
            local.tee 12
            i64.store
            local.get 12
            local.get 15
            i64.lt_u
            i64.extend_i32_u
            local.get 14
            local.get 3
            i32.const 24
            i32.add
            i64.load
            i64.add
            i64.add
            local.set 12
            local.get 4
            i32.const 1
            i32.add
            local.set 6
            local.get 13
            i64.const 63
            i64.shr_u
            local.set 17
            local.get 13
            i64.const 1
            i64.shl
            local.set 13
            local.get 9
            local.set 5
            local.get 7
            local.set 10
            local.get 8
            local.set 2
            loop  ;; label = @5
              local.get 5
              if  ;; label = @6
                local.get 3
                local.get 13
                local.get 17
                local.get 10
                i64.load
                call $__multi3
                local.get 2
                i32.const 8
                i32.add
                local.tee 11
                i64.load
                local.set 14
                local.get 11
                i64.const 0
                i64.store
                local.get 2
                local.get 2
                i64.load
                local.tee 15
                local.get 12
                i64.add
                local.tee 16
                local.get 3
                i64.load
                i64.add
                local.tee 12
                i64.store
                local.get 12
                local.get 16
                i64.lt_u
                i64.extend_i32_u
                local.get 3
                i32.const 8
                i32.add
                i64.load
                local.get 14
                local.get 16
                local.get 15
                i64.lt_u
                i64.extend_i32_u
                i64.add
                i64.add
                i64.add
                local.set 12
                local.get 5
                i32.const -1
                i32.add
                local.set 5
                local.get 10
                i32.const 8
                i32.add
                local.set 10
                local.get 2
                i32.const 16
                i32.add
                local.set 2
                br 1 (;@5;)
              else
                local.get 3
                i32.const 32
                i32.add
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                local.tee 4
                i32.const 72
                i32.add
                i64.const 0
                i64.store
                local.get 4
                i32.const -64
                i32.sub
                local.get 12
                i64.store
                local.get 9
                i32.const -1
                i32.add
                local.set 9
                local.get 7
                i32.const 8
                i32.add
                local.set 7
                local.get 8
                i32.const 32
                i32.add
                local.set 8
                local.get 6
                local.set 4
                br 2 (;@4;)
              end
              unreachable
            end
            unreachable
          end
          unreachable
        end
      else
        local.get 3
        i32.const 32
        i32.add
        local.get 2
        i32.add
        local.tee 6
        i64.const 0
        i64.store offset=8
        local.get 6
        i64.const 0
        i64.store
        local.get 2
        i32.const 16
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 3
    i32.const 160
    i32.add
    global.set 0)
  (func $montreduce256_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    local.get 0
    i32.const 40
    i32.add
    local.set 7
    i32.const 5
    local.set 8
    local.get 0
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 4
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const 32
          i32.add
          local.set 0
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i64.load
        local.get 0
        local.get 6
        i32.const 3
        i32.shl
        i32.add
        i64.load
        i64.mul
        local.set 12
        i32.const 0
        local.set 4
        i64.const 0
        local.set 10
        loop  ;; label = @3
          local.get 4
          i32.const 32
          i32.eq
          if  ;; label = @4
            local.get 8
            local.set 5
            local.get 7
            local.set 4
            loop  ;; label = @5
              local.get 10
              i64.eqz
              local.get 5
              i32.const 7
              i32.gt_u
              i32.or
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 10
                local.get 4
                i64.load
                i64.add
                local.tee 11
                i64.store
                local.get 5
                i32.const 1
                i32.add
                local.set 5
                local.get 4
                i32.const 8
                i32.add
                local.set 4
                local.get 11
                local.get 10
                i64.lt_u
                i64.extend_i32_u
                i64.const 0
                i64.add
                local.set 10
                br 1 (;@5;)
              end
            end
            local.get 8
            i32.const 1
            i32.add
            local.set 8
            local.get 7
            i32.const 8
            i32.add
            local.set 7
            local.get 9
            i32.const 8
            i32.add
            local.set 9
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 4
            local.get 9
            i32.add
            local.tee 5
            local.get 10
            local.get 12
            local.get 1
            local.get 4
            i32.add
            i64.load
            i64.mul
            i64.add
            local.tee 11
            local.get 5
            i64.load
            i64.add
            local.tee 13
            i64.store
            local.get 13
            local.get 11
            i64.lt_u
            i64.extend_i32_u
            local.get 11
            local.get 10
            i64.lt_u
            i64.extend_i32_u
            i64.const 0
            i64.add
            i64.add
            local.set 10
            local.get 4
            i32.const 8
            i32.add
            local.set 4
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 32
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 4
        i32.add
        i64.load
        i64.store
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
    end
    local.get 1
    local.get 3
    call $less_than_or_equal256_64bitlimbs
    i64.eqz
    i32.eqz
    if  ;; label = @1
      local.get 3
      local.get 1
      local.get 3
      call $subtract256_64bitlimbs
    end)
  (func $montsquare256_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const -64
    i32.add
    local.tee 4
    global.set 0
    local.get 0
    local.get 4
    call $square256_64bitlimbs
    local.get 0
    local.get 4
    local.get 2
    local.get 3
    call $montreduce256_64bitlimbs
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 32
      i32.eq
      if  ;; label = @2
        local.get 4
        i32.const -64
        i32.sub
        global.set 0
      else
        local.get 0
        local.get 1
        i32.add
        local.get 0
        local.get 4
        i32.add
        i64.load
        i64.store
        local.get 0
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
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
  (func $less_than_or_equal768_64bitlimbs (type 4) (param i32 i32) (result i64)
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
  (func $square768_64bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64)
    global.get 0
    i32.const 416
    i32.sub
    local.tee 3
    global.set 0
    loop  ;; label = @1
      local.get 2
      i32.const 384
      i32.eq
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 8
          i32.add
          local.set 7
          local.get 3
          i32.const 48
          i32.add
          local.set 8
          i32.const 11
          local.set 9
          loop  ;; label = @4
            local.get 4
            i32.const 12
            i32.eq
            if  ;; label = @5
              local.get 3
              i32.const 32
              i32.add
              local.set 5
              i32.const 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 192
                i32.eq
                br_if 3 (;@3;)
                local.get 1
                local.get 2
                i32.add
                local.get 5
                i64.load
                i64.store
                local.get 2
                i32.const 8
                i32.add
                local.set 2
                local.get 5
                i32.const 16
                i32.add
                local.set 5
                br 0 (;@6;)
              end
              unreachable
            end
            local.get 3
            i32.const 16
            i32.add
            local.get 0
            local.get 4
            i32.const 3
            i32.shl
            i32.add
            i64.load
            local.tee 13
            i64.const 0
            local.get 13
            call $__multi3
            local.get 3
            i32.const 32
            i32.add
            local.get 4
            i32.const 5
            i32.shl
            i32.add
            local.tee 6
            i64.load offset=8
            local.set 14
            local.get 6
            i64.const 0
            i64.store offset=8
            local.get 6
            local.get 3
            i64.load offset=16
            local.tee 15
            local.get 6
            i64.load
            i64.add
            local.tee 12
            i64.store
            local.get 12
            local.get 15
            i64.lt_u
            i64.extend_i32_u
            local.get 14
            local.get 3
            i32.const 24
            i32.add
            i64.load
            i64.add
            i64.add
            local.set 12
            local.get 4
            i32.const 1
            i32.add
            local.set 6
            local.get 13
            i64.const 63
            i64.shr_u
            local.set 17
            local.get 13
            i64.const 1
            i64.shl
            local.set 13
            local.get 9
            local.set 5
            local.get 7
            local.set 10
            local.get 8
            local.set 2
            loop  ;; label = @5
              local.get 5
              if  ;; label = @6
                local.get 3
                local.get 13
                local.get 17
                local.get 10
                i64.load
                call $__multi3
                local.get 2
                i32.const 8
                i32.add
                local.tee 11
                i64.load
                local.set 14
                local.get 11
                i64.const 0
                i64.store
                local.get 2
                local.get 2
                i64.load
                local.tee 15
                local.get 12
                i64.add
                local.tee 16
                local.get 3
                i64.load
                i64.add
                local.tee 12
                i64.store
                local.get 12
                local.get 16
                i64.lt_u
                i64.extend_i32_u
                local.get 3
                i32.const 8
                i32.add
                i64.load
                local.get 14
                local.get 16
                local.get 15
                i64.lt_u
                i64.extend_i32_u
                i64.add
                i64.add
                i64.add
                local.set 12
                local.get 5
                i32.const -1
                i32.add
                local.set 5
                local.get 10
                i32.const 8
                i32.add
                local.set 10
                local.get 2
                i32.const 16
                i32.add
                local.set 2
                br 1 (;@5;)
              else
                local.get 3
                i32.const 32
                i32.add
                local.get 4
                i32.const 4
                i32.shl
                i32.add
                local.tee 4
                i32.const 200
                i32.add
                i64.const 0
                i64.store
                local.get 4
                i32.const 192
                i32.add
                local.get 12
                i64.store
                local.get 9
                i32.const -1
                i32.add
                local.set 9
                local.get 7
                i32.const 8
                i32.add
                local.set 7
                local.get 8
                i32.const 32
                i32.add
                local.set 8
                local.get 6
                local.set 4
                br 2 (;@4;)
              end
              unreachable
            end
            unreachable
          end
          unreachable
        end
      else
        local.get 3
        i32.const 32
        i32.add
        local.get 2
        i32.add
        local.tee 6
        i64.const 0
        i64.store offset=8
        local.get 6
        i64.const 0
        i64.store
        local.get 2
        i32.const 16
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 3
    i32.const 416
    i32.add
    global.set 0)
  (func $montreduce768_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64 i64 i64)
    local.get 0
    i32.const 104
    i32.add
    local.set 7
    i32.const 13
    local.set 8
    local.get 0
    local.set 9
    loop  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 12
        i32.eq
        if  ;; label = @3
          local.get 0
          i32.const 96
          i32.add
          local.set 0
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i64.load
        local.get 0
        local.get 6
        i32.const 3
        i32.shl
        i32.add
        i64.load
        i64.mul
        local.set 12
        i32.const 0
        local.set 4
        i64.const 0
        local.set 10
        loop  ;; label = @3
          local.get 4
          i32.const 96
          i32.eq
          if  ;; label = @4
            local.get 8
            local.set 5
            local.get 7
            local.set 4
            loop  ;; label = @5
              local.get 10
              i64.eqz
              local.get 5
              i32.const 23
              i32.gt_u
              i32.or
              i32.eqz
              if  ;; label = @6
                local.get 4
                local.get 10
                local.get 4
                i64.load
                i64.add
                local.tee 11
                i64.store
                local.get 5
                i32.const 1
                i32.add
                local.set 5
                local.get 4
                i32.const 8
                i32.add
                local.set 4
                local.get 11
                local.get 10
                i64.lt_u
                i64.extend_i32_u
                i64.const 0
                i64.add
                local.set 10
                br 1 (;@5;)
              end
            end
            local.get 8
            i32.const 1
            i32.add
            local.set 8
            local.get 7
            i32.const 8
            i32.add
            local.set 7
            local.get 9
            i32.const 8
            i32.add
            local.set 9
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            br 3 (;@1;)
          else
            local.get 4
            local.get 9
            i32.add
            local.tee 5
            local.get 10
            local.get 12
            local.get 1
            local.get 4
            i32.add
            i64.load
            i64.mul
            i64.add
            local.tee 11
            local.get 5
            i64.load
            i64.add
            local.tee 13
            i64.store
            local.get 13
            local.get 11
            i64.lt_u
            i64.extend_i32_u
            local.get 11
            local.get 10
            i64.lt_u
            i64.extend_i32_u
            i64.const 0
            i64.add
            i64.add
            local.set 10
            local.get 4
            i32.const 8
            i32.add
            local.set 4
            br 1 (;@3;)
          end
          unreachable
        end
        unreachable
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 96
      i32.eq
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.get 4
        i32.add
        local.get 0
        local.get 4
        i32.add
        i64.load
        i64.store
        local.get 4
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
    end
    local.get 1
    local.get 3
    call $less_than_or_equal768_64bitlimbs
    i64.eqz
    i32.eqz
    if  ;; label = @1
      local.get 3
      local.get 1
      local.get 3
      call $subtract768_64bitlimbs
    end)
  (func $montsquare768_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 192
    i32.sub
    local.tee 4
    global.set 0
    local.get 0
    local.get 4
    call $square768_64bitlimbs
    local.get 0
    local.get 4
    local.get 2
    local.get 3
    call $montreduce768_64bitlimbs
    i32.const 0
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 96
      i32.eq
      if  ;; label = @2
        local.get 4
        i32.const 192
        i32.add
        global.set 0
      else
        local.get 0
        local.get 1
        i32.add
        local.get 0
        local.get 4
        i32.add
        i64.load
        i64.store
        local.get 0
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func $__multi3 (type 5) (param i32 i64 i64 i64)
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
  (export "montsquare256_64bitlimbs" (func $montsquare256_64bitlimbs))
  (export "montsquare768_64bitlimbs" (func $montsquare768_64bitlimbs)))
