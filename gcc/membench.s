	.file	"membench.c"
	.text
	.globl	x
	.bss
	.align 32
	.type	x, @object
	.size	x, 67108864
x:
	.zero	67108864
	.text
	.globl	get_seconds
	.type	get_seconds, @function
get_seconds:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	get_seconds, .-get_seconds
	.section	.rodata
.LC1:
	.string	"%1dB,"
.LC2:
	.string	"%1dK,"
.LC3:
	.string	"%1dM,"
.LC4:
	.string	"%1dG,"
	.text
	.globl	label
	.type	label, @function
label:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$999, -4(%rbp)
	jg	.L5
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L5:
	cmpl	$999999, -4(%rbp)
	jg	.L7
	movl	-4(%rbp), %eax
	leal	1023(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$10, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L7:
	cmpl	$999999999, -4(%rbp)
	jg	.L8
	movl	-4(%rbp), %eax
	leal	1048575(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$20, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L8:
	movl	-4(%rbp), %eax
	leal	1073741823(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$30, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L9:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	label, .-label
	.section	.rodata
.LC5:
	.string	" ,"
.LC10:
	.string	"%4.1f,"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, -64(%rbp)
	jmp	.L11
.L12:
	movl	-64(%rbp), %eax
	sall	$2, %eax
	movl	%eax, %edi
	call	label
	sall	-64(%rbp)
.L11:
	cmpl	$8388608, -64(%rbp)
	jle	.L12
	movl	$10, %edi
	call	putchar@PLT
	movl	$1024, -60(%rbp)
	jmp	.L13
.L32:
	movl	-60(%rbp), %eax
	sall	$2, %eax
	movl	%eax, %edi
	call	label
	movl	$1, -64(%rbp)
	jmp	.L14
.L31:
	movl	$0, -68(%rbp)
	jmp	.L15
.L16:
	movl	-68(%rbp), %edx
	movl	-64(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movl	-68(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-64(%rbp), %eax
	addl	%eax, -68(%rbp)
.L15:
	movl	-68(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L16
	movl	-68(%rbp), %eax
	subl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
	jmp	.L17
.L18:
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
.L17:
	movsd	-40(%rbp), %xmm0
	ucomisd	-32(%rbp), %xmm0
	jp	.L34
	movsd	-40(%rbp), %xmm0
	ucomisd	-32(%rbp), %xmm0
	je	.L18
.L34:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	$0, -76(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
.L23:
	movl	-64(%rbp), %eax
	movl	%eax, -72(%rbp)
	jmp	.L20
.L22:
	movl	$0, -76(%rbp)
.L21:
	movl	-76(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	x(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -76(%rbp)
	cmpl	$0, -76(%rbp)
	jne	.L21
	subl	$1, -72(%rbp)
.L20:
	cmpl	$0, -72(%rbp)
	jne	.L22
	movsd	-56(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-40(%rbp), %xmm1
	movsd	.LC8(%rip), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L23
	movsd	-24(%rbp), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -40(%rbp)
.L27:
	movl	-64(%rbp), %eax
	movl	%eax, -72(%rbp)
	jmp	.L24
.L26:
	movl	$0, -68(%rbp)
.L25:
	movl	-64(%rbp), %eax
	addl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L25
	subl	$1, -72(%rbp)
.L24:
	cmpl	$0, -72(%rbp)
	jne	.L26
	movsd	-48(%rbp), %xmm1
	movsd	.LC7(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-56(%rbp), %xmm0
	comisd	-48(%rbp), %xmm0
	ja	.L27
	movsd	-24(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	subsd	-40(%rbp), %xmm1
	movsd	-16(%rbp), %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-60(%rbp), %xmm1
	mulsd	-56(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	.LC9(%rip), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L36
	movq	.LC9(%rip), %rax
	jmp	.L30
.L36:
	movq	-8(%rbp), %rax
.L30:
	movq	%rax, %xmm0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	sall	-64(%rbp)
.L14:
	movl	-60(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -64(%rbp)
	jle	.L31
	movl	$10, %edi
	call	putchar@PLT
	sall	-60(%rbp)
.L13:
	cmpl	$16777216, -60(%rbp)
	jle	.L32
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.align 8
.LC7:
	.long	0
	.long	1072693248
	.align 8
.LC8:
	.long	0
	.long	1077149696
	.align 8
.LC9:
	.long	-1717986918
	.long	1069128089
	.ident	"GCC: (Gentoo 14.3.1_p20250801 p4) 14.3.1 20250801"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
