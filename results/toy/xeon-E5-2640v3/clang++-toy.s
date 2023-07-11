	.text
	.file	"TOY_ks.cpp"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _Z9Ref_cbrt3d
.LCPI0_0:
	.quad	0x3fd5555555555555              # double 0.33333333333333331
.LCPI0_1:
	.quad	0x4000000000000000              # double 2
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
	vfmadd231sd	.LCPI0_1(%rip), %xmm1, %xmm3 # xmm3 = (xmm1 * mem) + xmm3
	vdivsd	%xmm3, %xmm2, %xmm1
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
.LCPI2_1:
	.quad	0x4000000000000000              # double 2
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
	vfmadd231sd	.LCPI2_1(%rip), %xmm1, %xmm3 # xmm3 = (xmm1 * mem) + xmm3
	vdivsd	%xmm3, %xmm2, %xmm1
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
	.quad	0x4000000000000000              # double 2
.LCPI9_5:
	.quad	0x4008000000000000              # double 3
.LCPI9_6:
	.quad	0x4000c152382d7365              # double 2.0943951023931953
.LCPI9_7:
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
	vfmadd231sd	%xmm0, %xmm4, %xmm2     # xmm2 = (xmm4 * xmm0) + xmm2
	vfmsub231sd	%xmm3, %xmm1, %xmm2     # xmm2 = (xmm1 * xmm3) - xmm2
	vmulsd	%xmm2, %xmm2, %xmm0
	vmulsd	%xmm5, %xmm5, %xmm3
	vfmadd213sd	%xmm0, %xmm5, %xmm3     # xmm3 = (xmm5 * xmm3) + xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vucomisd	%xmm1, %xmm3
	jae	.LBB9_1
# %bb.14:
	vmovapd	.LCPI9_0(%rip), %xmm0           # xmm0 = [-0.0E+0,-0.0E+0]
	vxorpd	%xmm0, %xmm5, %xmm1
	vsqrtsd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vxorpd	%xmm0, %xmm2, %xmm0
	vmulsd	%xmm5, %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	callq	acos
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	vaddsd	.LCPI9_6(%rip), %xmm0, %xmm1
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vcmpltsd	.LCPI9_7(%rip), %xmm2, %xmm2
	vblendvpd	%xmm2, %xmm1, %xmm0, %xmm0
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm1, %xmm1
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	callq	cos@PLT
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vfmsub213sd	32(%rsp), %xmm1, %xmm0  # 16-byte Folded Reload
                                        # xmm0 = (xmm1 * xmm0) - mem
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB9_1:
	.cfi_def_cfa_offset 64
	vmulsd	.LCPI9_2(%rip), %xmm3, %xmm1
	vucomisd	%xmm1, %xmm0
	jae	.LBB9_5
# %bb.2:
	vaddsd	%xmm2, %xmm2, %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm3
	vmovapd	%xmm3, %xmm0
	je	.LBB9_4
# %bb.3:
	vmovapd	%xmm3, %xmm0
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovsd	%xmm3, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm1, 16(%rsp)                 # 8-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovsd	(%rsp), %xmm3                   # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vfmadd132sd	.LCPI9_4(%rip), %xmm3, %xmm1 # xmm1 = (xmm1 * mem) + xmm3
	vdivsd	%xmm1, %xmm2, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
.LBB9_4:
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	.LCPI9_5(%rip), %xmm3, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vsubsd	%xmm4, %xmm0, %xmm0
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB9_5:
	.cfi_def_cfa_offset 64
	vsqrtsd	%xmm3, %xmm3, %xmm1
	vxorpd	%xmm3, %xmm3, %xmm3
	vucomisd	%xmm3, %xmm2
	jbe	.LBB9_8
# %bb.6:
	vaddsd	%xmm2, %xmm1, %xmm0
	vucomisd	%xmm3, %xmm0
	je	.LBB9_11
# %bb.7:
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, (%rsp)                   # 16-byte Spill
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovapd	(%rsp), %xmm5                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vfmadd231sd	.LCPI9_4(%rip), %xmm1, %xmm3 # xmm3 = (xmm1 * mem) + xmm3
	vdivsd	%xmm3, %xmm2, %xmm1
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
	vsubsd	%xmm2, %xmm1, %xmm0
	vucomisd	%xmm3, %xmm0
	je	.LBB9_10
# %bb.9:
	vmovapd	%xmm0, 16(%rsp)                 # 16-byte Spill
	vmovapd	%xmm4, 32(%rsp)                 # 16-byte Spill
	vmovapd	%xmm5, (%rsp)                   # 16-byte Spill
	callq	log@PLT
	vmulsd	.LCPI9_3(%rip), %xmm0, %xmm0
	callq	exp@PLT
	vmovapd	(%rsp), %xmm5                   # 16-byte Reload
	vmovapd	32(%rsp), %xmm4                 # 16-byte Reload
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vmovapd	16(%rsp), %xmm3                 # 16-byte Reload
	vsubsd	%xmm1, %xmm3, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vfmadd231sd	.LCPI9_4(%rip), %xmm1, %xmm3 # xmm3 = (xmm1 * mem) + xmm3
	vdivsd	%xmm3, %xmm2, %xmm1
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
	vmovsd	.LCPI10_0(%rip), %xmm3          # xmm3 = mem[0],zero
	vfnmadd213sd	%xmm3, %xmm0, %xmm3     # xmm3 = -(xmm0 * xmm3) + xmm3
	vmulsd	.LCPI10_1(%rip), %xmm1, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%xmm3, %xmm1
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
	vmovsd	.LCPI11_0(%rip), %xmm2          # xmm2 = mem[0],zero
	vfmadd213sd	.LCPI11_1(%rip), %xmm0, %xmm2 # xmm2 = (xmm0 * xmm2) + mem
	vmovsd	.LCPI11_2(%rip), %xmm3          # xmm3 = mem[0],zero
	vxorpd	.LCPI11_3(%rip), %xmm1, %xmm4
	vdivsd	%xmm2, %xmm3, %xmm2
	vmulsd	%xmm4, %xmm2, %xmm4
	vmovsd	.LCPI11_4(%rip), %xmm3          # xmm3 = mem[0],zero
	vfnmadd213sd	%xmm3, %xmm0, %xmm3     # xmm3 = -(xmm0 * xmm3) + xmm3
	vmulsd	%xmm3, %xmm2, %xmm3
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
.LCPI12_11:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI12_12:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI12_13:
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
	.quad	0x4008000000000000              # double 3
.LCPI12_5:
	.quad	0x401c000000000000              # double 7
.LCPI12_6:
	.quad	0xc04e000000000000              # double -60
.LCPI12_7:
	.quad	0x4341c37937e08000              # double 1.0E+16
.LCPI12_8:
	.quad	0xc034000000000000              # double -20
.LCPI12_9:
	.quad	0x4034000000000000              # double 20
.LCPI12_10:
	.quad	0xc03e000000000000              # double -30
