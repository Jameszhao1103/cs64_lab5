# print_array.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

#lab partner: Ziyue Wang
.data
	Array: .word 1 2 3 4 5 6 7 8 9 10
	Output: .asciiz "The contents of the array are:\n"

.text
main:
	li $v0, 4
	la $a0, Output
	syscall

	la $a0, Array
	li $a1, 10

	jal printA

printA:
	li $t2, 1
	la $t1, 0($a0)
	j loop
	
loop:
	bgt $t2 $a1 exit
	lw  $s0 ($t1)
	addi $t1 $t1 4

    li $v0 1  
    move $a0 $s0
    syscall

	add $t2 $t2 1
	
	j loop

exit:
	li $v0, 10
	syscall