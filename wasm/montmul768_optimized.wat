(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32 i64 i64 i64 i64)))
  (func (;0;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=4
    local.get 5
    i32.load offset=12
    local.set 6
    local.get 5
    local.get 6
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 0
        local.set 7
        local.get 5
        i32.load offset=4
        local.set 8
        i32.const -1
        local.set 9
        local.get 8
        local.get 9
        i32.add
        local.set 10
        local.get 5
        local.get 10
        i32.store offset=4
        local.get 8
        local.set 11
        local.get 7
        local.set 12
        local.get 11
        local.get 12
        i32.gt_u
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
        local.get 5
        i32.load offset=8
        local.set 16
        local.get 5
        i32.load
        local.set 17
        i32.const 1
        local.set 18
        local.get 17
        local.get 18
        i32.add
        local.set 19
        local.get 5
        local.get 19
        i32.store
        local.get 17
        local.get 16
        i32.store8
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    local.get 5
    i32.load
    local.set 20
    local.get 20
    return)
  (func (;1;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set 0
    local.get 7
    local.get 0
    i32.store offset=28
    local.get 7
    local.get 1
    i32.store offset=24
    local.get 7
    local.get 2
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=16
    local.get 7
    local.get 4
    i32.store offset=12
    local.get 7
    i32.load offset=28
    local.set 8
    local.get 7
    i32.load offset=24
    local.set 9
    local.get 7
    i32.load offset=20
    local.set 10
    local.get 7
    i32.load offset=16
    local.set 11
    local.get 7
    i32.load offset=12
    local.set 12
    local.get 8
    local.get 9
    local.get 10
    local.get 11
    local.get 12
    call 2
    i32.const 32
    local.set 13
    local.get 7
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set 0
    return)
  (func (;2;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 5
    i32.const 288
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set 0
    i32.const 0
    local.set 8
    i32.const 64
    local.set 9
    local.get 7
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.set 11
    local.get 7
    local.get 0
    i32.store offset=284
    local.get 7
    local.get 1
    i32.store offset=280
    local.get 7
    local.get 2
    i32.store offset=276
    local.get 7
    local.get 3
    i32.store offset=272
    local.get 7
    local.get 4
    i32.store offset=268
    i32.const 192
    local.set 12
    i32.const 0
    local.set 13
    local.get 11
    local.get 13
    local.get 12
    call 0
    drop
    local.get 7
    local.get 8
    i32.store offset=60
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 14
        local.get 7
        i32.load offset=60
        local.set 15
        local.get 15
        local.set 16
        local.get 14
        local.set 17
        local.get 16
        local.get 17
        i32.lt_s
        local.set 18
        i32.const 1
        local.set 19
        local.get 18
        local.get 19
        i32.and
        local.set 20
        local.get 20
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 21
        i32.const 64
        local.set 22
        local.get 7
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 7
        i32.load offset=60
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
        local.get 7
        i32.load offset=284
        local.set 30
        local.get 7
        i32.load offset=60
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
        i32.load
        local.set 35
        local.get 7
        i32.load offset=280
        local.set 36
        local.get 36
        i32.load
        local.set 37
        local.get 35
        local.get 37
        i32.mul
        local.set 38
        local.get 29
        local.get 38
        i32.add
        local.set 39
        local.get 7
        i32.load offset=272
        local.set 40
        local.get 40
        i32.load
        local.set 41
        local.get 39
        local.get 41
        i32.mul
        local.set 42
        local.get 7
        local.get 42
        i32.store offset=56
        local.get 7
        local.get 21
        i32.store offset=52
        local.get 7
        local.get 21
        i32.store offset=48
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 24
            local.set 43
            local.get 7
            i32.load offset=48
            local.set 44
            local.get 44
            local.set 45
            local.get 43
            local.set 46
            local.get 45
            local.get 46
            i32.lt_s
            local.set 47
            i32.const 1
            local.set 48
            local.get 47
            local.get 48
            i32.and
            local.set 49
            local.get 49
            i32.eqz
            br_if 1 (;@3;)
            i32.const 64
            local.set 50
            local.get 7
            local.get 50
            i32.add
            local.set 51
            local.get 51
            local.set 52
            local.get 7
            i32.load offset=284
            local.set 53
            local.get 7
            i32.load offset=60
            local.set 54
            i32.const 2
            local.set 55
            local.get 54
            local.get 55
            i32.shl
            local.set 56
            local.get 53
            local.get 56
            i32.add
            local.set 57
            local.get 57
            i32.load
            local.set 58
            local.get 58
            local.set 59
            local.get 59
            i64.extend_i32_u
            local.set 224
            local.get 7
            i32.load offset=280
            local.set 60
            local.get 7
            i32.load offset=48
            local.set 61
            i32.const 2
            local.set 62
            local.get 61
            local.get 62
            i32.shl
            local.set 63
            local.get 60
            local.get 63
            i32.add
            local.set 64
            local.get 64
            i32.load
            local.set 65
            local.get 65
            local.set 66
            local.get 66
            i64.extend_i32_u
            local.set 225
            local.get 224
            local.get 225
            i64.mul
            local.set 226
            local.get 7
            local.get 226
            i64.store offset=40
            local.get 7
            i32.load offset=56
            local.set 67
            local.get 67
            local.set 68
            local.get 68
            i64.extend_i32_u
            local.set 227
            local.get 7
            i32.load offset=276
            local.set 69
            local.get 7
            i32.load offset=48
            local.set 70
            i32.const 2
            local.set 71
            local.get 70
            local.get 71
            i32.shl
            local.set 72
            local.get 69
            local.get 72
            i32.add
            local.set 73
            local.get 73
            i32.load
            local.set 74
            local.get 74
            local.set 75
            local.get 75
            i64.extend_i32_u
            local.set 228
            local.get 227
            local.get 228
            i64.mul
            local.set 229
            local.get 7
            local.get 229
            i64.store offset=32
            local.get 7
            i64.load offset=40
            local.set 230
            local.get 7
            i32.load offset=52
            local.set 76
            local.get 76
            local.set 77
            local.get 77
            i64.extend_i32_u
            local.set 231
            local.get 230
            local.get 231
            i64.add
            local.set 232
            local.get 7
            i32.load offset=60
            local.set 78
            local.get 7
            i32.load offset=48
            local.set 79
            local.get 78
            local.get 79
            i32.add
            local.set 80
            i32.const 2
            local.set 81
            local.get 80
            local.get 81
            i32.shl
            local.set 82
            local.get 52
            local.get 82
            i32.add
            local.set 83
            local.get 83
            i32.load
            local.set 84
            local.get 84
            local.set 85
            local.get 85
            i64.extend_i32_u
            local.set 233
            local.get 232
            local.get 233
            i64.add
            local.set 234
            local.get 7
            local.get 234
            i64.store offset=24
            local.get 7
            i64.load offset=32
            local.set 235
            local.get 7
            i64.load offset=24
            local.set 236
            local.get 235
            local.get 236
            i64.add
            local.set 237
            local.get 7
            local.get 237
            i64.store offset=16
            local.get 7
            i64.load offset=16
            local.set 238
            local.get 238
            i32.wrap_i64
            local.set 86
            local.get 7
            i32.load offset=60
            local.set 87
            local.get 7
            i32.load offset=48
            local.set 88
            local.get 87
            local.get 88
            i32.add
            local.set 89
            i32.const 2
            local.set 90
            local.get 89
            local.get 90
            i32.shl
            local.set 91
            local.get 52
            local.get 91
            i32.add
            local.set 92
            local.get 92
            local.get 86
            i32.store
            local.get 7
            i64.load offset=16
            local.set 239
            i64.const 32
            local.set 240
            local.get 239
            local.get 240
            i64.shr_u
            local.set 241
            local.get 241
            i32.wrap_i64
            local.set 93
            local.get 7
            local.get 93
            i32.store offset=52
            local.get 7
            i64.load offset=16
            local.set 242
            local.get 7
            i64.load offset=24
            local.set 243
            local.get 242
            local.set 244
            local.get 243
            local.set 245
            local.get 244
            local.get 245
            i64.lt_u
            local.set 94
            i32.const 1
            local.set 95
            local.get 94
            local.get 95
            i32.and
            local.set 96
            block  ;; label = @5
              local.get 96
              i32.eqz
              br_if 0 (;@5;)
              i32.const 2
              local.set 97
              local.get 7
              local.get 97
              i32.store offset=12
              loop  ;; label = @6
                i32.const 0
                local.set 98
                i32.const 48
                local.set 99
                local.get 7
                i32.load offset=60
                local.set 100
                local.get 7
                i32.load offset=48
                local.set 101
                local.get 100
                local.get 101
                i32.add
                local.set 102
                local.get 7
                i32.load offset=12
                local.set 103
                local.get 102
                local.get 103
                i32.add
                local.set 104
                local.get 104
                local.set 105
                local.get 99
                local.set 106
                local.get 105
                local.get 106
                i32.lt_s
                local.set 107
                i32.const 1
                local.set 108
                local.get 107
                local.get 108
                i32.and
                local.set 109
                local.get 98
                local.set 110
                block  ;; label = @7
                  local.get 109
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const -1
                  local.set 111
                  i32.const 64
                  local.set 112
                  local.get 7
                  local.get 112
                  i32.add
                  local.set 113
                  local.get 113
                  local.set 114
                  local.get 7
                  i32.load offset=60
                  local.set 115
                  local.get 7
                  i32.load offset=48
                  local.set 116
                  local.get 115
                  local.get 116
                  i32.add
                  local.set 117
                  local.get 7
                  i32.load offset=12
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
                  local.get 114
                  local.get 121
                  i32.add
                  local.set 122
                  local.get 122
                  i32.load
                  local.set 123
                  local.get 123
                  local.set 124
                  local.get 111
                  local.set 125
                  local.get 124
                  local.get 125
                  i32.eq
                  local.set 126
                  local.get 126
                  local.set 110
                end
                local.get 110
                local.set 127
                i32.const 1
                local.set 128
                local.get 127
                local.get 128
                i32.and
                local.set 129
                block  ;; label = @7
                  local.get 129
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 130
                  i32.const 64
                  local.set 131
                  local.get 7
                  local.get 131
                  i32.add
                  local.set 132
                  local.get 132
                  local.set 133
                  local.get 7
                  i32.load offset=60
                  local.set 134
                  local.get 7
                  i32.load offset=48
                  local.set 135
                  local.get 134
                  local.get 135
                  i32.add
                  local.set 136
                  local.get 7
                  i32.load offset=12
                  local.set 137
                  local.get 136
                  local.get 137
                  i32.add
                  local.set 138
                  i32.const 2
                  local.set 139
                  local.get 138
                  local.get 139
                  i32.shl
                  local.set 140
                  local.get 133
                  local.get 140
                  i32.add
                  local.set 141
                  local.get 141
                  local.get 130
                  i32.store
                  local.get 7
                  i32.load offset=12
                  local.set 142
                  i32.const 1
                  local.set 143
                  local.get 142
                  local.get 143
                  i32.add
                  local.set 144
                  local.get 7
                  local.get 144
                  i32.store offset=12
                  br 1 (;@6;)
                end
              end
              i32.const 48
              local.set 145
              local.get 7
              i32.load offset=60
              local.set 146
              local.get 7
              i32.load offset=48
              local.set 147
              local.get 146
              local.get 147
              i32.add
              local.set 148
              local.get 7
              i32.load offset=12
              local.set 149
              local.get 148
              local.get 149
              i32.add
              local.set 150
              local.get 150
              local.set 151
              local.get 145
              local.set 152
              local.get 151
              local.get 152
              i32.lt_s
              local.set 153
              i32.const 1
              local.set 154
              local.get 153
              local.get 154
              i32.and
              local.set 155
              block  ;; label = @6
                local.get 155
                i32.eqz
                br_if 0 (;@6;)
                i32.const 64
                local.set 156
                local.get 7
                local.get 156
                i32.add
                local.set 157
                local.get 157
                local.set 158
                local.get 7
                i32.load offset=60
                local.set 159
                local.get 7
                i32.load offset=48
                local.set 160
                local.get 159
                local.get 160
                i32.add
                local.set 161
                local.get 7
                i32.load offset=12
                local.set 162
                local.get 161
                local.get 162
                i32.add
                local.set 163
                i32.const 2
                local.set 164
                local.get 163
                local.get 164
                i32.shl
                local.set 165
                local.get 158
                local.get 165
                i32.add
                local.set 166
                local.get 166
                i32.load
                local.set 167
                i32.const 1
                local.set 168
                local.get 167
                local.get 168
                i32.add
                local.set 169
                local.get 166
                local.get 169
                i32.store
              end
            end
            local.get 7
            i32.load offset=48
            local.set 170
            i32.const 1
            local.set 171
            local.get 170
            local.get 171
            i32.add
            local.set 172
            local.get 7
            local.get 172
            i32.store offset=48
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 64
        local.set 173
        local.get 7
        local.get 173
        i32.add
        local.set 174
        local.get 174
        local.set 175
        local.get 7
        i32.load offset=52
        local.set 176
        local.get 7
        i32.load offset=60
        local.set 177
        i32.const 24
        local.set 178
        local.get 177
        local.get 178
        i32.add
        local.set 179
        i32.const 2
        local.set 180
        local.get 179
        local.get 180
        i32.shl
        local.set 181
        local.get 175
        local.get 181
        i32.add
        local.set 182
        local.get 182
        i32.load
        local.set 183
        local.get 183
        local.get 176
        i32.add
        local.set 184
        local.get 182
        local.get 184
        i32.store
        local.get 7
        i32.load offset=60
        local.set 185
        i32.const 1
        local.set 186
        local.get 185
        local.get 186
        i32.add
        local.set 187
        local.get 7
        local.get 187
        i32.store offset=60
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 188
    local.get 7
    local.get 188
    i32.store offset=8
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 24
        local.set 189
        local.get 7
        i32.load offset=8
        local.set 190
        local.get 190
        local.set 191
        local.get 189
        local.set 192
        local.get 191
        local.get 192
        i32.lt_s
        local.set 193
        i32.const 1
        local.set 194
        local.get 193
        local.get 194
        i32.and
        local.set 195
        local.get 195
        i32.eqz
        br_if 1 (;@1;)
        i32.const 64
        local.set 196
        local.get 7
        local.get 196
        i32.add
        local.set 197
        local.get 197
        local.set 198
        local.get 7
        i32.load offset=8
        local.set 199
        i32.const 24
        local.set 200
        local.get 199
        local.get 200
        i32.add
        local.set 201
        i32.const 2
        local.set 202
        local.get 201
        local.get 202
        i32.shl
        local.set 203
        local.get 198
        local.get 203
        i32.add
        local.set 204
        local.get 204
        i32.load
        local.set 205
        local.get 7
        i32.load offset=268
        local.set 206
        local.get 7
        i32.load offset=8
        local.set 207
        i32.const 2
        local.set 208
        local.get 207
        local.get 208
        i32.shl
        local.set 209
        local.get 206
        local.get 209
        i32.add
        local.set 210
        local.get 210
        local.get 205
        i32.store
        local.get 7
        i32.load offset=8
        local.set 211
        i32.const 1
        local.set 212
        local.get 211
        local.get 212
        i32.add
        local.set 213
        local.get 7
        local.get 213
        i32.store offset=8
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    local.get 7
    i32.load offset=276
    local.set 214
    local.get 7
    i32.load offset=268
    local.set 215
    local.get 214
    local.get 215
    call 3
    local.set 216
    i32.const 1
    local.set 217
    local.get 216
    local.get 217
    i32.and
    local.set 218
    block  ;; label = @1
      local.get 218
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      i32.load offset=268
      local.set 219
      local.get 7
      i32.load offset=276
      local.set 220
      local.get 7
      i32.load offset=268
      local.set 221
      local.get 219
      local.get 220
      local.get 221
      call 4
    end
    i32.const 288
    local.set 222
    local.get 7
    local.get 222
    i32.add
    local.set 223
    local.get 223
    global.set 0
    return)
  (func (;3;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
            i32.const 1
            local.set 31
            local.get 30
            local.get 31
            i32.and
            local.set 32
            local.get 4
            local.get 32
            i32.store8 offset=15
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=8
          local.set 33
          local.get 4
          i32.load
          local.set 34
          i32.const 2
          local.set 35
          local.get 34
          local.get 35
          i32.shl
          local.set 36
          local.get 33
          local.get 36
          i32.add
          local.set 37
          local.get 37
          i32.load
          local.set 38
          local.get 4
          i32.load offset=4
          local.set 39
          local.get 4
          i32.load
          local.set 40
          i32.const 2
          local.set 41
          local.get 40
          local.get 41
          i32.shl
          local.set 42
          local.get 39
          local.get 42
          i32.add
          local.set 43
          local.get 43
          i32.load
          local.set 44
          local.get 38
          local.set 45
          local.get 44
          local.set 46
          local.get 45
          local.get 46
          i32.lt_u
          local.set 47
          i32.const 1
          local.set 48
          local.get 47
          local.get 48
          i32.and
          local.set 49
          block  ;; label = @4
            local.get 49
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 50
            i32.const 1
            local.set 51
            local.get 50
            local.get 51
            i32.and
            local.set 52
            local.get 4
            local.get 52
            i32.store8 offset=15
            br 3 (;@1;)
          end
          local.get 4
          i32.load
          local.set 53
          i32.const -1
          local.set 54
          local.get 53
          local.get 54
          i32.add
          local.set 55
          local.get 4
          local.get 55
          i32.store
          br 0 (;@3;)
          unreachable
        end
        unreachable
      end
      i32.const 1
      local.set 56
      i32.const 1
      local.set 57
      local.get 56
      local.get 57
      i32.and
      local.set 58
      local.get 4
      local.get 58
      i32.store8 offset=15
    end
    local.get 4
    i32.load8_u offset=15
    local.set 59
    i32.const 1
    local.set 60
    local.get 59
    local.get 60
    i32.and
    local.set 61
    local.get 61
    return)
  (func (;4;) (type 3) (param i32 i32 i32)
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
  (func (;5;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set 0
    local.get 7
    local.get 0
    i32.store offset=28
    local.get 7
    local.get 1
    i32.store offset=24
    local.get 7
    local.get 2
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=16
    local.get 7
    local.get 4
    i32.store offset=12
    local.get 7
    i32.load offset=28
    local.set 8
    local.get 7
    i32.load offset=24
    local.set 9
    local.get 7
    i32.load offset=20
    local.set 10
    local.get 7
    i32.load offset=16
    local.set 11
    local.get 7
    i32.load offset=12
    local.set 12
    local.get 8
    local.get 9
    local.get 10
    local.get 11
    local.get 12
    call 6
    i32.const 32
    local.set 13
    local.get 7
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set 0
    return)
  (func (;6;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 5
    i32.const 368
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set 0
    i32.const 0
    local.set 8
    i32.const 144
    local.set 9
    local.get 7
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.set 11
    local.get 7
    local.get 0
    i32.store offset=364
    local.get 7
    local.get 1
    i32.store offset=360
    local.get 7
    local.get 2
    i32.store offset=356
    local.get 7
    local.get 3
    i32.store offset=352
    local.get 7
    local.get 4
    i32.store offset=348
    i32.const 192
    local.set 12
    i32.const 0
    local.set 13
    local.get 11
    local.get 13
    local.get 12
    call 0
    drop
    local.get 7
    local.get 8
    i32.store offset=140
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 12
        local.set 14
        local.get 7
        i32.load offset=140
        local.set 15
        local.get 15
        local.set 16
        local.get 14
        local.set 17
        local.get 16
        local.get 17
        i32.lt_s
        local.set 18
        i32.const 1
        local.set 19
        local.get 18
        local.get 19
        i32.and
        local.set 20
        local.get 20
        i32.eqz
        br_if 1 (;@1;)
        i32.const 0
        local.set 21
        i64.const 0
        local.set 205
        i32.const 144
        local.set 22
        local.get 7
        local.get 22
        i32.add
        local.set 23
        local.get 23
        local.set 24
        local.get 7
        i32.load offset=140
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
        local.set 206
        local.get 7
        i32.load offset=364
        local.set 29
        local.get 7
        i32.load offset=140
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
        i64.load
        local.set 207
        local.get 7
        i32.load offset=360
        local.set 34
        local.get 34
        i64.load
        local.set 208
        local.get 207
        local.get 208
        i64.mul
        local.set 209
        local.get 206
        local.get 209
        i64.add
        local.set 210
        local.get 7
        i32.load offset=352
        local.set 35
        local.get 35
        i64.load
        local.set 211
        local.get 210
        local.get 211
        i64.mul
        local.set 212
        local.get 7
        local.get 212
        i64.store offset=128
        local.get 7
        local.get 205
        i64.store offset=120
        local.get 7
        local.get 21
        i32.store offset=116
        block  ;; label = @3
          loop  ;; label = @4
            i32.const 12
            local.set 36
            local.get 7
            i32.load offset=116
            local.set 37
            local.get 37
            local.set 38
            local.get 36
            local.set 39
            local.get 38
            local.get 39
            i32.lt_s
            local.set 40
            i32.const 1
            local.set 41
            local.get 40
            local.get 41
            i32.and
            local.set 42
            local.get 42
            i32.eqz
            br_if 1 (;@3;)
            local.get 7
            i32.load offset=364
            local.set 43
            local.get 7
            i32.load offset=140
            local.set 44
            i32.const 3
            local.set 45
            local.get 44
            local.get 45
            i32.shl
            local.set 46
            local.get 43
            local.get 46
            i32.add
            local.set 47
            local.get 47
            i64.load
            local.set 213
            local.get 7
            i32.load offset=360
            local.set 48
            local.get 7
            i32.load offset=116
            local.set 49
            local.get 49
            local.get 45
            i32.shl
            local.set 50
            local.get 48
            local.get 50
            i32.add
            local.set 51
            local.get 51
            i64.load
            local.set 214
            i64.const 0
            local.set 215
            i32.const 24
            local.set 52
            local.get 7
            local.get 52
            i32.add
            local.set 53
            local.get 53
            local.get 213
            local.get 215
            local.get 214
            local.get 215
            call 9
            i32.const 8
            local.set 54
            i32.const 24
            local.set 55
            local.get 7
            local.get 55
            i32.add
            local.set 56
            local.get 56
            local.get 54
            i32.add
            local.set 57
            local.get 57
            i64.load align=1
            local.set 216
            local.get 7
            i64.load offset=24 align=1
            local.set 217
            local.get 7
            local.get 216
            i64.store offset=104
            local.get 7
            local.get 217
            i64.store offset=96
            local.get 7
            i64.load offset=128
            local.set 218
            local.get 7
            i32.load offset=356
            local.set 58
            local.get 7
            i32.load offset=116
            local.set 59
            local.get 59
            local.get 45
            i32.shl
            local.set 60
            local.get 58
            local.get 60
            i32.add
            local.set 61
            local.get 61
            i64.load
            local.set 219
            i32.const 8
            local.set 62
            local.get 7
            local.get 62
            i32.add
            local.set 63
            local.get 63
            local.get 218
            local.get 215
            local.get 219
            local.get 215
            call 9
            i32.const 8
            local.set 64
            local.get 7
            local.get 64
            i32.add
            local.set 65
            local.get 65
            local.get 54
            i32.add
            local.set 66
            local.get 66
            i64.load align=1
            local.set 220
            local.get 7
            i64.load offset=8 align=1
            local.set 221
            local.get 7
            local.get 220
            i64.store offset=88
            local.get 7
            local.get 221
            i64.store offset=80
            local.get 7
            i64.load offset=104
            local.set 222
            local.get 7
            i64.load offset=96
            local.set 223
            local.get 7
            i64.load offset=120
            local.set 224
            local.get 223
            local.get 224
            i64.add
            local.set 225
            local.get 225
            local.get 223
            i64.lt_u
            local.set 67
            local.get 67
            i64.extend_i32_u
            local.set 226
            local.get 222
            local.get 226
            i64.add
            local.set 227
            local.get 7
            i32.load offset=140
            local.set 68
            local.get 7
            i32.load offset=116
            local.set 69
            local.get 68
            local.get 69
            i32.add
            local.set 70
            local.get 70
            local.get 45
            i32.shl
            local.set 71
            i32.const 144
            local.set 72
            local.get 7
            local.get 72
            i32.add
            local.set 73
            local.get 73
            local.get 71
            i32.add
            local.set 74
            local.get 74
            i64.load
            local.set 228
            local.get 225
            local.get 228
            i64.add
            local.set 229
            local.get 229
            local.get 225
            i64.lt_u
            local.set 75
            local.get 75
            i64.extend_i32_u
            local.set 230
            local.get 227
            local.get 230
            i64.add
            local.set 231
            local.get 7
            local.get 229
            i64.store offset=64
            local.get 7
            local.get 231
            i64.store offset=72
            local.get 7
            i64.load offset=80
            local.set 232
            local.get 7
            i64.load offset=88
            local.set 233
            local.get 7
            i64.load offset=64
            local.set 234
            local.get 7
            i64.load offset=72
            local.set 235
            local.get 233
            local.get 235
            i64.add
            local.set 236
            local.get 232
            local.get 234
            i64.add
            local.set 237
            local.get 237
            local.get 232
            i64.lt_u
            local.set 76
            local.get 76
            i64.extend_i32_u
            local.set 238
            local.get 236
            local.get 238
            i64.add
            local.set 239
            local.get 7
            local.get 237
            i64.store offset=48
            local.get 7
            local.get 239
            i64.store offset=56
            local.get 7
            i64.load offset=48
            local.set 240
            local.get 7
            i32.load offset=140
            local.set 77
            local.get 7
            i32.load offset=116
            local.set 78
            local.get 77
            local.get 78
            i32.add
            local.set 79
            local.get 79
            local.get 45
            i32.shl
            local.set 80
            i32.const 144
            local.set 81
            local.get 7
            local.get 81
            i32.add
            local.set 82
            local.get 82
            local.get 80
            i32.add
            local.set 83
            local.get 83
            local.get 240
            i64.store
            local.get 7
            i64.load offset=52 align=4
            local.set 241
            local.get 7
            local.get 241
            i64.store offset=120
            local.get 7
            i64.load offset=48
            local.set 242
            local.get 7
            i64.load offset=56
            local.set 243
            local.get 7
            i64.load offset=64
            local.set 244
            local.get 7
            i64.load offset=72
            local.set 245
            local.get 243
            local.get 245
            i64.eq
            local.set 84
            local.get 243
            local.get 245
            i64.lt_u
            local.set 85
            local.get 242
            local.get 244
            i64.lt_u
            local.set 86
            local.get 86
            local.get 85
            local.get 84
            select
            local.set 87
            i32.const 1
            local.set 88
            local.get 87
            local.get 88
            i32.and
            local.set 89
            block  ;; label = @5
              local.get 89
              i32.eqz
              br_if 0 (;@5;)
              i32.const 2
              local.set 90
              local.get 7
              local.get 90
              i32.store offset=44
              loop  ;; label = @6
                i32.const 0
                local.set 91
                i32.const 24
                local.set 92
                local.get 7
                i32.load offset=140
                local.set 93
                local.get 7
                i32.load offset=116
                local.set 94
                local.get 93
                local.get 94
                i32.add
                local.set 95
                local.get 7
                i32.load offset=44
                local.set 96
                local.get 95
                local.get 96
                i32.add
                local.set 97
                local.get 97
                local.set 98
                local.get 92
                local.set 99
                local.get 98
                local.get 99
                i32.lt_s
                local.set 100
                i32.const 1
                local.set 101
                local.get 100
                local.get 101
                i32.and
                local.set 102
                local.get 91
                local.set 103
                block  ;; label = @7
                  local.get 102
                  i32.eqz
                  br_if 0 (;@7;)
                  i64.const -1
                  local.set 246
                  i32.const 144
                  local.set 104
                  local.get 7
                  local.get 104
                  i32.add
                  local.set 105
                  local.get 105
                  local.set 106
                  local.get 7
                  i32.load offset=140
                  local.set 107
                  local.get 7
                  i32.load offset=116
                  local.set 108
                  local.get 107
                  local.get 108
                  i32.add
                  local.set 109
                  local.get 7
                  i32.load offset=44
                  local.set 110
                  local.get 109
                  local.get 110
                  i32.add
                  local.set 111
                  i32.const 3
                  local.set 112
                  local.get 111
                  local.get 112
                  i32.shl
                  local.set 113
                  local.get 106
                  local.get 113
                  i32.add
                  local.set 114
                  local.get 114
                  i64.load
                  local.set 247
                  local.get 247
                  local.set 248
                  local.get 246
                  local.set 249
                  local.get 248
                  local.get 249
                  i64.eq
                  local.set 115
                  local.get 115
                  local.set 103
                end
                local.get 103
                local.set 116
                i32.const 1
                local.set 117
                local.get 116
                local.get 117
                i32.and
                local.set 118
                block  ;; label = @7
                  local.get 118
                  i32.eqz
                  br_if 0 (;@7;)
                  i64.const 0
                  local.set 250
                  i32.const 144
                  local.set 119
                  local.get 7
                  local.get 119
                  i32.add
                  local.set 120
                  local.get 120
                  local.set 121
                  local.get 7
                  i32.load offset=140
                  local.set 122
                  local.get 7
                  i32.load offset=116
                  local.set 123
                  local.get 122
                  local.get 123
                  i32.add
                  local.set 124
                  local.get 7
                  i32.load offset=44
                  local.set 125
                  local.get 124
                  local.get 125
                  i32.add
                  local.set 126
                  i32.const 3
                  local.set 127
                  local.get 126
                  local.get 127
                  i32.shl
                  local.set 128
                  local.get 121
                  local.get 128
                  i32.add
                  local.set 129
                  local.get 129
                  local.get 250
                  i64.store
                  local.get 7
                  i32.load offset=44
                  local.set 130
                  i32.const 1
                  local.set 131
                  local.get 130
                  local.get 131
                  i32.add
                  local.set 132
                  local.get 7
                  local.get 132
                  i32.store offset=44
                  br 1 (;@6;)
                end
              end
              i32.const 24
              local.set 133
              local.get 7
              i32.load offset=140
              local.set 134
              local.get 7
              i32.load offset=116
              local.set 135
              local.get 134
              local.get 135
              i32.add
              local.set 136
              local.get 7
              i32.load offset=44
              local.set 137
              local.get 136
              local.get 137
              i32.add
              local.set 138
              local.get 138
              local.set 139
              local.get 133
              local.set 140
              local.get 139
              local.get 140
              i32.lt_s
              local.set 141
              i32.const 1
              local.set 142
              local.get 141
              local.get 142
              i32.and
              local.set 143
              block  ;; label = @6
                local.get 143
                i32.eqz
                br_if 0 (;@6;)
                i32.const 144
                local.set 144
                local.get 7
                local.get 144
                i32.add
                local.set 145
                local.get 145
                local.set 146
                local.get 7
                i32.load offset=140
                local.set 147
                local.get 7
                i32.load offset=116
                local.set 148
                local.get 147
                local.get 148
                i32.add
                local.set 149
                local.get 7
                i32.load offset=44
                local.set 150
                local.get 149
                local.get 150
                i32.add
                local.set 151
                i32.const 3
                local.set 152
                local.get 151
                local.get 152
                i32.shl
                local.set 153
                local.get 146
                local.get 153
                i32.add
                local.set 154
                local.get 154
                i64.load
                local.set 251
                i64.const 1
                local.set 252
                local.get 251
                local.get 252
                i64.add
                local.set 253
                local.get 154
                local.get 253
                i64.store
              end
            end
            local.get 7
            i32.load offset=116
            local.set 155
            i32.const 1
            local.set 156
            local.get 155
            local.get 156
            i32.add
            local.set 157
            local.get 7
            local.get 157
            i32.store offset=116
            br 0 (;@4;)
            unreachable
          end
          unreachable
        end
        i32.const 144
        local.set 158
        local.get 7
        local.get 158
        i32.add
        local.set 159
        local.get 159
        local.set 160
        local.get 7
        i64.load offset=120
        local.set 254
        local.get 7
        i32.load offset=140
        local.set 161
        i32.const 12
        local.set 162
        local.get 161
        local.get 162
        i32.add
        local.set 163
        i32.const 3
        local.set 164
        local.get 163
        local.get 164
        i32.shl
        local.set 165
        local.get 160
        local.get 165
        i32.add
        local.set 166
        local.get 166
        i64.load
        local.set 255
        local.get 255
        local.get 254
        i64.add
        local.set 256
        local.get 166
        local.get 256
        i64.store
        local.get 7
        i32.load offset=140
        local.set 167
        i32.const 1
        local.set 168
        local.get 167
        local.get 168
        i32.add
        local.set 169
        local.get 7
        local.get 169
        i32.store offset=140
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    i32.const 0
    local.set 170
    local.get 7
    local.get 170
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 12
        local.set 171
        local.get 7
        i32.load offset=40
        local.set 172
        local.get 172
        local.set 173
        local.get 171
        local.set 174
        local.get 173
        local.get 174
        i32.lt_s
        local.set 175
        i32.const 1
        local.set 176
        local.get 175
        local.get 176
        i32.and
        local.set 177
        local.get 177
        i32.eqz
        br_if 1 (;@1;)
        i32.const 144
        local.set 178
        local.get 7
        local.get 178
        i32.add
        local.set 179
        local.get 179
        local.set 180
        local.get 7
        i32.load offset=40
        local.set 181
        i32.const 12
        local.set 182
        local.get 181
        local.get 182
        i32.add
        local.set 183
        i32.const 3
        local.set 184
        local.get 183
        local.get 184
        i32.shl
        local.set 185
        local.get 180
        local.get 185
        i32.add
        local.set 186
        local.get 186
        i64.load
        local.set 257
        local.get 7
        i32.load offset=348
        local.set 187
        local.get 7
        i32.load offset=40
        local.set 188
        i32.const 3
        local.set 189
        local.get 188
        local.get 189
        i32.shl
        local.set 190
        local.get 187
        local.get 190
        i32.add
        local.set 191
        local.get 191
        local.get 257
        i64.store
        local.get 7
        i32.load offset=40
        local.set 192
        i32.const 1
        local.set 193
        local.get 192
        local.get 193
        i32.add
        local.set 194
        local.get 7
        local.get 194
        i32.store offset=40
        br 0 (;@2;)
        unreachable
      end
      unreachable
    end
    local.get 7
    i32.load offset=356
    local.set 195
    local.get 7
    i32.load offset=348
    local.set 196
    local.get 195
    local.get 196
    call 7
    local.set 197
    i32.const 1
    local.set 198
    local.get 197
    local.get 198
    i32.and
    local.set 199
    block  ;; label = @1
      local.get 199
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      i32.load offset=348
      local.set 200
      local.get 7
      i32.load offset=356
      local.set 201
      local.get 7
      i32.load offset=348
      local.set 202
      local.get 200
      local.get 201
      local.get 202
      call 8
    end
    i32.const 368
    local.set 203
    local.get 7
    local.get 203
    i32.add
    local.set 204
    local.get 204
    global.set 0
    return)
  (func (;7;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i64 i64 i64 i64 i64 i64)
    global.get 0
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    i32.const 11
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
          local.set 54
          local.get 4
          i32.load offset=4
          local.set 18
          local.get 4
          i32.load
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
          local.set 55
          local.get 54
          local.set 56
          local.get 55
          local.set 57
          local.get 56
          local.get 57
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
            i32.const 0
            local.set 26
            i32.const 1
            local.set 27
            local.get 26
            local.get 27
            i32.and
            local.set 28
            local.get 4
            local.get 28
            i32.store8 offset=15
            br 3 (;@1;)
          end
          local.get 4
          i32.load offset=8
          local.set 29
          local.get 4
          i32.load
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
          i64.load
          local.set 58
          local.get 4
          i32.load offset=4
          local.set 34
          local.get 4
          i32.load
          local.set 35
          i32.const 3
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
          i64.load
          local.set 59
          local.get 58
          local.set 60
          local.get 59
          local.set 61
          local.get 60
          local.get 61
          i64.lt_u
          local.set 39
          i32.const 1
          local.set 40
          local.get 39
          local.get 40
          i32.and
          local.set 41
          block  ;; label = @4
            local.get 41
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1
            local.set 42
            i32.const 1
            local.set 43
            local.get 42
            local.get 43
            i32.and
            local.set 44
            local.get 4
            local.get 44
            i32.store8 offset=15
            br 3 (;@1;)
          end
          local.get 4
          i32.load
          local.set 45
          i32.const -1
          local.set 46
          local.get 45
          local.get 46
          i32.add
          local.set 47
          local.get 4
          local.get 47
          i32.store
          br 0 (;@3;)
          unreachable
        end
        unreachable
      end
      i32.const 1
      local.set 48
      i32.const 1
      local.set 49
      local.get 48
      local.get 49
      i32.and
      local.set 50
      local.get 4
      local.get 50
      i32.store8 offset=15
    end
    local.get 4
    i32.load8_u offset=15
    local.set 51
    i32.const 1
    local.set 52
    local.get 51
    local.get 52
    i32.and
    local.set 53
    local.get 53
    return)
  (func (;8;) (type 3) (param i32 i32 i32)
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
        i32.const 12
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
  (func (;9;) (type 4) (param i32 i64 i64 i64 i64)
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
  (export "montmul768_32bitlimbs" (func 1))
  (export "montmul768_64bitlimbs" (func 5)))
