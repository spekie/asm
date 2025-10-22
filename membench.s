x:
        .zero   67108864
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
        .string "%1dB,"
.LC2:
        .string "%1dK,"
.LC3:
        .string "%1dM,"
.LC4:
        .string "%1dG,"
label:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $16, %rsp
        movl    %edi, -4(%rbp)
        cmpl    $999, -4(%rbp)
        jg      .L4
        movl    -4(%rbp), %eax
        movl    %eax, %esi
        movl    $.LC1, %edi
        movl    $0, %eax
        call    printf
        jmp     .L8
.L4:
        cmpl    $999999, -4(%rbp)
        jg      .L6
        movl    -4(%rbp), %eax
        leal    1023(%rax), %edx
        testl   %eax, %eax
        cmovs   %edx, %eax
        sarl    $10, %eax
        movl    %eax, %esi
        movl    $.LC2, %edi
        movl    $0, %eax
        call    printf
        jmp     .L8
.L6:
        cmpl    $999999999, -4(%rbp)
        jg      .L7
        movl    -4(%rbp), %eax
        leal    1048575(%rax), %edx
        testl   %eax, %eax
        cmovs   %edx, %eax
        sarl    $20, %eax
        movl    %eax, %esi
        movl    $.LC3, %edi
        movl    $0, %eax
        call    printf
        jmp     .L8
.L7:
        movl    -4(%rbp), %eax
        leal    1073741823(%rax), %edx
        testl   %eax, %eax
        cmovs   %edx, %eax
        sarl    $30, %eax
        movl    %eax, %esi
        movl    $.LC4, %edi
        movl    $0, %eax
        call    printf
.L8:
        nop
        leave
        ret
.LC5:
        .string " ,"
.LC10:
        .string "%4.1f,"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $96, %rsp
        movl    %edi, -84(%rbp)
        movq    %rsi, -96(%rbp)
        movl    $.LC5, %edi
        movl    $0, %eax
        call    printf
        movl    $1, -16(%rbp)
        jmp     .L10
.L11:
        movl    -16(%rbp), %eax
        sall    $2, %eax
        movl    %eax, %edi
        call    label
        sall    -16(%rbp)
.L10:
        cmpl    $8388608, -16(%rbp)
        jle     .L11
        movl    $10, %edi
        call    putchar
        movl    $1024, -20(%rbp)
        jmp     .L12
.L31:
        movl    -20(%rbp), %eax
        sall    $2, %eax
        movl    %eax, %edi
        call    label
        movl    $1, -16(%rbp)
        jmp     .L13
.L30:
        movl    $0, -12(%rbp)
        jmp     .L14
.L15:
        movl    -12(%rbp), %edx
        movl    -16(%rbp), %eax
        addl    %eax, %edx
        movl    -12(%rbp), %eax
        cltq
        movl    %edx, x(,%rax,4)
        movl    -16(%rbp), %eax
        addl    %eax, -12(%rbp)
.L14:
        movl    -12(%rbp), %eax
        cmpl    -20(%rbp), %eax
        jl      .L15
        movl    -12(%rbp), %eax
        subl    -16(%rbp), %eax
        cltq
        movl    $0, x(,%rax,4)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -56(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -48(%rbp)
        jmp     .L16
.L17:
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -48(%rbp)
.L16:
        movsd   -48(%rbp), %xmm0
        ucomisd -56(%rbp), %xmm0
        jp      .L33
        movsd   -48(%rbp), %xmm0
        ucomisd -56(%rbp), %xmm0
        je      .L17
.L33:
        pxor    %xmm0, %xmm0
        movsd   %xmm0, -32(%rbp)
        movl    $0, -4(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -48(%rbp)
.L22:
        movl    -16(%rbp), %eax
        movl    %eax, -8(%rbp)
        jmp     .L19
.L21:
        movl    $0, -4(%rbp)
.L20:
        movl    -4(%rbp), %eax
        cltq
        movl    x(,%rax,4), %eax
        movl    %eax, -4(%rbp)
        cmpl    $0, -4(%rbp)
        jne     .L20
        subl    $1, -8(%rbp)
.L19:
        cmpl    $0, -8(%rbp)
        jne     .L21
        movsd   -32(%rbp), %xmm1
        movsd   .LC7(%rip), %xmm0
        addsd   %xmm1, %xmm0
        movsd   %xmm0, -32(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -64(%rbp)
        movsd   -64(%rbp), %xmm0
        movapd  %xmm0, %xmm1
        subsd   -48(%rbp), %xmm1
        movsd   .LC8(%rip), %xmm0
        comisd  %xmm1, %xmm0
        ja      .L22
        movsd   -64(%rbp), %xmm0
        subsd   -48(%rbp), %xmm0
        movsd   %xmm0, -72(%rbp)
        pxor    %xmm0, %xmm0
        movsd   %xmm0, -40(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -48(%rbp)
.L26:
        movl    -16(%rbp), %eax
        movl    %eax, -8(%rbp)
        jmp     .L23
.L25:
        movl    $0, -12(%rbp)
.L24:
        movl    -16(%rbp), %eax
        addl    %eax, -12(%rbp)
        movl    -12(%rbp), %eax
        cmpl    -20(%rbp), %eax
        jl      .L24
        subl    $1, -8(%rbp)
.L23:
        cmpl    $0, -8(%rbp)
        jne     .L25
        movsd   -40(%rbp), %xmm1
        movsd   .LC7(%rip), %xmm0
        addsd   %xmm1, %xmm0
        movsd   %xmm0, -40(%rbp)
        call    get_seconds
        movq    %xmm0, %rax
        movq    %rax, -64(%rbp)
        movsd   -32(%rbp), %xmm0
        comisd  -40(%rbp), %xmm0
        ja      .L26
        movsd   -64(%rbp), %xmm0
        movapd  %xmm0, %xmm1
        subsd   -48(%rbp), %xmm1
        movsd   -72(%rbp), %xmm0
        subsd   %xmm1, %xmm0
        movsd   %xmm0, -72(%rbp)
        movsd   -72(%rbp), %xmm1
        movsd   .LC0(%rip), %xmm0
        mulsd   %xmm1, %xmm0
        pxor    %xmm1, %xmm1
        cvtsi2sdl       -20(%rbp), %xmm1
        mulsd   -32(%rbp), %xmm1
        divsd   %xmm1, %xmm0
        movsd   %xmm0, -80(%rbp)
        movsd   .LC9(%rip), %xmm0
        comisd  -80(%rbp), %xmm0
        jbe     .L35
        movq    .LC9(%rip), %rax
        jmp     .L29
.L35:
        movq    -80(%rbp), %rax
.L29:
        movq    %rax, %xmm0
        movl    $.LC10, %edi
        movl    $1, %eax
        call    printf
        sall    -16(%rbp)
.L13:
        movl    -20(%rbp), %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        cmpl    %eax, -16(%rbp)
        jle     .L30
        movl    $10, %edi
        call    putchar
        sall    -20(%rbp)
.L12:
        cmpl    $16777216, -20(%rbp)
        jle     .L31
        movl    $0, %eax
        leave
        ret
.LC0:
        .long   0
        .long   1104006501
.LC7:
        .long   0
        .long   1072693248
.LC8:
        .long   0
        .long   1077149696
.LC9:
        .long   -1717986918
        .long   1069128089 
