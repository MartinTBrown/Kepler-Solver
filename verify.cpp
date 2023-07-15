//  KeplerSolver - solves Kepler's equation using novel cubic algorithm
//
//  This file:
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


#include "stdafx.h"
#include "cuberoot.h"   // GetCubeRoot
#include "deltas.h"     // NR, NRT, Halley, HalleyT etc
#include "intel.h"      // Kepler_F80 & Gooding_Fixup
#include "solver.h"		// cubic solver
#include "starter.h"    // Basic/Reference
#include "tests.h"      // GetTest

bool refine;
double (*vcbrt)(double);
double (*ref1)(double);
double (*fun1)(double);
double (*ref2)(double, double);
double (*fun2)(double, double);
double (*ref3)(double, double, double);
double (*fun3)(double, double, double);

void SetVerifyFlag(bool f)
{
	refine = f;
}


void SetVerifyRef1(int i)
{
	SetCubeRoot(i);
	ref1 = GetCubeRoot(); 
}

void SetVerifyFun1(int i)
{
	SetCubeRoot(i);
	fun1 = GetCubeRoot();
}

void SetVerifyRef2(int i)
{
	ref2 = GetTest(i); 
}

void SetVerifyFun2(int i)
{
	fun2 = GetTest(i);
}

double Verify_Any2(double e, double M)
{
	return (*fun2)(e,M)-(*ref2)(e,M);
}
	

double Verify_NRT(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	return FLM_NR(e,M,E)-NRT(e, M, E, tan(E));
}

double Verify_HalleyT(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	return Classic_Halley(e,M,E)-HalleyT(e, M, E, tan(E));
}

double Verify_D4T(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	return FLM_D4(e,M,E)-FLM_D4T(e, M, E, tan(E));
}

double Verify_Reference(double e, double M)
{
	double E;
	E = MTB_Reference(e,M);
	return M + e*sin(E)-E;      // check solution for being close to zero
}

double Verify_Kepler_f80(double e, double M)
{
	double E;
	E = MTB_Reference(e, M);
	return Kepler_f80(e, M, E);      // check solution for being close to zero
}

double Verify_Gooding_Fixup(double e, double M)
{
	double E;
	E = MTB_Reference(e, M);
	if ((M > 1.0) || (e < 0.7)) return 0;
	return Gooding_Fixup(e, M, E);      // check solution for being close to zero
}

double Verify_Gooding_Fixup80(double e, double M)
{
	double E;
	E = MTB_Reference(e, M);
	if ((M > 1.0) || (e < 0.7)) return 0;
	return Gooding_Fixup80(e, M, E);      // check solution for being close to zero
}

double Verify_Symmetry(double e, double M)
{   
//	return MTB_Reference(e,M)+MTB_Reference(e,-M);
	return MTB_Basic(e,M)+MTB_Basic(e,-M);
}

double x_from_eM(double e, double M)
{
	return M / (1e-99 + e);
}

double Verify_Cbrt(double e, double M)
{   
//	return abs(ASM_cbrt(M))-Ref_cbrt(abs(M));
	double t, y;
double E = x_from_eM(e, M);
	double x = (*fun1)(E);
	t = x*x*x;            // compute the cube and relative error

//	if (E) y = 1 - t / E; else y = 0;
	if (E) y = (E - t) / E; else y = 0;
	if (abs(y) > 1e-15)
	  x = (*fun1)(E);        // to examine failures	   
	else
		y = y;    
	if (E) return 1 - t/E;  // relative error
	else return 0; 
}

// Below are various mathematical identities and checks of library function fidelity
// combined SinCos in MS SSE2 library fails this quite badly 4x worse than Sin, Cos!

double Verify_qSin(double e, double M)
{
	double s, t, x;
	x = M - e;
	s = sin(x/2);
	t = 1 - s;
	s = s*sqrt(t*(1+s)); // looking for a construct the optimiser won't contract to 1-s*s (which fails badly)
	s += s;
	return s-sin(x);
}

