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
#include "BM_shims.h"
#include "cuberoot.h"
//#include "deltas.h"
#include "intel.h"
#include "PadeApprox.h"
#include "solver.h"
#include "starter.h"
#include "tests.h"
#include "classic.h"


#define PURE

// because for some reason it can't otherwise be found!
double BM_qsincos(double x)
{
	return sin(x) + cos(x);
}

#ifdef M1

// Apple M1 complier Clang (old version) won't allow &variable notation for modifiable values
// changed to *end and *end_t accordingly

double QT_nop(__int64 *end, time_t *end_t)
{

	double dM, E, F, M;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
//	   E += M;
#ifndef PURE
//	   F += M;  // access another variable
#endif
	   M += dM;
	}
	*end_t = clock()-start_t;
#ifdef PURE
	return E+M;  // prevent optimiser nulling out loop
#else
	return E+F+M;
#endif
}

double QT_plus(__int64 *end, time_t *end_t)
{

	double dM, E, F, M;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
	   E += M+k+pi;
#ifndef PURE
	   F += M;  // access another variable
#endif
	   M += dM;
	}
	*end_t = clock()-start_t;
#ifdef PURE
	return E+M;
#else
	return E+F;
#endif
}

double QT_sub(__int64 *end, time_t *end_t)
{

	double dM, E, F, M;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
	   E -= M-k-pi;
#ifndef PURE
	   F -= M;
#endif
	   M += dM;
	}
	*end_t = clock()-start_t;
#ifdef PURE
	return E+M;
#else
	return E+F;
#endif
}

double QT_div(__int64 *end, time_t *end_t)
{

	double dM, E, F, M;
	time_t  start_t;
	int i,j, k;
	M = 0.985;
	j = 0;
	E = F = 1.0;
	dM = pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += 1/M;
#else
	   E += (1+1/M); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	*end_t = clock()-start_t;
	return E+j;
}

double QT_fdiv(__int64 *end, time_t *end_t)
{

	float dM, E, F, M;
	time_t  start_t;
	int i,j, k;
	M = (float) 0.985;
	j = 0;
	E = F = 1.0;
	dM = (float) pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += 1/M;
#else
	   E += (1+1/M); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	*end_t = clock()-start_t;
	return (double) E+j;
}

double QT_i64div(__int64 *end, time_t *end_t)
{

	float dM, M;
	__int64 E, F;
	time_t  start_t;
	int i,j, k;
	M = (float) 0.985;
	j = 0;
	E = F = 1;
	dM = (float) pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=1; k<MDIV+1; k++)
	{
#ifdef PURE
	   E += 10000000000000 /k;
#else
	   E += (1+10000000/k); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	*end_t = clock()-start_t;
	return (double) E+j;
}

double QT_idiv(__int64 *end, time_t *end_t)
{

	float dM, M;
	int E, F;
	time_t  start_t;
	int i,j, k;
	M = (float) 0.985;
	j = 0;
	E = F = 1;
	dM = (float) pi/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=1; k<MDIV+1; k++)
	{
#ifdef PURE
	   E += 10000000/k;
#else
	   E += (1+10000000/k); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	*end_t = clock()-start_t;
	return (double) E+j;
}

double QT_mul(__int64 *end, time_t *end_t)
{

	double dM, E, F, M;
	time_t  start_t;
	int k;
	M = 1.0;
	E = F = 1.0;
	dM = 2/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E *= M*(1+dM);  // some saturation - faster IRL
#else
		E *= M+1; // forces pipeline stall result is never ready in time
#endif
//	   F *= M;
	   M += dM;
	}
	*end_t = clock()-start_t;
	return E; // to defeat aggressive global optimisers you may need to printf the return value
}

double QT_imul(__int64 *end, time_t *end_t)
{

	double dM, M;
	int E, F;
	time_t  start_t;
	int k;
	M = 1.0;
	E = F = 1;
	dM = 12/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += (int) M*k;  // some saturation - faster IRL
#else
		E += k*k; // forces pipeline stall result is never ready in time
#endif
//	   F *= M;
	   M += dM;
	}
	*end_t = clock()-start_t;
	return E; // to defeat aggressive global optimisers you may need to printf the return value
}

