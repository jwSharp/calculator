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

.macro print_special %str
# prints a special character
	.data
	character: %str
	newline: .asciiz "newline"
	tab: .asciiz "tab"
	.text
	push a0
	push a1
	push v0
	
	# switch(character):
	_switch_character:
		la a0, character
		
		# if(character == "newline"):
		la a1, newline
		beq a0, a1, _case_newline
		
		# elif(character == "tab"):
		la a1, newline
		beq a0, a1, _case_tab
		
		# else: # invalid character
		j _default
		
		_case_newline:
			li a0, '\n'
			li v0, 11
			syscall
			j _break
			
		_case_tab:
			li a0, '\t'
			li v0, 11
			syscall
			j _break
		
		_default:
			print_str "Invalid character"
		_break:
	
	pop a0
	pop a1
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
	
	# while(True) {
_loop:
	# print(display)
	lw a0, display
	li v0, 1
	syscall
	
	# print("Operation (=,+,-,*,/,c,q):")
	print_str "Operation (=, +, -, *, /, c, q:"
	
	
	# }
	#j _loop
	
	
	# end program
	li v0, 10
	syscall