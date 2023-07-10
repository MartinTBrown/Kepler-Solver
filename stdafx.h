// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

// TODO: reference additional headers your program requires here
//
// This file uses known compiler macros to allow portability 
// across Microsoft, Intel, GCC and Apple Clang (Arm) compilers
// Intel specific code is masked out on non x86 architectures
// Tested against 
// x86 MSC 2019, 2022 
// x86 Intel 2023 
// x86 GCC 
// Arm Clang

#include "KeplerSolver.h"

#ifdef _MSC_VER 
 #include "targetver.h"
 #include <tchar.h>
#endif

#include <stdio.h>
#define _CRT_RAND_S
#include "stdlib.h"
#include "float.h"
#define _USE_MATH_DEFINES // for C
#include "math.h"
#include "string.h"
#include "time.h"
#include <stdint.h>
#include <limits.h>

//  #define __int64 int // used for large counter in random testing (can be very slow!)

#define M1struct
#define M1union

// legacy macros used for struct and union only in older Apple compiler (not needed any more)

// defines and macros to handle non-Microsoft compiler quirks
#ifdef _MSC_VER
 #define __uint64_t unsigned __int64    // since Apple compiler hates this construct but accepts the former
#else
 // common dislikes of non-Microsoft compilers
 #define scalb(x,y) _scalb(x,y)
 #ifdef __GNUC__
  #include <x86intrin.h>
 #else
  #define M1  // specific fixes for Apple C GCC/Clang compiler for M1 & Arm CPU tests
 #endif
#endif

// defines and macros to fixup compilation problems on Apple M1 using Clang GCC ver

#ifdef __APPLE__
 // Apple specific fixes to match Clang - some old features commented out
 #define M1
//#define abs(x) fabs(x)
// #define M1struct struct   // not needed with latest Apple compile (was needed in the past)
// #define M1union union     // left in for now and mapped to blanks by macro defnition
 #define __int64 __int64_t
 #define bool int
 #define __forceinline
 #define rdtsc64(x)			 
// not available Intel/AMD specific hardware timer
 #define rand_s(x) rand_r(x)
 #define false 0
 #define true 1
 #define strcpy_s(a,b) strcpy(a,b)
 const unsigned int UINT_MAX = 0xffffffff;
#else
#ifndef _MSC_VER
 #define rand_s(x) rand_r(x)
#endif
#endif

// if you have to make changes or add macros for other OS or platforms please put them here

// Arm and M1/2 CPU specific code will eventually go into files named by processor

#define abs(x)  fabs(x)   

const double pi = M_PI;
#ifdef _DEBUG
const int MDIV = 10000;  // so that (meaningless) benchmarks run quickly
#else
const int MDIV = 10000000; 
#endif
