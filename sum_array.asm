.data
msg: .asciiz "CALCULATING AND PRINTING SUM OF ARRAY"
size: .asciiz "\n Enter size of this array "
array_msg: .asciiz "\nEnter a number "
end_msg: "\nThanks for filling the array\n"
sum_msg: .asciiz "Sum of the array items is: "
arr_adress: .word 300
.text
la $a0, msg
li $v0, 4
syscall

la $a0, size
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $t1, arr_adress
li $t2, 0

while:
beq $t2, $t0, end_while
la $a0, array_msg
li $v0, 4
syscall
li $v0, 5
syscall
sw $v0, ($t1)
addi $t1, $t1, 4
addi $t2, $t2, 1
j while

end_while:
la $a0, end_msg
li $v0, 4
syscall

la $a0, sum_msg
li $v0, 4
syscall

la $t1, arr_adress
li $t2, 0
li $t3, 0
boucle:
beq $t2, $t0, fin_boucle
lw $t4, ($t1)
add $t3, $t3, $t4
addi $t1, $t1, 4
addi $t2, $t2, 1
j boucle

fin_boucle:
move $a0, $t3
li $v0, 1
syscall

li $v0, 10
syscall