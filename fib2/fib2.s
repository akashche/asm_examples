.syntax unified
.thumb

.text

.align 2
.global fib2
.thumb_func
.type fib2, %function
fib2:
    push {r7, lr}
    add r7, sp, #8
    sub sp, sp, #8

    cmp r0, #0
    it eq
    beq .Lexit

    cmp r1, #1
    it eq
    beq .Lexit

    sub r0, r0, #3
    mov r3, #0
    mov r2, #1
.Lloop:
    mov r1, r3
    mov r3, r2
    add r2, r3, r1
    sub r0, r0, #1
    cmp r0, #0
    it ge
    bge .Lloop
    add r0, r3, r2

.Lexit:
    sub r7, r7, #8
    mov sp, r7
    pop {r7, lr}
    bx lr
.size fib2, .-fib2

.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8

    mov r0, #12
    bl fib2

    pop {r7, lr}
    bx lr
.size main, .-main
