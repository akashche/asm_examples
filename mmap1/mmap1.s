.syntax unified
.thumb

.data
.align 2
/* mov r0, 2a */
.Lline1: .word 0x002af04f
.align 2
/* bx lr */
.Lline2: .word 0x46c04770

.text

.align 2
.Lline1_ptr: .word .Lline1
.align 2
.Lline2_ptr: .word .Lline2

.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8
    sub sp, sp, #8


    mov r0, sp
    mov r1, #4096
    mov r2, #8
    bl posix_memalign

    ldr r0, [sp]
    mov r1, #8
    mov r2, #0x3
    bl mprotect

/* mmap variant, also works */
/*
    mov r1, #8
    mov r2, #7
    mov r3, #34
    sub sp, sp, #8
    mov r0, #0
    str r0, [sp]
    str r0, [sp, #4]
    bl mmap
    add sp, sp, #8
*/

    ldr r3, [sp]
    ldr r2, =.Lline1_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3]
    ldr r2, =.Lline2_ptr
    ldr r2, [r2]
    ldr r2, [r2]
    str r2, [r3, #4]


    ldr r0, [sp]
    mov r1, #8
    mov r2, #0x5
    bl mprotect

    /* not required in this case */
    /* but won't harm */
    ldr r0, [sp]
    ldr r1, [sp, #8]
    bl __clear_cache

    ldr r3, [sp]
    add r3, r3, #1
    blx r3
    str r0, [sp, #4]

    ldr r0, [sp]
    mov r1, #8
    mov r2, #0x3
    bl mprotect

    ldr r0, [sp]
    bl free

    ldr r0, [sp, #4]

    sub r7, r7, #8
    mov sp, r7
    pop {r7, lr}
    bx lr
.size main, .-main

