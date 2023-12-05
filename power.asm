.data 
title: .asciiz "Calculating x power n \n"
msg_x: .asciiz "Enter a number to calculate its power \n"
msg_n: .asciiz "Enter n the power \n"
result: .asciiz "x power of n is: "
error_msg: .asciiz "can't calculating power"
.text
#printing program title
la $a0, title
li $v0, 4
syscall
#printing first message
la $a0, msg_x
li $v0, 4
syscall
#reading x
li $v0, 5
syscall
move $t0, $v0
ble, $t0, -1, error
#printing second message
la $a0, msg_n
li $v0, 4
syscall
#reading n
li $v0, 5
syscall
move $t1, $v0

li $t2, 1
power:
ble $t1, 0, end_power
mul $t2, $t2, $t0
subi $t1, $t1, 1
j power

end_power:
la $a0, result
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

error:
la $a0, error_msg
li $v0, 4
syscall

li $v0, 10
syscall
