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

.macro print_newline
	li a0, '\n'
	li v0, 11
	syscall
.end_macro

.macro print_tab
	li a0, '\t'
	li v0, 11
	syscall
.end_macro

.macro print_special %character
	# prints a special character
	push a0
	push v0
	
	# breaks with invalid character
	li a0, %character
	li v0, 11
	syscall
	
	pop a0
	pop v0
.end_macro

.data
	display: .word 0
	operation: .word 0
.text

.globl main
main:
	# print( "Hello. Welcome!" )
	print_str "Hello. Welcome!"
	
	# print('\n')
	li a0, '\n'
	li v0, 11
	syscall
	
	# while(True) {
_loop:
	# print("display = ", display, "\n")
	print_str "display = "
	lw a0, display
	li v0, 1
	syscall
	print_special '\n'
	
	# print("\nChoose an operation (=,+,-,*,/,c,q):\t")
	print_special '\n'
	print_str "Choose an operation (=, +, -, *, /, c, q:"
	print_special '\t'
	
	# v0 = input( character )
	li v0, 12
	syscall
	print_special '\n'
	
	
	
	# }
	j _loop
	
	
	# end program
	li v0, 10
	syscall