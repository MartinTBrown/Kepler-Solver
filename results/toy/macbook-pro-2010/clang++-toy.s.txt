	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z9Ref_cbrt3d
LCPI0_0:
	.quad	4599676419421066581     ## double 0.33333333333333331
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9Ref_cbrt3d
	.p2align	4, 0x90
__Z9Ref_cbrt3d:                         ## @_Z9Ref_cbrt3d
	.cfi_startproc
## %bb.0:
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	je	LBB0_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	vmovsd	%xmm0, -8(%rbp)         ## 8-byte Spill
	callq	_log
	vmulsd	LCPI0_0(%rip), %xmm0, %xmm0
	callq	_exp
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	-8(%rbp), %xmm3         ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$16, %rsp
	popq	%rbp
LBB0_2:
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z7BM_cbrtdd           ## -- Begin function _Z7BM_cbrtdd
	.p2align	4, 0x90
__Z7BM_cbrtdd:                          ## @_Z7BM_cbrtdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovaps	%xmm1, %xmm0
	popq	%rbp
	jmp	_cbrt                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z8BM_cbrt3dd
LCPI2_0:
	.quad	4599676419421066581     ## double 0.33333333333333331
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8BM_cbrt3dd
	.p2align	4, 0x90
__Z8BM_cbrt3dd:                         ## @_Z8BM_cbrt3dd
	.cfi_startproc
## %bb.0:
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	je	LBB2_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	vmovapd	%xmm1, %xmm0
	vmovsd	%xmm1, -8(%rbp)         ## 8-byte Spill
	callq	_log
	vmulsd	LCPI2_0(%rip), %xmm0, %xmm0
	callq	_exp
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	-8(%rbp), %xmm3         ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$16, %rsp
	popq	%rbp
LBB2_2:
	vmovapd	%xmm1, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z7BM_sqrtdd           ## -- Begin function _Z7BM_sqrtdd
	.p2align	4, 0x90
__Z7BM_sqrtdd:                          ## @_Z7BM_sqrtdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vsqrtsd	%xmm1, %xmm1, %xmm0
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z6BM_expdd            ## -- Begin function _Z6BM_expdd
	.p2align	4, 0x90
__Z6BM_expdd:                           ## @_Z6BM_expdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovaps	%xmm1, %xmm0
	popq	%rbp
	jmp	_exp                    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z6BM_logdd
LCPI5_0:
	.quad	3125919792542303038     ## double 1.0E-99
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z6BM_logdd
	.p2align	4, 0x90
__Z6BM_logdd:                           ## @_Z6BM_logdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vaddsd	LCPI5_0(%rip), %xmm1, %xmm0
	popq	%rbp
	jmp	_log                    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z6BM_cosdd            ## -- Begin function _Z6BM_cosdd
	.p2align	4, 0x90
__Z6BM_cosdd:                           ## @_Z6BM_cosdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovaps	%xmm1, %xmm0
	popq	%rbp
	jmp	_cos                    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z6BM_sindd            ## -- Begin function _Z6BM_sindd
	.p2align	4, 0x90
__Z6BM_sindd:                           ## @_Z6BM_sindd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovaps	%xmm1, %xmm0
	popq	%rbp
	jmp	_sin                    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__Z6BM_tandd            ## -- Begin function _Z6BM_tandd
	.p2align	4, 0x90
__Z6BM_tandd:                           ## @_Z6BM_tandd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovaps	%xmm1, %xmm0
	popq	%rbp
	jmp	_tan                    ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z13SolveCubicOptddd
LCPI9_0:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI9_1:
	.quad	4609434218613702656     ## double 1.5
LCPI9_2:
	.quad	4517329193108106637     ## double 9.9999999999999995E-7
LCPI9_3:
	.quad	4599676419421066581     ## double 0.33333333333333331
LCPI9_4:
	.quad	4613937818241073152     ## double 3
LCPI9_5:
	.quad	4611898577301369701     ## double 2.0943951023931953
LCPI9_6:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z13SolveCubicOptddd
	.p2align	4, 0x90
__Z13SolveCubicOptddd:                  ## @_Z13SolveCubicOptddd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	vmovapd	%xmm0, %xmm4
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	LCPI9_1(%rip), %xmm4, %xmm3
	vsubsd	%xmm0, %xmm1, %xmm5
	vmulsd	%xmm1, %xmm3, %xmm1
	vsubsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm5, %xmm5, %xmm2
	vmulsd	%xmm5, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm3
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm3
	jae	LBB9_1
