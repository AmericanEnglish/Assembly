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
    add $s0, $v0, $zero
    la $a0, boundary # Gather Upper Bound
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    add $a1, $v0, $zero
    jal loop
    la $a0, nline # exit
    li $v0, 4
    syscall
    li $v0, 10 
    syscall

loop:
    blez $s0, return # Check for completion
    li $v0, 42 # Print random number
    syscall
    li $v0, 1
    syscall
    la $a0, seperator
    li $v0, 4
    syscall
    sub $s0, $s0, 1 # Increment
    b loop

return:
    jr $ra
