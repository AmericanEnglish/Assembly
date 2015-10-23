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
    li $t1, 4
    mult $t0, $t1
    mflo $t0
    li