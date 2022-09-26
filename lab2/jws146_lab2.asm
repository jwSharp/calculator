# Jacob Sharp
# JWS146

# preserves a0, v0
.macro print_str %str
	.data
	print_str_message: .asciiz %str
	.text
	push a0
	push v0
	la a0, print_str_message
	li v0, 4
	syscall
	pop v0
	pop a0
.end_macro

.data
	display: .word 0
	operation: .word 0
.text

.globl main
main:
	
	
	
	# end program
	li v0, 10
	syscall