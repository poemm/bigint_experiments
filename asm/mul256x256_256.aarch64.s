
	.arch armv8-a
	.globl	mul256x256_256

	.text
mul256x256_256:	// computes mul256x256_256, where pointers: out in x0, a in x1, b in x2

	// following C calling conventions, save registers
# first bring in x1 and x2 to registers x6-x12, this frees x1 and x2
	ldr	x6, [x1]
	ldr	x7, [x1,8]
	ldr	x8, [x1,16]
	ldr	x9, [x1,24]
	ldr	x10, [x2]
	ldr	x11, [x2,8]
	ldr	x12, [x2,16]
	ldr	x13, [x2,24]


	// zero things
	mov	x1, 0
	mov	x2, 0


	// done initializing, now let's compute something


	# a0*b0 + carry

	// a0*b0
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,0]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b1 + a1*b0 + carry

	// a0*b1
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b0
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,4]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b2 + a1*b1 + a2*b0 + carry

	// a0*b2
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b1
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b0
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,8]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

	// a0*b3
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b2
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b1
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a3*b0
	mov	x4, x7		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,12]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b4 + a1*b3 + a2*b2 + a3*b1 + a4*b0 + carry

	// a0*b4
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x12		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b3
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x11		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b2
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a3*b1
	mov	x4, x7		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a4*b0
	mov	x4, x8		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,16]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b5 + a1*b4 + a2*b3 + a3*b2 + a4*b1 + a5*b0 + carry

	// a0*b5
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x12		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b4
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x12		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b3
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a3*b2
	mov	x4, x7		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a4*b1
	mov	x4, x8		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a5*b0
	mov	x4, x8		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,20]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b6 + a1*b5 + a2*b4 + a3*b3 + a4*b2 + a5*b1 + a6*b0 + carry

	// a0*b6
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x13		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b5
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x12		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b4
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x12		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a3*b3
	mov	x4, x7		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x11		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a4*b2
	mov	x4, x8		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a5*b1
	mov	x4, x8		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a6*b0
	mov	x4, x9		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,24]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	# a0*b7 + a1*b6 + a2*b5 + a3*b4 + a4*b3 + a5*b2 + a6*b1 + a7*b0 + carry

	// a0*b7
	mov	x4, x6		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x13		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a1*b6
	mov	x4, x6		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x13		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a2*b5
	mov	x4, x7		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x12		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a3*b4
	mov	x4, x7		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x12		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a4*b3
	mov	x4, x8		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x11		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a5*b2
	mov	x4, x8		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x11		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a6*b1
	mov	x4, x9		// bring a to workspace
	mov	w4, w4		// get lower 32-bits
	mov	x5, x10		// bring b to workspace
	lsr	x5, x5, 32	// get upper 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// a7*b0
	mov	x4, x9		// bring a to workspace
	lsr	x4, x4, 32	// get upper 32-bits
	mov	x5, x10		// bring b to workspace
	mov	w5, w5		// get lower 32-bits
	mul	x4, x4, x5	// multiply
	mov	x3, x4		// remove dependancy from x4
	add	x1, x1, x3	// add to accumulator x1
	cmp	x3, x1		// compare x1 and x3
	cset	x3, hi		// set register x1 to 1 or 0 based on cmp
	add	x2, x2, x3	// add to overflow, even if add zero

	// write result for this limb, prepare for next limb
	str	w1, [x0,28]	// write result for this 32-bit limb
	lsr	x1, x1, 32	// the upper 32-bits is carry
	lsl	x2, x2, 32	// overflow is in upper 32-bits
	add	x1, x1, x2	// add overflow of carry
	mov	x2, 0		// re-init overflow to zero


	ret
