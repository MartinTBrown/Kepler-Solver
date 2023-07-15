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

#include "classic.h"      // for Kepler_f
#include "deltas.h"    // NR, Halley
#include "cuberoot.h"  // for cbrt when not using system cbrt of x86 ASM 
#include "PadeApprox.h"

#ifndef M1
#ifndef _M_IX86
#include "immintrin.h"
#include "intrin.h"
#else
#include <intrin.h>

#pragma intrinsic(__rdtsc)

#endif
#endif

// this stuff is very Intel specific and isolated for that reason

struct tempreal80 { int64_t mantissa; unsigned short exp; }; // was uint64 but fails to compile
union  mydouble { double x; int64_t i64; } result; // was uint64 but failes to compile

union  mydouble80 { long double x80; M1struct tempreal80 x; short int i[5];} result80;

// ugly but usefull to alias doubles and long doubles to integers
// to allow direct inspection of the 64bit mantissa of an 80 bit real

double E_sinE(double E)
{
	return E-sin(E);  // serious risk of numerical cancellation when E is small
}

// FLM_Fixup moved to start of file to resolve usage in non-Windows compilers

double Gooding_Fixup(double e, double M, double E)
{
	// this code for the numerator is after Gooding 1986 & 1985 RAE papers
	// only effective or needed when e is near 1 and M << 1.
	// Provided for historical reasons 
	// FLM95 Pade approximation is much faster and as accurate.

	double x, xo, EE2, term, d;  // following his choice of variable names
//	int i = 4;
	x = M + (e - 1) * E;   //  his code here  X = M + (E-1D00)*DSIN(EE) (sic)
	if ((e > 0) && (E != 0))
	{
		EE2 = -E * E;
		term = -e * E;
		d = 0;
		do
		{
			d = d + 2;
			term = term * EE2 / (d * d + d);
			xo = x;
			x = x - term;
		} while (x != xo);
	}
	return x;
}


double MTB_Fixup(double e, double M, double E)
{
	// this code for the numerator is after Gooding 1986 & 1985 RAE papers
	// only effective or needed when e is near 1 and M << 1.
	// revised version to halves the number of divisions and make all terms negative
	// treating consecutive pairs as a single term
	// magnitude of terms falls so rapidly that there is no need to worry about the
	// order of summation (I did test summing smallest to largest and no difference)

	double x, xo, EE2, EE4, term, d, f, g;  // following his choice of variable names
//	int i = 4;
	x = M + (e - 1) * E;   //  his code here  X = M + (E-1D00)*DSIN(EE) (sic)
	if ((e > 0) && (E != 0))
	{
		EE2 = E * E;
		EE4 = EE2 * EE2;
		term = -e * E*EE2;
		d = 0;
		do
		{
			d = d + 2;
			f = d * d + d;
			d = d + 2;
			g = d * d + d;
			term = term/(f*g);
			xo = x;
			x = x + term*(g-EE2);
			term = term * EE4;
		} while (x != xo);
	}
	return x;
}

double FLM_Fixup(double e, double M, double E)
{
	// This is the preferred method - valid only in the restricted range but as fast as evaluating M + e.sin(E)-E
	double num, den, E2 ;
	E2 = E * E;
	num = 1 - E2 * (0.030956446448551138 - E2 * (4.1584640418181644e-4 - E2 * 1.7454287843856404e-6));
	den = 6 + E2 * (0.11426132130869317 + E2 * (1.0652873476684142e-3 + E2 * (5.972761373107064e-6 + E2 * 1.7804367119519884e-8)));
	return M - (1 - e) * E - e * E * E2 * num / den;

}

#ifdef _MSC_VER

// Microsoft specific inline assembler hacks to get aroound lack of MSC support for long double
// to obtain a better reference we force 80 bit floating point computation on the x87 stack
// this code will only work properly with some compiler options. Requires fp /fast
// you may have to uncomment the duplicate top of stack line for some compiler options.

