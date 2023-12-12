.data
msg: .asciiz "\n tableau: "
msg_s: .asciiz "\n Enter size: "
msg_fin: .asciiz "\n End of insertion"
msg_value: .asciiz "\n Enter elements of this array "
msg_print: .asciiz "\n Start printing the array \n"
space: " "
add_item: .asciiz "enter an item "
adress_t: .word 2000
.text
la $a0, msg
li $v0, 4
syscall

la $a0, msg_s
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0
li $t1, 0
la $t2, adress_t
boucle:
beq $t1, $t0, fin_boucle
la $a0, msg_value
li $v0, 4
syscall
li $v0, 5
syscall

sw $v0, ($t2)

addi $t2, $t2, 4
addi $t1, $t1, 1
j boucle

fin_boucle:
la $a0, msg_fin
li $v0, 4
syscall

la $a0, add_item
li $v0, 4
syscall

li $v0, 5
syscall
sw $v0, ($t2)
addi $t2, $t2, 4
addi $t0, $t0, 1
#print array
la $a0, msg_print
li $v0, 4
syscall

la $t2, adress_t
li $t1, 0
boucle2:
beq $t1, $t0, fin_boucle2
lw $a0, ($t2)
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
addi $t2, $t2, 4
addi $t1, $t1, 1
j boucle2

fin_boucle2:

li $v0, 10
syscall
