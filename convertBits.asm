.data
title: .asciiz "\nConverting bits to byte, Kbyte, Mbyte, Gbyte"
msg: .asciiz "\nEnter number of bits "
res_byte: .asciiz "\nnumber of bytes is: "
res_kbyte: .asciiz "\nnumber of Kbytes is: "
res_mbyte: .asciiz "\nnumber of Mbytes is: "
res_gbyte: .asciiz "\nnumber of Gbytes is: "
.text
#printing program's title
la $a0, title
li $v0, 4
syscall

#taking number from user

la $a0, msg
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0

#converting to byte

div $t1, $t0, 8

#print result

la $a0, res_byte
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

#converting to kbyte

div  $t2, $t1, 1024

#print result

la $a0, res_kbyte
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

#converting to mbyte

div  $t3, $t2, 1024

#print result

la $a0, res_mbyte
li $v0, 4
syscall
move $a0, $t3
li $v0, 1
syscall

#converting to gbyte

div $t4, $t3, 1024

#print result

la $a0, res_mbyte
li $v0, 4
syscall
move $a0, $t4
li $v0, 1
syscall

#end
li $v0, 10
syscall
