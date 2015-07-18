.syntax unified
.thumb

.data
.align 2
.LFizz: .asciz "Fizz"
.align 2
.LBuzz: .asciz "Buzz"
.align 2
.LFizzBuzz: .asciz "FizzBuzz"
.align 2
.Ldecformat: .asciz "%d\n"

.text

.global __aeabi_idivmod
.global puts
.global printf

.align 2
.LFizz_ptr: .word .LFizz
.LBuzz_ptr: .word .LBuzz
.LFizzBuzz_ptr: .word .LFizzBuzz
.Ldecformat_ptr: .word .Ldecformat

.align 2
.global fizzbuzz
.thumb_func
.type fizzbuzz, %function
fizzbuzz:
    push {r7, lr}
    add r7, sp, #8
    sub sp, sp, #0

    cmp r0, r1
    it gt
    bgt .Lfbexit

    push {r0, r1, r2, r3, r4, r5, r6}
    mov r6, r0 
    .Lfbloop:     
        mov r0, r6
        ldr r1, [sp, #8]
        bl __aeabi_idivmod
        cmp r1, #0
        it eq
        beq .Lfbfizz
        b .Lfbcheckbuzz
        .Lfbfizz:
            mov r0, r6
            ldr r1, [sp, #12]
            bl __aeabi_idivmod
            cmp r1, #0
            it eq
            beq .Lfbboth
            ldr r0, =.LFizz_ptr
            ldr r0, [r0]
            bl puts
            b .Lfbloopcheck
        .Lfbcheckbuzz:
            mov r0, r6
            ldr r1, [sp, #12]
            bl __aeabi_idivmod
            cmp r1, #0
            it eq
            beq .Lfbbuzz
            b .Lfbdec
        .Lfbbuzz:
            ldr r0, =.LBuzz_ptr
            ldr r0, [r0]
            bl puts
            b .Lfbloopcheck
        .Lfbboth:
            ldr r0, =.LFizzBuzz_ptr
            ldr r0, [r0]
            bl puts
            b .Lfbloopcheck
        .Lfbdec:
            ldr r0, =.Ldecformat_ptr
            ldr r0, [r0]
            mov r1, r6
            bl printf
        .Lfbloopcheck:
            add r6, r6, #1
            ldr r3, [sp, #4] 
            cmp r6, r3
            it le
            ble .Lfbloop
    pop {r0, r1, r2, r3, r4, r5, r6}
    mov r0, #0

    .Lfbexit:
        sub r7, r7, #8
        mov sp, r7
        pop {r7, lr}
        bx lr
.size fizzbuzz, .-fizzbuzz


.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    add r7, sp, #8

    mov r0, #1
    mov r1, #50
    mov r2, #3
    mov r3, #5
    bl fizzbuzz

    pop {r7, lr}
    bx lr
.size main, .-main
