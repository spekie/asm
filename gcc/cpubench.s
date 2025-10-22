	.file	"cpubench.c"
	.text
	.section	.rodata
	.align 8
.LC1:
	.string	"Integer operations: %lf seconds\n"
	.text
	.globl	benchmark_integer_operations
	.type	benchmark_integer_operations, @function
benchmark_integer_operations:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -24(%rbp)
	addl	$1, -20(%rbp)
.L2:
	cmpl	$99999999, -20(%rbp)
	jle	.L3
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	benchmark_integer_operations, .-benchmark_integer_operations
	.section	.rodata
	.align 8
.LC4:
	.string	"Floating-point operations: %lf seconds\n"
	.text
	.globl	benchmark_floating_point_operations
	.type	benchmark_floating_point_operations, @function
benchmark_floating_point_operations:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L5
.L6:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-28(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movsd	-24(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$1, -28(%rbp)
.L5:
	cmpl	$99999999, -28(%rbp)
	jle	.L6
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
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
.LFE7:
	.size	benchmark_floating_point_operations, .-benchmark_floating_point_operations
	.section	.rodata
.LC5:
	.string	"Memory access: %lf seconds\n"
	.text
	.globl	benchmark_memory_access
	.type	benchmark_memory_access, @function
benchmark_memory_access:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L8
.L9:
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -28(%rbp)
.L8:
	cmpl	$99999999, -28(%rbp)
	jle	.L9
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	benchmark_memory_access, .-benchmark_memory_access
	.section	.rodata
	.align 8
.LC6:
	.string	"Cache performance: %lf seconds\n"
	.text
	.globl	benchmark_cache_performance
	.type	benchmark_cache_performance, @function
benchmark_cache_performance:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$400000000, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L11
.L12:
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$64, -28(%rbp)
.L11:
	cmpl	$99999999, -28(%rbp)
	jle	.L12
	call	clock@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	benchmark_cache_performance, .-benchmark_cache_performance
	.globl	thread_function
	.type	thread_function, @function
thread_function:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L14:
	cmpl	$24999999, -4(%rbp)
	jle	.L15
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	thread_function, .-thread_function
	.section	.rodata
.LC7:
	.string	"Multithreading: %lf seconds\n"
	.text
	.globl	benchmark_multithreading
	.type	benchmark_multithreading, @function
benchmark_multithreading:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	clock@PLT
	movq	%rax, -64(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L18
.L19:
	leaq	-48(%rbp), %rax
	movl	-72(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movl	$0, %ecx
	leaq	thread_function(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	addl	$1, -72(%rbp)
.L18:
	cmpl	$3, -72(%rbp)
	jle	.L19
	movl	$0, -68(%rbp)
	jmp	.L20
.L21:
	movl	-68(%rbp), %eax
	cltq
	movq	-48(%rbp,%rax,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	addl	$1, -68(%rbp)
.L20:
	cmpl	$3, -68(%rbp)
	jle	.L21
	call	clock@PLT
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	subq	-64(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	benchmark_multithreading, .-benchmark_multithreading
	.section	.rodata
.LC8:
	.string	"Benchmarking..."
.LC9:
	.string	"Complete."
	.text
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	benchmark_integer_operations
	movl	$0, %eax
	call	benchmark_floating_point_operations
	movl	$0, %eax
	call	benchmark_memory_access
	movl	$0, %eax
	call	benchmark_cache_performance
	movl	$0, %eax
	call	benchmark_multithreading
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC3:
	.long	0
	.long	1071644672
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
