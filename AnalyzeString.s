.data 
buffer:     .space 20 # Max Size
size:       .word 5 # Max Characters
compare:    .asciiz "Yas"
message:    .asciiz "Do you liek mudkipz? "
nline:      .asciiz "\n"

.text
main:
    la $a0, message # Print Message
    li $v0, 4
    syscall
    la $a0, buffer # Gather String
    lw $a1, size
    li $v0,8 
    syscall
    li $v0,4 # Print User String
    syscall
    la $a0, nline # Print newline
    syscall
    add $a0, $a1, $zero # Move Length Of String
    li $v0, 1 # Pring Length
    syscall
    # Do bit by bit comparison for strings Next
    li $t9, 0
    la $a0, buffer 
    la $a1, compare
     
    jal comparestr

comparestr: # Bytewise compare
    lbu $t0, ($a0)
    lbu $t1, ($a1)
    addi $t9, $t9, 1
    # beq

stringlen: # String Length

