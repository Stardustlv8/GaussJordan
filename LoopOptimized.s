	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
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
	ldrh	r3, [fp, #-6]
	rsb	r3, r3, #0
	uxth	r3, r3
	strh	r3, [fp, #-6]	@ movhi
.L2:
	ldrsh	r3, [fp, #-6]
	mov	r0, r3
	ldr	r1, [fp, #-12]
	bl	__aeabi_idivmod
	mov	r3, r1
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	mod, .-mod
	.align	2
	.global	shiftDown
	.type	shiftDown, %function
shiftDown:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L4
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r3, r2, asr r3
	b	.L5
.L4:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r3, r2, asr r3
	add	r3, r3, #1
.L5:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	shiftDown, .-shiftDown
	.align	2
	.global	addScalarMultipleOfLine
	.type	addScalarMultipleOfLine, %function
addScalarMultipleOfLine:
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
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	uxth	r5, r3
	ldrsh	r3, [fp, #4]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	sxth	r2, r2
	mul	r3, r2, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	uxth	r3, r3
	add	r3, r5, r3
	uxth	r3, r3
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	uxth	r5, r3
	ldrsh	r3, [fp, #4]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-28]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	sxth	r2, r2
	mul	r3, r2, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	uxth	r3, r3
	add	r3, r5, r3
	uxth	r3, r3
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	uxth	r5, r3
	ldrsh	r3, [fp, #4]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	sub	r2, r2, #1
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	sxth	r2, r2
	mul	r3, r2, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	uxth	r3, r3
	add	r3, r5, r3
	uxth	r3, r3
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r3, r3, asl #1
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	uxth	r5, r3
	ldrsh	r3, [fp, #4]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-28]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-16]
	sub	r2, r2, #1
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	sxth	r2, r2
	mul	r3, r2, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	uxth	r3, r3
	add	r3, r5, r3
	uxth	r3, r3
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	sub	r3, r3, #2
	str	r3, [fp, #-16]
.L7:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L8
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.size	addScalarMultipleOfLine, .-addScalarMultipleOfLine
	.global	__aeabi_idiv
	.align	2
	.global	divideRowByConst
	.type	divideRowByConst, %function
divideRowByConst:
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
	b	.L10
.L11:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r2, r3
	ldrsh	r3, [fp, #-30]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-28]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r2, r3
	ldrsh	r3, [fp, #-30]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	uxth	r3, r3
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L11
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	divideRowByConst, .-divideRowByConst
	.align	2
	.global	swapRows
	.type	swapRows, %function
swapRows:
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
	b	.L13
.L14:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-16]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-8]
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [fp, #-10]	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-8]
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r2, [fp, #-10]	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L14
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L16
.L20:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L17
.L19:
	ldr	r2, .L21
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r1, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r0, r2
	mov	r1, r3
	bl	printf
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L18
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	cmn	r3, #7
	blt	.L18
	mov	r0, #45
	bl	putchar
.L18:
	ldr	r5, .L21+4
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #3
	uxth	r3, r3
	sxth	r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r0, r3
	mov	r1, #8
	bl	mod
	mov	r3, r0
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r0, r5
	mov	r1, r4
	mov	r2, r3
	bl	printf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L17:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L19
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L16:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L20
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC0
	.word	.LC1
	.size	printMatrix, .-printMatrix
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
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
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L24
.L29:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	ldr	r3, [fp, #-36]
	mov	r3, r3, asl #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L25
.L28:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L26
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, #8
	strh	r2, [r3, #0]	@ movhi
	b	.L27
.L26:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3, #0]	@ movhi
.L27:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L25:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L28
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L24:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L29
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L30
.L40:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L32
.L35:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	.L43
.L33:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L32:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L35
	b	.L34
.L43:
	mov	r0, r0	@ nop
.L34:
	ldr	r3, [fp, #-36]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	bl	swapRows
.L31:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L36
.L39:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L44
.L37:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r4, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	uxth	r3, r3
	rsb	r3, r3, #0
	uxth	r3, r3
	strh	r3, [fp, #-26]	@ movhi
	ldrsh	r3, [fp, #-26]
	str	r3, [sp, #0]
	ldr	r3, [fp, #-36]
	str	r3, [sp, #4]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	bl	addScalarMultipleOfLine
	b	.L38
.L44:
	mov	r0, r0	@ nop
.L38:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L36:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L39
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L30:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L40
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L41
.L42:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r5, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r4, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r0, r3
	mov	r1, #3
	bl	shiftDown
	mov	r3, r0
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r5
	mov	r1, r4
	mov	r2, r3
	ldr	r3, [fp, #-36]
	bl	divideRowByConst
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L41:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L42
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.size	GaussJordan, .-GaussJordan
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Memory allocated.\012\000"
	.align	2
.LC3:
	.ascii	"Input matrix initialized...\012\000"
	.align	2
.LC4:
	.ascii	"Final:\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #4
	strh	r3, [fp, #-26]	@ movhi
	ldrsh	r3, [fp, #-26]
	mov	r3, r3, asl #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L46
.L47:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r4, r2, r3
	ldrsh	r3, [fp, #-26]
	mov	r3, r3, asl #1
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L46:
	ldrsh	r2, [fp, #-26]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L47
	ldr	r2, .L50
	ldr	r3, .L50+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #1
	mov	r2, #18
	bl	fwrite
	ldr	r2, .L50+8
	ldr	r3, .L50+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #1
	mov	r2, #28
	bl	fwrite
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L48
.L49:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	mov	r2, #24
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #8
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #8
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	add	r3, r3, #6
	mov	r2, #1872
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r2, #16
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #32
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #56
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #6
	mov	r2, #560
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	mov	r2, #8
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #16
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #72
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r3, #6
	mov	r2, #72
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	mov	r2, #560
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #1760
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #184
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-32]
	add	r3, r3, #12
	ldr	r3, [r3, #0]
	add	r3, r3, #6
	mov	r2, #72
	strh	r2, [r3, #0]	@ movhi
	ldrsh	r3, [fp, #-26]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	GaussJordan
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L48:
	ldr	r2, [fp, #-24]
	ldr	r3, .L50+12
	cmp	r2, r3
	ble	.L49
	ldr	r0, .L50+16
	bl	puts
	ldrsh	r3, [fp, #-26]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	printMatrix
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L51:
	.align	2
.L50:
	.word	.LC2
	.word	stderr
	.word	.LC3
	.word	4999999
	.word	.LC4
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