void FPU80_on()
{
#ifdef _M_IX86	
	short int z;
	_asm{
		fstcw word ptr [z]
		or    word ptr [z], 0x100			// 64 bit precision
		fldcw word ptr [z]
	}
#endif
}

void FPU80_off()
{
#ifdef _M_IX86
	short int z;
	_asm{
		fstcw word ptr [z]	
		and  word ptr [z], 0xFEFF		   // restore 53 bit precision
		fldcw word ptr [z]
	}
#endif
}

void FPinit()
{
#ifdef _M_IX86
	_asm {
		finit // force processor into clean reset state
	}
#endif
}

void rdtsc64(int64_t &t) 
{
/* #ifdef _M_IX86
	_asm{ 
		cpuid	
		rdtsc 
		mov ebx, dword ptr [t]
		mov dword ptr [ebx], eax
		mov dword ptr [ebx+4], edx
		cpuid	
	}
#else
*/
	t = __rdtsc();
//#endif
}	

double tan87(double x)
// return fptan x forced to the x87 coprocessor
{
	double y;
#ifdef _M_IX86
	_asm{
		fld qword ptr [x]
		fptan
		fstp st(0)  // throw away "1"
        fstp qword ptr [y]
	}
#else
	y = tan(x);
#endif
	return y;
}


double atan87(double x)
// return fptan x forced to the x87 coprocessor
{
	double y;
#ifdef _M_IX86
	_asm {
		fld qword ptr[x]
		fld1
		fpatan
//		fstp st(0)  // throw away "1"
		fstp qword ptr[y]
	}
#else
	y = tan(x);
#endif
	return y;
}

double sin87(double x)
// return fpsin x forced to the x87 coprocessor
{
	double y;
#ifdef _M_IX86
	_asm {
		fld qword ptr[x]
		fsin
		fstp qword ptr[y]
	}
#else
	y = sin(x);
#endif
	return y;
}

double Pade32err(double x)
{
	double y = 0; // was  MTB_Pade32ABCSin(x);
#ifdef _M_IX86
	_asm {
		fld qword ptr[x]
		fsin
		fsub qword ptr[y]
		fstp qword ptr[y]
	}
#else
	y = sin(x)-y;
#endif
	return y;

}

double cos87(double x)
// return fpsin x forced to the x87 coprocessor
{
	double y;
#ifdef _M_IX86
	_asm {
		fld qword ptr[x]
		fcos
		fstp qword ptr[y]
	}
#else
	y = cos(x);
#endif
	return y;
}

double sincos87(double x)
// return fpsin x forced to the x87 coprocessor
{
	double y;
#ifdef _M_IX86
	_asm {
		fld qword ptr[x]
		fsincos
		fstp st(0)
		fstp qword ptr[y]
	}
#else
	y = sin(x);
#endif
	return y;
}


double cbrt87(double x)
{
#ifdef _M_IX86
	double const r3 = 1.0 / 3;
	if (x!=0) 

		__asm {
		FLD1
		FLD qword ptr [x]
		FYL2X
		FMUL qword ptr [r3]
		F2XM1
		FADDP st(1),st
		FSTP qword ptr [x]

	}
#else
		return cbrt(x);
#endif
	return x;
}

double E_sinE80(double E)
{
	
	double result;
#ifdef _M_IX86
	short int z;
	_asm{
#ifdef X87_64
		fstcw word ptr [z]
		or    word ptr [z], 0x100	// force 64 bit precision
		fldcw word ptr [z]
#endif
		// action code here
		fld qword ptr [E]
		fld st(0)
		fsin
		fsubp st(1),st  // E - sinE
		//
#ifdef X87_64
		and   word ptr [z], 0xFEFF  // restore 53 bit precision
		fldcw word ptr [z]
		fstp  qword ptr [result] // 80 bit result now as a double
#endif
	}
#else
	result = E_sinE(E);
#endif
	return result;
}

