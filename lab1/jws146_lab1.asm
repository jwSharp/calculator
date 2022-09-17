# Jacob Sharp jws146

.global main
main:
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
		
		li zero, 10 # zero register cannot be changed

	