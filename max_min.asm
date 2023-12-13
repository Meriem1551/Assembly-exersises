.data
add: .word 200
msg: .asciiz "Enter size "
msg_in: .asciiz "\n Enter a number "
max: .asciiz "\nmax is: "
min: .asciiz "\nmin is "
.text
la $a0, msg
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

la $t1, add
li $t2, 0
read_while:
beq $t2, $t0, end_read_while
la $a0, msg_in
li $v0, 4
syscall
li $v0, 5
syscall
sw $v0, ($t1)
addi $t1, $t1, 4
addi $t2, $t2, 1
j read_while

end_read_while:
la $t1, add
li $t2, 0 #i
lw $t3, ($t1) #max = t[0] 
addi $t1, $t1, 4
addi $t2, $t2, 1
max_while:
beq $t2, $t0, end_max_while
lw $t4, ($t1)
ble $t4, $t3, end_if1
move $t3, $t4
end_if1:
addi $t1, $t1, 4
addi $t2, $t2, 1
j max_while
end_max_while:
la $a0, max
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall

#min
la $t1, add
li $t2, 0 #i
lw $t3, ($t1) #min = t[0] 
addi $t1, $t1, 4
addi $t2, $t2, 1
min_while:
beq $t2, $t0, end_min_while
lw $t4, ($t1)
bge $t4, $t3, end_if2
move $t3, $t4
end_if2:
addi $t1, $t1, 4
addi $t2, $t2, 1
end_min_while:
la $a0, min
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall


li $v0, 10
syscall


