	.file	"TOY_ks.cpp"
	.text
	.p2align 4
	.globl	_Z9Ref_cbrt3d
	.type	_Z9Ref_cbrt3d, @function
_Z9Ref_cbrt3d:
.LFB7379:
	.cfi_startproc
	vmovsd	%xmm0, %xmm0, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L6
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	8(%rsp), %xmm1
	vmulsd	%xmm0, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm1, %xmm2
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmulsd	%xmm0, %xmm3, %xmm3
	vdivsd	%xmm2, %xmm3, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.cfi_endproc
.LFE7379:
	.size	_Z9Ref_cbrt3d, .-_Z9Ref_cbrt3d
	.p2align 4
	.globl	_Z7BM_cbrtdd
	.type	_Z7BM_cbrtdd, @function
_Z7BM_cbrtdd:
.LFB7380:
	.cfi_startproc
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	cbrt
	.cfi_endproc
.LFE7380:
	.size	_Z7BM_cbrtdd, .-_Z7BM_cbrtdd
	.p2align 4
	.globl	_Z8BM_cbrt3dd
	.type	_Z8BM_cbrt3dd, @function
_Z8BM_cbrt3dd:
.LFB7381:
	.cfi_startproc
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L18
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	8(%rsp), %xmm1
	vmulsd	%xmm0, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm1, %xmm2
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmulsd	%xmm0, %xmm3, %xmm3
	vdivsd	%xmm2, %xmm3, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.cfi_endproc
.LFE7381:
	.size	_Z8BM_cbrt3dd, .-_Z8BM_cbrt3dd
	.p2align 4
	.globl	_Z7BM_sqrtdd
	.type	_Z7BM_sqrtdd, @function
_Z7BM_sqrtdd:
.LFB7382:
	.cfi_startproc
	vsqrtsd	%xmm1, %xmm1, %xmm0
	ret
	.cfi_endproc
.LFE7382:
	.size	_Z7BM_sqrtdd, .-_Z7BM_sqrtdd
	.p2align 4
	.globl	_Z6BM_expdd
	.type	_Z6BM_expdd, @function
_Z6BM_expdd:
.LFB7383:
	.cfi_startproc
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	exp
	.cfi_endproc
.LFE7383:
	.size	_Z6BM_expdd, .-_Z6BM_expdd
	.p2align 4
	.globl	_Z6BM_logdd
	.type	_Z6BM_logdd, @function
_Z6BM_logdd:
.LFB7384:
	.cfi_startproc
	vaddsd	.LC3(%rip), %xmm1, %xmm0
	jmp	log
	.cfi_endproc
.LFE7384:
	.size	_Z6BM_logdd, .-_Z6BM_logdd
	.p2align 4
	.globl	_Z6BM_cosdd
	.type	_Z6BM_cosdd, @function
_Z6BM_cosdd:
.LFB7385:
	.cfi_startproc
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	cos
	.cfi_endproc
.LFE7385:
	.size	_Z6BM_cosdd, .-_Z6BM_cosdd
	.p2align 4
	.globl	_Z6BM_sindd
	.type	_Z6BM_sindd, @function
_Z6BM_sindd:
.LFB7386:
	.cfi_startproc
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	sin
	.cfi_endproc
.LFE7386:
	.size	_Z6BM_sindd, .-_Z6BM_sindd
	.p2align 4
	.globl	_Z6BM_tandd
	.type	_Z6BM_tandd, @function
_Z6BM_tandd:
.LFB7387:
	.cfi_startproc
	vmovsd	%xmm1, %xmm1, %xmm0
	jmp	tan
	.cfi_endproc
.LFE7387:
	.size	_Z6BM_tandd, .-_Z6BM_tandd
	.p2align 4
	.globl	_Z13SolveCubicOptddd
	.type	_Z13SolveCubicOptddd, @function
_Z13SolveCubicOptddd:
.LFB7388:
	.cfi_startproc
	vmulsd	%xmm0, %xmm0, %xmm4
	vmovsd	%xmm0, %xmm0, %xmm3
	vxorpd	%xmm6, %xmm6, %xmm6
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmulsd	.LC4(%rip), %xmm1, %xmm8
	vmovddup	%xmm3, %xmm5
	vunpcklpd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm8, %xmm8
	vmulpd	%xmm5, %xmm0, %xmm10
	vsubsd	%xmm2, %xmm8, %xmm0
	vunpckhpd	%xmm10, %xmm10, %xmm7
	vunpcklpd	%xmm0, %xmm1, %xmm9
	vfnmadd132sd	%xmm3, %xmm0, %xmm4
	vsubpd	%xmm10, %xmm9, %xmm9
	vmulsd	%xmm9, %xmm9, %xmm0
	vmovsd	%xmm9, %xmm9, %xmm5
	vunpcklpd	%xmm4, %xmm0, %xmm0
	vmulpd	%xmm9, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm4
	vaddpd	%xmm0, %xmm4, %xmm4
	vcomisd	%xmm6, %xmm4
	jb	.L55
	vmulsd	.LC5(%rip), %xmm4, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vunpckhpd	%xmm9, %xmm9, %xmm9
	vcomisd	%xmm0, %xmm1
	jbe	.L56
	vcomisd	%xmm6, %xmm4
	vmovsd	%xmm9, 8(%rsp)
	vmovsd	%xmm4, %xmm4, %xmm0
	je	.L34
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	%xmm4, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm4
	vmovsd	8(%rsp), %xmm9
	vmulsd	%xmm0, %xmm0, %xmm5
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	24(%rsp), %xmm3
	vmulsd	.LC6(%rip), %xmm9, %xmm9
	vmulsd	%xmm0, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm4, %xmm1
	vfmadd132sd	.LC2(%rip), %xmm4, %xmm5
	vmulsd	%xmm0, %xmm1, %xmm0
	vdivsd	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm9, %xmm0, %xmm0
.L34:
	vdivsd	%xmm4, %xmm0, %xmm0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vsubsd	%xmm3, %xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
	vcomisd	%xmm6, %xmm9
	vsqrtsd	%xmm4, %xmm4, %xmm4
	vmovsd	%xmm5, 8(%rsp)
	jbe	.L58
	vaddsd	%xmm4, %xmm9, %xmm9
	vcomisd	%xmm6, %xmm9
	je	.L39
	vmovsd	%xmm9, %xmm9, %xmm0
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	%xmm9, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm9
	vmovsd	24(%rsp), %xmm3
	vmulsd	%xmm0, %xmm0, %xmm2
	vmovsd	8(%rsp), %xmm5
	vmulsd	%xmm0, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm9, %xmm1
	vfmadd132sd	.LC2(%rip), %xmm9, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
.L41:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcomisd	%xmm1, %xmm0
	je	.L39
	vsubsd	%xmm3, %xmm0, %xmm3
	vdivsd	%xmm0, %xmm5, %xmm0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vsubsd	%xmm0, %xmm3, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
	vsubsd	%xmm1, %xmm10, %xmm1
	vsubsd	%xmm8, %xmm2, %xmm2
	vmovsd	%xmm3, 24(%rsp)
	vsqrtsd	%xmm1, %xmm1, %xmm6
	vaddsd	%xmm7, %xmm2, %xmm2
	vmulsd	%xmm6, %xmm9, %xmm5
	vmovsd	%xmm6, 8(%rsp)
	vdivsd	%xmm5, %xmm2, %xmm2
	vmovsd	%xmm2, %xmm2, %xmm0
	vmovsd	%xmm2, 16(%rsp)
	call	acos
	vmovsd	16(%rsp), %xmm2
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovsd	24(%rsp), %xmm3
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	vcomisd	%xmm2, %xmm6
	jbe	.L44
	vaddsd	.LC8(%rip), %xmm0, %xmm0
.L44:
	vmovsd	%xmm3, 16(%rsp)
	call	cos
	vmovsd	8(%rsp), %xmm7
	vmovsd	16(%rsp), %xmm3
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vmovsd	%xmm0, %xmm0, %xmm1
	vaddsd	%xmm7, %xmm7, %xmm0
	vfmsub132sd	%xmm1, %xmm3, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_restore_state
	vsubsd	%xmm8, %xmm2, %xmm8
	vaddsd	%xmm7, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm8, %xmm8
	vcomisd	%xmm6, %xmm8
	je	.L39
	vmovsd	%xmm8, %xmm8, %xmm0
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	%xmm8, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm8
	vmovsd	8(%rsp), %xmm5
	vmulsd	%xmm0, %xmm0, %xmm2
	vmovsd	24(%rsp), %xmm3
	vmulsd	%xmm0, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm8, %xmm1
	vfmadd132sd	.LC2(%rip), %xmm8, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm1
	vdivsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
	vxorpd	.LC7(%rip), %xmm0, %xmm0
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L39:
	vxorpd	.LC7(%rip), %xmm3, %xmm0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7388:
	.size	_Z13SolveCubicOptddd, .-_Z13SolveCubicOptddd
	.p2align 4
	.globl	_Z5Cubicdd
	.type	_Z5Cubicdd, @function
