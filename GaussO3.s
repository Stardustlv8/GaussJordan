	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"Gauss.c"
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	mod
	.type	mod, %function
mod:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	rsblt	r0, r0, #0
	mov	r0, r0, asl #16
	stmfd	sp!, {r4, lr}
	mov	r0, r0, asr #16
	bl	__aeabi_idivmod
	mov	r1, r1, asl #16
	mov	r0, r1, asr #16
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	mod, .-mod
	.align	2
	.global	shiftDown
	.type	shiftDown, %function
shiftDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r2, r1, #1
	mov	r3, #1
	add	r0, r0, r3, asl r2
	mov	r0, r0, asr r1
	bx	lr
	.size	shiftDown, .-shiftDown
	.align	2
	.global	addScalarMultipleOfLine
	.type	addScalarMultipleOfLine, %function
addScalarMultipleOfLine:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r6, [sp, #36]
	sub	fp, r6, #1
	cmp	fp, #0
	mov	r4, r1
	mov	r5, r3
	ldrsh	r8, [sp, #32]
	ble	.L8
	ldr	ip, [r0, r2, asl #2]
	ldr	r1, [r1, r2, asl #2]
	ldr	r4, [r4, r3, asl #2]
	ldr	r0, [r0, r5, asl #2]
	mov	r3, r6, asl #1
	sub	r3, r3, #4
	mov	r2, fp, asl #1
	add	r6, r0, r3
	add	r7, ip, r3
	add	r5, r4, r3
	add	r9, r1, r3
	add	sl, r1, r2
	add	r0, r0, r2
	add	ip, ip, r2
	add	r4, r4, r2
.L7:
	ldrsh	r1, [ip], #-4
	mul	r3, r1, r8
	ldrh	r2, [r0, #0]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r0], #-4	@ movhi
	ldrsh	r1, [sl], #-4
	mul	r3, r1, r8
	ldrh	r2, [r4, #0]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r4], #-4	@ movhi
	ldrsh	r1, [r7], #-4
	mul	r3, r1, r8
	ldrh	r2, [r6, #0]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r6], #-4	@ movhi
	ldrsh	r3, [r9], #-4
	mul	r2, r3, r8
	ldrh	r1, [r5, #0]
	add	r2, r2, #4
	sub	fp, fp, #2
	add	r1, r1, r2, asr #3
	cmp	fp, #0
	strh	r1, [r5], #-4	@ movhi
	bgt	.L7
.L8:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	addScalarMultipleOfLine, .-addScalarMultipleOfLine
	.global	__aeabi_idiv
	.align	2
	.global	divideRowByConst
	.type	divideRowByConst, %function
divideRowByConst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	sl, r3, #0
	mov	r8, r0
	mov	r7, r1
	mov	r6, r2
	ble	.L14
	mov	r5, #0
	mov	r4, r5
.L13:
	ldrsh	r0, [r8, r4]
	mov	r1, r6
	bl	__aeabi_idiv
	strh	r0, [r8, r4]	@ movhi
	mov	r1, r6
	ldrsh	r0, [r7, r4]
	bl	__aeabi_idiv
	add	r5, r5, #1
	cmp	sl, r5
	strh	r0, [r7, r4]	@ movhi
	add	r4, r4, #2
	bgt	.L13
.L14:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
	.size	divideRowByConst, .-divideRowByConst
	.align	2
	.global	swapRows
	.type	swapRows, %function
swapRows:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r6, [sp, #16]
	cmp	r6, #0
	mov	ip, r2
	ble	.L19
	ldr	r5, [r1, r3, asl #2]
	ldr	r1, [r1, r2, asl #2]
	mov	r2, #0
	ldr	r4, [r0, r3, asl #2]
	ldr	r0, [r0, ip, asl #2]
	mov	ip, r2
.L18:
	ldrh	r3, [r0, ip]
	ldrh	r7, [r4, ip]
	strh	r7, [r0, ip]	@ movhi
	strh	r3, [r4, ip]	@ movhi
	add	r2, r2, #1
	ldrh	r3, [r1, ip]
	ldrh	r7, [r5, ip]
	cmp	r6, r2
	strh	r7, [r1, ip]	@ movhi
	strh	r3, [r5, ip]	@ movhi
	add	ip, ip, #2
	bgt	.L18
.L19:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.size	swapRows, .-swapRows
	.align	2
	.global	printMatrix
	.type	printMatrix, %function
printMatrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	subs	r8, r1, #0
	movgt	sl, #0
	mov	r7, r0
	movgt	r6, sl
	ble	.L26
.L23:
	mov	r5, #0
	b	.L25
.L24:
	mov	r1, r1, asl #16
	mov	r1, r1, asr #16
	eor	r2, r1, r1, asr #31
	sub	r2, r2, r1, asr #31
	mov	r2, r2, asl #16
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #29
	add	r2, r3, r2, asr #16
	and	r2, r2, #7
	rsb	r2, r3, r2
	cmp	r1, #0
	add	ip, r1, #7
	mov	r3, r2, asl #7
	movlt	r1, ip
	sub	r3, r3, r2, asl #2
	ldr	r0, .L29
	add	r2, r3, r2
	mov	r1, r1, asr #3
	bl	printf
	cmp	r8, r5
	ble	.L28
.L25:
	ldr	r3, [r7, r6]
	mov	r4, r5, asl #1
	ldrsh	r1, [r3, r4]
	ldr	r0, .L29+4
	bl	printf
	ldr	r2, [r7, r6]
	ldrh	r1, [r2, r4]
	add	r3, r1, #7
	mov	r3, r3, asl #16
	cmp	r3, #393216
	add	r5, r5, #1
	bhi	.L24
	mov	r0, #45
	bl	putchar
	ldr	r3, [r7, r6]
	ldrh	r1, [r3, r4]
	b	.L24
.L28:
	add	sl, sl, #1
	mov	r0, #10
	bl	putchar
	cmp	r8, sl
	add	r6, r6, #4
	bgt	.L23
.L26:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LC1
	.word	.LC0
	.size	printMatrix, .-printMatrix
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #44
	str	r0, [sp, #8]
	mov	r0, r1, asl #2
	mov	fp, r1
	bl	malloc
	cmp	fp, #0
	str	r0, [sp, #12]
	ble	.L32
	mov	r4, #0
	mov	r6, fp, asl #1
	mov	r5, r4
.L37:
	mov	r0, r6
	bl	malloc
	ldr	r2, [sp, #12]
	mov	r1, r4, asl #1
	str	r0, [r2, r5]
	mov	r2, #0
	b	.L36
.L58:
	ldr	lr, [sp, #12]
	ldr	r0, [lr, r5]
.L36:
	cmp	r4, r2
	movne	r3, r2, asl #1
	moveq	r3, #8	@ movhi
	movne	ip, #0	@ movhi
	add	r2, r2, #1
	streqh	r3, [r0, r1]	@ movhi
	strneh	ip, [r0, r3]	@ movhi
	cmp	fp, r2
	bgt	.L58
	add	r4, r4, #1
	cmp	fp, r4
	add	r5, r5, #4
	bgt	.L37
	sub	r0, fp, #1
	mov	ip, #1
	mov	lr, r0, asl ip
	mov	r3, fp, asl #1
	sub	r3, r3, #4
	str	r3, [sp, #0]
	ldr	r3, [sp, #8]
	mov	r2, #0
	add	r3, r3, #8
	str	r0, [sp, #32]
	str	r2, [sp, #24]
	str	ip, [sp, #16]
	str	r2, [sp, #20]
	str	lr, [sp, #4]
	str	r3, [sp, #28]
	mov	r3, r2
.L48:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #20]
	ldr	r8, [r2, r0]
	mov	r3, r3, asl #1
	str	r3, [sp, #36]
	ldrsh	r3, [r8, r3]
	cmp	r3, #0
	bne	.L44
	ldr	ip, [sp, #16]
	cmp	fp, ip
	mov	r1, ip
	ble	.L40
	ldr	lr, [sp, #28]
	ldr	r0, [sp, #36]
	ldr	r3, [lr, #-4]
	ldrsh	r2, [r3, r0]
	cmp	r2, #0
	moveq	r0, lr
	beq	.L41
	b	.L40
.L42:
	ldr	r3, [r0], #4
	ldr	ip, [sp, #36]
	ldrh	r2, [r3, ip]
	cmp	r2, #0
	bne	.L40
.L41:
	add	r1, r1, #1
	cmp	fp, r1
	bgt	.L42
.L40:
	cmp	r1, fp
	beq	.L59
	ldr	lr, [sp, #12]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #8]
	ldr	r7, [lr, r3]
	ldr	ip, [lr, r1, asl #2]
	ldr	r0, [r2, r1, asl #2]
	mov	r1, #0
.L45:
	mov	r3, r1, asl #1
	ldrh	r2, [r8, r3]
	ldrh	lr, [r0, r3]
	strh	lr, [r8, r3]	@ movhi
	strh	r2, [r0, r3]	@ movhi
	add	r1, r1, #1
	ldrh	r2, [r7, r3]
	ldrh	lr, [ip, r3]
	cmp	fp, r1
	strh	lr, [r7, r3]	@ movhi
	strh	r2, [ip, r3]	@ movhi
	bgt	.L45
.L44:
	mov	sl, #0
	mov	r9, sl
.L39:
	ldr	r0, [sp, #24]
	cmp	sl, r0
	beq	.L46
	ldr	r2, [sp, #8]
	add	r3, sp, #32
	ldmia	r3, {r3, ip}	@ phole ldm
	ldr	r6, [r2, r9]
	cmp	r3, #0
	ldrh	r0, [r6, ip]
	ldrh	r1, [r8, ip]
	beq	.L46
	mov	r1, r1, asl #16
	mov	r1, r1, asr #16
	mov	r0, r0, asl #16
	add	r1, r1, #4
	mov	r0, r0, asr #16
	mov	r1, r1, asr #3
	mov	r5, r3
	bl	__aeabi_idiv
	ldr	r2, [sp, #12]
	ldr	lr, [sp, #20]
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	ldr	r7, [r2, lr]
	ldr	r4, [r2, r9]
	ldmia	sp, {ip, lr}	@ phole ldm
	mov	r0, r0, asr #16
.L47:
	ldrsh	r1, [r8, lr]
	mul	r3, r0, r1
	ldrh	r2, [r6, lr]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r6, lr]	@ movhi
	ldrsh	r1, [r7, lr]
	mul	r3, r0, r1
	ldrh	r2, [r4, lr]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r4, lr]	@ movhi
	ldrsh	r1, [r8, ip]
	mul	r3, r0, r1
	ldrh	r2, [r6, ip]
	add	r3, r3, #4
	add	r2, r2, r3, asr #3
	strh	r2, [r6, ip]	@ movhi
	ldrsh	r3, [r7, ip]
	mul	r2, r0, r3
	ldrh	r1, [r4, ip]
	add	r2, r2, #4
	sub	r5, r5, #2
	add	r1, r1, r2, asr #3
	cmp	r5, #0
	strh	r1, [r4, ip]	@ movhi
	sub	lr, lr, #4
	sub	ip, ip, #4
	bgt	.L47
.L46:
	add	sl, sl, #1
	cmp	fp, sl
	add	r9, r9, #4
	bgt	.L39
	ldr	r3, [sp, #24]
	add	ip, sp, #16
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r0, [sp, #28]
	add	r3, r3, #1
	add	ip, ip, #1
	add	lr, lr, #4
	add	r0, r0, #4
	cmp	fp, r3
	str	r3, [sp, #24]
	str	ip, [sp, #16]
	str	lr, [sp, #20]
	str	r0, [sp, #28]
	bgt	.L48
	mov	r9, #0
	mov	sl, r9
.L50:
	ldr	r2, [sp, #8]
	ldr	r6, [r2, sl]
	mov	r3, r9, asl #1
	ldrsh	r2, [r6, r3]
	ldr	r3, [sp, #12]
	add	r2, r2, #4
	mov	r5, #0
	ldr	r8, [r3, sl]
	mov	r7, r2, asr #3
	mov	r4, r5
.L49:
	ldrsh	r0, [r6, r4]
	mov	r1, r7
	bl	__aeabi_idiv
	strh	r0, [r6, r4]	@ movhi
	mov	r1, r7
	ldrsh	r0, [r8, r4]
	bl	__aeabi_idiv
	add	r5, r5, #1
	cmp	fp, r5
	strh	r0, [r8, r4]	@ movhi
	add	r4, r4, #2
	bgt	.L49
	add	r9, r9, #1
	cmp	fp, r9
	add	sl, sl, #4
	bgt	.L50
.L32:
	ldr	r0, [sp, #12]
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L59:
	ldr	r2, .L60
	ldr	r0, .L60+4
	ldr	r3, [r2, #0]
	mov	r1, #1
	mov	r2, #26
	bl	fwrite
	mov	r0, #1
	bl	exit
.L61:
	.align	2
.L60:
	.word	stderr
	.word	.LC2
	.size	GaussJordan, .-GaussJordan
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r0, #16
	sub	sp, sp, #4
	bl	malloc
	mov	r5, r0
	mov	r0, #8
	bl	malloc
	mov	r8, r5
	str	r0, [r8], #4
	mov	r0, #8
	bl	malloc
	str	r0, [r5, #4]
	mov	r0, #8
	bl	malloc
	str	r0, [r5, #8]
	mov	r0, #8
	bl	malloc
	ldr	fp, .L66
	str	r0, [r5, #12]
	mov	r1, #1
	ldr	r0, .L66+4
	mov	r2, #18
	ldr	r3, [fp, #0]
	bl	fwrite
	mov	r7, #999424
	add	r7, r7, #576
	add	r9, r5, #8
	add	sl, r5, #12
	mov	r4, #0
.L63:
	ldr	r3, [r5, #0]
	mov	ip, #1872	@ movhi
	strh	ip, [r3, #6]	@ movhi
	mov	ip, #24	@ movhi
	strh	ip, [r3, #0]	@ movhi
	ldr	r2, [r8, #0]
	mov	ip, #8	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	mov	r3, #560	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, [r9, #0]
	mov	ip, #16	@ movhi
	mov	r3, #32	@ movhi
	strh	ip, [r2, #0]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	mov	ip, #56	@ movhi
	mov	r3, #72	@ movhi
	strh	ip, [r2, #4]	@ movhi
	ldr	r0, [sl, #0]
	strh	r3, [r1, #6]	@ movhi
	mov	ip, #8	@ movhi
	mov	r3, #16	@ movhi
	strh	ip, [r1, #0]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	mov	ip, #72	@ movhi
	mov	r3, #560	@ movhi
	strh	ip, [r1, #4]	@ movhi
	strh	ip, [r0, #6]	@ movhi
	strh	r3, [r0, #0]	@ movhi
	mov	ip, #1760	@ movhi
	mov	r3, #184	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	mov	r1, #4
	mov	r0, r5
	bl	GaussJordan
	add	r4, r4, #1
	cmp	r4, r7
	mov	r6, r0
	bne	.L63
	ldr	r3, [fp, #0]
	mov	r1, #1
	mov	r2, #28
	ldr	r0, .L66+8
	bl	fwrite
	ldr	r0, .L66+12
	bl	puts
	mov	r0, r6
	mov	r1, #4
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	printMatrix
.L67:
	.align	2
.L66:
	.word	stderr
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d(\000"
.LC1:
	.ascii	"%d.%d) \000"
.LC2:
	.ascii	"Matrix is not invertible.\012\000"
	.space	1
.LC3:
	.ascii	"Memory allocated.\012\000"
	.space	1
.LC4:
	.ascii	"Input matrix initialized...\012\000"
	.space	3
.LC5:
	.ascii	"Final:\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
