.data
hello_msg:    .asciiz "Hello Olivetian World!"
.text
main:
    li $v0, 4
    la $a0, hello_msg
    syscall
    li $v0, 10
    syscall