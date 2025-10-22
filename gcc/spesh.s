	.file	"spesh.c"
	.text
	.section	.rodata
.LC0:
	.string	"Fork failed"
.LC1:
	.string	" \t\r\n"
.LC2:
	.string	"Command not found"
	.text
	.globl	execute_command
	.type	execute_command, @function
execute_command:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$48, %rsp
	movq	%rdi, -8232(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	fork@PLT
	movl	%eax, -8220(%rbp)
	cmpl	$-1, -8220(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	cmpl	$0, -8220(%rbp)
	jne	.L3
	movq	-8232(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -8216(%rbp)
	movl	$0, -8224(%rbp)
	jmp	.L4
.L5:
	movl	-8224(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -8224(%rbp)
	cltq
	movq	-8216(%rbp), %rdx
	movq	%rdx, -8208(%rbp,%rax,8)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -8216(%rbp)
.L4:
	cmpq	$0, -8216(%rbp)
	jne	.L5
	movl	-8224(%rbp), %eax
	cltq
	movq	$0, -8208(%rbp,%rax,8)
	movq	-8208(%rbp), %rax
	leaq	-8208(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	cmpl	$-1, %eax
	jne	.L6
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L6:
	movl	$1, %edi
	call	exit@PLT
.L3:
	movl	$0, %edi
	call	wait@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	execute_command, .-execute_command
	.section	.rodata
	.align 8
.LC3:
	.string	"spesh, the Simple Program Execution SHell\n"
.LC4:
	.string	"spesh >$ "
.LC5:
	.string	"Input error"
.LC6:
	.string	"\n"
.LC7:
	.string	"exit"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1040, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L14:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdin(%rip), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L9
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	jne	.L17
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	jmp	.L12
.L9:
	leaq	-1040(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcspn@PLT
	movb	$0, -1040(%rbp,%rax)
	leaq	-1040(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L18
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	execute_command
.L12:
	jmp	.L14
.L17:
	nop
	jmp	.L11
.L18:
	nop
.L11:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
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