double QT_i64mul(__int64 *end, time_t *end_t)
{

	double dM, M;
	__int64 E, F;
	time_t  start_t;
	int k;
	M = 1.0;
	E = F = 1;
	dM = 12/(MDIV-1);
    *end_t = clock();
	while (*end_t == (start_t=clock()))
	;
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += (__int64) k* (__int64) k;  // some saturation - faster IRL
#else
		E += k*k; // forces pipeline stall result is never ready in time
#endif
//	   F *= M;
	   M += dM;
	}
	*end_t = clock()-start_t;
	return (double) E; // to defeat aggressive global optimisers you may need to printf the return value
}
#else


double QT_nop(__int64 &end, time_t &end_t)
{

	double dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()))
	;
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
//	   E += M;
#ifndef PURE
//	   F += M;  // access another variable
#endif
	   M += dM;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
#ifdef PURE
	return E+M;  // prevent optimiser nulling out loop
#else
	return E+F+M;
#endif
}

double QT_plus(__int64 &end, time_t &end_t)
{

	double dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
	   E += M+k+pi;
#ifndef PURE
	   F += M;  // access another variable
#endif
	   M += dM;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
#ifdef PURE
	return E+M;
#else
	return E+F;
#endif
}

double QT_sub(__int64 &end, time_t &end_t)
{

	double dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int k;
	M = 0.0;
	E = F = 0.0;
	dM = pi/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
	   E -= M-k-pi;
#ifndef PURE
	   F -= M;
#endif
	   M += dM;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
#ifdef PURE
	return E+M;
#else
	return E+F;
#endif
}

double QT_div(__int64 &end, time_t &end_t)
{

	double dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int i,j, k;
	M = 0.985;
	j = 0;
	E = F = 1.0;
	dM = pi/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += 1/M;
#else
	   E += (1+1/M); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return E+j;
}

double QT_fdiv(__int64 &end, time_t &end_t)
{
	float dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int i,j, k;
	M = (float) 0.985;
	j = 0;
	E = F = 1.0;
	dM = (float) pi/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += 1/M;
#else
	   E += (1+1/M); // still much slower than it really is IRL
#endif	  
//	   F /= M;
	   M += dM;
	   for (i=0; i<40; i++)
		   j+=i;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return (double) E+j;
}

double QT_i64div(__int64 &end, time_t &end_t)
{
	__int64 E, F;
	__int64 start;
	time_t  start_t;
	int i,j, k;
	j = 0;
	E = F = 1;
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=1; k<MDIV+1; k++)
	{
#ifdef PURE
	   E += 10000000000000 /k;
#else
	   E += (1+10000000/k); // still much slower than it really is IRL
#endif	  
	   for (i=0; i<40; i++)
		   j+=i;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return (double) E+j;
}

double QT_idiv(__int64 &end, time_t &end_t)
{
	int E, F;
	__int64 start;
	time_t  start_t;
	int i,j, k;
	j = 0;
	E = F = 1;
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=1; k<MDIV+1; k++)
	{
#ifdef PURE
	   E += 10000000/k;
#else
	   E += (1+10000000/k); // still much slower than it really is IRL
#endif	  
	   for (i=0; i<40; i++)
		   j+=i;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return (double) E+j;
}

double QT_mul(__int64 &end, time_t &end_t)
{

	double dM, E, F, M;
	__int64 start;
	time_t  start_t;
	int k;
	M = 1.0;
	E = F = 1.0;
	dM = 2.0/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E *= M*(1+dM);  // some saturation - faster IRL
#else
		E *= M+1; // forces pipeline stall result is never ready in time
#endif
	   M += dM;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return E; // to defeat aggressive global optimisers you may need to printf the return value
}

double QT_imul(__int64 &end, time_t &end_t)
{

	double dM, M;
	int E, F;
	__int64 start;
	time_t  start_t;
	int k;
	M = 1.0;
	E = F = 1;
	dM = 12.0/(MDIV-1);
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
#ifdef PURE
	   E += (int) M*k;  // some saturation - faster IRL
#else
		E += k*k; // forces pipeline stall result is never ready in time
#endif
//	   F *= M;
	   M += dM;
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return E; // to defeat aggressive global optimisers you may need to printf the return value
}

double QT_i64mul(__int64 &end, time_t &end_t)
{
	__int64 E, F;
	__int64 start;
	time_t  start_t;
	int k;
	E = F = 1;
    end_t = clock();
	while (end_t == (start_t=clock()));
	rdtsc64(start);
	for (k=0; k<MDIV; k++)
	{
	   E += (__int64) k* (__int64) k;  // some saturation - faster IRL
	}
	rdtsc64(end);
	end = end-start;
	end_t = clock()-start_t;
	return (double) E; // to defeat aggressive global optimisers you may need to printf the return value
}
#endif