// #define OPT

double Verify_Q3R2(double e, double M)
{
	double a, b, c, e2, f3, q, r, d;
	e2 = e * e;
#ifdef OPT
	f3 = 1.0 / ((60 + 3 * e2) * sin(e) - e * (60 - 7 * e2));  // divides are so slow and some compilers so stupid (manually optimised)
	a = -(60 + 3 * e2) * cos(e) * f3;
	b = 60 * (sin(e) - e) * f3;
	c = -60 * cos(e) * f3;
#else
	d = pi / 2 - e;
	f3 = 1.0 / ((60 + 3 * e2) * cos(d) - e * (60 - 7 * e2));  // divides are so slow and some compilers so stupid (manually optimised)
	a = -(60 + 3 * e2) * sin(d) * f3;
	b = 60 * (cos(d) - e) * f3;
	c = -60 * sin(d) * f3;
#endif
	q = (3 * b - a * a) / 9;
	r = (9 * a * b - 27 * c - 2 * a * a * a) / 54;
	d = q * q * q/(r*r) + 1;
	return d;

}

double SpeedTest_Cubic(double e, double M)
{
#ifdef FAST
	return SolveCubicOpt(e,M, pi);
#else
	return SolveCubic(e, M, pi);
#endif
}


double SpeedTest_CubicBM(double e, double M)
{
	return SolveCubicBM(e,M, pi);
}

double Verify_Cubic(double e, double M)
{
	double a,b,c, d, t, f, df, ddf, rf;
	a = e;
	b = M;
	c = 0.01;
	c = e / 1.05; // was 0.01
/*
//  Original test below proved too difficult to interpret so simpler one above substituted

	e = (e+1)/2; // undo prescaling of e for generic brutal test
	e2 = e*e;    // replicate the coefficients for the Kepler problem
	f = (60+3*e2)*cos(M)-e*(60-7*e2);
    a = -(60+3*e2)*sin(M)/f;
	b = 60*(cos(M)-e)/f;
	c = -60*sin(M)/f;
*/	
//	if (!GetN()) 
		t = SolveCubic(a,b,c);
//	else 
//	    t = SolveCubicOpt(a,b,c);
	f = c+t*(b+t*(a+t));
	df = b + t * (2 * a + 3 * t);
	if (df) f = f / df;
	if (abs(f)>1e-15)
	{  // catch any bad cases to investigate further
//		if (!GetN())
		  t = SolveCubic(a,b,c);
//		else
//		  t = SolveCubicOpt(a,b,c);
		rf = c+t*(b+t*(a+t));
		df = b+t*(2*a+3*t);
		ddf = a + 3 * t; // scaled by 1/2
		if (df) d = rf/df;
//		t = t-df; // NR
//		df = d/(1+d*ddf); // Halley

		if (df) df = rf * df / (df * df + rf * ddf);
		t = t - df;
		rf = c+t*(b+t*(a+t));
  		if (rf)
		{
		df = b+t*(2*a+3*t);
		ddf = a + 3 * t;
		//if (df) df = rf/df;
		if (df) df = rf * df / (df * df + rf * ddf);

		t = t-df;
		rf = c+t*(b+t*(a+t));
		if (rf==42.0) printf("I hate optimisers"); // must have a side effect or it will be optimised away
		}
	}
 
	return f;
}

double Verify_atan_tan(double e, double M)
{
	double x;
	x = (M - e*pi)/2;
	return atan(tan(x)) - x;  // 100%
}

double Verify_asin_sin(double e, double M)
{
	double x;
	x = (M - e*pi)/2;
	return asin(sin(x)) - x;
}

double Verify_acos_cos(double e, double M)
{
		double x;
	x = (M+e*pi)/2 ;
	return acos(cos(x)) - x;  // 100%
}

double Verify_tan_atan(double e, double M)
{
	double x;
	x = M - e;
	return tan(atan(x)) - x;  //  58.8% +/- 1.11e-16
}

