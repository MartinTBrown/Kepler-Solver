//  KeplerSolver - solves Kepler's equation using novel cubic algorithm
//
//  This file: cuberoot.cpp
//
//  The new cuberoot algorithm in double precision is N_dcbrt4
//  It consistes of a 23 bit Pade approximation on 1+x x<1/3
//  and a single Halley refinement
//
//  cbrt_Ref3 is the simplest effective algorithm - better than most
//  system cbrts that I have checked. exp(log(x)/3) & Halley refinement
//
//  Parts of this file are subject to addtional copyright arrangements
//  Notably:
//
//  gnu-cbrt()
//   Copyright (C) 1997, 2012-2022 Free Software Foundation, Inc.
//   Contributed by Dirk Alboth <dirka@uni-paderborn.de> and
//   Ulrich Drepper <drepper@cygnus.com>, 1997.
// 
//  BSD_cbrt()
//  Copyright (c) 1985, 1993
//	The Regents of the University of California.  All rights reserved.
//  kahan's cube root (53 bits IEEE double precision) for IEEE machines only
//  coded in C by K.C. Ng, 4/30/85
//
//  sun_cbrt()
//  Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
//  Developed at SunPro, a Sun Microsystems, Inc. business.
//  Optimized by Bruce D. Evans.
//
//    The remainder is Copyright (C) 2023 Martin T. Brown 
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


#include "stdafx.h"
#include "cuberoot.h"
#include "intel.h"


// These are my own algorithms together with the BSD, GNU and Sun implementations.
// recent processor improvements mean that exp(ln(x)/3) + Halley is the best so far
// being faster, more accurate and may inline on some compilers.

// GNU, Intel & MS system cbrt are slower and have poor accuracy
// Intel C++ pow(x,1.0/3) function is fastest and most accurate of all 64 bit versions
// 
// my ASM x87 implementation my be switched into full 80 bit precision

// Halley form s = s*(2x+t)/(2t+x) is significantly less accurate
// prefer      s = s + s*(x-t)/(2t+x)
// There is an even better form using fused multiple add but not yet finished.
// 
// C_cbrt2 & 5 are an attempt to replicate Intel's remarkable new system cbrt
// which appears to exploit the now very fast sqrt function and 1/3  = 010101 ...
// It also may have a final refinement step using fused multiply add to beat the 
// accuracy limits of conventional double precision arithmetic.
// 
// MS and particularly GCC system library cbrt are inadequate for this problem.
// 
// I tried Kahan's suggested forms for higher accuracy but it made no difference
//  see Ref_cbrt3 for details (that is the best buy portable cbrt on Intel CPUs)
// the faster float version N_cbrt4 has marginally better accuracy 
// than the double N_dcbrt (due to shorter mantissa in a 4 byte integer)
// However, using float intermediate results means that overflow can occur

const double fudge[5] = {  0.62996052494743663, 0.79370052598409983, 1.0,  1.259921049894873122, 1.58740105196819944};
const double *dcbrt2n = fudge+2;  // so that an indexing addition is saved inside cbrt.

const float realfudge[5] = {  0.62996052f, 0.793700526f, 1.0f,  1.25992105f, 1.58740105f }; 
const float* rcbrt2n = realfudge + 2;

const double r3 = 1.0/3+1e-16;
const float  x4magic = -0.05386218f; // was -0.05386218f ;  // optimised for x^4 - set to zero to see the difference it makes!

double (*cuberootfun)(double) = Ref_cbrt3;

double (*GetCubeRoot())(double)
{
	return cuberootfun;
}

double ret_x(double x)
{
	return x;
}

char cbrt_name[15][9] = { "syscbrt", "Pow1/3","expln","Ref3", "asmcbrt","Ncbrt3", "Ncbrt4", "Ndcbrt4", "Nrcbrt4","Ccbrt2","Ccbrt5","BSD", "GNU", "Sun", "ret_x"};


void SetCubeRoot(int N)
{
	printf("\nCube root = %i %s", N, cbrt_name[N]);
	switch (N)
	{
	case 0: break; //  cuberootfun = cbrt; break;
	case 1: cuberootfun = Ref_cbrt; break;
	case 2: cuberootfun = Ref_cbrt2; break;
	case 3: cuberootfun = Ref_cbrt3; break;
	case 4: cuberootfun = ASM_cbrt; break; 

	case 5: cuberootfun = N_cbrt3; break;
	case 6: cuberootfun = N_cbrt4; break;
	case 7: cuberootfun = N_dcbrt4; break;

	case 8: cuberootfun = N_rcbrt4; break;
	case 9: cuberootfun = C_cbrt2; break;
	case 10: cuberootfun = C_cbrt5; break;
	case 11: cuberootfun = BSD_cbrt; break;
	case 12: cuberootfun = gnu_cbrt; break;
	case 13: cuberootfun = sun_cbrt; break;
	case 14: cuberootfun = ret_x; break;
	default:
		cuberootfun = Ref_cbrt3; break;
	}
}

// private copy of SolveCubic for benchmarking cuberoots in CubicSolver without inlining 
// invokes the cbrt routine saved into cuberootfun() as above

