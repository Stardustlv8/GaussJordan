	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
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
	stmfd	sp!, {r4, lr}
	cmp	r0, #0
	rsblt	r0, r0, #0
	mov	r0, r0, asl #16
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	mov	ip, r2
	mov	r2, r3
	ldr	r9, [sp, #32]
	ldrh	r3, [sp, #28]
	mov	r3, r3, asl #16
	mov	r4, r3, asr #16
	sub	r5, r9, #1
	cmp	r5, #0
	ble	.L8
	mov	r2, r2, asl #2
	add	sl, r0, r2
	mov	r3, ip, asl #2
	add	r8, r0, r3
	add	r7, r1, r2
	add	r6, r1, r3
	mov	r0, r5, asl #1
	mov	r3, r9, asl #1
	sub	ip, r3, #4
.L7:
	ldr	r1, [sl, #0]
	add	r1, r1, r0
	ldr	r3, [r8, #0]
	ldrsh	r3, [r3, r0]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r7, #0]
	add	r1, r1, r0
	ldr	r3, [r6, #0]
	ldrsh	r3, [r3, r0]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [sl, #0]
	add	r1, r1, ip
	ldr	r3, [r8, #0]
	ldrsh	r3, [r3, ip]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r7, #0]
	add	r1, r1, ip
	ldr	r3, [r6, #0]
	ldrsh	r3, [r3, ip]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	sub	r5, r5, #2
	sub	r0, r0, #4
	sub	ip, ip, #4
	cmp	r5, #0
	bgt	.L7
.L8:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
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
	mov	r8, r0
	mov	r7, r1
	mov	r6, r2
	subs	sl, r3, #0
	ble	.L13
	mov	r5, #0
	mov	r4, r5
.L12:
	ldrsh	r0, [r8, r4]
	mov	r1, r6
	bl	__aeabi_idiv
	strh	r0, [r8, r4]	@ movhi
	ldrsh	r0, [r7, r4]
	mov	r1, r6
	bl	__aeabi_idiv
	strh	r0, [r7, r4]	@ movhi
	add	r5, r5, #1
	add	r4, r4, #2
	cmp	sl, r5
	bgt	.L12
.L13:
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
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r8, [sp, #20]
	cmp	r8, #0
	ble	.L18
	mov	r2, r2, asl #2
	add	r7, r0, r2
	mov	r3, r3, asl #2
	add	r5, r0, r3
	add	r6, r1, r2
	add	r4, r1, r3
	mov	ip, #0
.L17:
	mov	r1, ip, asl #1
	ldr	r3, [r7, #0]
	add	r3, r3, r1
	ldrh	r0, [r3, #0]
	ldr	r2, [r5, #0]
	ldrh	r2, [r2, r1]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [r5, #0]
	strh	r0, [r3, r1]	@ movhi
	ldr	r3, [r6, #0]
	add	r3, r3, r1
	ldrh	r0, [r3, #0]
	ldr	r2, [r4, #0]
	ldrh	r2, [r2, r1]
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [r4, #0]
	strh	r0, [r3, r1]	@ movhi
	add	ip, ip, #1
	cmp	r8, ip
	bgt	.L17
.L18:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.size	swapRows, .-swapRows
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	mov	sl, r0
	mov	r6, r1
	mov	r4, r1
	mov	r0, r1, asl #2
	bl	malloc
	mov	r9, r0
	mov	fp, r0
	cmp	r6, #0
	ble	.L21
	mov	r8, r6, asl #1
	mov	r4, #0
	mov	r5, r4
	mov	r7, #8
.L25:
	mov	r0, r8
	bl	malloc
	str	r0, [r9, r5]
	mov	r0, r4, asl #1
	mov	r1, #0
.L24:
	cmp	r4, r1
	ldreq	r3, [r9, r5]
	streqh	r7, [r3, r0]	@ movhi
	ldrne	r2, [r9, r5]
	movne	r3, r1, asl #1
	movne	ip, #0	@ movhi
	strneh	ip, [r2, r3]	@ movhi
	add	r1, r1, #1
	cmp	r6, r1
	bgt	.L24
	add	r4, r4, #1
	add	r5, r5, #4
	cmp	r6, r4
	bgt	.L25
	add	r8, sl, #8
	mov	r5, #0
	mov	r3, #1
	str	r3, [sp, #12]
.L33:
	mov	r7, r5, asl #1
	ldr	r3, [r8, #-8]
	ldrsh	r3, [r3, r7]
	cmp	r3, #0
	bne	.L26
	ldr	ip, [sp, #12]
	cmp	r6, ip
	ble	.L27
	ldr	r3, [r8, #-4]
	ldrsh	r3, [r3, r7]
	cmp	r3, #0
	moveq	r2, r8
	beq	.L28
	b	.L27
.L29:
	ldr	r3, [r2], #4
	ldrh	r3, [r3, r7]
	cmp	r3, #0
	bne	.L27
.L28:
	add	ip, ip, #1
	cmp	r6, ip
	bgt	.L29
.L27:
	cmp	ip, r6
	bne	.L30
	ldr	r0, .L41
	mov	r1, #1
	mov	r2, #26
	ldr	r3, .L41+4
	ldr	r3, [r3, #0]
	bl	fwrite
	mov	r0, #1
	bl	exit
.L30:
	str	r6, [sp, #0]
	mov	r0, sl
	mov	r1, fp
	mov	r2, r5
	mov	r3, ip
	bl	swapRows
.L26:
	mov	r4, #0
.L32:
	cmp	r4, r5
	beq	.L31
	ldr	r2, [sl, r4, asl #2]
	ldr	r3, [r8, #-8]
	ldrsh	r1, [r3, r7]
	add	r1, r1, #4
	ldrsh	r0, [r2, r7]
	mov	r1, r1, asr #3
	bl	__aeabi_idiv
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	stmia	sp, {r0, r6}	@ phole stm
	mov	r0, sl
	mov	r1, fp
	mov	r2, r5
	mov	r3, r4
	bl	addScalarMultipleOfLine
.L31:
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L32
	add	r5, r5, #1
	ldr	ip, [sp, #12]
	add	ip, ip, #1
	str	ip, [sp, #12]
	add	r8, r8, #4
	cmp	r6, r5
	bgt	.L33
	mov	r5, #0
	mov	r4, r5
.L34:
	ldr	r0, [sl, r4]
	mov	r3, r5, asl #1
	ldrsh	r2, [r0, r3]
	add	r2, r2, #4
	ldr	r1, [r9, r4]
	mov	r2, r2, asr #3
	mov	r3, r6
	bl	divideRowByConst
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	r6, r5
	bgt	.L34
.L21:
	mov	r0, fp
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LC0
	.word	stderr
	.size	GaussJordan, .-GaussJordan
	.align	2
	.global	printMatrix
	.type	printMatrix, %function
printMatrix:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, r0
	subs	r9, r1, #0
	ble	.L48
	mov	fp, #0
	mov	r6, fp
	ldr	sl, .L50
	ldr	r8, .L50+4
	b	.L45
.L47:
	mov	r4, r5, asl #1
	ldr	r3, [r7, r6]
	mov	r0, sl
	ldrsh	r1, [r3, r4]
	bl	printf
	ldr	r3, [r7, r6]
	ldrh	r3, [r3, r4]
	add	r3, r3, #7
	mov	r3, r3, asl #16
	cmp	r3, #393216
	movls	r0, #45
	blls	putchar
.L46:
	ldr	r3, [r7, r6]
	ldrsh	r2, [r3, r4]
	add	r1, r2, #7
	cmp	r2, #0
	movge	r1, r2
	cmp	r2, #0
	rsblt	r2, r2, #0
	mov	r2, r2, asl #16
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #29
	add	r2, r3, r2, asr #16
	and	r2, r2, #7
	rsb	r2, r3, r2
	mov	r3, r2, asl #7
	sub	r3, r3, r2, asl #2
	mov	r0, r8
	mov	r1, r1, asr #3
	add	r2, r3, r2
	bl	printf
	add	r5, r5, #1
	cmp	r9, r5
	bgt	.L47
	mov	r0, #10
	bl	putchar
	add	fp, fp, #1
	add	r6, r6, #4
	cmp	r9, fp
	ble	.L48
.L45:
	mov	r5, #0
	b	.L47
.L48:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LC1
	.word	.LC2
	.size	printMatrix, .-printMatrix
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r0, #16
	bl	malloc
	mov	r6, r0
	mov	r4, r0
	mov	r5, #0
	mov	r7, #8
.L53:
	mov	r0, r7
	bl	malloc
	str	r0, [r6, r5]
	add	r5, r5, #4
	cmp	r5, #16
	bne	.L53
	ldr	r0, .L58
	mov	r1, #1
	mov	r2, #18
	ldr	r3, .L58+4
	ldr	r3, [r3, #0]
	bl	fwrite
	mov	r6, #0
	mov	r8, #8
	add	r5, r4, #4
	mov	r9, #16
	mov	sl, #560
	mov	r0, #999424
	add	fp, r0, #576
.L54:
	ldr	r3, [r4, #0]
	mov	r2, #24	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, [r4, #0]
	strh	r8, [r3, #2]	@ movhi
	ldr	r3, [r4, #0]
	strh	r8, [r3, #4]	@ movhi
	ldr	r3, [r4, #0]
	mov	r0, #1872	@ movhi
	strh	r0, [r3, #6]	@ movhi
	ldr	r3, [r5, #0]
	strh	r9, [r3, #0]	@ movhi
	ldr	r3, [r5, #0]
	mov	r2, #32	@ movhi
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, [r5, #0]
	mov	r0, #56	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldr	r3, [r5, #0]
	strh	sl, [r3, #6]	@ movhi
	mov	r2, r4
	ldr	r3, [r2, #8]!
	strh	r8, [r3, #0]	@ movhi
	ldr	r3, [r2, #0]
	strh	r9, [r3, #2]	@ movhi
	ldr	r3, [r2, #0]
	mov	r1, #72
	strh	r1, [r3, #4]	@ movhi
	ldr	r3, [r2, #0]
	strh	r1, [r3, #6]	@ movhi
	mov	r3, r4
	ldr	r2, [r3, #12]!
	strh	sl, [r2, #0]	@ movhi
	ldr	r2, [r3, #0]
	mov	r0, #1760	@ movhi
	strh	r0, [r2, #2]	@ movhi
	ldr	r2, [r3, #0]
	mov	r0, #184	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldr	r3, [r3, #0]
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r4
	sub	r1, r1, #68
	bl	GaussJordan
	mov	r7, r0
	add	r6, r6, #1
	cmp	r6, fp
	bne	.L54
	ldr	r0, .L58+8
	mov	r1, #1
	mov	r2, #28
	ldr	r3, .L58+4
	ldr	r3, [r3, #0]
	bl	fwrite
	ldr	r0, .L58+12
	bl	puts
	mov	r0, r7
	mov	r1, #4
	bl	printMatrix
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LC3
	.word	stderr
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
