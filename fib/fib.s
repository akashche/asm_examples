.syntax unified
.thumb

.text

.align 2
.global fib
.thumb_func
.type fib, %function
fib:
    push {r7, lr}
    add r7, sp, #8
    sub sp, sp, #8

    cmp r0, #0
    it eq
    bleq .Lexit

    cmp r0, #1
    it eq
    beq .Lexit

    str r0, [sp]

    sub r0, r0, #2
    bl fib
    str r0, [sp, #4]

    ldr r0, [sp]
    sub r0, r0, #1
    bl fib

    ldr r3, [sp, #4]
    add r0, r0, r3

.Lexit:
    sub r7, r7, #8
    mov sp, r7
    pop {r7, lr}
    bx lr
.size fib, .-fib

.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8

    mov r0, #12
    bl fib

    pop {r7, lr}
    bx lr
.size main, .-main
