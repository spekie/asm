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

.LC1:
        .string "Integer operations: %lf seconds\n"
benchmark_integer_operations:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    $0, -28(%rbp)
        call    clock
        movq    %rax, -16(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L2
.L3:
        movl    -28(%rbp), %edx
        movl    -4(%rbp), %eax
        addl    %edx, %eax
        movl    %eax, -28(%rbp)
        addl    $1, -4(%rbp)
.L2:
        cmpl    $99999999, -4(%rbp)
        jle     .L3
        call    clock
        movq    %rax, -24(%rbp)
        movq    -24(%rbp), %rax
        subq    -16(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm1
        divsd   %xmm1, %xmm0
        movq    %xmm0, %rax
        movq    %rax, %xmm0
        movl    $.LC1, %edi
        movl    $1, %eax
        call    printf
        nop
        leave
        ret
.LC4:
        .string "Floating-point operations: %lf seconds\n"
benchmark_floating_point_operations:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        pxor    %xmm0, %xmm0
        movsd   %xmm0, -32(%rbp)
        call    clock
        movq    %rax, -16(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L5
.L6:
        pxor    %xmm1, %xmm1
        cvtsi2sdl       -4(%rbp), %xmm1
        movsd   .LC3(%rip), %xmm0
        mulsd   %xmm0, %xmm1
        movsd   -32(%rbp), %xmm0
        addsd   %xmm1, %xmm0
        movsd   %xmm0, -32(%rbp)
        addl    $1, -4(%rbp)
.L5:
        cmpl    $99999999, -4(%rbp)
        jle     .L6
        call    clock
        movq    %rax, -24(%rbp)
        movq    -24(%rbp), %rax
        subq    -16(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm1
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
        .string "Memory access: %lf seconds\n"
benchmark_memory_access:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    $400000000, %edi
        call    malloc
        movq    %rax, -16(%rbp)
        call    clock
        movq    %rax, -24(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L8
.L9:
        movl    -4(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -16(%rbp), %rax
        addq    %rax, %rdx
        movl    -4(%rbp), %eax
        movl    %eax, (%rdx)
        addl    $1, -4(%rbp)
.L8:
        cmpl    $99999999, -4(%rbp)
        jle     .L9
        call    clock
        movq    %rax, -32(%rbp)
        movq    -32(%rbp), %rax
        subq    -24(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm1
        divsd   %xmm1, %xmm0
        movq    %xmm0, %rax
        movq    %rax, %xmm0
        movl    $.LC5, %edi
        movl    $1, %eax
        call    printf
        movq    -16(%rbp), %rax
        movq    %rax, %rdi
        call    free
        nop
        leave
        ret
.LC6:
        .string "Cache performance: %lf seconds\n"
benchmark_cache_performance:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    $400000000, %edi
        call    malloc
        movq    %rax, -16(%rbp)
        call    clock
        movq    %rax, -24(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L11
.L12:
        movl    -4(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -16(%rbp), %rax
        addq    %rax, %rdx
        movl    -4(%rbp), %eax
        movl    %eax, (%rdx)
        addl    $64, -4(%rbp)
.L11:
        cmpl    $99999999, -4(%rbp)
        jle     .L12
        call    clock
        movq    %rax, -32(%rbp)
        movq    -32(%rbp), %rax
        subq    -24(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm1
        divsd   %xmm1, %xmm0
        movq    %xmm0, %rax
        movq    %rax, %xmm0
        movl    $.LC6, %edi
        movl    $1, %eax
        call    printf
        movq    -16(%rbp), %rax
        movq    %rax, %rdi
        call    free
        nop
        leave
        ret
thread_function:
        pushq   %rbp
        movq    %rsp, %rbp
        movq    %rdi, -24(%rbp)
        movl    $0, -8(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L14
.L15:
        movl    -8(%rbp), %edx
        movl    -4(%rbp), %eax
        addl    %edx, %eax
        movl    %eax, -8(%rbp)
        addl    $1, -4(%rbp)
.L14:
        cmpl    $24999999, -4(%rbp)
        jle     .L15
        movl    $0, %eax
        popq    %rbp
        ret
.LC7:
        .string "Multithreading: %lf seconds\n"
benchmark_multithreading:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $64, %rsp
        call    clock
        movq    %rax, -16(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L18
.L19:
        leaq    -64(%rbp), %rax
        movl    -4(%rbp), %edx
        movslq  %edx, %rdx
        salq    $3, %rdx
        addq    %rdx, %rax
        movl    $0, %ecx
        movl    $thread_function, %edx
        movl    $0, %esi
        movq    %rax, %rdi
        call    pthread_create
        addl    $1, -4(%rbp)
.L18:
        cmpl    $3, -4(%rbp)
        jle     .L19
        movl    $0, -8(%rbp)
        jmp     .L20
.L21:
        movl    -8(%rbp), %eax
        cltq
        movq    -64(%rbp,%rax,8), %rax
        movl    $0, %esi
        movq    %rax, %rdi
        call    pthread_join
        addl    $1, -8(%rbp)
.L20:
        cmpl    $3, -8(%rbp)
        jle     .L21
        call    clock
        movq    %rax, -24(%rbp)
        movq    -24(%rbp), %rax
        subq    -16(%rbp), %rax
        pxor    %xmm0, %xmm0
        cvtsi2sdq       %rax, %xmm0
        movsd   .LC0(%rip), %xmm1
        divsd   %xmm1, %xmm0
        movq    %xmm0, %rax
        movq    %rax, %xmm0
        movl    $.LC7, %edi
        movl    $1, %eax
        call    printf
        nop
        leave
        ret
.LC8:
        .string "Benchmarking..."
.LC9:
        .string "Complete."
main:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    $.LC8, %edi
        call    puts
        call    benchmark_integer_operations
        call    benchmark_floating_point_operations
        call    benchmark_memory_access
        call    benchmark_cache_performance
        call    benchmark_multithreading
        movl    $.LC9, %edi
        call    puts
        movl    $0, %eax
        popq    %rbp
        ret
.LC0:
        .long   0
        .long   1093567616
.LC3:
        .long   0
        .long   1071644672
