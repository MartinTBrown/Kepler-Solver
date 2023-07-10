//  KeplerSolver - solves Kepler's equation using novel cubic algorithm
//
//  This file: KeplerSolver.cpp
//
//    Copyright (C) 2023 Martin T. Brown 
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
//	Github sources available at https://github.com/MartinTBrown/Kepler-Solver
//	Author contact details: martink@nonad.co.uk

// This is a version of the code which implements algorithms for solving Kepler's equation
// Together with helper functions which solve a cubic and iteration of Newton-Raphson or Halley's method
// Two commonly used starters from Gooding 1986 are also here S3 O(e^2) and S9 O(e^4) 
// Markely's 1995 algorithm and Linden-Bell's 2015 algorithm are also implemented for reference.
// This code forms a part of the MNRAS paper by Martin T. Brown 2023 titled 
//	"An improved cubic approximation for Kepler's Equation"
// As far as possible the notation used here follows the algebraic equations in the paper.
//
// Developed and tested under MS Visual Studio 2010 Pro Version 10.0.402191 SP1 Rel
// Continued development on Microsoft Visual Studio Community 2022 (64-bit) - Current Version 17.1.0
// Ported to Intel® oneAPI DPC++ Compiler   Package ID: w_oneAPI_2023.0.0.25839
// Intel® oneAPI DPC++ Compiler – toolkit version: 2023.0.0, extension version 23.0.0.17, Package ID: w_oneAPI_2023.0.0.25839
// Ported to GCC  (recommend compiler options -O3 -Ofast) but it is still 2x slower than either of the above
// Ported to Apple Clang Compiler with a few adjustements made for legacy compiler version(s).
//
// Recommended compiler options for accuracy are:
// Release, Full Optimisation, Inline any suitable, FP:fast, Favour fast code, whole program optimisation
// SSE2 or AXV2 preferred code generation and if possible use Advanced setting _vectorcall on MS compilers
// (this avoids some silly legacy code generation returning answers on the x87 FPU stack)
// 
//
// Recommended compiler options for debugging (and worse accuracy) are:
// Debug, All Optimisation Disabled, Inline None, FP: Strict
//
// Quirk of x87 hardware is that some operations on the FP stack like sin are computed to full precision 
// even when the flag for rounding to 53 bit mantissa is set. Very noticeable for evaluating E-e*sin(E).
// Particularly if all intermediate results remain on the FP stack to full 80 bit precision.
//

#include "stdafx.h"
#include "KeplerSolver.h"
#include "benchmark.h"
#include "BM_shims.h"
#include "classic.h"
#include "cuberoot.h"
#include "solver.h"  // for NSOLVER and BasicRR
#include "starter.h"
#include "BM_starter.h"
#include "opt_starter.h"
#include "tests.h"
#include "deltas.h"
#include "intel.h"
#include "verify.h"

// the following code is a framework for testing different implementations
// all except Kepler's and Barker's orginal cubic algorithm are now implemented

// prototype functions of e,M,E are : double (*fun3)(double, double, double)  // not used at present 
// prototype functions of e,M   are : double (*test[NFUNCT])(double,double)
// prototype functions of x     are : double (*fun)(double)
// some rarer linkage conventions require #define VOODOO to be set in benchmarks


double Dummy(double e, double M)
{
	return M;
}


