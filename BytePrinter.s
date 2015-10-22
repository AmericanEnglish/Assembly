.data
buffer: .space 1000
max: .word 1000
prompt: .asciiz "String: "
nline: .asciiz "\n"
term: .byte 'a'
.text

main:
    li $v0, 4 # Print Prompty
    la $a0, prompt
    syscall

    li $v0, 8 # Gather String
    la $a0, buffer
    lw $a1, max
    syscall

    la $s1, buffer
    lb $s2, term
    jal loop
    li $v0, 10 # Exit
    syscall

loop:
    lbu $a0, ($s1)
    beq $a0, $zero, return
    li $v0, 11
    syscall
    addi $s1, $s1, 1
    b loop



return:
    jr $ra