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
        .string "Temporary %d Permanent %d\n"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $16, %rsp
        movl    $0, -4(%rbp)
        jmp     .L2
.L3:
        movl    $1, -8(%rbp)
        movl    permanent.0(%rip), %edx
        movl    -8(%rbp), %eax
        movl    %eax, %esi
        movl    $.LC0, %edi
        movl    $0, %eax
        call    printf
        addl    $1, -8(%rbp)
        movl    permanent.0(%rip), %eax
        addl    $1, %eax
        movl    %eax, permanent.0(%rip)
        addl    $1, -4(%rbp)
.L2:
        cmpl    $2, -4(%rbp)
        jle     .L3
        movl    $0, %eax
        leave
        ret
permanent.0:
        .long   1
