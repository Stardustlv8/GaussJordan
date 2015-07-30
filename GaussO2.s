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
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r9, r0
	sub	sp, sp, #12
	mov	r0, r1, asl #2
	mov	r6, r1
	bl	malloc
	cmp	r6, #0
	mov	sl, r0
	ble	.L22
	mov	r4, #0
	mov	r7, r6, asl #1
	mov	r5, r4
.L27:
	mov	r0, r7
	bl	malloc
	mov	r1, r4, asl #1
	str	r0, [sl, r5]
	mov	r2, #0
	b	.L26
.L42:
	ldr	r0, [sl, r5]
.L26:
	cmp	r4, r2
	movne	r3, r2, asl #1
	moveq	r3, #8	@ movhi
	movne	ip, #0	@ movhi
	add	r2, r2, #1
	streqh	r3, [r0, r1]	@ movhi
	strneh	ip, [r0, r3]	@ movhi
	cmp	r6, r2
	bgt	.L42
	add	r4, r4, #1
	cmp	r6, r4
	add	r5, r5, #4
	bgt	.L27
	add	r8, r9, #8
	mov	r5, #0
	mov	fp, #1
.L35:
	ldr	r2, [r8, #-8]
	mov	r7, r5, asl #1
	ldrsh	r3, [r2, r7]
	cmp	r3, #0
	bne	.L28
	cmp	r6, fp
	mov	r1, fp
	ble	.L29
	ldr	r3, [r8, #-4]
	ldrsh	r2, [r3, r7]
	cmp	r2, #0
	moveq	r0, r8
	beq	.L30
	b	.L29
.L31:
	ldr	r3, [r0], #4
	ldrh	r2, [r3, r7]
	cmp	r2, #0
	bne	.L29
.L30:
	add	r1, r1, #1
	cmp	r6, r1
	bgt	.L31
.L29:
	cmp	r1, r6
	beq	.L43
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	r2, r5
	str	r6, [sp, #0]
	bl	swapRows
.L28:
	mov	r4, #0
.L34:
	cmp	r4, r5
	beq	.L33
	ldr	r3, [r8, #-8]
	ldrsh	r1, [r3, r7]
	ldr	r2, [r9, r4, asl #2]
	add	r1, r1, #4
	ldrsh	r0, [r2, r7]
	mov	r1, r1, asr #3
	bl	__aeabi_idiv
	rsb	ip, r0, #0
	mov	ip, ip, asl #16
	mov	ip, ip, asr #16
	mov	r0, r9
	mov	r1, sl
	mov	r2, r5
	mov	r3, r4
	str	ip, [sp, #0]
	str	r6, [sp, #4]
	bl	addScalarMultipleOfLine
.L33:
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L34
	add	r5, r5, #1
	cmp	r6, r5
	add	fp, fp, #1
	add	r8, r8, #4
	bgt	.L35
	mov	r5, #0
	mov	r4, r5
.L36:
	ldr	r0, [r9, r4]
	mov	r3, r5, asl #1
	ldrsh	r2, [r0, r3]
	add	r2, r2, #4
	ldr	r1, [sl, r4]
	mov	r2, r2, asr #3
	add	r5, r5, #1
	mov	r3, r6
	bl	divideRowByConst
	cmp	r6, r5
	add	r4, r4, #4
	bgt	.L36
.L22:
	mov	r0, sl
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L43:
	ldr	r2, .L44
	ldr	r0, .L44+4
	ldr	r3, [r2, #0]
	mov	r1, #1
	mov	r2, #26
	bl	fwrite
	mov	r0, #1
	bl	exit
.L45:
	.align	2
.L44:
	.word	stderr
	.word	.LC0
	.size	GaussJordan, .-GaussJordan
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
	ble	.L51
.L48:
	mov	r5, #0
	b	.L50
.L49:
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
	ldr	r0, .L54
	add	r2, r3, r2
	mov	r1, r1, asr #3
	bl	printf
	cmp	r8, r5
	ble	.L53
.L50:
	ldr	r3, [r7, r6]
	mov	r4, r5, asl #1
	ldrsh	r1, [r3, r4]
	ldr	r0, .L54+4
	bl	printf
	ldr	r2, [r7, r6]
	ldrh	r1, [r2, r4]
	add	r3, r1, #7
	mov	r3, r3, asl #16
	cmp	r3, #393216
	add	r5, r5, #1
	bhi	.L49
	mov	r0, #45
	bl	putchar
	ldr	r3, [r7, r6]
	ldrh	r1, [r3, r4]
	b	.L49
.L53:
	add	sl, sl, #1
	mov	r0, #10
	bl	putchar
	cmp	r8, sl
	add	r6, r6, #4
	bgt	.L48
.L51:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LC2
	.word	.LC1
	.size	printMatrix, .-printMatrix
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
	mov	r4, #0
	mov	r6, r0
.L57:
	mov	r0, #8
	bl	malloc
	str	r0, [r6, r4]
	add	r4, r4, #4
	cmp	r4, #16
	bne	.L57
	ldr	fp, .L62
	ldr	r0, .L62+4
	mov	r1, #1
	mov	r2, #18
	ldr	r3, [fp, #0]
	bl	fwrite
	mov	r7, #999424
	add	r7, r7, #576
	add	r9, r6, #4
	add	sl, r6, #8
	add	r8, r6, #12
	sub	r4, r4, #16
.L58:
	ldr	r3, [r6, #0]
	mov	ip, #1872	@ movhi
	strh	ip, [r3, #6]	@ movhi
	mov	ip, #24	@ movhi
	strh	ip, [r3, #0]	@ movhi
	ldr	r2, [r9, #0]
	mov	ip, #8	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	mov	r3, #560	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, [sl, #0]
	mov	ip, #16	@ movhi
	mov	r3, #32	@ movhi
	strh	ip, [r2, #0]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	mov	ip, #56	@ movhi
	mov	r3, #72	@ movhi
	strh	ip, [r2, #4]	@ movhi
	ldr	r0, [r8, #0]
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
	mov	r0, r6
	bl	GaussJordan
	add	r4, r4, #1
	cmp	r4, r7
	mov	r5, r0
	bne	.L58
	ldr	r3, [fp, #0]
	mov	r1, #1
	mov	r2, #28
	ldr	r0, .L62+8
	bl	fwrite
	ldr	r0, .L62+12
	bl	puts
	mov	r0, r5
	mov	r1, #4
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	printMatrix
.L63:
	.align	2
.L62:
	.word	stderr
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Matrix is not invertible.\012\000"
	.space	1
.LC1:
	.ascii	"%d(\000"
.LC2:
	.ascii	"%d.%d) \000"
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