double Verify_sin_asin(double e, double M)
{
	double x;
	x = M - e;
	x = x / pi;
	return sin(asin(x)) - x;  //  99.6% +/- 1.11e-16
}

double Verify_cos_acos(double e, double M)
{
	double x;
	x = M - e;
	x = x / pi;
	return cos(acos(x)) - x;  // 100%
}

double Verify_log_exp(double e, double M)
{
	double x;
	x = M - e;
	return log(exp(x)) - x;   // 100%
}

double Verify_exp_log(double e, double M)
{
	double x;
	x = abs(M - e)+1e-99;
	return exp(log(x)) - x;   // 100%
}

double Verify_sqrt_x2(double e, double M)
{
	double c, x;
	x = abs(M - e);
	c = sqrt(x); return c * c - x;  // 100%
}

double Verify_x2_sqrt(double e, double M)
{
	double c, x;
	x = abs(M - e);
	c = x * x; return sqrt(c) - x;  // 100%
}

double Verify_cbrt_x3(double e, double M)
{
	double x;
	x = abs(M - e);         // necessary only because my cbrt only valid for x>= 0
  	return cbrt(x*x*x) - x;
}

double Verify_x3_cbrt(double e, double M)
{
	double c, x;
	x = abs(M - e);
	c = cbrt(x); 
	return c * c * c - x;
}

double Verify_s2pc2(double e, double M)
{
	double s, c;
	double x;
	x = M - e;
	s = sin(x);
	c = cos(x);
	return 1 - s * s - c * c;

}

double Verify_s2x_2sc(double e, double M)
{
	double s, c;

	double x;
	x = M - e;
	s = sin(x / 2);
	c = sin(x / 2);
	return sin(x) - 2 * s * c;

}

double Verify_s2c2(double e, double M)
{
	double c, s, s2, x;
	x = M - e;
//	x = abs(x / pi);
//	if (x <= 0) return 0;
	s = sin(x);
	s2 = sin(x / 2);
	c = cos(x);
	return 1 - s * s - c * c;
	return x+1e-30*(1 - s * s - c * c); // 23.6% -4.44e-16 +6.66e-16  DEBUG 51% +/- 2.22e-16
	                                  // or 40.5% -4.44e-16 +3.33e-16
	//x = 2 * s2 * sqrt(1 - s2 * s2);
//	x = 2 * s2 * sqrt((1 - s2) * (1 + s2));  // 69.3% +/- 2.22e-16
	x = 2 * s2 * sqrt(1 - s2 * s2);  // 72% +/- 2.2e-16 (nearly +/- 1.1e-16)
	return s-x;
}

double Verify_s2c2a(double e, double M)
{
	double c, s, s2, x;
	x = M - e;
	s = sin(x);
	s2 = sin(x / 2);
	c = 1 - 2 * s2 * s2;
	return 1 - s * s - c * c;
}

double Verify_s2c2b(double e, double M)
{
	double c, s, s2, x;
	x = M - e;
	s = sin(x);
	s2 = sin(x / 2);
	s2 = 2 * s2 * s2;
	c =  s2*(s2-2);
	return - s * s - c ; // algebraic cancellation used
}


//	return atan(tan(x)) - x;  // 100%
//	return cos(acos(x)) - x;  // 100%
//  return exp(log(x)) - x;   // 100%
//  return log(exp(x)) - x;   // 100%
//	return sin(asin(x)) - x;  //  99.6% +/- 1.11e-16
//	return tan(atan(x)) - x;  //  58.8% +/- 1.11e-16
//	c = sqrt(x); return c * c - x;  // 100%
// 	x = abs(x); 	c = cbrt(x); return c * c * c - x;  
// 
// 	   Rather a soft test x<= pi as cbrt algorithms mostly fail at large x
// 
// 	   cbrt verification results ordered by %exact
// 186 gnu  48.8% +/- 8.88e-16
//  35 ref2 52.3% +/- 2.2e-16 exp(log(x)/3)
//  94 ref1 53.7% +/- 2.2e-16 pow(X,1/3)
//  35 ref3 54.7% +/-2.0e-16  ref2+Halley
// 143 MS   59.1% +/- 5.5e-16 
// 109 sun  65.5% +/- 4.4e-16
// 148 BSD  65.5% +/- 4.4e-16
//  53 MTB_dcbrt4  69.1% +/- 3.3e-16 (float version  ~ 20 cycles)

