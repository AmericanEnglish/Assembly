.data
buffer: .space 1000
max: .word 1000
prompt: .asciiz "String: "
nline: .asciiz "\n"
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
    jal loop
    li $v0, 8 # Exit
    syscall

loop:
    li $t1, 00
    lbu $a0, ($s1)
    beq $t1, $a1, return
    li $v0, 11
    syscall
    addi $s1, $s1, 4
    b loop



return:
    jr $ra