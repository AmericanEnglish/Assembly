.data
list:   .space  400 # Reserve 400 bytes == 100 words == 10x10 matrix
size:   .word   100 # 100 item array, used as an endpoint in conjunction with the counter
row: .asciiz "Row: "
col: .asciiz "Col: "
val: .asciiz "Val: "

nline: .asciiz "\n"

.text
main:
    lw $s0, size # load in array length
    la $s1, list # load in list start
    li $t0, 0 # Element counter
    jal init # Initialize
    jal prompt # Prompt User
    li $v0, 10 # Done
    syscall # Exit

init:
    beq $t0, $s0, return2 # if t == s, return
    li $v0, 42 # RNGESUS
    li $a1, 9
    syscall
    sw $a0, ($s1) # Put Value in MemAddr $s1
    addi $s1, $s1, 4 # Increment Memory
    addi $t0, $t0, 1 # Increment Counter
    j init # Restart Loop

return2:
    jr $ra

prompt:
    la $a0, row # Collect row value
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    beq $v0, $zero, return2 # If row == 0 terminate
    add $t0, $v0, $zero # Move row val
    
    la $a0, col # Collect col value
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    beq $v0, $zero, return2 # If col == 0 terminate
    add $t1, $v0, $zero # Move col val
    
    li $t3, 1     # Subtract 1 to account for 0 termination
    sub $t1, $t1, $t3
    sub $t0, $t0, $t3

    li $t3, 40 # Adjusting row val to match memory place
    mult $t0, $t3 
    mflo $t0
    
    li $t3, 4 # Adjust col val to match memory place
    mult $t1, $t3
    mflo $t1
    
    add $t0, $t0, $t1 # Memory Adjustment
    la $s1, list # Prep array for increment
    add $s1, $s1, $t0
    
    la $a0, val # Print Val Message
    li $v0, 4
    syscall
    lw $a0, ($s1) # Load value
    li $v0, 1
    syscall
    la $a0, nline # Print newline
    li $v0, 4
    syscall
    la $a0, nline # Print newline
    li $v0, 4
    syscall
    j prompt
