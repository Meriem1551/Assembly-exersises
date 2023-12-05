.data
title: .asciiz "\nCONVERTING METERS TO KILOMETERS"
msg: .asciiz "\nEnter number of meters "
kilometer: .asciiz "\nThe number of kilometers is :"

.text
main:
#printing title
la $a0, title
li $v0, 4
syscall
#reading input from user
la $a0, msg
li $v0, 4
syscall
li $v0, 5 
syscall
move $t0, $v0

#converting the given number in meters to kilometers
div $t1, $t0, 1000

#printing result
la $a0, kilometer
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

#return to start of program
j main

#end
li $v0, 10
syscall