# Jacob Sharp jws146

.global main

main:
	registers:
		# load immediates into registers
		li t0, 1
		li t1, 2
		li t2, 3
		
		# move values between registers
		move a0, t0 # a0 = t0
		move v0, t1 # v0 = t1
		move t2, zero # t2 = 0
	
	explore:
		# hexidecimal with li
		move t3, t0
		li t0, 0xF00D
		move t0, t3
		move t3, zero
		
		# zero register cannot be changed
		li zero, 10

	output:
		# print(123)
		li a0, 123
		li v0, 1
		syscall
		
		# print(\n)
		li a0, '\n'
		li v0, 11
		syscall
		
		# print(456)
		li a0, 456
		li v0, 1
		syscall
	
	input:
		## integer
		
		# print(\n)
		li a0, '\n'
		li v0, 11
		syscall
		
		# v0 = input(int( ))
		li v0, 5
		syscall
		
		# print( v0 )
		move a0, v0
		li v0, 1
		syscall
		
		
		## float
		
		# print(\n)
		#li a0, '\n'
		#li v0, 11
		#syscall
		
		# f0 = input(float( ))
		#li v0, 6
		#syscall
		
		# print( f0 )
		#move f12, f0
		#li v0, 2
		#syscall
		
		