void InitAll()
{
	Init(0, Dummy, "M");
	// the following all return an estimate of E
	Init(1,	 MTB_Basic,  "Basic");
	Init(2,  MTB_Better, "Better"); 
	Init(3,  MTB_Best,   "Best");
	Init(4,  MTB_BasicOpt, "BasicOp");
	Init(5,  MTB_Reference, "Exact");
	Init(6,  D5_FLM_Solver, "D5_FLM");
	Init(7,  FLM_Solver,    "FLM95");
	Init(8,  DLB_SolverB,   "DLB_B");
	Init(9,  DLB_SolverBG,  "DLB_BG"); 
	Init(10, MTB_Pade,		"Pade");

	Init(11, MTB_Cubic,		"Cubic");
	Init(12, Mikkola_Cubic, "SM_Cub");
	Init(13, Mikkola_Pade,  "SM_Pade");
	Init(14, MTB_PadeC,		"MTB_CC");
	Init(15, MTB_PadeRS,	"MTB_RS");
	Init(16, MTB_PadeRF,	"MTB_RF");
	Init(17, MTB_PadePiby4, "PadePi/4");
	Init(18, DLB_SolverMB,	"DLB_MB");
	Init(19, MTB_Hybrid,    "Hybrid");	

	Init(20, MTB_Optimised, "Optimised");
	Init(21, MTB_Polish,    "Polish");
	Init(22, BM_D0, "D0");
	Init(23, BM_D1, "D1");
	// classic starting values
	Init(24, Gooding_S1,	"S1");   // simplest convergent E = M+e
	Init(25, Danby_S1_85,	"S1_85");		
	Init(26, MTB_S1_41,		"S1_41");
	Init(27, MTB_S1_50,		"S1_50");
	Init(28, MTB_S1_62,		"S1_62");
	Init(29, Gooding_S3, "S3");

	Init(30, Gooding_S9, "S9");
	Init(31, Gooding_S9s2, "S9s2");
	Init(32, S9t2,		 "S9t2");
	Init(33, S9t2p54,    "S9t2p54"); // almost as accurate as true S9 but only 13 cycles.
	Init(34, S9t2p52,    "S9t2p52");	
	Init(35, BM_MTB_D3M, "D3M");
	Init(36, BM_D3t2p54M, "D3t2p54M");
	Init(37, MTB_D4M, "M_D4M");
	Init(38, FLM_D4t2M, "D4t2M");
	Init(39, FLM_D4t2pM, "D4t2pM");

	Init(40, MTB_D5M, "M_D5M");
	Init(41, FLM_D5t2M, "D5t2M");
	Init(42, FLM_D5t2pM, "D5t2pM");
	Init(43, BM_MTB_D6M, "M_D6M");
	Init(44, BM_MTB_D7M, "M_D7M");
	Init(45, BM_MTB_D8M, "M_D8M");
	Init(46, MTB_Basic, "Basic");
	Init(47, MTB_BasicE, "BasicE");
	Init(48, BM_NR_Basic,   "NR_Basic");
	Init(49, BM_D3_Basic,	"D3_Basic");

	Init(50, MTB_BasicI, "BasicI");
	Init(51, BM_D380_Basic, "D380_Bas");
	Init(52, BM_D3t2_Basic, "D3t2_Basic");
	Init(53, MTB_BasicOpt_t2, "BasOp_t2");
	Init(54, D3T_Basic2t, "D3_Basic2t");
	Init(55, BM_D4_Basic, "D4_Basic");
	Init(56, MTB_Better, "Better");
	Init(57, BM_NR_Better,  "NR_Better");

	Init(58, BM_D3_Better,	"D3_Better");
	Init(59, MTB_BetterOpt, "BetterOp");
	Init(60, BM_D4_Better, "D4_Better");
	Init(61, MTB_Best, "Best");
	Init(62, BM_NR_Best, "NR_Best");
	Init(63, BM_D3_Best, "D3_Best");
	Init(64, BM_D3t2_Best, "D3t2_Best");
	Init(65, MTB_BestI,		"BestI");
	Init(66, MTB_Best2tp54Opt, "Best2tp54Op");
	Init(67, BM_D4_Best, "D4_Best");

	Init(68, FLM_Solver, "FLM95");
	Init(69, BM_NR_FLM95,	"NR_FLM");
	Init(70, BM_D3_FLM95,	"D3_FLM");
	Init(71, BM_D4_FLM95,   "D4_FLM");
	Init(72, D5_FLM_Opt,	"D5_FLMop");
	Init(73, DLB_SolverBG, "DLB_BG");
	Init(74, BM_NR_DLB,	"NR_DLB");
	Init(75, BM_D3_DLB, "D3_DLB");
	Init(76, BM_D4_DLB, "D4_DLB");;
    Init(77, BM_D5_DLB, "D5_DLB");

	Init(78, BM_Classic_NR80, "NR80");
	Init(79, BM_Classic_NR, "NR");
	Init(80, BM_FLM_NR,		"NR+");
	Init(81, BM_MTB_NRt2,	"NRt2");
	Init(82, BM_Kepler_Halley80, "Halley80");
	Init(83, BM_Classic_Halley, "Halley");
	Init(84, BM_MTB_Halley,		"Hall_s");
	Init(85, BM_Halley_t2,		"Hal_t2");
	Init(86, BM_D3t2p54, "D3t2p54");
	Init(87, BM_FLM_D4,		"M_D4");

	Init(88, BM_FLM_D4t2,	"D4t2");
	Init(89, BM_FLM_D4t2p,	"D4t2p32");
	Init(90, BM_FLM_D5,		"M_D5");
	Init(91, BM_FLM_D5t2,	"D5t2");
	Init(92, BM_MTB_D6,		"MB_D6");
	Init(93, BM_MTB_D6t2,	"D6t2");
	Init(94, BM_MTB_D7,		"MB_D7");
	Init(95, BM_MTB_D7t2,	"D7t2");
	Init(96, BM_MTB_D8,		"MB_D8");
	Init(97, BM_MTB_D8t2,	"D8t2");
	
	Init(98, BM_Dn_MkE,		"Dn_Mke");
	Init(99, BM_NR_OptK,	"NRoptK");
	Init(100, BM_D3_OptK,	"D3optK");
	Init(101, BM_D4_OptK,	"D4optK");
	Init(102, BM_D5_OptK,	"D5optK");
	Init(103, BM_D6_OptK,	"D6optK");
	Init(104, MTB_PadeK,	"MPadeK");
	Init(105, BM_NRNR_OptK, "NRNRoK");
	Init(106, BM_FLM_NRt2NRt2, "NRtNRt");

	Init(107, BM_FLM_NRt2NR, "NRNRt2");

	Init(108, BM_FLM_NRNRt2, "NRt2NR");
	Init(109, BM_FLM_NRNR, "NRNR");

	Init(110, BM_FLM_NRNRNR,   "NR(3x)");
	Init(111, BM_FLM_NRNRNRNR, "NR(4x)");
	Init(112, BM_FLM_D4t2NRok,	"D4t2NRk");
	Init(113, BM_FLM_D4t2D3ok,  "D4t2D3k");
	Init(114, BM_FLM_D4t2D4ok,  "D4t2D4k");
	Init(115, BM_NR_S9,  "NR_S9");
	Init(116, BM_D3_S9, "D3_S9");
	Init(117, BM_D3S9t2, "D3_S9t2");
	Init(118, BM_D3t2S9t2, "D3t2_S9t2");

	Init(119, BM_D3t2S9,  "D3t2_S9");
	Init(120, BM_D3t2S9t2p52,  "D3_S9t2p52");
	Init(121, BM_D3t2_S9t2p52, "D3t2_S9t2p");
	Init(122, BM_D3t2p_S9t2p52, "D3t2p_S9t2p");
	Init(123, BM_D3_D4M, "D3_D4M");	
	Init(124, BM_D4_D4M, "D4_D4M");
	Init(125, BM_D4_D4t2p, "D4_D4t2p");
	Init(126, BM_D4_S3, "D4_S3");
	Init(127, BM_D4_S9, "D4_S9");

	Init(128, BM_D4t2S9,  "D4t2_S9");
	Init(129, BM_D4t2_D4t2, "D4t2_D4");

	Init(130, BM_D4_D54t2pM,  "D4_D5t2pM");	
	Init(131, BM_D5_S9, "D5_S9");
	Init(132, BM_D5t2S9,  "D5t2_S9");
	Init(133, BM_D5t2S9t2, "D5t2_S9t2");
	Init(134, BM_NRD5t2,  "NR_D5t2");
	Init(135, MTB_BasicE, "BasicE");
	Init(136, MTB_Basic, "Basic(ref)");
	Init(137, MTB_BasicQ,  "BasicQ");  // quick? scaled 1/60 3x /f3
	Init(138, MTB_BasicR,  "BasicR");  // scaled by 1/60, 3x *(1/f3)
	Init(139, MTB_BasicS,  "_BasicS");  // no solver t = a+b+c

	Init(140, MTB_BasicT,  "_BasicT");  // no trig sin/cos
	Init(141, MTB_BasicRR, "BasicBM"); // stub for solve cubic speed tests with different cbrts
	Init(142, MTB_BasicA, "_BasicA");   // no trig atan2
	Init(143, MTB_BasicZ,  "BasicZ");  // no if (E<M) test
	Init(144, MTB_BasicF32, "BasicF32");
	Init(145, MTB_Basic2tp10, "Bas2tp10");
	Init(146, MTB_Basic2tp30, "Bas2tp30");
	Init(147, MTB_Basic2tp50a, "Bas2tp50");
	Init(148, MTB_Basic2tp70, "Bas2tp70");
	Init(149, MTB_Basic2tp32, "Bas2tp32");

	Init(150, MTB_Basic2tp32x, "Basic2tp32x");
	Init(151, MTB_Basic2tp52, "Bas2tp52");
	Init(152, MTB_Basic2tp52y, "Basic2tp52y");
	Init(153, MTB_Basic2tp54, "Bas2tp54");
	Init(154, BM_NR_Basic2tp54,  "NR_Bas2tp54");
	Init(155, D4T_Basic2tp52, "D4T_B2tp52");
	Init(156, BM_D3_Basic2tp54,  "D3_Bas2tp54");
	Init(157, BM_D4_Basic2tp54,	"D4_Bas2pt54");
	Init(158, MTB_Basic2tp56, "Basic2tp56");
	Init(159, MTB_BasicP20,  "BasicP20"); // fastest minimum polynomial "1-x^2"

	Init(160, MTB_BasicP20a, "Basic20a");
	Init(161, MTB_BasicP30,  "BasicP30");
	Init(162, MTB_BasicP40,  "BasicP40");
	Init(163, MTB_BasicP50,  "BasicP50");
	Init(164, MTB_BasicP60,  "BasicP60");
	Init(165,  MTB_BasicP70,  "BasicP70");
	Init(166,MTB_BasicP80, "BasicP80");//MTB_BasicP52,  "BasicP52"
	Init(167, MTB_BasicP90, "BasicP90");
	Init(168, MTB_BasicP32,  "BasicP32");
	Init(169, MTB_BasicP32a, "BasicP32a");

	Init(170, MTB_BasicP32ND, "BasP32ND");
	Init(171, MTB_BasicP52ND, "BasP52ND");
	Init(172, BM_D1, "D1");
	Init(173, BM_NR_D1, "NR_D1");
	Init(174, BM_D3_D1, "D3_D1");
	Init(175, BM_D3t2_D1, "D3t2_D1");
	Init(176, BM_D4_D1, "D4_D1");
	Init(177, BM_D4t2_D1, "D4t2_D1");
	Init(178, BM_D5_D1, "D5_D1");
	Init(179, BM_D5t2_D1, "D5t2_D1");

	Init(180, BM_D6_D1, "D6_D1");
	Init(181, BM_D7_D1, "D7_D1");
	Init(182, BM_D8_D1, "D8_D1");
	Init(183, BM_D4D3_D1, "D3D4_D1");
	Init(184, BM_D4t2D3t2_D1, "D4t2D3t2D1");
	Init(185, BM_D3t2D4t2_D1, "D3t2D4t2D1");
	Init(186, MTB_DCubic, "DCubic");
	Init(187, MTB_DPade, "Dpade");
	Init(188, Dummy, "_");
	Init(189, Dummy, "_");
	Init(190, Dummy, "_");
	// timings only for hidden two parameter double (double, double) functions 

//	Init(191, v_atan2, "_atan2");
//	Init(192, pow, "_pow");
	Init(191, Dummy, "_");
	Init(192, Dummy, "_");
	Init(193, Pow_eN,    "_a.e^N"); 
 	Init(194, BM_GFixup80, "_GFix80");
	Init(195, BM_GFixup, "_GFixup");
	Init(196, BM_MFixup,    "_MFixup");
	Init(197, BM_FLMFixup,    "_FLMFix");
	Init(198, SpeedTest_CubicBM,    "_CubicBM");
	Init(199, SpeedTest_Cubic, "_SolveC"); 

// these verify tests should all evalute exactly to zero


	Init(NVER, Verify_Any2,   "Verify_Any");   // first two are special cases and require extra parameters
	Init(NVER+1, Verify_Cbrt, "Verify_Cbrt");  // safe defaults are set so that it will execute OK

	Init(NVER+2,	 Verify_NRT, "Verify_NRT"); // the rest are self contained tests of functionality or mathematical identities
	Init(NVER+3, Verify_HalleyT, "Verify_HT");
	Init(NVER+4,  Verify_D4T, "Verify_D4T");
	Init(NVER+5,  Verify_Symmetry, "Verify_Sym");
	Init(NVER+6,  Verify_Cubic, "Ver_Solver");
	Init(NVER+7,  Verify_Reference, "Verify_Ref");
	Init(NVER+8,  Verify_qSin, "Verify_qSin");
	Init(NVER+9, Verify_Q3R2, "Q3R2");
	Init(NVER + 10, Verify_Cbrt, "Verify_Cbrt");
	
	Init(NVER+11, Verify_Kepler_f80,      "Ver_f80");
	Init(NVER+12, Verify_Gooding_Fixup,   "Ver_Gfix");
	Init(NVER+13, Verify_Gooding_Fixup80, "VGfix80");
	Init(NVER+14, Verify_s2c2,     "Ver_s2c2-1");        // these check various algebraic identities for numerical accuracy routine name describes them
	Init(NVER+15, Verify_asin_sin, "Ver_asins");
	Init(NVER+16, Verify_sin_asin, "Ver_sinas");
	Init(NVER+17, Verify_acos_cos, "Ver_acosc");
	Init(NVER+18, Verify_cos_acos, "Ver_cosac");
	Init(NVER+19, Verify_atan_tan, "Ver_atant");
	Init(NVER+20, Verify_tan_atan, "Ver_tanat");
	Init(NVER+21, Verify_log_exp, "Ver_logexp");
	Init(NVER+22, Verify_exp_log, "Ver_explog");
	Init(NVER+23, Verify_sqrt_x2, "Ver_sqrtx2");
	Init(NVER+24, Verify_x2_sqrt, "Ver_^2sqrt");
	Init(NVER+25, Verify_cbrt_x3, "Ver_cbrx3");
	Init(NVER+26, Verify_x3_cbrt, "Ver ^3cbrt");
	Init(NVER+27, Verify_sin_sin87, "Ver sin87");
	Init(NVER+28, Verify_cos_cos87, "Ver cos87");
	Init(NVER+29, Verify_tan_tan87, "Ver tan87");
	Init(NVER+30, Verify_atan_atan87, "Ver atan87");

	Init(NVER+31, Verify_sincos_sin87, "Ver sincoss");
	Init(NVER+32, Verify_sincos_cos87, "Ver sincosc");
	Init(NVER + 33, Verify_s2c2_87, "Ver s2c287");
	Init(NVER + 34, Verify_s2c2a, "Ver s2c2a");
	Init(NVER + 35, Verify_s2c2b, "Ver s2c2b");
	Init(NVER+36, Dummy, "_");
	Init(NVER+37, Dummy, "_");
	Init(NVER+38, Dummy, "_");
	Init(NVER+39, Dummy, "_");
	Init(NVER + 40, Dummy, "_");
	Init(NVER + 41, Dummy, "_");
	Init(NVER + 42, Dummy, "_");
	Init(NVER + 43, Dummy, "_");
	Init(NVER + 44, Dummy, "_");
	Init(NVER + 45, Dummy, "_");
	Init(NVER + 46, Dummy, "_");
	Init(NVER + 47, Dummy, "_");
	Init(NVER + 48, Dummy, "_");
	Init(NVER + 49, Dummy, "_");

	init_rt3();
}

