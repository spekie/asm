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

length:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    %rdi, -24(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L2
.L6:
        nop
        addl    $1, -4(%rbp)
.L2:
        movl    -4(%rbp), %eax
        movslq  %eax, %rdx
        movq    -24(%rbp), %rax
        addq    %rdx, %rax
        movzbl  (%rax), %eax
        testb   %al, %al
        jne     .L6
        movl    -4(%rbp), %eax
        popq    %rbp
        ret
.LC0:
        .string "Enter line:"
.LC1:
        .string "Length (including newline) is: %d\n"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $112, %rsp
.L8:
        movl    $.LC0, %edi
        movl    $0, %eax
        call    printf
        movq    stdin(%rip), %rdx
        leaq    -112(%rbp), %rax
        movl    $100, %esi
        movq    %rax, %rdi
        call    fgets
        leaq    -112(%rbp), %rax
        movq    %rax, %rdi
        call    length
        movl    %eax, %esi
        movl    $.LC1, %edi
        movl    $0, %eax
        call    printf
        jmp     .L8