double Kepler_f80(double e, double M, double E)
	// x87 specific full 80 bit real calculation with double result
{
//	return M-E+e*sin(E);
#ifdef _M_IX86
	short int z;

	_asm{
#ifdef X87_64
		fstcw word ptr [z]
		or    word ptr [z], 0x100	// force 64 bit precision
		fldcw word ptr [z]
#endif
		// action code here		
		fld         qword ptr [E]	// E
		fld         st(0)			// E E
		fsin						// sinE E
		fmul        qword ptr [e]	// e.sinE E 
		fld         qword ptr [M]	// M e.sinE E 
	    fsubrp      st(2),st		// e.sinE M-E
		faddp       st(1),st        //  M-E+e.sinE
//		fld         st(0)		    // duplicate top of stack as release may expect result in ST(0) 
  
//		fldpi					    // recognisable 64 bit constant for testing 
#ifdef X87_64		
        fst		  qword ptr [E]  
		fstp      tbyte ptr [result80.x]  // 80bit store only possible with pop
		// 
  		and   word ptr [z], 0xFEFF			// restore 53 bit precision
		fldcw word ptr [z]
#else
		fstp		  qword ptr[E]

#endif
	}
	return E;  // 53 bit accurate result after 64 bit computation
#else
	return Kepler_f(e, M, E); // 64 bit version if 80 bit not available
#endif
	
}

double Kepler_NR80(double e, double M, double E)
// x87 specific full 80 bit real calculation with double result
{
	//	return M-E+e*sin(E);
#ifdef _M_IX86
	double const half = 0.5;
	short int z;
	if (E != 0)
	{

		_asm {
#ifdef X87_64	
			fstcw word ptr[z]
			or word ptr[z], 0x100	// force 64 bit precision
			fldcw word ptr[z]
#endif
			// action code here		
			fld         qword ptr[E]	// E
			fld         st(0)			// E E
			fsin						// sinE E
			fmul        qword ptr[e]	// e.sinE E 
			fld         st(1)           // E esE E
			fmul        qword ptr[half] // E/2 esE E
			fsin                        // se/2
			fmul        st, st(0)        // se/2^2 esE E
			fadd        st, st(0)        // 2se^2 esE E
			fld1
			fld         qword ptr[e]    // e 2se esE E
			fmul        st(2), st
			fsubp       st(1), st                 // 1 2se^2 esE E
			faddp      st(1), st          // 1 - 2esE/2^2 esE E
			fld         qword ptr[M]	// M denom e.sinE E 
			fsubrp      st(3), st		// denom e.sinE M-E
			fxch        st(1)           // e.sE den M-E
			faddp       st(2), st        // den M-E+e.sinE den
			fdivp       st(1), st
			//		fld         st(0)		    // duplicate top of stack as release may expect result in ST(0) 

			//		fldpi					    // recognisable 64 bit constant for testing 
			fst		  qword ptr[E]
			fstp      tbyte ptr[result80.x]  // 80bit store only possible with pop
#ifdef X87_64	
	and word ptr[z], 0xFEFF			// restore 53 bit precision
	fldcw word ptr[z]
#endif

		}

	}
#else
		E = FLM_NR(e, M, E);
#endif
	return E;  // 53 bit accurate result after 64 bit computation
}


