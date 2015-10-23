# Hide and Find
.data
list:   .space 400
prompt: .asciiz "Number To Hide: "
com:    .asciiz ", "

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

hide:
    li $a1, 9 # Gather random column
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
    add $s2, $s1, $t0 # Adjust memory pointer
    add $s2, $s2, $t8
    sw $s1, ($s2) # Store the user int here