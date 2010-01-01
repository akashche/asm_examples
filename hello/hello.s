.syntax unified
.thumb

.data
.align 2
.Lhello: .asciz "hello from thumb"

.text
.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    sub sp, sp, #8
    mov r7, sp

    ldr r0, =.Lhelloptr
    ldr r0, [r0]
    bl puts

    add r7, r7, #8
    mov sp, r7
    pop {r7, lr}
    bx lr
    .size main, .-main


.Lhelloptr: .word .Lhello