double Verify_atant(double e, double M)
{
	double x;
	x = M - e;
	return atan(tan(x)) - x;  // 100%
}

//  	x = abs(x); 	c = cbrt(x); return c * c * c - x;  
// 
// 	   Rather a soft test x<= pi as algorithms mostly fail at large x
// 
// 	   cycles results ordered by %exact
//		186 gnu  48.8% +/- 8.88e-16
//		 35 ref2 52.3% +/- 2.2e-16 exp(log(x)/3)
//		 94 ref1 53.7% +/- 2.2e-16 pow(X,1/3)
//		 35 ref3 54.7% +/-2.0e-16  ref2+Halley
//		143 MS   59.1% +/- 5.5e-16 
//		109 sun  65.5% +/- 4.4e-16
//		148 BSD  65.5% +/- 4.4e-16
//		 53 MTB_dcbrt4  69.1% +/- 3.3e-16 (float version  ~ 20 cycles)

double Verify_s2c2m1(double e, double M)
{
	double s, c, x;
	x = M - e;
	s = sin(x);
	c = cos(x);
	return 1 - s * s - c * c;
}


double Verify_2sc(double e, double M)
{
	double x, s;
	x = M - e;
	s = sin(x/2);
	return 2 * s * sqrt(1 - s * s) - sin(x);
}

double Verify_s2_c2(double e, double M)
{
	double x, c, s;
	x = M - e;
	s = sin(x / 2);
	c = cos(x / 2);
	return c*c-s*s - cos(x);
}

double Verify_tanat(double e, double M)
{
	double x;
	x = M - e;
	return tan(atan(x)) - x;  //  58.8% +/- 1.11e-16
}

double Verify_cosac(double e, double M)
{
	double x;
	x = M - e;
	x = abs(x) / pi;
	return cos(acos(x)) - x;  // 100%
}

double Verify_sinas(double e, double M)
{
	double x;
	x = (M-e) / pi;
	return sin(asin(x)) - x;  //  99.6% +/- 1.11e-16
}

double Verify_explog(double e, double M)
{
	double x;
	x = abs(M - e)+1e-99;
	return exp(log(x)) - x;   // 100%
}

double Verify_logexp(double e, double M)
{
	double x;
	x = M - e;
	return log(exp(x)) - x;   // 100%
}

double Verify_sqrt(double e, double M)
{
	double c, x;
	x = M - e;
	c = sqrt(x); return c * c - x;  // 100%
}

double Verify_cbrt(double e, double M)
{
	double c, x;
	x = M - e;
	x = abs(x); 	c = cbrt(x); return c * c * c - x;
}

double Verify_x3N(double e, double M)
{
	double x, y;
	const double twentyseven = 27.0;
	const double three = 3.0;
	x = M - e;
//	y = x * x * x / 27.0;
	y = x / 3.0;
	y = y * y * y;
	FPU80_on();
#ifdef _M_IX86
	_asm{

		FLD qword ptr [x]
//		FDIV qword ptr [three] // other way /3 then ^3
		FLD st(0)
		FMUL st,st(1)
		FMULP st(1),st
		FDIV qword ptr[twentyseven]  // / 27 
		FSUB qword ptr[y]
		FSTP qword ptr[y]
	}
#else
	{
		long double z = x;
		z = z *z*z;
		z = z / 27.0;
		y = z - y;
	}
#endif
	FPU80_off();
	return y;
}

