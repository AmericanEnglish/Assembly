.data 
buffer:     .space 20 # Max Size
size:       .word 5 # Max Characters
message:    .asciiz "Do you liek mudkipz? "
nline:      .asciiz "\n"
.text
    la $s0, message # Load Message Location
    add $a0, $s0, $zero
    la $a1, buffer # Load Buffer location
    lw $a2, size # Load max ascii size
    li $v0, 54 # Gather User String
    syscall
    la $a0, ($a1) # Move Usr Str Address
    li $v0,4 # Print User String
    syscall
    add $a0, $a2, $zero # Move Length Of String
    li $v0, 1 # Pring Length
    syscall
