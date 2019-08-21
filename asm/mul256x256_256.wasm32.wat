(module
  (memory 1)
  (export "test" (func $test))
  ;; a = 0xaf6ed231c2b3174026b9fd3c903cde23dca5f06a04da8d06355a814a872d1782
  ;; b = 0x8ab8a663f6ba95916fbee2af731a6cc455ed5388343c8d226bc7232f315c2561
  ;; out_expected = 0x5ddcdd124d5f7664eedd3c724d9502470144bbfdd2c467a49e2f0f591133b242
  (data (;0;) (i32.const 64) "\82\17\2d\87\4a\81\5a\35\06\8d\da\04\6a\f0\a5\dc\23\de\3c\90\3c\fd\b9\26\40\17\b3\c2\31\d2\6e\af")
  (data (;0;) (i32.const 96) "\61\25\5c\31\2f\23\c7\6b\22\8d\3c\34\88\53\ed\55\c4\6c\1a\73\af\e2\be\6f\91\95\ba\f6\63\a6\b8\8a")

  (func $test (result i64)
    (local i64)   ;; this local is returned to show which limb failed
    i64.const 0
    i64.const 64
    i64.const 96
    call $mul256x256_256
    ;; compare output to expected
    block
      ;; test limb 0
      (i32.ne (i32.load (i32.const 0)) (i32.const 288600642))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 1
      (i32.ne (i32.load (i32.const 4)) (i32.const 2653884249))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 2
      (i32.ne (i32.load (i32.const 8)) (i32.const 3536086948))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 3
      (i32.ne (i32.load (i32.const 12)) (i32.const 21281789))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 4
      (i32.ne (i32.load (i32.const 16)) (i32.const 1301611079))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 5
      (i32.ne (i32.load (i32.const 20)) (i32.const 4007476338))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 6
      (i32.ne (i32.load (i32.const 24)) (i32.const 1298101860))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
      ;; test limb 7
      (i32.ne (i32.load (i32.const 28)) (i32.const 1574755602))
      br_if 0
      (local.set 0 (i64.add (i64.const 1)(local.get 0)))   ;;increment
    end
    local.get 0  ;;return index where failed, or num_limbs if it passed
    ;;(i64.load (i32.const 0))
    ;;(i64.and (i64.load (i32.const 8)) (i64.const 0xffffffff))   ;; lower 32-bits
    )

  (func $mul256x256_256 (param i64 i64 i64)
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
  )
)
