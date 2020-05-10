
	.globl	mulmodmontCIOSasm384

# This is part of the repository: https://github.com/poemm/assembles

# Notes:
# This is a handwritten x86_64 assembly implementation of mulmodmont384
# It is over-abstracted.
#  - There could be fewer macros. But the goal is to reuse these macros elsewhere.
#  - All registers are parameterized to make it easier to translate to other architecture's assembly.
# Returns x*y*R (modulo mod), where R=2**384, the standard montgomery multiplication.
# Function signature is: void mulmodmont384(uint64_t outptr[6], uint64_t x[6], uint64_t y[6], uint64_t mod[6], uint64_t inv)
# The algorithm is Coarsely Integrated Operand Scanning (CIOS), as described based on in Çetin K. Koç; Tolga Acar; Burton S. Kaliski, Jr. (June 1996). "Analyzing and Comparing Montgomery Multiplication Algorithms". IEEE Micro. 16 (3): 26–33.



.macro second_inner_loop j Aj_1 Aj carry hi lo A0inv mptr
	mov	\j*8(\mptr), \lo	# get y[j] in register for multiply 64x64->128
	mul	\A0inv			# hi,lo = m[j]*A0inv
	add	\Aj, \lo		# add A[j] to low limb, overflow flag may be flipped
	adc	$0, \hi			# add overflow flag to high limb of x[i]*y[j]
	add	\carry, \lo		# add carry to low limb of x[i]*y[j]+A[j]
	adc	$0, \hi			# add overflow flag to high limb
	mov	\hi, \carry		# save high limb to carry limb for next iter
	mov	\lo, \Aj_1		# save low limb to A[j-1]
.endm

.macro first_inner_loop j Aj carry hi lo xi yptr
	mov	\j*8(\yptr), \lo	# get y[j] in register for multiply 64x64->128
	mul	\xi			# hi,lo = y[j]*x[i]
	add	\Aj, \lo		# add A[j] to low limb, overflow flag may be flipped
	adc	$0, \hi			# add overflow flag to high limb of x[i]*y[j]
	add	\carry, \lo		# add carry to low limb of x[i]*y[j]+A[j]
	adc	$0, \hi			# add overflow flag to high limb
	mov	\hi, \carry		# save high limb to carry limb for next iter
	mov	\lo, \Aj		# save low limb to A[j]
.endm

.macro main_loop  i  carry hi   lo    in_ptrs  tmp_ptr  tmp_val    A0 A1 A2  A3  A4  A5  A6  A7
	# prepare for first inner loop:
	xor	\carry, \carry				# zero carry limb
	mov	0(\in_ptrs), \tmp_ptr			# get xptr

	# unrolled loops
	mov	8*\i(\tmp_ptr), \tmp_val			# get x[i]
	mov	8(\in_ptrs), \tmp_ptr			# get yptr

	# first inner loop iterations for j=0,...,5
	# arguments are  j  Aj  carry  hi  lo  xi        yptr
	first_inner_loop 0 \A0 \carry \hi \lo \tmp_val \tmp_ptr
	first_inner_loop 1 \A1 \carry \hi \lo \tmp_val \tmp_ptr
	first_inner_loop 2 \A2 \carry \hi \lo \tmp_val \tmp_ptr
	first_inner_loop 3 \A3 \carry \hi \lo \tmp_val \tmp_ptr
	first_inner_loop 4 \A4 \carry \hi \lo \tmp_val \tmp_ptr
	first_inner_loop 5 \A5 \carry \hi \lo \tmp_val \tmp_ptr

	# finish carrying from first inner loop
	xor	\A7, \A7		# zero A[7], will take overflow in the following addition bit
	add	\carry, \A6		# A[6] += carry limb
	adc	$0, \A7			# A[7] = overflow flag

	# prepare for second inner loop
	mov	24(\in_ptrs), \tmp_val		# get inv
	imul	\A0, \tmp_val			# A0inv = A[0]*inv, overflow can be ignored
	mov	16(\in_ptrs), \tmp_ptr		# get mptr

	# first iter of second inner loop can avoid carry
	mov	0(\tmp_ptr), \lo		# get m[0]
	mul	\tmp_val			# hi,lo = A0inv*m[0], I think lo is zero no matter what
	add	\A0, \lo			# lo += A0
	adc	$0, \hi				# hi += overflow form previous addition
	mov	\hi, \carry			# carry limb = overflow of A0inv*m[0]

	# rest of iters
	# arguments are   j  A[j-1] A[j]   carry  hi  lo   A0inv    mptr
	second_inner_loop 1  \A0    \A1   \carry \hi \lo  \tmp_val \tmp_ptr
	second_inner_loop 2  \A1    \A2   \carry \hi \lo  \tmp_val \tmp_ptr
	second_inner_loop 3  \A2    \A3   \carry \hi \lo  \tmp_val \tmp_ptr
	second_inner_loop 4  \A3    \A4   \carry \hi \lo  \tmp_val \tmp_ptr
	second_inner_loop 5  \A4    \A5   \carry \hi \lo  \tmp_val \tmp_ptr

	# finish carrying from second inner loop
	add	\A6, \carry		# prepare for A[5] = A[6]+carry
	adc	$0, \A7			# add overflow bit to A[7]
	mov	\carry, \A5		# finish A[5] = A[6]+carry
	mov	\A7, \A6		# A[6] = A[7]
.endm

