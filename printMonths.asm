.data
title: .asciiz "\nPrinting month"
msg: .asciiz "\nEnter a monthe in number "
month_in_letter: .asciiz "\nThe corresponding month to your number is: "
month1: .asciiz "january"
month2: .asciiz "february"
month3: .asciiz "march"
month4: .asciiz "april"
month5: .asciiz "may"
month6: .asciiz "june"
month7: .asciiz "july"
month8: .asciiz "august"
month9: .asciiz "september"
month10: .asciiz "october"
month11: .asciiz "november"
month12: .asciiz "december"
.text
start:
#Displaying title:
la $a0, title
li $v0, 4
syscall

#Reading number from user:

la $a0, msg
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

#Checking the number
beq $t0, 1, jan
beq $t0, 2, feb
beq $t0, 3, mar
beq $t0, 4, apr
beq $t0, 5, may
beq $t0, 6, june
beq $t0, 7, july
beq $t0, 8, aug
beq $t0, 9, sep
beq $t0, 10, oct
beq $t0, 11, nov
beq $t0, 12, dec
beq $t0, -1, end
jan:
la $a0, month1
li $v0, 4
syscall
j start

feb:
la $a0, month2
li $v0, 4
syscall
j start

mar:
la $a0, month3
li $v0, 4
syscall
j start
apr:
la $a0, month4
li $v0, 4
syscall
j start

may:
la $a0, month5
li $v0, 4
syscall
j start

june:
la $a0, month6
li $v0, 4
syscall
j start

july:
la $a0, month7
li $v0, 4
syscall

aug:
la $a0, month8
li $v0, 4
syscall
j start

sep:
la $a0, month9
li $v0, 4
syscall

oct:
la $a0, month10
li $v0, 4
syscall
j start

nov:
la $a0, month11
li $v0, 4
syscall
j start

dec:
la $a0, month12
li $v0, 4
syscall
j start

#End of program
end:
li $v0, 10
syscall