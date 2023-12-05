.data
title: .asciiz "Calculating average of n integer\n"
msg_N: .asciiz "Enter how many numbers do you want to claculate their average \n"
msg_numbers: .asciiz "Enter a number \n"
result: .asciiz "The average of your numbers is: "
.text
la $a0, title
li $v0, 4
syscall

la $a0, msg_N
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0
move $t3, $v0 #save the number of numbers
li $t1, 0

numbers:
ble $t0, 0, average
la $a0, msg_numbers
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0
add $t1, $t1, $t2
subi $t0, $t0, 1
j numbers

average:
div $t4, $t1, $t3
j end_average

end_average:
la $a0, result
li $v0, 4
syscall
move $a0, $t4
li $v0, 1
syscall

li $v0 , 10
syscall