void TabulateFunction(int n, int ediv, int Mdiv, int mode)
{
	// create an equally spaced grid of samples suitable for contour plots
	// 100 samples in each direction seems to be plenty good enough
	// mode 0 = E0, 1 = Eref-E0, 2 = (Eref-E0)/Eref
	const char smode[4][9] = { "E0", "E-E0", "(E-E0)/E", "invalid"};
	double de, dM, e, err, Eref, E0, M;
	double (* testfun)(double, double);
	int i, j;
	mode = mode & 3; // restrict modes to supported ones 0,1,2 at present (could add abs() versions for errors)
	de = 1.0 / ediv;
	dM = pi / Mdiv;
	e = 0;
	testfun = GetTest(n);
	printf("Table of data for %3i %s %i x %i mode %i = %s\n", n, GetName(n), ediv, Mdiv, mode, smode[mode]);
	for (i = 0; i <= ediv; i++)
	{
		M = 0;
		for (j = 0; j <= Mdiv; j++)
		{
			E0 = (*testfun)(e, M);
			if (mode)
			{
				Eref = MTB_Reference(e, M);
				if ((*testfun == MTB_Reference) || (*testfun == MTB_Polish))
					err = Classic_NR80(e, M, E0);
				else
					err = Eref - E0;
				switch (mode)
				{
				case 0: break;			// function value E0
				case 1: E0 = err; break;	// error Eref - E0
				case 2: if (Eref) E0 = err / Eref; else E0 = err; // relative error (Eref-E0)/Eref
				default: break;											 // defended against Eref == 0
				}
			}
			printf("%-9.7g ", E0);
			M = M + dM;
		}
		printf("\n");
		e = e + de;
	}

}

