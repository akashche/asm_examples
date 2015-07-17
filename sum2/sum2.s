.syntax unified
.thumb

.text


.align 2
.global sum2
.thumb_func
.type sum2, %function
sum2:
    push {r7, lr}
    add r7, sp, #8

    add r0, r0, r1
    add r0, r0, r2
    add r0, r0, r3
    ldr r3, [r7]
    add r0, r0, r3
    ldr r3, [r7, #4]
    add r0, r0, r3
    ldr r3, [r7, #8]
    add r0, r0, r3
    ldr r3, [r7, #12]
    add r0, r0, r3

    pop {r7, lr}
    bx lr
.size sum2, .-sum2


.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8
    sub sp, sp, #16
        
    mov r3, #5
    str r3, [sp]
    mov r3, #6
    str r3, [sp, #4]
    mov r3, #7
    str r3, [sp, #8]
    mov r3, #8
    str r3, [sp, #12]
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl sum2

    sub r7, r7, #8
    mov sp, r7
    pop {r7, lr}
    bx lr
.size main, .-main