double Kepler_Halley80(double e, double M, double E)
// x87 specific full 80 bit real calculation with double result
{
	//	return M-E+e*sin(E);
#ifdef _M_IX86
	double const half = 0.5;
	short int z;
	if (E != 0)
	{

		_asm {
#ifdef X87_64	
			fstcw word ptr[z]
			or word ptr[z], 0x100	// force 64 bit precision
			fldcw word ptr[z]
#endif
			// action code here		
			fld         qword ptr[E]	// E
			fld         st(0)			// E E
			fsin						// sinE E
			fmul        qword ptr[e]	// e.sinE E 
			fld         st(1)           // E esE E
			fmul        qword ptr[half] // E/2 esE E
			fsin                        // se/2
			fmul        st, st(0)        // se/2^2 esE E
			fadd        st, st(0)        // 2se^2 esE E
			fld1
			fld         qword ptr[e]    // e 2se esE E
			fmul        st(2), st
			fsubp       st(1), st                 // 1 2se^2 esE E
			faddp      st(1), st          // 1 - 2esE/2^2 esE E
			fld         qword ptr[M]	// M denom e.sinE E 
			fsubrp      st(3), st		// denom e.sinE M-E
			fxch        st(1)           // e.sE den M-E
			fadd        st(2), st        // e.sE den  M-E+e.sinE 
			fmul        qword ptr[half]  // f"/2 f' f
			fmul        st, st(2)         // f.f"/2 den f
			fxch        st(1)            // f' f.f"/2 f
			fmul        st(2), st         // f' f.f"/2 f.f'
			fmul        st, st(0)         // f'^2 f.f"/2 f.f'
			faddp       st(1), st        // den f.f'
			fdivp       st(1), st
			//		fld         st(0)		    // duplicate top of stack as release may expect result in ST(0) 

			//		fldpi					    // recognisable 64 bit constant for testing 
			fst		  qword ptr[E]
			fstp      tbyte ptr[result80.x]  // 80bit store only possible with pop
#ifdef X87_64	
			and word ptr[z], 0xFEFF			// restore 53 bit precision
			fldcw word ptr[z]
#endif
		}
	}
#else
		E = Classic_Halley(e, M, E);
#endif
	
	return E;  // 53 bit accurate result after 64 bit computation
}


double Gooding_Fixup80(double e, double M, double E)
{
	// created by disassembly of optimised compiled code 

	
#ifdef _M_IX86
	short z;
	double x;
	_asm {
#ifdef X87_64
		fstcw word ptr[z]
		or word ptr[z], 0x100	// force 64 bit precision
		fldcw word ptr[z]
#endif
		// action code here		
		//	x = M + (e - 1) * E;   //  his code here  X = M + (E-1D00)*DSIN(EE) (sic)
		fld         qword ptr[e]
		test        esp, 0FFFFFFF8h
		fld         st(0)                // e e
		fld1                             // 1 e e
		fsub        st(1), st            // 1 e-1 e
		fld         qword ptr[E]         // E 1 1-e e 
		fmul        st(2), st            // E 1 (1-e)E e 
		fxch        st(2)                // E(1-e) 1 E e
		fadd        qword ptr[M]         // M+(1-e)E 1 E e 
	//	if ((e > 0) && (E != 0))
	fldz                         // 0 x 1 E e
	fcom        st(4)
	fnstsw      ax
	test        ah, 1   // was 5
	jp          done // (01FDA9Bh) 
	fucom       st(3)
	fnstsw      ax
	test        ah, 44h
	jnp         done //(01FDA9Bh)
		//	{
		//		EE2 = -E * E;
		fld         st(3)			// E 0 x 1 E e
		fmul        st, st(4)       // E*E 0 x 1 E e 
//			term = -e * E;
		fxch        st(5)           // e 0 x 1 E E*E
		fmulp       st(4), st   // 0 x 1 E e*E*E
		fxch        st(3)       // E x 1 E 0 e*E*E
		fchs                    // -E ...
//			d = 0;
// bug fld         qword ptr[__real@4000000000000000 (0202F60h)] // 2   
		fld1
		fadd        st, st(0)    // 2 -E x 1 E 0 e*E*E
//a14		jmp         start_loop  // Gooding_Fixup + 46h // (01FDA76h)
//	} while (x != xo);
main_loop :
//a14		fxch        st(1)           
		//			do
		//			{
		//				d = d + 2;
		// start_loop:
		    fadd        st(4), st   // 2 -E x 1 E 2 eE2
		//					term = term * EE2 / (d * d + d);
			fld         st(5)       // eE2 ...
			fmulp       st(2), st   // 2 -E*eE2 x E 1 2 eE2
			fld         st(4)	    // 2 2 -EeE2 x  E 1 2 eE2
			fadd        st, st(4)  // d+1 2 -eEn x E 1 2 eE2
			fmul        st, st(5)  // d*(d+1)
			fdivp       st(2), st  // 2 -eEn/d/(d+1) x E 1 2 eE2
			fxch        st(1)      // term 2 x E 1 2 eE2
			fchs				   // -term 2 x E 1 2 eE2
			//					xo = x;
			fld         st(2)      // x -term 2 x E 1 2 eE2
			//					x = x - term;
	//		fxch        st(3)      // x -term 2 x E 1 2 eE2  NOOP
			fsub        st, st(1)  // x-term -term 2 x ...
			//			} while (x != xo);
			fucom       st(3)      // test equal
			fnstsw      ax
			fstp        st(3)      // x-term -term 2 x-term E 1 2 eE2
			fxch        st(1)   //a14
			test        ah, 44h
			jp          main_loop // Gooding_Fixup + 44h  //(01FDA74h) until no change
//			fxch        st(1)  //a14
//			fstp        st(0)
            fstp        st(1)  //a24

			//}
				//return x;
			//}
			done:	
			fstp        st(3)

			fstp        st(2)
			fstp        st(2)
			fstp        st(1)
            fstp        qword ptr [x]
#ifdef X87_64
			and word ptr[z], 0xFEFF			// restore 53 bit precision
			fldcw word ptr[z]
#endif
	}

#else
// this code for the numerator is after Gooding 1986 & 1985 RAE papers
// only effective or needed when e is near 1 and M << 1.

	long double x, xo, EE2, term, d;  // following his choice of variable names
	int i = 4;
	x = M + (e - 1) * E;   //  his code here  X = M + (E-1D00)*DSIN(EE) (sic)
	if ((e > 0) && (E != 0))
	{
		EE2 = -E * E;
		term = -e * E;
		d = 0;
		do
		{
			d = d + 2;
			term = term * EE2 / (d * d + d);
			xo = x;
			x = x - term;
		} while (x != xo);
	}
#endif
	return x;
}

