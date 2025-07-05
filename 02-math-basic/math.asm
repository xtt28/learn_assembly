global _start

section .text
    extern printf

_start:
    mov rax, 10     ; first operand
    mov rbx, 3      ; second operand
    imul rax, rbx   ; multiply (30)
    mov rdi, msg    ; add message as printf argument
    mov rsi, rax    ; add result as printf argument
    call printf     ; invoke printf from libc

    mov rax, 60     ; linux syscall exit(2)
    mov rdi, 0      ; exit code 0 success
    syscall         ; invoke syscall

section .data
    msg: db "%d", 10, 0