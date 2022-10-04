# Jacob Sharp
# jws146

.macro print_str %str
	.data
		string: .asciiz %str
	.text
	push a0
	push v0
	
	la a0, string
	li v0, 4
	syscall
	
	pop a0
	pop v0
.end_macro

.macro print_special %char
	push a0
	push v0
	
	li a0, character
	li v0, 11
	syscall
	
	pop a0
	pop v0
.end_macro


# create an array of 5 elements of size int
.eqv ARR_LEN 5
.data
	arr: .word 100, 200, 300, 400, 500
	message: .asciiz "Testing!"
.text


.global main
main:
	jal input_array
	
	jal print_array
	
	jal print_message
	
	jal exit
	
input_array:
	push ra
	
	# for(t0 = 0; t0 < ARR_LEN; t0++)
	li t0, 0
	_loop:
		# t0 < ARR_LEN
		beq t0, ARR_LEN, _end_loop
		bgt t0, ARR_LEN, _end_loop
		
		
		
		add t0, t0, 1 # t0++
		j _loop
		
		
	_end_loop:
	
	
	pop ra
	jr ra
	
print_array:
	push ra
		
	
	pop ra
	jr ra
	
print_message:
	push ra
	
	
	pop ra
	jr ra

exit:
	li v0, 10
	syscall