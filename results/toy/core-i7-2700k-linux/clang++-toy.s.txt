	.text
	.file	"TOY_ks.cpp"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z9Ref_cbrt3d
.LCPI0_0:
	.quad	0x3fd5555555555555              # double 0.33333333333333331
	.text
	.globl	_Z9Ref_cbrt3d
	.p2align	4, 0x90
	.type	_Z9Ref_cbrt3d,@function
_Z9Ref_cbrt3d:                          # @_Z9Ref_cbrt3d
	.cfi_startproc
# %bb.0:
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	je	.LBB0_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	callq	log@PLT
	vmulsd	.LCPI0_0(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	(%rsp), %xmm3                   # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB0_2:
	retq
.Lfunc_end0:
	.size	_Z9Ref_cbrt3d, .Lfunc_end0-_Z9Ref_cbrt3d
	.cfi_endproc
                                        # -- End function
	.globl	_Z7BM_cbrtdd                    # -- Begin function _Z7BM_cbrtdd
	.p2align	4, 0x90
	.type	_Z7BM_cbrtdd,@function
_Z7BM_cbrtdd:                           # @_Z7BM_cbrtdd
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm1, %xmm0
	jmp	cbrt                            # TAILCALL
.Lfunc_end1:
	.size	_Z7BM_cbrtdd, .Lfunc_end1-_Z7BM_cbrtdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z8BM_cbrt3dd
.LCPI2_0:
	.quad	0x3fd5555555555555              # double 0.33333333333333331
	.text
	.globl	_Z8BM_cbrt3dd
	.p2align	4, 0x90
	.type	_Z8BM_cbrt3dd,@function
_Z8BM_cbrt3dd:                          # @_Z8BM_cbrt3dd
	.cfi_startproc
# %bb.0:
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	je	.LBB2_2
# %bb.1:
	pushq	%rax
	.cfi_def_cfa_offset 16
	vmovapd	%xmm1, %xmm0
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	callq	log@PLT
	vmulsd	.LCPI2_0(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovsd	(%rsp), %xmm3                   # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB2_2:
	vmovapd	%xmm1, %xmm0
	retq
.Lfunc_end2:
	.size	_Z8BM_cbrt3dd, .Lfunc_end2-_Z8BM_cbrt3dd
	.cfi_endproc
                                        # -- End function
	.globl	_Z7BM_sqrtdd                    # -- Begin function _Z7BM_sqrtdd
	.p2align	4, 0x90
	.type	_Z7BM_sqrtdd,@function
_Z7BM_sqrtdd:                           # @_Z7BM_sqrtdd
	.cfi_startproc
# %bb.0:
	vsqrtsd	%xmm1, %xmm1, %xmm0
	retq
.Lfunc_end3:
	.size	_Z7BM_sqrtdd, .Lfunc_end3-_Z7BM_sqrtdd
	.cfi_endproc
                                        # -- End function
	.globl	_Z6BM_expdd                     # -- Begin function _Z6BM_expdd
	.p2align	4, 0x90
	.type	_Z6BM_expdd,@function
_Z6BM_expdd:                            # @_Z6BM_expdd
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm1, %xmm0
	jmp	exp@PLT                         # TAILCALL
.Lfunc_end4:
	.size	_Z6BM_expdd, .Lfunc_end4-_Z6BM_expdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z6BM_logdd
.LCPI5_0:
	.quad	0x2b617f7d4ed8c33e              # double 1.0E-99
	.text
	.globl	_Z6BM_logdd
	.p2align	4, 0x90
	.type	_Z6BM_logdd,@function
_Z6BM_logdd:                            # @_Z6BM_logdd
	.cfi_startproc
# %bb.0:
	vaddsd	.LCPI5_0(%rip), %xmm1, %xmm0
	jmp	log@PLT                         # TAILCALL
.Lfunc_end5:
	.size	_Z6BM_logdd, .Lfunc_end5-_Z6BM_logdd
	.cfi_endproc
                                        # -- End function
	.globl	_Z6BM_cosdd                     # -- Begin function _Z6BM_cosdd
	.p2align	4, 0x90
	.type	_Z6BM_cosdd,@function
_Z6BM_cosdd:                            # @_Z6BM_cosdd
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm1, %xmm0
	jmp	cos@PLT                         # TAILCALL
.Lfunc_end6:
	.size	_Z6BM_cosdd, .Lfunc_end6-_Z6BM_cosdd
	.cfi_endproc
                                        # -- End function
	.globl	_Z6BM_sindd                     # -- Begin function _Z6BM_sindd
	.p2align	4, 0x90
	.type	_Z6BM_sindd,@function
_Z6BM_sindd:                            # @_Z6BM_sindd
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm1, %xmm0
	jmp	sin@PLT                         # TAILCALL
.Lfunc_end7:
	.size	_Z6BM_sindd, .Lfunc_end7-_Z6BM_sindd
	.cfi_endproc
                                        # -- End function
	.globl	_Z6BM_tandd                     # -- Begin function _Z6BM_tandd
	.p2align	4, 0x90
	.type	_Z6BM_tandd,@function
_Z6BM_tandd:                            # @_Z6BM_tandd
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm1, %xmm0
	jmp	tan                             # TAILCALL
.Lfunc_end8:
	.size	_Z6BM_tandd, .Lfunc_end8-_Z6BM_tandd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _Z13SolveCubicOptddd
.LCPI9_0:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI9_1:
	.quad	0x3ff8000000000000              # double 1.5
.LCPI9_2:
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
.LCPI9_3:
	.quad	0x3fd5555555555555              # double 0.33333333333333331
.LCPI9_4:
	.quad	0x4008000000000000              # double 3
.LCPI9_5:
	.quad	0x4000c152382d7365              # double 2.0943951023931953
.LCPI9_6:
	.quad	0x0000000000000000              # double 0
	.text
	.globl	_Z13SolveCubicOptddd
	.p2align	4, 0x90
	.type	_Z13SolveCubicOptddd,@function
_Z13SolveCubicOptddd:                   # @_Z13SolveCubicOptddd
	.cfi_startproc
# %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vmovapd	%xmm0, %xmm4
	vmulsd	%xmm0, %xmm0, %xmm0
	vmulsd	.LCPI9_1(%rip), %xmm4, %xmm3
	vsubsd	%xmm0, %xmm1, %xmm5
	vmulsd	%xmm1, %xmm3, %xmm1
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm5, %xmm5, %xmm2
	vmulsd	%xmm5, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm3
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm3
	jae	.LBB9_1
# %bb.14:
	vmovapd	.LCPI9_0(%rip), %xmm1           # xmm1 = [-0.0E+0,-0.0E+0]
	vxorpd	%xmm1, %xmm5, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vxorpd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm2, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	callq	acos
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	vaddsd	.LCPI9_5(%rip), %xmm0, %xmm1
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vcmpltsd	.LCPI9_6(%rip), %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm0, %xmm0
	callq	cos@PLT
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	16(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	vsubsd	32(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB9_1:
	.cfi_def_cfa_offset 64
	vmulsd	.LCPI9_2(%rip), %xmm3, %xmm2
	vucomisd	%xmm2, %xmm1
	jae	.LBB9_5
# %bb.2:
	vaddsd	%xmm0, %xmm0, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm3
	vmovapd	%xmm3, %xmm0
	je	.LBB9_4
# %bb.3:
	vmovapd	%xmm3, %xmm0
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovsd	%xmm3, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovsd	16(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
.LBB9_4:
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	.LCPI9_4(%rip), %xmm3, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vsubsd	%xmm4, %xmm0, %xmm0
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB9_5:
	.cfi_def_cfa_offset 64
	vsqrtsd	%xmm3, %xmm3, %xmm2
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jbe	.LBB9_8
# %bb.6:
	vaddsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm1, %xmm0
	je	.LBB9_11
# %bb.7:
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovapd	16(%rsp), %xmm5                 # 16-byte Reload
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	(%rsp), %xmm3                   # 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.LBB9_11:
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	je	.LBB9_12
.LBB9_13:
	vdivsd	%xmm0, %xmm5, %xmm1
	vaddsd	%xmm4, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm0, %xmm0
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB9_8:
	.cfi_def_cfa_offset 64
	vsubsd	%xmm0, %xmm2, %xmm0
	vucomisd	%xmm1, %xmm0
	je	.LBB9_10
# %bb.9:
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 16(%rsp)                 # 16-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovapd	16(%rsp), %xmm5                 # 16-byte Reload
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	(%rsp), %xmm3                   # 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vaddsd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.LBB9_10:
	vxorpd	.LCPI9_0(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm0
	jne	.LBB9_13
.LBB9_12:
	vxorpd	.LCPI9_0(%rip), %xmm4, %xmm0
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	_Z13SolveCubicOptddd, .Lfunc_end9-_Z13SolveCubicOptddd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z5Cubicdd
.LCPI10_0:
	.quad	0x4000000000000000              # double 2
.LCPI10_1:
	.quad	0xc008000000000000              # double -3
	.text
	.globl	_Z5Cubicdd
	.p2align	4, 0x90
	.type	_Z5Cubicdd,@function
_Z5Cubicdd:                             # @_Z5Cubicdd
	.cfi_startproc
# %bb.0:
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI10_0(%rip), %xmm3          # xmm3 = mem[0],zero
	vmulsd	.LCPI10_1(%rip), %xmm1, %xmm2
	vsubsd	%xmm0, %xmm3, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	jmp	_Z13SolveCubicOptddd            # TAILCALL
.Lfunc_end10:
	.size	_Z5Cubicdd, .Lfunc_end10-_Z5Cubicdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z4Padedd
.LCPI11_0:
	.quad	0x401c000000000000              # double 7
.LCPI11_1:
	.quad	0x4008000000000000              # double 3
.LCPI11_2:
	.quad	0x3ff0000000000000              # double 1
.LCPI11_4:
	.quad	0x4034000000000000              # double 20
.LCPI11_5:
	.quad	0xc03e000000000000              # double -30
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI11_3:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.text
	.globl	_Z4Padedd
	.p2align	4, 0x90
	.type	_Z4Padedd,@function
_Z4Padedd:                              # @_Z4Padedd
	.cfi_startproc
# %bb.0:
	vmulsd	.LCPI11_0(%rip), %xmm0, %xmm2
	vaddsd	.LCPI11_1(%rip), %xmm2, %xmm2
	vmovsd	.LCPI11_2(%rip), %xmm3          # xmm3 = mem[0],zero
	vxorpd	.LCPI11_3(%rip), %xmm1, %xmm4
	vdivsd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm4, %xmm2, %xmm4
	vmovsd	.LCPI11_4(%rip), %xmm3          # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm0, %xmm0
	vsubsd	%xmm0, %xmm3, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm3
	vmulsd	.LCPI11_5(%rip), %xmm1, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm2
	vmovapd	%xmm4, %xmm0
	vmovapd	%xmm3, %xmm1
	jmp	_Z13SolveCubicOptddd            # TAILCALL
.Lfunc_end11:
	.size	_Z4Padedd, .Lfunc_end11-_Z4Padedd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _Z5Basicdd
.LCPI12_0:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI12_6:
	.quad	0x4008000000000000              # double 3
	.quad	0x4000000000000000              # double 2
.LCPI12_12:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI12_13:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI12_14:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI12_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI12_2:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI12_3:
	.quad	0x404e000000000000              # double 60
.LCPI12_4:
	.quad	0x401c000000000000              # double 7
.LCPI12_5:
	.quad	0x4008000000000000              # double 3
.LCPI12_7:
	.quad	0xc04e000000000000              # double -60
.LCPI12_8:
	.quad	0x4341c37937e08000              # double 1.0E+16
.LCPI12_9:
	.quad	0xc034000000000000              # double -20
.LCPI12_10:
	.quad	0x4034000000000000              # double 20
.LCPI12_11:
	.quad	0xc03e000000000000              # double -30
.LCPI12_15:
	.quad	0x0000000000000000              # double 0
	.text
	.globl	_Z5Basicdd
	.p2align	4, 0x90
	.type	_Z5Basicdd,@function
_Z5Basicdd:                             # @_Z5Basicdd
	.cfi_startproc
# %bb.0:
	vmovapd	%xmm1, %xmm3
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm3
	jne	.LBB12_1
# %bb.5:
	vmovapd	%xmm3, %xmm0
	retq
.LBB12_1:
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	vxorpd	.LCPI12_0(%rip), %xmm0, %xmm1
	vminsd	%xmm1, %xmm0, %xmm2
	vaddsd	.LCPI12_1(%rip), %xmm2, %xmm2
	vmovsd	%xmm2, 24(%rsp)                 # 8-byte Spill
	vmaxsd	%xmm0, %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmulsd	.LCPI12_2(%rip), %xmm3, %xmm0
	vmovapd	%xmm3, (%rsp)                   # 16-byte Spill
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovapd	(%rsp), %xmm0                   # 16-byte Reload
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm7                 # 16-byte Reload
	vmovsd	24(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
	vmulsd	.LCPI12_3(%rip), %xmm6, %xmm2
	vmulsd	.LCPI12_4(%rip), %xmm7, %xmm1
	vaddsd	.LCPI12_5(%rip), %xmm1, %xmm3
	vunpcklpd	32(%rsp), %xmm7, %xmm1  # 16-byte Folded Reload
                                        # xmm1 = xmm7[0],mem[0]
	vmulpd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm3, %xmm3
	vmulpd	.LCPI12_6(%rip), %xmm1, %xmm4
	vaddsd	%xmm2, %xmm3, %xmm3
	vmovsd	.LCPI12_7(%rip), %xmm2          # xmm2 = mem[0],zero
	vsubsd	%xmm4, %xmm2, %xmm5
	vpermilpd	$1, %xmm4, %xmm2        # xmm2 = xmm4[1,0]
	vmulsd	%xmm2, %xmm5, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vucomisd	.LCPI12_15(%rip), %xmm3
	jne	.LBB12_3
# %bb.2:
	vmovsd	.LCPI12_8(%rip), %xmm3          # xmm3 = mem[0],zero
	jmp	.LBB12_4
.LBB12_3:
	vmovsd	.LCPI12_1(%rip), %xmm4          # xmm4 = mem[0],zero
	vdivsd	%xmm3, %xmm4, %xmm3
.LBB12_4:
	vmovsd	.LCPI12_9(%rip), %xmm4          # xmm4 = mem[0],zero
	vsubsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm3, %xmm4
	vmulsd	%xmm7, %xmm2, %xmm0
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	.LCPI12_10(%rip), %xmm0, %xmm2
	vmulsd	%xmm1, %xmm4, %xmm0
	vmulsd	%xmm3, %xmm2, %xmm1
	vmulsd	.LCPI12_11(%rip), %xmm4, %xmm2
	callq	_Z13SolveCubicOptddd
	vmulsd	(%rsp), %xmm0, %xmm1            # 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovapd	.LCPI12_12(%rip), %xmm2         # xmm2 = [1.0E+0,1.0E+0]
	vblendvpd	%xmm1, .LCPI12_13(%rip), %xmm2, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	callq	atan2
	vmovapd	(%rsp), %xmm3                   # 16-byte Reload
	vmovapd	.LCPI12_14(%rip), %xmm1         # xmm1 = [NaN,NaN]
	vandpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm1, %xmm3, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm3, %xmm0, %xmm3
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm3, %xmm0
	retq
.Lfunc_end12:
	.size	_Z5Basicdd, .Lfunc_end12-_Z5Basicdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z6Betterdd
.LCPI13_0:
	.quad	0x3fb8840e1719f7f9              # double 0.095765000000000003
.LCPI13_1:
	.quad	0x401c000000000000              # double 7
.LCPI13_2:
	.quad	0x3f70c4dec1c1d6d0              # double 0.0040940000000000004
.LCPI13_3:
	.quad	0x4008000000000000              # double 3
.LCPI13_4:
	.quad	0x404e000000000000              # double 60
.LCPI13_5:
	.quad	0x3ff0000000000000              # double 1
.LCPI13_6:
	.quad	0xbfd5555555555555              # double -0.33333333333333331
.LCPI13_7:
	.quad	0x4034000000000000              # double 20
.LCPI13_8:
	.quad	0xc03e000000000000              # double -30
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI13_9:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI13_10:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI13_11:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI13_12:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.text
	.globl	_Z6Betterdd
	.p2align	4, 0x90
	.type	_Z6Betterdd,@function
_Z6Betterdd:                            # @_Z6Betterdd
	.cfi_startproc
# %bb.0:
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	vmovaps	%xmm1, %xmm3
	vmovaps	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm4
	vmovsd	%xmm4, 8(%rsp)                  # 8-byte Spill
	vmovsd	.LCPI13_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vmulsd	%xmm0, %xmm4, %xmm1
	vmulsd	.LCPI13_2(%rip), %xmm4, %xmm2
	vaddsd	%xmm0, %xmm2, %xmm0
	vmovsd	.LCPI13_1(%rip), %xmm2          # xmm2 = mem[0],zero
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	.LCPI13_3(%rip), %xmm0, %xmm0
	vsubsd	%xmm1, %xmm2, %xmm1
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	%xmm4, %xmm0, %xmm0
	vaddsd	.LCPI13_4(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	leaq	40(%rsp), %rdi
	leaq	32(%rsp), %rsi
	vmovaps	%xmm3, %xmm0
	callq	sincos@PLT
	vmovsd	32(%rsp), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	(%rsp), %xmm5                   # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vmulsd	%xmm0, %xmm5, %xmm1
	vmovsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmulsd	16(%rsp), %xmm2, %xmm2          # 8-byte Folded Reload
	vsubsd	.LCPI13_4(%rip), %xmm2, %xmm2
	vmovsd	24(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	.LCPI13_5(%rip), %xmm2          # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmulsd	40(%rsp), %xmm1, %xmm2
	vmulsd	.LCPI13_6(%rip), %xmm2, %xmm3
	vsubsd	%xmm4, %xmm0, %xmm0
	vmulsd	.LCPI13_7(%rip), %xmm0, %xmm4
	vmulsd	%xmm5, %xmm3, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	.LCPI13_8(%rip), %xmm2, %xmm2
	callq	_Z13SolveCubicOptddd
	vmulsd	48(%rsp), %xmm0, %xmm1          # 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jae	.LBB13_2
# %bb.1:
	vxorpd	.LCPI13_9(%rip), %xmm0, %xmm0
.LBB13_2:
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovapd	.LCPI13_10(%rip), %xmm2         # xmm2 = [1.0E+0,1.0E+0]
	vblendvpd	%xmm1, .LCPI13_11(%rip), %xmm2, %xmm1
	callq	atan2
	vmovapd	.LCPI13_12(%rip), %xmm1         # xmm1 = [NaN,NaN]
	vandpd	%xmm1, %xmm0, %xmm2
	vmovapd	48(%rsp), %xmm3                 # 16-byte Reload
	vandpd	%xmm1, %xmm3, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm3, %xmm0, %xmm0
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end13:
	.size	_Z6Betterdd, .Lfunc_end13-_Z6Betterdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z10Gooding_S3dd
.LCPI14_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	_Z10Gooding_S3dd
	.p2align	4, 0x90
	.type	_Z10Gooding_S3dd,@function
_Z10Gooding_S3dd:                       # @_Z10Gooding_S3dd
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	leaq	32(%rsp), %rdi
	leaq	24(%rsp), %rsi
	vmovaps	%xmm1, %xmm0
	callq	sincos@PLT
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmulsd	32(%rsp), %xmm1, %xmm0
	vmulsd	24(%rsp), %xmm1, %xmm1
	vaddsd	.LCPI14_0(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vaddsd	16(%rsp), %xmm0, %xmm0          # 8-byte Folded Reload
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end14:
	.size	_Z10Gooding_S3dd, .Lfunc_end14-_Z10Gooding_S3dd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z10Gooding_S9dd
.LCPI15_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI15_1:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI15_2:
	.quad	0x4010000000000000              # double 4
	.text
	.globl	_Z10Gooding_S9dd
	.p2align	4, 0x90
	.type	_Z10Gooding_S9dd,@function
_Z10Gooding_S9dd:                       # @_Z10Gooding_S9dd
	.cfi_startproc
# %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB15_1
# %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
.LBB15_1:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	.LCPI15_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI15_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	callq	sin@PLT
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	vmovsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	callq	sin@PLT
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmulsd	%xmm2, %xmm0, %xmm0
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm1, %xmm1
	vmulsd	.LCPI15_2(%rip), %xmm2, %xmm2
	vmovsd	24(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	vaddsd	%xmm1, %xmm2, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm1, %xmm0
	retq
.Lfunc_end15:
	.size	_Z10Gooding_S9dd, .Lfunc_end15-_Z10Gooding_S9dd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z12Gooding_S9s2dd
.LCPI16_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI16_1:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI16_2:
	.quad	0x4010000000000000              # double 4
	.text
	.globl	_Z12Gooding_S9s2dd
	.p2align	4, 0x90
	.type	_Z12Gooding_S9s2dd,@function
_Z12Gooding_S9s2dd:                     # @_Z12Gooding_S9s2dd
	.cfi_startproc
# %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB16_1
# %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
.LBB16_1:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	vmovsd	.LCPI16_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vsubsd	%xmm2, %xmm0, %xmm3
	vmovsd	%xmm3, 8(%rsp)                  # 8-byte Spill
	vmulsd	.LCPI16_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	callq	sin@PLT
	vaddsd	%xmm0, %xmm0, %xmm1
	vmovsd	(%rsp), %xmm4                   # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI16_0(%rip), %xmm2          # xmm2 = mem[0],zero
	vsubsd	%xmm0, %xmm2, %xmm2
	vmovsd	8(%rsp), %xmm3                  # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmulsd	.LCPI16_2(%rip), %xmm4, %xmm4
	vmulsd	%xmm0, %xmm4, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm1, %xmm0
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm1, %xmm0
	retq
.Lfunc_end16:
	.size	_Z12Gooding_S9s2dd, .Lfunc_end16-_Z12Gooding_S9s2dd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z4S9t2dd
.LCPI17_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI17_1:
	.quad	0x3fe0000000000000              # double 0.5
	.text
	.globl	_Z4S9t2dd
	.p2align	4, 0x90
	.type	_Z4S9t2dd,@function
_Z4S9t2dd:                              # @_Z4S9t2dd
	.cfi_startproc
# %bb.0:
	vmovapd	%xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm1
	jne	.LBB17_1
# %bb.2:
	vmovapd	%xmm1, %xmm0
	retq
.LBB17_1:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	vmovsd	.LCPI17_0(%rip), %xmm3          # xmm3 = mem[0],zero
	vaddsd	%xmm3, %xmm2, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	vsubsd	%xmm2, %xmm3, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI17_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	vmovsd	%xmm2, 8(%rsp)                  # 8-byte Spill
	callq	tan
	vmulsd	%xmm0, %xmm0, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	8(%rsp), %xmm0, %xmm0           # 8-byte Folded Reload
	vaddsd	.LCPI17_0(%rip), %xmm1, %xmm2
	vmovsd	16(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmovsd	24(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm1, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	32(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	vmovapd	%xmm1, %xmm0
	retq
.Lfunc_end17:
	.size	_Z4S9t2dd, .Lfunc_end17-_Z4S9t2dd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z7S9t2p54dd
.LCPI18_0:
	.quad	0x3ff0000000000000              # double 1
.LCPI18_1:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI18_2:
	.quad	0x3ff921fb54442d18              # double 1.5707963267948966
.LCPI18_3:
	.quad	0x402e000000000000              # double 15
.LCPI18_4:
	.quad	0xc07a400000000000              # double -420
.LCPI18_5:
	.quad	0x408d880000000000              # double 945
.LCPI18_6:
	.quad	0xc05a400000000000              # double -105
	.text
	.globl	_Z7S9t2p54dd
	.p2align	4, 0x90
	.type	_Z7S9t2p54dd,@function
_Z7S9t2p54dd:                           # @_Z7S9t2p54dd
	.cfi_startproc
# %bb.0:
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jne	.LBB18_1
# %bb.5:
	vmovapd	%xmm1, %xmm0
	retq
.LBB18_1:
	vmovsd	.LCPI18_0(%rip), %xmm3          # xmm3 = mem[0],zero
	vsubsd	%xmm0, %xmm3, %xmm2
	vmulsd	.LCPI18_1(%rip), %xmm1, %xmm4
	vaddsd	%xmm3, %xmm0, %xmm3
	vucomisd	.LCPI18_2(%rip), %xmm1
	jae	.LBB18_3
# %bb.2:
	vmulsd	%xmm4, %xmm4, %xmm6
	vmulsd	.LCPI18_3(%rip), %xmm6, %xmm5
	vaddsd	.LCPI18_4(%rip), %xmm5, %xmm5
	vmulsd	%xmm6, %xmm5, %xmm5
	vmovsd	.LCPI18_5(%rip), %xmm8          # xmm8 = mem[0],zero
	vaddsd	.LCPI18_6(%rip), %xmm6, %xmm7
	vaddsd	%xmm5, %xmm8, %xmm5
	vmulsd	%xmm6, %xmm7, %xmm6
	vaddsd	%xmm6, %xmm8, %xmm6
	vmulsd	%xmm4, %xmm6, %xmm4
	jmp	.LBB18_4
.LBB18_3:
	vmovsd	.LCPI18_2(%rip), %xmm5          # xmm5 = mem[0],zero
	vsubsd	%xmm4, %xmm5, %xmm5
	vmulsd	%xmm5, %xmm5, %xmm6
	vmulsd	.LCPI18_3(%rip), %xmm6, %xmm4
	vaddsd	.LCPI18_4(%rip), %xmm4, %xmm4
	vmulsd	%xmm6, %xmm4, %xmm4
	vmovsd	.LCPI18_5(%rip), %xmm8          # xmm8 = mem[0],zero
	vaddsd	.LCPI18_6(%rip), %xmm6, %xmm7
	vaddsd	%xmm4, %xmm8, %xmm4
	vmulsd	%xmm6, %xmm7, %xmm6
	vaddsd	%xmm6, %xmm8, %xmm6
	vmulsd	%xmm5, %xmm6, %xmm5
.LBB18_4:
	vmulsd	%xmm2, %xmm5, %xmm2
	vmulsd	%xmm3, %xmm4, %xmm3
	vaddsd	%xmm4, %xmm4, %xmm6
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vunpcklpd	%xmm5, %xmm2, %xmm2     # xmm2 = xmm2[0],xmm5[0]
	vmulpd	%xmm2, %xmm2, %xmm2
	vunpcklpd	%xmm4, %xmm3, %xmm3     # xmm3 = xmm3[0],xmm4[0]
	vmulpd	%xmm3, %xmm3, %xmm3
	vaddpd	%xmm3, %xmm2, %xmm2
	vpermilpd	$1, %xmm2, %xmm3        # xmm3 = xmm2[1,0]
	vmulsd	%xmm3, %xmm2, %xmm2
	vsqrtsd	%xmm2, %xmm2, %xmm2
	vdivsd	%xmm2, %xmm0, %xmm0
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, %xmm0
	retq
.Lfunc_end18:
	.size	_Z7S9t2p54dd, .Lfunc_end18-_Z7S9t2p54dd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z7TimeFunPFdddEd
.LCPI19_0:
	.quad	0x3e9515370f99f6cb              # double 3.1415926535897932E-7
.LCPI19_1:
	.quad	0x4045000000000000              # double 42
	.text
	.globl	_Z7TimeFunPFdddEd
	.p2align	4, 0x90
	.type	_Z7TimeFunPFdddEd,@function
_Z7TimeFunPFdddEd:                      # @_Z7TimeFunPFdddEd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	movq	%rdi, %rbx
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB19_1:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	vmovsd	24(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vaddsd	.LCPI19_0(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB19_1
# %bb.2:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI19_1(%rip), %xmm0
	jne	.LBB19_4
# %bb.3:
	vmovsd	.LCPI19_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB19_4:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rax
	addq	$5000000, %rax                  # imm = 0x4C4B40
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$23, %rax
	addl	%ecx, %eax
                                        # kill: def $eax killed $eax killed $rax
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	_Z7TimeFunPFdddEd, .Lfunc_end19-_Z7TimeFunPFdddEd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z6DoTestPKcPFdddEdd
.LCPI20_0:
	.quad	0x3feb333333333333              # double 0.84999999999999998
.LCPI20_1:
	.quad	0x3e9515370f99f6cb              # double 3.1415926535897932E-7
.LCPI20_2:
	.quad	0x4045000000000000              # double 42
	.text
	.globl	_Z6DoTestPKcPFdddEdd
	.p2align	4, 0x90
	.type	_Z6DoTestPKcPFdddEdd,@function
_Z6DoTestPKcPFdddEdd:                   # @_Z6DoTestPKcPFdddEdd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	*%rsi
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movq	%r14, %rsi
	vmovsd	8(%rsp), %xmm0                  # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB20_1:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	callq	*%rbx
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_1
# %bb.2:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	.LCPI20_2(%rip), %xmm0
	jne	.LBB20_4
# %bb.3:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_4:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	movabsq	$-2972493582642298179, %r12     # imm = 0xD6BF94D5E57A42BD
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB20_5:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_5
# %bb.6:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	.LCPI20_2(%rip), %xmm2
	jne	.LBB20_8
# %bb.7:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_8:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB20_9:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_9
# %bb.10:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	.LCPI20_2(%rip), %xmm2
	jne	.LBB20_12
# %bb.11:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_12:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB20_13:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_13
# %bb.14:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	.LCPI20_2(%rip), %xmm2
	jne	.LBB20_16
# %bb.15:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_16:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB20_17:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_17
# %bb.18:
	rdtsc
	movq	%rdx, %r15
	shlq	$32, %r15
	orq	%rax, %r15
	vucomisd	.LCPI20_2(%rip), %xmm2
	jne	.LBB20_20
# %bb.19:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_20:
	subq	%r14, %r15
	leaq	5000000(%r15), %rax
	imulq	%r12
	leaq	(%rdx,%r15), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %r14
	shlq	$32, %r14
	orq	%rax, %r14
	vxorpd	%xmm1, %xmm1, %xmm1
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB20_21:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 8(%rsp)                  # 8-byte Spill
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI20_0(%rip), %xmm0          # xmm0 = mem[0],zero
	callq	*%rbx
	vmovsd	8(%rsp), %xmm1                  # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vaddsd	%xmm2, %xmm0, %xmm2
	vaddsd	.LCPI20_1(%rip), %xmm1, %xmm1
	decl	%ebp
	jne	.LBB20_21
# %bb.22:
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI20_2(%rip), %xmm2
	jne	.LBB20_24
# %bb.23:
	vmovsd	.LCPI20_2(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB20_24:
	subq	%r14, %rbx
	leaq	5000000(%rbx), %rax
	imulq	%r12
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	addq	$16, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT                     # TAILCALL
.Lfunc_end20:
	.size	_Z6DoTestPKcPFdddEdd, .Lfunc_end20-_Z6DoTestPKcPFdddEdd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z7TestAlldd
.LCPI21_0:
	.quad	0x3e9515370f99f6cb              # double 3.1415926535897932E-7
.LCPI21_1:
	.quad	0x4045000000000000              # double 42
.LCPI21_11:
	.quad	0x2b617f7d4ed8c33e              # double 1.0E-99
.LCPI21_13:
	.quad	0x3ff0000000000000              # double 1
.LCPI21_16:
	.quad	0x4000000000000000              # double 2
.LCPI21_17:
	.quad	0xc008000000000000              # double -3
.LCPI21_18:
	.quad	0x3fd3333333333334              # double 0.30000000000000004
.LCPI21_19:
	.quad	0x401c000000000000              # double 7
.LCPI21_20:
	.quad	0x4008000000000000              # double 3
.LCPI21_22:
	.quad	0x4034000000000000              # double 20
.LCPI21_23:
	.quad	0xc03e000000000000              # double -30
.LCPI21_24:
	.quad	0xbfbc9a75461405b9              # double -0.111731843575419
.LCPI21_25:
	.quad	0xc00ad0cdf1b2c55d              # double -3.3519553072625698
.LCPI21_26:
	.quad	0x3fd573d7f48f044b              # double 0.33519553072625702
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI21_2:
	.quad	0x0000000000000000              # double 0
	.quad	0x3e9515370f99f6cb              # double 3.1415926535897932E-7
	.quad	0x3ea515370f99f6cb              # double 6.2831853071795864E-7
	.quad	0x3eaf9fd29766f230              # double 9.4247779607693791E-7
.LCPI21_3:
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
.LCPI21_4:
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
.LCPI21_5:
	.quad	0x3ecf9fd29766f230              # double 3.7699111843077517E-6
	.quad	0x3ecf9fd29766f230              # double 3.7699111843077517E-6
	.quad	0x3ecf9fd29766f230              # double 3.7699111843077517E-6
	.quad	0x3ecf9fd29766f230              # double 3.7699111843077517E-6
.LCPI21_6:
	.quad	0x3ed515370f99f6cb              # double 5.0265482457436692E-6
	.quad	0x3ed515370f99f6cb              # double 5.0265482457436692E-6
	.quad	0x3ed515370f99f6cb              # double 5.0265482457436692E-6
	.quad	0x3ed515370f99f6cb              # double 5.0265482457436692E-6
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI21_7:
	.quad	0x3ea515370f99f6cb              # double 6.2831853071795864E-7
	.quad	0x3ea515370f99f6cb              # double 6.2831853071795864E-7
.LCPI21_8:
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
.LCPI21_9:
	.quad	0x3ebf9fd29766f230              # double 1.8849555921538758E-6
	.quad	0x3ebf9fd29766f230              # double 1.8849555921538758E-6
.LCPI21_10:
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
.LCPI21_12:
	.quad	0x2b617f7d4ed8c33e              # double 1.0E-99
	.quad	0x2b617f7d4ed8c33e              # double 1.0E-99
.LCPI21_14:
	.quad	0x3feb333333333333              # double 0.84999999999999998
	.quad	0x3feb333333333333              # double 0.84999999999999998
.LCPI21_15:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI21_21:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
	.text
	.globl	_Z7TestAlldd
	.p2align	4, 0x90
	.type	_Z7TestAlldd,@function
_Z7TestAlldd:                           # @_Z7TestAlldd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$1016, %rsp                     # imm = 0x3F8
	.cfi_def_cfa_offset 1072
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	vmovapd	%xmm1, 192(%rsp)                # 16-byte Spill
	vmovsd	%xmm0, 152(%rsp)                # 8-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cbrt
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.4, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_1:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	callq	cbrt
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovsd	16(%rsp), %xmm0                 # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	.LCPI21_0(%rip), %xmm0, %xmm0
	decl	%ebp
	jne	.LBB21_1
# %bb.2:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_4
# %bb.3:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_4:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	movabsq	$-2972493582642298179, %r14     # imm = 0xD6BF94D5E57A42BD
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_5:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_5
# %bb.6:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_8
# %bb.7:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_8:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_9:                               # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_9
# %bb.10:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_12
# %bb.11:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_12:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_13:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_13
# %bb.14:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_16
# %bb.15:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_16:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_17:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_17
# %bb.18:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_20
# %bb.19:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_20:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_21:                              # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_21
# %bb.22:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_24
# %bb.23:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_24:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movl	$.L.str.5, %edi
	movl	$_Z8BM_cbrt3dd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	vsqrtsd	%xmm1, %xmm1, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.6, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB21_25:                              # =>This Inner Loop Header: Depth=1
	vaddpd	.LCPI21_3(%rip), %ymm1, %ymm5
	vaddpd	.LCPI21_4(%rip), %ymm1, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	.LCPI21_5(%rip), %ymm1, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	.LCPI21_6(%rip), %ymm1, %ymm1
	addl	$-16, %eax
	jne	.LBB21_25
# %bb.26:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_28
# %bb.27:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_28:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_3(%rip), %ymm9          # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	.LCPI21_4(%rip), %ymm10         # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	.LCPI21_5(%rip), %ymm11         # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	.LCPI21_6(%rip), %ymm12         # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	.p2align	4, 0x90
.LBB21_29:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_29
# %bb.30:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_32
# %bb.31:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_32:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_3(%rip), %ymm9          # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	.LCPI21_4(%rip), %ymm10         # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	.LCPI21_5(%rip), %ymm11         # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	.LCPI21_6(%rip), %ymm12         # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	.p2align	4, 0x90
.LBB21_33:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_33
# %bb.34:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_36
# %bb.35:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_36:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_3(%rip), %ymm9          # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	.LCPI21_4(%rip), %ymm10         # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	.LCPI21_5(%rip), %ymm11         # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	.LCPI21_6(%rip), %ymm12         # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	.p2align	4, 0x90
.LBB21_37:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_37
# %bb.38:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_40
# %bb.39:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_40:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_3(%rip), %ymm9          # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	.LCPI21_4(%rip), %ymm10         # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	.LCPI21_5(%rip), %ymm11         # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	.LCPI21_6(%rip), %ymm12         # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	.p2align	4, 0x90
.LBB21_41:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_41
# %bb.42:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_44
# %bb.43:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_44:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	.LCPI21_2(%rip), %ymm1          # ymm1 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %eax                 # imm = 0x989680
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_3(%rip), %ymm9          # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vmovapd	.LCPI21_4(%rip), %ymm10         # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vmovapd	.LCPI21_5(%rip), %ymm11         # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vmovapd	.LCPI21_6(%rip), %ymm12         # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	.p2align	4, 0x90
.LBB21_45:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm8, %ymm7
	vaddpd	%ymm5, %ymm2, %ymm2
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm7, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_45
# %bb.46:
	vaddpd	%ymm0, %ymm2, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_48
# %bb.47:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	vzeroupper
	callq	printf
.LBB21_48:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	callq	exp@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.7, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm0   # xmm0 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_49:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm1, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm0, %xmm1
	vmovapd	%xmm1, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm0, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vmovapd	32(%rsp), %xmm2                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	(%rsp), %xmm0                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm0, %xmm0
	addl	$-8, %ebp
	jne	.LBB21_49
# %bb.50:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_52
# %bb.51:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_52:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_53:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	exp@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_53
# %bb.54:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_56
# %bb.55:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_56:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_57:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	exp@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_57
# %bb.58:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_60
# %bb.59:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_60:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_61:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	exp@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_61
# %bb.62:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_64
# %bb.63:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_64:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_65:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	exp@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_65
# %bb.66:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_68
# %bb.67:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_68:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_69:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	exp@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_69
# %bb.70:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_72
# %bb.71:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_72:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	vaddsd	.LCPI21_11(%rip), %xmm0, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.8, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_73:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_73
# %bb.74:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_76
# %bb.75:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_76:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_77:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_77
# %bb.78:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_80
# %bb.79:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_80:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_81:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_81
# %bb.82:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_84
# %bb.83:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_84:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_85:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_85
# %bb.86:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_88
# %bb.87:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_88:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_89:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_89
# %bb.90:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_92
# %bb.91:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_92:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_93:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_12(%rip), %xmm1, %xmm2
	vmovapd	%xmm2, 160(%rsp)                # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm1, %xmm0, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	(%rsp), %xmm0                   # 16-byte Reload
	callq	log@PLT
	vmovaps	%xmm0, 16(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm2, %xmm0, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_93
# %bb.94:
	vmovapd	96(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	48(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_96
# %bb.95:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_96:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	callq	cos@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.9, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	vmovsd	%xmm2, 160(%rsp)                # 8-byte Spill
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_97:                              # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_97
# %bb.98:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_100
# %bb.99:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_100:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_101:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_101
# %bb.102:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_104
# %bb.103:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_104:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_105:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_105
# %bb.106:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_108
# %bb.107:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_108:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_109:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_109
# %bb.110:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_112
# %bb.111:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_112:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_113:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_113
# %bb.114:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_116
# %bb.115:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_116:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_117:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cos@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_117
# %bb.118:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_120
# %bb.119:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_120:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	callq	sin@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.10, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	vmovsd	%xmm2, 176(%rsp)                # 8-byte Spill
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_121:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_121
# %bb.122:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_124
# %bb.123:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_124:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_125:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_125
# %bb.126:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_128
# %bb.127:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_128:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_129:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_129
# %bb.130:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_132
# %bb.131:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_132:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_133:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_133
# %bb.134:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_136
# %bb.135:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_136:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_137:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_137
# %bb.138:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_140
# %bb.139:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_140:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vmovhpd	.LCPI21_0(%rip), %xmm1, %xmm1   # xmm1 = xmm1[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 80(%rsp)                 # 16-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm0, 112(%rsp)                # 16-byte Spill
	vxorpd	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB21_141:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm2, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	sin@PLT
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 96(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 80(%rsp)                 # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	48(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	%xmm0, %xmm1, %xmm1
	vmovapd	%xmm1, 112(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	128(%rsp), %xmm2                # 16-byte Reload
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm3                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm3, %xmm0     # xmm0 = xmm3[0],xmm0[0]
	vaddpd	%xmm0, %xmm2, %xmm2
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_141
# %bb.142:
	vmovapd	80(%rsp), %xmm0                 # 16-byte Reload
	vaddpd	96(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vaddpd	112(%rsp), %xmm0, %xmm0         # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm2, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_144
# %bb.143:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_144:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	callq	tan
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.11, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_145:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_145
# %bb.146:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_148
# %bb.147:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_148:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_149:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_149
# %bb.150:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_152
# %bb.151:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_152:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_153:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_153
# %bb.154:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_156
# %bb.155:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_156:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_157:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_157
# %bb.158:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_160
# %bb.159:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_160:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_161:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_161
# %bb.162:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_164
# %bb.163:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_164:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_165:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, 16(%rsp)                 # 8-byte Spill
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_165
# %bb.166:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_168
# %bb.167:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_168:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmulsd	176(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vmulsd	160(%rsp), %xmm0, %xmm1         # 8-byte Folded Reload
	vaddsd	.LCPI21_13(%rip), %xmm1, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm2
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	vaddsd	%xmm1, %xmm2, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.12, %esi
	movb	$3, %al
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	936(%rsp), %r14
	leaq	896(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	888(%rsp), %r12
	leaq	912(%rsp), %r13
	leaq	904(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_169:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	992(%rsp), %rdi
	leaq	984(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	992(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1008(%rsp), %rdi
	leaq	1000(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	1008(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	960(%rsp), %rdi
	leaq	952(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	960(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	976(%rsp), %rdi
	leaq	968(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	976(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	928(%rsp), %rdi
	leaq	920(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	928(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	944(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	944(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	896(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	912(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	984(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	1000(%rsp), %xmm4, %xmm4        # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	952(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	968(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	920(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	936(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	888(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	904(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_169
# %bb.170:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_172
# %bb.171:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_172:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	808(%rsp), %r14
	leaq	768(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	760(%rsp), %r12
	leaq	784(%rsp), %r13
	leaq	776(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_173:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	864(%rsp), %rdi
	leaq	856(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	864(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	880(%rsp), %rdi
	leaq	872(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	880(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	832(%rsp), %rdi
	leaq	824(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	832(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	848(%rsp), %rdi
	leaq	840(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	848(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	800(%rsp), %rdi
	leaq	792(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	800(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	816(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	816(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	768(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	784(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	856(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	872(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	824(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	840(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	792(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	808(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	760(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	776(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_173
# %bb.174:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_176
# %bb.175:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_176:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	680(%rsp), %r14
	leaq	640(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	632(%rsp), %r12
	leaq	656(%rsp), %r13
	leaq	648(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_177:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	736(%rsp), %rdi
	leaq	728(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	736(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	752(%rsp), %rdi
	leaq	744(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	752(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	704(%rsp), %rdi
	leaq	696(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	704(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	720(%rsp), %rdi
	leaq	712(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	720(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	672(%rsp), %rdi
	leaq	664(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	672(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	688(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	688(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	640(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	656(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	728(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	744(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	696(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	712(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	664(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	680(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	632(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	648(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_177
# %bb.178:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_180
# %bb.179:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_180:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	552(%rsp), %r14
	leaq	512(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	504(%rsp), %r12
	leaq	528(%rsp), %r13
	leaq	520(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_181:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	608(%rsp), %rdi
	leaq	600(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	608(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	624(%rsp), %rdi
	leaq	616(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	624(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	576(%rsp), %rdi
	leaq	568(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	576(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	592(%rsp), %rdi
	leaq	584(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	592(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	544(%rsp), %rdi
	leaq	536(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	544(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	560(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	560(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	512(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	528(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	600(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	616(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	568(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	584(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	536(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	552(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	504(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	520(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_181
# %bb.182:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_184
# %bb.183:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_184:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	424(%rsp), %r14
	leaq	384(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	376(%rsp), %r12
	leaq	400(%rsp), %r13
	leaq	392(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_185:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	480(%rsp), %rdi
	leaq	472(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	480(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	496(%rsp), %rdi
	leaq	488(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	496(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	448(%rsp), %rdi
	leaq	440(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	448(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	464(%rsp), %rdi
	leaq	456(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	464(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	416(%rsp), %rdi
	leaq	408(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	416(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	432(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	432(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	384(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	400(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	472(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	488(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	440(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	456(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	408(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	424(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	376(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	392(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_185
# %bb.186:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_188
# %bb.187:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_188:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %rcx     # imm = 0xD6BF94D5E57A42BD
	imulq	%rcx
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 216(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovhpd	.LCPI21_0(%rip), %xmm4, %xmm1   # xmm1 = xmm4[0],mem[0]
	movl	$10000000, %ebp                 # imm = 0x989680
	leaq	296(%rsp), %r14
	leaq	256(%rsp), %r15
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	248(%rsp), %r12
	leaq	272(%rsp), %r13
	leaq	264(%rsp), %rbx
	.p2align	4, 0x90
.LBB21_189:                             # =>This Inner Loop Header: Depth=1
	vmovapd	%xmm4, 128(%rsp)                # 16-byte Spill
	vmovapd	%xmm2, 112(%rsp)                # 16-byte Spill
	vmovapd	%xmm3, 80(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, 96(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, (%rsp)                   # 16-byte Spill
	vaddpd	.LCPI21_7(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 48(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_8(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vaddpd	.LCPI21_9(%rip), %xmm1, %xmm0
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm1, %xmm0
	leaq	352(%rsp), %rdi
	leaq	344(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	352(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	368(%rsp), %rdi
	leaq	360(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	64(%rsp), %xmm0                 # 16-byte Reload
	vmovhps	368(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovaps	48(%rsp), %xmm0                 # 16-byte Reload
	leaq	320(%rsp), %rdi
	leaq	312(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	320(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vpermilpd	$1, 48(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	336(%rsp), %rdi
	leaq	328(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	160(%rsp), %xmm0                # 16-byte Reload
	vmovhps	336(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 160(%rsp)                # 16-byte Spill
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	leaq	288(%rsp), %rdi
	leaq	280(%rsp), %rsi
	callq	sincos@PLT
	vmovsd	288(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	304(%rsp), %rdi
	movq	%r14, %rsi
	callq	sincos@PLT
	vmovaps	176(%rsp), %xmm0                # 16-byte Reload
	vmovhps	304(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovaps	%xmm0, 176(%rsp)                # 16-byte Spill
	vmovaps	16(%rsp), %xmm0                 # 16-byte Reload
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovsd	256(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 16(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovapd	224(%rsp), %xmm0                # 16-byte Reload
	vmovhpd	272(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovapd	.LCPI21_14(%rip), %xmm5         # xmm5 = [8.4999999999999998E-1,8.4999999999999998E-1]
	vmulpd	64(%rsp), %xmm5, %xmm1          # 16-byte Folded Reload
	vmulpd	160(%rsp), %xmm5, %xmm2         # 16-byte Folded Reload
	vmulpd	176(%rsp), %xmm5, %xmm3         # 16-byte Folded Reload
	vmovsd	344(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	360(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vmovapd	.LCPI21_15(%rip), %xmm6         # xmm6 = [1.0E+0,1.0E+0]
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm1, %xmm1
	vmovsd	312(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	328(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm2, %xmm2
	vmovsd	280(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	296(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm0, %xmm0
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm3, %xmm3
	vmovsd	248(%rsp), %xmm4                # xmm4 = mem[0],zero
	vmovhpd	264(%rsp), %xmm4, %xmm4         # xmm4 = xmm4[0],mem[0]
	vmulpd	%xmm5, %xmm4, %xmm4
	vaddpd	%xmm6, %xmm4, %xmm4
	vmulpd	%xmm4, %xmm0, %xmm0
	vmovapd	128(%rsp), %xmm4                # 16-byte Reload
	vaddpd	(%rsp), %xmm4, %xmm4            # 16-byte Folded Reload
	vaddpd	%xmm1, %xmm4, %xmm4
	vmovapd	112(%rsp), %xmm1                # 16-byte Reload
	vaddpd	48(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm2, %xmm1, %xmm2
	vmovapd	80(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	32(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm3, %xmm1, %xmm3
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vaddpd	16(%rsp), %xmm1, %xmm1          # 16-byte Folded Reload
	vaddpd	%xmm0, %xmm1, %xmm5
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vaddpd	.LCPI21_10(%rip), %xmm1, %xmm1
	addl	$-8, %ebp
	jne	.LBB21_189
# %bb.190:
	vaddpd	%xmm4, %xmm2, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm0
	vaddpd	%xmm0, %xmm5, %xmm0
	vpermilpd	$1, %xmm0, %xmm1        # xmm1 = xmm0[1,0]
	vaddsd	%xmm1, %xmm0, %xmm0
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vucomisd	.LCPI21_1(%rip), %xmm0
	jne	.LBB21_192
# %bb.191:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_192:
	subq	216(%rsp), %rbx                 # 8-byte Folded Reload
	leaq	5000000(%rbx), %rax
	movabsq	$-2972493582642298179, %r14     # imm = 0xD6BF94D5E57A42BD
	imulq	%r14
	leaq	(%rdx,%rbx), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movl	$.L.str.13, %edi
	movl	$_Z10Gooding_S9dd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.14, %edi
	movl	$_Z12Gooding_S9s2dd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.15, %edi
	movl	$_Z4S9t2dd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.16, %edi
	movl	$_Z7S9t2p54dd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_16(%rip), %xmm1         # xmm1 = mem[0],zero
	vsubsd	%xmm0, %xmm1, %xmm1
	vmovapd	192(%rsp), %xmm0                # 16-byte Reload
	vmulsd	.LCPI21_17(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	callq	_Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.17, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_193:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmulsd	.LCPI21_17(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	(%rsp), %xmm0                   # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vaddsd	.LCPI21_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%rsp)                   # 8-byte Spill
	decl	%ebp
	jne	.LBB21_193
# %bb.194:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_196
# %bb.195:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_196:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_197:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI21_17(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm2            # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_197
# %bb.198:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_200
# %bb.199:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_200:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_201:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI21_17(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm2            # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_201
# %bb.202:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_204
# %bb.203:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_204:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_205:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI21_17(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm2            # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_205
# %bb.206:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_208
# %bb.207:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_208:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_209:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI21_17(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm2            # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_209
# %bb.210:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_212
# %bb.211:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_212:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_213:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmovsd	.LCPI21_17(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	(%rsp), %xmm0, %xmm2            # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_18(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_213
# %bb.214:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_216
# %bb.215:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_216:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovsd	152(%rsp), %xmm3                # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	.LCPI21_19(%rip), %xmm3, %xmm0
	vaddsd	.LCPI21_20(%rip), %xmm0, %xmm0
	vmovsd	.LCPI21_13(%rip), %xmm1         # xmm1 = mem[0],zero
	vdivsd	%xmm0, %xmm1, %xmm2
	vmovapd	192(%rsp), %xmm4                # 16-byte Reload
	vxorpd	.LCPI21_21(%rip), %xmm4, %xmm0
	vmulsd	%xmm0, %xmm2, %xmm0
	vmovsd	.LCPI21_22(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	%xmm1, %xmm3, %xmm3
	vsubsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm2, %xmm1
	vmulsd	.LCPI21_23(%rip), %xmm4, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm2
	callq	_Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.18, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	192(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_217:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmulsd	.LCPI21_25(%rip), %xmm1, %xmm2
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_217
# %bb.218:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_220
# %bb.219:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_220:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_221:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_25(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	(%rsp), %xmm1, %xmm2            # 8-byte Folded Reload
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_221
# %bb.222:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_224
# %bb.223:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_224:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_225:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_25(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	(%rsp), %xmm1, %xmm2            # 8-byte Folded Reload
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_225
# %bb.226:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_228
# %bb.227:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_228:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_229:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_25(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	(%rsp), %xmm1, %xmm2            # 8-byte Folded Reload
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_229
# %bb.230:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_232
# %bb.231:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_232:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_233:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_25(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	(%rsp), %xmm1, %xmm2            # 8-byte Folded Reload
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_233
# %bb.234:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_236
# %bb.235:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_236:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm2, %xmm2, %xmm2
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_237:                             # =>This Inner Loop Header: Depth=1
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI21_24(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_25(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	(%rsp), %xmm1, %xmm2            # 8-byte Folded Reload
	vmovsd	.LCPI21_26(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vaddsd	.LCPI21_0(%rip), %xmm2, %xmm2
	decl	%ebp
	jne	.LBB21_237
# %bb.238:
	rdtsc
	movq	%rdx, %rbp
	shlq	$32, %rbp
	orq	%rax, %rbp
	vucomisd	.LCPI21_1(%rip), %xmm1
	jne	.LBB21_240
# %bb.239:
	vmovsd	.LCPI21_1(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
.LBB21_240:
	subq	%rbx, %rbp
	leaq	5000000(%rbp), %rax
	imulq	%r14
	leaq	(%rdx,%rbp), %rsi
	addq	$5000000, %rsi                  # imm = 0x4C4B40
	movq	%rsi, %rax
	shrq	$63, %rax
	shrq	$23, %rsi
	addl	%eax, %esi
	movl	$.L.str.2, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movl	$.L.str.19, %edi
	movl	$_Z5Basicdd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.20, %edi
	movl	$_Z6Betterdd, %esi
	vmovsd	152(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	192(%rsp), %xmm1                # 16-byte Reload
	addq	$1016, %rsp                     # imm = 0x3F8
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	_Z6DoTestPKcPFdddEdd            # TAILCALL
.Lfunc_end21:
	.size	_Z7TestAlldd, .Lfunc_end21-_Z7TestAlldd
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI22_0:
	.quad	0x4008000000000000              # double 3
.LCPI22_1:
	.quad	0x3ff0000000000000              # double 1
.LCPI22_2:
	.quad	0x3fe243f6a8885a30              # double 0.57079632679489656
.LCPI22_3:
	.quad	0x3ff92074ecd6088d              # double 1.5704240085038095
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	vmovsd	.LCPI22_0(%rip), %xmm0          # xmm0 = mem[0],zero
	movl	$.L.str.21, %edi
	movb	$1, %al
	callq	printf
	vmovsd	.LCPI22_1(%rip), %xmm0          # xmm0 = mem[0],zero
	vmovsd	.LCPI22_2(%rip), %xmm1          # xmm1 = mem[0],zero
	vmovsd	.LCPI22_3(%rip), %xmm2          # xmm2 = mem[0],zero
	movl	$.L.str.22, %edi
	movb	$3, %al
	callq	printf
	movl	$.Lstr, %edi
	callq	puts@PLT
	movl	$10, %edi
	callq	putchar@PLT
	vmovsd	.LCPI22_1(%rip), %xmm0          # xmm0 = mem[0],zero
	vmovsd	.LCPI22_2(%rip), %xmm1          # xmm1 = mem[0],zero
	callq	_Z7TestAlldd
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end22:
	.size	main, .Lfunc_end22-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"y %g"
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%-8s ( %g, %g ) = %20.14g  t = "
	.size	.L.str.1, 32

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\t%i"
	.size	.L.str.2, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"cbrt"
	.size	.L.str.4, 5

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"cbrt3"
	.size	.L.str.5, 6

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"sqrt"
	.size	.L.str.6, 5

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"exp"
	.size	.L.str.7, 4

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"log"
	.size	.L.str.8, 4

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"cos"
	.size	.L.str.9, 4

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"sin"
	.size	.L.str.10, 4

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"tan"
	.size	.L.str.11, 4

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"S3"
	.size	.L.str.12, 3

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"S9"
	.size	.L.str.13, 3

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"S9s2"
	.size	.L.str.14, 5

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"S9t2"
	.size	.L.str.15, 5

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"S9t2p54"
	.size	.L.str.16, 8

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"Cubic"
	.size	.L.str.17, 6

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"Pade"
	.size	.L.str.18, 5

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"Basic"
	.size	.L.str.19, 6

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"Better"
	.size	.L.str.20, 7

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"cuberoot of 27.0 is  %g\n"
	.size	.L.str.21, 25

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"f(e= %g, M = %g ) = %g\n"
	.size	.L.str.22, 24

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"Needs to settle down before timer is reliable\nSacrificial readings for Basic "
	.size	.Lstr, 78

	.ident	"clang version 15.0.7 (Fedora 15.0.7-2.fc37)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z8BM_cbrt3dd
	.addrsig_sym _Z5Basicdd
	.addrsig_sym _Z6Betterdd
	.addrsig_sym _Z10Gooding_S9dd
	.addrsig_sym _Z12Gooding_S9s2dd
	.addrsig_sym _Z4S9t2dd
	.addrsig_sym _Z7S9t2p54dd