double QuickTime(double (*func)(double), const char *name)
{
	double dM, E, M;
	__int64 start, end;
	time_t  start_t, end_t;
	int j, k;
	end = end_t = 0; // to stop compiler warning;
	E = M = 1e-10; // some routines don't like 0 as an input
	dM = (pi-M)/(MDIV-1);
#ifdef _MSC_VER
	if (func == tan87) dM = dM/4; // valid range 0 - +pi/4
#endif
    printf("\nQT %10s %1X", name, 0); // (((int) func) & 0xFF)>>4);
	for (j = 0; j < 5; j++)
	{
		if (name[1]==0)     // single character for primitive operations
		{
			switch (name[0])
			{
#ifdef M1 
			case '#': QT_nop(&end, &end_t); break;
			case '+': QT_plus(&end, &end_t); break;
			case '-': QT_sub(&end, &end_t); break;
			case '*': QT_mul(&end, &end_t); break;
			case '/': QT_div(&end, &end_t); break;
			case 'd': QT_idiv(&end, &end_t); break;
			case 'm': QT_imul(&end, &end_t); break;
			case 'D': QT_i64div(&end, &end_t); break;
			case 'M': QT_i64mul(&end, &end_t); break;
#else
			case '#': QT_nop(end, end_t); break;
			case '+': QT_plus(end, end_t); break;
			case '-': QT_sub(end, end_t); break;
			case '*': QT_mul(end, end_t); break;
			case '/': QT_div(end, end_t); break;
			case 'd': QT_idiv(end, end_t); break;
			case 'm': QT_imul(end, end_t); break;
			case 'D': QT_i64div(end, end_t); break;
			case 'M': QT_i64mul(end, end_t); break;
#endif
			default:;
			}
		}
		else
	    {
		E = 0;
	    end_t = clock();
	    while (end_t == (start_t=clock()))
	    ; // sync start tick
	    rdtsc64(start);
	    for (k=0; k<MDIV; k++)
	    {
	     E+=(*func)(M);
	     M += dM;
	    }
	    rdtsc64(end);
	    end = end-start;  // CPU cycles approx
	    end_t = clock()-start_t;
	    }
	 
	  end = (end + MDIV/2)/MDIV;
#ifdef M1
      printf(" %5.3f", (double)end_t/CLOCKS_PER_SEC);
#else
      printf("%6I64i %5.3f", end, (double)end_t/CLOCKS_PER_SEC);
#endif
	}
	return E;
}


// line below is #define VOODOO set for vector mode may have to manually tweak

#ifndef __APPLE__
#if __M_IX_IX86_FP != 0  // skip this if Apple compiler for Arm
#define VOODOO
#endif
//#define VOODOO
#endif

// set one of these to match actual calling convention in use if there are compiler warnings
// misleading to redefine "_vectorcall" very grubby but it seems to work OK

//#define _vectorcall _fastcall
//#define _vectorcall _stdcall
//#define _vectorcall _cdecl

// tests of all permutations show that Basic and S3 have wild fluctations in timing
// the thing they have in common is using sin E and cos E together S9 used as reference
// Code Gen		SSE2	AVX		AVX2	AVX512	x87
// Call tyep
// _cdecl		80,49	22,48	21,49	22,28	200,201
// _fastcall	84,50	23,53	21,50	22,50	202,207
// _stdcall		83,49	23,50	21,50	21,50	200,209
// _vectorcall	22,50	73,51	75,50	75,50   N/A
// 
// In most cases AVX2 or AVX512 with vectorcall is fastest
// this is all on Microsoft C++ 2022 compiler
// Never observed similar behaviour on Intel C++ 2023

#ifdef VOODOO


