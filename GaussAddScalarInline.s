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
	ble	.L8
	mov	r5, #0
	mov	r4, r5
.L7:
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
	bgt	.L7
.L8:
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
	ble	.L13
	mov	r2, r2, asl #2
	add	r7, r0, r2
	mov	r3, r3, asl #2
	add	r5, r0, r3
	add	r6, r1, r2
	add	r4, r1, r3
	mov	ip, #0
.L12:
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
	bgt	.L12
.L13:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.size	swapRows, .-swapRows
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
	ble	.L20
	mov	fp, #0
	mov	r6, fp
	ldr	sl, .L22
	ldr	r8, .L22+4
	b	.L17
.L19:
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
.L18:
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
	bgt	.L19
	mov	r0, #10
	bl	putchar
	add	fp, fp, #1
	add	r6, r6, #4
	cmp	r9, fp
	ble	.L20
.L17:
	mov	r5, #0
	b	.L19
.L20:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	.LC0
	.word	.LC1
	.size	printMatrix, .-printMatrix
	.align	2
	.global	addScalarMultipleOfLine
	.type	addScalarMultipleOfLine, %function
addScalarMultipleOfLine:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r6, r0
	mov	sl, r1
	mov	r7, r2
	mov	r5, r3
	ldr	r9, [sp, #36]
	ldrh	r3, [sp, #32]
	mov	r3, r3, asl #16
	mov	r4, r3, asr #16
	ldr	r0, .L29
	mov	r1, #0
	bl	scanf
	sub	r0, r9, #1
	cmp	r0, #0
	ble	.L27
	mov	r2, r5, asl #2
	add	r8, r6, r2
	mov	r3, r7, asl #2
	add	r7, r6, r3
	add	r6, sl, r2
	add	r5, sl, r3
	mov	lr, r0, asl #1
	mov	r3, r9, asl #1
	sub	ip, r3, #4
.L26:
	ldr	r1, [r8, #0]
	add	r1, r1, lr
	ldr	r3, [r7, #0]
	ldrsh	r3, [r3, lr]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r6, #0]
	add	r1, r1, lr
	ldr	r3, [r5, #0]
	ldrsh	r3, [r3, lr]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r8, #0]
	add	r1, r1, ip
	ldr	r3, [r7, #0]
	ldrsh	r3, [r3, ip]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r6, #0]
	add	r1, r1, ip
	ldr	r3, [r5, #0]
	ldrsh	r3, [r3, ip]
	mul	r2, r4, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	sub	r0, r0, #2
	sub	lr, lr, #4
	sub	ip, ip, #4
	cmp	r0, #0
	bgt	.L26
.L27:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LC2
	.size	addScalarMultipleOfLine, .-addScalarMultipleOfLine
	.align	2
	.global	GaussJordan
	.type	GaussJordan, %function
GaussJordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #52
	mov	r8, r0
	mov	fp, r1
	str	r1, [sp, #24]
	mov	r0, r1, asl #2
	bl	malloc
	mov	r7, r0
	str	r0, [sp, #32]
	cmp	fp, #0
	ble	.L32
	ldr	fp, [sp, #24]
	mov	sl, fp, asl #1
	mov	r4, #0
	mov	r5, r4
	mov	r9, r4
	mov	r6, #8
.L36:
	mov	r0, sl
	bl	malloc
	str	r0, [r7, r5]
	mov	r0, r4, asl #1
	mov	r1, r9
.L35:
	cmp	r4, r1
	ldreq	r3, [r7, r5]
	streqh	r6, [r3, r0]	@ movhi
	ldrne	r2, [r7, r5]
	movne	r3, r1, asl #1
	movne	ip, #0	@ movhi
	strneh	ip, [r2, r3]	@ movhi
	add	r1, r1, #1
	cmp	fp, r1
	bgt	.L35
	add	r4, r4, #1
	add	r5, r5, #4
	cmp	fp, r4
	bgt	.L36
	add	r0, r8, #8
	str	r0, [sp, #40]
	mov	r1, #0
	str	r1, [sp, #44]
	mov	r2, #1
	str	r2, [sp, #36]
	mov	r6, r1
	str	r1, [sp, #20]
	sub	r3, fp, #1
	str	r3, [sp, #16]
	mov	r2, r3, asl r2
	ldr	ip, [sp, #24]
	rsb	r3, ip, #2
	mov	r3, r3, asl #1
	rsb	r3, r3, #0
	str	r2, [sp, #12]
	str	r3, [sp, #8]
.L45:
	ldr	r0, [sp, #44]
	mov	r0, r0, asl #1
	str	r0, [sp, #28]
	ldr	r3, [r8, r6]
	ldrsh	r3, [r3, r0]
	cmp	r3, #0
	bne	.L37
	ldr	ip, [sp, #36]
	cmp	fp, ip
	ble	.L38
	ldr	r1, [sp, #40]
	ldr	r3, [r1, #-4]
	ldrsh	r3, [r3, r0]
	cmp	r3, #0
	moveq	r2, r1
	beq	.L39
	b	.L38
.L40:
	ldr	r3, [r2], #4
	ldr	r0, [sp, #28]
	ldrh	r3, [r3, r0]
	cmp	r3, #0
	bne	.L38
.L39:
	add	ip, ip, #1
	cmp	fp, ip
	bgt	.L40
.L38:
	cmp	ip, fp
	bne	.L41
	ldr	r0, .L54
	mov	r1, #1
	mov	r2, #26
	ldr	r3, .L54+4
	ldr	r3, [r3, #0]
	bl	fwrite
	mov	r0, #1
	bl	exit
.L41:
	str	fp, [sp, #0]
	mov	r0, r8
	ldr	r1, [sp, #32]
	ldr	r2, [sp, #44]
	mov	r3, ip
	bl	swapRows
.L37:
	mov	sl, #0
	ldr	r4, [sp, #20]
.L44:
	ldr	r1, [sp, #44]
	cmp	sl, r1
	beq	.L42
	ldr	r2, [r8, r4]
	ldr	r3, [r8, r6]
	ldr	ip, [sp, #28]
	ldrsh	r1, [r3, ip]
	add	r1, r1, #4
	ldrsh	r0, [r2, ip]
	mov	r1, r1, asr #3
	bl	__aeabi_idiv
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	mov	r9, r0, lsr #16
	ldr	r0, .L54+8
	ldr	r1, [sp, #20]
	bl	scanf
	ldr	r5, [sp, #16]
	cmp	r5, #0
	ble	.L42
	add	ip, sp, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	mov	r3, r9, asl #16
	mov	r0, r3, asr #16
.L43:
	ldr	r1, [r8, r4]
	add	r1, r1, lr
	ldr	r3, [r8, r6]
	ldrsh	r3, [r3, lr]
	mul	r2, r0, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r7, r4]
	add	r1, r1, lr
	ldr	r3, [r7, r6]
	ldrsh	r3, [r3, lr]
	mul	r2, r0, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r8, r4]
	add	r1, r1, ip
	ldr	r3, [r8, r6]
	ldrsh	r3, [r3, ip]
	mul	r2, r0, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	ldr	r1, [r7, r4]
	add	r1, r1, ip
	ldr	r3, [r7, r6]
	ldrsh	r3, [r3, ip]
	mul	r2, r0, r3
	add	r2, r2, #4
	ldrh	r3, [r1, #0]
	add	r3, r3, r2, lsr #3
	strh	r3, [r1, #0]	@ movhi
	sub	r5, r5, #2
	sub	lr, lr, #4
	sub	ip, ip, #4
	cmp	r5, #0
	bgt	.L43
.L42:
	add	sl, sl, #1
	add	r4, r4, #4
	cmp	fp, sl
	bgt	.L44
	ldr	r0, [sp, #44]
	add	r0, r0, #1
	str	r0, [sp, #44]
	ldr	r1, [sp, #36]
	add	r1, r1, #1
	str	r1, [sp, #36]
	add	r6, r6, #4
	ldr	r2, [sp, #40]
	add	r2, r2, #4
	str	r2, [sp, #40]
	cmp	fp, r0
	bgt	.L45
	mov	r5, #0
	mov	r4, r5
.L46:
	ldr	r0, [r8, r4]
	mov	r3, r5, asl #1
	ldrsh	r2, [r0, r3]
	add	r2, r2, #4
	ldr	r1, [r7, r4]
	mov	r2, r2, asr #3
	mov	r3, fp
	bl	divideRowByConst
	add	r5, r5, #1
	add	r4, r4, #4
	cmp	fp, r5
	bgt	.L46
.L32:
	ldr	r0, [sp, #32]
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LC3
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r0, #16
	bl	malloc
	mov	r6, r0
	mov	r4, r0
	mov	r5, #0
	mov	r7, #8
.L57:
	mov	r0, r7
	bl	malloc
	str	r0, [r6, r5]
	add	r5, r5, #4
	cmp	r5, #16
	bne	.L57
	ldr	r0, .L62
	mov	r1, #1
	mov	r2, #18
	ldr	r3, .L62+4
	ldr	r3, [r3, #0]
	bl	fwrite
	mov	r6, #0
	mov	r8, #8
	add	r5, r4, #4
	mov	r9, #16
	mov	sl, #560
	mov	r0, #999424
	add	fp, r0, #576
.L58:
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
	bne	.L58
	ldr	r0, .L62+8
	mov	r1, #1
	mov	r2, #28
	ldr	r3, .L62+4
	ldr	r3, [r3, #0]
	bl	fwrite
	ldr	r0, .L62+12
	bl	puts
	mov	r0, r7
	mov	r1, #4
	bl	printMatrix
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LC4
	.word	stderr
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d(\000"
.LC1:
	.ascii	"%d.%d) \000"
.LC2:
	.ascii	"%d\000"
	.space	1
.LC3:
	.ascii	"Matrix is not invertible.\012\000"
	.space	1
.LC4:
	.ascii	"Memory allocated.\012\000"
	.space	1
.LC5:
	.ascii	"Input matrix initialized...\012\000"
	.space	3
.LC6:
	.ascii	"Final:\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
