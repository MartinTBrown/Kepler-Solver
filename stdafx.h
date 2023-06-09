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
#include <inttypes.h>
#include <stdbool.h>

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
// #define __int64 __int64_t
#define rdtsc64(x)		{x=__rdtsc();}
// not available Intel/AMD specific hardware timer
 #define rand_s(x) rand_r(x)
#else
#ifndef _MSC_VER
 #define rand_s(x) rand_r(x)
#endif
#endif

// possible rdtsc implementation for ARM
// https://stackoverflow.com/questions/40454157/is-there-an-equivalent-instruction-to-rdtsc-in-arm
//u64 rdtsc(void)
//{
//    u64 val;

//    /*
//     * According to ARM DDI 0487F.c, from Armv8.0 to Armv8.5 inclusive, the
//     * system counter is at least 56 bits wide; from Armv8.6, the counter
//     * must be 64 bits wide.  So the system counter could be less than 64
//     * bits wide and it is attributed with the flag 'cap_user_time_short'
//     * is true.
//     */
//    asm volatile("mrs %0, cntvct_el0" : "=r" (val));

//    return val;
//}

// if you have to make changes or add macros for other OS or platforms please put them here

// Arm and M1/2 CPU specific code will eventually go into files named by processor

#define abs(x)  fabs(x)   

const double pi = M_PI;
#ifdef _DEBUG
const int MDIV = 10000;  // so that (meaningless) benchmarks run quickly
#else
const int MDIV = 10000000; 
#endif
