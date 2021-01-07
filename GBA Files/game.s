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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r8, #0
	ldr	r5, .L18
	ldr	r1, [r0, #4]
	ldr	r3, [r0, #20]
	ldr	ip, [r0]
	ldr	lr, [r0, #16]
	ldr	r7, .L18+4
	sub	sp, sp, #16
	add	r6, r5, #168
.L5:
	add	r2, r1, r3
	sub	r2, r2, #1
	add	r0, r3, #240
	cmp	r2, r0
	ble	.L17
.L2:
	str	r8, [r4, #24]
.L4:
	add	r5, r5, #56
	cmp	r6, r5
	bne	.L5
	stm	sp, {r1, ip}
	ldr	r5, .L18+8
	str	lr, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #0
	add	r0, r4, #16
	strne	r3, [r4, #24]
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #44]
	ldr	r2, [r5, #48]
	ldr	r1, [r5, #32]
	ldr	r0, [r5, #36]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	stm	sp, {r1, ip}
	str	lr, [sp, #12]
	str	r3, [sp, #8]
	ldr	r1, [r5]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldr	r1, [r4, #4]
	bne	.L3
	add	r1, r1, #1
	str	r1, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	ip, [r4]
	ldr	lr, [r4, #16]
	b	.L4
.L3:
	ldr	r3, [r4, #20]
	add	r2, r1, r3
	sub	r2, r2, #1
	add	r0, r3, #240
	cmp	r2, r0
	ldr	ip, [r4]
	ldr	lr, [r4, #16]
	ble	.L4
	b	.L2
.L19:
	.align	2
.L18:
	.word	enemy
	.word	collision
	.word	obstacle
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles.part.0, %function
drawObstacles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #91
	ldr	r3, .L22
	ldr	r0, .L22+4
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #36]
	ldr	r4, .L22+8
	ldrb	ip, [r3]	@ zero_extendqisi2
	and	r1, r1, r0
	and	r2, r2, r0
	ldrb	r0, [r3, #32]	@ zero_extendqisi2
	ldr	r3, .L22+12
	orr	r1, r1, r4
	orr	r2, r2, r4
	orr	ip, ip, #16384
	orr	r0, r0, #16384
	strh	lr, [r3, #76]	@ movhi
	strh	lr, [r3, #84]	@ movhi
	strh	r1, [r3, #74]	@ movhi
	strh	r2, [r3, #82]	@ movhi
	strh	ip, [r3, #72]	@ movhi
	strh	r0, [r3, #80]	@ movhi
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	obstacle
	.word	511
	.word	-32768
	.word	shadowOAM
	.size	drawObstacles.part.0, .-drawObstacles.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBuff.part.0, %function
drawBuff.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #187
	ldr	r2, .L25
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	ldrb	r0, [r2]	@ zero_extendqisi2
	lsr	r3, r3, #23
	ldr	r2, .L25+4
	orr	r3, r3, #16384
	strh	r3, [r2, #130]	@ movhi
	strh	r0, [r2, #128]	@ movhi
	strh	r1, [r2, #132]	@ movhi
	bx	lr
.L26:
	.align	2
.L25:
	.word	buff
	.word	shadowOAM
	.size	drawBuff.part.0, .-drawBuff.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles.part.0, %function
updateObstacles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r0, [r0, #12]
	ldm	r4, {r2, r3}
	ldr	r1, [r4, #16]
	sub	sp, sp, #16
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r5, .L56
	ldr	r6, .L56+4
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L28
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #1
	ble	.L29
.L53:
	ldr	r2, .L56+8
	ldr	r3, [r4, #8]
	ldr	r2, [r2]
	sub	r3, r3, r2
	asr	r2, r3, #8
	stmib	r4, {r2, r3}
.L27:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L28:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L32
	ldr	r3, [r5, #40]
	cmp	r3, #0
	bne	.L32
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L55
	ldr	r1, .L56+12
	ldr	r6, .L56+16
	mov	r0, #240
	mov	lr, pc
	bx	r6
	lsl	r3, r0, #8
	stmib	r4, {r0, r3}
	mov	r1, #3
	mov	r0, #1
	mov	lr, pc
	bx	r6
	cmp	r0, #1
	moveq	r2, #75
	beq	.L36
	cmp	r0, #2
	moveq	r2, #107
	movne	r2, #139
.L36:
	mov	r3, #0
	str	r2, [r4]
	str	r3, [r5, #52]
	b	.L27
.L32:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L27
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L27
	b	.L53
.L29:
	ldr	r1, .L56+12
	ldr	r5, .L56+16
	mov	r0, #240
	mov	lr, pc
	bx	r5
	lsl	r3, r0, #8
	stmib	r4, {r0, r3}
	mov	r1, #3
	mov	r0, #1
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	beq	.L39
.L54:
	cmp	r0, #2
	moveq	r3, #107
	movne	r3, #139
.L35:
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L55:
	ldr	r6, [r5, #56]
	cmp	r6, #0
	bne	.L53
	ldr	r3, .L56+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+24
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L56+28
	ldr	r3, .L56+32
	mov	lr, pc
	bx	r3
	mov	r0, #100
	mov	r1, #24
	mov	r7, #1
	mov	r8, #3
	ldr	r2, .L56+36
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L56+40
	str	r3, [r2]
	ldr	r3, .L56+44
	str	r1, [r5, #20]
	str	r0, [r3]
	ldr	r6, .L56+16
	add	r1, r1, #246
	mov	r0, #240
	str	r7, [r5, #56]
	str	r8, [r5, #28]
	mov	lr, pc
	bx	r6
	lsl	r3, r0, #8
	stmib	r4, {r0, r3}
	mov	r1, r8
	mov	r0, r7
	mov	lr, pc
	bx	r6
	cmp	r0, r7
	bne	.L54
.L39:
	mov	r3, #75
	b	.L35
.L57:
	.align	2
.L56:
	.word	player
	.word	collision
	.word	temp
	.word	270
	.word	getRandNumRange
	.word	stopSoundB
	.word	hitSfx_length
	.word	hitSfx_data
	.word	playSoundB
	.word	lives
	.word	tempLives
	.word	invulnerabilityTimer
	.size	updateObstacles.part.0, .-updateObstacles.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #75
	mov	r5, #19200
	mov	r4, #20
	mov	lr, #16
	mov	ip, #45
	mov	r0, #6
	mov	r1, #1
	ldr	r3, .L60
	stmib	r3, {r4, lr}
	str	r6, [r3]
	str	r5, [r3, #44]
	str	ip, [r3, #12]
	str	r0, [r3, #32]
	str	r1, [r3, #48]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #56]
	str	r2, [r3, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	getPlayerLane
	.syntax unified
	.arm
	.fpu softvfp
	.type	getPlayerLane, %function
getPlayerLane:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L66
	ldr	r3, [r3, #44]
	cmp	r3, #27392
	asr	r3, r3, #8
	bcc	.L64
	sub	r3, r3, #107
	cmp	r3, #32
	movcc	r0, #2
	movcs	r0, #3
	bx	lr
.L64:
	mov	r0, #1
	bx	lr
.L67:
	.align	2
.L66:
	.word	player
	.size	getPlayerLane, .-getPlayerLane
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L69
	ldr	r3, [r2, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	ip, [r2, #28]
	ldr	r1, [r2, #20]
	ldr	r2, .L69+4
	orr	r0, r0, #16384
	add	r1, r1, ip, lsl #7
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L70:
	.align	2
.L69:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	mov	r2, r1
	mov	r6, #22
	mov	r5, #63
	mov	r4, #4
	mov	lr, #3
	ldr	r3, .L75
	ldr	ip, .L75+4
.L72:
	lsl	r0, r1, #5
	add	r1, r1, #1
	add	r0, r0, #64
	cmp	r1, #3
	str	r6, [r3, #8]
	str	r5, [r3, #12]
	str	ip, [r3, #4]
	str	r2, [r3, #16]
	str	r2, [r3, #28]
	str	r4, [r3, #32]
	str	r2, [r3, #20]
	str	lr, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r0, [r3]
	str	r1, [r3, #52]
	add	r3, r3, #56
	bne	.L72
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	enemy
	.word	363
	.size	initEnemy, .-initEnemy
	.align	2
	.global	laneFree
	.syntax unified
	.arm
	.fpu softvfp
	.type	laneFree, %function
laneFree:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L90
	add	ip, r3, #168
.L81:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	beq	.L78
	cmp	r2, #75
	beq	.L87
	cmp	r2, #107
	beq	.L88
	cmp	r2, #139
	beq	.L89
.L78:
	add	r3, r3, #56
	cmp	r3, ip
	bne	.L81
	bx	lr
.L87:
	ldr	r0, [r3]
	subs	r0, r0, #75
	movne	r0, #1
	b	.L78
.L89:
	ldr	r0, [r3]
	subs	r0, r0, #139
	movne	r0, #1
	b	.L78
.L88:
	ldr	r0, [r3]
	subs	r0, r0, #107
	movne	r0, #1
	b	.L78
.L91:
	.align	2
.L90:
	.word	enemy
	.size	laneFree, .-laneFree
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #512
	ldr	r3, .L98
	ldr	r2, .L98+4
	ldr	r5, .L98+8
	ldr	r4, .L98+12
	add	lr, r3, #168
.L95:
	ldr	r1, [r3, #40]
	cmp	r1, #0
	strheq	r6, [r2, #8]	@ movhi
	beq	.L94
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #28]
	ldrb	ip, [r3]	@ zero_extendqisi2
	and	r0, r0, r5
	lsl	r1, r1, #7
	orr	r0, r0, r4
	add	r1, r1, #16
	orr	ip, ip, #16384
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	strh	ip, [r2, #8]	@ movhi
.L94:
	add	r3, r3, #56
	cmp	r3, lr
	add	r2, r2, #8
	bne	.L95
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	enemy
	.word	shadowOAM
	.word	511
	.word	-16384
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #4
	mov	r1, #8
	mov	r2, #0
	ldr	r3, .L101
	str	r0, [r3, #16]
	str	r0, [r3, #48]
	str	r0, [r3, #80]
	str	r1, [r3, #20]
	str	r1, [r3, #52]
	str	r1, [r3, #84]
	str	r2, [r3, #24]
	str	r2, [r3, #56]
	str	r2, [r3, #88]
	bx	lr
.L102:
	.align	2
.L101:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L114
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L104
	ldr	r2, [r3, #56]
	cmp	r2, #0
	beq	.L106
	ldr	r2, [r3, #88]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L104:
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	lr, .L114+4
	ldr	ip, .L114+8
	add	r4, r3, r2, lsl #5
	ldr	r1, [lr, #8]
	ldr	r6, [ip]
	ldr	r0, [lr]
	ldr	ip, [r4, #20]
	add	r1, r1, r1, lsr #31
	add	r0, r0, r1, asr r5
	add	ip, ip, ip, lsr #31
	ldr	r1, [lr, #12]
	sub	r0, r0, ip, asr r5
	ldr	ip, [lr, #4]
	add	ip, ip, r1
	sub	ip, ip, #5
	str	r0, [r3, r2, lsl #5]
	str	ip, [r4, #4]
	str	r5, [r4, #24]
	sub	r1, r6, #1000
	mov	r2, #0
	ldr	r0, .L114+12
	ldr	r3, .L114+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L106:
	mov	r2, #1
	b	.L104
.L115:
	.align	2
.L114:
	.word	bullets
	.word	player
	.word	shootingSfx_length
	.word	shootingSfx_data
	.word	playSoundB
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L178
	ldrh	r3, [r3, #48]
	tst	r3, #4
	push	{r4, r5, r6, lr}
	beq	.L117
	mov	r2, #3
	ldr	r3, .L178+4
	str	r2, [r3, #28]
	str	r2, [r3, #60]
	str	r2, [r3, #92]
.L118:
	ldr	r3, .L178
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldr	r4, .L178+8
	bne	.L119
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subge	r3, r3, #1
	strge	r3, [r4, #4]
	blt	.L119
.L120:
	ldr	r5, .L178+12
	ldrh	r1, [r5]
	tst	r1, #128
	beq	.L121
	ldr	r3, .L178+16
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L121
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	add	r3, r3, r2
	cmp	r3, #127
	bgt	.L121
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L121
	ldr	r2, [r4, #44]
	add	r2, r2, #8192
.L174:
	cmp	r2, #27392
	str	r2, [r4, #44]
	asr	r2, r2, #8
	movcc	r2, #1
	str	r3, [r4, #36]
	strcc	r2, [r4, #48]
	bcc	.L123
	sub	r2, r2, #107
	cmp	r2, #31
	movhi	r2, #3
	movls	r2, #2
	strhi	r2, [r4, #48]
	strls	r2, [r4, #48]
	bhi	.L125
.L126:
	ldr	r0, [r4, #44]
	ldr	r2, [r4, #8]
	add	r2, r0, r2
	sub	r2, r2, #1
	add	r2, r2, r3
	cmp	r2, #27648
	bge	.L132
.L169:
	add	r0, r0, r3
	str	r0, [r4, #44]
	b	.L170
.L121:
	tst	r1, #64
	beq	.L129
	ldr	r3, .L178+16
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L129
	ldr	r3, [r4]
	cmp	r3, #75
	ble	.L129
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldreq	r2, [r4, #44]
	subeq	r2, r2, #8192
	beq	.L174
.L129:
	ldr	r2, [r4, #48]
	cmp	r2, #1
	ldr	r3, [r4, #36]
	beq	.L123
	cmp	r2, #2
	beq	.L126
	cmp	r2, #3
	beq	.L125
.L170:
	add	r3, r3, #90
.L133:
	tst	r1, #2
	str	r3, [r4, #36]
	beq	.L135
	ldr	r3, .L178+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L135
	ldr	r2, [r4, #40]
	cmp	r2, #0
	beq	.L175
.L135:
	ldr	r3, [r4, #44]
	tst	r1, #1
	asr	r3, r3, #8
	str	r3, [r4]
	beq	.L136
	ldr	r3, .L178+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L136
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L176
.L136:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	subgt	r3, r3, #2
	strgt	r3, [r4, #4]
	ldr	r3, [r4, #52]
	cmp	r3, #0
	ldr	r2, [r4, #56]
	ldr	r3, [r4, #16]
	beq	.L138
	mov	r1, #8
	cmp	r2, #0
	str	r1, [r4, #20]
	beq	.L140
.L139:
	ldr	r2, .L178+20
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L177
	ldr	r2, .L178+24
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r3, r2
	bne	.L143
	ldr	r2, [r4, #28]
	cmp	r2, #3
	addle	r2, r2, #1
	strle	r2, [r4, #28]
	movgt	r2, #3
	strgt	r2, [r4, #28]
.L143:
	add	r3, r3, #1
	str	r3, [r4, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	ldr	r3, .L178
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L120
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r2, r3
	cmp	r3, #239
	addle	r2, r2, #3
	strle	r2, [r4, #4]
	b	.L120
.L125:
	ldr	r0, [r4, #44]
	ldr	r2, [r4, #8]
	add	r2, r0, r2
	sub	r2, r2, #1
	add	r2, r2, r3
	cmp	r2, #35840
	blt	.L169
.L132:
	mov	r2, #0
	mov	r3, #90
	str	r2, [r4, #40]
	b	.L133
.L117:
	mov	r0, #67108864
	mov	r1, #2
	mov	lr, #512
	ldr	r2, .L178+28
	ldr	r3, .L178+32
	ldr	ip, [r2]
	ldrh	r2, [r3]
	add	r2, r2, ip, asr #8
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #20]	@ movhi
	ldrh	r3, [r3]
	add	r3, r3, ip, asr #8
	ldr	r2, .L178+4
	ldr	ip, .L178+36
	lsl	r3, r3, #17
	lsr	r3, r3, #16
	strh	r3, [r0, #16]	@ movhi
	str	r1, [r2, #28]
	str	lr, [ip]
	str	r1, [r2, #60]
	str	r1, [r2, #92]
	b	.L118
.L177:
	mov	r2, #0
	ldr	r0, .L178+40
	ldr	r1, .L178+44
	ldr	r0, [r0]
	str	r2, [r4, #56]
	str	r0, [r1]
	str	r2, [r4, #20]
	str	r2, [r4, #28]
.L140:
	ldr	r2, .L178+24
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	subs	r2, r3, r2, lsl #1
	bne	.L143
	add	r0, r4, #28
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	addlt	r0, r0, #1
	strlt	r0, [r4, #28]
	strge	r2, [r4, #28]
	b	.L143
.L138:
	cmp	r2, #0
	streq	r2, [r4, #20]
	beq	.L140
	b	.L139
.L123:
	ldr	r2, [r4, #44]
	add	r2, r3, r2
	cmp	r2, #19456
	strlt	r2, [r4, #44]
	addlt	r3, r3, #90
	movge	r2, #0
	movge	r3, #90
	strge	r2, [r4, #40]
	b	.L133
.L176:
	bl	fireBullet
	b	.L136
.L175:
	ldr	r3, .L178+48
	ldr	r0, .L178+52
	ldr	r1, [r3]
	ldr	r3, .L178+56
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [r4, #36]
	sub	r3, r3, #1392
	sub	r3, r3, #8
	ldrh	r1, [r5]
	str	r3, [r4, #36]
	str	r2, [r4, #40]
	b	.L135
.L179:
	.align	2
.L178:
	.word	67109120
	.word	enemyBullets
	.word	player
	.word	oldButtons
	.word	buttons
	.word	invulnerabilityTimer
	.word	1717986919
	.word	hOffdel
	.word	hOff
	.word	temp
	.word	tempLives
	.word	lives
	.word	jumpSfx_length
	.word	jumpSfx_data
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	mov	r4, #27
	ldr	r3, .L188
	ldr	r2, .L188+4
	ldr	lr, .L188+8
	add	r0, r3, #24
.L185:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	strhne	r4, [r3, #44]	@ movhi
	strhne	r1, [r3, #42]	@ movhi
	strhne	ip, [r3, #40]	@ movhi
	strheq	r5, [r3, #40]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #32
	bne	.L185
	pop	{r4, r5, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	shadowOAM
	.word	bullets
	.word	511
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyBullet, %function
initEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #4
	mov	r0, #8
	mov	r1, #0
	mov	r2, #3
	ldr	r3, .L191
	str	ip, [r3, #16]
	str	ip, [r3, #48]
	str	ip, [r3, #80]
	str	r0, [r3, #20]
	str	r0, [r3, #52]
	str	r0, [r3, #84]
	str	r1, [r3, #24]
	str	r1, [r3, #56]
	str	r1, [r3, #88]
	str	r2, [r3, #28]
	str	r2, [r3, #60]
	str	r2, [r3, #92]
	bx	lr
.L192:
	.align	2
.L191:
	.word	enemyBullets
	.size	initEnemyBullet, .-initEnemyBullet
	.align	2
	.global	fireEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, r5, r6, lr}
	beq	.L198
	cmp	r0, #2
	beq	.L199
	cmp	r0, #3
	beq	.L200
.L193:
	pop	{r4, r5, r6, lr}
	bx	lr
.L199:
	ldr	r3, .L201
	ldr	r2, [r3, #56]
	cmp	r2, #0
	bne	.L193
	mov	lr, #1
	ldr	r4, .L201+4
	ldr	r0, .L201+8
	ldr	ip, [r4, #56]
	ldr	r1, [r4, #64]
	ldr	r5, [r0]
	ldr	r0, [r3, #52]
	add	r1, r1, r1, lsr #31
	add	ip, ip, #12
	add	ip, ip, r1, asr lr
	ldr	r4, [r4, #60]
	add	r0, r0, r0, lsr #31
	sub	ip, ip, r0, asr lr
	str	r4, [r3, #36]
	ldr	r0, .L201+12
	str	ip, [r3, #32]
	ldr	r4, .L201+16
	str	lr, [r3, #56]
	sub	r1, r5, #1000
	mov	lr, pc
	bx	r4
	b	.L193
.L198:
	ldr	r3, .L201
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L193
	ldr	r4, .L201+4
	ldr	lr, .L201+8
	ldr	ip, [r4]
	ldr	r1, [r4, #8]
	ldr	r5, [lr]
	ldr	lr, [r3, #20]
	add	r1, r1, r1, lsr #31
	add	ip, ip, #12
	ldr	r4, [r4, #4]
	add	lr, lr, lr, lsr #31
	add	ip, ip, r1, asr #1
	sub	ip, ip, lr, asr #1
	str	r0, [r3, #24]
	str	r4, [r3, #4]
	sub	r1, r5, #1000
	ldr	r4, .L201+16
	ldr	r0, .L201+12
	str	ip, [r3]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L200:
	ldr	r3, .L201
	ldr	r2, [r3, #88]
	cmp	r2, #0
	bne	.L193
	mov	lr, #1
	ldr	r4, .L201+4
	ldr	r0, .L201+8
	ldr	ip, [r4, #112]
	ldr	r1, [r4, #120]
	ldr	r5, [r0]
	ldr	r0, [r3, #84]
	add	r1, r1, r1, lsr #31
	add	ip, ip, #12
	add	ip, ip, r1, asr lr
	ldr	r4, [r4, #116]
	add	r0, r0, r0, lsr #31
	sub	ip, ip, r0, asr lr
	str	r4, [r3, #68]
	ldr	r0, .L201+12
	str	ip, [r3, #64]
	ldr	r4, .L201+16
	str	lr, [r3, #88]
	sub	r1, r5, #1000
	mov	lr, pc
	bx	r4
	b	.L193
.L202:
	.align	2
.L201:
	.word	enemyBullets
	.word	enemy
	.word	shootingSfx_length
	.word	shootingSfx_data
	.word	playSoundB
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L238
	mov	r4, r0
	sub	sp, sp, #16
	mov	r0, #250
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	streq	r0, [r4, #40]
	beq	.L205
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L205
.L217:
	ldr	r3, .L238+4
	ldrh	r2, [r3, #48]
	ldr	r3, [r4, #16]
	tst	r2, #4
	ldr	r2, .L238+8
	add	r3, r3, #1
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	beq	.L218
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #1
	str	r3, [r4, #16]
	bne	.L203
.L233:
	add	r2, r4, #28
	ldm	r2, {r2, r3}
	sub	r3, r3, #1
	cmp	r2, r3
	movge	r3, #0
	addlt	r2, r2, #1
	strge	r3, [r4, #28]
	strlt	r2, [r4, #28]
.L203:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L218:
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r3, [r4, #16]
	bne	.L203
	b	.L233
.L205:
	ldr	r2, [r4, #4]
	cmp	r2, #180
	ldr	r3, [r4, #48]
	ble	.L207
	cmp	r3, #300
	blt	.L234
.L207:
	ldr	r2, [r4, #44]
	add	r3, r3, #1
	add	r2, r2, #1
	str	r3, [r4, #48]
	str	r2, [r4, #44]
.L209:
	mov	r8, #0
	ldr	r5, .L238+12
	ldr	r7, .L238+16
	add	r6, r5, #96
.L208:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L235
.L211:
	add	r5, r5, #32
	cmp	r5, r6
	bne	.L208
	ldr	r3, [r4, #44]
	cmp	r3, #50
	beq	.L236
.L213:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	ble	.L237
	ldr	r3, [r4, #48]
	cmp	r3, #300
	ble	.L217
	ldr	r3, [r4, #4]
	cmp	r3, #260
	addlt	r3, r3, #1
	strlt	r3, [r4, #4]
	blt	.L217
	mov	r2, #0
	mov	r1, #3
	ldr	r3, [r4, #12]
	lsl	r3, r3, #1
	add	r3, r3, #237
	str	r3, [r4, #4]
	str	r2, [r4, #40]
	str	r2, [r4, #48]
	str	r2, [r4, #44]
	str	r1, [r4, #36]
	b	.L217
.L235:
	ldm	r5, {r2, r3}
	ldr	r1, [r5, #20]
	ldr	ip, [r5, #16]
	ldr	r0, [r4, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r0, r0, #5
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r5, #24]
	ldrne	r3, [r4, #36]
	subne	r3, r3, #1
	strne	r3, [r4, #36]
	b	.L211
.L237:
	mov	r2, #0
	mov	ip, #3
	ldr	r0, .L238+20
	ldr	r3, [r4, #12]
	ldr	r1, [r0, #164]
	lsl	r3, r3, #1
	cmp	r1, #9
	add	r3, r3, #237
	str	r3, [r4, #4]
	ldreq	r3, [r0, #208]
	addne	r1, r1, #1
	addeq	r3, r3, #1
	str	r2, [r4, #40]
	str	r2, [r4, #48]
	str	r2, [r4, #44]
	str	ip, [r4, #36]
	strne	r1, [r0, #164]
	streq	r3, [r0, #208]
	b	.L217
.L234:
	sub	r2, r2, #1
	str	r2, [r4, #4]
	b	.L209
.L236:
	ldr	r3, [r4, #48]
	cmp	r3, #300
	bge	.L213
	ldr	r0, [r4, #52]
	bl	fireEnemyBullet
	mov	r3, #0
	str	r3, [r4, #44]
	b	.L213
.L239:
	.align	2
.L238:
	.word	getRandNum
	.word	67109120
	.word	1717986919
	.word	bullets
	.word	collision
	.word	score
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyBullet, %function
drawEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	mov	r4, #59
	ldr	r3, .L246
	ldr	r2, .L246+4
	ldr	lr, .L246+8
	add	r0, r3, #24
.L243:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	strhne	r4, [r3, #100]	@ movhi
	strhne	r1, [r3, #98]	@ movhi
	strhne	ip, [r3, #96]	@ movhi
	strheq	r5, [r3, #96]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #32
	bne	.L243
	pop	{r4, r5, lr}
	bx	lr
.L247:
	.align	2
.L246:
	.word	shadowOAM
	.word	enemyBullets
	.word	511
	.size	drawEnemyBullet, .-drawEnemyBullet
	.align	2
	.global	initObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacles, %function
initObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #0
	mov	r6, #250
	mov	r5, #1
	ldr	r4, .L255
	ldr	r7, .L255+4
.L250:
	mov	r1, #3
	mov	r0, #1
	str	r6, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	moveq	lr, #75
	beq	.L249
	cmp	r0, #2
	moveq	lr, #107
	movne	lr, #139
.L249:
	mov	ip, #16
	mov	r0, #15
	mov	r1, #2
	mov	r2, #7
	ldr	r3, [r4, #4]
	cmp	r8, #1
	lsl	r3, r3, #8
	str	lr, [r4]
	str	r5, [r4, #28]
	str	r3, [r4, #8]
	str	ip, [r4, #12]
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	str	r2, [r4, #24]
	add	r4, r4, #32
	bne	.L253
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L253:
	mov	r8, #1
	b	.L250
.L256:
	.align	2
.L255:
	.word	obstacle
	.word	getRandNumRange
	.size	initObstacles, .-initObstacles
	.align	2
	.global	updateObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles, %function
updateObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateObstacles.part.0
	.size	updateObstacles, .-updateObstacles
	.align	2
	.global	drawObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles, %function
drawObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	drawObstacles.part.0
	.size	drawObstacles, .-drawObstacles
	.align	2
	.global	initBuff
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBuff, %function
initBuff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #250
	mov	r2, #64000
	push	{r4, lr}
	ldr	r4, .L266
	mov	r1, #3
	mov	r0, #1
	ldr	r3, .L266+4
	str	ip, [r4, #4]
	str	r2, [r4, #8]
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	moveq	lr, #75
	beq	.L262
	cmp	r0, #2
	moveq	lr, #107
	movne	lr, #139
.L262:
	mov	ip, #16
	mov	r0, #20
	mov	r1, #2
	mov	r2, #0
	mov	r3, #10
	str	lr, [r4]
	str	ip, [r4, #12]
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	str	r2, [r4, #28]
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L267:
	.align	2
.L266:
	.word	buff
	.word	getRandNumRange
	.size	initBuff, .-initBuff
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #3
	ldr	r4, .L272
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L272+4
	ldr	r1, .L272+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L272+12
	ldr	r1, .L272+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r4, #0
	ldr	r3, .L272+20
	mov	lr, pc
	bx	r3
	mov	r6, #1
	mov	ip, #20
	mov	lr, #19200
	mov	r0, #16
	mov	r1, #45
	mov	r2, #6
	mov	r7, #75
	ldr	r3, .L272+24
	str	r5, [r3]
	ldr	r3, .L272+28
	str	r5, [r3]
	ldr	r3, .L272+32
	str	r4, [r3]
	ldr	r3, .L272+36
	str	r4, [r3]
	ldr	r3, .L272+40
	str	r4, [r3]
	ldr	r3, .L272+44
	str	r4, [r3]
	ldr	r3, .L272+48
	str	r4, [r3]
	ldr	r3, .L272+52
	str	r4, [r3]
	ldr	r3, .L272+56
	str	ip, [r3, #4]
	str	lr, [r3, #44]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #32]
	str	r4, [r3, #16]
	str	r4, [r3, #28]
	str	r4, [r3, #20]
	str	r4, [r3, #36]
	str	r4, [r3, #40]
	str	r4, [r3, #56]
	str	r4, [r3, #52]
	str	r7, [r3]
	str	r6, [r3, #48]
	bl	initEnemy
	mov	r0, #4
	mov	r1, #8
	ldr	r3, .L272+60
	ldr	r2, .L272+64
	str	r0, [r3, #16]
	str	r0, [r3, #48]
	str	r0, [r3, #80]
	str	r1, [r3, #20]
	str	r1, [r3, #52]
	str	r1, [r3, #84]
	str	r0, [r2, #16]
	str	r1, [r2, #20]
	str	r0, [r2, #48]
	str	r1, [r2, #52]
	str	r0, [r2, #80]
	str	r1, [r2, #84]
	str	r4, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #56]
	str	r5, [r3, #60]
	str	r4, [r3, #88]
	str	r5, [r3, #92]
	str	r4, [r2, #24]
	str	r4, [r2, #56]
	str	r4, [r2, #88]
	bl	initObstacles
	bl	initBuff
	mov	r1, r5
	mov	r0, r6
	mov	r2, #35
	mov	ip, #11
	ldr	r3, .L272+68
.L269:
	str	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, #83
	str	r1, [r3]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r4, [r3, #32]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	add	r3, r3, #44
	bne	.L269
	mov	r2, #8
	mov	r6, #208
	mov	r5, #218
	mov	lr, #228
	mov	ip, #2
	ldr	r3, .L272+72
	stm	r3, {r1, r6}
	str	r4, [r3, #16]
	str	r5, [r3, #28]
	str	lr, [r3, #52]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r1, [r3, #48]
	str	r0, [r3, #68]
	str	ip, [r3, #64]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #60]
	str	r2, [r3, #56]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L273:
	.align	2
.L272:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	lives
	.word	tempLives
	.word	timer
	.word	increment
	.word	invulnerabilityTimer
	.word	hOffdel
	.word	temp
	.word	obstaclespeed
	.word	player
	.word	enemyBullets
	.word	bullets
	.word	score
	.word	livesObject
	.size	initGame, .-initGame
	.align	2
	.global	updateBuff
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBuff, %function
updateBuff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #800
	ldr	r3, .L294
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r4, .L294+4
	cmp	r0, #1
	streq	r0, [r4, #28]
	beq	.L276
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L276
.L277:
	mov	r3, #0
	str	r3, [r4, #28]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L276:
	ldr	r5, .L294+8
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L277
	ldr	r0, [r4, #4]
	cmp	r0, #0
	ble	.L278
	ldm	r5, {r2, r3}
	ldr	r1, [r5, #12]
	ldr	ip, [r5, #8]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r6, .L294+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L281
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L293
.L281:
	ldr	r2, .L294+16
	ldr	r3, [r4, #8]
	ldr	r2, [r2]
	sub	r3, r3, r2
	asr	r2, r3, #8
	stmib	r4, {r2, r3}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L278:
	mov	r1, #3
	mov	r0, #1
	ldr	r2, .L294+20
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r2
	cmp	r0, #1
	beq	.L286
.L292:
	cmp	r0, #2
	moveq	r1, #107
	movne	r1, #139
.L283:
	mov	r2, #250
	mov	r3, #64000
	stm	r4, {r1, r2, r3}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L293:
	mov	r0, #1
	str	r3, [r4, #28]
	mov	r1, #3
	ldr	r3, .L294+20
	str	r0, [r5, #52]
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	bne	.L292
.L286:
	mov	r1, #75
	b	.L283
.L295:
	.align	2
.L294:
	.word	getRandNum
	.word	buff
	.word	player
	.word	collision
	.word	temp
	.word	getRandNumRange
	.size	updateBuff, .-updateBuff
	.align	2
	.global	drawBuff
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBuff, %function
drawBuff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L301
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L297
	ldr	r3, .L301+4
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	drawBuff.part.0
.L297:
	mov	r2, #512
	ldr	r3, .L301+8
	strh	r2, [r3, #128]	@ movhi
	bx	lr
.L302:
	.align	2
.L301:
	.word	buff
	.word	player
	.word	shadowOAM
	.size	drawBuff, .-drawBuff
	.align	2
	.global	initScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScore, %function
initScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #35
	mov	lr, #3
	mov	r1, #0
	mov	ip, #11
	mov	r0, #1
	ldr	r3, .L307
.L304:
	str	r2, [r3, #4]
	add	r2, r2, #8
	cmp	r2, #83
	str	lr, [r3]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #32]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	add	r3, r3, #44
	bne	.L304
	ldr	lr, [sp], #4
	bx	lr
.L308:
	.align	2
.L307:
	.word	score
	.size	initScore, .-initScore
	.align	2
	.global	updateScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore, %function
updateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, .L323
	ldr	r5, .L323+4
	ldr	lr, [r2, #256]
	ldr	r6, [r5]
	mov	r4, r2
	mov	r3, r2
	mov	r0, r6
	mov	r1, #4
	mov	r7, #0
	ldr	r8, .L323+8
	sub	lr, lr, #1
	b	.L317
.L313:
	cmp	ip, r2
	bge	.L314
.L315:
	cmn	r1, #1
	beq	.L316
.L319:
	sub	r3, r3, #44
	sub	r1, r1, #1
.L317:
	ldr	r2, [r3, #240]
	cmp	r1, #4
	add	r2, r2, #1
	str	r2, [r3, #240]
	beq	.L322
	ldr	r2, [r3, #296]
	cmp	r2, #10
	ldr	r2, [r3, #256]
	ldr	ip, [r3, #252]
	sub	r2, r2, #1
	bne	.L313
	cmp	ip, r2
	bge	.L314
	cmp	r0, #0
	addeq	ip, ip, #1
	streq	ip, [r3, #252]
	cmn	r1, #1
	bne	.L319
.L316:
	cmp	r7, #0
	moveq	r0, r6
	add	r0, r0, #1
	str	r0, [r5]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L314:
	cmp	r0, #0
	streq	r0, [r3, #252]
	b	.L315
.L322:
	smull	ip, r9, r8, r2
	asr	ip, r2, #31
	rsb	ip, ip, r9, asr #1
	add	ip, ip, ip, lsl #2
	cmp	r2, ip
	bne	.L319
	ldr	r2, [r4, #252]
	cmp	r2, lr
	movge	r2, #1
	addlt	r2, r2, #1
	mov	r0, #0
	mov	r7, #1
	str	r2, [r4, #252]
	b	.L319
.L324:
	.align	2
.L323:
	.word	score
	.word	newtimer
	.word	1717986919
	.size	updateScore, .-updateScore
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L329
	mov	r2, r5
	ldr	r3, .L329+4
	ldr	r4, .L329+8
	sub	lr, r3, #264
.L326:
	ldr	r0, [r3, #224]
	ldr	r1, [r3, #252]
	ldrb	ip, [r3, #220]	@ zero_extendqisi2
	sub	r3, r3, #44
	and	r0, r0, r4
	add	r1, r1, #832
	cmp	r3, lr
	strh	r0, [r2, #178]	@ movhi
	strh	r1, [r2, #180]	@ movhi
	strh	ip, [r2, #176]	@ movhi
	sub	r2, r2, #8
	bne	.L326
	mov	r1, #32768
	mov	r2, #768
	ldr	r3, .L329+12
	strh	r1, [r5, #194]	@ movhi
	strh	r2, [r5, #196]	@ movhi
	strh	r3, [r5, #192]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L330:
	.align	2
.L329:
	.word	shadowOAM
	.word	score
	.word	511
	.word	16387
	.size	drawScore, .-drawScore
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L351
	ldr	r3, [r5, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r5, #28]
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r2, [r5, #20]
	ldr	r4, .L351+4
	orr	r1, r1, #16384
	add	r2, r2, r0, lsl #7
	ldr	r6, .L351+8
	strh	r3, [r4, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	bl	drawBullet
	bl	drawEnemy
	bl	drawEnemyBullet
	ldr	r3, [r6, #28]
	cmp	r3, #0
	blne	drawObstacles.part.0
.L332:
	ldr	r3, [r6, #60]
	cmp	r3, #0
	blne	drawObstacles.part.0
.L333:
	mov	r8, #512
	mov	r7, #960
	mov	r6, #896
	ldr	r3, .L351+12
	ldr	lr, .L351+16
	ldr	ip, .L351+20
	add	r0, r3, #72
.L336:
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #16]
	cmp	r1, #0
	add	r2, r2, #25
	add	r1, r4, r2, lsl #3
	ldrne	r10, [r3]
	lsl	r9, r2, #3
	ldrne	r2, [r3, #4]
	lsleq	r2, r2, #3
	add	r3, r3, #24
	strhne	r7, [r1, #4]	@ movhi
	strhne	r10, [r4, r9]	@ movhi
	strhne	r2, [r1, #2]	@ movhi
	strheq	r8, [r4, r2]	@ movhi
	cmp	r3, r0
	strh	lr, [r4, #232]	@ movhi
	strh	ip, [r4, #234]	@ movhi
	strh	r6, [r4, #236]	@ movhi
	bne	.L336
	ldr	r3, .L351+24
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L337
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L350
.L337:
	mov	r3, #512
	strh	r3, [r4, #128]	@ movhi
.L338:
	bl	drawScore
	ldr	r3, .L351+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L351+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L351+4
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L350:
	bl	drawBuff.part.0
	b	.L338
.L352:
	.align	2
.L351:
	.word	player
	.word	shadowOAM
	.word	obstacle
	.word	livesObject
	.word	16387
	.word	-32594
	.word	buff
	.word	waitForVBlank
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #8
	mov	r1, #1
	mov	r0, #3
	mov	r6, #208
	mov	r5, #0
	mov	r4, #218
	mov	lr, #228
	mov	ip, #2
	ldr	r3, .L355
	str	r6, [r3, #4]
	str	r5, [r3, #16]
	str	r4, [r3, #28]
	str	lr, [r3, #52]
	str	r0, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #48]
	str	ip, [r3, #64]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #60]
	str	r2, [r3, #56]
	str	r1, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #40]
	str	r1, [r3, #68]
	pop	{r4, r5, r6, lr}
	bx	lr
.L356:
	.align	2
.L355:
	.word	livesObject
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L365
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L363
	cmp	r3, #1
	bne	.L364
	mov	r2, #0
	ldr	r3, .L365+4
	str	r2, [r3, #44]
	bx	lr
.L364:
	cmp	r3, #0
	ldreq	r2, .L365+4
	streq	r3, [r2, #20]
	bx	lr
.L363:
	mov	r2, #0
	ldr	r3, .L365+4
	str	r2, [r3, #68]
	bx	lr
.L366:
	.align	2
.L365:
	.word	lives
	.word	livesObject
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #16]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	add	r3, r3, #25
	beq	.L368
	mov	r1, #960
	ldr	r2, .L371
	ldr	lr, [r0]
	ldr	r0, [r0, #4]
	lsl	ip, r3, #3
	add	r3, r2, r3, lsl #3
	strh	lr, [r2, ip]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
.L369:
	mov	r0, #896
	ldr	r1, .L371+4
	ldr	r3, .L371+8
	strh	r0, [r2, #236]	@ movhi
	strh	r1, [r2, #232]	@ movhi
	strh	r3, [r2, #234]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L368:
	mov	r1, #512
	ldr	r2, .L371
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	b	.L369
.L372:
	.align	2
.L371:
	.word	shadowOAM
	.word	16387
	.word	-32594
	.size	drawLives, .-drawLives
	.align	2
	.global	getRandLane
	.syntax unified
	.arm
	.fpu softvfp
	.type	getRandLane, %function
getRandLane:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	mov	r0, #1
	push	{r4, lr}
	ldr	r3, .L378
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	moveq	r0, #75
	beq	.L373
	cmp	r0, #2
	moveq	r0, #107
	movne	r0, #139
.L373:
	pop	{r4, lr}
	bx	lr
.L379:
	.align	2
.L378:
	.word	getRandNumRange
	.size	getRandLane, .-getRandLane
	.align	2
	.global	updateDifficulty
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDifficulty, %function
updateDifficulty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L388
	ldr	r1, .L388+4
	ldr	r3, [r3]
	ldrh	r2, [r1]
	add	r3, r3, r3, lsl #4
	ldr	r0, .L388+8
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	add	r2, r2, #1
	sub	r3, r0, r3
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	cmp	r0, r3, ror #1
	str	lr, [sp, #-4]!
	strh	r2, [r1]	@ movhi
	bcc	.L381
	ldr	r0, .L388+12
	ldr	r3, [r0]
	cmp	r3, #512
	blt	.L387
.L381:
	ldr	r3, .L388+16
	ldrh	r3, [r3, #48]
	tst	r3, #4
	beq	.L380
	mov	ip, #67108864
	ldr	lr, .L388+20
	ldr	r0, .L388+12
	ldr	r3, [lr]
	ldr	r0, [r0]
	add	r0, r3, r0
	ldr	r3, .L388+24
	add	r2, r2, r0, asr #8
	ldr	r3, [r3]
	str	r0, [lr]
	lsl	r2, r2, #16
	ldr	lr, .L388+28
	add	r3, r3, #512
	lsr	r2, r2, #16
	str	r3, [lr]
	strh	r2, [ip, #20]	@ movhi
	ldrh	r3, [r1]
	add	r3, r3, r0, asr #8
	lsl	r3, r3, #17
	lsr	r3, r3, #16
	strh	r3, [ip, #16]	@ movhi
.L380:
	ldr	lr, [sp], #4
	bx	lr
.L387:
	ldr	lr, .L388+24
	ldr	ip, [lr]
	add	r3, r3, #1
	add	ip, ip, #2
	str	r3, [r0]
	str	ip, [lr]
	b	.L381
.L389:
	.align	2
.L388:
	.word	timer
	.word	hOff
	.word	143165576
	.word	increment
	.word	67109120
	.word	hOffdel
	.word	obstaclespeed
	.word	temp
	.size	updateDifficulty, .-updateDifficulty
	.align	2
	.global	sameLane
	.syntax unified
	.arm
	.fpu softvfp
	.type	sameLane, %function
sameLane:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L399
	mov	r3, r0
	ldr	r0, [r2, #40]
	cmp	r0, #0
	bne	.L391
	cmp	r3, #106
	cmpls	r1, #106
	bls	.L396
	sub	r2, r3, #107
	cmp	r2, #31
	bls	.L398
	sub	r3, r3, #139
	cmp	r3, #19
	bxhi	lr
	sub	r1, r1, #107
	cmp	r1, #51
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L391:
	add	r2, r3, #40
	cmp	r2, #106
	bhi	.L394
	cmp	r1, #106
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L394:
	sub	r2, r3, #67
	cmp	r2, #31
	bhi	.L395
.L398:
	sub	r1, r1, #107
	cmp	r1, #31
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L395:
	sub	r3, r3, #99
	cmp	r3, #59
	bhi	.L397
	sub	r1, r1, #139
	cmp	r1, #19
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L396:
	mov	r0, #1
	bx	lr
.L397:
	mov	r0, #0
	bx	lr
.L400:
	.align	2
.L399:
	.word	player
	.size	sameLane, .-sameLane
	.align	2
	.global	updateEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullet, %function
updateEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	mov	r4, r0
	add	r6, r0, #16
	ldm	r6, {r6, ip}
	sub	sp, sp, #16
	ldr	lr, [r0]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	r5, .L418
	ldr	ip, [r4, #4]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	stm	sp, {ip, lr}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L418+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	bne	.L404
	add	r1, r3, r2
	cmp	r1, #0
	ble	.L404
.L416:
	ldr	r2, [r4, #28]
	sub	r3, r3, r2
	str	r3, [r4, #4]
.L401:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L404:
	ldr	r0, [r4, #16]
	ldr	r1, [r4]
	str	r2, [sp, #8]
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #4]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	streq	r0, [r4, #24]
	beq	.L401
	ldr	r1, [r4]
	ldr	r0, [r5]
	bl	sameLane
	cmp	r0, #0
	beq	.L408
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L417
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r5, #52]
	b	.L401
.L408:
	ldr	r3, [r4, #4]
	b	.L416
.L417:
	ldr	r6, [r5, #56]
	cmp	r6, #0
	bne	.L408
	mov	lr, #1
	mov	r0, #100
	mov	ip, #24
	mov	r1, #3
	ldr	r2, .L418+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L418+12
	str	r3, [r2]
	ldr	r2, .L418+16
	str	r6, [r4, #24]
	ldr	r3, .L418+20
	str	r0, [r2]
	str	r1, [r5, #28]
	str	lr, [r5, #56]
	str	ip, [r5, #20]
	mov	lr, pc
	bx	r3
	ldr	r3, .L418+24
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L418+28
	ldr	r3, .L418+32
	mov	lr, pc
	bx	r3
	b	.L401
.L419:
	.align	2
.L418:
	.word	player
	.word	collision
	.word	lives
	.word	tempLives
	.word	invulnerabilityTimer
	.word	stopSoundB
	.word	hitSfx_length
	.word	hitSfx_data
	.word	playSoundB
	.size	updateEnemyBullet, .-updateEnemyBullet
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L450
	bl	updateDifficulty
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L446
.L421:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L447
.L422:
	ldr	r0, .L450+4
	bl	updateEnemy
	ldr	r0, .L450+8
	bl	updateEnemy
	ldr	r0, .L450+12
	bl	updateEnemy
	ldr	r0, .L450+16
	bl	updateEnemyBullet
	ldr	r4, .L450+20
	ldr	r0, .L450+24
	bl	updateEnemyBullet
	ldr	r0, .L450+28
	bl	updateEnemyBullet
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L423:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldrne	r0, .L450+32
	blne	updateBullet.part.0
.L424:
	ldr	r3, [r4, #88]
	cmp	r3, #0
	ldrne	r0, .L450+36
	blne	updateBullet.part.0
.L425:
	bl	updatePlayer
	bl	updateBuff
	bl	updateScore
	ldr	r3, .L450+40
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L448
	cmp	r3, #1
	moveq	r2, #0
	ldreq	r3, .L450+44
	streq	r2, [r3, #44]
	beq	.L427
.L449:
	cmp	r3, #0
	ldreq	r2, .L450+44
	streq	r3, [r2, #20]
.L427:
	ldr	r0, .L450+48
	ldr	r1, .L450+52
	ldr	r2, [r0]
	ldr	r3, [r1]
	add	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r0]
	str	r3, [r1]
	pop	{r4, lr}
	bx	lr
.L448:
	mov	r2, #0
	ldr	r3, .L450+44
	str	r2, [r3, #68]
	b	.L427
.L447:
	ldr	r0, .L450+56
	bl	updateObstacles.part.0
	b	.L422
.L446:
	mov	r0, r4
	bl	updateObstacles.part.0
	b	.L421
.L451:
	.align	2
.L450:
	.word	obstacle
	.word	enemy
	.word	enemy+56
	.word	enemy+112
	.word	enemyBullets
	.word	bullets
	.word	enemyBullets+32
	.word	enemyBullets+64
	.word	bullets+32
	.word	bullets+64
	.word	lives
	.word	livesObject
	.word	timer
	.word	invulnerabilityTimer
	.word	obstacle+32
	.size	updateGame, .-updateGame
	.comm	obstaclespeed,4,4
	.comm	temp,4,4
	.comm	hOffdel,4,4
	.comm	invulnerabilityTimer,4,4
	.comm	tempLives,4,4
	.comm	newtimer,4,4
	.comm	increment,4,4
	.comm	timer,4,4
	.comm	lives,4,4
	.comm	gravity,4,4
	.comm	livesObject,72,4
	.comm	score,396,4
	.comm	buff,32,4
	.comm	obstacle,64,4
	.comm	enemyBullets,96,4
	.comm	bullets,96,4
	.comm	enemy,168,4
	.comm	player,60,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	hOff,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
