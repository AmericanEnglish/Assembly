# Hide and Leaf
.data
list:   .space 400
size: .word 99 # Think about this like index 99 
prompt: .asciiz "Number To Hide: "
comma:    .asciiz ", "
loc:    .asciiz "Location: "

.text
main:
    la $s0, list # Load Space
    la $a0, prompt # Gather Number
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    add $s1, $v0, $zero # Move user int to saved register
    jal hide
    lw $a3, size # Prep for find
    li $a0, 0
    jal find
    li $v0, 10
    syscall


hide:
    li $a1, 10 # Gather random column
    li $v0, 42
    syscall 
    add $t0, $a0, $zero
    syscall # Gather random column
    add $t8, $a0, $zero
    li $t1, 40 # Adjust row value
    mult $t0, $t1
    mflo $t0
    li $t1, 4 # Adjust column value
    mult $t8, $t1
    mflo $t8
    add $s2, $s0, $t0 # Adjust memory pointer
    add $s2, $s2, $t8
    sw $s1, ($s2) # Store the user int here
    j return


find: # Leaf demonstration
    addiu $sp, $sp, -4 # Allocate memory on the stack
    sw $ra, ($sp) # Store the return counter
    jal search
    lw $ra, ($sp) # Load return counter back
    addiu $sp, $sp, 4 # Restore stack
    addi $a3, $a3, 1 # This is out of range of the array
    blt $a0, $a3, success # If not out of range, success
    j fail


search:
    lw $t0, ($s0)
    beq $t0, $s1, return 
    addi $a0, $a0, 1
    addi $s0, $s0, 4
    bgt $a0, $a3, return
    b search



pass:
    li $t2, 10 # Detect row, column
    div $a0, $t2
    mflo $t0 # Move row
    mfhi $t1 # Move column
    la $a0, loc # Print location
    li $v0, 4
    syscall
    add $a0, $t0, $zero
    li $v0, 1
    syscall
    la $a0, comma
    li $v0, 4
    syscall
    add $a0, $t1, $zero
    li $v0, 1
    syscall
    b return

fail:
    la $a0, loc
    li $v0, 4
    syscall
    li $a0, -1
    li $v0, 1
    syscall
    b return

return:
    jr $ra
