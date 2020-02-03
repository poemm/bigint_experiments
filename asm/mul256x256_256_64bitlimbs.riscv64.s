
	.globl	mul256x256_256

/*
nameing convention:
a0  r0
a1  r1
a2  r2
a3  r3
a4  r4
a5  r5
a6  r6
a7  r7
t0  r8
t1  r9
t2  r10
t3  r11
t4  r12
t5  r13
t6  r14
s0  r15

t0  r0
t1  r1
a3  r2
a2  r3
a1  r4
a0  r5
t2  r6
t3  r7
a4   r8
a5   r9
t4   r10
t5   r11
t6   r12
a6   r13
a7   r14
s0   r15
*/

	.text
mul256x256_256:	# computes mul256x256_256, where pointers: out in a0, a in a1, b in a2

	# calling convention - save callee-saved register
	# note: don't increment sp because we don't use it for anything anyway
	sd	s0, 0(sp)

	# custom stuff: create mask lower 32-bits, useful for extracting lower 32-bits
	#lui	t6, 0xfffff	# all 1's since sign extends
	#srli	t6, t6, 32	# now t6 is 0x00000000ffffffff

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
	mv	t3, zero


	# done initializing, now let's compute something


	# a0*b0 + carry

	# a0*b0
	mulhu	t5, a0, a4
	mul	t4, a0, a4
	mv	t2, t5
	mv	t1, t4

	# write result for this limb, prepare for next limb
	sd	t1, 0(t0)	# write result for this limb
	mv	t1, t2
	mv	t2, zero


	# a0*b1 + a1*b0 + carry

	# a0*b1
	mulhu	t5, a0, a5
	mul	t4, a0, a5
        add     t1, t1, t4      # add low limb to accumulator t1
        sltu    t4, t1, t4      # check overflow
        add     t5, t5, t4      # add to overflow, even if add zero
        add     t2, t2, t5      # add high limb to accumulator t2
        sltu    t5, t2, t5      # check overflow
        add     t3, t3, t5      # add to overflow, even if add zero
	
	# a1*b0
	mulhu	t5, a1, a4
	mul	t4, a1, a4
        add     t1, t1, t4      # add low limb to accumulator t1
        sltu    t4, t1, t4      # check overflow
        add     t5, t5, t4      # add to overflow, even if add zero
        add     t2, t2, t5      # add high limb to accumulator t2
        sltu    t5, t2, t5      # check overflow
        add     t3, t3, t5      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	sd	t1, 8(t0)	# write result for this 32-bit limb
	mv	t1, t2
	mv	t2, t3
	mv	t3, zero


	# a0*b2 + a1*b1 + a2*b0 + carry

	# a0*b2
	mulhu	t5, a0, a6
	mul	t4, a0, a6
        add     t1, t1, t4      # add low limb to accumulator t1
        sltu    t4, t1, t4      # check overflow
        add     t5, t5, t4      # add to overflow, even if add zero
        add     t2, t2, t5      # add high limb to accumulator t2
        sltu    t5, t2, t5      # check overflow
        add     t3, t3, t5      # add to overflow, even if add zero

	# a1*b1
	mulhu	t5, a1, a5
	mul	t4, a1, a5
        add     t1, t1, t4      # add low limb to accumulator t1
        sltu    t4, t1, t4      # check overflow
        add     t5, t5, t4      # add to overflow, even if add zero
        add     t2, t2, t5      # add high limb to accumulator t2
        sltu    t5, t2, t5      # check overflow
        add     t3, t3, t5      # add to overflow, even if add zero

	# a2*b0
	mulhu	t5, a2, a4
	mul	t4, a2, a4
        add     t1, t1, t4      # add low limb to accumulator t1
        sltu    t4, t1, t4      # check overflow
        add     t5, t5, t4      # add to overflow, even if add zero
        add     t2, t2, t5      # add high limb to accumulator t2
        sltu    t5, t2, t5      # check overflow
        add     t3, t3, t5      # add to overflow, even if add zero


	# write result for this limb, prepare for next limb
	sd	t1, 16(t0)	# write result for this 32-bit limb
	mv	t1, t2
	mv	t2, t3
	#mv	t3, zero	# not needed



	# a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

	# a0*b3
	mul	t4, a0, a7
	add	t1, t1, t4	# add to accumulator t1

	# a1*b2
	mul	t4, a1, a6
	add	t1, t1, t4	# add to accumulator t1

	# a2*b1
	mul	t4, a2, a5
	add	t1, t1, t4	# add to accumulator t1

	# a3*b0
	mul	t4, a3, a4
	add	t1, t1, t4	# add to accumulator t1

	# write result for this limb
	sd	t1, 24(t0)	# write result for this 32-bit limb


	# calling convention - recover callee-saved register
	ld	s0, 0(sp)

	ret
