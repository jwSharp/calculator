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

main:
	