double SolveCubicBM(double a, double b, double c)
{
	// this version follows the same classic algebra as in Appendix A
	// solves a cubic of the form x^3 + a.x^2 + b.x + c = 0
	// it is well behaved provided that a^3/c < 13.5 so that a^6 doesn't dominate
	// The ratio a^3/c is typically about 133*sin(M)^2 in the Kepler problem.
	// The fact that coefficients a and c are in phase and f3, b in quadrature largely protects us
	// from nasty surprises - but this simple routine is not entirely reliable in more tricky cases.
	// Production code should use the faster optimised routine SolveCubicOpt instead

	double q, r, r2, d, s, t;
	q = (3 * b - a * a) / 9;
	r = (9 * a * b - 27 * c - 2 * a * a * a) / 54;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{ // single real root
		if (r2 < d * 1e-4)
		{
			s = 2 * r / (3 * cuberootfun(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a / 3.0; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cuberootfun(r + d); else s = -cuberootfun(d - r);
			if (s != 0) t = s - q / s - a / 3.0; else t = -a;
		}
	}
	else
	{ // three real roots so have to choose the right one
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t) - a / 3;
	}
	return t;
}


#ifdef _MSC_VER
//#define TOY
//#define ASM80

double ASM_cbrt(double x)
{
	// home brew cbrt about twice as fast as pow(x,1.0/3) or sys_cbrt only defined for positive x
	// Noddy version runs x = 0..1   max error 5e-5 + Halley => 1e-14
	// Improved by addition of magic x^4 correction now good to 23 bits & full machine precision.

	
	
#ifdef _M_IX86
	double s, t;
	int nexp=0;
	__asm{
        fld1
		fld qword ptr [x]
		fxtract
//		fsub qword ptr[r3]  // -1/3 to 2/3 better way found on 0..1 !
		fsub st, st(2)
		fmul qword ptr[r3] // x/3 exp 1

		// simple linear and scale
#ifdef TOY
		faddp st(2),st
		fmul qword ptr[r3]  // exp/3 f(x)
		fist dword ptr[z]
#else
// Pade disabled for HLL testing

		fld st(0)
        fmul st, st(1)    // (x/3)^2 x/3  exp 1

// Pade (1+x)^(1/3) = 1 + x/3 - (x/3)^2*(1+x/9)/(2x/3+1) - 0.000662*x^4

        fld st(1)			// x/3 (x/3)^2 x/3 exp 1
		fmul qword ptr[r3]  // x/9
		fadd st, st(4)      // 1+x/9 (x/3)^2 x/3 exp 1
		fld st(2)			// x/3 1+x/9 x^2/9 x/3 exp 1
		fadd st, st(3)      // 2x/3 1+x/9 x^2/9 x/3 exp 1
		fadd st, st(5)      // 1+2x/3 1+x/9 x^2/9 x/3 exp 1
		fdiv                // rat x^2/9 x^2/9 x/3 exp 1
// was		fmulp st(1),st      // x^2.rat/9 x/3 exp 1
// magic x^4 correction
		fld  st(1)		// s^2/9 rat x^2/9 x/3 1
		fmul dword ptr [x4magic]      // magic.s^2 rat x^2/9 x/3 1
		faddp st(1),st				// rat+m.s^2 x^2/9 x/3 1
		fmulp st(1),st				// (rat+m.s^2)*x^2/9 x/3 1
// end magic
		fsubp st(1), st     // x/3-x^2/9 exp 1
		faddp st(2),st      // exp 1+f(x)
		fist dword ptr [nexp]
		fmul qword ptr[r3]  // exp/3 f(x)
//		fist dword ptr [y]
#endif
		fxch st(1)		   // f(x) exp/3
		fscale			   // crbrt, exp/3
		fstp qword ptr[s]  // save
		fstp st(0)         // drop
	}
    nexp = nexp % 3;
//	nexp -= 3*y;
//	s = s*fudge[nexp+2];  // rescale for fractional part
	s = s*rcbrt2n[nexp];
#ifndef ASM80
    t = s*s*s;
//	s *= (t+x+x)/(t+t+x);  // apply Halley's method 
	s = s + s * (x - t) / (t + t + x);
#else
	FPU80_on();  // refine to 80 bits x87 code
	__asm {
		fld qword ptr [s]
		fld st(0)		// s s
		fmul st,st(1)
		fmul st, st(1)	// s^3 s
		fld st(0)		// s^3 s^3 s
		fadd st(0),st	// 2s^3 s^3 s
		fld qword ptr [x] // x 2s^3 s^3 s
		fadd st(1),st
		fsubp st(2),st // 2s^3+x s^3-x s
		fdiv
		fmul st,st(1)
		fsubp st(1),st
		fstp qword ptr[s]


	}
	FPU80_off();

#endif
#else
	double s;
	s = cbrt(x);
#endif
	return s;
}

#else
double ASM_cbrt(double x)
{
	return cbrt(x);
}

double ASM_cbrt2(double x)
{
	return cbrt(x);
}
#endif

double Ref_cbrt(double x)
{   
	return pow(x,1.0/3);  // will inline on most compilers
}

double Ref_cbrt2(double x)
{
	if (x)	return exp(log(x)/3); else return x;  // will often inline
}

double Ref_cbrt3(double x)
{  // this is current best buy fast and accurate
	double t, y;
	if (x) y = exp(log(x) / 3); else return x;
	
	t = y*y*y;
	y = y - y * (t - x) / (2 * t + x);  // Halley is good enough
//	y = y / 2 + y * x / 2 / t; NR not accurate enough
//	t = y * y * y;
// test Kahan's more accurate final step (it is better in exactly this form!)
//	t = (t - x) / x;
//	y = y - y * ((14.0 * t / 81 - 2.0 / 9) * t + 1.0 / 3) * t;
	return y;
}


union  myreal32 { float f32; int i32; unsigned int ui32; short s[2]; unsigned short us[2];};
union  myreal64 { double f64; float f32[2]; __int64 i64; int i32[2]; unsigned short us[4]; short s[4]; };


short rt3[256], rt3idx[256];
unsigned rt3mask[256];
float cbrt_2n[256];

void init_rt3()
{ short i, j;
 float cbrt2;
  cbrt2 = (float) Ref_cbrt(2.0);
  for (i=0; i<256; i++)
  {
	  j = (i-128)/3;
	  rt3[i] = j;
	  rt3idx[i] = (i-127)-3*j;
	  rt3mask[i] = 0x807f | ((0x7f+j)<<7);
  }
  cbrt_2n[127] = 1.0f;
  for (i=1; i<127; i++)
  {
	  cbrt_2n[127+i] = cbrt_2n[126+i]*cbrt2;
	  cbrt_2n[127-i] = cbrt_2n[128-i]/cbrt2;
  }
  cbrt_2n[128] = cbrt_2n[127]*cbrt2;
}

double N_cbrt3(double x)
{
	// now working decently fast
	M1union myreal32 y;
	float z;
	double t,s;
	int exp;
	
#ifdef _DEBUG
	M1union myreal32 target;
	target.f32 = (float) ASM_cbrt(x); // (float) 1 + (y.f32-1)/3.0;
#endif
    y.f32 = (float) x;
	exp = y.us[1]>>7;
	y.us[1] |= 0x3f80;
	y.i32 &= 0x3fffffff;
	z = (y.f32 -1.0f)/3.0f;
	z = 1.0f + z-z*z*(x4magic*z*z+(1.0f+z/3)/(1.0f+z+z));
	z *= cbrt_2n[exp];
	s = z;
//	return s;  // Pade fixup almost to single precision
	t = s*s*s;
	s = s + s * (x - t) / (t + t + x); // better Halley
//	s = s*(t+x+x)/(x+t+t); // old Halley
	return s;
}


double C_cbrt2(double x)
{
	// still not quite right - very odd timings
	short i, nexp;
	M1union myreal32 z;
	float f;
	double s, t;
#ifdef _DEBUG
	M1union myreal32 ref;
	ref.f32 = (float) Ref_cbrt3(x);
#endif
	z.f32 = (float) x;
	z.i32 -= 0x3f800000;
	i = z.s[1]>>7;
	z.i32 = z.i32/3;
	nexp = (z.s[1] & 0xff80);
	i = i-(nexp>>7)*3; // remainder
	z.i32 = (z.i32 & 0x3fffffff) | 0x3F800000;
	if (i)
	{
		z.i32 -= i*0x2AAAAA;
	}
	f = z.f32-1;
	z.f32 = z.f32 - f * f * (x4magic * f * f + (1.0f + f / 3) / (1.0f + f + f));
    z.s[1] += nexp;
	s = z.f32*realfudge[i+2];
	if (s==0.0) s = sqrt(x);
	t = s*s*s;
	s = s + s * (x - t) / (t + t + x);
	return s;
}

double N_cbrt(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance
	// benchmarks well but no good in the real application SolveCubic - unclear why
	// doesn't handle sub normal numbers well

	M1union myreal32 y;
	float z;
	double s,t;
	int exp, man, nexp;
	volatile M1union myreal64 temp;
#ifdef _DEBUG
	M1union myreal32 target;
	target.f32 = (float) pow(x, (1.0/3));
#endif
	if (x == 0) return x;
	y.f32 = (float) x;
	exp = ((y.us[1] & 0x7f80))-0x3f80;
	nexp = exp*0x5555;
	nexp += 0x1000; 
	if (nexp < 0) nexp += 0x0080000;
    exp = exp >> 7;
	exp = exp%3;
	man = y.ui32 & 0x007ffffc;
	temp.i64 = (__int64) man * 0x55555555;

#ifdef _DEBUG
	temp.i32[0]  = temp.i32[1] | 0x3f800000;
#endif
	temp.i32[1] |= 0x3f800000;
	z = temp.f32[1] - 1;
	z = 1 + z-z*z*(x4magic*z*z+(1+z/3)/(1+z+z));
	temp.f32[1] = rcbrt2n[exp]*z;
	temp.i32[1] += (int)(nexp & 0xff800000);

s = (double) temp.f32[1];
if (s == 0.0)
{
	s = sqrt(sqrt(x));
	t = sqrt(sqrt(s));
	s = s * t; // (x^(5/16)
}
 	t = s*s*s;
//	s *= (t+x+x)/(x+t+t);  // much worse error 2x better alternative below
	s = s + s * (x - t) / (t + t + x);
	return s;
}

double N_rcbrt(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance
	// benchmarks well but no good in the real application SolveCubic - unclear why
	// doesn't handle sub normal numbers well

	M1union myreal32 y;
	float z;
	int exp, man, nexp;
	volatile M1union myreal64 temp;
#ifdef _DEBUG
	M1union myreal32 target;
	target.f32 = (float)pow(x, (1.0 / 3));
#endif
	if (x == 0) return x;
	y.f32 = (float)x;
	exp = ((y.us[1] & 0x7f80)) - 0x3f80;
	nexp = exp * 0x5555;
	nexp += 0x1000;
	if (nexp < 0) nexp += 0x0080000;
	exp = exp >> 7;
	exp = exp % 3;
	man = y.ui32 & 0x007ffffc;
	temp.i64 = (__int64)man * 0x55555555;

#ifdef _DEBUG
	temp.i32[0] = temp.i32[1] | 0x3f800000;
#endif
	temp.i32[1] |= 0x3f800000;
	z = temp.f32[1] - 1;
	z = 1 + z - z * z * (x4magic * z * z + (1 + z / 3) / (1 + z + z));
	temp.f32[1] = rcbrt2n[exp] * z;
	temp.i32[1] += (int)(nexp & 0xff800000);
	return (double)temp.f32[1];  // floating point real version
}

#define Z32

double N_cbrt4(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance
    // this version bit twiddles 64 bit reals in i32 variables
	// initial estimate almost good to fp32 with 21 bit accurate mantissa

	M1union myreal64 y;
	float z;
	double s, t;
	int man, nexp;
#ifdef _DEBUG
	M1union myreal64 target64;
	M1union myreal32 target;
	target64.f64 = Ref_cbrt3(x); // (float) 1 + (y.f32-1)/3.0;
	target.f32 = (float)target64.f64;
#endif
	if (x == 0) return x;
	s = 1;
	y.f64 = x;
	man = (y.i32[1] - 0x3ff00000);				  // remove f64 bias
	y.i32[1] = (((int)(man & 0xfffffffd))/ 3);	  // prevent -1, -2 rounding to 0
	y.i32[0] = ((man / 3) * 8) + 0x3f800000;	  // not too bad here
	nexp = y.i32[1] & 0xfff00000;

	man = (man - 3 * nexp) & 0x00300000;       // compute remainder

	y.i32[1] = ((int) (8*y.i32[1]) & 0x3fffffff)  | 0x3f800000; // force to 1+x 32 bit real format & zap sign
	if (man)
	{
		if (man > 0x00100000)
		{
			y.i32[1] = y.i32[1] - 0x00555555;  // was 0x00555555;
			s = dcbrt2n[2]; 
		}
		else
		{
			y.i32[1] = y.i32[1] - 0x002aaaaa; 
			s = dcbrt2n[1]; 
		}
	}
	z = y.f32[1] - 1;
	z = 1.0f + z - z * z * (x4magic * z * z + (1.0f + z / 3) / (1.0f + z + z));
 	y.f64 = s*z;
	y.i32[1] += nexp;
	s = y.f64; 
	t = s * s * s;
	s = s + s * (x - t) / (t + t + x);
	return s;
	// test Kahan's more accurate final step (it is better only in exactly this form!)
	t = (t - x)/x;
	s = s - s * ((14.0 * t / 81 - 2.0 / 9) * t + 1.0 / 3) * t;
	return s;
}



double N_rcbrt4(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance
	// this version bit twiddles 64 bit reals in i32 variables
	// initial estimate almost good to fp32 with 21 bit accurate mantissa

	M1union myreal64 y;
#ifdef Z32
	float z;
#endif
	double s, t;
	int man, nexp;
#ifdef _DEBUG
	M1union myreal64 target64;
	M1union myreal32 target;
	target64.f64 = 1/Ref_cbrt3(x); // (float) 1 + (y.f32-1)/3.0;
	target.f32 = (float)target64.f64;
#endif
	if (x == 0) return x;
	s = 1;
	y.f64 = x;
	man = (y.i32[1] - 0x3ff00000);              // remove f64 bias
	y.i32[1] = (((int)(man & 0xfffffffd)) / 3); // to avoid -1, -2 rounding to 0
	y.i32[0] = ((man / 3) * 8) + 0x3f800000;    // not too bad here
	nexp = y.i32[1] & 0xfff00000;
	man = (man - 3 * nexp) & 0x00300000;       // compute remainder
#ifdef Z32
// 32 bit	
 y.i32[1] = ((int)(8 * y.i32[1]) & 0x3fffffff) | 0x3f800000; // force to 1+x 32 bit real format & zap sign
#else
// 64 bit
	y.i32[1] = ((int)y.i32[1] & 0x3fffffff) | 0x3ff00000; // force to 1+x 64 bit form and zap sign
#endif
	if (man)
	{
		if (man > 0x00100000)
		{
#ifdef Z32
			y.i32[1] = y.i32[1] - 0x00555555; // 32 bit
#else
			y.i32[1] = y.i32[1] - 0x000aaaaa;  // 64bit 32 was 0x00555555;
#endif
			s = 1/dcbrt2n[2];
		}
		else
		{
#ifdef Z32
			y.i32[1] = y.i32[1] - 0x002aaaaa;  // 32 bit
#else
			y.i32[1] = y.i32[1] - 0x00055555;  // 32bit was 0x002aaaaa;
#endif
			s = 1/dcbrt2n[1];
		}
	}
#ifdef Z32
	//  32 bit version
	z = y.f32[1] - 1;
	z = 1.0f - z + z * z *(0.014f*z*z + (z + 13.20952237f) / (15.75f * z + 6.610273458f)); // reciprocal cbrt good to <1e-6
//	y.f32[1] = s * z;
	y.f64 = s * z;
#else	
	dz = y.f64 - 1;
	dz = 1 - dz + dz * dz * (0.013*dz*dz+(dz + 13.20952237) / (15.75 * dz + 6.610273458)); // reciprocal cbrt good to <1e-6
	y.f64 = s * dz;
#endif

	y.i32[1] -= nexp;
	s = y.f64;
//	return 1.0 / s;
	t = s * s * s;
	x = x / 3.0;
	s = s * (4.0/3 - x*t);
	t = s + s * t / 3;
	t = s * s * s;
	s = s+s * (1.0/3 - x* s * s * s);
	t = s * s * s;
	return 1 / s;  // this division can be avoided but included to make the code like all others a cbrt().

}

double N_cbrt4a(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance

	M1union myreal64 y;
	float z;
	double s, t;
	int man, nexp;
#ifdef _DEBUG
	double *hack = (double *)  & y;
	M1union myreal64 cuberoot;
	//target.f64 = ASM_cbrt(x); // (float) 1 + (y.f32-1)/3.0;
	cuberoot.f64 = pow(x, (1.0 / 3)); 
#endif
	s = 1;
	if (x == 0) return x;
	y.f64 = x;
	man = y.i32[1];
	y.i32[1] = y.i32[1] / 3 - 0x15500000; // remove bias  +0x2aa00000;  // restore the bias
	man = (man ^ y.i32[1]) & 0x000c0000;
	nexp = y.i32[1] & 0xfff00000; // extract exponent
	y.i32[1] = (y.i32[1] & 0x3fffffff) | 0x3ff00000; // force mantissa to 1+x form
//	y.us[3] = (y.us[3] & 0x3fff) | 0x3ff0; // use shortest mask possible
	z = (float) y.f64 - 1.0f;
	if (man)
	{
		if (man == 0x0004) // 00000) // was (man > 0x00040000)
		{
			z -= 2.0f / 3; s = dcbrt2n[2];
		}
		else
		{
			z -= 1.0f / 3; s = dcbrt2n[1];
		}
	}

	z = 1.0f + z - z * z * (x4magic * z * z + (1.0f + z / 3) / (1.0f + z + z));
	y.f64 = (s * (double)z);
	y.i32[1] += nexp; // nexp is now signed -0x3ff00000; // restore exponent

//    return (double) y.f32; // check intermediate result
	s = y.f64;
	t = s * s * s;
	//	s *= (t+x+x)/(x+t+t);
	s = s + s * (x - t) / (t + t + x);
	return s;
}



double N_dcbrt4a(double x)
{
	// for speed ignore sign always positive here - relies heavily on IEEE FP structure
//	const int rthree = 0x55555555;
	M1struct myreal64 y;
	double s, t, z;
	int man, nexp;
#ifdef _DEBUG
	M1union myreal64 target;
	target.f64 = pow(x, (1.0 / 3));
#endif

	y.f64 = x;
	man = y.i32[1] - 0x3ff00000;
	y.i32[1] = man / 3;
	/*
		_asm {
			push eax
			push edx
			mov  eax, dword ptr [man]
			mov  edx, dword ptr [rthree]
			mul  edx
			mov  edx, dword ptr [y.i32+4]
			pop edx
			pop eax
		}
	*/
	nexp = y.i32[1] & 0xfff00000;
	man = (man - 3 * nexp) & 0xfff00000;
	y.i32[1] = (y.i32[1] & 0x3fffffff) | 0x3ff00000;

	if (man)
	{
		if (man > 0x00100000)
		{
			z = y.f64 - 5.0f / 3; t = dcbrt2n[2];
		}
		else
		{
			z = y.f64 - 4.0f / 3; t = dcbrt2n[1];
		}
	}
	else
	{
		z = y.f64 - 1.0f; t = dcbrt2n[0];
	}
	z = 1.0f + z - z * z * ((double)x4magic * z * z + (1.0f + z / 3) / (1.0f + z + z));
	y.f64 = t * z;
	y.i32[1] += nexp;
	//    return (double) y.f64; // check intermediate result
	s = y.f64;
	t = s * s * s;
	//s *= (t + x + x) / (x + t + t);  // * 4+ /
	s = s + s * (x - t) / (x + t + t); // * 3+ 1- /  2x more accurate!
	return s;
}

double N_dcbrt4(double x)
{
	// for speed ignore sign always positive here - relies heavily on IEEE FP structure

	M1struct myreal64 y;
	double s, t, z;
	__int64 man, nexp;
#ifdef _DEBUG
	M1union myreal64 target;
	target.f64 = pow(x, (1.0 / 3));
#endif
	//	exp = 0;
	y.f64 = x;
	man = y.i64 - 0x3ff0000000000000;
	y.i64 = man / 3;
	//	exp = _mul128(0x5555555555555555, y.i64, &nexp);
//	exp = 0x5555555555555555 * y.i64;
	nexp = y.i64 & 0xfff0000000000000;
	man = (man - 3 * nexp) & 0xfff0000000000000;
	y.i64 = (y.i64 & 0x3ffffffffffffffd) | 0x3ff0000000000000;
	if (man)
	{
		if (man > 0x0010000000000000)
		{
			z = y.f64 - 5.0 / 3; t = dcbrt2n[2];
		}
		else
		{
			z = y.f64 - 4.0 / 3; t = dcbrt2n[1];
		}
	}
	else
	{
		z = y.f64 - 1.0; t = dcbrt2n[0];
	}
	z = 1.0 + z - z * z * ((double)x4magic * z * z + (1.0 + z / 3) / (1.0 + z + z));
	y.f64 = t * z;
	y.i64 += nexp;

	//    return (double) y.f64; // check intermediate result
	s = y.f64;
	t = s * s * s;
	//s *= (t + x + x) / (x + t + t);  // * 4+ /
	s = s + s * (x - t) / (x + t + t); // * 3+ 1- /  2x more accurate!
	return s;
}


double N_dcbrt4_32(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance

	M1struct myreal64 y;
	double s, t, z;
	int man, nexp;
#ifdef _DEBUG
	M1union myreal64 target;
	target.f64 = pow(x, (1.0 / 3));
#endif
	y.f64 = x;
	man = y.i32[1] - 0x3ff00000;
	//y.i32[1] = man / 3;
	y.i64 = (__int64)man * 0x55555555;
	nexp = y.i32[1] & 0xfff00000;
	man = (man - 3 * nexp) & 0xfff00000; 
	y.i32[1] = (y.i32[1] & 0x3fffffff) | 0x3ff00000;
	if (man)
	{
		if (man > 0x00100000)
		{
			z = y.f64 - 5.0 / 3; t = dcbrt2n[2];
		}
		else
		{
			z = y.f64 - 4.0 / 3; t = dcbrt2n[1];
		}
	}
	else
	{
		z = y.f64 - 1.0; t = dcbrt2n[0];
	}

	z = 1.0 + z - z * z * ((double)x4magic * z * z + (1.0 + z / 3) / (1.0 + z + z));
	
	y.f64 = t * z;
	y.i64 += nexp;
	s = y.f64;
	t = s * s * s;
	s = s + s * (x - t) / (t + t + x);
	return s;
}


double N_rdcbrtNR(double x)
{
	// for speed ignore sign always positive here - relies on IEEE FP structure
	// only as fast as exp(log(x)/3) but a lot more work and very opaque.
	// scope to tidy up exp & nexp to avoid exp % 3 but disappointing performance
	M1struct myreal64 y;
	double s, t, z;
	__int64 man, nexp;
#ifdef _DEBUG
	M1union myreal64 target;
	target.f64 = pow(x, (1.0 / 3));
#endif
	y.f64 = x;
	man = y.i64 - 0x3ff0000000000000;
	y.i64 = man / 3;
	nexp = y.i64 & 0xfff0000000000000;
	man = (man - 3 * nexp) & 0xfff0000000000000; // >> 52;
	y.i64 = (y.i64 & 0x3fffffffffffffff) | 0x3ff0000000000000;
//	y.i64 = y.i64 | 0x3ff0000000000000;
	/*
	if (man)
	{
		if (man > 0x0010000000000000)
		{
			z = (y.f64 - 11.0 / 6)*6.0/11; t = dcbrt2n[2]*cbrt(11.0/6);
		}
		else
		{
			z = (y.f64 - 9.0 / 6)*6.0/9; t = dcbrt2n[1]*cbrt(1.5);
		}
	}
	else
	{
		z = (y.f64 - 7.0/6)*7/6; t = cbrt(7.0/6);
	}
	*/
	if (man)
	{
		if (man > 0x0010000000000000)
		{
			z = y.f64 - 5.0 / 3; t = dcbrt2n[2];
		}
		else
		{
			z = y.f64 - 4.0 / 3; t = dcbrt2n[1];
		}
	}
	else
	{
		z = y.f64 - 1.0; t = dcbrt2n[0];
	}
	if (z > 0)
		z = z;
	//z = 1.0 + z - z * z * ((double)x4magic * z * z + (1.0 + z / 3) / (1.0 + z + z));
	//z = (z * (z * 63*9 + 216*3) + 162)/(z * 3*(z *3* (27 - 3*z) + 162)+162);
	z =  (z * (z * (243.00063 - 27 * z) + 486) + 162)/(z * (z * 567 + 648) + 162) ;
	//z = (z * (z * 63 + 216) + 162) / (z * (z * (27 - z) + 162) + 162);
	//	y.f64 = dcbrt2n[exp] * z;
	y.f64 = z/t;
	y.i64 += nexp;
//old	y.i64 &= 0x000fffffffffffff;
//old	y.i64 |= nexp + 0x4000000000000000; // restore exponent
//    return (double) y.f64; // check intermediate result
	s = y.f64;
	t = s * s * s;
	s = s*(2 +t*x) / 3;
	//s = (t + t + x) / (3 * s * s);
	return s;
}
/*
 * Copyright (c) 1985, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * %sccs.include.redist.c%
 */

#ifndef lint
//static char sccsid[] = "@(#)cbrt.c	8.1 (Berkeley) 06/04/93";
#endif /* not lint */

//#include <sys/cdefs.h>

/* kahan's cube root (53 bits IEEE double precision)
 * for IEEE machines only
 * coded in C by K.C. Ng, 4/30/85
 *
 * Accuracy:
 *	better than 0.667 ulps according to an error analysis. Maximum
 * error observed was 0.666 ulps in an 1,000,000 random arguments test.
 *
 * Warning: this code is semi machine dependent; the ordering of words in
 * a floating point number must be known in advance. I assume that the
 * long interger at the address of a floating point number will be the
 * leading 32 bits of that floating point number (i.e., sign, exponent,
 * and the 20 most significant bits).
 * On a National machine, it has different ordering; therefore, this code
 * must be compiled with flag -DNATIONAL.
 */
#if !defined(vax)&&!defined(tahoe)

static const unsigned long
B1 = 715094163, /* B1 = (682-0.03306235651)*2**20 */
B2 = 696219795; /* B2 = (664-0.03306235651)*2**20 */
static const double
C = 19. / 35.,
D = -864. / 1225.,
E = 99. / 70.,
F = 45. / 28.,
G = 5. / 14.;

#define national

double BSD_cbrt(double x)
{
	double r, s, t = 0.0, w;
	unsigned long* px = (unsigned long*)&x,
		* pt = (unsigned long*)&t,
		mexp, sign;

#ifdef national /* ordering of words in a floating points number */
	const int n0 = 1, n1 = 0;
#else	/* national */
	const int n0 = 0, n1 = 1;
#endif	/* national */

	mexp = px[n0] & 0x7ff00000;
	if (mexp == 0x7ff00000) return(x); /* cbrt(NaN,INF) is itself */
	if (x == 0.0) return(x);		/* cbrt(0) is itself */

	sign = px[n0] & 0x80000000; /* sign= sign(x) */
	px[n0] ^= sign;		/* x=|x| */


	/* rough cbrt to 5 bits */
	if (mexp == 0) 		/* subnormal number */
	{
		pt[n0] = 0x43500000; 	/* set t= 2**54 */
		t *= x; pt[n0] = pt[n0] / 3 + B2;
	}
	else
		pt[n0] = px[n0] / 3 + B1;


	/* new cbrt to 23 bits, may be implemented in single precision */
	r = t * t / x;
	s = C + r * t;
	t *= G + F / (s + E + D / s);

	/* chopped to 20 bits and make it larger than cbrt(x) */
	pt[n1] = 0; pt[n0] += 0x00000001;


	/* one step newton iteration to 53 bits with error less than 0.667 ulps */
	s = t * t;		/* t*t is exact */
	r = x / s;
	w = t + t;
	r = (r - t) / (w + r);	/* r-t is exact */
	t = t + t * r;


	/* retore the sign bit */
	pt[n0] |= sign;
	return(t);
}
#endif

// obtained from https://codebrowser.dev/glibc/glibc/sysdeps/ieee754/dbl-64/s_cbrt.c.html

/* Compute cubic root of double value.
   Copyright (C) 1997, 2012-2022 Free Software Foundation, Inc.
   Contributed by Dirk Alboth <dirka@uni-paderborn.de> and
   Ulrich Drepper <drepper@cygnus.com>, 1997.
   This file is free software: you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as
   published by the Free Software Foundation, either version 3 of the
   License, or (at your option) any later version.
   This file is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.
   You should have received a copy of the GNU Lesser General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

//#include <config.h>

   /* Specification.  */

#include <math.h>

/* MSVC with option -fp:strict refuses to compile constant initializers that
   contain floating-point operations.  Pacify this compiler.  */
#if defined _MSC_VER && !defined __clang__
# pragma fenv_access (off)
#endif

   /* Code based on glibc/sysdeps/ieee754/dbl-64/s_cbrt.c.  */

#define CBRT2 1.2599210498948731648             /* 2^(1/3) */
#define SQR_CBRT2 1.5874010519681994748         /* 2^(2/3) */

static const double factor[5] =
{
  1.0 / SQR_CBRT2,
  1.0 / CBRT2,
  1.0,
  CBRT2,
  SQR_CBRT2
};


double gnu_cbrt(double x)
{
	if (isfinite(x) && x != 0.0)
	{
		double xm, ym, u, t2;
		int xe;

		/* Reduce X.  XM now is an range 1.0 to 0.5.  */
		xm = frexp(fabs(x), &xe);

		u = (0.354895765043919860
			+ ((1.50819193781584896
				+ ((-2.11499494167371287
					+ ((2.44693122563534430
						+ ((-1.83469277483613086
							+ (0.784932344976639262 - 0.145263899385486377 * xm)
							* xm)
							* xm))
						* xm))
					* xm))
				* xm));

		t2 = u * u * u;

//		ym = u * (t2 + 2.0 * xm) / (2.0 * t2 + xm) * factor[2 + xe % 3];  // this form is less accurate MTB 19/1/2023
		ym = (u + u*(xm-t2)/(t2+t2+xm)) * factor[2 + xe % 3];

		return ldexp(x > 0.0 ? ym : -ym, xe / 3);
	}
	else
		return x + x;
}


// obtained from https://cgit.freebsd.org/src/tree/lib/msun/src/s_cbrt.c
/* origin: FreeBSD /usr/src/lib/msun/src/s_cbrt.c */
/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice
 * is preserved.
 * ====================================================
 *
 * Optimized by Bruce D. Evans.
 */
 /* cbrt(x)
  * Return cube root of x
  */

#include <math.h>
#include <stdint.h>

//static const uint32_t
//B1 = 715094163, /* B1 = (1023-1023/3-0.03306235651)*2**20 */
//B2 = 696219795; /* B2 = (1023-1023/3-54/3-0.03306235651)*2**20 */

/* |1/cbrt(x) - p(x)| < 2**-23.5 (~[-7.93e-8, 7.929e-8]). */
const double
P0 = 1.87595182427177009643,  /* 0x3ffe03e6, 0x0f61e692 */
P1 = -1.88497979543377169875,  /* 0xbffe28e0, 0x92f02420 */
P2 = 1.621429720105354466140, /* 0x3ff9f160, 0x4a49d6c2 */
P3 = -0.758397934778766047437, /* 0xbfe844cb, 0xbee751d9 */
P4 = 0.145996192886612446982; /* 0x3fc2b000, 0xd4e4edd7 */

double sun_cbrt(double x)
{
	union { double f; uint64_t i; } u = { x };
	double_t r, s, t, w;
	uint32_t hx = u.i >> 32 & 0x7fffffff;

	if (hx >= 0x7ff00000)  /* cbrt(NaN,INF) is itself */
		return x + x;

	/*
	 * Rough cbrt to 5 bits:
	 *    cbrt(2**e*(1+m) ~= 2**(e/3)*(1+(e%3+m)/3)
	 * where e is integral and >= 0, m is real and in [0, 1), and "/" and
	 * "%" are integer division and modulus with rounding towards minus
	 * infinity.  The RHS is always >= the LHS and has a maximum relative
	 * error of about 1 in 16.  Adding a bias of -0.03306235651 to the
	 * (e%3+m)/3 term reduces the error to about 1 in 32. With the IEEE
	 * floating point representation, for finite positive normal values,
	 * ordinary integer divison of the value in bits magically gives
	 * almost exactly the RHS of the above provided we first subtract the
	 * exponent bias (1023 for doubles) and later add it back.  We do the
	 * subtraction virtually to keep e >= 0 so that ordinary integer
	 * division rounds towards minus infinity; this is also efficient.
	 */
	if (hx < 0x00100000) { /* zero or subnormal? */
		u.f = x * 0x1p54;
		hx = u.i >> 32 & 0x7fffffff;
		if (hx == 0)
			return x;  /* cbrt(0) is itself */
		hx = hx / 3 + B2;
	}
	else
		hx = hx / 3 + B1;
	u.i &= 1ULL << 63;
	u.i |= (uint64_t)hx << 32;
	t = u.f;

	/*
	 * New cbrt to 23 bits:
	 *    cbrt(x) = t*cbrt(x/t**3) ~= t*P(t**3/x)
	 * where P(r) is a polynomial of degree 4 that approximates 1/cbrt(r)
	 * to within 2**-23.5 when |r - 1| < 1/10.  The rough approximation
	 * has produced t such than |t/cbrt(x) - 1| ~< 1/32, and cubing this
	 * gives us bounds for r = t**3/x.
	 *
	 * Try to optimize for parallel evaluation as in __tanf.c.
	 */
	r = (t * t) * (t / x);
	t = t * ((P0 + r * (P1 + r * P2)) + ((r * r) * r) * (P3 + r * P4));

	/*
	 * Round t away from zero to 23 bits (sloppily except for ensuring that
	 * the result is larger in magnitude than cbrt(x) but not much more than
	 * 2 23-bit ulps larger).  With rounding towards zero, the error bound
	 * would be ~5/6 instead of ~4/6.  With a maximum error of 2 23-bit ulps
	 * in the rounded t, the infinite-precision error in the Newton
	 * approximation barely affects third digit in the final error
	 * 0.667; the error in the rounded t can be up to about 3 23-bit ulps
	 * before the final error is larger than 0.667 ulps.
	 */
	u.f = t;
	u.i = (u.i + 0x80000000) & 0xffffffffc0000000ULL;
	t = u.f;

	/* one step Newton iteration to 53 bits with error < 0.667 ulps */
	s = t * t;         /* t*t is exact */
	r = x / s;         /* error <= 0.5 ulps; |r| < |t| */
	w = t + t;         /* t+t is exact */
	r = (r - t) / (w + r); /* r-t is exact; w+r ~= 3*t */
	t = t + t * r;       /* error <= 0.5 + 0.5/3 + epsilon */
	return t;
}

double C_cbrt5(double x)
{
	// sqrt is now so fast that nested sqrt s to make the binary representation
	// of 1/3 = 00101010101 binary becomes another novel starter!
	// I suspect Intel's cbrt uses a variant of this approach

	double rt2x, rt4x, s, t;
	if (x == 0) return x;
	/* almost but not quite good enough
	rt2x = sqrt(x);
	rt4x = sqrt(rt2x);
	s = 1.28*rt4x*(1+32.9*rt4x)/(6.5+27.4*rt4x);
*/
	rt2x = sqrt(sqrt(x));
	rt4x = sqrt(sqrt(rt2x));
	s = rt2x * rt4x;
	if ((x < 1e-14) || (x>1e20))
	{
		t = sqrt(sqrt(rt4x));
		s = s * t*sqrt(sqrt(t));
	}
	t = s*s*s;
	s += s * (x - t) / (t + t + x);
	t = s*s*s;
    rt2x = s * (x- t) / (t + t + x);
//	n = (t-x); // Kahan's other trick
//	d = 2 * t + x;
//	rt4x = n * s * d / (d * d - s * n * (3 * s * d + n));
//	s -= rt4x;
	s += rt2x;
	t = s * s * s;
	s += s * (x - t) / (t + t + x);
	t = s * s * s; // debugging hook (optimiser will zap)
	return s;
}

void Test_cbrt(int i, double x)
{
		double  mc, nc, pc;
		pc = Ref_cbrt3(x); // as good a reference as any fastest and most accurate on MS C++
		nc = C_cbrt2(x);
		mc = N_dcbrt4a(x);
		mc = N_rcbrt4(x);
		printf("%-3i %9.6g %12.10g %12.10g %11.3e %18.14g %11.3e\n", i, x, pc, nc, pc-nc, mc, pc-mc);
}

// stubs left over from very early testing

void QT_cbrt2()
{
	int i;
	double x, rx;
	x = 1.0;
	rx = 0.5;
	for (i=0; i < 8; i++) 
	{
		Test_cbrt(i, x);
		x += x;
	}
	for (i=-1; i > -8; i--)
		{
			Test_cbrt(i, rx);
			rx *= 0.5;
	}
}

void QT_cbrt()
{
	int i;
	double  x; 
	x = 0.15625; //  / 8 / 8;
	printf("2^N	 x \t  pow(x,1/3)	N_cbrt	  err \t\t new_cbrt 	  err\n");
	QT_cbrt2();
//	x = 1.0;
	for (i=-12; i< 10;i++)
	{
		Test_cbrt(i, 0.75*x);  // check handover
		Test_cbrt(i, 0.999*x);
		Test_cbrt(i, x);
		Test_cbrt(i, 1.25*x);
		Test_cbrt(i, 1.5*x);
		x = x+x;
	}  
}
