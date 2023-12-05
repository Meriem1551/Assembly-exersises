.data
title: .asciiz "Convering hours to minutes"
msg: .asciiz "\nEnter number of hours "
res_min: .asciiz "\nNumber of minutes in this hour is: "
res_sec: .asciiz "\nNumber of seconds in this hour is: "
.text
#Print title
la $a0, title
li $v0, 4
syscall

#taking input from user
la $a0, msg
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

#Converting hours to minutes

mul $t1, $t0, 60

#print result
la $a0, res_min
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

#Converting hours to seconds

mul $t2, $t0, 3600

#print result
la $a0, res_sec
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

#end of program
li $v0, 10
syscall