.macro mulmodmont384_core a0 a1 a2 a3 a4 a5 r0 r1 r2 r3 r4 r5 r6 r7
	# free argument registers by dumping these to output array
	mov	\a1, 0(\a0)	# xptr
	mov	\a2, 8(\a0)	# yptr
	mov	\a3, 16(\a0)	# mptr
	mov	\a4, 24(\a0)	# inv

	# init array A to zero
	xor	\a5, \a5	# A[0] = 0
	xor	\r1, \r1	# A[1] = 0
	xor	\r2, \r2	# A[2] = 0
	xor	\r3, \r3	# A[3] = 0
	xor	\r4, \r4	# A[4] = 0
	xor	\r5, \r5	# A[5] = 0
	xor	\r6, \r6	# A[6] = 0
	xor	\r7, \r7	# A[7] = 0

	# five main loop iterations
	# params:  i  carry hi   lo    in_ptrs  tmp_ptr  tmp_val    A0  A1  A2  A3  A4  A5  A6  A7
	main_loop  0  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
	main_loop  1  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
	main_loop  2  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
	main_loop  3  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
	main_loop  4  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
	main_loop  5  \a3   \a2  \r0   \a0      \a1      \a4        \a5 \r1 \r2 \r3 \r4 \r5 \r6 \r7
.endm

.macro subtract384_if_leq mptr x0 x1 x2 x3 x4 x5 x6 y0 y1 y2 y3 y4 y5
	# check if x<=y, if so subtract x=y-x, otherwise don't subtract
	# inputs:
	#   mptr = pointer to modulus uint64_t m[6]
	#   x0,x1,x2,x3,x4,x5,r6 = registers containing x, including overflow limb r6
	#   y0,y1,y2,y3,y4,y5 = registers to bring values at mptr

	# move mod into registers y0,y1,...,y5
	mov	0(\mptr), \y0	# y0 = mod[0]
	mov	8(\mptr), \y1	# y1 = mod[1]
	mov	16(\mptr), \y2 	# y2 = mod[2]
	mov	24(\mptr), \y3 	# y3 = mod[3]
	mov	32(\mptr), \y4 	# y4 = mod[4]
	mov	40(\mptr), \y5 	# y5 = mod[5]

	# special case: overflow limb nonzero, then must subtract
	cmp	$0, \x6		# check if overflow limb nonzero
	jb	subtraction

	# compare limbs whether x[i]<y[i] or x[i]>y[i] for i=0,1,...,5.
	# If x[i]==y[i], then check next limb. If x==y, fall through to subtraction
	cmp	\x5, \y5		# compare x5 and y5
	ja	skip_subtraction	# x5>y5, so skip subtraction
	jb	subtraction		# from cmp above, x5<x5, so need subtraction
	# note: niether x5<y5 nor x5>y5, so x5==y5, so check lower limbs
	cmp	\x4, \y4		# compare x4 and y4
	ja	skip_subtraction	# 
	jb	subtraction		# 
	cmp	\x3, \y3		# compare x3 and y3
	ja	subtraction		# 
	jb	skip_subtraction	# 
	cmp	\x2, \y2		# compare x2 and y2
	ja	subtraction		# 
	jb	skip_subtraction	# 
	cmp	\x1, \y1		# compare x1 and y1
	ja	subtraction		# 
	jb	skip_subtraction	# 
	cmp	\x0, \y0		# compare x0 and y0
	ja	subtraction		# 
	jb	skip_subtraction	# 
	# reaching here means x==y, so fall through to subtraction

subtraction:
	# x = x-y
	sub	\y0, \x0
	sbb	\y1, \x1
	sbb	\y2, \x2
	sbb	\y3, \x3
	sbb	\y4, \x4
	sbb	\y5, \x5
skip_subtraction: # do nothing
.endm


.macro mulmodmont384_full a0 a1 a2 a3 a4 a5 r0 r1 r2 r3 r4 r5 r6 r7
	# input args
	#   a0 = outptr
	#   a1 = xptr
	#   a2 = yptr
	#   a3 = mptr
	#   a4 = inv

	# core part
	mulmodmont384_core \a0 \a1 \a2 \a3 \a4 \a5 \r0 \r1 \r2 \r3 \r4 \r5 \r6 \r7

	# get modulus pointer in preparation final subtraction
	mov	16(\a0), \r0		# r0 = mptr
	# final subtraction
	# parameters are    mptr   registers with out             registers to store mod
	subtract384_if_leq  \r0    \a5 \r1 \r2 \r3 \r4 \r5 \r6    \a1 \a2 \a3 \a4 \r6 \r7

	# write result to out
	movq	\a5, 0(\a0)	# write result for this 64-bit limb
	movq	\r1, 8(\a0)	# write result for this 64-bit limb
	movq	\r2, 16(\a0)	# write result for this 64-bit limb
	movq	\r3, 24(\a0)	# write result for this 64-bit limb
	movq	\r4, 32(\a0)	# write result for this 64-bit limb
	movq	\r5, 40(\a0)	# write result for this 64-bit limb
.endm


.text
mulmodmontCIOSasm384:

	# following C calling conventions, save registers
	push	%rbx
	push	%rbp
	push	%r12
	push	%r13
	push	%r14
	push	%r15

	# Don't need to save stack ptr since we don't use it
	# note: uncomment if stack pointer is needed to handle interrupts
	#movq	%rsp, stack_pointer_saved_in_data_section

	# input args:
	#   rdi = outptr
	#   rsi = xptr
	#   rdx = yptr
	#   rcx = mptr
	#   r8 = inv
	# parameters are         a0   a1   a2   a3   a4  a5  r0   r1   r2   r3   r4   r5   r6   r7
	mulmodmont384_full	%rdi %rsi %rdx %rcx %r8 %r9 %rax %rbx %r10 %r11 %r12 %r13 %r14 %r15

	# Don't need to recover the stack pointer
	#movq	stack_pointer_saved_in_data_section, %rsp 

	# as callee, return saved registers to original
	pop	%r15
	pop	%r14
	pop	%r13
	pop	%r12
	pop	%rbp
	pop	%rbx
	# finally, return
	ret

