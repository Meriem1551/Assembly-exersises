.data 
str: .asciiz "Hello Word"
.text
la $t2, str
move $a0, $t2
li $v0, 4
syscall
li $v0, 10
syscall