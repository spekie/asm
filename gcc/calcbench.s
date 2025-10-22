	.file	"calcbench.c"
	.text
	.globl	is_prime
	.type	is_prime, @function
is_prime:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	cmpl	$1, -20(%rbp)
	jg	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$2, -4(%rbp)
	jmp	.L4
.L6:
	movl	-20(%rbp), %eax
	cltd
	idivl	-4(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L5
	movl	$0, %eax
	jmp	.L3
.L5:
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	imull	%eax, %eax
	cmpl	%eax, -20(%rbp)
	jge	.L6
	movl	$1, %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	is_prime, .-is_prime
	.globl	get_seconds
	.type	get_seconds, @function
get_seconds:
.LFB1:
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
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	get_seconds, .-get_seconds
	.section	.rodata
	.align 8
.LC1:
	.string	"Time took to find %d numbers: %f seconds\n"
.LC4:
	.string	"Avg time per number: %f ms\n"
	.text
	.globl	benchmark_primes
	.type	benchmark_primes, @function
benchmark_primes:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, -32(%rbp)
	movl	$2, -28(%rbp)
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	jmp	.L11
.L13:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	is_prime
	testl	%eax, %eax
	je	.L12
	addl	$1, -32(%rbp)
.L12:
	addl	$1, -28(%rbp)
.L11:
	cmpl	$99999, -32(%rbp)
	jle	.L13
	movl	$0, %eax
	call	get_seconds
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	subsd	-24(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	movl	$100000, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movsd	-8(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	benchmark_primes, .-benchmark_primes
	.section	.rodata
.LC5:
	.string	"Calculating prime numbers..."
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	benchmark_primes
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 8
.LC3:
	.long	0
	.long	1090021888
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
