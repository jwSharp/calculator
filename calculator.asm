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
	print_str "Choose an operation (=, +, -, *, /, %, c, q:"
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
	beq t0, '%', _case_remainder
	beq t0, '/', _case_divide
	j _default
		_case_quit:
			# quits the program
			
			print_str "Exiting program."
			print_special '\n'
			j _exit_program
		
		_case_clear:
			# resets the display value to 0
			
			print_str "Clearing..."
			
			# display = 0
			li t0, 0
			sw t0, display
			
			print_str "Cleared."
			j _exit_switch
	
		_case_equal:
			# sets the display value
			
			print_str "What value would you like to set to:"
			print_special '\t'
			
			# display = input( int )
			li v0, 5
			syscall
			sw v0, display
			
			j _exit_switch
		
		_case_plus:
			# adds to the display value
			print_str "What value would you like to add:"
			print_special '\t'
			
			# display += input( int )
			li v0, 5
			syscall
			lw t0, display
			add t0, t0, v0
			sw t0, display
			
			j _exit_switch
			
		_case_minus:
			# subtracts from the display value
			print_str "What value would you like to subtract:"
			print_special '\t'
			
			# display -= input( int )
			li v0, 5
			syscall
			lw t0, display
			sub t0, t0, v0
			sw t0, display
			
			j _exit_switch
			
		_case_multiply:
			# multiplies with the display value
			print_str "What value would you like to multiply:"
			print_special '\t'
			
			# display *= input( int )
			li v0, 5
			syscall
			lw t0, display
			mul t0, t0, v0
			sw t0, display
			
			j _exit_switch
			
		_case_divide:
			# floor divides the display value by another value
			print_str "What value would you like to floor divide by:"
			print_special '\t'
			
			# display //= input( int )
			li v0, 5
			syscall
			lw t0, display
			div t0, t0, v0
			sw t0, display
			
			j _exit_switch
			
		_case_remainder:
			print_str "What value would you like to divide by:"
			print_special '\t'
			
			# display %= input( int )
				# t1 = display // input( int )
				li v0, 5
				syscall
				lw t0, display
				div t1, t0, v0
				
				# t2 = ( t1 ) * input( int )
				mul t2, t1, v0
				
				#  t3 = display - ( t2 )
				sub t3, t0, t2
				
				sw t3, display
				
			j _exit_switch
			
		_default:
			# Invalid character
			print_str "Invalid character."
			print_special '\n'
	
	_exit_switch:
	
	j _loop
	
	
	_exit_program:
	li v0, 10
	syscall