.data 
buffer:     .space 20 # Max Size
size:       .word 5 # Max Characters
compare:    .asciiz "Sample"
message:    .asciiz "Do you liek mudkipz? "
nline:      .asciiz "\n"

.text
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