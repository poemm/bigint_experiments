(module
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32) (result i64)))
  (type (;5;) (func (param i32 i64 i64 i64 i64)))
  (func $subtract256_32bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    i32.const 0
    local.set 6
    local.get 5
    local.get 0
    i32.store offset=28
    local.get 5
    local.get 1
    i32.store offset=24
    local.get 5
    local.get 2
    i32.store offset=20
    local.get 5
    local.get 6
    i32.store offset=16
    local.get 5
    local.get 6
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 7
        local.get 5
        i32.load offset=12
        local.set 8
        local.get 8
        local.set 9
        local.get 7
        local.set 10
        local.get 9
        local.get 10
        i32.lt_s
        local.set 11
        i32.const 1
        local.set 12
        local.get 11
        local.get 12
        i32.and
        local.set 13
        local.get 13
        i32.eqz
        br_if 1 (;@1;)
        i32.const 1
        local.set 14
        i32.const 0
        local.set 15
        local.get 5
        i32.load offset=28
        local.set 16
        local.get 5
        i32.load offset=12
        local.set 17
        i32.const 2
        local.set 18
        local.get 17
        local.get 18
        i32.shl
        local.set 19
        local.get 16
        local.get 19
        i32.add
        local.set 20
        local.get 20
        i32.load
        local.set 21
        local.get 5
        i32.load offset=16
        local.set 22
        local.get 21
        local.get 22
        i32.sub
        local.set 23
        local.get 5
        i32.load offset=24
        local.set 24
        local.get 5
        i32.load offset=12
        local.set 25
        i32.const 2
        local.set 26
        local.get 25
        local.get 26
        i32.shl
        local.set 27
        local.get 24
        local.get 27
        i32.add
        local.set 28
        local.get 28
        i32.load
        local.set 29
        local.get 23
        local.get 29
        i32.sub
        local.set 30
        local.get 5
        local.get 30
        i32.store offset=8
        local.get 5
        i32.load offset=8
        local.set 31
        local.get 5
        i32.load offset=28
        local.set 32
        local.get 5
        i32.load offset=12
        local.set 33
        i32.const 2
        local.set 34
        local.get 33
        local.get 34
        i32.shl
        local.set 35
        local.get 32
        local.get 35
        i32.add
        local.set 36
        local.get 36
        i32.load
        local.set 37
        local.get 31
        local.set 38
        local.get 37
        local.set 39
        local.get 38
        local.get 39
        i32.gt_u
        local.set 40
        i32.const 1
        local.set 41
        local.get 40
        local.get 41
        i32.and
        local.set 42
        local.get 14
        local.get 15
        local.get 42
        select
        local.set 43
        local.get 5
        local.get 43
        i32.store offset=16
        local.get 5
        i32.load offset=8
        local.set 44
        local.get 5
        i32.load offset=20
        local.set 45
        local.get 5
        i32.load offset=12
        local.set 46
        i32.const 2
        local.set 47
        local.get 46
        local.get 47
        i32.shl
        local.set 48
        local.get 45
        local.get 48
        i32.add
        local.set 49
        local.get 49
        local.get 44
        i32.store
        local.get 5
        i32.load offset=12
        local.set 50
        i32.const 1
        local.set 51
        local.get 50
        local.get 51
        i32.add
        local.set 52
        local.get 5
        local.get 52
        i32.store offset=12
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    return)
  (func $less_than_or_equal256_32bitlimbs (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    i32.const 7
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 5
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          local.set 6
          local.get 4
          i32.load
          local.set 7
          local.get 7
          local.set 8
          local.get 6
          local.set 9
          local.get 8
          local.get 9
          i32.ge_s
          local.set 10
          i32.const 1
          local.set 11
          local.get 10
          local.get 11
          i32.and
          local.set 12
          local.get 12
          i32.eqz
          br_if 1 (;@2;)
          local.get 4
          i32.load offset=8
          local.set 13
          local.get 4
          i32.load
          local.set 14
          i32.const 2
          local.set 15
          local.get 14
          local.get 15
          i32.shl
          local.set 16
          local.get 13
          local.get 16
          i32.add
          local.set 17
          local.get 17
          i32.load
          local.set 18
          local.get 4
          i32.load offset=4
          local.set 19
          local.get 4
          i32.load
          local.set 20
          i32.const 2
          local.set 21
          local.get 20
          local.get 21
          i32.shl
          local.set 22
          local.get 19
          local.get 22
          i32.add
          local.set 23
          local.get 23
          i32.load
          local.set 24
          local.get 18
          local.set 25
          local.get 24
          local.set 26
          local.get 25
          local.get 26
          i32.gt_u
          local.set 27
          i32.const 1
          local.set 28
          local.get 27
          local.get 28
          i32.and
          local.set 29
          block  ;; label = @4
            local.get 29
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 30
            local.get 4
            local.get 30
            i32.store offset=12
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=8
          local.set 31
          local.get 4
          i32.load
          local.set 32
          i32.const 2
          local.set 33
          local.get 32
          local.get 33
          i32.shl
          local.set 34
          local.get 31
          local.get 34
          i32.add
          local.set 35
          local.get 35
          i32.load
          local.set 36
          local.get 4
          i32.load offset=4
          local.set 37
          local.get 4
          i32.load
          local.set 38
          i32.const 2
          local.set 39
          local.get 38
          local.get 39
          i32.shl
          local.set 40
          local.get 37
          local.get 40
          i32.add
          local.set 41
          local.get 41
          i32.load
          local.set 42
          local.get 36
          local.set 43
          local.get 42
          local.set 44
          local.get 43
          local.get 44
          i32.lt_u
          local.set 45
          i32.const 1
          local.set 46
          local.get 45
          local.get 46
          i32.and
          local.set 47
          block  ;; label = @4
            local.get 47
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 48
            local.get 4
            local.get 48
            i32.store offset=12
            br 3 (;@1;)
          end
          local.get 4
          i32.load
          local.set 49
          i32.const -1
          local.set 50
          local.get 49
          local.get 50
          i32.add
          local.set 51
          local.get 4
          local.get 51
          i32.store
          br 0 (;@3;)
          unreachable
        end
        unreachable
      end
      i32.const 1
      local.set 52
      local.get 4
      local.get 52
      i32.store offset=12
    end
    local.get 4
    i32.load offset=12
    local.set 53
    local.get 53
    return)
  (func $square256_32bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 2
    i32.const 192
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set 0
    i32.const 0
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=188
    local.get 4
    local.get 1
    i32.store offset=184
    local.get 4
    local.get 5
    i32.store offset=44
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 16
        local.set 6
        local.get 4
        i32.load offset=44
        local.set 7
        local.get 7
        local.set 8
        local.get 6
        local.set 9
        local.get 8
        local.get 9
        i32.lt_s
        local.set 10
        i32.const 1
        local.set 11
        local.get 10
        local.get 11
        i32.and
        local.set 12
        local.get 12
        i32.eqz
        br_if 1 (;@1;)
        i64.const 0
        local.set 146
        i32.const 48
        local.set 13
        local.get 4
        local.get 13
        i32.add
        local.set 14
        local.get 14
        local.set 15
        local.get 4
        i32.load offset=44
        local.set 16
        i32.const 3
        local.set 17
        local.get 16
        local.get 17
        i32.shl
        local.set 18
        local.get 15
        local.get 18
        i32.add
        local.set 19
        local.get 19
        local.get 146
        i64.store
        local.get 4
        i32.load offset=44
        local.set 20
        i32.const 1
        local.set 21
        local.get 20
        local.get 21
        i32.add
        local.set 22
        local.get 4
        local.get 22
        i32.store offset=44
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 23
    local.get 4
    local.get 23
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 24
        local.get 4
        i32.load offset=40
        local.set 25
        local.get 25
        local.set 26
        local.get 24
        local.set 27
        local.get 26
        local.get 27
        i32.lt_s
        local.set 28
        i32.const 1
        local.set 29
        local.get 28
        local.get 29
        i32.and
        local.set 30
        local.get 30
        i32.eqz
        br_if 1 (;@1;)
        i32.const 48
        local.set 31
        local.get 4
        local.get 31
        i32.add
        local.set 32
        local.get 32
        local.set 33
        local.get 4
        i32.load offset=40
        local.set 34
        i32.const 1
        local.set 35
        local.get 34
        local.get 35
        i32.shl
        local.set 36
        i32.const 3
        local.set 37
        local.get 36
        local.get 37
        i32.shl
        local.set 38
        local.get 33
        local.get 38
        i32.add
        local.set 39
        local.get 39
        i64.load
        local.set 147
        local.get 4
        i32.load offset=188
        local.set 40
        local.get 4
        i32.load offset=40
        local.set 41
        i32.const 2
        local.set 42
        local.get 41
        local.get 42
        i32.shl
        local.set 43
        local.get 40
        local.get 43
        i32.add
        local.set 44
        local.get 44
        i32.load
        local.set 45
        local.get 45
        local.set 46
        local.get 46
        i64.extend_i32_u
        local.set 148
        local.get 4
        i32.load offset=188
        local.set 47
        local.get 4
        i32.load offset=40
        local.set 48
        i32.const 2
        local.set 49
        local.get 48
        local.get 49
        i32.shl
        local.set 50
        local.get 47
        local.get 50
        i32.add
        local.set 51
        local.get 51
        i32.load
        local.set 52
        local.get 52
        local.set 53
        local.get 53
        i64.extend_i32_u
        local.set 149
        local.get 148
        local.get 149
        i64.mul
        local.set 150
        local.get 147
        local.get 150
        i64.add
        local.set 151
        local.get 4
        local.get 151
        i64.store offset=32
        local.get 4
        i64.load offset=32
        local.set 152
        i64.const 32
        local.set 153
        local.get 152
        local.get 153
        i64.shr_u
        local.set 154
        local.get 4
        local.get 154
        i64.store offset=24
        local.get 4
        i64.load offset=32
        local.set 155
        local.get 155
        i32.wrap_i64
        local.set 54
        local.get 4
        local.get 54
        i32.store offset=20
        local.get 4
        i32.load offset=20
        local.set 55
        local.get 55
        local.set 56
        local.get 56
        i64.extend_i32_u
        local.set 156
        local.get 4
        i32.load offset=40
        local.set 57
        i32.const 1
        local.set 58
        local.get 57
        local.get 58
        i32.shl
        local.set 59
        i32.const 3
        local.set 60
        local.get 59
        local.get 60
        i32.shl
        local.set 61
        local.get 33
        local.get 61
        i32.add
        local.set 62
        local.get 62
        local.get 156
        i64.store
        local.get 4
        i64.load offset=24
        local.set 157
        local.get 4
        local.get 157
        i64.store offset=8
        local.get 4
        i32.load offset=40
        local.set 63
        i32.const 1
        local.set 64
        local.get 63
        local.get 64
        i32.add
        local.set 65
        local.get 4
        local.get 65
        i32.store offset=4
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 8
            local.set 66
            local.get 4
            i32.load offset=4
            local.set 67
            local.get 67
            local.set 68
            local.get 66
            local.set 69
            local.get 68
            local.get 69
            i32.lt_s
            local.set 70
            i32.const 1
            local.set 71
            local.get 70
            local.get 71
            i32.and
            local.set 72
            local.get 72
            i32.eqz
            br_if 1 (;@3;)
            i32.const 48
            local.set 73
            local.get 4
            local.get 73
            i32.add
            local.set 74
            local.get 74
            local.set 75
            local.get 4
            i32.load offset=40
            local.set 76
            local.get 4
            i32.load offset=4
            local.set 77
            local.get 76
            local.get 77
            i32.add
            local.set 78
            i32.const 3
            local.set 79
            local.get 78
            local.get 79
            i32.shl
            local.set 80
            local.get 75
            local.get 80
            i32.add
            local.set 81
            local.get 81
            i64.load
            local.set 158
            local.get 4
            i32.load offset=188
            local.set 82
            local.get 4
            i32.load offset=4
            local.set 83
            i32.const 2
            local.set 84
            local.get 83
            local.get 84
            i32.shl
            local.set 85
            local.get 82
            local.get 85
            i32.add
            local.set 86
            local.get 86
            i32.load
            local.set 87
            local.get 87
            local.set 88
            local.get 88
            i64.extend_i32_u
            local.set 159
            i64.const 1
            local.set 160
            local.get 159
            local.get 160
            i64.shl
            local.set 161
            local.get 4
            i32.load offset=188
            local.set 89
            local.get 4
            i32.load offset=40
            local.set 90
            i32.const 2
            local.set 91
            local.get 90
            local.get 91
            i32.shl
            local.set 92
            local.get 89
            local.get 92
            i32.add
            local.set 93
            local.get 93
            i32.load
            local.set 94
            local.get 94
            local.set 95
            local.get 95
            i64.extend_i32_u
            local.set 162
            local.get 161
            local.get 162
            i64.mul
            local.set 163
            local.get 158
            local.get 163
            i64.add
            local.set 164
            local.get 4
            i64.load offset=8
            local.set 165
            local.get 164
            local.get 165
            i64.add
            local.set 166
            local.get 4
            local.get 166
            i64.store offset=32
            local.get 4
            i64.load offset=32
            local.set 167
            i64.const 32
            local.set 168
            local.get 167
            local.get 168
            i64.shr_u
            local.set 169
            local.get 4
            local.get 169
            i64.store offset=24
            local.get 4
            i64.load offset=32
            local.set 170
            local.get 170
            i32.wrap_i64
            local.set 96
            local.get 4
            local.get 96
            i32.store offset=20
            local.get 4
            i32.load offset=20
            local.set 97
            local.get 97
            local.set 98
            local.get 98
            i64.extend_i32_u
            local.set 171
            local.get 4
            i32.load offset=40
            local.set 99
            local.get 4
            i32.load offset=4
            local.set 100
            local.get 99
            local.get 100
            i32.add
            local.set 101
            i32.const 3
            local.set 102
            local.get 101
            local.get 102
            i32.shl
            local.set 103
            local.get 75
            local.get 103
            i32.add
            local.set 104
            local.get 104
            local.get 171
            i64.store
            local.get 4
            i64.load offset=24
            local.set 172
            local.get 4
            local.get 172
            i64.store offset=8
            local.get 4
            i32.load offset=4
            local.set 105
            i32.const 1
            local.set 106
            local.get 105
            local.get 106
            i32.add
            local.set 107
            local.get 4
            local.get 107
            i32.store offset=4
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 48
        local.set 108
        local.get 4
        local.get 108
        i32.add
        local.set 109
        local.get 109
        local.set 110
        local.get 4
        i64.load offset=24
        local.set 173
        local.get 4
        i32.load offset=40
        local.set 111
        i32.const 8
        local.set 112
        local.get 111
        local.get 112
        i32.add
        local.set 113
        i32.const 3
        local.set 114
        local.get 113
        local.get 114
        i32.shl
        local.set 115
        local.get 110
        local.get 115
        i32.add
        local.set 116
        local.get 116
        local.get 173
        i64.store
        local.get 4
        i32.load offset=40
        local.set 117
        i32.const 1
        local.set 118
        local.get 117
        local.get 118
        i32.add
        local.set 119
        local.get 4
        local.get 119
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 120
    local.get 4
    local.get 120
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 16
        local.set 121
        local.get 4
        i32.load
        local.set 122
        local.get 122
        local.set 123
        local.get 121
        local.set 124
        local.get 123
        local.get 124
        i32.lt_s
        local.set 125
        i32.const 1
        local.set 126
        local.get 125
        local.get 126
        i32.and
        local.set 127
        local.get 127
        i32.eqz
        br_if 1 (;@1;)
        i32.const 48
        local.set 128
        local.get 4
        local.get 128
        i32.add
        local.set 129
        local.get 129
        local.set 130
        local.get 4
        i32.load
        local.set 131
        i32.const 3
        local.set 132
        local.get 131
        local.get 132
        i32.shl
        local.set 133
        local.get 130
        local.get 133
        i32.add
        local.set 134
        local.get 134
        i64.load
        local.set 174
        local.get 174
        i32.wrap_i64
        local.set 135
        local.get 4
        i32.load offset=184
        local.set 136
        local.get 4
        i32.load
        local.set 137
        i32.const 2
        local.set 138
        local.get 137
        local.get 138
        i32.shl
        local.set 139
        local.get 136
        local.get 139
        i32.add
        local.set 140
        local.get 140
        local.get 135
        i32.store
        local.get 4
        i32.load
        local.set 141
        i32.const 1
        local.set 142
        local.get 141
        local.get 142
        i32.add
        local.set 143
        local.get 4
        local.get 143
        i32.store
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 192
    local.set 144
    local.get 4
    local.get 144
    i32.add
    local.set 145
    local.get 145
    global.set 0
    return)
  (func $montreduce256_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 4
    i32.const 64
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    local.get 6
    local.get 0
    i32.store offset=60
    local.get 6
    local.get 1
    i32.store offset=56
    local.get 6
    local.get 2
    i32.store offset=52
    local.get 6
    local.get 3
    i32.store offset=48
    local.get 6
    i32.load offset=60
    local.set 8
    local.get 6
    local.get 8
    i32.store offset=44
    local.get 6
    local.get 7
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 9
        local.get 6
        i32.load offset=40
        local.set 10
        local.get 10
        local.set 11
        local.get 9
        local.set 12
        local.get 11
        local.get 12
        i32.lt_s
        local.set 13
        i32.const 1
        local.set 14
        local.get 13
        local.get 14
        i32.and
        local.set 15
        local.get 15
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 16
        i64.const 0
        local.set 140
        local.get 6
        i32.load offset=44
        local.set 17
        local.get 6
        i32.load offset=40
        local.set 18
        i32.const 2
        local.set 19
        local.get 18
        local.get 19
        i32.shl
        local.set 20
        local.get 17
        local.get 20
        i32.add
        local.set 21
        local.get 21
        i32.load
        local.set 22
        local.get 6
        i32.load offset=52
        local.set 23
        local.get 23
        i32.load
        local.set 24
        local.get 22
        local.get 24
        i32.mul
        local.set 25
        local.get 6
        local.get 25
        i32.store offset=36
        local.get 6
        local.get 140
        i64.store offset=24
        local.get 6
        local.get 16
        i32.store offset=12
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 8
            local.set 26
            local.get 6
            i32.load offset=12
            local.set 27
            local.get 27
            local.set 28
            local.get 26
            local.set 29
            local.get 28
            local.get 29
            i32.lt_s
            local.set 30
            i32.const 1
            local.set 31
            local.get 30
            local.get 31
            i32.and
            local.set 32
            local.get 32
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            i32.load offset=36
            local.set 33
            local.get 6
            i32.load offset=56
            local.set 34
            local.get 6
            i32.load offset=12
            local.set 35
            i32.const 2
            local.set 36
            local.get 35
            local.get 36
            i32.shl
            local.set 37
            local.get 34
            local.get 37
            i32.add
            local.set 38
            local.get 38
            i32.load
            local.set 39
            local.get 33
            local.get 39
            i32.mul
            local.set 40
            local.get 6
            local.get 40
            i32.store offset=8
            local.get 6
            i32.load offset=44
            local.set 41
            local.get 6
            i32.load offset=40
            local.set 42
            local.get 6
            i32.load offset=12
            local.set 43
            local.get 42
            local.get 43
            i32.add
            local.set 44
            i32.const 2
            local.set 45
            local.get 44
            local.get 45
            i32.shl
            local.set 46
            local.get 41
            local.get 46
            i32.add
            local.set 47
            local.get 47
            i32.load
            local.set 48
            local.get 48
            local.set 49
            local.get 49
            i64.extend_i32_u
            local.set 141
            local.get 6
            i32.load offset=8
            local.set 50
            local.get 50
            local.set 51
            local.get 51
            i64.extend_i32_u
            local.set 142
            local.get 141
            local.get 142
            i64.add
            local.set 143
            local.get 6
            i64.load offset=24
            local.set 144
            local.get 143
            local.get 144
            i64.add
            local.set 145
            local.get 6
            local.get 145
            i64.store offset=16
            local.get 6
            i64.load offset=16
            local.set 146
            local.get 146
            i32.wrap_i64
            local.set 52
            local.get 6
            i32.load offset=44
            local.set 53
            local.get 6
            i32.load offset=40
            local.set 54
            local.get 6
            i32.load offset=12
            local.set 55
            local.get 54
            local.get 55
            i32.add
            local.set 56
            i32.const 2
            local.set 57
            local.get 56
            local.get 57
            i32.shl
            local.set 58
            local.get 53
            local.get 58
            i32.add
            local.set 59
            local.get 59
            local.get 52
            i32.store
            local.get 6
            i64.load offset=16
            local.set 147
            i64.const 32
            local.set 148
            local.get 147
            local.get 148
            i64.shr_u
            local.set 149
            local.get 6
            local.get 149
            i64.store offset=24
            local.get 6
            i32.load offset=12
            local.set 60
            i32.const 1
            local.set 61
            local.get 60
            local.get 61
            i32.add
            local.set 62
            local.get 6
            local.get 62
            i32.store offset=12
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 1
        local.set 63
        local.get 6
        local.get 63
        i32.store offset=4
        loop  ;; label = @3
          i32.const 0
          local.set 64
          i64.const 0
          local.set 150
          local.get 6
          i64.load offset=24
          local.set 151
          local.get 151
          local.set 152
          local.get 150
          local.set 153
          local.get 152
          local.get 153
          i64.ne
          local.set 65
          i32.const 1
          local.set 66
          local.get 65
          local.get 66
          i32.and
          local.set 67
          local.get 64
          local.set 68
          block  ;; label = @4
            local.get 67
            i32.eqz
            br_if 0 (;@4;)
            i32.const 16
            local.set 69
            local.get 6
            i32.load offset=40
            local.set 70
            local.get 6
            i32.load offset=12
            local.set 71
            local.get 70
            local.get 71
            i32.add
            local.set 72
            local.get 6
            i32.load offset=4
            local.set 73
            local.get 72
            local.get 73
            i32.add
            local.set 74
            local.get 74
            local.set 75
            local.get 69
            local.set 76
            local.get 75
            local.get 76
            i32.lt_s
            local.set 77
            local.get 77
            local.set 68
          end
          local.get 68
          local.set 78
          i32.const 1
          local.set 79
          local.get 78
          local.get 79
          i32.and
          local.set 80
          block  ;; label = @4
            local.get 80
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load offset=44
            local.set 81
            local.get 6
            i32.load offset=40
            local.set 82
            local.get 6
            i32.load offset=12
            local.set 83
            local.get 82
            local.get 83
            i32.add
            local.set 84
            local.get 6
            i32.load offset=4
            local.set 85
            local.get 84
            local.get 85
            i32.add
            local.set 86
            i32.const 2
            local.set 87
            local.get 86
            local.get 87
            i32.shl
            local.set 88
            local.get 81
            local.get 88
            i32.add
            local.set 89
            local.get 89
            i32.load
            local.set 90
            local.get 90
            local.set 91
            local.get 91
            i64.extend_i32_u
            local.set 154
            local.get 6
            i64.load offset=24
            local.set 155
            local.get 154
            local.get 155
            i64.add
            local.set 156
            local.get 6
            local.get 156
            i64.store offset=16
            local.get 6
            i64.load offset=16
            local.set 157
            local.get 157
            i32.wrap_i64
            local.set 92
            local.get 6
            i32.load offset=44
            local.set 93
            local.get 6
            i32.load offset=40
            local.set 94
            local.get 6
            i32.load offset=12
            local.set 95
            local.get 94
            local.get 95
            i32.add
            local.set 96
            local.get 6
            i32.load offset=4
            local.set 97
            local.get 96
            local.get 97
            i32.add
            local.set 98
            i32.const 2
            local.set 99
            local.get 98
            local.get 99
            i32.shl
            local.set 100
            local.get 93
            local.get 100
            i32.add
            local.set 101
            local.get 101
            local.get 92
            i32.store
            local.get 6
            i64.load offset=16
            local.set 158
            i64.const 32
            local.set 159
            local.get 158
            local.get 159
            i64.shr_u
            local.set 160
            local.get 6
            local.get 160
            i64.store offset=24
            local.get 6
            i32.load offset=4
            local.set 102
            i32.const 1
            local.set 103
            local.get 102
            local.get 103
            i32.add
            local.set 104
            local.get 6
            local.get 104
            i32.store offset=4
            br 1 (;@3;)
          end
        end
        local.get 6
        i32.load offset=40
        local.set 105
        i32.const 1
        local.set 106
        local.get 105
        local.get 106
        i32.add
        local.set 107
        local.get 6
        local.get 107
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 108
    local.get 6
    local.get 108
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 109
        local.get 6
        i32.load
        local.set 110
        local.get 110
        local.set 111
        local.get 109
        local.set 112
        local.get 111
        local.get 112
        i32.lt_s
        local.set 113
        i32.const 1
        local.set 114
        local.get 113
        local.get 114
        i32.and
        local.set 115
        local.get 115
        i32.eqz
        br_if 1 (;@1;)
        local.get 6
        i32.load offset=44
        local.set 116
        local.get 6
        i32.load
        local.set 117
        i32.const 8
        local.set 118
        local.get 117
        local.get 118
        i32.add
        local.set 119
        i32.const 2
        local.set 120
        local.get 119
        local.get 120
        i32.shl
        local.set 121
        local.get 116
        local.get 121
        i32.add
        local.set 122
        local.get 122
        i32.load
        local.set 123
        local.get 6
        i32.load offset=48
        local.set 124
        local.get 6
        i32.load
        local.set 125
        i32.const 2
        local.set 126
        local.get 125
        local.get 126
        i32.shl
        local.set 127
        local.get 124
        local.get 127
        i32.add
        local.set 128
        local.get 128
        local.get 123
        i32.store
        local.get 6
        i32.load
        local.set 129
        i32.const 1
        local.set 130
        local.get 129
        local.get 130
        i32.add
        local.set 131
        local.get 6
        local.get 131
        i32.store
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    local.get 6
    i32.load offset=56
    local.set 132
    local.get 6
    i32.load offset=48
    local.set 133
    local.get 132
    local.get 133
    call $less_than_or_equal256_32bitlimbs
    local.set 134
    block  ;; label = @1
      local.get 134
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=48
      local.set 135
      local.get 6
      i32.load offset=56
      local.set 136
      local.get 6
      i32.load offset=48
      local.set 137
      local.get 135
      local.get 136
      local.get 137
      call $subtract256_32bitlimbs
    end
    i32.const 64
    local.set 138
    local.get 6
    local.get 138
    i32.add
    local.set 139
    local.get 139
    global.set 0
    return)
  (func $montsquare256_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 4
    i32.const 96
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    i32.const 16
    local.set 8
    local.get 6
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 6
    local.get 0
    i32.store offset=92
    local.get 6
    local.get 1
    i32.store offset=88
    local.get 6
    local.get 2
    i32.store offset=84
    local.get 6
    local.get 3
    i32.store offset=80
    local.get 6
    i32.load offset=92
    local.set 11
    local.get 11
    local.get 10
    call $square256_32bitlimbs
    local.get 6
    i32.load offset=92
    local.set 12
    local.get 6
    i32.load offset=84
    local.set 13
    local.get 6
    i32.load offset=80
    local.set 14
    local.get 12
    local.get 10
    local.get 13
    local.get 14
    call $montreduce256_32bitlimbs
    local.get 6
    local.get 7
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 15
        local.get 6
        i32.load offset=12
        local.set 16
        local.get 16
        local.set 17
        local.get 15
        local.set 18
        local.get 17
        local.get 18
        i32.lt_s
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        local.get 21
        i32.eqz
        br_if 1 (;@1;)
        i32.const 16
        local.set 22
        local.get 6
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 6
        i32.load offset=12
        local.set 25
        i32.const 2
        local.set 26
        local.get 25
        local.get 26
        i32.shl
        local.set 27
        local.get 24
        local.get 27
        i32.add
        local.set 28
        local.get 28
        i32.load
        local.set 29
        local.get 6
        i32.load offset=88
        local.set 30
        local.get 6
        i32.load offset=12
        local.set 31
        i32.const 2
        local.set 32
        local.get 31
        local.get 32
        i32.shl
        local.set 33
        local.get 30
        local.get 33
        i32.add
        local.set 34
        local.get 34
        local.get 29
        i32.store
        local.get 6
        i32.load offset=12
        local.set 35
        i32.const 1
        local.set 36
        local.get 35
        local.get 36
        i32.add
        local.set 37
        local.get 6
        local.get 37
        i32.store offset=12
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 96
    local.set 38
    local.get 6
    local.get 38
    i32.add
    local.set 39
    local.get 39
    global.set 0
    return)
  (func $subtract768_32bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    i32.const 0
    local.set 6
    local.get 5
    local.get 0
    i32.store offset=28
    local.get 5
    local.get 1
    i32.store offset=24
    local.get 5
    local.get 2
    i32.store offset=20
    local.get 5
    local.get 6
    i32.store offset=16
    local.get 5
    local.get 6
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 7
        local.get 5
        i32.load offset=12
        local.set 8
        local.get 8
        local.set 9
        local.get 7
        local.set 10
        local.get 9
        local.get 10
        i32.lt_s
        local.set 11
        i32.const 1
        local.set 12
        local.get 11
        local.get 12
        i32.and
        local.set 13
        local.get 13
        i32.eqz
        br_if 1 (;@1;)
        i32.const 1
        local.set 14
        i32.const 0
        local.set 15
        local.get 5
        i32.load offset=28
        local.set 16
        local.get 5
        i32.load offset=12
        local.set 17
        i32.const 2
        local.set 18
        local.get 17
        local.get 18
        i32.shl
        local.set 19
        local.get 16
        local.get 19
        i32.add
        local.set 20
        local.get 20
        i32.load
        local.set 21
        local.get 5
        i32.load offset=16
        local.set 22
        local.get 21
        local.get 22
        i32.sub
        local.set 23
        local.get 5
        i32.load offset=24
        local.set 24
        local.get 5
        i32.load offset=12
        local.set 25
        i32.const 2
        local.set 26
        local.get 25
        local.get 26
        i32.shl
        local.set 27
        local.get 24
        local.get 27
        i32.add
        local.set 28
        local.get 28
        i32.load
        local.set 29
        local.get 23
        local.get 29
        i32.sub
        local.set 30
        local.get 5
        local.get 30
        i32.store offset=8
        local.get 5
        i32.load offset=8
        local.set 31
        local.get 5
        i32.load offset=28
        local.set 32
        local.get 5
        i32.load offset=12
        local.set 33
        i32.const 2
        local.set 34
        local.get 33
        local.get 34
        i32.shl
        local.set 35
        local.get 32
        local.get 35
        i32.add
        local.set 36
        local.get 36
        i32.load
        local.set 37
        local.get 31
        local.set 38
        local.get 37
        local.set 39
        local.get 38
        local.get 39
        i32.gt_u
        local.set 40
        i32.const 1
        local.set 41
        local.get 40
        local.get 41
        i32.and
        local.set 42
        local.get 14
        local.get 15
        local.get 42
        select
        local.set 43
        local.get 5
        local.get 43
        i32.store offset=16
        local.get 5
        i32.load offset=8
        local.set 44
        local.get 5
        i32.load offset=20
        local.set 45
        local.get 5
        i32.load offset=12
        local.set 46
        i32.const 2
        local.set 47
        local.get 46
        local.get 47
        i32.shl
        local.set 48
        local.get 45
        local.get 48
        i32.add
        local.set 49
        local.get 49
        local.get 44
        i32.store
        local.get 5
        i32.load offset=12
        local.set 50
        i32.const 1
        local.set 51
        local.get 50
        local.get 51
        i32.add
        local.set 52
        local.get 5
        local.get 52
        i32.store offset=12
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    return)
  (func $less_than_or_equal768_32bitlimbs (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    i32.const 23
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 5
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          local.set 6
          local.get 4
          i32.load
          local.set 7
          local.get 7
          local.set 8
          local.get 6
          local.set 9
          local.get 8
          local.get 9
          i32.ge_s
          local.set 10
          i32.const 1
          local.set 11
          local.get 10
          local.get 11
          i32.and
          local.set 12
          local.get 12
          i32.eqz
          br_if 1 (;@2;)
          local.get 4
          i32.load offset=8
          local.set 13
          local.get 4
          i32.load
          local.set 14
          i32.const 2
          local.set 15
          local.get 14
          local.get 15
          i32.shl
          local.set 16
          local.get 13
          local.get 16
          i32.add
          local.set 17
          local.get 17
          i32.load
          local.set 18
          local.get 4
          i32.load offset=4
          local.set 19
          local.get 4
          i32.load
          local.set 20
          i32.const 2
          local.set 21
          local.get 20
          local.get 21
          i32.shl
          local.set 22
          local.get 19
          local.get 22
          i32.add
          local.set 23
          local.get 23
          i32.load
          local.set 24
          local.get 18
          local.set 25
          local.get 24
          local.set 26
          local.get 25
          local.get 26
          i32.gt_u
          local.set 27
          i32.const 1
          local.set 28
          local.get 27
          local.get 28
          i32.and
          local.set 29
          block  ;; label = @4
            local.get 29
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 30
            local.get 4
            local.get 30
            i32.store offset=12
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=8
          local.set 31
          local.get 4
          i32.load
          local.set 32
          i32.const 2
          local.set 33
          local.get 32
          local.get 33
          i32.shl
          local.set 34
          local.get 31
          local.get 34
          i32.add
          local.set 35
          local.get 35
          i32.load
          local.set 36
          local.get 4
          i32.load offset=4
          local.set 37
          local.get 4
          i32.load
          local.set 38
          i32.const 2
          local.set 39
          local.get 38
          local.get 39
          i32.shl
          local.set 40
          local.get 37
          local.get 40
          i32.add
          local.set 41
          local.get 41
          i32.load
          local.set 42
          local.get 36
          local.set 43
          local.get 42
          local.set 44
          local.get 43
          local.get 44
          i32.lt_u
          local.set 45
          i32.const 1
          local.set 46
          local.get 45
          local.get 46
          i32.and
          local.set 47
          block  ;; label = @4
            local.get 47
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 48
            local.get 4
            local.get 48
            i32.store offset=12
            br 3 (;@1;)
          end
          local.get 4
          i32.load
          local.set 49
          i32.const -1
          local.set 50
          local.get 49
          local.get 50
          i32.add
          local.set 51
          local.get 4
          local.get 51
          i32.store
          br 0 (;@3;)
          unreachable
        end
        unreachable
      end
      i32.const 1
      local.set 52
      local.get 4
      local.get 52
      i32.store offset=12
    end
    local.get 4
    i32.load offset=12
    local.set 53
    local.get 53
    return)
  (func $square768_32bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 2
    i32.const 448
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set 0
    i32.const 0
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=444
    local.get 4
    local.get 1
    i32.store offset=440
    local.get 4
    local.get 5
    i32.store offset=44
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 48
        local.set 6
        local.get 4
        i32.load offset=44
        local.set 7
        local.get 7
        local.set 8
        local.get 6
        local.set 9
        local.get 8
        local.get 9
        i32.lt_s
        local.set 10
        i32.const 1
        local.set 11
        local.get 10
        local.get 11
        i32.and
        local.set 12
        local.get 12
        i32.eqz
        br_if 1 (;@1;)
        i64.const 0
        local.set 146
        i32.const 48
        local.set 13
        local.get 4
        local.get 13
        i32.add
        local.set 14
        local.get 14
        local.set 15
        local.get 4
        i32.load offset=44
        local.set 16
        i32.const 3
        local.set 17
        local.get 16
        local.get 17
        i32.shl
        local.set 18
        local.get 15
        local.get 18
        i32.add
        local.set 19
        local.get 19
        local.get 146
        i64.store
        local.get 4
        i32.load offset=44
        local.set 20
        i32.const 1
        local.set 21
        local.get 20
        local.get 21
        i32.add
        local.set 22
        local.get 4
        local.get 22
        i32.store offset=44
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 23
    local.get 4
    local.get 23
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 24
        local.get 4
        i32.load offset=40
        local.set 25
        local.get 25
        local.set 26
        local.get 24
        local.set 27
        local.get 26
        local.get 27
        i32.lt_s
        local.set 28
        i32.const 1
        local.set 29
        local.get 28
        local.get 29
        i32.and
        local.set 30
        local.get 30
        i32.eqz
        br_if 1 (;@1;)
        i32.const 48
        local.set 31
        local.get 4
        local.get 31
        i32.add
        local.set 32
        local.get 32
        local.set 33
        local.get 4
        i32.load offset=40
        local.set 34
        i32.const 1
        local.set 35
        local.get 34
        local.get 35
        i32.shl
        local.set 36
        i32.const 3
        local.set 37
        local.get 36
        local.get 37
        i32.shl
        local.set 38
        local.get 33
        local.get 38
        i32.add
        local.set 39
        local.get 39
        i64.load
        local.set 147
        local.get 4
        i32.load offset=444
        local.set 40
        local.get 4
        i32.load offset=40
        local.set 41
        i32.const 2
        local.set 42
        local.get 41
        local.get 42
        i32.shl
        local.set 43
        local.get 40
        local.get 43
        i32.add
        local.set 44
        local.get 44
        i32.load
        local.set 45
        local.get 45
        local.set 46
        local.get 46
        i64.extend_i32_u
        local.set 148
        local.get 4
        i32.load offset=444
        local.set 47
        local.get 4
        i32.load offset=40
        local.set 48
        i32.const 2
        local.set 49
        local.get 48
        local.get 49
        i32.shl
        local.set 50
        local.get 47
        local.get 50
        i32.add
        local.set 51
        local.get 51
        i32.load
        local.set 52
        local.get 52
        local.set 53
        local.get 53
        i64.extend_i32_u
        local.set 149
        local.get 148
        local.get 149
        i64.mul
        local.set 150
        local.get 147
        local.get 150
        i64.add
        local.set 151
        local.get 4
        local.get 151
        i64.store offset=32
        local.get 4
        i64.load offset=32
        local.set 152
        i64.const 32
        local.set 153
        local.get 152
        local.get 153
        i64.shr_u
        local.set 154
        local.get 4
        local.get 154
        i64.store offset=24
        local.get 4
        i64.load offset=32
        local.set 155
        local.get 155
        i32.wrap_i64
        local.set 54
        local.get 4
        local.get 54
        i32.store offset=20
        local.get 4
        i32.load offset=20
        local.set 55
        local.get 55
        local.set 56
        local.get 56
        i64.extend_i32_u
        local.set 156
        local.get 4
        i32.load offset=40
        local.set 57
        i32.const 1
        local.set 58
        local.get 57
        local.get 58
        i32.shl
        local.set 59
        i32.const 3
        local.set 60
        local.get 59
        local.get 60
        i32.shl
        local.set 61
        local.get 33
        local.get 61
        i32.add
        local.set 62
        local.get 62
        local.get 156
        i64.store
        local.get 4
        i64.load offset=24
        local.set 157
        local.get 4
        local.get 157
        i64.store offset=8
        local.get 4
        i32.load offset=40
        local.set 63
        i32.const 1
        local.set 64
        local.get 63
        local.get 64
        i32.add
        local.set 65
        local.get 4
        local.get 65
        i32.store offset=4
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 24
            local.set 66
            local.get 4
            i32.load offset=4
            local.set 67
            local.get 67
            local.set 68
            local.get 66
            local.set 69
            local.get 68
            local.get 69
            i32.lt_s
            local.set 70
            i32.const 1
            local.set 71
            local.get 70
            local.get 71
            i32.and
            local.set 72
            local.get 72
            i32.eqz
            br_if 1 (;@3;)
            i32.const 48
            local.set 73
            local.get 4
            local.get 73
            i32.add
            local.set 74
            local.get 74
            local.set 75
            local.get 4
            i32.load offset=40
            local.set 76
            local.get 4
            i32.load offset=4
            local.set 77
            local.get 76
            local.get 77
            i32.add
            local.set 78
            i32.const 3
            local.set 79
            local.get 78
            local.get 79
            i32.shl
            local.set 80
            local.get 75
            local.get 80
            i32.add
            local.set 81
            local.get 81
            i64.load
            local.set 158
            local.get 4
            i32.load offset=444
            local.set 82
            local.get 4
            i32.load offset=4
            local.set 83
            i32.const 2
            local.set 84
            local.get 83
            local.get 84
            i32.shl
            local.set 85
            local.get 82
            local.get 85
            i32.add
            local.set 86
            local.get 86
            i32.load
            local.set 87
            local.get 87
            local.set 88
            local.get 88
            i64.extend_i32_u
            local.set 159
            i64.const 1
            local.set 160
            local.get 159
            local.get 160
            i64.shl
            local.set 161
            local.get 4
            i32.load offset=444
            local.set 89
            local.get 4
            i32.load offset=40
            local.set 90
            i32.const 2
            local.set 91
            local.get 90
            local.get 91
            i32.shl
            local.set 92
            local.get 89
            local.get 92
            i32.add
            local.set 93
            local.get 93
            i32.load
            local.set 94
            local.get 94
            local.set 95
            local.get 95
            i64.extend_i32_u
            local.set 162
            local.get 161
            local.get 162
            i64.mul
            local.set 163
            local.get 158
            local.get 163
            i64.add
            local.set 164
            local.get 4
            i64.load offset=8
            local.set 165
            local.get 164
            local.get 165
            i64.add
            local.set 166
            local.get 4
            local.get 166
            i64.store offset=32
            local.get 4
            i64.load offset=32
            local.set 167
            i64.const 32
            local.set 168
            local.get 167
            local.get 168
            i64.shr_u
            local.set 169
            local.get 4
            local.get 169
            i64.store offset=24
            local.get 4
            i64.load offset=32
            local.set 170
            local.get 170
            i32.wrap_i64
            local.set 96
            local.get 4
            local.get 96
            i32.store offset=20
            local.get 4
            i32.load offset=20
            local.set 97
            local.get 97
            local.set 98
            local.get 98
            i64.extend_i32_u
            local.set 171
            local.get 4
            i32.load offset=40
            local.set 99
            local.get 4
            i32.load offset=4
            local.set 100
            local.get 99
            local.get 100
            i32.add
            local.set 101
            i32.const 3
            local.set 102
            local.get 101
            local.get 102
            i32.shl
            local.set 103
            local.get 75
            local.get 103
            i32.add
            local.set 104
            local.get 104
            local.get 171
            i64.store
            local.get 4
            i64.load offset=24
            local.set 172
            local.get 4
            local.get 172
            i64.store offset=8
            local.get 4
            i32.load offset=4
            local.set 105
            i32.const 1
            local.set 106
            local.get 105
            local.get 106
            i32.add
            local.set 107
            local.get 4
            local.get 107
            i32.store offset=4
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 48
        local.set 108
        local.get 4
        local.get 108
        i32.add
        local.set 109
        local.get 109
        local.set 110
        local.get 4
        i64.load offset=24
        local.set 173
        local.get 4
        i32.load offset=40
        local.set 111
        i32.const 24
        local.set 112
        local.get 111
        local.get 112
        i32.add
        local.set 113
        i32.const 3
        local.set 114
        local.get 113
        local.get 114
        i32.shl
        local.set 115
        local.get 110
        local.get 115
        i32.add
        local.set 116
        local.get 116
        local.get 173
        i64.store
        local.get 4
        i32.load offset=40
        local.set 117
        i32.const 1
        local.set 118
        local.get 117
        local.get 118
        i32.add
        local.set 119
        local.get 4
        local.get 119
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 120
    local.get 4
    local.get 120
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 48
        local.set 121
        local.get 4
        i32.load
        local.set 122
        local.get 122
        local.set 123
        local.get 121
        local.set 124
        local.get 123
        local.get 124
        i32.lt_s
        local.set 125
        i32.const 1
        local.set 126
        local.get 125
        local.get 126
        i32.and
        local.set 127
        local.get 127
        i32.eqz
        br_if 1 (;@1;)
        i32.const 48
        local.set 128
        local.get 4
        local.get 128
        i32.add
        local.set 129
        local.get 129
        local.set 130
        local.get 4
        i32.load
        local.set 131
        i32.const 3
        local.set 132
        local.get 131
        local.get 132
        i32.shl
        local.set 133
        local.get 130
        local.get 133
        i32.add
        local.set 134
        local.get 134
        i64.load
        local.set 174
        local.get 174
        i32.wrap_i64
        local.set 135
        local.get 4
        i32.load offset=440
        local.set 136
        local.get 4
        i32.load
        local.set 137
        i32.const 2
        local.set 138
        local.get 137
        local.get 138
        i32.shl
        local.set 139
        local.get 136
        local.get 139
        i32.add
        local.set 140
        local.get 140
        local.get 135
        i32.store
        local.get 4
        i32.load
        local.set 141
        i32.const 1
        local.set 142
        local.get 141
        local.get 142
        i32.add
        local.set 143
        local.get 4
        local.get 143
        i32.store
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 448
    local.set 144
    local.get 4
    local.get 144
    i32.add
    local.set 145
    local.get 145
    global.set 0
    return)
  (func $montreduce768_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 4
    i32.const 64
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    local.get 6
    local.get 0
    i32.store offset=60
    local.get 6
    local.get 1
    i32.store offset=56
    local.get 6
    local.get 2
    i32.store offset=52
    local.get 6
    local.get 3
    i32.store offset=48
    local.get 6
    i32.load offset=60
    local.set 8
    local.get 6
    local.get 8
    i32.store offset=44
    local.get 6
    local.get 7
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 9
        local.get 6
        i32.load offset=40
        local.set 10
        local.get 10
        local.set 11
        local.get 9
        local.set 12
        local.get 11
        local.get 12
        i32.lt_s
        local.set 13
        i32.const 1
        local.set 14
        local.get 13
        local.get 14
        i32.and
        local.set 15
        local.get 15
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 16
        i64.const 0
        local.set 140
        local.get 6
        i32.load offset=44
        local.set 17
        local.get 6
        i32.load offset=40
        local.set 18
        i32.const 2
        local.set 19
        local.get 18
        local.get 19
        i32.shl
        local.set 20
        local.get 17
        local.get 20
        i32.add
        local.set 21
        local.get 21
        i32.load
        local.set 22
        local.get 6
        i32.load offset=52
        local.set 23
        local.get 23
        i32.load
        local.set 24
        local.get 22
        local.get 24
        i32.mul
        local.set 25
        local.get 6
        local.get 25
        i32.store offset=36
        local.get 6
        local.get 140
        i64.store offset=24
        local.get 6
        local.get 16
        i32.store offset=12
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 24
            local.set 26
            local.get 6
            i32.load offset=12
            local.set 27
            local.get 27
            local.set 28
            local.get 26
            local.set 29
            local.get 28
            local.get 29
            i32.lt_s
            local.set 30
            i32.const 1
            local.set 31
            local.get 30
            local.get 31
            i32.and
            local.set 32
            local.get 32
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            i32.load offset=36
            local.set 33
            local.get 6
            i32.load offset=56
            local.set 34
            local.get 6
            i32.load offset=12
            local.set 35
            i32.const 2
            local.set 36
            local.get 35
            local.get 36
            i32.shl
            local.set 37
            local.get 34
            local.get 37
            i32.add
            local.set 38
            local.get 38
            i32.load
            local.set 39
            local.get 33
            local.get 39
            i32.mul
            local.set 40
            local.get 6
            local.get 40
            i32.store offset=8
            local.get 6
            i32.load offset=44
            local.set 41
            local.get 6
            i32.load offset=40
            local.set 42
            local.get 6
            i32.load offset=12
            local.set 43
            local.get 42
            local.get 43
            i32.add
            local.set 44
            i32.const 2
            local.set 45
            local.get 44
            local.get 45
            i32.shl
            local.set 46
            local.get 41
            local.get 46
            i32.add
            local.set 47
            local.get 47
            i32.load
            local.set 48
            local.get 48
            local.set 49
            local.get 49
            i64.extend_i32_u
            local.set 141
            local.get 6
            i32.load offset=8
            local.set 50
            local.get 50
            local.set 51
            local.get 51
            i64.extend_i32_u
            local.set 142
            local.get 141
            local.get 142
            i64.add
            local.set 143
            local.get 6
            i64.load offset=24
            local.set 144
            local.get 143
            local.get 144
            i64.add
            local.set 145
            local.get 6
            local.get 145
            i64.store offset=16
            local.get 6
            i64.load offset=16
            local.set 146
            local.get 146
            i32.wrap_i64
            local.set 52
            local.get 6
            i32.load offset=44
            local.set 53
            local.get 6
            i32.load offset=40
            local.set 54
            local.get 6
            i32.load offset=12
            local.set 55
            local.get 54
            local.get 55
            i32.add
            local.set 56
            i32.const 2
            local.set 57
            local.get 56
            local.get 57
            i32.shl
            local.set 58
            local.get 53
            local.get 58
            i32.add
            local.set 59
            local.get 59
            local.get 52
            i32.store
            local.get 6
            i64.load offset=16
            local.set 147
            i64.const 32
            local.set 148
            local.get 147
            local.get 148
            i64.shr_u
            local.set 149
            local.get 6
            local.get 149
            i64.store offset=24
            local.get 6
            i32.load offset=12
            local.set 60
            i32.const 1
            local.set 61
            local.get 60
            local.get 61
            i32.add
            local.set 62
            local.get 6
            local.get 62
            i32.store offset=12
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 1
        local.set 63
        local.get 6
        local.get 63
        i32.store offset=4
        loop  ;; label = @3
          i32.const 0
          local.set 64
          i64.const 0
          local.set 150
          local.get 6
          i64.load offset=24
          local.set 151
          local.get 151
          local.set 152
          local.get 150
          local.set 153
          local.get 152
          local.get 153
          i64.ne
          local.set 65
          i32.const 1
          local.set 66
          local.get 65
          local.get 66
          i32.and
          local.set 67
          local.get 64
          local.set 68
          block  ;; label = @4
            local.get 67
            i32.eqz
            br_if 0 (;@4;)
            i32.const 48
            local.set 69
            local.get 6
            i32.load offset=40
            local.set 70
            local.get 6
            i32.load offset=12
            local.set 71
            local.get 70
            local.get 71
            i32.add
            local.set 72
            local.get 6
            i32.load offset=4
            local.set 73
            local.get 72
            local.get 73
            i32.add
            local.set 74
            local.get 74
            local.set 75
            local.get 69
            local.set 76
            local.get 75
            local.get 76
            i32.lt_s
            local.set 77
            local.get 77
            local.set 68
          end
          local.get 68
          local.set 78
          i32.const 1
          local.set 79
          local.get 78
          local.get 79
          i32.and
          local.set 80
          block  ;; label = @4
            local.get 80
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load offset=44
            local.set 81
            local.get 6
            i32.load offset=40
            local.set 82
            local.get 6
            i32.load offset=12
            local.set 83
            local.get 82
            local.get 83
            i32.add
            local.set 84
            local.get 6
            i32.load offset=4
            local.set 85
            local.get 84
            local.get 85
            i32.add
            local.set 86
            i32.const 2
            local.set 87
            local.get 86
            local.get 87
            i32.shl
            local.set 88
            local.get 81
            local.get 88
            i32.add
            local.set 89
            local.get 89
            i32.load
            local.set 90
            local.get 90
            local.set 91
            local.get 91
            i64.extend_i32_u
            local.set 154
            local.get 6
            i64.load offset=24
            local.set 155
            local.get 154
            local.get 155
            i64.add
            local.set 156
            local.get 6
            local.get 156
            i64.store offset=16
            local.get 6
            i64.load offset=16
            local.set 157
            local.get 157
            i32.wrap_i64
            local.set 92
            local.get 6
            i32.load offset=44
            local.set 93
            local.get 6
            i32.load offset=40
            local.set 94
            local.get 6
            i32.load offset=12
            local.set 95
            local.get 94
            local.get 95
            i32.add
            local.set 96
            local.get 6
            i32.load offset=4
            local.set 97
            local.get 96
            local.get 97
            i32.add
            local.set 98
            i32.const 2
            local.set 99
            local.get 98
            local.get 99
            i32.shl
            local.set 100
            local.get 93
            local.get 100
            i32.add
            local.set 101
            local.get 101
            local.get 92
            i32.store
            local.get 6
            i64.load offset=16
            local.set 158
            i64.const 32
            local.set 159
            local.get 158
            local.get 159
            i64.shr_u
            local.set 160
            local.get 6
            local.get 160
            i64.store offset=24
            local.get 6
            i32.load offset=4
            local.set 102
            i32.const 1
            local.set 103
            local.get 102
            local.get 103
            i32.add
            local.set 104
            local.get 6
            local.get 104
            i32.store offset=4
            br 1 (;@3;)
          end
        end
        local.get 6
        i32.load offset=40
        local.set 105
        i32.const 1
        local.set 106
        local.get 105
        local.get 106
        i32.add
        local.set 107
        local.get 6
        local.get 107
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 108
    local.get 6
    local.get 108
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 109
        local.get 6
        i32.load
        local.set 110
        local.get 110
        local.set 111
        local.get 109
        local.set 112
        local.get 111
        local.get 112
        i32.lt_s
        local.set 113
        i32.const 1
        local.set 114
        local.get 113
        local.get 114
        i32.and
        local.set 115
        local.get 115
        i32.eqz
        br_if 1 (;@1;)
        local.get 6
        i32.load offset=44
        local.set 116
        local.get 6
        i32.load
        local.set 117
        i32.const 24
        local.set 118
        local.get 117
        local.get 118
        i32.add
        local.set 119
        i32.const 2
        local.set 120
        local.get 119
        local.get 120
        i32.shl
        local.set 121
        local.get 116
        local.get 121
        i32.add
        local.set 122
        local.get 122
        i32.load
        local.set 123
        local.get 6
        i32.load offset=48
        local.set 124
        local.get 6
        i32.load
        local.set 125
        i32.const 2
        local.set 126
        local.get 125
        local.get 126
        i32.shl
        local.set 127
        local.get 124
        local.get 127
        i32.add
        local.set 128
        local.get 128
        local.get 123
        i32.store
        local.get 6
        i32.load
        local.set 129
        i32.const 1
        local.set 130
        local.get 129
        local.get 130
        i32.add
        local.set 131
        local.get 6
        local.get 131
        i32.store
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    local.get 6
    i32.load offset=56
    local.set 132
    local.get 6
    i32.load offset=48
    local.set 133
    local.get 132
    local.get 133
    call $less_than_or_equal768_32bitlimbs
    local.set 134
    block  ;; label = @1
      local.get 134
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=48
      local.set 135
      local.get 6
      i32.load offset=56
      local.set 136
      local.get 6
      i32.load offset=48
      local.set 137
      local.get 135
      local.get 136
      local.get 137
      call $subtract768_32bitlimbs
    end
    i32.const 64
    local.set 138
    local.get 6
    local.get 138
    i32.add
    local.set 139
    local.get 139
    global.set 0
    return)
  (func $montsquare768_32bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 4
    i32.const 224
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    i32.const 16
    local.set 8
    local.get 6
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 6
    local.get 0
    i32.store offset=220
    local.get 6
    local.get 1
    i32.store offset=216
    local.get 6
    local.get 2
    i32.store offset=212
    local.get 6
    local.get 3
    i32.store offset=208
    local.get 6
    i32.load offset=220
    local.set 11
    local.get 11
    local.get 10
    call $square768_32bitlimbs
    local.get 6
    i32.load offset=220
    local.set 12
    local.get 6
    i32.load offset=212
    local.set 13
    local.get 6
    i32.load offset=208
    local.set 14
    local.get 12
    local.get 10
    local.get 13
    local.get 14
    call $montreduce768_32bitlimbs
    local.get 6
    local.get 7
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 15
        local.get 6
        i32.load offset=12
        local.set 16
        local.get 16
        local.set 17
        local.get 15
        local.set 18
        local.get 17
        local.get 18
        i32.lt_s
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        local.get 21
        i32.eqz
        br_if 1 (;@1;)
        i32.const 16
        local.set 22
        local.get 6
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 6
        i32.load offset=12
        local.set 25
        i32.const 2
        local.set 26
        local.get 25
        local.get 26
        i32.shl
        local.set 27
        local.get 24
        local.get 27
        i32.add
        local.set 28
        local.get 28
        i32.load
        local.set 29
        local.get 6
        i32.load offset=216
        local.set 30
        local.get 6
        i32.load offset=12
        local.set 31
        i32.const 2
        local.set 32
        local.get 31
        local.get 32
        i32.shl
        local.set 33
        local.get 30
        local.get 33
        i32.add
        local.set 34
        local.get 34
        local.get 29
        i32.store
        local.get 6
        i32.load offset=12
        local.set 35
        i32.const 1
        local.set 36
        local.get 35
        local.get 36
        i32.add
        local.set 37
        local.get 6
        local.get 37
        i32.store offset=12
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 224
    local.set 38
    local.get 6
    local.get 38
    i32.add
    local.set 39
    local.get 39
    global.set 0
    return)
  (func $subtract256_64bitlimbs (type 0) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    i32.const 0
    local.set 6
    i64.const 0
    local.set 44
    local.get 5
    local.get 0
    i32.store offset=44
    local.get 5
    local.get 1
    i32.store offset=40
    local.get 5
    local.get 2
    i32.store offset=36
    local.get 5
    local.get 44
    i64.store offset=24
    local.get 5
    local.get 6
    i32.store offset=20
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 4
        local.set 7
        local.get 5
        i32.load offset=20
        local.set 8
        local.get 8
        local.set 9
        local.get 7
        local.set 10
        local.get 9
        local.get 10
        i32.lt_s
        local.set 11
        i32.const 1
        local.set 12
        local.get 11
        local.get 12
        i32.and
        local.set 13
        local.get 13
        i32.eqz
        br_if 1 (;@1;)
        i32.const 1
        local.set 14
        i32.const 0
        local.set 15
        local.get 5
        i32.load offset=44
        local.set 16
        local.get 5
        i32.load offset=20
        local.set 17
        i32.const 3
        local.set 18
        local.get 17
        local.get 18
        i32.shl
        local.set 19
        local.get 16
        local.get 19
        i32.add
        local.set 20
        local.get 20
        i64.load
        local.set 45
        local.get 5
        i64.load offset=24
        local.set 46
        local.get 45
        local.get 46
        i64.sub
        local.set 47
        local.get 5
        i32.load offset=40
        local.set 21
        local.get 5
        i32.load offset=20
        local.set 22
        i32.const 3
        local.set 23
        local.get 22
        local.get 23
        i32.shl
        local.set 24
        local.get 21
        local.get 24
        i32.add
        local.set 25
        local.get 25
        i64.load
        local.set 48
        local.get 47
        local.get 48
        i64.sub
        local.set 49
        local.get 5
        local.get 49
        i64.store offset=8
        local.get 5
        i64.load offset=8
        local.set 50
        local.get 5
        i32.load offset=44
        local.set 26
        local.get 5
        i32.load offset=20
        local.set 27
        i32.const 3
        local.set 28
        local.get 27
        local.get 28
        i32.shl
        local.set 29
        local.get 26
        local.get 29
        i32.add
        local.set 30
        local.get 30
        i64.load
        local.set 51
        local.get 50
        local.set 52
        local.get 51
        local.set 53
        local.get 52
        local.get 53
        i64.gt_u
        local.set 31
        i32.const 1
        local.set 32
        local.get 31
        local.get 32
        i32.and
        local.set 33
        local.get 14
        local.get 15
        local.get 33
        select
        local.set 34
        local.get 34
        local.set 35
        local.get 35
        i64.extend_i32_s
        local.set 54
        local.get 5
        local.get 54
        i64.store offset=24
        local.get 5
        i64.load offset=8
        local.set 55
        local.get 5
        i32.load offset=36
        local.set 36
        local.get 5
        i32.load offset=20
        local.set 37
        i32.const 3
        local.set 38
        local.get 37
        local.get 38
        i32.shl
        local.set 39
        local.get 36
        local.get 39
        i32.add
        local.set 40
        local.get 40
        local.get 55
        i64.store
        local.get 5
        i32.load offset=20
        local.set 41
        i32.const 1
        local.set 42
        local.get 41
        local.get 42
        i32.add
        local.set 43
        local.get 5
        local.get 43
        i32.store offset=20
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    return)
  (func $less_than_or_equal256_64bitlimbs (type 4) (param i32 i32) (result i64)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    i32.const 3
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=20
    local.get 4
    local.get 1
    i32.store offset=16
    local.get 4
    local.get 5
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          local.set 6
          local.get 4
          i32.load offset=12
          local.set 7
          local.get 7
          local.set 8
          local.get 6
          local.set 9
          local.get 8
          local.get 9
          i32.ge_s
          local.set 10
          i32.const 1
          local.set 11
          local.get 10
          local.get 11
          i32.and
          local.set 12
          local.get 12
          i32.eqz
          br_if 1 (;@2;)
          local.get 4
          i32.load offset=20
          local.set 13
          local.get 4
          i32.load offset=12
          local.set 14
          i32.const 3
          local.set 15
          local.get 14
          local.get 15
          i32.shl
          local.set 16
          local.get 13
          local.get 16
          i32.add
          local.set 17
          local.get 17
          i64.load
          local.set 42
          local.get 4
          i32.load offset=16
          local.set 18
          local.get 4
          i32.load offset=12
          local.set 19
          i32.const 3
          local.set 20
          local.get 19
          local.get 20
          i32.shl
          local.set 21
          local.get 18
          local.get 21
          i32.add
          local.set 22
          local.get 22
          i64.load
          local.set 43
          local.get 42
          local.set 44
          local.get 43
          local.set 45
          local.get 44
          local.get 45
          i64.gt_u
          local.set 23
          i32.const 1
          local.set 24
          local.get 23
          local.get 24
          i32.and
          local.set 25
          block  ;; label = @4
            local.get 25
            i32.eqz
            br_if 0 (;@4;)
            i64.const 0
            local.set 46
            local.get 4
            local.get 46
            i64.store offset=24
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=20
          local.set 26
          local.get 4
          i32.load offset=12
          local.set 27
          i32.const 3
          local.set 28
          local.get 27
          local.get 28
          i32.shl
          local.set 29
          local.get 26
          local.get 29
          i32.add
          local.set 30
          local.get 30
          i64.load
          local.set 47
          local.get 4
          i32.load offset=16
          local.set 31
          local.get 4
          i32.load offset=12
          local.set 32
          i32.const 3
          local.set 33
          local.get 32
          local.get 33
          i32.shl
          local.set 34
          local.get 31
          local.get 34
          i32.add
          local.set 35
          local.get 35
          i64.load
          local.set 48
          local.get 47
          local.set 49
          local.get 48
          local.set 50
          local.get 49
          local.get 50
          i64.lt_u
          local.set 36
          i32.const 1
          local.set 37
          local.get 36
          local.get 37
          i32.and
          local.set 38
          block  ;; label = @4
            local.get 38
            i32.eqz
            br_if 0 (;@4;)
            i64.const 1
            local.set 51
            local.get 4
            local.get 51
            i64.store offset=24
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=12
          local.set 39
          i32.const -1
          local.set 40
          local.get 39
          local.get 40
          i32.add
          local.set 41
          local.get 4
          local.get 41
          i32.store offset=12
          br 0 (;@3;)
          unreachable
        end
        unreachable
      end
      i64.const 1
      local.set 52
      local.get 4
      local.get 52
      i64.store offset=24
    end
    local.get 4
    i64.load offset=24
    local.set 53
    local.get 53
    return)
  (func $square256_64bitlimbs (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 2
    i32.const 272
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set 0
    i32.const 0
    local.set 5
    local.get 4
    local.get 0
    i32.store offset=268
    local.get 4
    local.get 1
    i32.store offset=264
    local.get 4
    local.get 5
    i32.store offset=124
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 6
        local.get 4
        i32.load offset=124
        local.set 7
        local.get 7
        local.set 8
        local.get 6
        local.set 9
        local.get 8
        local.get 9
        i32.lt_s
        local.set 10
        i32.const 1
        local.set 11
        local.get 10
        local.get 11
        i32.and
        local.set 12
        local.get 12
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=124
        local.set 13
        i32.const 4
        local.set 14
        local.get 13
        local.get 14
        i32.shl
        local.set 15
        i32.const 128
        local.set 16
        local.get 4
        local.get 16
        i32.add
        local.set 17
        local.get 17
        local.get 15
        i32.add
        local.set 18
        i64.const 0
        local.set 127
        local.get 18
        local.get 127
        i64.store offset=8
        local.get 18
        local.get 127
        i64.store
        local.get 4
        i32.load offset=124
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.add
        local.set 21
        local.get 4
        local.get 21
        i32.store offset=124
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 22
    local.get 4
    local.get 22
    i32.store offset=120
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 4
        local.set 23
        local.get 4
        i32.load offset=120
        local.set 24
        local.get 24
        local.set 25
        local.get 23
        local.set 26
        local.get 25
        local.get 26
        i32.lt_s
        local.set 27
        i32.const 1
        local.set 28
        local.get 27
        local.get 28
        i32.and
        local.set 29
        local.get 29
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=120
        local.set 30
        i32.const 5
        local.set 31
        local.get 30
        local.get 31
        i32.shl
        local.set 32
        i32.const 128
        local.set 33
        local.get 4
        local.get 33
        i32.add
        local.set 34
        local.get 34
        local.get 32
        i32.add
        local.set 35
        local.get 35
        i64.load offset=8
        local.set 128
        local.get 35
        i64.load
        local.set 129
        local.get 4
        i32.load offset=268
        local.set 36
        i32.const 3
        local.set 37
        local.get 30
        local.get 37
        i32.shl
        local.set 38
        local.get 36
        local.get 38
        i32.add
        local.set 39
        local.get 39
        i64.load
        local.set 130
        i64.const 0
        local.set 131
        i32.const 24
        local.set 40
        local.get 4
        local.get 40
        i32.add
        local.set 41
        local.get 41
        local.get 130
        local.get 131
        local.get 130
        local.get 131
        call $__multi3
        i32.const 32
        local.set 42
        local.get 4
        local.get 42
        i32.add
        local.set 43
        local.get 43
        i64.load align=1
        local.set 132
        local.get 4
        i64.load offset=24 align=1
        local.set 133
        local.get 129
        local.get 133
        i64.add
        local.set 134
        local.get 134
        local.get 129
        i64.lt_u
        local.set 44
        local.get 44
        i64.extend_i32_u
        local.set 135
        local.get 128
        local.get 132
        i64.add
        local.set 136
        local.get 136
        local.get 135
        i64.add
        local.set 137
        local.get 4
        local.get 134
        i64.store offset=96
        local.get 4
        local.get 137
        i64.store offset=104
        local.get 4
        i64.load offset=104
        local.set 138
        local.get 4
        local.get 131
        i64.store offset=88
        local.get 4
        local.get 138
        i64.store offset=80
        local.get 4
        i64.load offset=96
        local.set 139
        local.get 4
        local.get 139
        i64.store offset=72
        local.get 4
        i64.load offset=72
        local.set 140
        local.get 4
        i32.load offset=120
        local.set 45
        local.get 45
        local.get 31
        i32.shl
        local.set 46
        i32.const 128
        local.set 47
        local.get 4
        local.get 47
        i32.add
        local.set 48
        local.get 48
        local.get 46
        i32.add
        local.set 49
        local.get 49
        local.get 131
        i64.store offset=8
        local.get 49
        local.get 140
        i64.store
        local.get 4
        i64.load offset=80
        local.set 141
        local.get 4
        i64.load offset=88
        local.set 142
        local.get 4
        local.get 142
        i64.store offset=56
        local.get 4
        local.get 141
        i64.store offset=48
        local.get 4
        i32.load offset=120
        local.set 50
        i32.const 1
        local.set 51
        local.get 50
        local.get 51
        i32.add
        local.set 52
        local.get 4
        local.get 52
        i32.store offset=44
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 4
            local.set 53
            local.get 4
            i32.load offset=44
            local.set 54
            local.get 54
            local.set 55
            local.get 53
            local.set 56
            local.get 55
            local.get 56
            i32.lt_s
            local.set 57
            i32.const 1
            local.set 58
            local.get 57
            local.get 58
            i32.and
            local.set 59
            local.get 59
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load offset=120
            local.set 60
            local.get 4
            i32.load offset=44
            local.set 61
            local.get 60
            local.get 61
            i32.add
            local.set 62
            i32.const 4
            local.set 63
            local.get 62
            local.get 63
            i32.shl
            local.set 64
            i32.const 128
            local.set 65
            local.get 4
            local.get 65
            i32.add
            local.set 66
            local.get 66
            local.get 64
            i32.add
            local.set 67
            local.get 67
            i64.load
            local.set 143
            local.get 67
            i64.load offset=8
            local.set 144
            local.get 4
            i32.load offset=268
            local.set 68
            i32.const 3
            local.set 69
            local.get 61
            local.get 69
            i32.shl
            local.set 70
            local.get 68
            local.get 70
            i32.add
            local.set 71
            local.get 71
            i64.load
            local.set 145
            local.get 60
            local.get 69
            i32.shl
            local.set 72
            local.get 68
            local.get 72
            i32.add
            local.set 73
            local.get 73
            i64.load
            local.set 146
            i64.const 0
            local.set 147
            i32.const 8
            local.set 74
            local.get 4
            local.get 74
            i32.add
            local.set 75
            local.get 75
            local.get 145
            local.get 147
            local.get 146
            local.get 147
            call $__multi3
            i32.const 16
            local.set 76
            local.get 4
            local.get 76
            i32.add
            local.set 77
            local.get 77
            i64.load align=1
            local.set 148
            local.get 4
            i64.load offset=8 align=1
            local.set 149
            i64.const 63
            local.set 150
            local.get 149
            local.get 150
            i64.shr_u
            local.set 151
            i64.const 1
            local.set 152
            local.get 148
            local.get 152
            i64.shl
            local.set 153
            local.get 153
            local.get 151
            i64.or
            local.set 154
            local.get 149
            local.get 152
            i64.shl
            local.set 155
            local.get 144
            local.get 154
            i64.add
            local.set 156
            local.get 143
            local.get 155
            i64.add
            local.set 157
            local.get 157
            local.get 143
            i64.lt_u
            local.set 78
            local.get 78
            i64.extend_i32_u
            local.set 158
            local.get 156
            local.get 158
            i64.add
            local.set 159
            local.get 4
            i64.load offset=48
            local.set 160
            local.get 4
            i64.load offset=56
            local.set 161
            local.get 159
            local.get 161
            i64.add
            local.set 162
            local.get 157
            local.get 160
            i64.add
            local.set 163
            local.get 163
            local.get 157
            i64.lt_u
            local.set 79
            local.get 79
            i64.extend_i32_u
            local.set 164
            local.get 162
            local.get 164
            i64.add
            local.set 165
            local.get 4
            local.get 163
            i64.store offset=96
            local.get 4
            local.get 165
            i64.store offset=104
            local.get 4
            i64.load offset=104
            local.set 166
            local.get 4
            local.get 147
            i64.store offset=88
            local.get 4
            local.get 166
            i64.store offset=80
            local.get 4
            i64.load offset=96
            local.set 167
            local.get 4
            local.get 167
            i64.store offset=72
            local.get 4
            i64.load offset=72
            local.set 168
            local.get 4
            i32.load offset=120
            local.set 80
            local.get 4
            i32.load offset=44
            local.set 81
            local.get 80
            local.get 81
            i32.add
            local.set 82
            local.get 82
            local.get 63
            i32.shl
            local.set 83
            i32.const 128
            local.set 84
            local.get 4
            local.get 84
            i32.add
            local.set 85
            local.get 85
            local.get 83
            i32.add
            local.set 86
            local.get 86
            local.get 147
            i64.store offset=8
            local.get 86
            local.get 168
            i64.store
            local.get 4
            i64.load offset=80
            local.set 169
            local.get 4
            i64.load offset=88
            local.set 170
            local.get 4
            local.get 170
            i64.store offset=56
            local.get 4
            local.get 169
            i64.store offset=48
            local.get 4
            i32.load offset=44
            local.set 87
            i32.const 1
            local.set 88
            local.get 87
            local.get 88
            i32.add
            local.set 89
            local.get 4
            local.get 89
            i32.store offset=44
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        local.get 4
        i64.load offset=80
        local.set 171
        local.get 4
        i64.load offset=88
        local.set 172
        local.get 4
        i32.load offset=120
        local.set 90
        i32.const 4
        local.set 91
        local.get 90
        local.get 91
        i32.shl
        local.set 92
        i32.const 128
        local.set 93
        local.get 4
        local.get 93
        i32.add
        local.set 94
        local.get 94
        local.get 92
        i32.add
        local.set 95
        i32.const 64
        local.set 96
        local.get 95
        local.get 96
        i32.add
        local.set 97
        i32.const 72
        local.set 98
        local.get 95
        local.get 98
        i32.add
        local.set 99
        local.get 99
        local.get 172
        i64.store
        local.get 97
        local.get 171
        i64.store
        local.get 4
        i32.load offset=120
        local.set 100
        i32.const 1
        local.set 101
        local.get 100
        local.get 101
        i32.add
        local.set 102
        local.get 4
        local.get 102
        i32.store offset=120
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 103
    local.get 4
    local.get 103
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 8
        local.set 104
        local.get 4
        i32.load offset=40
        local.set 105
        local.get 105
        local.set 106
        local.get 104
        local.set 107
        local.get 106
        local.get 107
        i32.lt_s
        local.set 108
        i32.const 1
        local.set 109
        local.get 108
        local.get 109
        i32.and
        local.set 110
        local.get 110
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        i32.load offset=40
        local.set 111
        i32.const 4
        local.set 112
        local.get 111
        local.get 112
        i32.shl
        local.set 113
        i32.const 128
        local.set 114
        local.get 4
        local.get 114
        i32.add
        local.set 115
        local.get 115
        local.get 113
        i32.add
        local.set 116
        local.get 116
        i64.load
        local.set 173
        local.get 4
        i32.load offset=264
        local.set 117
        local.get 4
        i32.load offset=40
        local.set 118
        i32.const 3
        local.set 119
        local.get 118
        local.get 119
        i32.shl
        local.set 120
        local.get 117
        local.get 120
        i32.add
        local.set 121
        local.get 121
        local.get 173
        i64.store
        local.get 4
        i32.load offset=40
        local.set 122
        i32.const 1
        local.set 123
        local.get 122
        local.get 123
        i32.add
        local.set 124
        local.get 4
        local.get 124
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 272
    local.set 125
    local.get 4
    local.get 125
    i32.add
    local.set 126
    local.get 126
    global.set 0
    return)
  (func $montreduce256_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 4
    i32.const 96
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    local.get 6
    local.get 0
    i32.store offset=92
    local.get 6
    local.get 1
    i32.store offset=88
    local.get 6
    local.get 2
    i32.store offset=84
    local.get 6
    local.get 3
    i32.store offset=80
    local.get 6
    i32.load offset=92
    local.set 8
    local.get 6
    local.get 8
    i32.store offset=76
    local.get 6
    local.get 7
    i32.store offset=72
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 4
        local.set 9
        local.get 6
        i32.load offset=72
        local.set 10
        local.get 10
        local.set 11
        local.get 9
        local.set 12
        local.get 11
        local.get 12
        i32.lt_s
        local.set 13
        i32.const 1
        local.set 14
        local.get 13
        local.get 14
        i32.and
        local.set 15
        local.get 15
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 16
        local.get 6
        i32.load offset=76
        local.set 17
        local.get 6
        i32.load offset=72
        local.set 18
        i32.const 3
        local.set 19
        local.get 18
        local.get 19
        i32.shl
        local.set 20
        local.get 17
        local.get 20
        i32.add
        local.set 21
        local.get 21
        i64.load
        local.set 127
        local.get 6
        i32.load offset=84
        local.set 22
        local.get 22
        i64.load
        local.set 128
        local.get 127
        local.get 128
        i64.mul
        local.set 129
        local.get 6
        local.get 129
        i64.store offset=64
        i64.const 0
        local.set 130
        local.get 6
        local.get 130
        i64.store offset=56
        local.get 6
        local.get 130
        i64.store offset=48
        local.get 6
        local.get 16
        i32.store offset=28
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 4
            local.set 23
            local.get 6
            i32.load offset=28
            local.set 24
            local.get 24
            local.set 25
            local.get 23
            local.set 26
            local.get 25
            local.get 26
            i32.lt_s
            local.set 27
            i32.const 1
            local.set 28
            local.get 27
            local.get 28
            i32.and
            local.set 29
            local.get 29
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            i64.load offset=64
            local.set 131
            local.get 6
            i32.load offset=88
            local.set 30
            local.get 6
            i32.load offset=28
            local.set 31
            i32.const 3
            local.set 32
            local.get 31
            local.get 32
            i32.shl
            local.set 33
            local.get 30
            local.get 33
            i32.add
            local.set 34
            local.get 34
            i64.load
            local.set 132
            local.get 131
            local.get 132
            i64.mul
            local.set 133
            local.get 6
            local.get 133
            i64.store offset=16
            local.get 6
            i32.load offset=76
            local.set 35
            local.get 6
            i32.load offset=72
            local.set 36
            local.get 6
            i32.load offset=28
            local.set 37
            local.get 36
            local.get 37
            i32.add
            local.set 38
            local.get 38
            local.get 32
            i32.shl
            local.set 39
            local.get 35
            local.get 39
            i32.add
            local.set 40
            local.get 40
            i64.load
            local.set 134
            local.get 6
            i64.load offset=16
            local.set 135
            local.get 134
            local.get 135
            i64.add
            local.set 136
            local.get 136
            local.get 134
            i64.lt_u
            local.set 41
            local.get 41
            i64.extend_i32_u
            local.set 137
            local.get 6
            i64.load offset=48
            local.set 138
            local.get 6
            i64.load offset=56
            local.set 139
            local.get 137
            local.get 139
            i64.add
            local.set 140
            local.get 136
            local.get 138
            i64.add
            local.set 141
            local.get 141
            local.get 136
            i64.lt_u
            local.set 42
            local.get 42
            i64.extend_i32_u
            local.set 142
            local.get 140
            local.get 142
            i64.add
            local.set 143
            local.get 6
            local.get 141
            i64.store offset=32
            local.get 6
            local.get 143
            i64.store offset=40
            local.get 6
            i64.load offset=32
            local.set 144
            local.get 6
            i32.load offset=76
            local.set 43
            local.get 6
            i32.load offset=72
            local.set 44
            local.get 6
            i32.load offset=28
            local.set 45
            local.get 44
            local.get 45
            i32.add
            local.set 46
            local.get 46
            local.get 32
            i32.shl
            local.set 47
            local.get 43
            local.get 47
            i32.add
            local.set 48
            local.get 48
            local.get 144
            i64.store
            local.get 6
            i64.load offset=40
            local.set 145
            i64.const 0
            local.set 146
            local.get 6
            local.get 146
            i64.store offset=56
            local.get 6
            local.get 145
            i64.store offset=48
            local.get 6
            i32.load offset=28
            local.set 49
            i32.const 1
            local.set 50
            local.get 49
            local.get 50
            i32.add
            local.set 51
            local.get 6
            local.get 51
            i32.store offset=28
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 1
        local.set 52
        local.get 6
        local.get 52
        i32.store offset=12
        loop  ;; label = @3
          i32.const 0
          local.set 53
          local.get 6
          i64.load offset=56
          local.set 147
          local.get 6
          i64.load offset=48
          local.set 148
          local.get 148
          local.get 147
          i64.or
          local.set 149
          i64.const 0
          local.set 150
          local.get 149
          local.get 150
          i64.ne
          local.set 54
          i32.const 1
          local.set 55
          local.get 54
          local.get 55
          i32.and
          local.set 56
          local.get 53
          local.set 57
          block  ;; label = @4
            local.get 56
            i32.eqz
            br_if 0 (;@4;)
            i32.const 8
            local.set 58
            local.get 6
            i32.load offset=72
            local.set 59
            local.get 6
            i32.load offset=28
            local.set 60
            local.get 59
            local.get 60
            i32.add
            local.set 61
            local.get 6
            i32.load offset=12
            local.set 62
            local.get 61
            local.get 62
            i32.add
            local.set 63
            local.get 63
            local.set 64
            local.get 58
            local.set 65
            local.get 64
            local.get 65
            i32.lt_s
            local.set 66
            local.get 66
            local.set 57
          end
          local.get 57
          local.set 67
          i32.const 1
          local.set 68
          local.get 67
          local.get 68
          i32.and
          local.set 69
          block  ;; label = @4
            local.get 69
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            i32.load offset=76
            local.set 70
            local.get 6
            i32.load offset=72
            local.set 71
            local.get 6
            i32.load offset=28
            local.set 72
            local.get 71
            local.get 72
            i32.add
            local.set 73
            local.get 6
            i32.load offset=12
            local.set 74
            local.get 73
            local.get 74
            i32.add
            local.set 75
            i32.const 3
            local.set 76
            local.get 75
            local.get 76
            i32.shl
            local.set 77
            local.get 70
            local.get 77
            i32.add
            local.set 78
            local.get 78
            i64.load
            local.set 151
            local.get 6
            i64.load offset=56
            local.set 152
            local.get 6
            i64.load offset=48
            local.set 153
            local.get 151
            local.get 153
            i64.add
            local.set 154
            local.get 154
            local.get 151
            i64.lt_u
            local.set 79
            local.get 79
            i64.extend_i32_u
            local.set 155
            local.get 152
            local.get 155
            i64.add
            local.set 156
            local.get 6
            local.get 154
            i64.store offset=32
            local.get 6
            local.get 156
            i64.store offset=40
            local.get 6
            i64.load offset=32
            local.set 157
            local.get 6
            i32.load offset=76
            local.set 80
            local.get 6
            i32.load offset=72
            local.set 81
            local.get 6
            i32.load offset=28
            local.set 82
            local.get 81
            local.get 82
            i32.add
            local.set 83
            local.get 6
            i32.load offset=12
            local.set 84
            local.get 83
            local.get 84
            i32.add
            local.set 85
            local.get 85
            local.get 76
            i32.shl
            local.set 86
            local.get 80
            local.get 86
            i32.add
            local.set 87
            local.get 87
            local.get 157
            i64.store
            local.get 6
            i64.load offset=40
            local.set 158
            i64.const 0
            local.set 159
            local.get 6
            local.get 159
            i64.store offset=56
            local.get 6
            local.get 158
            i64.store offset=48
            local.get 6
            i32.load offset=12
            local.set 88
            i32.const 1
            local.set 89
            local.get 88
            local.get 89
            i32.add
            local.set 90
            local.get 6
            local.get 90
            i32.store offset=12
            br 1 (;@3;)
          end
        end
        local.get 6
        i32.load offset=72
        local.set 91
        i32.const 1
        local.set 92
        local.get 91
        local.get 92
        i32.add
        local.set 93
        local.get 6
        local.get 93
        i32.store offset=72
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 94
    local.get 6
    local.get 94
    i32.store offset=8
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 4
        local.set 95
        local.get 6
        i32.load offset=8
        local.set 96
        local.get 96
        local.set 97
        local.get 95
        local.set 98
        local.get 97
        local.get 98
        i32.lt_s
        local.set 99
        i32.const 1
        local.set 100
        local.get 99
        local.get 100
        i32.and
        local.set 101
        local.get 101
        i32.eqz
        br_if 1 (;@1;)
        local.get 6
        i32.load offset=76
        local.set 102
        local.get 6
        i32.load offset=8
        local.set 103
        i32.const 4
        local.set 104
        local.get 103
        local.get 104
        i32.add
        local.set 105
        i32.const 3
        local.set 106
        local.get 105
        local.get 106
        i32.shl
        local.set 107
        local.get 102
        local.get 107
        i32.add
        local.set 108
        local.get 108
        i64.load
        local.set 160
        local.get 6
        i32.load offset=80
        local.set 109
        local.get 6
        i32.load offset=8
        local.set 110
        i32.const 3
        local.set 111
        local.get 110
        local.get 111
        i32.shl
        local.set 112
        local.get 109
        local.get 112
        i32.add
        local.set 113
        local.get 113
        local.get 160
        i64.store
        local.get 6
        i32.load offset=8
        local.set 114
        i32.const 1
        local.set 115
        local.get 114
        local.get 115
        i32.add
        local.set 116
        local.get 6
        local.get 116
        i32.store offset=8
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i64.const 0
    local.set 161
    local.get 6
    i32.load offset=88
    local.set 117
    local.get 6
    i32.load offset=80
    local.set 118
    local.get 117
    local.get 118
    call $less_than_or_equal256_64bitlimbs
    local.set 162
    local.get 162
    local.set 163
    local.get 161
    local.set 164
    local.get 163
    local.get 164
    i64.ne
    local.set 119
    i32.const 1
    local.set 120
    local.get 119
    local.get 120
    i32.and
    local.set 121
    block  ;; label = @1
      local.get 121
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=80
      local.set 122
      local.get 6
      i32.load offset=88
      local.set 123
      local.get 6
      i32.load offset=80
      local.set 124
      local.get 122
      local.get 123
      local.get 124
      call $subtract256_64bitlimbs
    end
    i32.const 96
    local.set 125
    local.get 6
    local.get 125
    i32.add
    local.set 126
    local.get 126
    global.set 0
    return)
  (func $montsquare256_64bitlimbs (type 3) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    local.set 4
    i32.const 96
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set 0
    i32.const 0
    local.set 7
    i32.const 16
    local.set 8
    local.get 6
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 6
    local.get 0
    i32.store offset=92
    local.get 6
    local.get 1
    i32.store offset=88
    local.get 6
    local.get 2
    i32.store offset=84
    local.get 6
    local.get 3
    i32.store offset=80
    local.get 6
    i32.load offset=92
    local.set 11
    local.get 11
    local.get 10
    call $square256_64bitlimbs
    local.get 6
    i32.load offset=92
    local.set 12
    local.get 6
    i32.load offset=84
    local.set 13
    local.get 6
    i32.load offset=80
    local.set 14
    local.get 12
    local.get 10
    local.get 13
    local.get 14
    call $montreduce256_64bitlimbs
    local.get 6
    local.get 7
    i32.store offset=12
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 4
        local.set 15
        local.get 6
        i32.load offset=12
        local.set 16
        local.get 16
        local.set 17
        local.get 15
        local.set 18
        local.get 17
        local.get 18
        i32.lt_s
        local.set 19
        i32.const 1
        local.set 20
        local.get 19
        local.get 20
        i32.and
        local.set 21
        local.get 21
        i32.eqz
        br_if 1 (;@1;)
        i32.const 16
        local.set 22
        local.get 6
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 6
        i32.load offset=12
        local.set 25
        i32.const 3
        local.set 26
        local.get 25
        local.get 26
        i32.shl
        local.set 27
        local.get 24
        local.get 27
        i32.add
        local.set 28
        local.get 28
        i64.load
        local.set 39
        local.get 6
        i32.load offset=88
        local.set 29
        local.get 6
        i32.load offset=12
        local.set 30
        i32.const 3
        local.set 31
        local.get 30
        local.get 31
        i32.shl
        local.set 32
        local.get 29
        local.get 32
        i32.add
        local.set 33
        local.get 33
        local.get 39
        i64.store
        local.get 6
        i32.load offset=12
        local.set 34
        i32.const 1
        local.set 35
        local.get 34
        local.get 35
        i32.add
        local.set 36
        local.get 6
        local.get 36
        i32.store offset=12
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 96
    local.set 37
    local.get 6
    local.get 37
    i32.add
    local.set 38
    local.get 38
    global.set 0
    return)
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
  (export "montsquare256_32bitlimbs" (func $montsquare256_32bitlimbs))
  (export "montsquare768_32bitlimbs" (func $montsquare768_32bitlimbs))
  (export "montsquare256_64bitlimbs" (func $montsquare256_64bitlimbs)))
