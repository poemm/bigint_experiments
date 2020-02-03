
	.globl	mul256x256_256

	.text
mul256x256_256:	# computes mul256x256_256, where pointers: out in a0, a in a1, b in a2

	# custom stuff: create mask lower 32-bits, useful for extracting lower 32-bits
	lui	t6, 0xfffff	# all 1's since sign extends
	srli	t6, t6, 32	# now t6 is 0x00000000ffffffff

	# bring a,b into registers a0-7
	# first free a0, a1, and a2
	mv	t0, a0
	mv	t1, a1
	mv	t2, a2
	ld	a0, 0(t1)
	ld	a1, 8(t1)
	ld	a2, 16(t1)
	ld	a3, 24(t1)
	ld	a4, 0(t2)
	ld	a5, 8(t2)
	ld	a6, 16(t2)
	ld	a7, 24(t2)


	# zero things
	mv	t1, zero
	mv	t2, zero


	# done initializing, now let's compute something


	# a0*b0 + carry

	# a0*b0
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 0(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b1 + a1*b0 + carry

	# a0*b1
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b0
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 4(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b2 + a1*b1 + a2*b0 + carry

	# a0*b2
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b1
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b0
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 8(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

	# a0*b3
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b2
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b1
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a3*b0
	mv	t5, a1		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 12(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b4 + a1*b3 + a2*b2 + a3*b1 + a4*b0 + carry

	# a0*b4
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a6		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b3
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a5		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b2
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a3*b1
	mv	t5, a1		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a4*b0
	mv	t5, a2		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 16(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b5 + a1*b4 + a2*b3 + a3*b2 + a4*b1 + a5*b0 + carry

	# a0*b5
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a6		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b4
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a6		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b3
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a3*b2
	mv	t5, a1		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a4*b1
	mv	t5, a2		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a5*b0
	mv	t5, a2		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 20(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b6 + a1*b5 + a2*b4 + a3*b3 + a4*b2 + a5*b1 + a6*b0 + carry

	# a0*b6
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a7		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b5
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a6		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b4
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a6		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a3*b3
	mv	t5, a1		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a5		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a4*b2
	mv	t5, a2		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a5*b1
	mv	t5, a2		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a6*b0
	mv	t5, a3		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 24(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	# a0*b7 + a1*b6 + a2*b5 + a3*b4 + a4*b3 + a5*b2 + a6*b1 + a7*b0 + carry

	# a0*b7
	mv	t5, a0		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a7		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a1*b6
	mv	t5, a0		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a7		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a2*b5
	mv	t5, a1		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a6		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a3*b4
	mv	t5, a1		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a6		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a4*b3
	mv	t5, a2		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a5		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a5*b2
	mv	t5, a2		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a5		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a6*b1
	mv	t5, a3		# bring a to workspace
	and	t5, t5, t6	# get lower 32-bits
	mv	t4, a4		# bring b to workspace
	srli	t4, t4, 32	# get upper 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# a7*b0
	mv	t5, a3		# bring a to workspace
	srli	t5, t5, 32	# get upper 32-bits
	mv	t4, a4		# bring b to workspace
	and	t4, t4, t6	# get lower 32-bits
	mul	t4, t4, t5	# multiply
	mv	t3, t4		# remove dependancy from t4
	add	t1, t1, t3	# add to accumulator t1
	sltu	t3, t1, t3	# compare l1 and t3
	add	t2, t2, t3	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sw	t1, 28(t0)	# write result for this 32-bit limb
	srli	t1, t1, 32	# the upper 32-bits is carry
	slli	t2, t2, 32	# overflow is in upper 32-bits
	add	t1, t1, t2	# add overflow of carry
	mv	t2, zero	# re-init overflow to zero


	ret