double Verify_s2c2_87(double e, double M)
{
	double x;

	x = M - e;
#ifdef _M_IX86
	{
		short z;
		__asm {

#ifdef X87_64
		fstcw word ptr[z]
		or word ptr[z], 0x100	// force 64 bit precision
		fldcw word ptr[z]
#endif
		fld qword ptr[x]
		fsincos
		fmul st, st(0)
		fxch st(1)
		fmul st, st(0)
		faddp st(1), st
		fld1
		fsubp st(1), st
		fstp qword ptr[x]
#ifdef X87_64
		and word ptr[z], 0xFEFF			// restore 53 bit precision
		fldcw word ptr[z]
#endif
	}
}
#endif
	return x;

}

double Verify_sin_sin87(double e, double M)
{
	double s;

	double x;
	x = M - e;
	s = sin(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[s]
		fld qword ptr[x]
		fsin
		fsubp st(1), st
		fstp qword ptr[s]
	}
#endif
	return s;  //  99.8% +/- 5.7e-17
}


double Verify_cos_cos87(double e, double M)
{
	double c;

	double x;
	x = M - e;
	c = cos(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[c]
		fld qword ptr[x]
		fcos
		fsubp st(1), st
		fstp qword ptr[c]
	}
#endif
	return c;  //  99.9% +/- 5.7e-17

}

double Verify_tan_tan87(double e, double M)
{
	double t;

	double x;
	x = (M - e * pi) / 4;
	t = tan(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[t]
		fld1
		fld qword ptr[x]

		fptan
		fstp st(0)
		fsubp st(2), st
		fstp st(0)
		fstp qword ptr[t]  // untested
	}
#endif
	return t;
}
double Verify_atan_atan87(double e, double M)
{
	double t;
	double x;
	x = M - e;
	t = atan(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[t]
		fld qword ptr[x]
		fld1
		fpatan
		fsubp st(1), st
		fstp qword ptr[t] // bugbug untested
		}
#endif
	return t;

}