double vQuickTime(double  (_vectorcall *func)(double), const char* name)
{
	double dM, E, M;
	__int64 start, end;
	time_t  start_t, end_t;
	int j, k;
	E = M = 1e-10; // some routines don't like 0 as an input
	dM = (pi-M) / (MDIV - 1);
#ifdef _MSC_VER
//	if (func == fptan87) dM = dM / 4; // valid range 0 - +pi/4
#endif     
	printf("\nQT %10s %1X", name, (((int)func) & 0xFF) >> 4);
	for (j = 0; j < 5; j++)
	{
		switch (name[0])
		{
#ifdef M1 
		case '#': QT_nop(&end, &end_t); break;
		case '+': QT_plus(&end, &end_t); break;
		case '-': QT_sub(&end, &end_t); break;
		case '*': QT_mul(&end, &end_t); break;
		case '/': QT_div(&end, &end_t); break;
		case 'd': QT_idiv(&end, &end_t); break;
		case 'm': QT_imul(&end, &end_t); break;
		case 'D': QT_i64div(&end, &end_t); break;
		case 'M': QT_i64mul(&end, &end_t); break;
#else
		case '#': QT_nop(end, end_t); break;
		case '+': QT_plus(end, end_t); break;
		case '-': QT_sub(end, end_t); break;
		case '*': QT_mul(end, end_t); break;
		case '/': QT_div(end, end_t); break;
		case 'd': QT_idiv(end, end_t); break;
		case 'm': QT_imul(end, end_t); break;
		case 'D': QT_i64div(end, end_t); break;
		case 'M': QT_i64mul(end, end_t); break;
#endif
		default:
		{
			E = 0;
			end_t = clock();
			while (end_t == (start_t = clock())); // sync start tick
			rdtsc64(start);
			for (k = 0; k < MDIV; k++)
			{
				E += (*func)(M);
				M += dM;
			}
			rdtsc64(end);
			end = end - start;  // CPU cycles approx
			end_t = clock() - start_t;
		}
		}
		end = (end + MDIV / 2) / MDIV;
#ifdef M1
		printf(" %5.3f", (double)end_t / CLOCKS_PER_SEC);
#else
		printf("%6I64i %5.3f", end, (double)end_t / CLOCKS_PER_SEC);
#endif
	}
	return E;
}

// these are shims to make existing __cdecl math intrinsics testable in this framework in _vector linkage mode
// there is no speed penalty - if anything most of them are faster, sin & cos *much* faster 24 cycles vs 42 for _cdecl!

double _vectorcall  vfabs(double x) { return fabs(x); }
double _vectorcall  vcos(double x) { return cos(x); }
double _vectorcall  vsin(double x) { return sin(x); }
double _vectorcall  vsqrt(double x) { return sqrt(x); }
double _vectorcall  vexp(double x) { return exp(x); }
double _vectorcall  vlog(double x) { return log(x); }
double _vectorcall  vtan(double x) { return tan(x); }
double _vectorcall  vatan(double x) { return atan(x); }
double _vectorcall  vcbrt(double x) { return cbrt(x); }
double _vectorcall  v_chgsign(double x) { return _chgsign(x); }
double _vectorcall  v_atan2(double x, double y) { return atan2(x, y); }
double _vectorcall  v_pow(double x, double y) { return pow(x, y); }
#endif


int TimeFun(int i, double e)
{
	double dM, M, y;
	double (*fun)(double, double);
	__int64 start, end;
	int k, fails = 0;
	M = 0; // some routines don't like 0.0
	dM = (pi - M) / MDIV;
	y = 0;
	fun = GetTest(i);
	rdtsc64(start);
	for (k = 0; k < MDIV; k++)
	{
		y += (*fun)(e, M);
		M += dM;
	}
	rdtsc64(end);
	end = (end - start + MDIV / 2) / MDIV;
	return (int)end;
}

int QuickTimeFun(int i, double e, bool verbose)
{
	double dM, M, sig, y;
	double (*fun)(double, double);
	__int64 start, end;
	volatile time_t  start_t, end_t;
	int j, k, fails = 0;
	M = 1.0e-10; // some routines don't like 0.0
	dM = (pi - M) / MDIV;
	y = 0;
	sig = 0;
	fun = GetTest(i);
	if (verbose)
	{
		for (j = 0; j < 6; j++)
		{

			M = 0;
			y = 0;
			end_t = clock();
			while (end_t == (start_t = clock()))
				;
			rdtsc64(start);
			for (k = 0; k < MDIV; k++)
			{
				y += (*fun)(e, M);
				if (isnan(y))
				{
					if (!fails++) printf(" fail e = %24.16g M = %24.16g", e, M);
					y = (*fun)(e, M);
				}
				M += dM;
			}
			rdtsc64(end);
			end_t = clock() - start_t;
			end = (end - start + MDIV / 2) / MDIV;

            //			end = TimeFun(i, e);
            if (!j)  printf("\n%-2i %10s %1X ", i, GetName(i), (int)(((intptr_t)fun) & 0xff) >> 4);
			else
#ifdef M1
                printf(" %5.3f", (double)end_t / CLOCKS_PER_SEC);
#else
                printf("%6I64i %5.3f", end, (double)end_t / CLOCKS_PER_SEC);
#endif
			if (sig == 0)
				sig = y;
			else
				if (y != sig)
				{
					printf("   fail %24.16g %24.16g\n\t\t", y, sig);
					y = y;
				}
		}
		if (fails) printf("fail count = %i\n", fails);
	}
	else
		end = TimeFun(i, e);
	return (int)end;
}



