.syntax unified

.global main
.type main, %function
main:
    push {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r1, #1
    mov r2, #2
    add r3, r1, r2
    mov r0, r3
    pop {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    bx lr
