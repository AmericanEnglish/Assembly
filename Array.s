    .data
list:   .space  400 # Reserve 400 bytes == 100 words == 10x10 matrix
size:   .word   100 # 100 item array

    .text
main:
    lw $s0, size # load in array length
    la $s1, list # load in list start
    li $t0, 0 # Element counter