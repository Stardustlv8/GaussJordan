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
	.text
	.align	2
	.global	addScalarMultipleOfLine
	.type	addScalarMultipleOfLine, %function
addScalarMultipleOfLine:
	@ args = 8, pretend = 0, frame = 24
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
	b	.L2
.L3:
	ldr	r3, [fp, #-28]
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
	uxth	r1, r2
	ldrsh	r2, [fp, #4]
	ldr	r0, [fp, #-24]
	mov	r0, r0, asl #2
	ldr	ip, [fp, #-16]
	add	r0, ip, r0
	ldr	ip, [r0, #0]
	ldr	r0, [fp, #-8]
	mov	r0, r0, asl #1
	add	r0, ip, r0
	ldrh	r0, [r0, #0]
	sxth	r0, r0
	mul	r2, r0, r2
	mov	r2, r2, asr #3
	uxth	r2, r2
	add	r2, r1, r2
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-28]
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
	uxth	r1, r2
	ldrsh	r2, [fp, #4]
	ldr	r0, [fp, #-24]
	mov	r0, r0, asl #2
	ldr	ip, [fp, #-20]
	add	r0, ip, r0
	ldr	ip, [r0, #0]
	ldr	r0, [fp, #-8]
	mov	r0, r0, asl #1
	add	r0, ip, r0
	ldrh	r0, [r0, #0]
	sxth	r0, r0
	mul	r2, r0, r2
	mov	r2, r2, asr #3
	uxth	r2, r2
	add	r2, r1, r2
	uxth	r2, r2
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #8]
	cmp	r2, r3
	blt	.L3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
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
	b	.L5
.L6:
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
.L5:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L6
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
	b	.L8
.L9:
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
.L8:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	cmp	r2, r3
	blt	.L9
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	swapRows, .-swapRows
	.global	__aeabi_idivmod
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
	bge	.L11
	ldrh	r3, [fp, #-6]
	rsb	r3, r3, #0
	uxth	r3, r3
	strh	r3, [fp, #-6]	@ movhi
.L11:
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
	b	.L13
.L17:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L14
.L16:
	ldr	r2, .L18
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
	bge	.L15
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
	blt	.L15
	mov	r0, #45
	bl	putchar
.L15:
	ldr	r5, .L18+4
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
.L14:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L16
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L13:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L17
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L19:
	.align	2
.L18:
	.word	.LC0
	.word	.LC1
	.size	printMatrix, .-printMatrix
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Output matrix initialized to identity...\012\000"
	.align	2
.LC3:
	.ascii	"Got Here.\000"
	.align	2
.LC4:
	.ascii	"Before:\000"
	.text
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
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
	b	.L21
.L26:
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
	b	.L22
.L25:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r1, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r2, r2, asl #1
	add	r2, r1, r2
	ldrh	r2, [r2, #0]
	sxth	r2, r2
	mov	r2, r2, asl #3
	uxth	r2, r2
	strh	r2, [r3, #0]	@ movhi
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L23
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
	b	.L24
.L23:
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
.L24:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L25
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L21:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L26
	ldr	r2, .L42
	ldr	r3, .L42+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #1
	mov	r2, #41
	bl	fwrite
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L27
.L37:
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
	bne	.L28
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L29
.L32:
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
	beq	.L40
.L30:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L29:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L32
	b	.L31
.L40:
	mov	r0, r0	@ nop
.L31:
	ldr	r3, [fp, #-36]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	bl	swapRows
.L28:
	ldr	r0, .L42+8
	bl	puts
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L33
.L36:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L41
.L34:
	ldr	r0, .L42+12
	bl	puts
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-36]
	bl	printMatrix
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r2, r3
	ldrh	r3, [r3, #0]
	sxth	r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r1, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r3, r3, asr #3
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r2
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
	b	.L35
.L41:
	mov	r0, r0	@ nop
.L35:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L33:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L36
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L27:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L37
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L38
.L39:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r0, [fp, #-32]
	add	r3, r0, r3
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #1
	add	r3, r0, r3
	ldrh	r3, [r3, #0]
	sxth	r3, r3
	mov	r3, r3, asr #3
	uxth	r3, r3
	sxth	r3, r3
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-36]
	bl	divideRowByConst
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L38:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L39
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L43:
	.align	2
.L42:
	.word	.LC2
	.word	stderr
	.word	.LC3
	.word	.LC4
	.size	GaussJordan, .-GaussJordan
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Memory allocated.\012\000"
	.align	2
.LC6:
	.ascii	"Input matrix initialized...\012\000"
	.align	2
.LC7:
	.ascii	"Final:\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r0, #12
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L45
.L46:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-20]
	add	r4, r2, r3
	mov	r0, #6
	bl	malloc
	mov	r3, r0
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L45:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	ble	.L46
	ldr	r2, .L47
	ldr	r3, .L47+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #1
	mov	r2, #18
	bl	fwrite
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r2, #3
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #1
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #1
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	mov	r2, #1
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r2, #2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #2
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #2
	mov	r2, #4
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #7
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	add	r3, r3, #4
	mov	r2, #9
	strh	r2, [r3, #0]	@ movhi
	ldr	r2, .L47+8
	ldr	r3, .L47+4
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, #1
	mov	r2, #28
	bl	fwrite
	ldr	r0, [fp, #-20]
	mov	r1, #3
	bl	GaussJordan
	str	r0, [fp, #-24]
	ldr	r0, .L47+12
	bl	puts
	ldr	r0, [fp, #-24]
	mov	r1, #3
	bl	printMatrix
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L48:
	.align	2
.L47:
	.word	.LC5
	.word	stderr
	.word	.LC6
	.word	.LC7
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
