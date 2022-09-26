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
	
	# operation = input( character )
	li v0, 12
	syscall
	sw v0, operation
	
	print_special '\n'
	
	# switch(operation):
	lw t0, operation
	beq t0, 'q', _case_quit
	beq t0, 'c', _case_clear
	beq t0, '=', _case_equal
	beq t0, '+', _case_plus
	beq t0, '-', _case_minus
	beq t0, '*', _case_multiply
	beq t0, '/', _case_divide
	j _default
		_case_quit:
			# quits the program
			j _exit_program
		
		_case_clear:
			# clears the output
			
			j _exit_switch
	
		_case_equal:
			#
			
			j _exit_switch
		
		_case_plus:
			#
			
			j _exit_switch
			
		_case_minus:
			#
			
			j _exit_switch
			
		_case_multiply:
			# 
			
			j _exit_switch
			
		_case_divide:
			# 
			
			j _exit_switch
			
		_default:
			#
			
			j _exit_switch
	
	_exit_switch:
	
	# }
	j _loop
	
	
	_exit_program:
	li v0, 10
	syscall