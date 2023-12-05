.data
title: .asciiz "Calculating sum of 10 first integers\n"
result: .asciiz "The sum of 10 first integers is: "
.text
la $a0, title
li $v0, 4
syscall
li $t0, 10
li $t1, 0
sum:
ble $t0, 0, end_sum
add $t1, $t1, $t0
subi $t0, $t0, 1
j sum

end_sum:
la $a0, result
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall
