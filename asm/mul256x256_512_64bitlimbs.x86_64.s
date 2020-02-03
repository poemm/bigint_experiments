
	.globl	mul256x256_512


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
mul256x256_512:	# computes mul256x256_512, where pointers: out in rdi, a in rsi, b in rdx


	# following C calling conventions, save registers
	push	%rbx
	push	%rbp
	push	%r12
	push	%r13
	push	%r14
	push	%r15

	# save the stack pointer
	# note: stack pointer may be needed to handle interrupts on some systems
	#movq	%rsp, stack_pointer_saved_in_data_section

	# zero registers which are not args
/*
	xorq	%rax, %rax
	xorq	%rbx, %rbx
*/
	xorq	%rcx, %rcx
/*
	xorq	%rbp, %rbp
	xorq	%rsp, %rsp
	xorq	%r8, %r8
	xorq	%r9, %r9
	xorq	%r10, %r10
	xorq	%r11, %r11
	xorq	%r12, %r12
	xorq	%r13, %r13
	xorq	%r14, %r14
	xorq	%r15, %r15
//*/

	# end of setup, now can start arbitrary user code

	# fill registers with a and b to free registers rsi and rdx for us to use
	movq	(%rsi), %r8	# move a to registers r8, r9, r10, r11
	movq	8(%rsi), %r9
	movq	16(%rsi), %r10
	movq	24(%rsi), %r11
	movq	(%rdx), %r12	# move b to registers r12, r13, r14, r15
	movq	8(%rdx), %r13
	movq	16(%rdx), %r14
	movq	24(%rdx), %r15

	# clear some registers with zeros
	xorq	%rsi, %rsi


	# done initializing, now let's compute something

	# note: will use rcx=low_limb, rdx=high_limb, rsi=carry

	# a0*b0 + carry

	# a0*b0
	movq    %r8, %rax
	mul	%r12

	# write result for this limb, prepare for next limb
	movq	%rax, 0(%rdi)	# write result for this 64-bit limb
	movq	%rdx, %rbx


	# a0*b1 + a1*b0 + carry

	# a0*b1
	movq    %r8, %rax
	mul	%r13
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a0*b1
	movq    %r9, %rax
	mul	%r12
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	movq	%rbx, 8(%rdi)	# write result for this 64-bit limb
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	xorq	%rsi, %rsi


	# a0*b2 + a1*b1 + a2*b0 + carry

	# a0*b2
	movq    %r8, %rax
	mul	%r14
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a1*b1
	movq    %r9, %rax
	mul	%r13
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a2*b0
	movq    %r10, %rax
	mul	%r12
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	movq	%rbx, 16(%rdi)	# write result for this 64-bit limb
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	xorq	%rsi, %rsi


	# a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

	# a0*b3
	movq    %r8, %rax
	mul	%r15
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a1*b2
	movq    %r9, %rax
	mul	%r14
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a2*b1
	movq    %r10, %rax
	mul	%r13
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a3*b0
	movq    %r11, %rax
	mul	%r12
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	movq	%rbx, 24(%rdi)	# write result for this 64-bit limb
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	xorq	%rsi, %rsi


	# a1*b3 + a2*b2 + a3*b1 + carry

	# a1*b3
	movq    %r9, %rax
	mul	%r15
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a2*b2
	movq    %r10, %rax
	mul	%r14
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a3*b1
	movq    %r11, %rax
	mul	%r13
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	movq	%rbx, 32(%rdi)	# write result for this 64-bit limb
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	xorq	%rsi, %rsi


	# a2*b3 + a3*b2 + carry

	# a2*b3
	movq    %r10, %rax
	mul	%r15
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# a3*b2
	movq    %r11, %rax
	mul	%r14
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx
        cmpq    %rcx, %rdx      # compare rcx and rbx
        seta    %dl             # set register al to 1 or 0 based on cmpq
        movzx   %dl, %rdx       # extend dl to rdx
        addq    %rdx, %rsi      # add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	movq	%rbx, 40(%rdi)	# write result for this 64-bit limb
	movq	%rcx, %rbx
	movq	%rsi, %rcx
	xorq	%rsi, %rsi


	# a3*b3 + carry

	# a3*b3
	movq    %r11, %rax
	mul	%r15
	addq	%rax, %rbx
        cmpq    %rbx, %rax      # compare rax and rbx
        seta    %al             # set register al to 1 or 0 based on cmpq
        movzx   %al, %rax       # extend al to rax
        addq    %rax, %rdx      # add to overflow, even if add zero
	addq	%rdx, %rcx

	# write result for this limb, prepare for next limb
	movq	%rbx, 48(%rdi)	# write result for this 64-bit limb
	movq	%rcx, 56(%rdi)	# write result for this 64-bit limb


	# done computing stuff

	# recover the stack pointer
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

.data
stack_pointer_saved_in_data_section:	.quad	0