void QuickTimeFun3(double (*test)(double, double, double), double e)
{
	// this doesn't work so well - 3 arguments on stack seems to tip the balance and mess up timings
	// unclear why it is so bad code looks OK in debugger but runs very slowly

	double dM, E, M, y, sig;
	__int64 start, end;
	volatile time_t  start_t, end_t;
	int i = 1, j, k, fails;
	M = 1.0e-10; // some routines don't like 0.0
	dM = (pi - M) / MDIV;
	sig = 0;
	fails = 0;
	for (j = 0; j < 6; j++)
	{
		M = 0;
		y = 0;
		end_t = clock();
		while (end_t == (start_t = clock()))
			;
		rdtsc64(start);
		E = e;
		for (k = 0; k < MDIV; k++)
		{

			y += (*test)(e, M, E);
			if (isnan(y))
			{
				if (!fails++) printf("\n fail e = %24.16g M = %24.16g E = %24.16g", e, M, E);
				y = (*test)(e, M, E);
			}
			M += dM;
			E += dM;
		}
		rdtsc64(end);
		end_t = clock() - start_t;
		end = (end - start + MDIV / 2) / MDIV;

        if (!j)  printf("\n%-2i %10s %1X ", i, (char *) GetName(i), (int)(((intptr_t)test) & 0xff) >> 4);
		else
#ifdef M1
			printf(" %5.3f", (double)end_t / CLOCKS_PER_SEC);
#else
			printf("%6I64i %5.3f", end, (double)end_t / CLOCKS_PER_SEC);
#endif
		if (sig == 0)
			sig = y;
		else
			if (y != sig)
			{
				y = y;
				printf("\n sig fail %24.16g %24.16g\n", y, sig);
			}
	}
	if (fails) printf("\n fail count = %i\n", fails);
}




void QuickTimeSolver(int n, double e)
{
	int i;
	for (i = 0; i < NSOLVER; i++)
	{
		//		SetCubicSolver(i);
		SetSolverCubeRoot(i);
		QuickTimeFun(n, e, true);
	}
	SetCubeRoot(CBRT);
}

void QuickTimeAll(double e)
{
	int i;
    const char* name;
	printf("\nQuick Time e = %14.5g\n", e);
	for (i = 0; i < NVER; i++)
	{
        name = GetName(i);
        if (strlen(name) > 0) // ignore unused entries in table
		{
			QuickTimeFun(i, e, true);
		}
	}
}


