.data
a: .word 0
b: .word 0
result: .word 0
prompt_a: .asciiz "Enter a the first number: "
prompt_b: .asciiz "Enter b the second number: "
op_choice: .asciiz "choose an operation\n1: Addition\n2: Substraction\n3: Multiplication\n4: Division: \n"
choice: .asciiz "What's your choice (1-4): "
result_mesg: .asciiz "Result is: "
.text
.globl main
main:
#Print prompt_a to user
li $v0, 4
la $a0, prompt_a
syscall
#Read a from user
li $v0, 5
syscall
sw $v0, a
#Print prompt_b to user
li $v0, 4
la $a0, prompt_b
syscall
#Read b from user
li $v0, 5
syscall
sw $v0, b
#Shwo menu to user
li $v0, 4
la $a0, op_choice
syscall
#Asking user to choose
li $v0, 4
la $a0, choice
syscall
#Read the user's choice
li $v0, 5
syscall
move $t0, $v0
#load a and b values
lw $t1, a
lw $t2, b
#Check the user's choice
beq $t0, 1, Addition
beq $t0, 2, Substraction
beq $t0, 3, Multiplication
beq $t0, 4, Division
#Invalid choice
li $v0, 10
syscall
Addition:
add $t3, $t1, $t2
j PrintResult
Substraction:
sub $t3, $t1, $t2
j PrintResult
Multiplication:
mul $t3, $t1, $t2
j PrintResult
Division:
div $t3, $t1, $t2
j PrintResult
#Print the result
PrintResult:
#store the result
sw $t3, result

#pritn the result message
li $v0, 4
la $a0, result_mesg
syscall
#print the result
lw $a0, result
li $v0, 1
syscall
#End of program
li $v0, 10
syscall
