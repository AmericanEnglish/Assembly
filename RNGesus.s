.data 
total:  .asciiz "N = "
boundary:   .asciiz "Upper Boundary = "
nline: .asciiz "\n"
seperator: .asciiz ", "
.text
main:
    la $a0, total # Gather total to print
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    add $a2, $a0, $zero
    la $a0, boundary # Gather Upper Bound
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    add $a1, $a0, $zero
    li $t0, 0   # Prep for loop
    li $v0, 42
    jal loop
    la $a0, nline # Exit
    li$v0, 4
    syscall
    li $v0, 10
    syscall

loop:
    beq $a2, $t0, return # Check for completion
    li $v0, 42 # Print random number
    syscall
    li $v0, 1
    syscall
    la $a0, seperator
    li $v0, 4
    syscall
    addi $t0, $t0, 1 # Increment
    b loop

return:
    jr $ra
