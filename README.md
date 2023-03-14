## Kepler-Solver
Novel cubic algorithm to solve Kepler's equation for elliptical motion together with new cube root algorithm 
and some modifications to the higher order difference methods which makes them faster and more accurate.

It provides sourcecode implementing methods and algorithms described in the paper: 
"An improved approximation for Kepler's Equation" published in MNRAS 2023 by Martin T. Brown
Copyright 2023 Martin T. Brown

=============================================
CONSOLE APPLICATION : KeplerSolver Project Overview
===============================================

AppWizard has created this KeplerSolver application for you.

This file contains a summary of what you will find in each of the files that
make up your KeplerSolver application. Developed on Microsoft C 2022 the code has
been ported to Intel 2023, GCC and Apple Clang and the stdafx.h file contains a few
shims to make each compiler happy. There are some old features needed to make an
earlier version of the Apple compiler happy. They are left in place for now.

I found the Intel compiler the fastest of all (LLVM version not "Classic"). They also have
a system cuberoot algorithm that is the best I have ever seen using fused multiply add to
obtain accuracy in Halley refinement that is not otherwise possible in 64 bit real arithmetic.


KeplerSolver.vcxproj
    This is the main project file for VC++ projects generated using an Application Wizard.
    It contains information about the version of Visual C++ that generated the file, and
    information about the platforms, configurations, and project features selected with the
    Application Wizard.

KeplerSolver.vcxproj.filters
    This is the filters file for VC++ projects generated using an Application Wizard. 
    It contains information about the association between the files in your project 
    and the filters. This association is used in the IDE to show grouping of files with
    similar extensions under a specific node (for e.g. ".cpp" files are associated with the
    "Source Files" filter).
    
.vcxproj & .vcxproj.filters are not included in this distribution as I suspect they will
not work unless the project is put in exactly the same place as it resides on my PC.
Create a new console project and then import all the source and header files into it.

## KeplerSolver.cpp
    This is the main application source file. It sets up the environment and parses the
    command line all commands are numeric values. No parameters shows help and sample info.

Simplest usage is:

KeplerSolver \<eccentricity\> \<mean anomaly\> \<method\>    which shows the answer and error estimates

Special values for eccentricity or mean anomaly of 9 will do a sweep of test values.

KeplerSolver \<method\>  	shows a quick one line summary of the worst high and low errors
KeplerSolver \<method\> 1	enables verbose mode and shows worst errors for each e tested

The first four methods are my novel cubic algorithm based on a cubic equation in tan(E)
The first 20 methods are various other cubic methods and classical starters.

A summary of the worst case errors under test may be obtained by the command

Keplersolver 250

Adding an extra parameter 1 onto the command line enables verbose mode.

# Components in alphabetical order:

### Benchmark.cpp :
	This code allows benchmarking of system libraries and functions taking one and or two 
	double precision parameters. Timing done in system clicks and by RDTSC on Intel platforms

### BM_shims.cpp : 
	This interfaces refinement steps to starters so that they become functions of e,M
	Default is to use S1(e,M) = M+e - the simplest starter with good convergence

### BM_starter.cpp : 
	This contains related simplified cubic starters using different length polynomial or 
	Pade approximations as a part of trying to understand how complexity affects execution time.

### classic.cpp : 
	Contains classical starter as described by Danby

### cuberoot.cpp : 
	Contains a new experimental fast cube root along with all of the alternative algorithms 
	I have been able to find including GNU, BSD and Sun Unix dialects of system cbrt.
	N_dcbrt4 is the polished version of the new algorithm it is faster and more accurate than
	any of the other alternatives apart from MTB_Ref3 which is a very portable alternative.
	System cbrt on some MS compilers and GCC are inaccurate and compromise the cubic solver.

### deltas.cpp
	Contains Newton-Raphson, Halley, D4, D5, D6, D7 and D8 difference refinements for Kepler.
	All them main routines are fully compensated for rounding issues at small M and e -> 1
	Versions working in terms of tan(E), tan(E/2) and a polynomial approximation are included.
	Versions ending M are starters taking the inital guess E=M (which is very bad near E=0)

### intel.cpp : 
	Contains Intel x87 specific numerical code in assembler which gives 80 bit floating point.
	Alternatives in long double are provided in standard C but not all compilers honour it.

### opt_starter.cpp : 
	Contains versions of the main algorithms with inline solver and difference refinements.

### PadeApprox.cpp : 
	Contains a range of Pade and polynomial approximations to trig functions

### Solver.cpp : 
	Contains the cubic equation solver with various novel refinements for improved accuracy
	as described in the MNRAS paper. There is also a simple Golden ratio optimiser.

### Starter.cpp : 
	Contains the new cubic algorithms Basic, Better & Best together with a few helper functions
	and other earlier cubic algorithms of historical interest. It also contains two new
	ad hoc algorithms D0(e,M) which is too slow to be useful and D1(e,M) which is fastest
	of all the starter contenders (global accuracy about 5% and very quick).

### stdafx.cpp
	Required Microsoft environment stub.

### tests.cpp
	Contains a series of tests applicable to these algorithms and a list of tricky
	test values e and M where the default is to test every combination and report 
	worst case absolute errors high and low compared to a trusted reference.
	The position e,M of each worst case error is also reported and time in cycles.
	It also contains a random number tester which will throw biassed numbers at the algorithm 
	focussing on the regions near 0 and 1 for e and near 0 and pi for M where things may
	go wrong due to rounding errors. Normal mode only errors worse than the high watermark are reported. 
	keplersolver 10005	will do a random challenge test against the reference algorithm

### verify.cpp
	Contains sanity tests of a few routines and two more generic test frames
	keplersolver 200 <method1> <method> 	takes a pair of the other starter methods and compares them
	keplersolver 201 <cuberoot>			tests different cbrt algorithms
	verify functions should evaluate to zero if they are correct.
	eg. Verify symmetry checks that f(M,e)-f(-M,e) == 0 	(sometimes it doesn't!)
	One compiler at certain optimisation settings returns smallest negative denorm for -0

	The higher numbered ones test out numerical identities to see how well they hold true.
	Ones which are less than ideal on the Microsoft compiler are:
		215	asin(sin(x))-x
		220	tan(atan(x))-x
		226	cbrt(x)^3-x
		231	sincos_sin(x)-sin87(x)
		232	sincos_cos(x)-cos87(x)
	Most of the rest are accurate to a fraction of a least significant bit.


/////////////////////////////////////////////////////////////////////////////
Other standard files:

StdAfx.h, StdAfx.cpp
    These files are used to build a precompiled header (PCH) file
    named KeplerSolver.pch and a precompiled types file named StdAfx.obj.
  
  There are header files for each of the sources to export functions that are
  used in other parts of the programme.

/////////////////////////////////////////////////////////////////////////////
Other notes:

AppWizard uses "TODO:" comments to indicate parts of the source code you
should add to or customize.

/////////////////////////////////////////////////////////////////////////////
  
  As is probably quite obvious I am new to this environment and my README file
  is as good as I can get it with my limited understanding of how to do things
 
