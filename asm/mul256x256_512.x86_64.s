
	.globl	mul256x256_512

	.text
mul256x256_512:	# computes mul256x256_512, where pointers: out in rdi, a in rsi, b in rdx

	# following C calling conventions, save registers
	push	%rbx
	push	%rbp
	push	%r12
	push	%r13
	push	%r14
	push	%r15

	# fill registers with a and b to free registers rsi and rdx for us to use
	movq	(%rsi), %r8	# move a to registers r8, r9, r10, r11
	movq	8(%rsi), %r9
	movq	16(%rsi), %r10
	movq	24(%rsi), %r11
	movq	(%rdx), %r12	# move b to registers r12, r13, r14, r15
	movq	8(%rdx), %r13
	movq	16(%rdx), %r14
	movq	24(%rdx), %r15

	# init some registers with zeros
	xorq	%rsi, %rsi
	xorq	%rdx, %rdx	# might not need this
	xorq	%rax, %rax
	xorq	%rbx, %rbx


	# done initializing, now let's compute something


	# a0*b0 + carry

	# a0*b0
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 0(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b1 + a1*b0 + carry

	# a0*b1
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b0
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 4(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b2 + a1*b1 + a2*b0 + carry

	# a0*b2
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b1
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b0
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 8(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b3 + a1*b2 + a2*b1 + a3*b0 + carry

	# a0*b3
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b2
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b1
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b0
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 12(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b4 + a1*b3 + a2*b2 + a3*b1 + a4*b0 + carry

	# a0*b4
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b3
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b2
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b1
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b0
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 16(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b5 + a1*b4 + a2*b3 + a3*b2 + a4*b1 + a5*b0 + carry

	# a0*b5
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b4
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b3
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b2
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b1
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b0
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 20(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b6 + a1*b5 + a2*b4 + a3*b3 + a4*b2 + a5*b1 + a6*b0 + carry

	# a0*b6
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b5
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b4
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b3
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b2
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b1
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b0
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 24(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a0*b7 + a1*b6 + a2*b5 + a3*b4 + a4*b3 + a5*b2 + a6*b1 + a7*b0 + carry

	# a0*b7
	movq	%r8, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a1*b6
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b5
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b4
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b3
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b2
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b1
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b0
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 28(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a1*b7 + a2*b6 + a3*b5 + a4*b4 + a5*b3 + a6*b2 + a7*b1 + carry

	# a1*b7
	movq	%r8, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a2*b6
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b5
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b4
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b3
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b2
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b1
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r12, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 32(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a2*b7 + a3*b6 + a4*b5 + a5*b4 + a6*b3 + a7*b2 + carry

	# a2*b7
	movq	%r9, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a3*b6
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b5
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b4
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b3
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b2
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 36(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a3*b7 + a4*b6 + a5*b5 + a6*b4 + a7*b3 + carry

	# a3*b7
	movq	%r9, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a4*b6
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b5
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b4
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b3
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r13, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 40(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a4*b7 + a5*b6 + a6*b5 + a7*b4 + carry

	# a4*b7
	movq	%r10, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a5*b6
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b5
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b4
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 44(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a5*b7 + a6*b6 + a7*b5 + carry

	# a5*b7
	movq	%r10, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a6*b6
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b5
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r14, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 48(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a6*b7 + a7*b6 + carry

	# a6*b7
	movq	%r11, %rcx	# bring a to workspace
	movl	%ecx, %ecx	# get lower 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# a7*b6
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	movl	%edx, %edx	# get lower 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 52(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# a7*b7 + carry

	# a7*b7
	movq	%r11, %rcx	# bring a to workspace
	shrq	$32, %rcx	# get upper 32-bits
	movq	%r15, %rdx	# bring b to workspace
	shrq	$32, %rdx	# get upper 32-bits
	imulq	%rcx, %rdx	# multiply
	movq	%rdx, %rbx	# remove dependancy from rdx
	addq	%rbx, %rax	# add to accumulator rax
	cmpq	%rax, %rbx	# compare rax and rbx
	seta	%bl		# set register bl to 1 or 0 based on cmpq
	movzx	%bl, %rbx	# extend bl to rbx
	addq	%rbx, %rsi	# add to overflow, even if add zero

	# write result for this limb, prepare for next limb
	mov	%eax, 56(%rdi)	# write result for this 32-bit limb
	shrq	$32, %rax	# the upper 32-bits is carry
	shlq	$32, %rsi	# overflow is in upper 32-bits
	addq	%rsi, %rax	# add overflow of carry
	xorq	%rsi, %rsi	# re-init overflow to zero


	# write overflow to last limb
	mov	%eax, 60(%rdi)	# write result for this 32-bit limb


	# done computing stuff


	# as callee, return saved registers to original
	pop	%r15
	pop	%r14
	pop	%r13
	pop	%r12
	pop	%rbp
	pop	%rbx
	# finally, return
	ret
