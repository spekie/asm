.LC0:
        .string "this is a stdout output"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        movl    $.LC0, %edi
        movl    $0, %eax
        call    printf
        movl    $0, %eax
        popq    %rbp
        ret
