# conversion.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

#lab partner: Ziyue Wang
.text
conv:
    li $t0 0
	li $t1 5
	li $t3 2
	li $t4 3

	j for_loop

for_loop:
	bge $t0, $t1 end_loop
	mult $a0 $t3
	mflo $t2
	add $v0 $v0 $t2
	sub $v0 $v0 $a1

	bge $a0 $t4 y_small
	addi $a0 $a0 1
	addi $t0 $t0 1

	j for_loop

end_loop:
	jr $ra

y_small:
	sub $a1 $a1 1
	j return_loop

return_loop:
	addi $a0 $a0 1
	addi $t0 $t0 1

	j for_loop



main:
	li $a0 5
	li $a1 7
	move $v0 $t0
	jal conv
	move $t5 $v0

	li $v0 1
	move $a0 $t5
	syscall

exit:
	li $v0 10
	syscall