void BenchmarkMathlib()
{
	printf("\nTimings for common operations x10^7 '#' is empty loop (+, -, * all x3 )\n");
	QuickTime(nop, "#"); // nop for single instructions
	QuickTime(nop, "+");
	QuickTime(nop, "-");
	QuickTime(nop, "*");
	QuickTime(nop, "/");
	QuickTime(nop, "m");
	QuickTime(nop, "d");
	QuickTime(nop, "D");
	QuickTime(nop, "M");
	QuickTime(nop, "nop");

	QuickTime(Reciprocal_1px, "1/(1+x)*");
	QuickTime(Reciprocal_1px_a, "1/(1+x)**a");
	QuickTime(Reciprocal_1px_24, "1/(1+x) 24");
	QuickTime(Divide_1px, "1/(1+x)");
#ifndef VOODOO
	QuickTime(fabs, "abs");
#ifndef M1	
	QuickTime(MTB_chgsgn, "fchsgn");
	QuickTime(_chgsign, "chgsign");
#else
	printf("\nchgsgn");
	printf("\n_chgsgn");
#endif
	QuickTime(Zero_x, "0-x");
	QuickTime(sqrt, "sqrt");
	QuickTime(atan, "atan");
	QuickTime(BM_atan2, "atan2");
	QuickTime(log, "log");
	QuickTime(exp, "exp");
	QuickTime(sin, "sin");
	QuickTime(cos, "cos");
	QuickTime(BM_qsincos, "sincos");
	QuickTime(tan, "tan");
	QuickTime(fabs, "abs");
#ifdef _MSC_VER
	QuickTime(sin87, "sin87");
	QuickTime(cos87, "cos87");
	QuickTime(sincos87, "sincos87");
	QuickTime(tan87, "tan87");
	QuickTime(ASM_log2x, "ASM_log2");
	QuickTime(ASM_2x, "ASM_2^x");
#if (_MSC_FULL_VER > 0x0b000000)
	QuickTime(cbrt, "sys_cbrt");
#else
	printf("\nsys_cbrt  not available");
#endif
#else
	QuickTime(cbrt, "sys_cbrt");
#endif
#else

#ifndef M1	

	QuickTime(MTB_chgsgn, "fchsgn");
	//	  QuickTime(v_chgsign, "chgsign");
#else
	printf("\nchgsgn");
	printf("\n_chgsgn");
#endif
	QuickTime(Zero_x, "0-x");
	vQuickTime(vsqrt, "sqrt");
	vQuickTime(vatan, "atan");
	QuickTime(BM_atan2, "atan2");
	vQuickTime(vlog, "log");
	vQuickTime(vexp, "exp");
	vQuickTime(vsin, "sin");
	vQuickTime(vcos, "cos");

	vQuickTime(vtan, "tan");
	vQuickTime(vfabs, "abs");

#ifdef _MSC_VER
	//	  QuickTime(M_sin, "Msin");
#ifdef _MSC_VER 
#if ((_MSC_FULL_VER > 0x0b000000))
	vQuickTime(vcbrt, "sys_cbrt");
#else
	printf("\nsys_cbrt  not available");
#endif
#else
	QuickTime(vcbrt, "sys_cbrt");
#endif
#endif
#endif
	//	  QuickTime(ASM_cbrt2, "ASM_cbrt2"); // redacted too slow
	QuickTime(ASM_cbrt, "ASM_cbrt");

	QuickTime(Ref_cbrt, "Ref_cbrt");
	QuickTime(Ref_cbrt2, "Ref_cbrt2");
	QuickTime(Ref_cbrt2, "Ref_cbrt3");
	QuickTime(N_cbrt, "N_cbrt");
	QuickTime(N_rcbrt, "N_r32cbrt");
	QuickTime(N_cbrt3, "N_cbrt3");
	QuickTime(N_cbrt4, "N_cbrt4");
	QuickTime(N_cbrt4a, "N_cbrt4a");
	QuickTime(C_cbrt5, "C_cbrt5");  // not great but not so bad either
	QuickTime(BSD_cbrt, "BSDcbrt");
	QuickTime(gnu_cbrt, "GNUcbrt");
	QuickTime(sun_cbrt, "Suncbrt");
	QuickTime(N_dcbrt4, "dcbrt4");
	QuickTime(N_dcbrt4a, "dcbrt4a");
	QuickTime(N_dcbrt4_32, "dcbrt1");
	QuickTime(N_rdcbrtNR, "rDcbrt");
	QuickTime(MTB_Pade32Sin, "P32sin");
	QuickTime(MTB_Pade52Sin, "P52sin");
	QuickTime(MTB_Pade74Sin, "P74sin");
	QuickTime(MTB_Pade76Sin, "P76sin");
	QuickTime(MTB_Pade22Cos, "P22cos");
	QuickTime(MTB_Pade42Cos, "P42cos");
	QuickTime(MTB_Pade64Cos, "P64cos");
	QuickTime(MTB_Pade52Tan, "P52tan");
	QuickTime(MTB_Pade76Tan, "P76tan");
	QuickTime(MTB_Poly7Tan, "P7_tan");
	QuickTime(MTB_Poly9Sin, "P9_sin");
	QuickTime(MTB_Poly11Sin, "P11sin");
	QuickTime(MTB_Poly13Sin, "P13sin");
	QuickTime(MTB_Pade52Atan, "P52Atan");
	QuickTime(E_sinE_Pade, "P{E-sinE}");

}

void BenchmarkAll()
{
	  SetN(3);
	  BenchmarkMathlib();
	  QuickTimeAll(0.85);
}