double Verify_sin80(double e, double M)
{
	double s, x;
	x = M - e;
	s = sin(x);
#ifdef _M_IX64
	__asm {
		fld qword ptr[s]
		fld qword ptr[x]
		fsin
		fsubp st(1), st
		fstp qword ptr[s]
	}
#endif
	return s;  //  99.8% +/- 5.7e-17
	}

double Verify_cos80(double e, double M)
{
	double c, x;
	x = M - e;
	c = cos(x);
#ifdef _M_IX64
	__asm {
		fld qword ptr[c]
		fld qword ptr[x]
		fcos
		fsubp st(1), st
		fstp qword ptr[c]
	}
#endif
	return c;  //  99.9% +/- 5.7e-17
}


double Verify_s2c2m1_80(double e, double M)
{
	double x;
	x = M - e;

#ifdef _M_IX86
	FPU80_on();
	__asm {
		fld qword ptr[x]
		fld st(0)
		fsin
		fxch st(1)
		fcos
		fmul st, st(0)
		fxch st(1)
		fmul st, st(0)
		fld1
		fsubp st(1), st
		faddp st(1), st
		fstp qword ptr[x]
	}
	FPU80_off();
#endif

	return x;  // 64 bit 89% +/- 1.11e-16
				   // 80 bit 100% +/- 1.084e-19
}


double Verify_sincos_sin87(double e, double M)
{
	double s, c, x;
	x = M - e;
	s = sin(x);
	c = cos(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[s]
		fld qword ptr[x]
		fsin
		fsubp st(1), st
		fstp qword ptr[x]
	}
#endif
	return x + 1e-30 * (1 - s * s - c * c); // 23.6% -4.44e-16 +6.66e-16  DEBUG 51% +/- 2.22e-16

//	final result is tiny multiple of sum which shgould be zero plus SSE sincos sin(x)-sin87(x)
//  hardware sin87 is assumed to be good to full numerical precision
}

double Verify_sincos_cos87(double e, double M)
{
	double s, c, x;
	x = M - e;
	s = sin(x);
	c = cos(x);
#ifdef _M_IX86
	__asm {
		fld qword ptr[c]
		fld qword ptr[x]
		fcos
		fsubp st(1), st
		fstp qword ptr[x]
	}
#endif
	return x + 1e-30 * (1 - s * s - c * c); // 23.6% -4.44e-16 +6.66e-16  DEBUG 51% +/- 2.22e-16

//	final result is tiny multiple of sum which shgould be zero plus SSE sincos sin(x)-sin87(x)
//  hardware sin87 is assumed to be good to full numerical precision
}


double ASM_log2x(double x)
{
	double y;
#ifdef _MSC_VER
#ifdef _M_IX64
	__asm {
		fld1
		fld qword ptr[x]
		fyl2x
		fstp qword ptr[y]
	}
#else
	y = x;
#endif
#else
	y = x; // set a return value

#endif
	return y;
}

double ASM_2x(double x)
{
	double y;
#ifdef _MSC_VER

#ifdef _M_IX64
	const double r2 = 0.5;

	__asm {
		fld1
		fld qword ptr[x]
		fxtract
		fmul qword ptr[r2]
		f2xm1
		fscale
		fadd st, st(0)
		faddp st(2), st
		fstp st(0)
		fstp qword ptr[y]
	}
#else
	y = x; // scalb(1.0, x);
#endif
#else
	y = scalb(1.0, x);

#endif
	return y;
}




#else

#ifdef M1
/*
int64_t_t rdtsc64(int64_t_t &t)
{
	return 42;
}
*/
double fptan87(double x)
{
	return tan(x);
}

#else
// untested not Microsoft C implementation

