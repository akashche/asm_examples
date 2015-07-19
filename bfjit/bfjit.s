.syntax unified
.thumb

.data
.align 2
/* ldr.w r1, [sp, #4] */
.Lline1: .word 0x1004f8dd

.align 2
/* ldr r3, [r1] */
.Lline2: .word 0xf103680b

.align 2
/* add r3, #1 */
.Lline3: .word 0x600b0301

.align 2
/* str r3, [r1] */
/* bx lr */
.Lline4: .word 0xbf004770

.text

.align 2
.Lline1_ptr: .word .Lline1
.align 2
.Lline2_ptr: .word .Lline2
.align 2
.Lline3_ptr: .word .Lline3
.align 2
.Lline4_ptr: .word .Lline4

.align 2
.global op62
.thumb_func
.type op62, %function
op62:
    push {r1, r3, r7, lr}
    add r7, sp, #16

    sub sp, sp, #4

    mov r0, sp
    mov r1, #4096
    mov r2, #16
    bl posix_memalign
    cmp r0, #0
    it ne
    bne .Lop62exit

    ldr r0, [sp]
    mov r1, #16
    mov r2, #0x3
    bl mprotect
    cmp r0, #0
    it ne
    bne .Lop62exit

    ldr r3, [sp]

    ldr r2, =.Lline1_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3]

    ldr r2, =.Lline2_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3, #4]

    ldr r2, =.Lline3_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3, #8]

    ldr r2, =.Lline4_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3, #12]

    ldr r0, [sp]
    mov r1, #16
    mov r2, #0x5
    bl mprotect
    cmp r0, #0
    it ne
    bne .Lop62exit

    ldr r0, [sp]
    ldr r1, [sp, #16]
    bl __clear_cache

    ldr r3, [sp]
    add r3, r3, #1
    blx r3

    ldr r0, [sp]
    mov r1, #16
    mov r2, #0x3
    bl mprotect
 
    ldr r0, [sp]
    bl free

    .Lop62exit:
        sub r7, r7, #16
        mov sp, r7
        pop {r1, r3, r7, lr}
        mov r0, #0
        bx lr
.size , .-op62

.align 2
.global op60
.thumb_func
.type op60, %function
op60:
    ldr r3, [r1]
    sub r3, #1
    str r3, [r1]
    mov r0, #0
    bx lr
.size , .-op60

.align 2
.global op43
.thumb_func
.type op43, %function
op43:
    ldr r3, [r1]
    ldr r2, [r3]
    add r2, #1
    str r2, [r3]
    mov r0, #0
    bx lr
.size , .-op43

.align 2
.global op45
.thumb_func
.type op45, %function
op45:
    ldr r3, [r1]
    ldr r2, [r3]
    sub r2, #1
    str r2, [r3]
    mov r0, #0
    bx lr
.size , .-op45

.align 2
.global op46
.thumb_func
.type op46, %function
op46:
    ldr r3, [r1]
    ldr r0, [r3]

    push {r3, r7, lr}
    add r7, sp, #12

    bl putchar

    sub r7, r7, #12
    mov sp, r7
    pop {r3, r7, lr}

    mov r0, #0
    bx lr
.size , .-op46

.align 2
.global eval
.thumb_func
.type eval, %function
eval:
    push {r7, lr}
    add r7, sp, #8

    mov r3, #0

    cmp r0, #62
    itt eq
    moveq r3, #1
    bleq op62
    cmp r3, #1
    it eq
    beq .Levexit

    cmp r0, #60
    itt eq
    moveq r3, #1
    bleq op60
    cmp r3, #1
    it eq
    beq .Levexit

    cmp r0, #43
    itt eq
    moveq r3, #1
    bleq op43
    cmp r3, #1
    it eq
    beq .Levexit

    cmp r0, #45
    itt eq
    moveq r3, #1
    bleq op45
    cmp r3, #1
    it eq
    beq .Levexit

    cmp r0, #46
    itt eq
    moveq r3, #1
    bleq op46
    cmp r3, #1
    it eq
    beq .Levexit

    mov r0, #0

    .Levexit:
        sub r7, r7, #8
        mov sp, r7
        pop {r7, lr}
        bx lr
.size eval, .-eval

.text
.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8
    mov r3, #1
    lsl r3, r3, #9
    sub sp, sp, r3

    mov r3, #1
    lsl r3, r3, #8
    mov r0, #0
    add r1, sp, r3
    mov r2, r3
    bl read
    cmp r0, #0
    itt le
    movle r0, #1
    ble .Lexit

    sub sp, sp, #16

    mov r3, #1
    lsl r3, r3, #8
    add r3, #12
    str r3, [sp]
    add r0, r3
    str r0, [sp, #4]
    mov r3, sp
    add r3, #12
    str r3, [sp, #8]

    mov r2, #1
    lsl r2, r2, #8
    add r2, r2, r3
    mov r1, #0
    .Lloopclean:
        str r1, [r3]
        add r3, r3, #1
        cmp r3, r2
        it ls
        bls .Lloopclean


    .Lloopev:
        ldr r3, [sp]
        ldr r0, [sp, r3]
        lsr r0, #24
        add r1, sp, #8
        bl eval
        cmp r0, #0
        it ne
        bne .Lexit

        ldr r3, [sp]
        add r3, #1
        str r3, [sp]
        ldr r2, [sp, #4]
        cmp r3, r2
        it ls
        bls .Lloopev

    .Lexit:
        sub r7, r7, #8
        mov sp, r7
        pop {r7, lr}
        bx lr
.size main, .-main
