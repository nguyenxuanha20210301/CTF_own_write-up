.arch armv8-a
	.file	"chall.c"
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	sub	sp, sp, #16     
	str	w0, [sp, 12]	
	str	w1, [sp, 8]	
	ldr	w1, [sp, 12]	
	ldr	w0, [sp, 8]	
	cmp	w1, w0		
	bls	.L2	
	ldr	w0, [sp, 12]	
	b	.L3
.L2:
	ldr	w0, [sp, 8]  
.L3:
	add	sp, sp, 16
	ret -> noi chung nhiem vu cua func1 la truyen hai tham so va tra ve gia tri lon hon, register dam nhan luu tru gia tri tra ve tai w0
	.size	func1, .-func1
	.section	.rodata
	.align	3
.LC0:
	.string	"Result: %ld\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]! 
	add	x29, sp, 0     
	str	x19, [sp, 16] 
	str	w0, [x29, 44] 
	str	x1, [x29, 32]
	ldr	x0, [x29, 32]  ;arg0
	add	x0, x0, 8	;arg1
	ldr	x0, [x0] ;arg1 = "182476535'
	bl	atoi
	mov	w19, w0  ;w0 = w19 = 182476535
	ldr	x0, [x29, 32] ;
	add	x0, x0, 16  ;arg2
	ldr	x0, [x0]; arg2 = "3742084308"
	bl	atoi
	mov	w1, w0   ; w1 = w0 = 3742084308
	mov	w0, w19  ; w0 = 182476535
	bl	func1 ;return greater value
	mov	w1, w0 ; w0 = w1 =3742084308
	adrp	x0, .LC0; "Result: %ld\n"
	add	x0, x0, :lo12:.LC0 ;"-> result: 3742084308 -> hex(3742084308) -> '0xdf0bacd4' -> flag
	bl	printf; 
	mov	w0, 0; 
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
