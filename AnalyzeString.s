.data 
buffer:     .space 20 # Max Size
size:       .word 5 # Max Characters
message:    .asciiz "Do you liek mudkipz? "
nline:      .asciiz "\n"
.text
    la $s0, message # Load Message Location
    la $s1, nline # Load newline
    la $s2, buffer # Load budder location

    la $a0, ($s0) # Print Message
    li $v0, 4
    syscall
    la $a0, ($s2) # Gather String
    lw $a1, size
    li $v0,8 
    syscall
    li $v0,4 # Print User String
    syscall
    add $a0, $a1, $zero # Move Length Of String
    li $v0, 1 # Pring Length
    syscall