.LCPI12_14:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	vxorpd	.LCPI12_0(%rip), %xmm0, %xmm1
	vminsd	%xmm1, %xmm0, %xmm2
	vaddsd	.LCPI12_1(%rip), %xmm2, %xmm2
	vmovsd	%xmm2, 48(%rsp)                 # 8-byte Spill
	vmaxsd	%xmm0, %xmm1, %xmm0
	vmovsd	%xmm0, 32(%rsp)                 # 8-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm1
	vmovsd	%xmm1, 40(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI12_2(%rip), %xmm3, %xmm0
	vmovapd	%xmm3, (%rsp)                   # 16-byte Spill
	callq	sin@PLT
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	vmovapd	(%rsp), %xmm0                   # 16-byte Reload
	callq	sin@PLT
	vmovsd	24(%rsp), %xmm7                 # 8-byte Reload
                                        # xmm7 = mem[0],zero
	vmovsd	40(%rsp), %xmm6                 # 8-byte Reload
                                        # xmm6 = mem[0],zero
	vmovsd	32(%rsp), %xmm5                 # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vmovsd	48(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	.LCPI12_3(%rip), %xmm4, %xmm2
	vmovsd	.LCPI12_4(%rip), %xmm1          # xmm1 = mem[0],zero
	vmovsd	.LCPI12_5(%rip), %xmm3          # xmm3 = mem[0],zero
	vfmadd213sd	%xmm1, %xmm5, %xmm3     # xmm3 = (xmm5 * xmm3) + xmm1
	vfmadd213sd	%xmm2, %xmm6, %xmm3     # xmm3 = (xmm6 * xmm3) + xmm2
	vfmsub213sd	.LCPI12_6(%rip), %xmm6, %xmm1 # xmm1 = (xmm6 * xmm1) - mem
	vfnmadd213sd	%xmm3, %xmm7, %xmm1     # xmm1 = -(xmm7 * xmm1) + xmm3
	vucomisd	.LCPI12_14(%rip), %xmm1
	jne	.LBB12_3
# %bb.2:
	vmovsd	.LCPI12_7(%rip), %xmm1          # xmm1 = mem[0],zero
	jmp	.LBB12_4
.LBB12_3:
	vmovsd	.LCPI12_1(%rip), %xmm2          # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
.LBB12_4:
	vmovsd	.LCPI12_8(%rip), %xmm2          # xmm2 = mem[0],zero
	vsubsd	%xmm6, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm3
	vfmadd213sd	%xmm4, %xmm7, %xmm5     # xmm5 = (xmm7 * xmm5) + xmm4
	vmulsd	.LCPI12_9(%rip), %xmm5, %xmm4
	vmulsd	%xmm2, %xmm3, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	.LCPI12_10(%rip), %xmm3, %xmm2
	callq	_Z13SolveCubicOptddd
	vmulsd	(%rsp), %xmm0, %xmm1            # 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovapd	.LCPI12_11(%rip), %xmm2         # xmm2 = [1.0E+0,1.0E+0]
	vblendvpd	%xmm1, .LCPI12_12(%rip), %xmm2, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm0
	callq	atan2
	vmovapd	(%rsp), %xmm3                   # 16-byte Reload
	vmovapd	.LCPI12_13(%rip), %xmm1         # xmm1 = [NaN,NaN]
	vandpd	%xmm1, %xmm0, %xmm2
	vandpd	%xmm1, %xmm3, %xmm1
	vcmpltsd	%xmm1, %xmm2, %xmm1
	vblendvpd	%xmm1, %xmm3, %xmm0, %xmm3
	addq	$56, %rsp
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
	.quad	0xc04e000000000000              # double -60
.LCPI13_6:
	.quad	0x3ff0000000000000              # double 1
.LCPI13_7:
	.quad	0xbfd5555555555555              # double -0.33333333333333331
.LCPI13_8:
	.quad	0x4034000000000000              # double 20
.LCPI13_9:
	.quad	0xc03e000000000000              # double -30
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI13_10:
	.quad	0x8000000000000000              # double -0
	.quad	0x8000000000000000              # double -0
.LCPI13_11:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI13_12:
	.quad	0xbff0000000000000              # double -1
	.quad	0xbff0000000000000              # double -1
.LCPI13_13:
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
	vmovaps	%xmm1, 48(%rsp)                 # 16-byte Spill
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
	vmulsd	%xmm0, %xmm0, %xmm2
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	.LCPI13_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vmovsd	.LCPI13_1(%rip), %xmm3          # xmm3 = mem[0],zero
	vfmsub231sd	%xmm0, %xmm2, %xmm3     # xmm3 = (xmm2 * xmm0) - xmm3
	vmovsd	%xmm3, 16(%rsp)                 # 8-byte Spill
	vfmadd231sd	.LCPI13_2(%rip), %xmm2, %xmm0 # xmm0 = (xmm2 * mem) + xmm0
	vfmadd213sd	.LCPI13_3(%rip), %xmm2, %xmm0 # xmm0 = (xmm2 * xmm0) + mem
	vfmadd213sd	.LCPI13_4(%rip), %xmm2, %xmm0 # xmm0 = (xmm2 * xmm0) + mem
	vmovsd	%xmm0, 8(%rsp)                  # 8-byte Spill
	leaq	40(%rsp), %rdi
	leaq	32(%rsp), %rsi
	vmovaps	%xmm1, %xmm0
	callq	sincos@PLT
	vmovsd	32(%rsp), %xmm0                 # xmm0 = mem[0],zero
	vmovsd	16(%rsp), %xmm1                 # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vfnmadd213sd	.LCPI13_5(%rip), %xmm2, %xmm1 # xmm1 = -(xmm2 * xmm1) + mem
	vmovsd	24(%rsp), %xmm4                 # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	%xmm4, %xmm1, %xmm1
	vmovsd	8(%rsp), %xmm5                  # 8-byte Reload
                                        # xmm5 = mem[0],zero
	vfmadd231sd	%xmm0, %xmm5, %xmm1     # xmm1 = (xmm5 * xmm0) + xmm1
	vmovsd	.LCPI13_6(%rip), %xmm2          # xmm2 = mem[0],zero
	vdivsd	%xmm1, %xmm2, %xmm1
	vmulsd	40(%rsp), %xmm1, %xmm2
	vmulsd	.LCPI13_7(%rip), %xmm2, %xmm3
	vsubsd	%xmm4, %xmm0, %xmm0
	vmulsd	.LCPI13_8(%rip), %xmm0, %xmm4
	vmulsd	%xmm5, %xmm3, %xmm0
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	.LCPI13_9(%rip), %xmm2, %xmm2
	callq	_Z13SolveCubicOptddd
	vmulsd	48(%rsp), %xmm0, %xmm1          # 16-byte Folded Reload
	vxorpd	%xmm2, %xmm2, %xmm2
	vucomisd	%xmm2, %xmm1
	jae	.LBB13_2
# %bb.1:
	vxorpd	.LCPI13_10(%rip), %xmm0, %xmm0
.LBB13_2:
	vcmpltsd	%xmm2, %xmm1, %xmm1
	vmovapd	.LCPI13_11(%rip), %xmm2         # xmm2 = [1.0E+0,1.0E+0]
	vblendvpd	%xmm1, .LCPI13_12(%rip), %xmm2, %xmm1
	callq	atan2
	vmovapd	.LCPI13_13(%rip), %xmm1         # xmm1 = [NaN,NaN]
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
	vmovsd	8(%rsp), %xmm2                  # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmulsd	32(%rsp), %xmm2, %xmm1
	vmovsd	24(%rsp), %xmm0                 # xmm0 = mem[0],zero
	vfmadd213sd	.LCPI14_0(%rip), %xmm2, %xmm0 # xmm0 = (xmm2 * xmm0) + mem
	vfmadd213sd	16(%rsp), %xmm1, %xmm0  # 8-byte Folded Reload
                                        # xmm0 = (xmm1 * xmm0) + mem
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
	vfmadd213sd	%xmm1, %xmm2, %xmm3     # xmm3 = (xmm2 * xmm3) + xmm1
	vsqrtsd	%xmm3, %xmm3, %xmm1
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
	vmovsd	%xmm3, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI16_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, (%rsp)                   # 8-byte Spill
	vmovsd	%xmm2, 8(%rsp)                  # 8-byte Spill
	callq	sin@PLT
	vaddsd	%xmm0, %xmm0, %xmm1
	vmovsd	8(%rsp), %xmm4                  # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vmulsd	%xmm1, %xmm4, %xmm1
	vmulsd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI16_0(%rip), %xmm2          # xmm2 = mem[0],zero
	vsubsd	%xmm0, %xmm2, %xmm2
	vmovsd	16(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vmulsd	.LCPI16_2(%rip), %xmm4, %xmm4
	vfmadd213sd	%xmm3, %xmm0, %xmm4     # xmm4 = (xmm0 * xmm4) + xmm3
	vdivsd	%xmm4, %xmm2, %xmm0
	vsqrtsd	%xmm0, %xmm0, %xmm0
	vmovsd	(%rsp), %xmm2                   # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vfmadd231sd	%xmm0, %xmm1, %xmm2     # xmm2 = (xmm1 * xmm0) + xmm2
	vmovsd	%xmm2, (%rsp)                   # 8-byte Spill
	vmovsd	(%rsp), %xmm1                   # 8-byte Reload
                                        # xmm1 = mem[0],zero
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	vmovaps	%xmm1, %xmm0
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
	vmovsd	.LCPI17_0(%rip), %xmm0          # xmm0 = mem[0],zero
	vaddsd	%xmm0, %xmm2, %xmm3
	vmovsd	%xmm3, 24(%rsp)                 # 8-byte Spill
	vsubsd	%xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%rsp)                 # 8-byte Spill
	vmulsd	.LCPI17_1(%rip), %xmm1, %xmm0
	vmovsd	%xmm1, 32(%rsp)                 # 8-byte Spill
	vmovsd	%xmm2, 8(%rsp)                  # 8-byte Spill
	callq	tan
	vmulsd	%xmm0, %xmm0, %xmm1
	vaddsd	%xmm0, %xmm0, %xmm0
	vmulsd	8(%rsp), %xmm0, %xmm0           # 8-byte Folded Reload
	vmovsd	16(%rsp), %xmm2                 # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmulsd	%xmm2, %xmm2, %xmm2
	vmovsd	24(%rsp), %xmm3                 # 8-byte Reload
                                        # xmm3 = mem[0],zero
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd213sd	%xmm2, %xmm1, %xmm3     # xmm3 = (xmm1 * xmm3) + xmm2
	vfmadd213sd	%xmm3, %xmm1, %xmm3     # xmm3 = (xmm1 * xmm3) + xmm3
	vsqrtsd	%xmm3, %xmm3, %xmm1
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
	vaddsd	%xmm3, %xmm0, %xmm3
	vmulsd	.LCPI18_1(%rip), %xmm1, %xmm5
	vucomisd	.LCPI18_2(%rip), %xmm1
	jae	.LBB18_3
# %bb.2:
	vmulsd	%xmm5, %xmm5, %xmm6
	vmovsd	.LCPI18_3(%rip), %xmm4          # xmm4 = mem[0],zero
	vfmadd213sd	.LCPI18_4(%rip), %xmm6, %xmm4 # xmm4 = (xmm6 * xmm4) + mem
	vmovsd	.LCPI18_5(%rip), %xmm8          # xmm8 = mem[0],zero
	vfmadd213sd	%xmm8, %xmm6, %xmm4     # xmm4 = (xmm6 * xmm4) + xmm8
	vaddsd	.LCPI18_6(%rip), %xmm6, %xmm7
	vfmadd213sd	%xmm8, %xmm6, %xmm7     # xmm7 = (xmm6 * xmm7) + xmm8
	vmulsd	%xmm5, %xmm7, %xmm5
	jmp	.LBB18_4
.LBB18_3:
	vmovsd	.LCPI18_2(%rip), %xmm4          # xmm4 = mem[0],zero
	vsubsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm4, %xmm4, %xmm6
	vmovsd	.LCPI18_3(%rip), %xmm5          # xmm5 = mem[0],zero
	vfmadd213sd	.LCPI18_4(%rip), %xmm6, %xmm5 # xmm5 = (xmm6 * xmm5) + mem
	vmovsd	.LCPI18_5(%rip), %xmm8          # xmm8 = mem[0],zero
	vfmadd213sd	%xmm8, %xmm6, %xmm5     # xmm5 = (xmm6 * xmm5) + xmm8
	vaddsd	.LCPI18_6(%rip), %xmm6, %xmm7
	vfmadd213sd	%xmm8, %xmm6, %xmm7     # xmm7 = (xmm6 * xmm7) + xmm8
	vmulsd	%xmm4, %xmm7, %xmm4
.LBB18_4:
	vmulsd	%xmm2, %xmm4, %xmm2
	vmulsd	%xmm3, %xmm5, %xmm3
	vaddsd	%xmm5, %xmm5, %xmm6
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm5, %xmm5
	vfmadd231sd	%xmm4, %xmm4, %xmm5     # xmm5 = (xmm4 * xmm4) + xmm5
	vmulsd	%xmm3, %xmm3, %xmm3
	vfmadd231sd	%xmm2, %xmm2, %xmm3     # xmm3 = (xmm2 * xmm2) + xmm3
	vmulsd	%xmm5, %xmm3, %xmm2
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
	rdtsc
	movq	%rdx, %r14
	movq	%rdi, %rbx
	vmovsd	%xmm0, 24(%rsp)                 # 8-byte Spill
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
.LCPI21_3:
	.quad	0x3eb515370f99f6cb              # double 1.2566370614359173E-6
.LCPI21_4:
	.quad	0x3ec515370f99f6cb              # double 2.5132741228718346E-6
.LCPI21_5:
	.quad	0x3ecf9fd29766f230              # double 3.7699111843077517E-6
.LCPI21_6:
	.quad	0x3ed515370f99f6cb              # double 5.0265482457436692E-6
.LCPI21_7:
	.quad	0x2b617f7d4ed8c33e              # double 1.0E-99
.LCPI21_8:
	.quad	0x3ff0000000000000              # double 1
.LCPI21_9:
	.quad	0x3feb333333333333              # double 0.84999999999999998
.LCPI21_10:
	.quad	0x4000000000000000              # double 2
.LCPI21_11:
	.quad	0xc008000000000000              # double -3
.LCPI21_12:
	.quad	0x3fd3333333333334              # double 0.30000000000000004
.LCPI21_13:
	.quad	0x401c000000000000              # double 7
.LCPI21_14:
	.quad	0x4008000000000000              # double 3
.LCPI21_16:
	.quad	0x4034000000000000              # double 20
.LCPI21_17:
	.quad	0xc03e000000000000              # double -30
.LCPI21_18:
	.quad	0xbfbc9a75461405b9              # double -0.111731843575419
.LCPI21_19:
	.quad	0xc00ad0cdf1b2c55d              # double -3.3519553072625698
.LCPI21_20:
	.quad	0x3fd573d7f48f044b              # double 0.33519553072625702
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI21_2:
	.quad	0x0000000000000000              # double 0
	.quad	0x3e9515370f99f6cb              # double 3.1415926535897932E-7
	.quad	0x3ea515370f99f6cb              # double 6.2831853071795864E-7
	.quad	0x3eaf9fd29766f230              # double 9.4247779607693791E-7
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI21_15:
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
	subq	$2200, %rsp                     # imm = 0x898
	.cfi_def_cfa_offset 2256
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	vmovapd	%xmm1, 464(%rsp)                # 16-byte Spill
	vmovsd	%xmm0, 360(%rsp)                # 8-byte Spill
	vmovapd	%xmm1, %xmm0
	callq	cbrt
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.4, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
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
	vmovsd	%xmm0, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	callq	cbrt
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovsd	400(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	400(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	400(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	400(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	400(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 400(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 320(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	cbrt
	vmovsd	400(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
	vsqrtsd	%xmm1, %xmm1, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.6, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
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
	vbroadcastsd	.LCPI21_3(%rip), %ymm9  # ymm9 = [1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6,1.2566370614359173E-6]
	vbroadcastsd	.LCPI21_4(%rip), %ymm10 # ymm10 = [2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6,2.5132741228718346E-6]
	vbroadcastsd	.LCPI21_5(%rip), %ymm11 # ymm11 = [3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6,3.7699111843077517E-6]
	vbroadcastsd	.LCPI21_6(%rip), %ymm12 # ymm12 = [5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6,5.0265482457436692E-6]
	vxorpd	%xmm2, %xmm2, %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vxorpd	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB21_25:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
	vaddpd	%ymm1, %ymm12, %ymm1
	addl	$-16, %eax
	jne	.LBB21_25
# %bb.26:
	vmovupd	%ymm12, 576(%rsp)               # 32-byte Spill
	vmovupd	%ymm11, 608(%rsp)               # 32-byte Spill
	vmovupd	%ymm10, 400(%rsp)               # 32-byte Spill
	vmovupd	%ymm9, 320(%rsp)                # 32-byte Spill
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
	vmovupd	320(%rsp), %ymm9                # 32-byte Reload
	vmovupd	400(%rsp), %ymm10               # 32-byte Reload
	vmovupd	608(%rsp), %ymm11               # 32-byte Reload
	vmovupd	576(%rsp), %ymm12               # 32-byte Reload
	.p2align	4, 0x90
.LBB21_29:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
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
	vmovupd	320(%rsp), %ymm9                # 32-byte Reload
	vmovupd	400(%rsp), %ymm10               # 32-byte Reload
	vmovupd	608(%rsp), %ymm11               # 32-byte Reload
	vmovupd	576(%rsp), %ymm12               # 32-byte Reload
	.p2align	4, 0x90
.LBB21_33:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
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
	vmovupd	320(%rsp), %ymm9                # 32-byte Reload
	vmovupd	400(%rsp), %ymm10               # 32-byte Reload
	vmovupd	608(%rsp), %ymm11               # 32-byte Reload
	vmovupd	576(%rsp), %ymm12               # 32-byte Reload
	.p2align	4, 0x90
.LBB21_37:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
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
	vmovupd	320(%rsp), %ymm9                # 32-byte Reload
	vmovupd	400(%rsp), %ymm10               # 32-byte Reload
	vmovupd	608(%rsp), %ymm11               # 32-byte Reload
	vmovupd	576(%rsp), %ymm12               # 32-byte Reload
	.p2align	4, 0x90
.LBB21_41:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
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
	vmovupd	320(%rsp), %ymm9                # 32-byte Reload
	vmovupd	400(%rsp), %ymm10               # 32-byte Reload
	vmovupd	608(%rsp), %ymm11               # 32-byte Reload
	vmovupd	576(%rsp), %ymm12               # 32-byte Reload
	.p2align	4, 0x90
.LBB21_45:                              # =>This Inner Loop Header: Depth=1
	vaddpd	%ymm1, %ymm9, %ymm5
	vaddpd	%ymm1, %ymm10, %ymm6
	vsqrtpd	%ymm1, %ymm7
	vaddpd	%ymm1, %ymm11, %ymm8
	vsqrtpd	%ymm5, %ymm5
	vaddpd	%ymm7, %ymm0, %ymm0
	vsqrtpd	%ymm6, %ymm6
	vaddpd	%ymm5, %ymm2, %ymm2
	vsqrtpd	%ymm8, %ymm5
	vaddpd	%ymm6, %ymm3, %ymm3
	vaddpd	%ymm5, %ymm4, %ymm4
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
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	callq	exp@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.7, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_49:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_49
# %bb.50:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_53:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_53
# %bb.54:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_57:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_57
# %bb.58:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_61:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_61
# %bb.62:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_65:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_65
# %bb.66:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_69:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	exp@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	exp@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_69
# %bb.70:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	vaddsd	.LCPI21_7(%rip), %xmm0, %xmm0
	callq	log@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.8, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vbroadcastsd	.LCPI21_7(%rip), %ymm1  # ymm1 = [1.0E-99,1.0E-99,1.0E-99,1.0E-99]
	vmovupd	%ymm1, 288(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_73:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_73
# %bb.74:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_77:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_77
# %bb.78:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_81:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_81
# %bb.82:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_85:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_85
# %bb.86:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_89:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_89
# %bb.90:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_93:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm0, 32(%rsp)                 # 32-byte Spill
	vaddpd	288(%rsp), %ymm0, %ymm2         # 32-byte Folded Reload
	vmovupd	%ymm2, 128(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm2, %xmm0
	vmovapd	%xmm0, 480(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 480(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 224(%rsp)                # 16-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	480(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 224(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 224(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 128(%rsp)                # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	224(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 128(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 128(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	128(%rsp), %xmm1                # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	log@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	log@PLT
	vmovupd	96(%rsp), %ymm1                 # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm1, %ymm0, %ymm1
	vmovupd	32(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_93
# %bb.94:
	vmovupd	256(%rsp), %ymm0                # 32-byte Reload
	vaddpd	160(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	368(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	callq	cos@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.9, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
	vmovsd	%xmm2, 224(%rsp)                # 8-byte Spill
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_97:                              # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_97
# %bb.98:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_101:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_101
# %bb.102:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_105:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_105
# %bb.106:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_109:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_109
# %bb.110:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_113:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_113
# %bb.114:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_117:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	cos@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	cos@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_117
# %bb.118:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	callq	sin@PLT
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.10, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
	vmovsd	%xmm2, 480(%rsp)                # 8-byte Spill
	movb	$3, %al
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_121:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_121
# %bb.122:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_125:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_125
# %bb.126:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_129:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_129
# %bb.130:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_133:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_133
# %bb.134:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_137:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_137
# %bb.138:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	rdtsc
	movq	%rdx, %rbx
	shlq	$32, %rbx
	orq	%rax, %rbx
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovupd	%ymm0, 128(%rsp)                # 32-byte Spill
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %ebp                 # imm = 0x989680
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB21_141:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm1, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 288(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, (%rsp)                   # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 64(%rsp)                 # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vextractf128	$1, %ymm0, %xmm0
	vmovapd	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	288(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 288(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	128(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 96(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 32(%rsp)                 # 16-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 96(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	96(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, 32(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	160(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 32(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	(%rsp), %xmm1                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, (%rsp)                   # 16-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 32(%rsp)                 # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	32(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vinsertf128	$1, (%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vmovupd	256(%rsp), %ymm1                # 32-byte Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	%ymm1, 256(%rsp)                # 32-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, 64(%rsp)                 # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovapd	64(%rsp), %xmm1                 # 16-byte Reload
	vunpcklpd	%xmm0, %xmm1, %xmm0     # xmm0 = xmm1[0],xmm0[0]
	vmovapd	%xmm0, 64(%rsp)                 # 16-byte Spill
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	vzeroupper
	callq	sin@PLT
	vmovaps	%xmm0, (%rsp)                   # 16-byte Spill
	vpermilpd	$1, 192(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	callq	sin@PLT
	vmovupd	368(%rsp), %ymm1                # 32-byte Reload
	vmovapd	(%rsp), %xmm2                   # 16-byte Reload
	vunpcklpd	%xmm0, %xmm2, %xmm0     # xmm0 = xmm2[0],xmm0[0]
	vinsertf128	$1, 64(%rsp), %ymm0, %ymm0 # 16-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm1
	vmovupd	288(%rsp), %ymm0                # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %ebp
	jne	.LBB21_141
# %bb.142:
	vmovupd	160(%rsp), %ymm0                # 32-byte Reload
	vaddpd	128(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	256(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vaddpd	%ymm0, %ymm1, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
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
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	callq	tan
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.11, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 192(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 288(%rsp)                # 8-byte Spill
	vmovapd	%xmm2, %xmm0
	callq	tan
	vmovsd	192(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	288(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmulsd	480(%rsp), %xmm0, %xmm3         # 8-byte Folded Reload
	vmovsd	224(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vfmadd213sd	.LCPI21_8(%rip), %xmm0, %xmm2 # xmm2 = (xmm0 * xmm2) + mem
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
	vfmadd213sd	%xmm1, %xmm3, %xmm2     # xmm2 = (xmm3 * xmm2) + xmm1
	movl	$.L.str.1, %edi
	movl	$.L.str.12, %esi
	movb	$3, %al
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vbroadcastsd	.LCPI21_9(%rip), %ymm1  # ymm1 = [8.4999999999999998E-1,8.4999999999999998E-1,8.4999999999999998E-1,8.4999999999999998E-1]
	vmovups	%ymm1, 288(%rsp)                # 32-byte Spill
	vbroadcastsd	.LCPI21_8(%rip), %ymm1  # ymm1 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovupd	%ymm1, 192(%rsp)                # 32-byte Spill
	vxorpd	%xmm7, %xmm7, %xmm7
	vxorpd	%xmm8, %xmm8, %xmm8
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	1960(%rsp), %rbx
	leaq	1984(%rsp), %rbp
	leaq	1976(%rsp), %r14
	leaq	2000(%rsp), %r15
	leaq	1992(%rsp), %r12
	.p2align	4, 0x90
.LBB21_169:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm8, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm7, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	2144(%rsp), %rdi
	leaq	2136(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2144(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2160(%rsp), %rdi
	leaq	2152(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2160(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	2176(%rsp), %rdi
	leaq	2168(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2176(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2192(%rsp), %rdi
	leaq	2184(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2192(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	2080(%rsp), %rdi
	leaq	2072(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2080(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2096(%rsp), %rdi
	leaq	2088(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2096(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	2112(%rsp), %rdi
	leaq	2104(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2112(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2128(%rsp), %rdi
	leaq	2120(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2128(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	2016(%rsp), %rdi
	leaq	2008(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2016(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2032(%rsp), %rdi
	leaq	2024(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2032(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	2048(%rsp), %rdi
	leaq	2040(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	2048(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	2064(%rsp), %rdi
	leaq	2056(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	2064(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1952(%rsp), %rdi
	leaq	1944(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1952(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1968(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1968(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1984(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm8                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm7                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm5                # 32-byte Reload
	vmulpd	480(%rsp), %ymm5, %ymm0         # 32-byte Folded Reload
	vmovsd	2136(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	2152(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmovsd	2168(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	2184(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	2072(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	2088(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm6                # 32-byte Reload
	vfmadd213pd	%ymm6, %ymm5, %ymm1     # ymm1 = (ymm5 * ymm1) + ymm6
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	2104(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	2120(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm7, %ymm7         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm5, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm6, %ymm5, %ymm0     # ymm0 = (ymm5 * ymm0) + ymm6
	vfmadd231pd	%ymm0, %ymm1, %ymm7     # ymm7 = (ymm1 * ymm0) + ymm7
	vmovsd	2008(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	2024(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovsd	2040(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	2056(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	2000(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm5, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm8, %ymm8         # 32-byte Folded Reload
	vmovsd	1944(%rsp), %xmm3               # xmm3 = mem[0],zero
	vmovhpd	1960(%rsp), %xmm3, %xmm3        # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm6, %ymm5, %ymm0     # ymm0 = (ymm5 * ymm0) + ymm6
	vfmadd231pd	%ymm0, %ymm2, %ymm8     # ymm8 = (ymm2 * ymm0) + ymm8
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	1976(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1992(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm5, %ymm1, %ymm1
	vfmadd213pd	%ymm6, %ymm5, %ymm0     # ymm0 = (ymm5 * ymm0) + ymm6
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_169
# %bb.170:
	vaddpd	%ymm4, %ymm7, %ymm0
	vaddpd	%ymm0, %ymm8, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_172:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	1704(%rsp), %rbx
	leaq	1728(%rsp), %rbp
	leaq	1720(%rsp), %r14
	leaq	1744(%rsp), %r15
	leaq	1736(%rsp), %r12
	.p2align	4, 0x90
.LBB21_173:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm6, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm5, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1888(%rsp), %rdi
	leaq	1880(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1888(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1904(%rsp), %rdi
	leaq	1896(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1904(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	1920(%rsp), %rdi
	leaq	1912(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1920(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1936(%rsp), %rdi
	leaq	1928(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1936(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1824(%rsp), %rdi
	leaq	1816(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1824(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1840(%rsp), %rdi
	leaq	1832(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1840(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	1856(%rsp), %rdi
	leaq	1848(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1856(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1872(%rsp), %rdi
	leaq	1864(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1872(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1760(%rsp), %rdi
	leaq	1752(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1760(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1776(%rsp), %rdi
	leaq	1768(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1776(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	1792(%rsp), %rdi
	leaq	1784(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1792(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1808(%rsp), %rdi
	leaq	1800(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1808(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1696(%rsp), %rdi
	leaq	1688(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1696(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1712(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1712(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1728(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm6                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm5                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm7                # 32-byte Reload
	vmulpd	480(%rsp), %ymm7, %ymm0         # 32-byte Folded Reload
	vmovsd	1880(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1896(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmovsd	1912(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1928(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	1816(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1832(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm8                # 32-byte Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm1) + ymm8
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	1848(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1864(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm7, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm0) + ymm5
	vmovsd	1752(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1768(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovsd	1784(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1800(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	1744(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm7, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmovsd	1688(%rsp), %xmm3               # xmm3 = mem[0],zero
	vmovhpd	1704(%rsp), %xmm3, %xmm3        # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm0) + ymm6
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	1720(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1736(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm7, %ymm1, %ymm1
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_173
# %bb.174:
	vaddpd	%ymm4, %ymm5, %ymm0
	vaddpd	%ymm0, %ymm6, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_176:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	1448(%rsp), %rbx
	leaq	1472(%rsp), %rbp
	leaq	1464(%rsp), %r14
	leaq	1488(%rsp), %r15
	leaq	1480(%rsp), %r12
	.p2align	4, 0x90
.LBB21_177:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm6, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm5, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1632(%rsp), %rdi
	leaq	1624(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1632(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1648(%rsp), %rdi
	leaq	1640(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1648(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	1664(%rsp), %rdi
	leaq	1656(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1664(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1680(%rsp), %rdi
	leaq	1672(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1680(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1568(%rsp), %rdi
	leaq	1560(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1568(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1584(%rsp), %rdi
	leaq	1576(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1584(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	1600(%rsp), %rdi
	leaq	1592(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1600(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1616(%rsp), %rdi
	leaq	1608(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1616(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1504(%rsp), %rdi
	leaq	1496(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1504(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1520(%rsp), %rdi
	leaq	1512(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1520(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	1536(%rsp), %rdi
	leaq	1528(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1536(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1552(%rsp), %rdi
	leaq	1544(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1552(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1440(%rsp), %rdi
	leaq	1432(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1440(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1456(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1456(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1472(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm6                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm5                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm7                # 32-byte Reload
	vmulpd	480(%rsp), %ymm7, %ymm0         # 32-byte Folded Reload
	vmovsd	1624(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1640(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmovsd	1656(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1672(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	1560(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1576(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm8                # 32-byte Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm1) + ymm8
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	1592(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1608(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm7, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm0) + ymm5
	vmovsd	1496(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1512(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovsd	1528(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1544(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	1488(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm7, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmovsd	1432(%rsp), %xmm3               # xmm3 = mem[0],zero
	vmovhpd	1448(%rsp), %xmm3, %xmm3        # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm0) + ymm6
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	1464(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1480(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm7, %ymm1, %ymm1
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_177
# %bb.178:
	vaddpd	%ymm4, %ymm5, %ymm0
	vaddpd	%ymm0, %ymm6, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_180:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	1192(%rsp), %rbx
	leaq	1216(%rsp), %rbp
	leaq	1208(%rsp), %r14
	leaq	1232(%rsp), %r15
	leaq	1224(%rsp), %r12
	.p2align	4, 0x90
.LBB21_181:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm6, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm5, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1376(%rsp), %rdi
	leaq	1368(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1376(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1392(%rsp), %rdi
	leaq	1384(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1392(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	1408(%rsp), %rdi
	leaq	1400(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1408(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1424(%rsp), %rdi
	leaq	1416(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1424(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1312(%rsp), %rdi
	leaq	1304(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1312(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1328(%rsp), %rdi
	leaq	1320(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1328(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	1344(%rsp), %rdi
	leaq	1336(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1344(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1360(%rsp), %rdi
	leaq	1352(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1360(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1248(%rsp), %rdi
	leaq	1240(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1248(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1264(%rsp), %rdi
	leaq	1256(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1264(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	1280(%rsp), %rdi
	leaq	1272(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1280(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1296(%rsp), %rdi
	leaq	1288(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1296(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1184(%rsp), %rdi
	leaq	1176(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1184(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1200(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1200(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1216(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm6                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm5                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm7                # 32-byte Reload
	vmulpd	480(%rsp), %ymm7, %ymm0         # 32-byte Folded Reload
	vmovsd	1368(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1384(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmovsd	1400(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1416(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	1304(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1320(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm8                # 32-byte Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm1) + ymm8
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	1336(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1352(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm7, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm0) + ymm5
	vmovsd	1240(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1256(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovsd	1272(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1288(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	1232(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm7, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmovsd	1176(%rsp), %xmm3               # xmm3 = mem[0],zero
	vmovhpd	1192(%rsp), %xmm3, %xmm3        # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm0) + ymm6
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	1208(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1224(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm7, %ymm1, %ymm1
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_181
# %bb.182:
	vaddpd	%ymm4, %ymm5, %ymm0
	vaddpd	%ymm0, %ymm6, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_184:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	936(%rsp), %rbx
	leaq	960(%rsp), %rbp
	leaq	952(%rsp), %r14
	leaq	976(%rsp), %r15
	leaq	968(%rsp), %r12
	.p2align	4, 0x90
.LBB21_185:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm6, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm5, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1120(%rsp), %rdi
	leaq	1112(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1120(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1136(%rsp), %rdi
	leaq	1128(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1136(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	1152(%rsp), %rdi
	leaq	1144(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1152(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1168(%rsp), %rdi
	leaq	1160(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1168(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	1056(%rsp), %rdi
	leaq	1048(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1056(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1072(%rsp), %rdi
	leaq	1064(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1072(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	1088(%rsp), %rdi
	leaq	1080(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1088(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1104(%rsp), %rdi
	leaq	1096(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1104(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	992(%rsp), %rdi
	leaq	984(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	992(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1008(%rsp), %rdi
	leaq	1000(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1008(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	1024(%rsp), %rdi
	leaq	1016(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	1024(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	1040(%rsp), %rdi
	leaq	1032(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	1040(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	928(%rsp), %rdi
	leaq	920(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	928(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	944(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	944(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	960(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm6                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm5                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm7                # 32-byte Reload
	vmulpd	480(%rsp), %ymm7, %ymm0         # 32-byte Folded Reload
	vmovsd	1112(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1128(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vmovsd	1144(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1160(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	1048(%rsp), %xmm2               # xmm2 = mem[0],zero
	vmovhpd	1064(%rsp), %xmm2, %xmm2        # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm8                # 32-byte Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm1) + ymm8
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	1080(%rsp), %xmm0               # xmm0 = mem[0],zero
	vmovhpd	1096(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm7, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm0) + ymm5
	vmovsd	984(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovhpd	1000(%rsp), %xmm0, %xmm0        # xmm0 = xmm0[0],mem[0]
	vmovsd	1016(%rsp), %xmm1               # xmm1 = mem[0],zero
	vmovhpd	1032(%rsp), %xmm1, %xmm1        # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	976(%rsp), %xmm1, %xmm1         # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm7, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmovsd	920(%rsp), %xmm3                # xmm3 = mem[0],zero
	vmovhpd	936(%rsp), %xmm3, %xmm3         # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm0) + ymm6
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	952(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovhpd	968(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm7, %ymm1, %ymm1
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_185
# %bb.186:
	vaddpd	%ymm4, %ymm5, %ymm0
	vaddpd	%ymm0, %ymm6, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_188:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, 568(%rsp)                 # 8-byte Spill
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	.LCPI21_2(%rip), %ymm0          # ymm0 = [0.0E+0,3.1415926535897932E-7,6.2831853071795864E-7,9.4247779607693791E-7]
	movl	$10000000, %r13d                # imm = 0x989680
	vxorpd	%xmm5, %xmm5, %xmm5
	vxorpd	%xmm6, %xmm6, %xmm6
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	680(%rsp), %rbx
	leaq	704(%rsp), %rbp
	leaq	696(%rsp), %r14
	leaq	720(%rsp), %r15
	leaq	712(%rsp), %r12
	.p2align	4, 0x90
.LBB21_189:                             # =>This Inner Loop Header: Depth=1
	vmovupd	%ymm2, 96(%rsp)                 # 32-byte Spill
	vmovupd	%ymm6, 32(%rsp)                 # 32-byte Spill
	vmovupd	%ymm5, 368(%rsp)                # 32-byte Spill
	vmovupd	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovupd	%ymm4, 256(%rsp)                # 32-byte Spill
	vaddpd	320(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 160(%rsp)                # 32-byte Spill
	vaddpd	400(%rsp), %ymm0, %ymm1         # 32-byte Folded Reload
	vmovupd	%ymm1, 128(%rsp)                # 32-byte Spill
	vaddpd	608(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	vmovupd	%ymm0, (%rsp)                   # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	864(%rsp), %rdi
	leaq	856(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	864(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 64(%rsp), %xmm0     # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	880(%rsp), %rdi
	leaq	872(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	880(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	64(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	leaq	896(%rsp), %rdi
	leaq	888(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	896(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 480(%rsp)                # 16-byte Spill
	vpermilpd	$1, 432(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	912(%rsp), %rdi
	leaq	904(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	480(%rsp), %xmm0                # 16-byte Reload
	vmovhps	912(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 480(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	800(%rsp), %rdi
	leaq	792(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	800(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 224(%rsp)                # 16-byte Spill
	vpermilpd	$1, 160(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	816(%rsp), %rdi
	leaq	808(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	224(%rsp), %xmm0                # 16-byte Reload
	vmovhps	816(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	160(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	leaq	832(%rsp), %rdi
	leaq	824(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	832(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 528(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	848(%rsp), %rdi
	leaq	840(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	848(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	224(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	736(%rsp), %rdi
	leaq	728(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	736(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 432(%rsp)                # 16-byte Spill
	vpermilpd	$1, 128(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	752(%rsp), %rdi
	leaq	744(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	432(%rsp), %xmm0                # 16-byte Reload
	vmovhps	752(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	128(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	leaq	768(%rsp), %rdi
	leaq	760(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	768(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, 512(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	784(%rsp), %rdi
	leaq	776(%rsp), %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	784(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	432(%rsp), %ymm1                # 32-byte Reload
	vinsertf128	$1, %xmm0, %ymm1, %ymm0
	vmovups	%ymm0, 432(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	leaq	672(%rsp), %rdi
	leaq	664(%rsp), %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	672(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 528(%rsp)                # 16-byte Spill
	vpermilpd	$1, (%rsp), %xmm0       # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	leaq	688(%rsp), %rdi
	movq	%rbx, %rsi
	callq	sincos@PLT
	vmovaps	528(%rsp), %xmm0                # 16-byte Reload
	vmovhps	688(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0,1],mem[0,1]
	vmovups	%ymm0, 528(%rsp)                # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm0
	vmovaps	%xmm0, 640(%rsp)                # 16-byte Spill
	movq	%rbp, %rdi
	movq	%r14, %rsi
	vzeroupper
	callq	sincos@PLT
	vmovsd	704(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovaps	%xmm0, 512(%rsp)                # 16-byte Spill
	vpermilpd	$1, 640(%rsp), %xmm0    # 16-byte Folded Reload
                                        # xmm0 = mem[1,0]
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	sincos@PLT
	vmovupd	32(%rsp), %ymm6                 # 32-byte Reload
	vmovupd	368(%rsp), %ymm5                # 32-byte Reload
	vmovupd	256(%rsp), %ymm4                # 32-byte Reload
	vmovupd	288(%rsp), %ymm7                # 32-byte Reload
	vmulpd	480(%rsp), %ymm7, %ymm0         # 32-byte Folded Reload
	vmovsd	856(%rsp), %xmm1                # xmm1 = mem[0],zero
	vmovhpd	872(%rsp), %xmm1, %xmm1         # xmm1 = xmm1[0],mem[0]
	vmovsd	888(%rsp), %xmm2                # xmm2 = mem[0],zero
	vmovhpd	904(%rsp), %xmm2, %xmm2         # xmm2 = xmm2[0],mem[0]
	vinsertf128	$1, %xmm2, %ymm1, %ymm1
	vmovsd	792(%rsp), %xmm2                # xmm2 = mem[0],zero
	vmovhpd	808(%rsp), %xmm2, %xmm2         # xmm2 = xmm2[0],mem[0]
	vmovupd	192(%rsp), %ymm8                # 32-byte Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm1) + ymm8
	vaddpd	64(%rsp), %ymm4, %ymm4          # 32-byte Folded Reload
	vfmadd231pd	%ymm1, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm1) + ymm4
	vmovsd	824(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovhpd	840(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vinsertf128	$1, %xmm0, %ymm2, %ymm0
	vaddpd	160(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmulpd	224(%rsp), %ymm7, %ymm1         # 32-byte Folded Reload
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm0) + ymm5
	vmovsd	728(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovhpd	744(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovsd	760(%rsp), %xmm1                # xmm1 = mem[0],zero
	vmovhpd	776(%rsp), %xmm1, %xmm1         # xmm1 = xmm1[0],mem[0]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vmovapd	512(%rsp), %xmm1                # 16-byte Reload
	vmovhpd	720(%rsp), %xmm1, %xmm1         # xmm1 = xmm1[0],mem[0]
	vmulpd	432(%rsp), %ymm7, %ymm2         # 32-byte Folded Reload
	vaddpd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmovsd	664(%rsp), %xmm3                # xmm3 = mem[0],zero
	vmovhpd	680(%rsp), %xmm3, %xmm3         # xmm3 = xmm3[0],mem[0]
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm0) + ymm6
	vmovupd	96(%rsp), %ymm2                 # 32-byte Reload
	vmovsd	696(%rsp), %xmm0                # xmm0 = mem[0],zero
	vmovhpd	712(%rsp), %xmm0, %xmm0         # xmm0 = xmm0[0],mem[0]
	vmovupd	528(%rsp), %ymm9                # 32-byte Reload
	vinsertf128	$1, %xmm1, %ymm9, %ymm1
	vinsertf128	$1, %xmm0, %ymm3, %ymm0
	vaddpd	(%rsp), %ymm2, %ymm2            # 32-byte Folded Reload
	vmulpd	%ymm7, %ymm1, %ymm1
	vfmadd213pd	%ymm8, %ymm7, %ymm0     # ymm0 = (ymm7 * ymm0) + ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm0) + ymm2
	vmovupd	64(%rsp), %ymm0                 # 32-byte Reload
	vaddpd	576(%rsp), %ymm0, %ymm0         # 32-byte Folded Reload
	addl	$-16, %r13d
	jne	.LBB21_189
# %bb.190:
	vaddpd	%ymm4, %ymm5, %ymm0
	vaddpd	%ymm0, %ymm6, %ymm0
	vaddpd	%ymm0, %ymm2, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddpd	%xmm1, %xmm0, %xmm0
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
	vzeroupper
	callq	printf
.LBB21_192:
	subq	568(%rsp), %rbx                 # 8-byte Folded Reload
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
	vzeroupper
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movl	$.L.str.13, %edi
	movl	$_Z10Gooding_S9dd, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.14, %edi
	movl	$_Z12Gooding_S9s2dd, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.15, %edi
	movl	$_Z4S9t2dd, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.16, %edi
	movl	$_Z7S9t2p54dd, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	vmovsd	.LCPI21_10(%rip), %xmm1         # xmm1 = mem[0],zero
	vfnmadd132sd	360(%rsp), %xmm1, %xmm1 # 8-byte Folded Reload
                                        # xmm1 = -(xmm1 * mem) + xmm1
	vmovapd	464(%rsp), %xmm0                # 16-byte Reload
	vmulsd	.LCPI21_11(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, 320(%rsp)                # 8-byte Spill
	vxorpd	%xmm0, %xmm0, %xmm0
	callq	_Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.17, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
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
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	320(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmulsd	.LCPI21_11(%rip), %xmm0, %xmm2
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vaddsd	%xmm1, %xmm0, %xmm1
	vmovsd	320(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vaddsd	.LCPI21_0(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, 320(%rsp)                # 8-byte Spill
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	.LCPI21_11(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	320(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	.LCPI21_11(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	320(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	.LCPI21_11(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	320(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	.LCPI21_11(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	320(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmovsd	.LCPI21_11(%rip), %xmm0         # xmm0 = mem[0],zero
	vmulsd	320(%rsp), %xmm0, %xmm2         # 8-byte Folded Reload
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	.LCPI21_12(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	.LCPI21_13(%rip), %xmm0         # xmm0 = mem[0],zero
	vmovsd	360(%rsp), %xmm4                # 8-byte Reload
                                        # xmm4 = mem[0],zero
	vfmadd213sd	.LCPI21_14(%rip), %xmm4, %xmm0 # xmm0 = (xmm4 * xmm0) + mem
	vmovsd	.LCPI21_8(%rip), %xmm1          # xmm1 = mem[0],zero
	vmovapd	464(%rsp), %xmm5                # 16-byte Reload
	vxorpd	.LCPI21_15(%rip), %xmm5, %xmm2
	vdivsd	%xmm0, %xmm1, %xmm3
	vmulsd	%xmm2, %xmm3, %xmm0
	vmovsd	.LCPI21_16(%rip), %xmm1         # xmm1 = mem[0],zero
	vfnmadd213sd	%xmm1, %xmm4, %xmm1     # xmm1 = -(xmm4 * xmm1) + xmm1
	vmulsd	%xmm1, %xmm3, %xmm1
	vmulsd	.LCPI21_17(%rip), %xmm5, %xmm2
	vmulsd	%xmm3, %xmm2, %xmm2
	callq	_Z13SolveCubicOptddd
	vmovapd	%xmm0, %xmm2
	movl	$.L.str.1, %edi
	movl	$.L.str.18, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovapd	464(%rsp), %xmm1                # 16-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	320(%rsp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	vmulsd	.LCPI21_19(%rip), %xmm1, %xmm2
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_19(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	320(%rsp), %xmm1, %xmm2         # 8-byte Folded Reload
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_19(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	320(%rsp), %xmm1, %xmm2         # 8-byte Folded Reload
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_19(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	320(%rsp), %xmm1, %xmm2         # 8-byte Folded Reload
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_19(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	320(%rsp), %xmm1, %xmm2         # 8-byte Folded Reload
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	%xmm2, 320(%rsp)                # 8-byte Spill
	vmovsd	%xmm1, 400(%rsp)                # 8-byte Spill
	vmulsd	.LCPI21_18(%rip), %xmm2, %xmm0
	vmovsd	.LCPI21_19(%rip), %xmm1         # xmm1 = mem[0],zero
	vmulsd	320(%rsp), %xmm1, %xmm2         # 8-byte Folded Reload
	vmovsd	.LCPI21_20(%rip), %xmm1         # xmm1 = mem[0],zero
	callq	_Z13SolveCubicOptddd
	vmovsd	320(%rsp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	400(%rsp), %xmm1                # 8-byte Reload
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
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	callq	_Z6DoTestPKcPFdddEdd
	movl	$.L.str.20, %edi
	movl	$_Z6Betterdd, %esi
	vmovsd	360(%rsp), %xmm0                # 8-byte Reload
                                        # xmm0 = mem[0],zero
	vmovaps	464(%rsp), %xmm1                # 16-byte Reload
	addq	$2200, %rsp                     # imm = 0x898
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
