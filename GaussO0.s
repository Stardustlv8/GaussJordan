	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"Gauss.c"
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	mod
	.type	mod, %function
mod:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	str	r1, [fp, #-12]
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L2
	ldrh	r3, [fp, #-6]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-6]	@ movhi
.L2:
	ldrsh	r3, [fp, #-6]
	mov	r0, r3
	ldr	r1, [fp, #-12]
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	mod, .-mod
	.align	2
	.global	shiftDown
	.type	shiftDown, %function
shiftDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	sub	r2, r3, #1
	mov	r3, #1
	mov	r2, r3, asl r2
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	mov	r3, r2, asr r3
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	shiftDown, .-shiftDown
	.align	2
	.global	addScalarMultipleOfLine
	.type	addScalarMultipleOfLine, %function
addScalarMultipleOfLine:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #8]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L7
.L8:
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	ldrsh	r1, [fp, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r1, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r5, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	ldrsh	r1, [fp, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r1, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r5, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	ldrsh	r1, [fp, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r1, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r5, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	ldrsh	r1, [fp, #4]
	ldr	r3, [fp, #-32]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #1
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mul	r3, r1, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r5, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	sub	r3, r3, #2
	str	r3, [fp, #-16]
.L7:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L8
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
	.size	addScalarMultipleOfLine, .-addScalarMultipleOfLine
	.global	__aeabi_idiv
	.align	2
	.global	divideRowByConst
	.type	divideRowByConst, %function
divideRowByConst:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	strh	r2, [fp, #-30]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L11
.L12:
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r4, r3, r2
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldrsh	r2, [fp, #-30]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-28]
	add	r4, r3, r2
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #1
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldrsh	r2, [fp, #-30]
	mov	r0, r3
	mov	r1, r2
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L11:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L12
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	divideRowByConst, .-divideRowByConst
	.align	2
	.global	swapRows
	.type	swapRows, %function
swapRows:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L15
.L16:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r1, r2, r3
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	strh	r3, [r1, #0]	@ movhi
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r2, r2, r3
	ldrh	r3, [fp, #-10]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r1, r2, r3
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	strh	r3, [r1, #0]	@ movhi
	ldr	r3, [fp, #-28]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r2, r2, r3
	ldrh	r3, [fp, #-10]	@ movhi
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L15:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L16
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	swapRows, .-swapRows
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d(\000"
	.align	2
.LC1:
	.ascii	"%d.%d) \000"
	.text
	.align	2
	.global	printMatrix
	.type	printMatrix, %function
printMatrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L19
.L23:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L20
.L22:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	ldr	r0, .L25
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	bge	.L21
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	cmn	r3, #8
	ble	.L21
	mov	r0, #45
	bl	putchar
.L21:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r4, r3, asr #16
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	mov	r1, #8
	bl	mod
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r1, r3, asr #16
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	rsb	r3, r2, r3
	add	r3, r3, r1
	ldr	r0, .L25+4
	mov	r1, r4
	mov	r2, r3
	bl	printf
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L20:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L22
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L19:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L23
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LC0
	.word	.LC1
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Matrix is not invertible.\012\000"
	.text
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L28
.L33:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r4, r3, r2
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L29
.L32:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L30
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r2, r2, r3
	mov	r3, #8
	strh	r3, [r2, #0]	@ movhi
	b	.L31
.L30:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r2, r2, r3
	mov	r3, #0
	strh	r3, [r2, #0]	@ movhi
.L31:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L29:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L32
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L28:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L33
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L34
.L43:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	bne	.L35
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L36
.L38:
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	bne	.L37
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L36:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L38
.L37:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L39
	ldr	r3, .L47
	ldr	r3, [r3, #0]
	ldr	r0, .L47+4
	mov	r1, #1
	mov	r2, #26
	bl	fwrite
	mov	r0, #1
	bl	exit
.L39:
	ldr	r3, [fp, #-36]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	swapRows
.L35:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L40
.L42:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L41
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r4, r3, asr #16
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r3, [fp, #-14]
	str	r3, [sp, #0]
	ldr	r3, [fp, #-36]
	str	r3, [sp, #4]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	addScalarMultipleOfLine
.L41:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L40:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L42
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L34:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L43
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L44
.L45:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r3, r3, r2
	ldr	r5, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r4
	mov	r1, r5
	mov	r2, r3
	ldr	r3, [fp, #-36]
	bl	divideRowByConst
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L44:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L45
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	stderr
	.word	.LC2
	.size	GaussJordan, .-GaussJordan
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Memory allocated.\012\000"
	.align	2
.LC4:
	.ascii	"Input matrix initialized...\012\000"
	.align	2
.LC5:
	.ascii	"Final:\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #4
	strh	r3, [fp, #-30]	@ movhi
	ldrsh	r3, [fp, #-30]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L50
.L51:
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-28]
	add	r4, r3, r2
	ldrsh	r3, [fp, #-30]
	mov	r3, r3, asl #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L50:
	ldrsh	r2, [fp, #-30]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L51
	ldr	r3, .L55
	ldr	r3, [r3, #0]
	ldr	r0, .L55+4
	mov	r1, #1
	mov	r2, #18
	bl	fwrite
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L52
.L53:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, #24
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #2
	mov	r3, #8
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #4
	mov	r3, #8
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #6
	mov	r3, #1872
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	mov	r3, #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3, #2
	mov	r3, #32
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3, #4
	mov	r3, #56
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r2, r3, #6
	mov	r3, #560
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldr	r2, [r3, #0]
	mov	r3, #8
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3, #2
	mov	r3, #16
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3, #4
	mov	r3, #72
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r2, r3, #6
	mov	r3, #72
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #12
	ldr	r2, [r3, #0]
	mov	r3, #560
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #2
	mov	r3, #1760
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #4
	mov	r3, #184
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r2, r3, #6
	mov	r3, #72
	strh	r3, [r2, #0]	@ movhi
	ldrsh	r3, [fp, #-30]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	GaussJordan
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L52:
	ldr	r2, [fp, #-16]
	mov	r3, #999424
	add	r3, r3, #572
	add	r3, r3, #3
	cmp	r2, r3
	ble	.L53
	ldr	r3, .L55
	ldr	r3, [r3, #0]
	ldr	r0, .L55+8
	mov	r1, #1
	mov	r2, #28
	bl	fwrite
	ldr	r0, .L55+12
	bl	puts
	ldrsh	r3, [fp, #-30]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	printMatrix
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	stderr
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
