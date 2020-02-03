
	.globl	mul256x256_256


# note: xchg swaps two registers

/*
nameing convention:
     riscv64   x86_64	aarch
r0	a0	rdi	x0
r1	a1	rsi	x1
r2	a2	rdx	x2
r3	a3	rcx	x3
r4	a4	r8	x4
r5	a5	r9	x5
r6	a6	rax	x6
r7	a7	rbx	x7
r8	t0	rbp	x8
r9	t1	rsp	x9
r10	t2	r10	x10
r11	t3	r11	x11
r12	t4	r12	x12
r13	t5	r13	x13
r14	t6	r14	x14
r15	s0	r15	x15
*/



	.text
mul256x256_256:	# computes mul256x256->256, where pointers: out in rdi, a in rsi, b in rdx


	# following C calling conventions, save registers
	push	%rbx
	push	%rbp
	push	%r12
	push	%r13
	push	%r14
	push	%r15

	# save the stack pointer
	# note: stack pointer may be needed to handle interrupts on some systems
	#mov	%rsp, stack_pointer_saved_in_data_section

	# zero registers which are not args
/*
	xor	%eax, %eax
	xor	%ebx, %ebx
*/
	xor	%ecx, %ecx	# zero registers, use 32-bit version since it is recommended
/*
	xor	%ebp, %ebp
	xor	%esp, %esp
	xor	%r8d, %r8d
	xor	%r9d, %r9d
	xor	%r10d, %r10d
	xor	%r11d, %r11d
	xor	%r12d, %r12d
	xor	%r13d, %r13d
	xor	%r14d, %r14d
	xor	%r15d, %r15d
//*/

	# end of setup, now can start arbitrary user code

	# fill registers with a and b to free registers rsi and rdx for us to use
	mov	(%rsi), %r8	# move a to registers r8, r9, r10, r11
	mov	8(%rsi), %r9
	mov	16(%rsi), %r10
	mov	24(%rsi), %r11
	mov	(%rdx), %r12	# move b to registers r12, r13, r14, r15
	mov	8(%rdx), %r13
	mov	16(%rdx), %r14
	mov	24(%rdx), %r15

	# set arg rsi to zero
	xor	%esi, %esi	# zero rsi, use 32-bit version since it is recommended


	# done initializing, now let's compute something

	# note: will use rcx=low_limb, rdx=high_limb, rsi=carry

	# a0*b0 + carry

	# a0*b0
	mov	%r8, %rax
	mul	%r12


	# write result for this limb, prepare for next limb
	mov	%rax, 0(%rdi)	# write result for this 64-bit limb
	mov	%rdx, %rbx


	# a0*b1 + a1*b0 + carry

	# a0*b1
	mov	%r8, %rax
	mul	%r13
	clc
	add	%rax, %rbx
	adc	%rdx, %rcx
	adc	$0, %rsi


	# a1*b0
	mov	%r9, %rax
	mul	%r12
	clc
	add	%rax, %rbx
	adc	%rdx, %rcx
	adc	$0, %rsi


	# write result for this limb, prepare for next limb
	mov	%rbx, 8(%rdi)	# write result for this 64-bit limb
	mov	%rcx, %rbx
	mov	%rsi, %rcx
	xor	%esi, %esi	# zero rsi, use 32-bit version since it is recommended


	# a0*b2 + a1*b1 + a2*b0 + carry

	# a0*b2
	mov	%r8, %rax
	mul	%r14
	clc
	add	%rax, %rbx
	adc	%rdx, %rcx
	adc	$0, %rsi

	# a1*b1
	mov	%r9, %rax
	mul	%r13
	clc
	add	%rax, %rbx
	adc	%rdx, %rcx
	adc	$0, %rsi

	# a2*b0
	mov	%r10, %rax
	mul	%r12
	clc
	add	%rax, %rbx
	adc	%rdx, %rcx
	adc	$0, %rsi

	# write result for this limb, prepare for next limb
	mov	%rbx, 16(%rdi)	# write result for this 64-bit limb
	mov	%rcx, %rbx
	mov	%rsi, %rcx
	xor	%esi, %esi	# zero rsi, use 32-bit version since it is recommended


        # a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

        # a0*b3
        movq    %r8, %rax
        imul    %r15,%rax
        addq    %rax, %rbx

        # a1*b2
        movq    %r9, %rax
        imul    %r14,%rax
        addq    %rax, %rbx

        # a2*b1
        movq    %r10, %rax
        imul    %r13,%rax
        addq    %rax, %rbx

        # a3*b0
        movq    %r11, %rax
        imul    %r12,%rax
        addq    %rax, %rbx

        # write result for this limb, prepare for next limb
        movq    %rbx, 24(%rdi)  # write result for this 64-bit limb


	# done computing stuff

	# recover the stack pointer
	#mov	stack_pointer_saved_in_data_section, %rsp 

	# as callee, return saved registers to original
	pop	%r15
	pop	%r14
	pop	%r13
	pop	%r12
	pop	%rbp
	pop	%rbx
	# finally, return
	ret

.data
stack_pointer_saved_in_data_section:	.quad	0
