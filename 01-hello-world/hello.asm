global _start

section .text

_start:
    mov rax, 1       ; linux write(2)
    mov rdi, 1       ; stdout
    mov rsi, message ; message
    mov rdx, 13      ; num of bytes
    syscall          ; invoke

    mov rax, 60
    mov rdi, 0
    syscall          ; invoke

section .data
    message: db "Hello, World", 10