.data
title: .asciiz "CALCULATE FACTORIAL\n"
msg: .asciiz "Enter a number please \n"
result: .asciiz "Factorial of your number is: "
error_msg: .asciiz "Can't calculate the factorial of this number"
.text
#printing program's title
la $a0, title
li $v0, 4
syscall
#Ask user for a number
la $a0, msg
li $v0, 4
syscall
#read the number
li $v0, 5
syscall
move $t0, $v0
ble $t0, -1, error
#initializing t1 with 1 for multiplying
li $t1, 1
fact:
ble $t0, 1, end_fact
mul $t1, $t1, $t0
subi $t0, $t0, 1 #substruct immediat
j fact

end_fact:
la $a0, result
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

error:
la $a0, error_msg
li $v0, 4
syscall


li $v0, 10
syscall