## %bb.14:
	vmovapd	LCPI9_0(%rip), %xmm1    ## xmm1 = [-0.0E+0,-0.0E+0]
	vxorpd	%xmm1, %xmm5, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, -32(%rbp)        ## 8-byte Spill
	vxorpd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)        ## 8-byte Spill
	vmovapd	%xmm4, -48(%rbp)        ## 16-byte Spill
	callq	_acos
	vmulsd	LCPI9_3(%rip), %xmm0, %xmm0
	vaddsd	LCPI9_5(%rip), %xmm0, %xmm1
	vmovsd	-16(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vcmpltsd	LCPI9_6(%rip), %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm0, %xmm0
	callq	_cos
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	-32(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	vsubsd	-48(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	addq	$48, %rsp
	popq	%rbp
	retq
LBB9_1:
	vmulsd	LCPI9_2(%rip), %xmm3, %xmm2
	vucomisd	%xmm2, %xmm1
	jae	LBB9_5
## %bb.2:
	vaddsd	%xmm0, %xmm0, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm3
	vmovapd	%xmm3, %xmm0
	je	LBB9_4
## %bb.3:
	vmovapd	%xmm3, %xmm0
	vmovapd	%xmm4, -48(%rbp)        ## 16-byte Spill
	vmovsd	%xmm3, -32(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -16(%rbp)        ## 8-byte Spill
	callq	_log
	vmulsd	LCPI9_3(%rip), %xmm0, %xmm0
	callq	_exp
	vmovsd	-32(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmovapd	-48(%rbp), %xmm4        ## 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	-16(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
LBB9_4:
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	LCPI9_4(%rip), %xmm3, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vsubsd	%xmm4, %xmm0, %xmm0
	addq	$48, %rsp
	popq	%rbp
	retq
LBB9_5:
	vsqrtsd	%xmm3, %xmm3, %xmm2
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jbe	LBB9_8
## %bb.6:
	vaddsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm1, %xmm0
	je	LBB9_11
## %bb.7:
	vmovapd	%xmm4, -48(%rbp)        ## 16-byte Spill
	vmovapd	%xmm5, -32(%rbp)        ## 16-byte Spill
	vmovapd	%xmm0, -16(%rbp)        ## 16-byte Spill
	callq	_log
	vmulsd	LCPI9_3(%rip), %xmm0, %xmm0
	callq	_exp
	vmovapd	-32(%rbp), %xmm5        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm4        ## 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	-16(%rbp), %xmm3        ## 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
LBB9_11:
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	je	LBB9_12
LBB9_13:
	vsubsd	%xmm4, %xmm0, %xmm2
	vdivsd	%xmm0, %xmm5, %xmm1
	vsubsd	%xmm1, %xmm2, %xmm0
	addq	$48, %rsp
	popq	%rbp
	retq
LBB9_8:
	vsubsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm1, %xmm0
	je	LBB9_10
## %bb.9:
	vmovapd	%xmm0, -16(%rbp)        ## 16-byte Spill
	vmovapd	%xmm4, -48(%rbp)        ## 16-byte Spill
	vmovapd	%xmm5, -32(%rbp)        ## 16-byte Spill
	callq	_log
	vmulsd	LCPI9_3(%rip), %xmm0, %xmm0
	callq	_exp
	vmovapd	-32(%rbp), %xmm5        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm4        ## 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	-16(%rbp), %xmm3        ## 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
LBB9_10:
	vxorpd	LCPI9_0(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	LBB9_13
LBB9_12:
	vxorpd	LCPI9_0(%rip), %xmm4, %xmm0
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z5Cubicdd
LCPI10_0:
	.quad	4611686018427387904     ## double 2
LCPI10_1:
	.quad	-4609434218613702656    ## double -3
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5Cubicdd
	.p2align	4, 0x90
__Z5Cubicdd:                            ## @_Z5Cubicdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI10_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	vsubsd	%xmm0, %xmm2, %xmm3
	vmulsd	LCPI10_1(%rip), %xmm1, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm3, %xmm1
	popq	%rbp
	jmp	__Z13SolveCubicOptddd   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z4Padedd
LCPI11_0:
	.quad	4619567317775286272     ## double 7
LCPI11_1:
	.quad	4613937818241073152     ## double 3
LCPI11_2:
	.quad	4607182418800017408     ## double 1
LCPI11_4:
	.quad	4626322717216342016     ## double 20
LCPI11_5:
	.quad	-4594234569871327232    ## double -30
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI11_3:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z4Padedd
	.p2align	4, 0x90
__Z4Padedd:                             ## @_Z4Padedd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmulsd	LCPI11_0(%rip), %xmm0, %xmm2
	vaddsd	LCPI11_1(%rip), %xmm2, %xmm2
	vmovsd	LCPI11_2(%rip), %xmm3   ## xmm3 = mem[0],zero
	vdivsd	%xmm2, %xmm3, %xmm2
	vxorpd	LCPI11_3(%rip), %xmm1, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm4
	vmovsd	LCPI11_4(%rip), %xmm3   ## xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	LCPI11_5(%rip), %xmm1, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm2
	vmovapd	%xmm4, %xmm0
	vmovapd	%xmm3, %xmm1
	popq	%rbp
	jmp	__Z13SolveCubicOptddd   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z5Basicdd
LCPI12_0:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
LCPI12_2:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI12_1:
	.quad	4607182418800017408     ## double 1
LCPI12_3:
	.quad	4602678819172646912     ## double 0.5
LCPI12_4:
	.quad	4633641066610819072     ## double 60
LCPI12_5:
	.quad	4619567317775286272     ## double 7
LCPI12_6:
	.quad	4613937818241073152     ## double 3
LCPI12_7:
	.quad	4846369599423283200     ## double 1.0E+16
LCPI12_8:
	.quad	4626322717216342016     ## double 20
LCPI12_9:
	.quad	-4594234569871327232    ## double -30
LCPI12_10:
	.quad	-4616189618054758400    ## double -1
LCPI12_11:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5Basicdd
	.p2align	4, 0x90
__Z5Basicdd:                            ## @_Z5Basicdd
	.cfi_startproc
## %bb.0:
	vmovapd	%xmm1, %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm3
	jne	LBB12_1
## %bb.5:
	vmovapd	%xmm3, %xmm0
	retq
LBB12_1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	vxorpd	LCPI12_0(%rip), %xmm0, %xmm1
	vxorpd	%xmm2, %xmm2, %xmm2
	vcmpltsd	%xmm2, %xmm0, %xmm2
	vblendvpd	%xmm2, %xmm0, %xmm1, %xmm1
	vaddsd	LCPI12_1(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, -32(%rbp)        ## 8-byte Spill
	vandpd	LCPI12_2(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -40(%rbp)        ## 8-byte Spill
	vmulsd	LCPI12_3(%rip), %xmm3, %xmm0
	vmovapd	%xmm3, -16(%rbp)        ## 16-byte Spill
	callq	_sin
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -24(%rbp)        ## 8-byte Spill
	vmovapd	-16(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovsd	-24(%rbp), %xmm7        ## 8-byte Reload
                                        ## xmm7 = mem[0],zero
	vmovapd	-64(%rbp), %xmm6        ## 16-byte Reload
	vmovsd	-32(%rbp), %xmm5        ## 8-byte Reload
                                        ## xmm5 = mem[0],zero
	vmovsd	LCPI12_4(%rip), %xmm8   ## xmm8 = mem[0],zero
	vmulsd	%xmm5, %xmm8, %xmm2
	vmulsd	LCPI12_5(%rip), %xmm6, %xmm3
	vmovsd	LCPI12_6(%rip), %xmm1   ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm3, %xmm3
	vmovsd	-40(%rbp), %xmm4        ## 8-byte Reload
                                        ## xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm1, %xmm4, %xmm3
	vaddsd	%xmm3, %xmm8, %xmm1
	vmulsd	%xmm1, %xmm7, %xmm1
	vsubsd	%xmm1, %xmm2, %xmm1
	vucomisd	LCPI12_11(%rip), %xmm1
	jne	LBB12_3
## %bb.2:
	vmovsd	LCPI12_7(%rip), %xmm2   ## xmm2 = mem[0],zero
	jmp	LBB12_4
LBB12_3:
	vmovsd	LCPI12_1(%rip), %xmm2   ## xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm2
LBB12_4:
	vmovsd	LCPI12_8(%rip), %xmm1   ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm4, %xmm3
	vxorpd	LCPI12_0(%rip), %xmm2, %xmm4
	vmulsd	%xmm4, %xmm0, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm3
	vmulsd	%xmm6, %xmm7, %xmm4
	vaddsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm2, %xmm0
	vmulsd	LCPI12_9(%rip), %xmm0, %xmm2
	vmovapd	%xmm3, %xmm0
	callq	__Z13SolveCubicOptddd
	vmulsd	-16(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovsd	LCPI12_10(%rip), %xmm2  ## xmm2 = mem[0],zero
	vmovsd	LCPI12_1(%rip), %xmm3   ## xmm3 = mem[0],zero
	vblendvpd	%xmm1, %xmm2, %xmm3, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	callq	_atan2
	vmovapd	-16(%rbp), %xmm3        ## 16-byte Reload
	vmovapd	LCPI12_2(%rip), %xmm1   ## xmm1 = [NaN,NaN]
	vandpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm1, %xmm3, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm3, %xmm0, %xmm3
	addq	$64, %rsp
	popq	%rbp
	vmovapd	%xmm3, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z6Betterdd
LCPI13_0:
	.quad	4591565016156207097     ## double 0.095765000000000003
LCPI13_1:
	.quad	4619567317775286272     ## double 7
LCPI13_2:
	.quad	4571370082793543376     ## double 0.0040940000000000004
LCPI13_3:
	.quad	4613937818241073152     ## double 3
LCPI13_4:
	.quad	4633641066610819072     ## double 60
LCPI13_5:
	.quad	4607182418800017408     ## double 1
LCPI13_6:
	.quad	-4623695617433709227    ## double -0.33333333333333331
LCPI13_7:
	.quad	4626322717216342016     ## double 20
LCPI13_8:
	.quad	-4594234569871327232    ## double -30
LCPI13_10:
	.quad	-4616189618054758400    ## double -1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI13_9:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
LCPI13_11:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z6Betterdd
	.p2align	4, 0x90
__Z6Betterdd:                           ## @_Z6Betterdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	vmovapd	%xmm1, %xmm3
	vmovapd	%xmm1, -48(%rbp)        ## 16-byte Spill
	vmovsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm4
	vmovsd	%xmm4, -16(%rbp)        ## 8-byte Spill
	vmovsd	LCPI13_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	vmulsd	%xmm0, %xmm4, %xmm1
	vmulsd	LCPI13_2(%rip), %xmm4, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovsd	LCPI13_1(%rip), %xmm2   ## xmm2 = mem[0],zero
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	LCPI13_3(%rip), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, -24(%rbp)        ## 8-byte Spill
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	LCPI13_4(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -8(%rbp)         ## 8-byte Spill
	vmovapd	%xmm3, %xmm0
	callq	___sincos_stret
	vmovsd	-8(%rbp), %xmm5         ## 8-byte Reload
                                        ## xmm5 = mem[0],zero
	vmulsd	%xmm1, %xmm5, %xmm2
	vmovsd	-16(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmulsd	-24(%rbp), %xmm3, %xmm3 ## 8-byte Folded Reload
	vsubsd	LCPI13_4(%rip), %xmm3, %xmm3
	vmovsd	-32(%rbp), %xmm4        ## 8-byte Reload
                                        ## xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmovsd	LCPI13_5(%rip), %xmm3   ## xmm3 = mem[0],zero
	vdivsd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	LCPI13_6(%rip), %xmm3, %xmm0
	vsubsd	%xmm4, %xmm1, %xmm1
	vmulsd	LCPI13_7(%rip), %xmm1, %xmm1
	vmulsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm1, %xmm1
	vmulsd	LCPI13_8(%rip), %xmm3, %xmm2
	callq	__Z13SolveCubicOptddd
	vmulsd	-48(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jae	LBB13_2
## %bb.1:
	vxorpd	LCPI13_9(%rip), %xmm0, %xmm0
LBB13_2:
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovsd	LCPI13_10(%rip), %xmm2  ## xmm2 = mem[0],zero
	vmovsd	LCPI13_5(%rip), %xmm3   ## xmm3 = mem[0],zero
	vblendvpd	%xmm1, %xmm2, %xmm3, %xmm1
	callq	_atan2
	vmovapd	LCPI13_11(%rip), %xmm1  ## xmm1 = [NaN,NaN]
	vandpd	%xmm1, %xmm0, %xmm2
	vmovapd	-48(%rbp), %xmm3        ## 16-byte Reload
	vandpd	%xmm1, %xmm3, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm3, %xmm0, %xmm0
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z10Gooding_S3dd
LCPI14_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z10Gooding_S3dd
	.p2align	4, 0x90
__Z10Gooding_S3dd:                      ## @_Z10Gooding_S3dd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	vmovsd	%xmm1, -16(%rbp)        ## 8-byte Spill
	vmovsd	%xmm0, -8(%rbp)         ## 8-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovsd	-8(%rbp), %xmm2         ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmulsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm2, %xmm1, %xmm1
	vaddsd	LCPI14_0(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	-16(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z10Gooding_S9dd
LCPI15_0:
	.quad	4607182418800017408     ## double 1
LCPI15_1:
	.quad	4602678819172646912     ## double 0.5
LCPI15_2:
	.quad	4616189618054758400     ## double 4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z10Gooding_S9dd
	.p2align	4, 0x90
__Z10Gooding_S9dd:                      ## @_Z10Gooding_S9dd
	.cfi_startproc
## %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	LBB15_1
## %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
LBB15_1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	vmovsd	LCPI15_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	vmulsd	LCPI15_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -8(%rbp)         ## 8-byte Spill
	vmovsd	%xmm2, -16(%rbp)        ## 8-byte Spill
	callq	_sin
	vmovsd	%xmm0, -24(%rbp)        ## 8-byte Spill
	vmovsd	-8(%rbp), %xmm0         ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_sin
	vmovsd	-16(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	-32(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	LCPI15_2(%rip), %xmm2, %xmm2
	vmovsd	-24(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	-8(%rbp), %xmm1         ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$32, %rsp
	popq	%rbp
	vmovapd	%xmm1, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z12Gooding_S9s2dd
LCPI16_0:
	.quad	4607182418800017408     ## double 1
LCPI16_1:
	.quad	4602678819172646912     ## double 0.5
LCPI16_2:
	.quad	4616189618054758400     ## double 4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z12Gooding_S9s2dd
	.p2align	4, 0x90
__Z12Gooding_S9s2dd:                    ## @_Z12Gooding_S9s2dd
	.cfi_startproc
## %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	LBB16_1
## %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
LBB16_1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	vmovsd	LCPI16_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -16(%rbp)        ## 8-byte Spill
	vmulsd	LCPI16_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -24(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -8(%rbp)         ## 8-byte Spill
	callq	_sin
	vaddsd	%xmm0, %xmm0, %xmm1
	vmovsd	-8(%rbp), %xmm4         ## 8-byte Reload
                                        ## xmm4 = mem[0],zero
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI16_0(%rip), %xmm2   ## xmm2 = mem[0],zero
	vsubsd	%xmm0, %xmm2, %xmm2
	vmovsd	-16(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmulsd	LCPI16_2(%rip), %xmm4, %xmm4
	vmulsd	%xmm0, %xmm4, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	-24(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$32, %rsp
	popq	%rbp
	vmovapd	%xmm1, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z4S9t2dd
LCPI17_0:
	.quad	4607182418800017408     ## double 1
LCPI17_1:
	.quad	4602678819172646912     ## double 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z4S9t2dd
	.p2align	4, 0x90
__Z4S9t2dd:                             ## @_Z4S9t2dd
	.cfi_startproc
## %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	LBB17_1
## %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
LBB17_1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	vmovsd	LCPI17_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	vsubsd	%xmm2, %xmm0, %xmm3
	vmovsd	%xmm3, -24(%rbp)        ## 8-byte Spill
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovsd	%xmm0, -16(%rbp)        ## 8-byte Spill
	vmulsd	LCPI17_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, -32(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -8(%rbp)         ## 8-byte Spill
	callq	_tan
	vmulsd	%xmm0, %xmm0, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	-8(%rbp), %xmm0, %xmm0  ## 8-byte Folded Reload
	vaddsd	LCPI17_0(%rip), %xmm1, %xmm2
	vmovsd	-24(%rbp), %xmm3        ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmovsd	-16(%rbp), %xmm4        ## 8-byte Reload
                                        ## xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	-32(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$32, %rsp
	popq	%rbp
	vmovapd	%xmm1, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z7S9t2p54dd
LCPI18_0:
	.quad	4607182418800017408     ## double 1
LCPI18_1:
	.quad	4602678819172646912     ## double 0.5
LCPI18_2:
	.quad	4609753056924675352     ## double 1.5707963267948966
LCPI18_3:
	.quad	4624633867356078080     ## double 15
LCPI18_4:
	.quad	-4577275702524510208    ## double -420
LCPI18_5:
	.quad	4651523523724967936     ## double 945
LCPI18_6:
	.quad	-4586282901779251200    ## double -105
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z7S9t2p54dd
	.p2align	4, 0x90
__Z7S9t2p54dd:                          ## @_Z7S9t2p54dd
	.cfi_startproc
## %bb.0:
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jne	LBB18_1
## %bb.5:
	vmovapd	%xmm1, %xmm0
	retq
LBB18_1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovsd	LCPI18_0(%rip), %xmm3   ## xmm3 = mem[0],zero
	vsubsd	%xmm0, %xmm3, %xmm2
	vmulsd	LCPI18_1(%rip), %xmm1, %xmm4
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	LCPI18_2(%rip), %xmm1
	jae	LBB18_3
## %bb.2:
	vmulsd	%xmm4, %xmm4, %xmm6
	vmulsd	LCPI18_3(%rip), %xmm6, %xmm5
	vaddsd	LCPI18_4(%rip), %xmm5, %xmm5
	vmulsd	%xmm6, %xmm5, %xmm5
	vmovsd	LCPI18_5(%rip), %xmm8   ## xmm8 = mem[0],zero
	vaddsd	LCPI18_6(%rip), %xmm6, %xmm7
	vaddsd	%xmm5, %xmm8, %xmm5
	vmulsd	%xmm6, %xmm7, %xmm6
	vaddsd	%xmm6, %xmm8, %xmm6
	vmulsd	%xmm4, %xmm6, %xmm4
	jmp	LBB18_4
LBB18_3:
	vmovsd	LCPI18_2(%rip), %xmm5   ## xmm5 = mem[0],zero
	vsubsd	%xmm4, %xmm5, %xmm5
	vmulsd	%xmm5, %xmm5, %xmm6
	vmulsd	LCPI18_3(%rip), %xmm6, %xmm4
	vaddsd	LCPI18_4(%rip), %xmm4, %xmm4
	vmulsd	%xmm6, %xmm4, %xmm4
	vmovsd	LCPI18_5(%rip), %xmm8   ## xmm8 = mem[0],zero
	vaddsd	LCPI18_6(%rip), %xmm6, %xmm7
	vaddsd	%xmm4, %xmm8, %xmm4
	vmulsd	%xmm6, %xmm7, %xmm6
	vaddsd	%xmm6, %xmm8, %xmm6
	vmulsd	%xmm5, %xmm6, %xmm5
LBB18_4:
	vmulsd	%xmm2, %xmm5, %xmm2
	vmulsd	%xmm3, %xmm4, %xmm3
	vaddsd	%xmm4, %xmm4, %xmm6
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm5, %xmm5
	vmulsd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm5, %xmm4
	vmulsd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm4, %xmm2, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	popq	%rbp
	vmovapd	%xmm1, %xmm0
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z7TimeFunPFdddEd
LCPI19_0:
	.quad	4509533928110552779     ## double 3.1415926535897932E-7
LCPI19_1:
	.quad	4631107791820423168     ## double 42
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z7TimeFunPFdddEd
	.p2align	4, 0x90
__Z7TimeFunPFdddEd:                     ## @_Z7TimeFunPFdddEd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	movq	%rdi, %r15
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
LBB19_1:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -40(%rbp)        ## 8-byte Spill
	vmovsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovsd	-40(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	callq	*%r15
	vmovsd	-32(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, -32(%rbp)        ## 8-byte Spill
	vmovsd	-40(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-32(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vaddsd	LCPI19_0(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB19_1
## %bb.2:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI19_1(%rip), %xmm0
	jne	LBB19_4
## %bb.3:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI19_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB19_4:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx ## imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rax
	addq	$5000000, %rax          ## imm = 0x4C4B40
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$23, %rax
	addl	%ecx, %eax
                                        ## kill: def $eax killed $eax killed $rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z6DoTestPKcPFdddEdd
LCPI20_0:
	.quad	4605831338911806259     ## double 0.84999999999999998
LCPI20_1:
	.quad	4509533928110552779     ## double 3.1415926535897932E-7
LCPI20_2:
	.quad	4631107791820423168     ## double 42
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z6DoTestPKcPFdddEdd
	.p2align	4, 0x90
__Z6DoTestPKcPFdddEdd:                  ## @_Z6DoTestPKcPFdddEdd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovsd	%xmm1, -48(%rbp)        ## 8-byte Spill
	vmovsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	callq	*%rsi
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	movq	%r14, %rsi
	vmovsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovsd	-48(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
LBB20_1:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	callq	*%r13
	vmovsd	-48(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, -48(%rbp)        ## 8-byte Spill
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_1
## %bb.2:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	LCPI20_2(%rip), %xmm0
	jne	LBB20_4
## %bb.3:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_4:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	movabsq	$-2972493582642298179, %r12 ## imm = 0xD6BF94D5E57A42BD
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB20_5:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	callq	*%r13
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_5
## %bb.6:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	LCPI20_2(%rip), %xmm2
	jne	LBB20_8
## %bb.7:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_8:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB20_9:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	callq	*%r13
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_9
## %bb.10:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	LCPI20_2(%rip), %xmm2
	jne	LBB20_12
## %bb.11:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_12:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB20_13:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	callq	*%r13
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_13
## %bb.14:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	LCPI20_2(%rip), %xmm2
	jne	LBB20_16
## %bb.15:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_16:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB20_17:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	callq	*%r13
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_17
## %bb.18:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	LCPI20_2(%rip), %xmm2
	jne	LBB20_20
## %bb.19:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_20:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB20_21:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	vmovsd	%xmm2, -48(%rbp)        ## 8-byte Spill
	vmovsd	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	callq	*%r13
	vmovsd	-56(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmovsd	-48(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebx
	jne	LBB20_21
## %bb.22:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI20_2(%rip), %xmm2
	jne	LBB20_24
## %bb.23:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB20_24:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r12
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_putchar                ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function _Z7TestAlldd
LCPI21_0:
	.quad	4509533928110552779     ## double 3.1415926535897932E-7
LCPI21_1:
	.quad	4631107791820423168     ## double 42
LCPI21_19:
	.quad	3125919792542303038     ## double 1.0E-99
LCPI21_21:
	.quad	4607182418800017408     ## double 1
LCPI21_24:
	.quad	4611686018427387904     ## double 2
LCPI21_25:
	.quad	-4609434218613702656    ## double -3
LCPI21_26:
	.quad	4599075939470750516     ## double 0.30000000000000004
LCPI21_27:
	.quad	4619567317775286272     ## double 7
LCPI21_28:
	.quad	4613937818241073152     ## double 3
LCPI21_30:
	.quad	4626322717216342016     ## double 20
LCPI21_31:
	.quad	-4594234569871327232    ## double -30
LCPI21_32:
	.quad	-4630656488366144071    ## double -0.111731843575419
LCPI21_33:
	.quad	-4608641685718383267    ## double -3.3519553072625698
LCPI21_34:
	.quad	4599709965787006027     ## double 0.33519553072625702
	.section	__TEXT,__const
	.p2align	5
LCPI21_2:
	.quad	0                       ## double 0
	.quad	4509533928110552779     ## double 3.1415926535897932E-7
	.quad	4514037527737923275     ## double 6.2831853071795864E-7
	.quad	4517004678107951664     ## double 9.4247779607693791E-7
LCPI21_3:
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
LCPI21_4:
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
LCPI21_5:
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
LCPI21_6:
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
LCPI21_7:
	.quad	4529031901805048958     ## double 6.2831853071795867E-6
	.quad	4529031901805048958     ## double 6.2831853071795867E-6
	.quad	4529031901805048958     ## double 6.2831853071795867E-6
	.quad	4529031901805048958     ## double 6.2831853071795867E-6
LCPI21_8:
	.quad	4530515476990063152     ## double 7.5398223686155033E-6
	.quad	4530515476990063152     ## double 7.5398223686155033E-6
	.quad	4530515476990063152     ## double 7.5398223686155033E-6
	.quad	4530515476990063152     ## double 7.5398223686155033E-6
LCPI21_9:
	.quad	4531310138654898162     ## double 8.7964594300514216E-6
	.quad	4531310138654898162     ## double 8.7964594300514216E-6
	.quad	4531310138654898162     ## double 8.7964594300514216E-6
	.quad	4531310138654898162     ## double 8.7964594300514216E-6
LCPI21_10:
	.quad	4532051926247405259     ## double 1.0053096491487338E-5
	.quad	4532051926247405259     ## double 1.0053096491487338E-5
	.quad	4532051926247405259     ## double 1.0053096491487338E-5
	.quad	4532051926247405259     ## double 1.0053096491487338E-5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI21_11:
	.quad	4514037527737923275     ## double 6.2831853071795864E-7
	.quad	4514037527737923275     ## double 6.2831853071795864E-7
LCPI21_12:
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
	.quad	4518541127365293771     ## double 1.2566370614359173E-6
LCPI21_13:
	.quad	4521508277735322160     ## double 1.8849555921538758E-6
	.quad	4521508277735322160     ## double 1.8849555921538758E-6
LCPI21_14:
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
	.quad	4523044726992664267     ## double 2.5132741228718346E-6
LCPI21_15:
	.quad	4524528302177678462     ## double 3.1415926535897933E-6
	.quad	4524528302177678462     ## double 3.1415926535897933E-6
LCPI21_16:
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
	.quad	4526011877362692656     ## double 3.7699111843077517E-6
LCPI21_17:
	.quad	4526806539027527666     ## double 4.3982297150257108E-6
	.quad	4526806539027527666     ## double 4.3982297150257108E-6
LCPI21_18:
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
	.quad	4527548326620034763     ## double 5.0265482457436692E-6
LCPI21_20:
	.quad	3125919792542303038     ## double 1.0E-99
	.quad	3125919792542303038     ## double 1.0E-99
LCPI21_22:
	.quad	4605831338911806259     ## double 0.84999999999999998
	.quad	4605831338911806259     ## double 0.84999999999999998
LCPI21_23:
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
LCPI21_29:
	.quad	-9223372036854775808    ## double -0
	.quad	-9223372036854775808    ## double -0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z7TestAlldd
	.p2align	4, 0x90
__Z7TestAlldd:                          ## @_Z7TestAlldd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$344, %rsp              ## imm = 0x158
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovapd	%xmm1, -224(%rbp)       ## 16-byte Spill
	vmovsd	%xmm0, -200(%rbp)       ## 8-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cbrt
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.4(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_1:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	callq	_cbrt
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovsd	-96(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	LCPI21_0(%rip), %xmm0, %xmm0
	decl	%ebx
	jne	LBB21_1
## %bb.2:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_4
## %bb.3:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_4:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %r15 ## imm = 0xD6BF94D5E57A42BD
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_5:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_cbrt
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_5
## %bb.6:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_8
## %bb.7:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_8:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_9:                                ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_cbrt
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_9
## %bb.10:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_12
## %bb.11:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_12:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_13:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_cbrt
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_13
## %bb.14:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_16
## %bb.15:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_16:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_17:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_cbrt
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_17
## %bb.18:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_20
## %bb.19:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_20:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_21:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_cbrt
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_21
## %bb.22:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_24
## %bb.23:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_24:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	leaq	L_.str.5(%rip), %rdi
	leaq	__Z8BM_cbrt3dd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	vsqrtsd	%xmm1, %xmm1, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.6(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
LBB21_25:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	LCPI21_3(%rip), %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	LCPI21_4(%rip), %ymm0, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	LCPI21_5(%rip), %ymm0, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	LCPI21_6(%rip), %ymm0, %ymm5
	vaddpd	LCPI21_7(%rip), %ymm0, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	LCPI21_8(%rip), %ymm0, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	LCPI21_9(%rip), %ymm0, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	LCPI21_10(%rip), %ymm0, %ymm0
	addl	$-32, %eax
	jne	LBB21_25
## %bb.26:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_28
## %bb.27:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_28:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	LCPI21_3(%rip), %ymm7   ## ymm7 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	LCPI21_4(%rip), %ymm8   ## ymm8 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	LCPI21_5(%rip), %ymm9   ## ymm9 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	LCPI21_6(%rip), %ymm10  ## ymm10 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vmovapd	LCPI21_7(%rip), %ymm11  ## ymm11 = [6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6]
	vmovapd	LCPI21_8(%rip), %ymm12  ## ymm12 = [7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6]
	vmovapd	LCPI21_9(%rip), %ymm13  ## ymm13 = [8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6]
	vmovapd	LCPI21_10(%rip), %ymm14 ## ymm14 = [1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5]
	.p2align	4, 0x90
LBB21_29:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	%ymm7, %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm8, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm9, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm10, %ymm5
	vaddpd	%ymm0, %ymm11, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm12, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm13, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm14, %ymm0
	addl	$-32, %eax
	jne	LBB21_29
## %bb.30:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_32
## %bb.31:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_32:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	LCPI21_3(%rip), %ymm7   ## ymm7 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	LCPI21_4(%rip), %ymm8   ## ymm8 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	LCPI21_5(%rip), %ymm9   ## ymm9 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	LCPI21_6(%rip), %ymm10  ## ymm10 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vmovapd	LCPI21_7(%rip), %ymm11  ## ymm11 = [6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6]
	vmovapd	LCPI21_8(%rip), %ymm12  ## ymm12 = [7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6]
	vmovapd	LCPI21_9(%rip), %ymm13  ## ymm13 = [8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6]
	vmovapd	LCPI21_10(%rip), %ymm14 ## ymm14 = [1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5]
	.p2align	4, 0x90
LBB21_33:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	%ymm7, %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm8, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm9, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm10, %ymm5
	vaddpd	%ymm0, %ymm11, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm12, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm13, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm14, %ymm0
	addl	$-32, %eax
	jne	LBB21_33
## %bb.34:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_36
## %bb.35:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_36:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	LCPI21_3(%rip), %ymm7   ## ymm7 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	LCPI21_4(%rip), %ymm8   ## ymm8 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	LCPI21_5(%rip), %ymm9   ## ymm9 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	LCPI21_6(%rip), %ymm10  ## ymm10 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vmovapd	LCPI21_7(%rip), %ymm11  ## ymm11 = [6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6]
	vmovapd	LCPI21_8(%rip), %ymm12  ## ymm12 = [7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6]
	vmovapd	LCPI21_9(%rip), %ymm13  ## ymm13 = [8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6]
	vmovapd	LCPI21_10(%rip), %ymm14 ## ymm14 = [1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5]
	.p2align	4, 0x90
LBB21_37:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	%ymm7, %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm8, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm9, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm10, %ymm5
	vaddpd	%ymm0, %ymm11, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm12, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm13, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm14, %ymm0
	addl	$-32, %eax
	jne	LBB21_37
## %bb.38:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_40
## %bb.39:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_40:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	LCPI21_3(%rip), %ymm7   ## ymm7 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	LCPI21_4(%rip), %ymm8   ## ymm8 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	LCPI21_5(%rip), %ymm9   ## ymm9 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	LCPI21_6(%rip), %ymm10  ## ymm10 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vmovapd	LCPI21_7(%rip), %ymm11  ## ymm11 = [6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6]
	vmovapd	LCPI21_8(%rip), %ymm12  ## ymm12 = [7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6]
	vmovapd	LCPI21_9(%rip), %ymm13  ## ymm13 = [8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6]
	vmovapd	LCPI21_10(%rip), %ymm14 ## ymm14 = [1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5]
	.p2align	4, 0x90
LBB21_41:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	%ymm7, %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm8, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm9, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm10, %ymm5
	vaddpd	%ymm0, %ymm11, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm12, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm13, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm14, %ymm0
	addl	$-32, %eax
	jne	LBB21_41
## %bb.42:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_44
## %bb.43:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_44:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	LCPI21_2(%rip), %ymm0   ## ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax         ## imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	LCPI21_3(%rip), %ymm7   ## ymm7 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	LCPI21_4(%rip), %ymm8   ## ymm8 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	LCPI21_5(%rip), %ymm9   ## ymm9 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	LCPI21_6(%rip), %ymm10  ## ymm10 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vmovapd	LCPI21_7(%rip), %ymm11  ## ymm11 = [6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6,6.2831853071795867E-6]
	vmovapd	LCPI21_8(%rip), %ymm12  ## ymm12 = [7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6,7.5398223686155033E-6]
	vmovapd	LCPI21_9(%rip), %ymm13  ## ymm13 = [8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6,8.7964594300514216E-6]
	vmovapd	LCPI21_10(%rip), %ymm14 ## ymm14 = [1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5,1.0053096491487338E-5]
	.p2align	4, 0x90
LBB21_45:                               ## =>This Inner Loop Header: Depth=1
	vaddpd	%ymm7, %ymm0, %ymm5
	vsqrtpd	%ymm0, %ymm6
	vaddpd	%ymm6, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm8, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm9, %ymm5
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm10, %ymm5
	vaddpd	%ymm0, %ymm11, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm0, %ymm12, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm6, %ymm2, %ymm2
	vaddpd	%ymm0, %ymm13, %ymm6
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm3, %ymm3
	vaddpd	%ymm6, %ymm4, %ymm4
	vaddpd	%ymm0, %ymm14, %ymm0
	addl	$-32, %eax
	jne	LBB21_45
## %bb.46:
	vaddpd	%ymm1, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_48
## %bb.47:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	vzeroupper
	callq	_printf
LBB21_48:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	callq	_exp
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.7(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm0 ## xmm0 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_49:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm1, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	-64(%rbp), %xmm0        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	-64(%rbp), %xmm0        ## 16-byte Reload
	vaddpd	LCPI21_15(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	-64(%rbp), %xmm0        ## 16-byte Reload
	vaddpd	LCPI21_16(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	-64(%rbp), %xmm0        ## 16-byte Reload
	vaddpd	LCPI21_17(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	-64(%rbp), %xmm0        ## 16-byte Reload
	vaddpd	LCPI21_18(%rip), %xmm0, %xmm0
	addl	$-16, %ebx
	jne	LBB21_49
## %bb.50:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_52
## %bb.51:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_52:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_53:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_53
## %bb.54:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_56
## %bb.55:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_56:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_57:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_57
## %bb.58:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_60
## %bb.59:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_60:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_61:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_61
## %bb.62:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_64
## %bb.63:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_64:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_65:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_65
## %bb.66:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_68
## %bb.67:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_68:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_69:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_exp
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_exp
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_exp
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_69
## %bb.70:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_72
## %bb.71:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_72:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	vaddsd	LCPI21_19(%rip), %xmm0, %xmm0
	callq	_log
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_73:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_73
## %bb.74:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_76
## %bb.75:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_76:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_77:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_77
## %bb.78:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_80
## %bb.79:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_80:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_81:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_81
## %bb.82:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_84
## %bb.83:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_84:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_85:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_85
## %bb.86:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_88
## %bb.87:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_88:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_89:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_89
## %bb.90:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_92
## %bb.91:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_92:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_93:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -160(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_20(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, -192(%rbp)       ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_log
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -80(%rbp)        ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -144(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, -128(%rbp)       ## 16-byte Spill
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	callq	_log
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_log
	vmovapd	-176(%rbp), %xmm2       ## 16-byte Reload
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vmovapd	-96(%rbp), %xmm3        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_93
## %bb.94:
	vmovapd	-144(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_96
## %bb.95:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_96:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	callq	_cos
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	vmovsd	%xmm2, -288(%rbp)       ## 8-byte Spill
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_97:                               ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_97
## %bb.98:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_100
## %bb.99:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_100:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_101:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_101
## %bb.102:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_104
## %bb.103:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_104:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_105:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_105
## %bb.106:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_108
## %bb.107:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_108:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_109:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_109
## %bb.110:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_112
## %bb.111:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_112:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_113:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_113
## %bb.114:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_116
## %bb.115:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_116:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_117:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_cos
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_cos
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_cos
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_117
## %bb.118:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_120
## %bb.119:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_120:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	callq	_sin
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.10(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	vmovsd	%xmm2, -272(%rbp)       ## 8-byte Spill
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_121:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_121
## %bb.122:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_124
## %bb.123:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_124:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_125:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_125
## %bb.126:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_128
## %bb.127:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_128:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_129:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_129
## %bb.130:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_132
## %bb.131:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_132:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_133:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_133
## %bb.134:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_136
## %bb.135:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_136:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_137:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_137
## %bb.138:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_140
## %bb.139:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_140:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovhpd	LCPI21_0(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
LBB21_141:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-48(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -176(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_14(%rip), %xmm0  ## xmm0 = [2.5132741228718346E-6,2.5132741228718346E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
	vmovapd	%xmm1, -192(%rbp)       ## 16-byte Spill
	vmovapd	LCPI21_15(%rip), %xmm0  ## xmm0 = [3.1415926535897933E-6,3.1415926535897933E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_16(%rip), %xmm0  ## xmm0 = [3.7699111843077517E-6,3.7699111843077517E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vmovapd	LCPI21_17(%rip), %xmm0  ## xmm0 = [4.3982297150257108E-6,4.3982297150257108E-6]
	vaddpd	-64(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	_sin
	vmovapd	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -192(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-112(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-128(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -128(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-80(%rbp), %xmm1        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovapd	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	_sin
	vmovaps	%xmm0, -48(%rbp)        ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	_sin
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vmovapd	-48(%rbp), %xmm2        ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vaddpd	-176(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
	vaddpd	LCPI21_18(%rip), %xmm1, %xmm1
	addl	$-16, %ebx
	jne	LBB21_141
## %bb.142:
	vmovapd	-128(%rbp), %xmm0       ## 16-byte Reload
	vaddpd	-144(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	-160(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_144
## %bb.143:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_144:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	callq	_tan
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.11(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_145:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_145
## %bb.146:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_148
## %bb.147:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_148:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_149:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_149
## %bb.150:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_152
## %bb.151:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_152:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_153:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_153
## %bb.154:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_156
## %bb.155:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_156:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_157:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_157
## %bb.158:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_160
## %bb.159:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_160:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_161:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_161
## %bb.162:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_164
## %bb.163:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_164:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_165:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -96(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	_tan
	vmovsd	-96(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_165
## %bb.166:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_168
## %bb.167:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_168:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmulsd	-272(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vmulsd	-288(%rbp), %xmm0, %xmm1 ## 8-byte Folded Reload
	vaddsd	LCPI21_21(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm2
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	vaddsd	%xmm1, %xmm2, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.12(%rip), %rsi
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_169:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_169
## %bb.170:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_172
## %bb.171:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_172:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_173:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_173
## %bb.174:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_176
## %bb.175:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_176:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_177:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_177
## %bb.178:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_180
## %bb.179:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_180:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_181:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_181
## %bb.182:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_184
## %bb.183:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_184:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_185:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_185
## %bb.186:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_188
## %bb.187:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_188:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovhpd	LCPI21_0(%rip), %xmm2, %xmm1 ## xmm1 = xmm2[0],mem[0]
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
LBB21_189:                              ## =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, -176(%rbp)       ## 16-byte Spill
	vmovapd	%xmm3, -160(%rbp)       ## 16-byte Spill
	vmovapd	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovapd	%xmm5, -144(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -64(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_11(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -80(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_12(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -48(%rbp)        ## 16-byte Spill
	vaddpd	LCPI21_13(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, -96(%rbp)        ## 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	___sincos_stret
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -112(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -64(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -288(%rbp)       ## 16-byte Spill
	vmovapd	-192(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmovaps	-80(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -272(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -80(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -368(%rbp)       ## 16-byte Spill
	vmovapd	-256(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -352(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -48(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	%xmm1, -336(%rbp)       ## 16-byte Spill
	vmovapd	-240(%rbp), %xmm1       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	callq	___sincos_stret
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmovapd	%xmm1, -320(%rbp)       ## 16-byte Spill
	vpermilpd	$1, -96(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,0]
	callq	___sincos_stret
	vmovapd	-304(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0]
	vmovapd	-112(%rbp), %xmm2       ## 16-byte Reload
	vunpcklpd	-288(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm2[0],mem[0]
	vmovapd	-272(%rbp), %xmm3       ## 16-byte Reload
	vunpcklpd	-368(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = xmm3[0],mem[0]
	vmovapd	-352(%rbp), %xmm4       ## 16-byte Reload
	vunpcklpd	-336(%rbp), %xmm4, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm4[0],mem[0]
	vmovapd	-320(%rbp), %xmm5       ## 16-byte Reload
	vunpcklpd	%xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0]
	vmovapd	LCPI21_22(%rip), %xmm6  ## xmm6 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	-192(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm2, %xmm2
	vmovapd	LCPI21_23(%rip), %xmm7  ## xmm7 = [1.0E+0,1.0E+0]
	vaddpd	%xmm7, %xmm2, %xmm2
	vmulpd	%xmm2, %xmm5, %xmm2
	vmulpd	-256(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm3, %xmm3
	vaddpd	%xmm7, %xmm3, %xmm3
	vmulpd	%xmm3, %xmm5, %xmm3
	vmulpd	-240(%rbp), %xmm6, %xmm5 ## 16-byte Folded Reload
	vmulpd	%xmm6, %xmm4, %xmm4
	vaddpd	%xmm7, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm5, %xmm4
	vmulpd	%xmm6, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm1, %xmm1
	vmulpd	%xmm1, %xmm0, %xmm0
	vmovapd	-176(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-64(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	-160(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-80(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	-128(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-48(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm4, %xmm1, %xmm4
	vmovapd	-144(%rbp), %xmm1       ## 16-byte Reload
	vaddpd	-96(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	-64(%rbp), %xmm1        ## 16-byte Reload
	vaddpd	LCPI21_14(%rip), %xmm1, %xmm1
	addl	$-8, %ebx
	jne	LBB21_189
## %bb.190:
	vaddpd	%xmm2, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1 ## xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm0
	jne	LBB21_192
## %bb.191:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_192:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	leaq	L_.str.13(%rip), %rdi
	leaq	__Z10Gooding_S9dd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	leaq	L_.str.14(%rip), %rdi
	leaq	__Z12Gooding_S9s2dd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	leaq	L_.str.15(%rip), %rdi
	leaq	__Z4S9t2dd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	leaq	L_.str.16(%rip), %rdi
	leaq	__Z7S9t2p54dd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_24(%rip), %xmm1  ## xmm1 = mem[0],zero
	vsubsd	%xmm0, %xmm1, %xmm1
	vmovapd	-224(%rbp), %xmm0       ## 16-byte Reload
	vmulsd	LCPI21_25(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)        ## 8-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	callq	__Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.17(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_193:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	-64(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmulsd	LCPI21_25(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	-64(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vaddsd	LCPI21_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -64(%rbp)        ## 8-byte Spill
	decl	%ebx
	jne	LBB21_193
## %bb.194:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_196
## %bb.195:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_196:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_197:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	LCPI21_25(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmulsd	-64(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_197
## %bb.198:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_200
## %bb.199:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_200:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_201:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	LCPI21_25(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmulsd	-64(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_201
## %bb.202:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_204
## %bb.203:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_204:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_205:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	LCPI21_25(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmulsd	-64(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_205
## %bb.206:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_208
## %bb.207:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_208:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_209:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	LCPI21_25(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmulsd	-64(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_209
## %bb.210:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_212
## %bb.211:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_212:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_213:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmovsd	LCPI21_25(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmulsd	-64(%rbp), %xmm0, %xmm2 ## 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI21_26(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_213
## %bb.214:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_216
## %bb.215:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_216:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	vmovsd	-200(%rbp), %xmm3       ## 8-byte Reload
                                        ## xmm3 = mem[0],zero
	vmulsd	LCPI21_27(%rip), %xmm3, %xmm0
	vaddsd	LCPI21_28(%rip), %xmm0, %xmm0
	vmovsd	LCPI21_21(%rip), %xmm1  ## xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm2
	vmovapd	-224(%rbp), %xmm4       ## 16-byte Reload
	vxorpd	LCPI21_29(%rip), %xmm4, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm0
	vmovsd	LCPI21_30(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmulsd	LCPI21_31(%rip), %xmm4, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	callq	__Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.18(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovapd	-224(%rbp), %xmm1       ## 16-byte Reload
	movb	$3, %al
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_217:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	-64(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vmulsd	LCPI21_33(%rip), %xmm1, %xmm2
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_217
## %bb.218:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_220
## %bb.219:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_220:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_221:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	LCPI21_33(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	-64(%rbp), %xmm1, %xmm2 ## 8-byte Folded Reload
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_221
## %bb.222:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_224
## %bb.223:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_224:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_225:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	LCPI21_33(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	-64(%rbp), %xmm1, %xmm2 ## 8-byte Folded Reload
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_225
## %bb.226:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_228
## %bb.227:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_228:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_229:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	LCPI21_33(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	-64(%rbp), %xmm1, %xmm2 ## 8-byte Folded Reload
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_229
## %bb.230:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_232
## %bb.231:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_232:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_233:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	LCPI21_33(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	-64(%rbp), %xmm1, %xmm2 ## 8-byte Folded Reload
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_233
## %bb.234:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_236
## %bb.235:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_236:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebx         ## imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
LBB21_237:                              ## =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, -64(%rbp)        ## 8-byte Spill
	vmovsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	vmulsd	LCPI21_32(%rip), %xmm2, %xmm0
	vmovsd	LCPI21_33(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmulsd	-64(%rbp), %xmm1, %xmm2 ## 8-byte Folded Reload
	vmovsd	LCPI21_34(%rip), %xmm1  ## xmm1 = mem[0],zero
	callq	__Z13SolveCubicOptddd
	vmovsd	-64(%rbp), %xmm2        ## 8-byte Reload
                                        ## xmm2 = mem[0],zero
	vmovsd	-96(%rbp), %xmm1        ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebx
	jne	LBB21_237
## %bb.238:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	LCPI21_1(%rip), %xmm1
	jne	LBB21_240
## %bb.239:
	leaq	L_.str(%rip), %rdi
	vmovsd	LCPI21_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
LBB21_240:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r15
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi          ## imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	leaq	L_.str.2(%rip), %rdi
                                        ## kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_putchar
	leaq	L_.str.19(%rip), %rdi
	leaq	__Z5Basicdd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	callq	__Z6DoTestPKcPFdddEdd
	leaq	L_.str.20(%rip), %rdi
	leaq	__Z6Betterdd(%rip), %rsi
	vmovsd	-200(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vmovaps	-224(%rbp), %xmm1       ## 16-byte Reload
	addq	$344, %rsp              ## imm = 0x158
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	__Z6DoTestPKcPFdddEdd   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI22_0:
	.quad	4613937818241073152     ## double 3
LCPI22_1:
	.quad	4607182418800017408     ## double 1
LCPI22_2:
	.quad	4603316495794592304     ## double 0.57079632679489656
LCPI22_3:
	.quad	4609751380152158349     ## double 1.5704240085038095
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L_.str.21(%rip), %rdi
	vmovsd	LCPI22_0(%rip), %xmm0   ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	vmovsd	LCPI22_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	vmovsd	LCPI22_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	vmovsd	LCPI22_3(%rip), %xmm2   ## xmm2 = mem[0],zero
	movb	$3, %al
	callq	_printf
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	$10, %edi
	callq	_putchar
	vmovsd	LCPI22_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	vmovsd	LCPI22_2(%rip), %xmm1   ## xmm1 = mem[0],zero
	callq	__Z7TestAlldd
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"y %g"

L_.str.1:                               ## @.str.1
	.asciz	"%-8s ( %g, %g ) = %20.14g  t = "

L_.str.2:                               ## @.str.2
	.asciz	"\t%i"

L_.str.4:                               ## @.str.4
	.asciz	"cbrt"

L_.str.5:                               ## @.str.5
	.asciz	"cbrt3"

L_.str.6:                               ## @.str.6
	.asciz	"sqrt"

L_.str.7:                               ## @.str.7
	.asciz	"exp"

L_.str.8:                               ## @.str.8
	.asciz	"log"

L_.str.9:                               ## @.str.9
	.asciz	"cos"

L_.str.10:                              ## @.str.10
	.asciz	"sin"

L_.str.11:                              ## @.str.11
	.asciz	"tan"

L_.str.12:                              ## @.str.12
	.asciz	"S3"

L_.str.13:                              ## @.str.13
	.asciz	"S9"

L_.str.14:                              ## @.str.14
	.asciz	"S9s2"

L_.str.15:                              ## @.str.15
	.asciz	"S9t2"

L_.str.16:                              ## @.str.16
	.asciz	"S9t2p54"

L_.str.17:                              ## @.str.17
	.asciz	"Cubic"

L_.str.18:                              ## @.str.18
	.asciz	"Pade"

L_.str.19:                              ## @.str.19
	.asciz	"Basic"

L_.str.20:                              ## @.str.20
	.asciz	"Better"

L_.str.21:                              ## @.str.21
	.asciz	"cuberoot of 27.0 is  %g\n"

L_.str.22:                              ## @.str.22
	.asciz	"f(e= %g, M = %g ) = %g\n"

L_str:                                  ## @str
	.asciz	"Needs to settle down before timer is reliable\nSacrificial readings for Basic "

.subsections_via_symbols
