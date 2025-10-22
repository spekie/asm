# Copyright (c) 2025 spekie
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

.LC0:
        .string "failed"
.LC1:
        .string " \t\r\n"
.LC2:
        .string "not found"
execute_command:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $8224, %rsp
        movq    %rdi, -8216(%rbp)
        call    fork
        movl    %eax, -16(%rbp)
        cmpl    $-1, -16(%rbp)
        jne     .L2
        movl    $.LC0, %edi
        call    perror
        movl    $1, %edi
        call    exit
.L2:
        cmpl    $0, -16(%rbp)
        jne     .L3
        movq    -8216(%rbp), %rax
        movl    $.LC1, %esi
        movq    %rax, %rdi
        call    strtok
        movq    %rax, -8(%rbp)
        movl    $0, -12(%rbp)
        jmp     .L4
.L5:
        movl    -12(%rbp), %eax
        leal    1(%rax), %edx
        movl    %edx, -12(%rbp)
        cltq
        movq    -8(%rbp), %rdx
        movq    %rdx, -8208(%rbp,%rax,8)
        movl    $.LC1, %esi
        movl    $0, %edi
        call    strtok
        movq    %rax, -8(%rbp)
.L4:
        cmpq    $0, -8(%rbp)
        jne     .L5
        movl    -12(%rbp), %eax
        cltq
        movq    $0, -8208(%rbp,%rax,8)
        movq    -8208(%rbp), %rax
        leaq    -8208(%rbp), %rdx
        movq    %rdx, %rsi
        movq    %rax, %rdi
        call    execvp
        cmpl    $-1, %eax
        jne     .L6
        movl    $.LC2, %edi
        call    perror
.L6:
        movl    $1, %edi
        call    exit
.L3:
        movl    $0, %edi
        call    wait
        nop
        leave
        ret
.LC3:
        .string "shell startup\n"
.LC4:
        .string "$ "
.LC5:
        .string "error"
.LC6:
        .string "\n"
.LC7:
        .string "exit"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $1024, %rsp
        movl    $.LC3, %edi
        call    puts
.L13:
        movl    $.LC4, %edi
        movl    $0, %eax
        call    printf
        movq    stdin(%rip), %rdx
        leaq    -1024(%rbp), %rax
        movl    $1024, %esi
        movq    %rax, %rdi
        call    fgets
        testq   %rax, %rax
        jne     .L8
        movq    stdin(%rip), %rax
        movq    %rax, %rdi
        call    feof
        testl   %eax, %eax
        jne     .L15
        movl    $.LC5, %edi
        call    perror
        jmp     .L11
.L8:
        leaq    -1024(%rbp), %rax
        movl    $.LC6, %esi
        movq    %rax, %rdi
        call    strcspn
        movb    $0, -1024(%rbp,%rax)
        leaq    -1024(%rbp), %rax
        movl    $.LC7, %esi
        movq    %rax, %rdi
        call    strcmp
        testl   %eax, %eax
        je      .L16
        leaq    -1024(%rbp), %rax
        movq    %rax, %rdi
        call    execute_command
.L11:
        jmp     .L13
.L15:
        nop
        jmp     .L10
.L16:
        nop
.L10:
        movl    $0, %eax
        leave
        ret
