#include "stdafx.h"

#pragma once

#ifdef __GNUC
 #include <x86intrin.h>
#else
 #ifndef _MSC_VER
  #define M1  // specific fixes for Apple C GCC/Clang compiler for M1 CPU tests
  #include "stdio.h"
 #endif
#endif

#define _CRT_RAND_S
#include "stdlib.h"
#include "float.h"
#define _USE_MATH_DEFINES // for C
#include "math.h"
#include "string.h"
#include "time.h"

#define abs(x)  fabs(x)  // personal preference

#define PRECISE //  if defined then can use negative e to represent value of 1-e
                //  and routines that are not converted for e, 1-e will still work (but with less accuracy)
                //  uses ugly terse macro form to minimise clutter 
                //  when true additional code to separate out terms in "1-e" is used
                // essential for accurate results when e -> 1

#ifdef PRECISE
#define Safe_e(e, b) (e > 0 ? b = 1 - e : b = -e); (e < 0 ? e = e + 1 : 0);
#else
#define Safe_e(e, b) (e < 1 ? e = e+1 )
#endif

#define STRICT	// if defined then code follows algebra more closely
				// comment out to permit more aggressive optimisations
                // optimising k requires this to be defined

#define PURE    // trig calculations to full precision
				// disable to allow faster sin half angle and sqrt method
				// NB now legacy since tan(x/2) method is much better

#define FAST	// enable algebraically equivalent constructs for maximum speed
				// eliminates all unnecessary divides with more complex code
				// disable to revert to classical Dn(e,M,E) algebra

#define X87_64  // if defined then normal operation 
                // default is only routines in Intel.h ending 80 are 80 bit
                // undefining this will force x87 into 80 bit mode computation 
                // for all x87 based code saving mode switching in the code

#define CBRT 3  // system cbrt is best avoided on MS, Intel and worst of all GCC 
                // Sun's cbrt 14 or my own exprimental N_dcbrt4 7 are better
                // safe default is exp(log(x)/3) & Halley refinement
                // test you own system cbrt with "keplersolver 1000201 0"
                // add extra leading zeroes to run 10x longer challenge test

#ifdef STRICT
  #define CBRT 3  // fastest accurate cube root is now exp(log(x)/3)+Halley if no system cbrt()
  #ifdef __INTEL_LLVM_COMPILER
    #define CBRT 1  // set to one to use Intel Pow(x,1/3) as cbrt(x) it is stunningly good!
  #endif
#endif

// reminder keep this list consistent with the one in cuberoot itself to avoid confusion

#if (CBRT==0) 
  #if (_MSC_FULL_VER < 0x0B000000)
     #define cbrt(x) Ref_cbrt3(x)  // cbrt not implemented in some older versions MSC
  #endif
#elif (CBRT==1)  
  #define cbrt(x) Ref_cbrt(x)   // pow(x,1.0/3) best on Intel compiler impressive +/- 4e-16
#elif (CBRT==2)  
  #define cbrt(x) Ref_cbrt2(x)  // exp(log(x)/3) OK but bad for large or very small magnitude values
#elif (CBRT==3)  
  #define cbrt(x) Ref_cbrt3(x)  // default exp(log(x)/3) & Halley refinement +/- 6e-16
#elif (CBRT==4) 
  #define cbrt(x) ASM_cbrt(x)   // x87 hand coded - capable of full 80 bit result
#elif (CBRT==5)  
  #define cbrt(x) N_cbrt3(x)    // 34% +/- 6e-16 (real32 internals)
#elif (CBRT==6)  
  #define cbrt(x) N_cbrt4(x)    // 34% +/-6e-16 (has real32 internals overflow vulnerability)
#elif (CBRT==7)
#define cbrt(x) N_dcbrt4(x)     // my own algorithm 34% +/- 6e-16 still under test
#elif (CBRT==8)
#define cbrt(x) N_rdcbrt(x)     // this version will be 11 cycles faster when finished (computes 1/cbrt(x))
#elif (CBRT==9)
#define cbrt(x) C_cbrt2(x)      // highly experimental alternative using sqrt(sqrt(x) almost working 34% +/- 6e-16
#elif (CBRT==10)
#define cbrt(x) C_cbrt5(x)      // another version of same - presently broken DO NOT USE!
#elif (CBBRT==11)
  #define cbrt(x) BSD_cbrt(x)   // BSD Unix reference code MS 32% +/- 8e-16, sometimes nans on Intel
#elif (CBRT==12) 
#define cbrt(x) gnu_cbrt(x)     // GNU reference code poor on MS & Intel 27% -8/+13e-16 slightly better on GCC (AVOID!)
#elif (CBRT==13)
#define cbrt(x) sun_cbrt(x)     // Sun Unix reference code 32% +/- 6e-16 - best of the Kahan based algorithms
#elif (CBRT==14)
#define cbrt(x) ret_x(x)
#else
#define cbrt(x) Ref_cbrt2(x)
#endif