_Z5Cubicdd:
.LFB7389:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	.LC10(%rip), %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmulsd	.LC9(%rip), %xmm1, %xmm1
	vsubsd	%xmm0, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm1, %xmm1, %xmm0
	vmulsd	%xmm3, %xmm3, %xmm2
	vfmadd132sd	%xmm3, %xmm0, %xmm2
	vcomisd	%xmm4, %xmm2
	jb	.L85
	vmulsd	.LC5(%rip), %xmm2, %xmm5
	vcomisd	%xmm0, %xmm5
	jbe	.L86
	vcomisd	%xmm4, %xmm2
	vmovsd	%xmm1, (%rsp)
	vmovsd	%xmm2, %xmm2, %xmm1
	je	.L65
	vmovsd	%xmm2, %xmm2, %xmm0
	vmovsd	%xmm2, 8(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	8(%rsp), %xmm2
	vmovsd	(%rsp), %xmm1
	vmulsd	%xmm0, %xmm0, %xmm5
	vmovsd	%xmm0, %xmm0, %xmm4
	vmulsd	.LC11(%rip), %xmm1, %xmm1
	vmulsd	%xmm0, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm2, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm2, %xmm5
	vmulsd	%xmm0, %xmm3, %xmm0
	vdivsd	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm1
.L65:
	vdivsd	%xmm2, %xmm1, %xmm1
.L60:
	vmovsd	%xmm1, %xmm1, %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L86:
	.cfi_restore_state
	vcomisd	%xmm1, %xmm4
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm3, (%rsp)
	jbe	.L88
	vsubsd	%xmm1, %xmm2, %xmm1
	vcomisd	%xmm4, %xmm1
	je	.L60
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	8(%rsp), %xmm1
	vmovsd	(%rsp), %xmm3
	vmulsd	%xmm0, %xmm0, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vsubsd	%xmm2, %xmm1, %xmm4
	vfmadd132sd	.LC2(%rip), %xmm1, %xmm2
	vmulsd	%xmm0, %xmm4, %xmm4
	vdivsd	%xmm2, %xmm4, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
.L71:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L60
	vdivsd	%xmm1, %xmm3, %xmm3
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vsubsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	.cfi_restore_state
	vxorpd	.LC7(%rip), %xmm3, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm6
	vmulsd	%xmm6, %xmm3, %xmm3
	vmovsd	%xmm6, (%rsp)
	vdivsd	%xmm3, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	acos
	vmovsd	8(%rsp), %xmm1
	vxorpd	%xmm4, %xmm4, %xmm4
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	vcomisd	%xmm1, %xmm4
	jbe	.L74
	vaddsd	.LC8(%rip), %xmm0, %xmm0
.L74:
	call	cos
	vmovsd	(%rsp), %xmm7
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vaddsd	%xmm7, %xmm7, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
	vaddsd	%xmm2, %xmm1, %xmm1
	vcomisd	%xmm4, %xmm1
	je	.L60
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	8(%rsp), %xmm1
	vmovsd	(%rsp), %xmm3
	vmulsd	%xmm0, %xmm0, %xmm4
	vmulsd	%xmm0, %xmm4, %xmm4
	vsubsd	%xmm4, %xmm1, %xmm2
	vfmadd132sd	.LC2(%rip), %xmm1, %xmm4
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm4, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
	vxorpd	.LC7(%rip), %xmm1, %xmm1
	jmp	.L71
	.cfi_endproc
.LFE7389:
	.size	_Z5Cubicdd, .-_Z5Cubicdd
	.p2align 4
	.globl	_Z4Padedd
	.type	_Z4Padedd, @function
_Z4Padedd:
.LFB7390:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	.LC12(%rip), %xmm4
	vfmadd213sd	.LC13(%rip), %xmm0, %xmm4
	vmovsd	.LC10(%rip), %xmm3
	vmovq	.LC7(%rip), %xmm5
	vmovsd	.LC15(%rip), %xmm8
	vsubsd	%xmm0, %xmm3, %xmm0
	vmulsd	.LC14(%rip), %xmm0, %xmm0
	vdivsd	%xmm4, %xmm3, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	.LC4(%rip), %xmm0, %xmm3
	vmulsd	%xmm1, %xmm1, %xmm6
	vxorpd	%xmm5, %xmm1, %xmm2
	vmovsd	%xmm1, %xmm1, %xmm7
	vmulsd	%xmm2, %xmm3, %xmm3
	vmulsd	%xmm6, %xmm2, %xmm2
	vsubsd	%xmm6, %xmm0, %xmm4
	vmulsd	%xmm4, %xmm4, %xmm9
	vfnmadd132sd	%xmm8, %xmm2, %xmm7
	vsubsd	%xmm2, %xmm3, %xmm2
	vfmadd231sd	%xmm8, %xmm1, %xmm2
	vxorpd	%xmm8, %xmm8, %xmm8
	vmulsd	%xmm2, %xmm2, %xmm10
	vfmadd132sd	%xmm4, %xmm10, %xmm9
	vcomisd	%xmm8, %xmm9
	jb	.L115
	vmulsd	.LC5(%rip), %xmm9, %xmm0
	vcomisd	%xmm10, %xmm0
	jbe	.L116
	vcomisd	%xmm8, %xmm9
	vmovsd	%xmm2, 8(%rsp)
	vmovsd	%xmm9, %xmm9, %xmm0
	je	.L95
	vmovsd	%xmm1, 24(%rsp)
	vmovsd	%xmm9, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm9
	vmovsd	8(%rsp), %xmm2
	vmulsd	%xmm0, %xmm0, %xmm5
	vmovsd	%xmm0, %xmm0, %xmm4
	vmovsd	24(%rsp), %xmm1
	vmulsd	.LC6(%rip), %xmm2, %xmm2
	vmulsd	%xmm0, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm9, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm9, %xmm5
	vmulsd	%xmm0, %xmm3, %xmm0
	vdivsd	%xmm5, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
.L95:
	vdivsd	%xmm9, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
.L90:
	vmovsd	%xmm1, %xmm1, %xmm0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	.cfi_restore_state
	vcomisd	%xmm8, %xmm2
	vsqrtsd	%xmm9, %xmm9, %xmm0
	vmovsd	%xmm4, 8(%rsp)
	jbe	.L118
	vaddsd	%xmm0, %xmm2, %xmm2
	vcomisd	%xmm8, %xmm2
	je	.L90
	vmovsd	%xmm2, %xmm2, %xmm0
	vmovsd	%xmm1, 24(%rsp)
	vmovsd	%xmm2, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm2
	vmovsd	24(%rsp), %xmm1
	vmulsd	%xmm0, %xmm0, %xmm5
	vmovsd	8(%rsp), %xmm4
	vmulsd	%xmm0, %xmm5, %xmm5
	vsubsd	%xmm5, %xmm2, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm2, %xmm5
	vmulsd	%xmm0, %xmm3, %xmm3
	vdivsd	%xmm5, %xmm3, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
.L101:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcomisd	%xmm2, %xmm0
	je	.L90
	vaddsd	%xmm1, %xmm0, %xmm1
	vdivsd	%xmm0, %xmm4, %xmm0
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vsubsd	%xmm0, %xmm1, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L115:
	.cfi_restore_state
	vsubsd	%xmm0, %xmm6, %xmm6
	vsubsd	%xmm3, %xmm7, %xmm7
	vmovsd	%xmm1, 24(%rsp)
	vsqrtsd	%xmm6, %xmm6, %xmm5
	vmulsd	%xmm5, %xmm4, %xmm0
	vmovsd	%xmm5, 8(%rsp)
	vdivsd	%xmm0, %xmm7, %xmm7
	vmovsd	%xmm7, %xmm7, %xmm0
	vmovsd	%xmm7, 16(%rsp)
	call	acos
	vmovsd	16(%rsp), %xmm7
	vxorpd	%xmm8, %xmm8, %xmm8
	vmovsd	24(%rsp), %xmm1
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	vcomisd	%xmm7, %xmm8
	jbe	.L104
	vaddsd	.LC8(%rip), %xmm0, %xmm0
.L104:
	vmovsd	%xmm1, 16(%rsp)
	call	cos
	vmovsd	8(%rsp), %xmm6
	vmovsd	16(%rsp), %xmm1
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vmovsd	%xmm0, %xmm0, %xmm2
	vaddsd	%xmm6, %xmm6, %xmm0
	vfmadd231sd	%xmm0, %xmm2, %xmm1
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	.cfi_restore_state
	vsubsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm7, %xmm0, %xmm7
	vcomisd	%xmm8, %xmm7
	je	.L90
	vmovsd	%xmm7, %xmm7, %xmm0
	vmovsd	%xmm1, 24(%rsp)
	vmovsd	%xmm7, 16(%rsp)
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	16(%rsp), %xmm7
	vmovq	.LC7(%rip), %xmm5
	vmulsd	%xmm0, %xmm0, %xmm6
	vmovsd	8(%rsp), %xmm4
	vmovsd	24(%rsp), %xmm1
	vmulsd	%xmm0, %xmm6, %xmm6
	vsubsd	%xmm6, %xmm7, %xmm3
	vfmadd132sd	.LC2(%rip), %xmm7, %xmm6
	vmulsd	%xmm0, %xmm3, %xmm3
	vdivsd	%xmm6, %xmm3, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	vxorpd	%xmm5, %xmm0, %xmm0
	jmp	.L101
	.cfi_endproc
.LFE7390:
	.size	_Z4Padedd, .-_Z4Padedd
	.p2align 4
	.globl	_Z5Basicdd
	.type	_Z5Basicdd, @function
_Z5Basicdd:
.LFB7391:
	.cfi_startproc
	vmovsd	%xmm0, %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm1, %xmm1, %xmm4
	vcomisd	%xmm0, %xmm1
	je	.L135
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	vcomisd	%xmm2, %xmm0
	ja	.L138
	vmovsd	.LC10(%rip), %xmm7
	vmovq	.LC7(%rip), %xmm3
	vmovsd	%xmm7, 16(%rsp)
	vsubsd	%xmm2, %xmm7, %xmm7
	vmovapd	%xmm3, (%rsp)
.L124:
	vmulsd	%xmm2, %xmm2, %xmm5
	vmovsd	%xmm7, 56(%rsp)
	vmulsd	.LC18(%rip), %xmm4, %xmm0
	vmovsd	%xmm2, 48(%rsp)
	vmovsd	%xmm4, 24(%rsp)
	vmovsd	%xmm5, 40(%rsp)
	call	sin
	vmovsd	24(%rsp), %xmm4
	vmulsd	%xmm0, %xmm0, %xmm3
	vmovsd	%xmm4, %xmm4, %xmm0
	vaddsd	%xmm3, %xmm3, %xmm3
	vmovsd	%xmm3, 32(%rsp)
	call	sin
	vmovsd	48(%rsp), %xmm2
	vmovsd	40(%rsp), %xmm5
	vmovsd	%xmm0, %xmm0, %xmm6
	vmovsd	.LC13(%rip), %xmm0
	vmovsd	.LC19(%rip), %xmm8
	vmovsd	%xmm2, %xmm2, %xmm1
	vmovsd	56(%rsp), %xmm7
	vfmadd132sd	.LC12(%rip), %xmm0, %xmm1
	vfmadd132sd	%xmm5, %xmm8, %xmm0
	vmovsd	32(%rsp), %xmm3
	vmovsd	24(%rsp), %xmm4
	vmulsd	%xmm5, %xmm1, %xmm1
	vfmadd231sd	%xmm8, %xmm7, %xmm1
	vxorpd	%xmm8, %xmm8, %xmm8
	vfnmadd132sd	%xmm3, %xmm1, %xmm0
	vmovsd	.LC16(%rip), %xmm1
	vcomisd	%xmm8, %xmm0
	je	.L125
	vmovsd	16(%rsp), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
.L125:
	vfmadd132sd	%xmm2, %xmm7, %xmm3
	vmovsd	.LC14(%rip), %xmm0
	vmovsd	%xmm4, 24(%rsp)
	vmulsd	.LC20(%rip), %xmm6, %xmm2
	vaddsd	%xmm0, %xmm5, %xmm5
	vmulsd	%xmm0, %xmm3, %xmm3
	vmulsd	%xmm6, %xmm5, %xmm5
	vmulsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm5, %xmm5
	vmulsd	%xmm1, %xmm3, %xmm1
	vxorpd	(%rsp), %xmm5, %xmm0
	call	_Z13SolveCubicOptddd
	vmovsd	24(%rsp), %xmm4
	vxorpd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm4, %xmm1
	vcomisd	%xmm1, %xmm2
	ja	.L139
	vmovsd	16(%rsp), %xmm1
.L126:
	vmovsd	%xmm4, (%rsp)
	call	atan2
	vmovq	.LC21(%rip), %xmm1
	vmovsd	(%rsp), %xmm4
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vandpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm1, %xmm4, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm4, %xmm0, %xmm4
	vmovsd	%xmm4, %xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L138:
	.cfi_restore_state
	vmovsd	.LC10(%rip), %xmm6
	vaddsd	%xmm6, %xmm2, %xmm7
	vmovsd	%xmm6, 16(%rsp)
	vmovq	.LC7(%rip), %xmm6
	vmovapd	%xmm6, (%rsp)
	vxorpd	%xmm6, %xmm2, %xmm2
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L135:
	.cfi_def_cfa_offset 8
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L139:
	.cfi_def_cfa_offset 80
	vxorpd	(%rsp), %xmm0, %xmm0
	vmovsd	.LC17(%rip), %xmm1
	jmp	.L126
	.cfi_endproc
.LFE7391:
	.size	_Z5Basicdd, .-_Z5Basicdd
	.p2align 4
	.globl	_Z6Betterdd
	.type	_Z6Betterdd, @function
_Z6Betterdd:
.LFB7392:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm0, 8(%rsp)
	leaq	16(%rsp), %rsi
	vmovsd	%xmm1, %xmm1, %xmm0
	leaq	24(%rsp), %rdi
	vmovsd	%xmm1, (%rsp)
	call	sincos
	vmovsd	8(%rsp), %xmm5
	vmovsd	.LC22(%rip), %xmm0
	vmovsd	16(%rsp), %xmm1
	vmovsd	.LC10(%rip), %xmm7
	vmulsd	%xmm5, %xmm5, %xmm2
	vmovsd	24(%rsp), %xmm6
	vmovsd	%xmm2, %xmm2, %xmm3
	vfnmadd213sd	.LC12(%rip), %xmm0, %xmm3
	vfmadd231sd	.LC23(%rip), %xmm2, %xmm0
	vfmadd213sd	.LC13(%rip), %xmm2, %xmm0
	vfmadd213sd	.LC19(%rip), %xmm2, %xmm0
	vfmadd213sd	.LC24(%rip), %xmm3, %xmm2
	vmulsd	%xmm5, %xmm2, %xmm3
	vmulsd	.LC20(%rip), %xmm6, %xmm2
	vfmadd231sd	%xmm1, %xmm0, %xmm3
	vsubsd	%xmm5, %xmm1, %xmm1
	vmulsd	.LC25(%rip), %xmm0, %xmm0
	vmulsd	.LC14(%rip), %xmm1, %xmm1
	vdivsd	%xmm3, %xmm7, %xmm3
	vmulsd	%xmm3, %xmm6, %xmm6
	vmulsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm6, %xmm0, %xmm0
	call	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm4
	vxorpd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm4, %xmm1
	vcomisd	%xmm1, %xmm2
	ja	.L149
	movq	.LC10(%rip), %rax
	vmovq	%rax, %xmm1
.L141:
	vmovsd	%xmm4, (%rsp)
	call	atan2
	vmovq	.LC21(%rip), %xmm1
	vmovsd	(%rsp), %xmm4
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vandpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm1, %xmm4, %xmm1
	vcmpnltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm0, %xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L149:
	.cfi_restore_state
	vxorpd	.LC7(%rip), %xmm0, %xmm0
	vmovsd	.LC17(%rip), %xmm1
	jmp	.L141
	.cfi_endproc
.LFE7392:
	.size	_Z6Betterdd, .-_Z6Betterdd
	.p2align 4
	.globl	_Z10Gooding_S3dd
	.type	_Z10Gooding_S3dd, @function
_Z10Gooding_S3dd:
.LFB7393:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm0, 8(%rsp)
	leaq	16(%rsp), %rsi
	vmovsd	%xmm1, %xmm1, %xmm0
	leaq	24(%rsp), %rdi
	vmovsd	%xmm1, (%rsp)
	call	sincos
	vmovsd	8(%rsp), %xmm2
	vmulsd	24(%rsp), %xmm2, %xmm0
	vmovsd	.LC10(%rip), %xmm3
	vfmadd132sd	16(%rsp), %xmm3, %xmm2
	vmovsd	(%rsp), %xmm1
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	vfmadd132sd	%xmm2, %xmm1, %xmm0
	ret
	.cfi_endproc
.LFE7393:
	.size	_Z10Gooding_S3dd, .-_Z10Gooding_S3dd
	.p2align 4
	.globl	_Z10Gooding_S9dd
	.type	_Z10Gooding_S9dd, @function
_Z10Gooding_S9dd:
.LFB7394:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm0, 8(%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L154
	vmulsd	.LC18(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)
	call	sin
	vmovsd	16(%rsp), %xmm1
	vmovsd	%xmm0, 24(%rsp)
	vmovsd	%xmm1, %xmm1, %xmm0
	call	sin
	vmovsd	24(%rsp), %xmm2
	vmovsd	8(%rsp), %xmm4
	vmovsd	.LC10(%rip), %xmm3
	vmovsd	16(%rsp), %xmm1
	vmulsd	%xmm2, %xmm2, %xmm2
	vmulsd	.LC26(%rip), %xmm2, %xmm2
	vsubsd	%xmm4, %xmm3, %xmm3
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm2, %xmm2
	vfmadd132sd	%xmm3, %xmm2, %xmm3
	vsqrtsd	%xmm3, %xmm3, %xmm3
	vdivsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L154:
	.cfi_restore_state
	vmovsd	%xmm1, %xmm1, %xmm0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7394:
	.size	_Z10Gooding_S9dd, .-_Z10Gooding_S9dd
	.p2align 4
	.globl	_Z12Gooding_S9s2dd
	.type	_Z12Gooding_S9s2dd, @function
_Z12Gooding_S9s2dd:
.LFB7395:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm0, (%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L158
	vmulsd	.LC18(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	sin
	vmovsd	(%rsp), %xmm4
	vmovsd	.LC10(%rip), %xmm3
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	8(%rsp), %xmm1
	vmulsd	%xmm0, %xmm4, %xmm5
	vfnmadd132sd	%xmm0, %xmm3, %xmm2
	vsubsd	%xmm4, %xmm3, %xmm3
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd132sd	%xmm3, %xmm0, %xmm3
	vdivsd	%xmm3, %xmm2, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm2, %xmm2
	vfmadd132sd	%xmm2, %xmm1, %xmm5
	vmovsd	%xmm5, %xmm5, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	.cfi_restore_state
	vmovsd	%xmm1, %xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7395:
	.size	_Z12Gooding_S9s2dd, .-_Z12Gooding_S9s2dd
	.p2align 4
	.globl	_Z4S9t2dd
	.type	_Z4S9t2dd, @function
_Z4S9t2dd:
.LFB7396:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	%xmm0, (%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L162
	vmulsd	.LC18(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)
	call	tan
	vmovsd	(%rsp), %xmm2
	vmovsd	.LC10(%rip), %xmm5
	vmulsd	%xmm0, %xmm0, %xmm3
	vmovsd	8(%rsp), %xmm1
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	vaddsd	%xmm2, %xmm2, %xmm4
	vmulsd	%xmm0, %xmm4, %xmm0
	vsubsd	%xmm2, %xmm5, %xmm4
	vaddsd	%xmm5, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	vaddsd	%xmm5, %xmm3, %xmm3
	vfmadd132sd	%xmm4, %xmm2, %xmm4
	vmulsd	%xmm4, %xmm3, %xmm3
	vsqrtsd	%xmm3, %xmm3, %xmm3
	vdivsd	%xmm3, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L162:
	.cfi_restore_state
	vmovsd	%xmm1, %xmm1, %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7396:
	.size	_Z4S9t2dd, .-_Z4S9t2dd
	.p2align 4
	.globl	_Z7S9t2p54dd
	.type	_Z7S9t2p54dd, @function
_Z7S9t2p54dd:
.LFB7397:
	.cfi_startproc
	vmovsd	%xmm0, %xmm0, %xmm3
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm1
	je	.L169
	vmovsd	.LC27(%rip), %xmm0
	vmulsd	.LC18(%rip), %xmm1, %xmm4
	vcomisd	%xmm1, %xmm0
	ja	.L172
	vsubsd	%xmm4, %xmm0, %xmm0
	vmovsd	.LC30(%rip), %xmm6
	vmovsd	.LC28(%rip), %xmm5
	vmulsd	%xmm0, %xmm0, %xmm4
	vsubsd	.LC31(%rip), %xmm4, %xmm2
	vfmadd213sd	.LC29(%rip), %xmm4, %xmm5
	vfmadd132sd	%xmm4, %xmm6, %xmm2
	vfmadd132sd	%xmm4, %xmm6, %xmm5
	vmulsd	%xmm0, %xmm2, %xmm2
.L168:
	vmovsd	.LC10(%rip), %xmm4
	vmulsd	%xmm2, %xmm5, %xmm6
	vsubsd	%xmm3, %xmm4, %xmm0
	vaddsd	%xmm4, %xmm3, %xmm4
	vaddsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm0, %xmm2, %xmm0
	vmulsd	%xmm5, %xmm5, %xmm5
	vmulsd	%xmm3, %xmm6, %xmm6
	vmulsd	%xmm4, %xmm4, %xmm4
	vfmadd132sd	%xmm2, %xmm5, %xmm2
	vfmadd132sd	%xmm0, %xmm4, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm6, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L172:
	vmulsd	%xmm4, %xmm4, %xmm0
	vmovsd	.LC30(%rip), %xmm6
	vmovsd	.LC28(%rip), %xmm2
	vsubsd	.LC31(%rip), %xmm0, %xmm5
	vfmadd213sd	.LC29(%rip), %xmm0, %xmm2
	vfmadd132sd	%xmm0, %xmm6, %xmm5
	vfmadd132sd	%xmm0, %xmm6, %xmm2
	vmulsd	%xmm4, %xmm5, %xmm5
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L169:
	vmovsd	%xmm1, %xmm1, %xmm0
	ret
	.cfi_endproc
.LFE7397:
	.size	_Z7S9t2p54dd, .-_Z7S9t2p54dd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC34:
	.string	"y %g"
	.text
	.p2align 4
	.globl	_Z7TimeFunPFdddEd
	.type	_Z7TimeFunPFdddEd, @function
_Z7TimeFunPFdddEd:
.LFB7398:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	vmovq	%xmm0, %r14
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	rdtsc
	movl	$10000000, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$0x000000000, (%rsp)
	movq	%rax, %r12
	salq	$32, %rdx
	orq	%rdx, %r12
	.p2align 4,,10
	.p2align 3
.L174:
	vmovsd	%xmm1, 8(%rsp)
	vmovq	%r14, %xmm0
	call	*%rbp
	vaddsd	(%rsp), %xmm0, %xmm2
	vmovsd	8(%rsp), %xmm1
	vaddsd	.LC32(%rip), %xmm1, %xmm1
	vmovsd	%xmm2, (%rsp)
	decl	%ebx
	jne	.L174
	rdtsc
	vmovsd	.LC33(%rip), %xmm0
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	%xmm0, %xmm2
	je	.L180
.L175:
	subq	%r12, %rbx
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movabsq	$-2972493582642298179, %rax
	leaq	5000000(%rbx), %rcx
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	imulq	%rcx
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	leaq	(%rdx,%rcx), %rax
	sarq	$63, %rcx
	sarq	$23, %rax
	subl	%ecx, %eax
	ret
.L180:
	.cfi_restore_state
	movl	$.LC34, %edi
	movl	$1, %eax
	call	printf
	jmp	.L175
	.cfi_endproc
.LFE7398:
	.size	_Z7TimeFunPFdddEd, .-_Z7TimeFunPFdddEd
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC35:
	.string	"%-8s ( %g, %g ) = %20.14g  t = "
	.section	.rodata.str1.1
.LC37:
	.string	"\t%i"
	.text
	.p2align 4
	.globl	_Z6DoTestPKcPFdddEdd
	.type	_Z6DoTestPKcPFdddEdd, @function
_Z6DoTestPKcPFdddEdd:
.LFB7399:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movabsq	$-2972493582642298179, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	$6, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	vmovsd	%xmm1, 8(%rsp)
	vmovsd	%xmm0, (%rsp)
	call	*%rsi
	vmovsd	(%rsp), %xmm3
	vmovsd	8(%rsp), %xmm1
	movq	%rbx, %rsi
	vmovsd	%xmm0, %xmm0, %xmm2
	movl	$.LC35, %edi
	movl	$3, %eax
	vmovsd	%xmm3, %xmm3, %xmm0
	call	printf
	.p2align 4,,10
	.p2align 3
.L187:
	rdtsc
	movl	$10000000, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$0x000000000, (%rsp)
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L182:
	movq	.LC36(%rip), %rax
	vmovsd	%xmm1, 8(%rsp)
	vmovq	%rax, %xmm0
	call	*%rbp
	vaddsd	(%rsp), %xmm0, %xmm4
	vmovsd	8(%rsp), %xmm1
	vaddsd	.LC32(%rip), %xmm1, %xmm1
	vmovsd	%xmm4, (%rsp)
	decl	%ebx
	jne	.L182
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm4
	je	.L195
.L193:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L187
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	putchar
.L195:
	.cfi_restore_state
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L193
	.cfi_endproc
.LFE7399:
	.size	_Z6DoTestPKcPFdddEdd, .-_Z6DoTestPKcPFdddEdd
	.section	.rodata.str1.1
.LC40:
	.string	"cbrt"
.LC44:
	.string	"cbrt3"
.LC47:
	.string	"sqrt"
.LC49:
	.string	"exp"
.LC51:
	.string	"log"
.LC56:
	.string	"cos"
.LC58:
	.string	"sin"
.LC60:
	.string	"tan"
.LC62:
	.string	"S3"
.LC63:
	.string	"S9"
.LC70:
	.string	"S9s2"
.LC73:
	.string	"S9t2"
.LC78:
	.string	"S9t2p54"
.LC79:
	.string	"Cubic"
.LC81:
	.string	"Pade"
.LC84:
	.string	"Basic"
.LC90:
	.string	"Better"
	.text
	.p2align 4
	.globl	_Z7TestAlldd
	.type	_Z7TestAlldd, @function
_Z7TestAlldd:
.LFB7400:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movabsq	$-2972493582642298179, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	$6, %r12d
	pushq	%rbx
	subq	$200, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	vmovsd	%xmm0, -80(%rbp)
	vmovsd	%xmm1, %xmm1, %xmm0
	vmovsd	%xmm1, -72(%rbp)
	call	cbrt
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC40, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L203:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	xorl	%ebx, %ebx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L197:
	vmovapd	%ymm1, %ymm0
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vmovapd	%ymm2, -144(%rbp)
	incl	%ebx
	vmovapd	%ymm1, -112(%rbp)
	call	_ZGVdN4v_cbrt
	cmpl	$2499999, %ebx
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vaddpd	%ymm0, %ymm2, %ymm2
	jne	.L197
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC41(%rip), %xmm0
	je	.L434
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L203
.L202:
	movl	$10, %edi
	call	putchar
	vmovsd	-72(%rbp), %xmm6
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm6
	je	.L406
	vmovsd	%xmm6, %xmm6, %xmm0
	call	log
	vmulsd	.LC1(%rip), %xmm0, %xmm0
	call	exp
	vmovsd	-72(%rbp), %xmm6
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm6, %xmm2
	vfmadd132sd	.LC2(%rip), %xmm6, %xmm1
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vmovsd	%xmm6, %xmm6, %xmm1
	vaddsd	%xmm0, %xmm2, %xmm2
.L204:
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC44, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	movabsq	$-2972493582642298179, %r13
	movl	$6, %r12d
	call	printf
	.p2align 4,,10
	.p2align 3
.L211:
	rdtsc
	vmovapd	.LC39(%rip), %ymm4
	xorl	%ebx, %ebx
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L206:
	vmovapd	%ymm4, %ymm1
	vaddpd	.LC42(%rip), %ymm4, %ymm4
	vmovapd	%ymm5, -176(%rbp)
	incl	%ebx
	vmovapd	%ymm1, %ymm0
	vmovapd	%ymm1, -112(%rbp)
	vmovapd	%ymm4, -144(%rbp)
	call	_ZGVdN4v_log
	vmulpd	.LC45(%rip), %ymm0, %ymm0
	call	_ZGVdN4v_exp
	vmovapd	-112(%rbp), %ymm1
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovapd	-176(%rbp), %ymm5
	vmulpd	%ymm0, %ymm0, %ymm3
	cmpl	$2500000, %ebx
	vmovapd	-144(%rbp), %ymm4
	vmulpd	%ymm0, %ymm3, %ymm3
	vsubpd	%ymm3, %ymm1, %ymm2
	vfmadd132pd	.LC46(%rip), %ymm1, %ymm3
	vcmpneqpd	%ymm6, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm2, %ymm2
	vdivpd	%ymm3, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm2, %ymm0
	vandpd	%ymm0, %ymm1, %ymm1
	vaddpd	%ymm1, %ymm5, %ymm5
	jne	.L206
	vextractf128	$0x1, %ymm5, %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm0
	je	.L435
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L211
.L210:
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC47, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	vsqrtsd	%xmm1, %xmm1, %xmm2
	call	printf
	.p2align 4,,10
	.p2align 3
.L218:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r14
	salq	$32, %rdx
	xorl	%eax, %eax
	orq	%rdx, %r14
.L212:
	vmovapd	%ymm1, %ymm0
	incl	%eax
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vsqrtpd	%ymm0, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	cmpl	$2499999, %eax
	jne	.L212
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC48(%rip), %xmm0
	je	.L436
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L218
.L217:
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-72(%rbp), %xmm0
	call	exp
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC49, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L225:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	xorl	%ebx, %ebx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L219:
	vmovapd	%ymm1, %ymm0
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vmovapd	%ymm2, -144(%rbp)
	incl	%ebx
	vmovapd	%ymm1, -112(%rbp)
	call	_ZGVdN4v_exp
	cmpl	$2499999, %ebx
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vaddpd	%ymm0, %ymm2, %ymm2
	jne	.L219
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC50(%rip), %xmm0
	je	.L437
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L225
.L224:
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-72(%rbp), %xmm6
	vaddsd	.LC3(%rip), %xmm6, %xmm0
	call	log
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC51, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L232:
	rdtsc
	vmovapd	.LC38(%rip), %ymm2
	xorl	%r14d, %r14d
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rax, %rbx
	salq	$32, %rdx
	orq	%rdx, %rbx
.L226:
	vmovapd	%ymm2, %ymm0
	vaddpd	.LC42(%rip), %ymm2, %ymm2
	vaddpd	.LC54(%rip), %ymm0, %ymm0
	incl	%r14d
	vmovapd	%ymm1, -144(%rbp)
	vmovapd	%ymm2, -112(%rbp)
	call	_ZGVdN4v_log
	vmovapd	-144(%rbp), %ymm1
	vmovapd	-112(%rbp), %ymm2
	cmpl	$2499999, %r14d
	vaddpd	%ymm0, %ymm1, %ymm1
	jne	.L226
	vmovapd	%xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm7
	vmovapd	.LC52(%rip), %xmm0
	vmovapd	%xmm7, -112(%rbp)
	vzeroupper
	call	_ZGVbN2v_log
	vaddpd	-112(%rbp), %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r14
	orq	%rdx, %r14
	vcomisd	.LC53(%rip), %xmm0
	je	.L438
.L412:
	subq	%rbx, %r14
	movl	$.LC37, %edi
	leaq	5000000(%r14), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L232
	vmovsd	-72(%rbp), %xmm0
	leaq	-64(%rbp), %rsi
	leaq	-56(%rbp), %rdi
	movl	$6, %r13d
	movabsq	$-2972493582642298179, %r14
	call	sincos
	vmovsd	-56(%rbp), %xmm4
	movq	-64(%rbp), %rbx
	movl	$10, %edi
	vmovsd	%xmm4, -176(%rbp)
	call	putchar
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	vmovq	%rbx, %xmm2
	movl	$.LC56, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	call	printf
	movq	%rbx, -208(%rbp)
	.p2align 4,,10
	.p2align 3
.L239:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	xorl	%ebx, %ebx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r12
	salq	$32, %rdx
	orq	%rdx, %r12
.L233:
	vmovapd	%ymm1, %ymm0
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vmovapd	%ymm2, -144(%rbp)
	incl	%ebx
	vmovapd	%ymm1, -112(%rbp)
	call	_ZGVdN4v_cos
	cmpl	$2499999, %ebx
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vaddpd	%ymm0, %ymm2, %ymm2
	jne	.L233
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r15
	orq	%rdx, %r15
	vcomisd	.LC57(%rip), %xmm0
	je	.L439
	subq	%r12, %r15
	movl	$.LC37, %edi
	leaq	5000000(%r15), %rcx
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r13d
	jne	.L239
.L431:
	movl	$10, %edi
	movl	$6, %r13d
	movq	-208(%rbp), %rbx
	movabsq	$-2972493582642298179, %r14
	call	putchar
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC58, %esi
	vmovsd	-176(%rbp), %xmm2
	movl	$.LC35, %edi
	movl	$3, %eax
	call	printf
	movq	%rbx, -208(%rbp)
.L246:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	xorl	%ebx, %ebx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r12
	salq	$32, %rdx
	orq	%rdx, %r12
.L240:
	vmovapd	%ymm1, %ymm0
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vmovapd	%ymm2, -144(%rbp)
	incl	%ebx
	vmovapd	%ymm1, -112(%rbp)
	call	_ZGVdN4v_sin
	cmpl	$2499999, %ebx
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vaddpd	%ymm0, %ymm2, %ymm2
	jne	.L240
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r15
	orq	%rdx, %r15
	vcomisd	.LC59(%rip), %xmm0
	je	.L440
	subq	%r12, %r15
	movl	$.LC37, %edi
	leaq	5000000(%r15), %rcx
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r13d
	jne	.L246
.L432:
	movl	$10, %edi
	movl	$6, %r13d
	movq	-208(%rbp), %rbx
	movabsq	$-2972493582642298179, %r14
	call	putchar
	vmovsd	-72(%rbp), %xmm0
	call	tan
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC60, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	movq	%rbx, -208(%rbp)
.L253:
	rdtsc
	vmovapd	.LC38(%rip), %ymm1
	xorl	%ebx, %ebx
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%rax, %r12
	salq	$32, %rdx
	orq	%rdx, %r12
.L247:
	vmovapd	%ymm1, %ymm0
	vaddpd	.LC42(%rip), %ymm1, %ymm1
	vmovapd	%ymm2, -144(%rbp)
	incl	%ebx
	vmovapd	%ymm1, -112(%rbp)
	call	_ZGVdN4v_tan
	cmpl	$2499999, %ebx
	vmovapd	-112(%rbp), %ymm1
	vmovapd	-144(%rbp), %ymm2
	vaddpd	%ymm0, %ymm2, %ymm2
	jne	.L247
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%xmm2, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r15
	orq	%rdx, %r15
	vcomisd	.LC61(%rip), %xmm0
	je	.L441
	subq	%r12, %r15
	movl	$.LC37, %edi
	leaq	5000000(%r15), %rcx
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r13d
	jne	.L253
.L433:
	movq	-208(%rbp), %rbx
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-80(%rbp), %xmm5
	movl	$.LC62, %esi
	vmovsd	.LC10(%rip), %xmm7
	vmovq	%rbx, %xmm2
	movl	$.LC35, %edi
	movl	$3, %eax
	vmulsd	-176(%rbp), %xmm5, %xmm6
	vfmadd132sd	%xmm5, %xmm7, %xmm2
	vmovsd	-72(%rbp), %xmm7
	vmovsd	%xmm5, %xmm5, %xmm0
	vmovsd	%xmm7, %xmm7, %xmm1
	vfmadd132sd	%xmm6, %xmm7, %xmm2
	vmovsd	%xmm6, -176(%rbp)
	call	printf
.L259:
	rdtsc
	movl	$9999999, %ebx
	movq	%rax, %r14
	movq	$0x000000000, -112(%rbp)
	movq	.LC32(%rip), %rax
	salq	$32, %rdx
	orq	%rdx, %r14
	vmovq	%rax, %xmm0
	.p2align 4,,10
	.p2align 3
.L254:
	leaq	-64(%rbp), %rsi
	leaq	-56(%rbp), %rdi
	vmovsd	%xmm0, -144(%rbp)
	call	sincos
	vmovsd	.LC36(%rip), %xmm2
	vmovsd	.LC10(%rip), %xmm4
	vmovsd	.LC36(%rip), %xmm6
	vfmadd132sd	-64(%rbp), %xmm4, %xmm2
	vmulsd	-56(%rbp), %xmm6, %xmm1
	vmovsd	-144(%rbp), %xmm0
	vfmadd132sd	%xmm2, %xmm0, %xmm1
	vaddsd	.LC32(%rip), %xmm0, %xmm0
	vaddsd	-112(%rbp), %xmm1, %xmm5
	vmovsd	%xmm5, -112(%rbp)
	decl	%ebx
	jne	.L254
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm5
	je	.L442
.L420:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L259
	movl	$10, %edi
	call	putchar
	vmovsd	.LC10(%rip), %xmm6
	vsubsd	-80(%rbp), %xmm6, %xmm5
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	-72(%rbp), %xmm6
	vcomisd	%xmm0, %xmm6
	vmovsd	%xmm5, -216(%rbp)
	vmovsd	%xmm6, %xmm6, %xmm2
	je	.L260
	vmulsd	.LC18(%rip), %xmm6, %xmm0
	call	sin
	vmovsd	-216(%rbp), %xmm7
	vmovsd	-176(%rbp), %xmm4
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	vmulsd	-80(%rbp), %xmm0, %xmm0
	vfmadd231sd	%xmm7, %xmm7, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm4, %xmm2
	vaddsd	-72(%rbp), %xmm2, %xmm2
.L260:
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC63, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	printf
	.p2align 4,,10
	.p2align 3
.L266:
	rdtsc
	vmovapd	.LC39(%rip), %ymm4
	xorl	%ebx, %ebx
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L261:
	vmovapd	%ymm4, %ymm2
	vaddpd	.LC42(%rip), %ymm4, %ymm4
	vmovapd	%ymm5, -208(%rbp)
	incl	%ebx
	vmulpd	.LC64(%rip), %ymm2, %ymm0
	vmovapd	%ymm2, -112(%rbp)
	vmovapd	%ymm4, -176(%rbp)
	call	_ZGVdN4v_sin
	vmovapd	-112(%rbp), %ymm2
	vmovapd	%ymm0, -144(%rbp)
	vmovapd	%ymm2, %ymm0
	call	_ZGVdN4v_sin
	vmovapd	-112(%rbp), %ymm2
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	-144(%rbp), %ymm1
	vbroadcastsd	.LC68(%rip), %ymm6
	vmulpd	.LC69(%rip), %ymm0, %ymm0
	cmpl	$2500000, %ebx
	vmulpd	%ymm1, %ymm1, %ymm1
	vmovapd	-208(%rbp), %ymm5
	vfmadd132pd	.LC65(%rip), %ymm6, %ymm1
	vsqrtpd	%ymm1, %ymm1
	vdivpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm2, %ymm0, %ymm0
	vcmpeqpd	%ymm4, %ymm2, %ymm2
	vmovapd	-176(%rbp), %ymm4
	vandnpd	%ymm0, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm5, %ymm5
	jne	.L261
	vextractf128	$0x1, %ymm5, %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm0
	je	.L443
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L266
.L265:
	movl	$10, %edi
	call	putchar
	vmovsd	-72(%rbp), %xmm7
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm7
	vmovsd	%xmm7, %xmm7, %xmm2
	je	.L267
	vmulsd	.LC18(%rip), %xmm7, %xmm0
	call	sin
	vmovsd	.LC10(%rip), %xmm1
	vmulsd	-80(%rbp), %xmm0, %xmm2
	vmovsd	-216(%rbp), %xmm7
	vfnmadd231sd	%xmm0, %xmm0, %xmm1
	vmulsd	.LC26(%rip), %xmm0, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vfmadd231sd	%xmm7, %xmm7, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vfmadd213sd	-72(%rbp), %xmm0, %xmm2
.L267:
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC70, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	printf
	.p2align 4,,10
	.p2align 3
.L273:
	rdtsc
	vmovapd	.LC39(%rip), %ymm4
	xorl	%ebx, %ebx
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L268:
	vmovapd	%ymm4, %ymm2
	vaddpd	.LC42(%rip), %ymm4, %ymm4
	vmovapd	%ymm5, -176(%rbp)
	incl	%ebx
	vmulpd	.LC64(%rip), %ymm2, %ymm0
	vmovapd	%ymm2, -112(%rbp)
	vmovapd	%ymm4, -144(%rbp)
	call	_ZGVdN4v_sin
	vmovapd	-112(%rbp), %ymm2
	vxorpd	%xmm5, %xmm5, %xmm5
	cmpl	$2500000, %ebx
	vmulpd	.LC69(%rip), %ymm0, %ymm3
	vmovapd	%ymm0, %ymm1
	vmovapd	-144(%rbp), %ymm4
	vfnmadd213pd	.LC71(%rip), %ymm0, %ymm1
	vmulpd	.LC72(%rip), %ymm0, %ymm0
	vfmadd213pd	.LC67(%rip), %ymm3, %ymm0
	vdivpd	%ymm0, %ymm1, %ymm0
	vsqrtpd	%ymm0, %ymm0
	vaddpd	%ymm0, %ymm0, %ymm0
	vfmadd132pd	%ymm0, %ymm2, %ymm3
	vcmpeqpd	%ymm5, %ymm2, %ymm2
	vmovapd	-176(%rbp), %ymm5
	vandnpd	%ymm3, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm5, %ymm5
	jne	.L268
	vextractf128	$0x1, %ymm5, %xmm0
	vaddpd	%xmm5, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm0
	je	.L444
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L273
.L272:
	movl	$10, %edi
	call	putchar
	vmovsd	-72(%rbp), %xmm4
	vxorpd	%xmm0, %xmm0, %xmm0
	vcomisd	%xmm0, %xmm4
	vmovsd	%xmm4, %xmm4, %xmm2
	je	.L274
	vmulsd	.LC18(%rip), %xmm4, %xmm0
	call	tan
	vmovsd	-80(%rbp), %xmm5
	vmovsd	.LC10(%rip), %xmm7
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm0, %xmm0, %xmm2
	vaddsd	%xmm5, %xmm5, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm2
	vaddsd	%xmm5, %xmm7, %xmm0
	vmovsd	-216(%rbp), %xmm7
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	.LC10(%rip), %xmm1, %xmm1
	vfmadd231sd	%xmm7, %xmm7, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm2
	vaddsd	-72(%rbp), %xmm2, %xmm2
.L274:
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	movl	$.LC73, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	printf
	.p2align 4,,10
	.p2align 3
.L280:
	rdtsc
	vmovapd	.LC39(%rip), %ymm3
	xorl	%ebx, %ebx
	vxorpd	%xmm4, %xmm4, %xmm4
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
.L275:
	vmovapd	%ymm3, %ymm2
	vaddpd	.LC42(%rip), %ymm3, %ymm3
	vmovapd	%ymm4, -176(%rbp)
	incl	%ebx
	vmulpd	.LC64(%rip), %ymm2, %ymm0
	vmovapd	%ymm2, -112(%rbp)
	vmovapd	%ymm3, -144(%rbp)
	call	_ZGVdN4v_tan
	vmovapd	-112(%rbp), %ymm2
	vxorpd	%xmm6, %xmm6, %xmm6
	vbroadcastsd	.LC75(%rip), %ymm5
	vmulpd	%ymm0, %ymm0, %ymm1
	vmovapd	-176(%rbp), %ymm4
	cmpl	$2500000, %ebx
	vmovapd	-144(%rbp), %ymm3
	vfmadd213pd	.LC67(%rip), %ymm1, %ymm5
	vaddpd	.LC71(%rip), %ymm1, %ymm1
	vmulpd	.LC76(%rip), %ymm0, %ymm0
	vmulpd	%ymm5, %ymm1, %ymm1
	vsqrtpd	%ymm1, %ymm1
	vdivpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm2, %ymm0, %ymm0
	vcmpeqpd	%ymm6, %ymm2, %ymm2
	vandnpd	%ymm0, %ymm2, %ymm2
	vaddpd	%ymm2, %ymm4, %ymm4
	jne	.L275
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%xmm4, %xmm0, %xmm0
	vunpckhpd	%xmm0, %xmm0, %xmm1
	vaddpd	%xmm0, %xmm1, %xmm0
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm0
	je	.L445
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	vzeroupper
	call	printf
	decl	%r12d
	jne	.L280
.L279:
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-80(%rbp), %xmm7
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC78, %esi
	movl	$.LC35, %edi
	movl	$3, %eax
	vmovsd	%xmm7, %xmm7, %xmm0
	call	_Z7S9t2p54dd
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm7, %xmm7, %xmm0
	call	printf
	.p2align 4,,10
	.p2align 3
.L286:
	rdtsc
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovsd	%xmm7, %xmm7, %xmm1
	movq	%rax, %r14
	salq	$32, %rdx
	movl	$10000000, %eax
	orq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L281:
	movq	.LC36(%rip), %rdi
	vmovq	%rdi, %xmm0
	call	_Z7S9t2p54dd
	vaddsd	.LC32(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm7, %xmm7
	decl	%eax
	jne	.L281
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm7
	je	.L446
.L424:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L286
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	.LC9(%rip), %xmm5
	vmulsd	-72(%rbp), %xmm5, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	-216(%rbp), %xmm7
	vaddsd	%xmm7, %xmm7, %xmm1
	call	_Z13SolveCubicOptddd
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC79, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L292:
	rdtsc
	movl	$10000000, %ebx
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	$0x000000000, -112(%rbp)
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L287:
	vmulsd	.LC9(%rip), %xmm3, %xmm2
	movq	.LC80(%rip), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm3, -144(%rbp)
	vmovq	%rax, %xmm1
	call	_Z13SolveCubicOptddd
	vaddsd	-112(%rbp), %xmm0, %xmm6
	vmovsd	-144(%rbp), %xmm3
	vaddsd	.LC32(%rip), %xmm3, %xmm3
	vmovsd	%xmm6, -112(%rbp)
	decl	%ebx
	jne	.L287
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm6
	je	.L447
.L425:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L292
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	.LC13(%rip), %xmm4
	vmovsd	-80(%rbp), %xmm1
	vmovsd	.LC10(%rip), %xmm6
	vmovsd	.LC14(%rip), %xmm5
	vfmadd132sd	.LC12(%rip), %xmm4, %xmm1
	vmulsd	-216(%rbp), %xmm5, %xmm0
	vdivsd	%xmm1, %xmm6, %xmm1
	vmulsd	-72(%rbp), %xmm1, %xmm3
	vxorpd	.LC7(%rip), %xmm3, %xmm3
	vmulsd	.LC15(%rip), %xmm3, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm3, %xmm3, %xmm0
	call	_Z13SolveCubicOptddd
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC81, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L298:
	rdtsc
	movl	$10000000, %ebx
	vxorpd	%xmm3, %xmm3, %xmm3
	movq	$0x000000000, -112(%rbp)
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L293:
	vmulsd	.LC82(%rip), %xmm3, %xmm0
	movq	.LC83(%rip), %rax
	vmovsd	%xmm3, -144(%rbp)
	vmulsd	.LC15(%rip), %xmm0, %xmm2
	vmovq	%rax, %xmm1
	call	_Z13SolveCubicOptddd
	vaddsd	-112(%rbp), %xmm0, %xmm6
	vmovsd	-144(%rbp), %xmm3
	vaddsd	.LC32(%rip), %xmm3, %xmm3
	vmovsd	%xmm6, -112(%rbp)
	decl	%ebx
	jne	.L293
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm6
	je	.L448
.L426:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L298
	movl	$10, %edi
	movl	$6, %r12d
	call	putchar
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	call	_Z5Basicdd
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC84, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	vmovsd	.LC85(%rip), %xmm6
	.p2align 4,,10
	.p2align 3
.L310:
	rdtsc
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$10000000, %ebx
	vmovsd	%xmm4, %xmm4, %xmm1
	vmovsd	%xmm4, %xmm4, %xmm0
	vaddsd	.LC32(%rip), %xmm0, %xmm3
	vaddsd	%xmm1, %xmm4, %xmm4
	movq	%rax, %r13
	salq	$32, %rdx
	orq	%rdx, %r13
	decl	%ebx
	je	.L449
	.p2align 4,,10
	.p2align 3
.L305:
	vcomisd	%xmm6, %xmm0
	je	.L321
	vmulsd	.LC18(%rip), %xmm3, %xmm0
	vmovsd	%xmm4, -176(%rbp)
	vmovsd	%xmm3, -112(%rbp)
	call	sin
	vmovsd	-112(%rbp), %xmm3
	vmulsd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm3, %xmm3, %xmm0
	vaddsd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, -144(%rbp)
	call	sin
	movq	.LC16(%rip), %rax
	vmovsd	-144(%rbp), %xmm2
	vmulsd	.LC86(%rip), %xmm2, %xmm1
	vmovsd	-112(%rbp), %xmm3
	vmovq	%rax, %xmm7
	movq	.LC87(%rip), %rax
	vmovsd	-176(%rbp), %xmm4
	vmovq	%rax, %xmm5
	vcomisd	%xmm5, %xmm1
	je	.L301
	vsubsd	%xmm1, %xmm5, %xmm1
	vmovsd	.LC10(%rip), %xmm7
	vdivsd	%xmm1, %xmm7, %xmm7
.L301:
	vmulsd	.LC88(%rip), %xmm0, %xmm8
	vmovsd	%xmm4, -144(%rbp)
	vmovsd	.LC89(%rip), %xmm4
	vfmadd132sd	.LC36(%rip), %xmm4, %xmm2
	vmovsd	%xmm3, -112(%rbp)
	vmulsd	.LC20(%rip), %xmm0, %xmm1
	vmulsd	.LC14(%rip), %xmm2, %xmm0
	vmulsd	%xmm7, %xmm8, %xmm8
	vmulsd	%xmm7, %xmm1, %xmm2
	vmulsd	%xmm7, %xmm0, %xmm1
	vmovsd	%xmm8, %xmm8, %xmm0
	call	_Z13SolveCubicOptddd
	vmovsd	-112(%rbp), %xmm3
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovsd	-144(%rbp), %xmm4
	vmulsd	%xmm0, %xmm3, %xmm1
	vcomisd	%xmm1, %xmm2
	ja	.L450
	movq	.LC10(%rip), %rax
	vmovq	%rax, %xmm1
.L302:
	vmovsd	%xmm4, -144(%rbp)
	vmovsd	%xmm3, -112(%rbp)
	call	atan2
	vmovsd	-112(%rbp), %xmm3
	vandpd	.LC21(%rip), %xmm3, %xmm2
	vmovsd	%xmm0, %xmm0, %xmm1
	vandpd	.LC21(%rip), %xmm1, %xmm0
	movq	.LC85(%rip), %rax
	vmovsd	-144(%rbp), %xmm4
	vcmpnltsd	%xmm2, %xmm0, %xmm0
	vmovq	%rax, %xmm6
	vblendvpd	%xmm0, %xmm1, %xmm3, %xmm1
.L300:
	vmovsd	%xmm3, %xmm3, %xmm0
	vaddsd	%xmm1, %xmm4, %xmm4
	vaddsd	.LC32(%rip), %xmm0, %xmm3
	decl	%ebx
	jne	.L305
.L449:
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm4
	je	.L451
.L428:
	subq	%r13, %rbx
	movl	$.LC37, %edi
	movabsq	$-2972493582642298179, %rax
	leaq	5000000(%rbx), %rcx
	imulq	%rcx
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	movq	.LC85(%rip), %rax
	decl	%r12d
	vmovq	%rax, %xmm6
	jne	.L310
	movl	$10, %edi
	movl	$6, %r12d
	movabsq	$-2972493582642298179, %r13
	call	putchar
	vmovsd	-72(%rbp), %xmm1
	vmovsd	-80(%rbp), %xmm0
	call	_Z6Betterdd
	vmovsd	-72(%rbp), %xmm1
	movl	$.LC90, %esi
	movl	$.LC35, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovsd	-80(%rbp), %xmm0
	movl	$3, %eax
	call	printf
	.p2align 4,,10
	.p2align 3
.L316:
	rdtsc
	movl	$10000000, %ebx
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	$0x000000000, -112(%rbp)
	movq	%rax, %r14
	salq	$32, %rdx
	orq	%rdx, %r14
	.p2align 4,,10
	.p2align 3
.L311:
	movq	.LC36(%rip), %rax
	vmovsd	%xmm1, -144(%rbp)
	vmovq	%rax, %xmm0
	call	_Z6Betterdd
	vaddsd	-112(%rbp), %xmm0, %xmm6
	vmovsd	-144(%rbp), %xmm1
	vaddsd	.LC32(%rip), %xmm1, %xmm1
	vmovsd	%xmm6, -112(%rbp)
	decl	%ebx
	jne	.L311
	rdtsc
	salq	$32, %rdx
	movq	%rax, %rbx
	orq	%rdx, %rbx
	vcomisd	.LC33(%rip), %xmm6
	je	.L452
.L429:
	subq	%r14, %rbx
	movl	$.LC37, %edi
	leaq	5000000(%rbx), %rcx
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L316
	addq	$200, %rsp
	movl	$10, %edi
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	putchar
	.p2align 4,,10
	.p2align 3
.L321:
	.cfi_restore_state
	vxorpd	%xmm1, %xmm1, %xmm1
	jmp	.L300
	.p2align 4,,10
	.p2align 3
.L450:
	movq	.LC17(%rip), %rax
	vxorpd	.LC7(%rip), %xmm0, %xmm0
	vmovq	%rax, %xmm1
	jmp	.L302
.L448:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L426
.L452:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L429
.L451:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L428
.L447:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L425
.L446:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L424
.L445:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L280
	jmp	.L279
.L444:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L273
	jmp	.L272
.L443:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L266
	jmp	.L265
.L442:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L420
.L441:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r12, %r15
	call	printf
	leaq	5000000(%r15), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r13d
	jne	.L253
	jmp	.L433
.L440:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r12, %r15
	call	printf
	leaq	5000000(%r15), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r13d
	jne	.L246
	jmp	.L432
.L439:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r12, %r15
	call	printf
	leaq	5000000(%r15), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r14
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r13d
	jne	.L239
	jmp	.L431
	.p2align 4,,10
	.p2align 3
.L438:
	movq	.LC55(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	movl	$1, %eax
	call	printf
	jmp	.L412
.L437:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L225
	jmp	.L224
.L436:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L218
	jmp	.L217
.L435:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L211
	jmp	.L210
.L434:
	movq	.LC33(%rip), %rax
	movl	$.LC34, %edi
	vmovq	%rax, %xmm0
	vzeroupper
	movl	$1, %eax
	subq	%r14, %rbx
	call	printf
	leaq	5000000(%rbx), %rcx
	movl	$.LC37, %edi
	movq	%rcx, %rax
	imulq	%r13
	xorl	%eax, %eax
	leaq	(%rdx,%rcx), %rsi
	sarq	$63, %rcx
	sarq	$23, %rsi
	subl	%ecx, %esi
	call	printf
	decl	%r12d
	jne	.L203
	jmp	.L202
.L406:
	vmovsd	%xmm6, %xmm6, %xmm2
	vmovsd	%xmm6, %xmm6, %xmm1
	jmp	.L204
	.cfi_endproc
.LFE7400:
	.size	_Z7TestAlldd, .-_Z7TestAlldd
	.section	.rodata.str1.1
.LC91:
	.string	"cuberoot of 27.0 is  %g\n"
.LC93:
	.string	"f(e= %g, M = %g ) = %g\n"
	.section	.rodata.str1.8
	.align 8
.LC94:
	.string	"Needs to settle down before timer is reliable\nSacrificial readings for Basic "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7401:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$.LC91, %edi
	movl	$1, %eax
	vmovsd	.LC13(%rip), %xmm0
	call	printf
	movq	.LC92(%rip), %rax
	vmovq	%rax, %xmm1
	movq	.LC10(%rip), %rax
	vmovq	%rax, %xmm0
	call	_Z5Basicdd
	movq	.LC92(%rip), %rax
	movl	$.LC93, %edi
	vmovsd	%xmm0, %xmm0, %xmm2
	vmovq	%rax, %xmm1
	movq	.LC10(%rip), %rax
	vmovq	%rax, %xmm0
	movl	$3, %eax
	call	printf
	movl	$.LC94, %edi
	call	puts
	movl	$10, %edi
	call	putchar
	movq	.LC92(%rip), %rax
	vmovq	%rax, %xmm1
	movq	.LC10(%rip), %rax
	vmovq	%rax, %xmm0
	call	_Z7TestAlldd
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7401:
	.size	main, .-main
	.set	.LC1,.LC45
	.set	.LC2,.LC46
	.set	.LC3,.LC54
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1073217536
	.align 8
.LC5:
	.long	-1598689907
	.long	1051772663
	.align 8
.LC6:
	.long	1431655765
	.long	1071994197
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	942502757
	.long	1073791314
	.align 8
.LC9:
	.long	0
	.long	-1073217536
	.set	.LC10,.LC71
	.align 8
.LC11:
	.long	1431655765
	.long	-1075489451
	.align 8
.LC12:
	.long	0
	.long	1075576832
	.align 8
.LC13:
	.long	0
	.long	1074266112
	.align 8
.LC14:
	.long	0
	.long	1077149696
	.align 8
.LC15:
	.long	0
	.long	1077805056
	.align 8
.LC16:
	.long	937459712
	.long	1128383353
	.align 8
.LC17:
	.long	0
	.long	-1074790400
	.set	.LC18,.LC64
	.align 8
.LC19:
	.long	0
	.long	1078853632
	.align 8
.LC20:
	.long	0
	.long	-1069678592
	.section	.rodata.cst16
	.align 16
.LC21:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC22:
	.long	387577849
	.long	1069057038
	.align 8
.LC23:
	.long	-1044261168
	.long	1064355038
	.align 8
.LC24:
	.long	0
	.long	-1068630016
	.align 8
.LC25:
	.long	1431655765
	.long	-1076538027
	.set	.LC26,.LC72
	.align 8
.LC27:
	.long	1413754136
	.long	1073291771
	.align 8
.LC28:
	.long	0
	.long	1076756480
	.align 8
.LC29:
	.long	0
	.long	-1065730048
	.align 8
.LC30:
	.long	0
	.long	1083017216
	.align 8
.LC31:
	.long	0
	.long	1079656448
	.set	.LC32,.LC38
	.align 8
.LC33:
	.long	0
	.long	1078263808
	.set	.LC36,.LC69
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC38:
	.long	261748427
	.long	1049957687
	.long	261748427
	.long	1051006263
	.long	-1754861008
	.long	1051697106
	.long	261748427
	.long	1052054839
	.align 32
.LC39:
	.long	0
	.long	0
	.long	261748427
	.long	1049957687
	.long	261748427
	.long	1051006263
	.long	-1754861008
	.long	1051697106
	.section	.rodata.cst8
	.align 8
.LC41:
	.long	-993496793
	.long	1078119832
	.section	.rodata.cst32
	.align 32
.LC42:
	.long	261748427
	.long	1052054839
	.long	261748427
	.long	1052054839
	.long	261748427
	.long	1052054839
	.long	261748427
	.long	1052054839
	.align 32
.LC45:
	.long	1431655765
	.long	1070945621
	.long	1431655765
	.long	1070945621
	.long	1431655765
	.long	1070945621
	.long	1431655765
	.long	1070945621
	.align 32
.LC46:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.section	.rodata.cst8
	.align 8
.LC48:
	.long	-1228083555
	.long	1078089568
	.align 8
.LC50:
	.long	1883429336
	.long	-1069782006
	.section	.rodata.cst16
	.align 16
.LC52:
	.long	-708517190
	.long	1074340346
	.long	-1093415
	.long	1074340346
	.section	.rodata.cst8
	.align 8
.LC53:
	.long	-1493159904
	.long	1081134330
	.section	.rodata.cst32
	.align 32
.LC54:
	.long	1322828606
	.long	727809917
	.long	1322828606
	.long	727809917
	.long	1322828606
	.long	727809917
	.long	1322828606
	.long	727809917
	.section	.rodata.cst8
	.align 8
.LC55:
	.long	4
	.long	1078263808
	.align 8
.LC57:
	.long	-97
	.long	1078329343
	.align 8
.LC59:
	.long	-265283916
	.long	1078263807
	.align 8
.LC61:
	.long	265283916
	.long	1078263808
	.section	.rodata.cst32
	.align 32
.LC64:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC65:
	.long	858993459
	.long	1074475827
	.long	858993459
	.long	1074475827
	.long	858993459
	.long	1074475827
	.long	858993459
	.long	1074475827
	.align 32
.LC67:
	.long	1889785612
	.long	1066863165
	.long	1889785612
	.long	1066863165
	.long	1889785612
	.long	1066863165
	.long	1889785612
	.long	1066863165
	.set	.LC68,.LC67
	.align 32
.LC69:
	.long	858993459
	.long	1072378675
	.long	858993459
	.long	1072378675
	.long	858993459
	.long	1072378675
	.long	858993459
	.long	1072378675
	.align 32
.LC71:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC72:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8
	.align 8
.LC75:
	.long	-1374389534
	.long	1074487623
	.section	.rodata.cst32
	.align 32
.LC76:
	.long	858993459
	.long	1073427251
	.long	858993459
	.long	1073427251
	.long	858993459
	.long	1073427251
	.long	858993459
	.long	1073427251
	.section	.rodata.cst8
	.align 8
.LC80:
	.long	858993460
	.long	1070805811
	.align 8
.LC82:
	.long	1175717305
	.long	-1078158731
	.align 8
.LC83:
	.long	-191953844
	.long	1070953431
	.align 8
.LC85:
	.long	261748427
	.long	-1097525961
	.align 8
.LC86:
	.long	-1546188227
	.long	1078924656
	.align 8
.LC87:
	.long	-1271310320
	.long	1076817608
	.align 8
.LC88:
	.long	-1030792151
	.long	-1070286603
	.align 8
.LC89:
	.long	858993460
	.long	1069757235
	.align 8
.LC92:
	.long	-1467459024
	.long	1071793142
	.ident	"GCC: (GNU) 12.3.1 20230508 (Red Hat 12.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