int64_t rdtsc64(int64_t &t)
{
//	_mm_lfence();
	t= __rdtsc();
	return t;
}
#endif
double E_sinE80(double E)
{
	return (double) (E-sin((long double) E));
}

double Kepler_f80(double e, double M, double E)
{
	return (double) (M-E+e*sin((long double) E));
}


double Kepler_Halley80(double e, double M, double E)
{
	// Classic_Halley is left in its most optimised form for accuracy and speed

	long double f,df,s, s2;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
	s = sin((long double) E/2);
	s2 = s*s;
    	s = sin((long double) E);
	f = M-E+e*s;
	if ((e < 0.75) || (abs(E) > 0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * sin(E);
	else
		f = FLM_Fixup(e, M, E); // this is the preferred FLM95 Pade approx fast and accurate
	s2 += s2;
	df = df + e*s2;
	
#ifdef FAST

	if (f*df) return (double) f*df / (df * df + 0.5 * e * s * f); else return  f;  //NB nan divide by can result divide by zero if E < 1e-154
#else
	return (double) f/(df+0.5*e*s*f/df);
#endif

}


double Gooding_Fixup80(double e, double M, double E)
{
	// this code for the numerator is after Gooding 1986 & 1985 RAE papers
	// only effective or needed when e is near 1 and M << 1.

	long double x, xo, EE2, term, d;  // following his choice of variable names
	int i = 4;
	x = M + (e - 1) * E;   //  his code here  X = M + (E-1D00)*DSIN(EE) (sic)
	if ((e > 0) && (E != 0))
	{
		EE2 = -E * E;
		term = -e * E;
		d = 0;
		do
		{
			d = d + 2;
			term = term * EE2 / (d * d + d);
			xo = x;
			x = x - term;
		} while (x != xo);
	}
	return x;
}


double Verify_sin_sin87(double e, double M)
{
	return 0;  //  99.8% +/- 5.7e-17
}


double Verify_cos_cos87(double e, double M)
{
	return 0;  //  99.9% +/- 5.7e-17
}

double Verify_tan_tan87(double e, double M)
{
	return 0;
}


double Verify_atan_atan87(double e, double M)
{
	return 0;
}

double Verify_sin80(double e, double M)
{
	return 0;;
}

double Verify_cos80(double e, double M)
{
	return 0;  //  99.9% +/- 5.7e-17
}

double Verify_s2c2m1_80(double e, double M)
{
	return 0;  // 64 bit 89% +/- 1.11e-16
}

double Verify_s2c2_87(double e, double M)
{
        return 0;
}

double Verify_sincos_sin87(double e, double M)
{
	return 0;
}

double Verify_sincos_cos87(double e, double M)
{	
	return 0;
}

#endif


void Test80bit(double e, double M, double E, bool verbose)
{
	const int64_t b63 = 0x8000000000000000; // was uint64
	const unsigned short b15 = 0x8000;
	
	if (verbose) printf(" f = M + e.sin(E) evaluated where e = %6.5f  M= %6.5f  E=%6.5f\n", e, M, E);
	result.x = Kepler_f(e, M, E);        // normal 64 bit computation
	M = Kepler_f80(e,M,E);		 // full 80 bit computation with 64 bit result
#ifndef M1
	printf ("\nKepler f53\t%+22.16e %s %016I64X x 2^%i\n", result.x, ((result.i64 & b63)? "-":"+"), 
		((result.i64 & 0x000FFFFFFFFFFFFF)<<11)|b63, (int)((result.i64 & 0x7FFFFFFFFFFFFFFF) >> 52)-1024); 
	printf("53 bit mask \t\t\t\t   %016I64X \n", ((((int64_t) 1)<<53)-1)<<11);
    printf ("Kepler f80\t%+22.16e %s %16I64X x 2^%hi\n\n", 
		M, ((result80.x.exp & b15)? "-":"+"),  result80.x.mantissa, (result80.x.exp &0x7FFF)-16384);
#endif
}