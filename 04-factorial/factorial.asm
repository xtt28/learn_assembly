section .text
    global _start
    extern printf   ; Include printf from libc

_start:
    mov rcx, 5      ; Loop counter and factorial operand
    mov rbx, 1      ; Factorial value

.loop:
    imul rbx, rcx   ; Multiply factorial value by loop counter

    dec rcx         ; Decrement counter
    cmp rcx, 0      ; Check if counter is zero
    jne .loop       ; If not zero, run another iteration of loop

    mov rdi, fmt    ; Add format as argument to printf
    mov rsi, rbx    ; Add factorial result as argument to printf
    xor rax, rax    ; Set rax to zero
    call printf     ; Invoke printf from libc

    mov rax, 60     ; Linux exit syscall
    xor rdi, rdi    ; Exit code 0 (success)
    syscall         ; Invoke exit syscall

section .data
    fmt: db "%d", 10, 0 ; Format for printing result