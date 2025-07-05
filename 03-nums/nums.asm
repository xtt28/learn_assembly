global _start

section .text
    extern printf   ; Include printf from libc

_start:
    mov rbx, 10     ; Starting loop counter: 10

.loop_start:
    mov rdi, msg    ; Set first printf argument to msg
    mov rsi, rbx    ; Set second printf argument to counter value
    xor rax, rax    ; Set rax to 0
    call printf     ; Invoke printf from libc

    dec rbx         ; Decrement loop counter
    cmp rbx, -1     ; Check if rbx became -1
    jne .loop_start ; If not, go back to loop start

    mov rax, 60     ; Linux exit syscall
    xor rdi, rdi    ; Exit success
    syscall         ; Invoke syscall

section .data
    msg: db "%d", 10, 0 ; printf format