.syntax unified
.thumb

.text

.align 2
.global main
.thumb_func
.type main, %function

main:
    mov r1, #1
    mov r2, #2
    add r3, r1, r2
    mov r0, r3

    bx lr
    .size main, .-main
