.data
Tab_int: .word 1, -6, 10
Tab_float: .float 1.12, 12.4, -3.14
Tab_double: .double 1.1234, -69.234, 19.2318	
space: .asciiz " "
result1: .asciiz "\nElements of array of int is: \n"
result2: .asciiz "\nElements of array of float is: \n"
result3: .asciiz "\nElements of array of double is: \n"
.text
main:
#printing result message
la $a0, result1
li $v0, 4
syscall
#printing array 1
la $t0, Tab_int #load the address of first element
li $t1, 3 #size of the array
li $t2, 0 #counter

while_int:
beq $t2, $t1, print_float
lw $t3, ,($t0)
move $a0, $t3
li $v0, 1
syscall
#print space
la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 1
addi $t0, $t0, 4
j while_int


print_float:
la $a0, result2
li $v0, 4
syscall
la $t0, Tab_float #load the address of first element
li $t1, 3 #size of the array
li $t2, 0 #counter

while_float:
beq $t2, $t1, print_double
lwc1 $f4, ($t0)
mov.s $f12, $f4
li $v0, 2
syscall

la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 1 #increment the counter
addi $t0, $t0, 4 #go to next @
j while_float


print_double:
la $a0, result3
li $v0, 4
syscall

la $t0, Tab_double #load the address of first element
li $t1, 3 #size of the array
li $t2, 0 #counter

while_double:
beq $t2, $t1, exit
ldc1 $f6, ($t0)
mov.d $f12, $f6
li $v0, 3
syscall

la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 1
addi $t0, $t0, 8
j while_double

exit:
li $v0, 10
syscall


