.data
num1: .word 120	# number 1 (u)
num2: .word 78	# number 2 (v)
str1: .string "\n"
nums: .word 30 10

.text

main:
	lw s0, num1 # u
	lw s1, num2 # v
	# check u or v is 0
	beqz s1, print
	beqz s0, assign

# use Euclidean algorithm
loop:
	mv s2, s1
	rem s1, s0, s1
	mv s0, s2
	bnez s1, loop
	j print
	
assign:
	mv s0, s1
	j print

print:
	addi a7, x0, 1	# print_int ecall
	add a0, s0, x0	# integer
	ecall

exit:
