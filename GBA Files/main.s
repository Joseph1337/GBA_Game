	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r5, #256
	mov	r1, #7296
	strh	r5, [r2]	@ movhi
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+32
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	19232
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	startPal
	.word	stopSound
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #67108864
	push	{r4, lr}
	ldr	r2, .L8
	strh	r3, [r1]	@ movhi
	ldr	ip, .L8+4
	ldrh	r0, [r2, #48]
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	strh	r3, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r5, #67108864
	ldr	r4, .L12
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+8
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r3, .L12+12
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r3, #864
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L12+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L12+36
	mov	r0, #3
	ldr	r1, .L12+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	cityscapePal
	.word	24068
	.word	11376
	.word	100679680
	.word	cityscapeTiles
	.word	100724736
	.word	cityscapeMap
	.word	roadTiles
	.word	100720640
	.word	roadMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #7168
	mov	r0, #67108864
	mov	r5, #256
	mov	r1, #2
	ldr	r2, .L16
	ldr	r4, .L16+4
	str	r1, [r2]
	ldr	r3, .L16+8
	strh	r5, [r0]	@ movhi
	mov	r2, #100663296
	strh	ip, [r0, #8]	@ movhi
	ldr	r1, .L16+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L16+32
	ldr	r3, .L16+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	DMANow
	.word	6960
	.word	pausedTiles
	.word	100720640
	.word	pausedMap
	.word	pausedPal
	.word	pauseSong_length
	.word	pauseSong_data
	.word	playSoundB
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	ldr	r4, .L30
	strh	r2, [r3, #16]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #4
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToStart
.L28:
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #7168
	mov	r4, #3
	mov	r1, #67108864
	mov	r6, #256
	ldr	r3, .L34
	ldr	r5, .L34+4
	str	r4, [r3]
	mov	r0, r4
	strh	r6, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1, #8]	@ movhi
	ldr	r3, .L34+8
	ldr	r1, .L34+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L34+16
	ldr	r1, .L34+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, r6
	mov	r2, #83886080
	ldr	r1, .L34+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L34+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L34+36
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	state
	.word	DMANow
	.word	6880
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	losePal
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L45+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L43
.L37:
	ldr	r3, .L45+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L36
	ldr	r3, .L45+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
.L36:
	pop	{r4, lr}
	bx	lr
.L43:
	bl	goToLose
	b	.L37
.L44:
	ldr	r3, .L45+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L46:
	.align	2
.L45:
	.word	updateGame
	.word	drawGame
	.word	tempLives
	.word	oldButtons
	.word	buttons
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r1, #0
	ldr	r3, .L52
	strh	r1, [r2, #16]	@ movhi
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #7168
	mov	r0, #67108864
	mov	r5, #256
	mov	r1, #4
	ldr	r2, .L56
	ldr	r4, .L56+4
	str	r1, [r2]
	ldr	r3, .L56+8
	strh	r5, [r0]	@ movhi
	mov	r2, #100663296
	strh	ip, [r0, #8]	@ movhi
	ldr	r1, .L56+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L56+16
	ldr	r1, .L56+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L56+24
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	state
	.word	DMANow
	.word	8368
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.word	instructionsPal
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L66
	ldr	r2, .L66+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L66+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToInstructions
.L67:
	.align	2
.L66:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	ldr	r3, .L77
	strh	r1, [r2, #16]	@ movhi
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L77+16
	ldr	r3, .L77+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L77+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.size	instructions, .-instructions
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L92
	ldr	r7, .L92+4
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+12
	ldr	r2, [r6]
	ldrh	r3, [r7]
	ldr	fp, .L92+16
	ldr	r10, .L92+20
	ldr	r9, .L92+24
	ldr	r8, .L92+28
	ldr	r5, .L92+32
.L81:
	strh	r3, [r4]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L83:
	.word	.L87
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L82
.L82:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r3, [r7]
	b	.L81
.L84:
	mov	r3, #67108864
	mov	r1, #0	@ movhi
	strh	r1, [r3, #16]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	ldrh	r3, [r7]
	beq	.L81
	tst	r3, #8
	bne	.L81
	ldr	r3, .L92+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r3, [r7]
	b	.L81
.L85:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r3, [r7]
	b	.L81
.L86:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r3, [r7]
	b	.L81
.L87:
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r3, [r7]
	b	.L81
.L93:
	.align	2
.L92:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	instructions
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	hOff,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
