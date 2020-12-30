fmt2:	.asciz " 100 - 15 = %d\n"
fmt3:	.asciz " 100 * 15 = %d\n"
fmt4: 	.asciz " 100 / 15 = %d\n"
		.align 	4

		.global main
main:	save		%sp, -96, %sp
		mov 		100, %l4 
		mov 		15, %l5
		set		fmt2,	%o0
		sub		%l4, %l5, %o1
		call 		printf
		nop

		mov 		%l4, %o0 
		mov 		%l5, %o1		! 곱셈인자전달
		call		.mul
		nop
		mov		%o0, %l2		! 곱셈결과 l2에 저장
		set		fmt3,	%o0
		mov		%l2,		%o1
		call 		printf
		nop

		mov 		%l4, %o0 
		mov 		%l5, %o1	
		call		.div
		nop
		mov		%o0, %l3
		set		fmt4,	%o0
		mov		%l3,		%o1
		call 		printf
		nop

		ret
		restore
