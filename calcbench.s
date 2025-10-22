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

is_prime:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    %edi, -20(%rbp)
        cmpl    $1, -20(%rbp)
        jg      .L2
        movl    $0, %eax
        jmp     .L3
.L2:
        movl    $2, -4(%rbp)
        jmp     .L4
.L6:
        movl    -20(%rbp), %eax
        cltd
        idivl   -4(%rbp)
        movl    %edx, %eax
        testl   %eax, %eax
        jne     .L5
        movl    $0, %eax
        jmp     .L3
.L5:
        addl    $1, -4(%rbp)
.L4:
        movl    -4(%rbp), %eax
        imull   %eax, %eax
        cmpl    %eax, -20(%rbp)
        jge     .L6
        movl    $1, %eax
.L3:
        popq    %rbp
        ret
get_seconds:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $16, %rsp
        leaq    -16(%rbp), %rax
        movq    %rax, %rsi
        movl    $0, %edi
        call    clock_gettime
        movq    -16(%rbp), %rax
        pxor    %xmm1, %xmm1
        cvtsi2sdq       %rax, %xmm1
        movq    -8(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm2
        divsd   %xmm2, %xmm0
        addsd   %xmm1, %xmm0
        leave
        ret
.LC1:
        .string "Time took to find %d numbers: %f seconds\n"
.LC4:
        .string "Avg time per number: %f ms\n"
benchmark_primes:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    $0, -4(%rbp)
        movl    $2, -8(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -16(%rbp)
        jmp     .L10
.L12:
        movl    -8(%rbp), %eax
        movl    %eax, %edi
        call    is_prime
        testl   %eax, %eax
        je      .L11
        addl    $1, -4(%rbp)
.L11:
        addl    $1, -8(%rbp)
.L10:
        cmpl    $99999, -4(%rbp)
        jle     .L12
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -24(%rbp)
        movsd   -24(%rbp), %xmm0
        subsd   -16(%rbp), %xmm0
        movsd   %xmm0, -32(%rbp)
        movq    -32(%rbp), %rax
        movq    %rax, %xmm0
        movl    $100000, %esi
        movl    $.LC1, %edi
        movl    $1, %eax
        call    printf
        movsd   -32(%rbp), %xmm1
        movsd   .LC2(%rip), %xmm0
        mulsd   %xmm1, %xmm0
        movsd   .LC3(%rip), %xmm1
        divsd   %xmm1, %xmm0
        movq    %xmm0, %rax
        movq    %rax, %xmm0
        movl    $.LC4, %edi
        movl    $1, %eax
        call    printf
        nop
        leave
        ret
.LC5:
        .string "Calculating prime numbers..."
main:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    $.LC5, %edi
        call    puts
        call    benchmark_primes
        movl    $0, %eax
        popq    %rbp
        ret
.LC0:
        .long   0
        .long   1104006501
.LC2:
        .long   0
        .long   1083129856
.LC3:
        .long   0
        .long   1090021888
