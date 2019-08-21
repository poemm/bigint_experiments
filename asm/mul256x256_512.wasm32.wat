(module
  (memory 1)
  (export "test" (func $test))
  ;; a = 0xc4e5f99c5d347aebd8da07cd49b7bbc32141718b520ff51d1dace098a0586acd
  ;; b = 0xbe568cc4c386c3d7f8d6d314fab905847fc6f60e8a9f291b00a8b82625ae9d3
  ;; out_expected = 0x926540c902abb5b0721647054fc0dd12b9a4a3efa81793c7bd657144377b735e1fa7d24da2c74039555a3db0e97fd1c6cf90d14cf266552bbd7cacea8269bf7
  (data (;0;) (i32.const 64) "\cd\6a\58\a0\98\e0\ac\1d\1d\f5\0f\52\8b\71\41\21\c3\bb\b7\49\cd\07\da\d8\eb\7a\34\5d\9c\f9\e5\c4")
  (data (;0;) (i32.const 96) "\d3\e9\5a\62\82\8b\0a\b0\91\f2\a9\e8\60\6f\fc\47\58\90\ab\4f\31\6d\8d\7f\3d\6c\38\4c\cc\68\e5\0b")

  (func $test (result i64)
    (local i64)   ;; this local is returned to show which limb failed
    i64.const 0
    i64.const 64
    i64.const 96
    call $mul256x256_512
    ;; compare output to expected
    block
      ;; test limb 0
      (i32.ne (i32.load (i32.const 0)) (i32.const 2821102583))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 1
      (i32.ne (i32.load (i32.const 4)) (i32.const 3151481550))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 2
      (i32.ne (i32.load (i32.const 8)) (i32.const 3475400018))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 3
      (i32.ne (i32.load (i32.const 12)) (i32.const 1828261140))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 4
      (i32.ne (i32.load (i32.const 16)) (i32.const 244841756))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 5
      (i32.ne (i32.load (i32.const 20)) (i32.const 2505417691))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 6
      (i32.ne (i32.load (i32.const 24)) (i32.const 3660346371))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 7
      (i32.ne (i32.load (i32.const 28)) (i32.const 3791289636))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 8
      (i32.ne (i32.load (i32.const 32)) (i32.const 1131919157))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 9
      (i32.ne (i32.load (i32.const 36)) (i32.const 2077644564))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 10
      (i32.ne (i32.load (i32.const 40)) (i32.const 4202789180))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 11
      (i32.ne (i32.load (i32.const 44)) (i32.const 731531838))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 12
      (i32.ne (i32.load (i32.const 48)) (i32.const 1425804753))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 13
      (i32.ne (i32.load (i32.const 52)) (i32.const 119628912))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 14
      (i32.ne (i32.load (i32.const 56)) (i32.const 2418719579))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 15
      (i32.ne (i32.load (i32.const 60)) (i32.const 153506828))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
    end
    local.get 0  ;;return index where failed, or num_limbs if it passed
    ;;(i64.load (i32.const 0))
    ;;(i64.and (i64.load (i32.const 8)) (i64.const 0xffffffff))   ;; lower 32-bits
    )

  (func $mul256x256_512 (param i64 i64 i64)
    (local i64 i64 i64 i64 i64 i64 i64 i64 i64 i64 i64)


  ;; bring a,b into locals 6-13
  (i64.load (i32.wrap/i64 (i64.add (local.get 1) (i64.const 0)))) (local.set 6)
  (i64.load (i32.wrap/i64 (i64.add (local.get 1) (i64.const 8)))) (local.set 7)
  (i64.load (i32.wrap/i64 (i64.add (local.get 1) (i64.const 16)))) (local.set 8)
  (i64.load (i32.wrap/i64 (i64.add (local.get 1) (i64.const 24)))) (local.set 9)
  (i64.load (i32.wrap/i64 (i64.add (local.get 2) (i64.const 0)))) (local.set 10)
  (i64.load (i32.wrap/i64 (i64.add (local.get 2) (i64.const 8)))) (local.set 11)
  (i64.load (i32.wrap/i64 (i64.add (local.get 2) (i64.const 16)))) (local.set 12)
  (i64.load (i32.wrap/i64 (i64.add (local.get 2) (i64.const 24)))) (local.set 13)


  ;; zero things
  (local.set 1 (i64.const 0))
  (local.set 2 (i64.const 0))


  ;; done initializing, now let's compute something


  ;; a0*b0 + carry

  ;; a0*b0

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 0))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b1 + a1*b0 + carry

  ;; a0*b1

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b0

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 4))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b2 + a1*b1 + a2*b0 + carry

  ;; a0*b2

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b1

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b0

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 8))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

  ;; a0*b3

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b2

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b1

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b0

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 12))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b4 + a1*b3 + a2*b2 + a3*b1 + a4*b0 + carry

  ;; a0*b4

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b3

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b2

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b1

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b0

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 16))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b5 + a1*b4 + a2*b3 + a3*b2 + a4*b1 + a5*b0 + carry

  ;; a0*b5

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b4

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b3

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b2

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b1

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b0

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 20))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b6 + a1*b5 + a2*b4 + a3*b3 + a4*b2 + a5*b1 + a6*b0 + carry

  ;; a0*b6

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b5

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b4

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b3

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b2

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b1

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b0

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 24))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a0*b7 + a1*b6 + a2*b5 + a3*b4 + a4*b3 + a5*b2 + a6*b1 + a7*b0 + carry

  ;; a0*b7

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a1*b6

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b5

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b4

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b3

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b2

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b1

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b0

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 28))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a1*b7 + a2*b6 + a3*b5 + a4*b4 + a5*b3 + a6*b2 + a7*b1 + carry

  ;; a1*b7

  (local.set 5 (local.get 6))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a2*b6

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b5

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b4

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b3

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b2

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b1

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 10))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 32))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a2*b7 + a3*b6 + a4*b5 + a5*b4 + a6*b3 + a7*b2 + carry

  ;; a2*b7

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a3*b6

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b5

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b4

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b3

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b2

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 36))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a3*b7 + a4*b6 + a5*b5 + a6*b4 + a7*b3 + carry

  ;; a3*b7

  (local.set 5 (local.get 7))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a4*b6

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b5

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b4

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b3

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 11))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 40))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a4*b7 + a5*b6 + a6*b5 + a7*b4 + carry

  ;; a4*b7

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a5*b6

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b5

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b4

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 44))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a5*b7 + a6*b6 + a7*b5 + carry

  ;; a5*b7

  (local.set 5 (local.get 8))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a6*b6

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b5

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 12))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 48))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a6*b7 + a7*b6 + carry

  ;; a6*b7

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i32.wrap/i64 (local.get 5)) (i64.extend_i32_u) (local.set 5)	;; get lower 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero


  ;; a7*b6

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i32.wrap/i64 (local.get 4)) (i64.extend_i32_u) (local.set 4)	;; get lower 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 52))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero


  ;; a7*b7 + carry

  ;; a7*b7

  (local.set 5 (local.get 9))					;; bring a to workspace
  (i64.shr_u (local.get 5) (i64.const 32)) (local.set 5)	;; get upper 32-bits
  (local.set 4 (local.get 13))					;; bring b to workspace
  (i64.shr_u (local.get 4) (i64.const 32)) (local.set 4)	;; get upper 32-bits
  (i64.mul (local.get 4) (local.get 5)) (local.set 4)		;; multiply
  (local.set 3 (local.get 4))					;; remove dependancy from local 4
  (i64.add (local.get 3) (local.get 1)) (local.set 1)		;; add to accumulator t1
  (i64.gt_u (local.get 3) (local.get 1)) (local.set 3 (i64.extend_i32_u))	;; compare l1 and t3
  (i64.add (local.get 2) (local.get 3)) (local.set 2)		;; add to overflow, even if add zero

  ;; write result for this limb, prepare for next limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 56))) (i32.wrap/i64 (local.get 1)) )	;; write result for this 32-bit limb
  (i64.shr_u (local.get 1) (i64.const 32)) (local.set 1)	;; the upper 32-bits is carry
  (i64.shl (local.get 2) (i64.const 32)) (local.set 2)		;; overflow is in upper 32-bits
  (i64.add (local.get 1) (local.get 2)) (local.set 1)		;; add overflow of carry
  (local.set 2 (i64.const 0))					;; re-init overflow to zero
  ;; write overflow to last limb
  (i32.store (i32.wrap/i64 (i64.add (local.get 0) (i64.const 60))) (i32.wrap/i64 (local.get 1)) ) 	;; write result for this 32-bit limb
  )
)