void DoCoreTests(int i, double e, bool verbose)
{
	if ((i < NFUNCT))
	{
		if (GetN() < 10)
		{
			FullTest(i, verbose);
			if (i < NVER) QuickTimeFun(i, 0.85);
		}
		else
			RandomTest(i, 10000 * (__int64)GetN(), verbose);
	}
}

void Copyright()
{
	printf("KeplerSolver  Copyright (C) 2023  Martin T, Brown\n");
	printf("This program comes with ABSOLUTELY NO WARRANTY; for details see license.\n");
	printf("This is free software, and you are welcome to redistribute it\n");
    printf("under certain conditions; for details see GNU GPL license. \n");
}

int main(int argc, char *argv[])
{
	bool verbose;
	int i, j, k;
	double M, e;
	verbose = false;
	InitAll();
	InitAll();
	printf("\nCompile options: ");
#ifdef _DEBUG
	printf(" DEBUG");
#endif
#ifdef STRICT
	printf(" STRICT");
#endif
#ifdef PURE
	printf(" PURE");
#endif
#ifdef FAST
	printf(" FAST");
#endif

#ifdef _MSC_VER
 #ifdef _M_IX86
	printf(" MSC_ver %i SSE %i", _MSC_FULL_VER,_M_IX86);
 #else
	printf(" MSC_ver %i SSE undefined", _MSC_FULL_VER);
 #endif
 #ifdef __INTEL_COMPILER
	printf(" Classic Intel C++ Compiler", __INTEL_COMPILER);
 #endif
 #ifdef __INTEL_LLVM_COMPILER
		printf(" Intel C++ Compiler Version %i ", __INTEL_LLVM_COMPILER);
 #endif
#else
    #ifdef __APPLE__
	  printf(" Apple M1/M2 Compiler Verion %s build %i", __clang_version__, __apple_build_version__);
    #endif
#endif
	printf(" cbrt_ver %i\n", CBRT);
#ifndef X87_64
	FPU80_on();
#endif
	Set_rk(0.5);
 	if (argc==1) // no parameters on command line
	{ 
	  Copyright();
	  ShowHelp();
	  for (i = 1; i < 8; i++)
		  SimpleTest(i, 1.0, 1e-24, i == 1, false);
	}
	else
	{   // interpret command line - very simple minded numeric input!

		SetVerifyFun1(3); // safe default accurate cbrt
		SetVerifyFun2(4); // safe default Optimised D3T Basic 
		SetVerifyRef2(51); // safe default D3(x87) Basic as reference
		if (argc>=2) 
		{
			
            e = atof(argv[1]);
			i = (int)e;
			if (argc >= 3) verbose = (argv[argc - 1][0] == '1');
			switch (i)
			{
			case NFUNCT	    : FullTestAll(0, NVER); break;
			case NFUNCT + 1 : FullTestAll(NVER, NFUNCT); break;
			case NFUNCT + 2 : TestCbrtAll(verbose); break;
			case NFUNCT + 3 : BenchmarkMathlib(); break;
			case NFUNCT + 4 : QuickTimeAll(0.85); break;

			case NFUNCT + 5 : QuickTimeSolver(141, 0.85); break; //for (i = 0; i < 15; i++) { SetCubeRoot(i); FullTest(141, false); }; break;
			case NFUNCT + 6	: Test_E_sinE(); break;
			case NFUNCT + 7 : Test_Kepler_zero(); break; // Tommasini challenge test
			case NFUNCT + 8	: TestDnt2All(); break; // put bounds on safe delta in Tan forms
			case NFUNCT + 9 : ErrorSummary(false); break;
			case NFUNCT + 11: Opt_k(98);  // should be BM_DN_Mke as default
			case NFUNCT + 12: SetVerifyFun1(0); 	DoCoreTests(141, e, false);
			}
			i = CheckParam(i);
			if (argc==2) // single parameter (e)  
			{
		      if (abs(e)<1) QuickTestAll(e);
			  if (i < NFUNCT)
			  {
				  if (i == NVER)
					  printf("Compare function %i requires two other functions to compare\n", i);
				  else
				  {
					SetVerifyFun1(CBRT);
				    DoCoreTests(i, e, i<NVER);
				  }
		      }
			}
			else
			{
              j = atoi(argv[argc-1]);
			
		      verbose = (j==1);
			  if (i<NFUNCT)
			  {
 				if (argc>=3) // two parameters e, M
			    {		
                    M = atof(argv[2]);
					j = (int)M;
					if (i == NVER + 1) SetVerifyFun1(j);
					if (argc==3)
					{
						if (e <= 1) MasterTest(1, e, M, true, verbose);
						else DoCoreTests(i, -1, verbose);
					}
			    else
					{
                        k = CheckParam(atoi(argv[3]));
						if (i == NVER)
						{
							SetVerifyFun2(j);
							SetVerifyRef2(k);
							printf("\nVerifying %i %s  = %i %s\n", j, GetName(j), k, GetName(k));
						}
						if (argc>=5) // three parameters VerAll, Nfun1 Nfun2
						{
                            j = CheckParam(atoi(argv[4]));
							if (j) MasterTest(j, e, M, true, verbose);
							else DoCoreTests(i, -1, verbose);
						}
						else
						{
							if (argc == 4) MasterTest(i, e, M, true, verbose);
							else
							{
							for (i = 1; i< argc-1;  i++)
							{
                             j = CheckParam(atoi(argv[i+1]));
							 if (j) FullTest(j, verbose);
							}
						}
					} 
			    }
			  }
			  }
			  else
			  {
				  SetVerifyFlag(i>0);
                  j = atoi(argv[2]);
				  if (argc == 3)
				  {
					if (i == NFUNCT + 10) TabulateFunction(j, 100, 100, 1);
					if ((i == NFUNCT+11) && (j<=NFUNCT))		Opt_k(j);
					if (i == NFUNCT+12) if ((j >= 0) && (j < NSOLVER))
					{
						SetVerifyFun1(j);
						DoCoreTests(141, e, verbose);
					}
				  }
				  if (argc>=4) 
				  {
                      k = atoi(argv[3]);
					  printf("%i %s :  ", i, GetName(i));

					  if (i == NVER)
					  {
					  SetVerifyRef2(j);
					  SetVerifyFun2(k);
					  printf("\nVerifying %i %s  = %i %s\n", j, GetName(j), k, GetName(k));

					  }
					  else
					  {
						  if (i == NFUNCT + 10) TabulateFunction(j, 100, 100, k);
						  SetVerifyRef1(j);
						  SetVerifyFun1(k);

					  }
					  DoCoreTests(i, e, verbose);
				  }
			  }
			}
		}
	}
return 0;
}
