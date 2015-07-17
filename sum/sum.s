.syntax unified
.thumb

.text


.align 2
.global sum
.thumb_func
.type sum, %function
sum:
    push {r7, lr}
    
    add r0, r0, r1

    pop {r7, lr}
    bx lr
.size sum, .-sum


.align 2
.global main
.thumb_func
.type main, %function
main:
    push {r7, lr}
    
    mov r0, #1
    mov r1, #2
    bl sum

    pop {r7, lr}
    bx lr
.size main, .-main
