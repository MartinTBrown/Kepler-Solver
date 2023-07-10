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
#include "benchmark.h" // Set/Get re, rk
#include "classic.h"  // Kepler_F
#include "cuberoot.h" // SetCubeRoot, GoldenMin
#include "deltas.h"  // NR, Halley
#include "intel.h"   // rdtsc 
#include "PadeApprox.h" // E_sinE
#include "solver.h"  // SetCubicSolver
#include "starter.h" // for MTB_Reference & Polish
#include "tests.h"   // for NVER and NFUNCT
#include "verify.h"  // for verify cubic

#define abs(x)  fabs(x)

// int const NFUNCT  now in header file
// int const NVER  start of verify functions

int N; // global parameter used for Pow_En and D to pass extra hidden parameter;


double (*test[NFUNCT])(double,double);
const char *name[NFUNCT];

// double (*refine[100])(double, double, double); // not presently used call with 3 params isn't any good for benchmarking
// char refine_name[100][12];

const int NE = 40; // was 30;
const int NM = 85;
const double test_e[NE] = {0.0, 1e-6, 0.001, 0.002, 0.005, 0.01, 0.02, 0.03, 0.04, 0.05, 0.075, 0.1, 0.15, 0.2, 0.25, 0.3, 0.4, 0.5, 0.55, // 18 this line
//	0.6, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 0.98, 0.99, 0.995, 0.998,0.999, 0.9999, 0.99999, 0.999999, 1.0 }; // original list
0.6, 0.65, 0.7, 0.75, 0.8, 0.8474986, 0.84749866194415, 0.9, 0.95, 0.98, 0.99, 0.995, 0.998,0.999, 0.9999, 0.99999, 0.999999, 
1-1e-8, 1-1e-9, 1-2e-16, 1.0 }; 
const double test_M[NM] = {0.0, 1e-150, 1e-99, 1e-30, 1e-26,1e-24, 5e-24,8e-24, 1e-23, 2e-23, 1e-22,5e-22, 1e-21, 2e-21, 
	1e-18,  1e-15, 1e-12, 1e-11, 1e-10, 2e-10, 5e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5, 1e-4, 0.001, 0.002, 0.005, 
	0.01, 0.02, 0.03, 0.04, 0.05, 0.07, 0.1, 0.15, 0.2, 0.25, 0.3, 0.4, 0.5, pi/2-1.0, 0.6, 0.7, 0.8, 0.9, 1.0,  
	pi/2-0.5, 1.1, 1.2, 1.3, pi/2-0.25, 1.4, pi/2-0.1, 1.5, pi/2, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1, 2.2, 2.3, 
	2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3.0, 3.1, pi-0.02, pi-0.01, pi-0.001, pi-0.0001, pi-1e-6, pi-1e-8, pi-1e-10, 
	pi-1e-12, pi-1e-14, pi-2.2e-16, pi};

// e = 0.874986... is for investigation of Halley misbehaviour leading to Danby's S1' = M + 0.85e assertion
// e = 1-1e-8, 1e-9 and 1-2e-16 added to test accuracy under extreme conditions
// M = 1e-150 to remind me that some code will underflow for valid inputs eg M^3
// M = 1e-24 suggested by reviewer, 5e-24 and 8e-24 are most difficult for simple minded code
// M = pi/2 - e for some tricky e added as spot checks
// M = pi-1e-N added to test boundary conditions are met in other cubic methods

void Init(int n, double (*fun)(double,double), const char* str)
{
	test[n] = fun;
        name[n] = str;
}


double (*GetTest(int i))(double,double)
{
	return test[i];
}

const int NSPECIAL=12;

void ShowHelp()
{
	int i;
#ifdef _DEBUG
	printf("DEBUG mode\n\n");
#endif
	printf("\nUsage: no parameters shows help and does default tests on novel cubic solver.\n\n");
	printf(" KeplerSolver e M will invoke basic routine and show errors and NR/Halley\n");
	printf(" KeplerSolver e M N  will invoke the Nth routine and show errors and NR/Halley\n");
	printf(" N = 1 Basic (default), N = 2 Better, N = 3 Best, N = 4 Optimised Basic\n\n");
    printf(" -1 < e <= 1 where if e is negative it is interpreted as the value of 'e-1' \n");
	printf(" if e==9  then compute a slice at constant M for all e values\n");
	printf(" if M==9 then compute a slice at constant e for all M values\n");
	printf(" add 10 to the M value to set it as a target E value\n");
	printf(" if 20<M<21 then it is interpretted as a fraction of pi such that \n");
	printf(" M = x.pi - e.sin(x.pi) for each tested value of e. Recommend M=20.5\n");
	printf(" RandomTest chooses random pairs of e, M biassed towards large e\n");
	printf(" KeplerSolver N      where N<%i will invoke the following functions:\n", NFUNCT+NSPECIAL-1);
	for (i=0; i<NFUNCT; i+=1)
	{
        if (name[i]) printf("%4i : %-9s\t", i, name[i]);
		if (i % 5 == 0) printf("\n");
	}
//		if (name[i][0]) printf("\t%2i : %s\t%2i : %s\n", i, name[i], i+1, name[i+1]);

	printf("\t%2i :  Full Test of Functions\n", NFUNCT);
	printf("\t%2i :  Full Test of Verifications\n", NFUNCT+1);

	printf("\t%2i :  Full Test of Cube roots\n", NFUNCT+2);
	printf("\t%2i :  Benchmark Mathlib\n", NFUNCT+3);
	printf("\t%2i :  Benchmark All Functions\n", NFUNCT+4);
	printf("\t%2i :  Benchmark Solver vs cbrt\n", NFUNCT+5);
	printf("\t%2i :  E-e*sin(E)\n", NFUNCT+6);
	printf("\t%2i :  Tommasini zeroes of M+e*sin(E)-E\n", NFUNCT+7);
	printf("\t%2i :  Full test cbrt\n", NFUNCT+8);
	printf("\t%2i :  Error Summary\n", NFUNCT+9);
	printf("\t%2i :  Tabulate Function N  (option 0=value, 1= errpr, 2=relative error)\n", NFUNCT+10);
	printf("\t%2i :  Optimise k for S1' = M + k(e)*e\n", NFUNCT+11);
	printf("\t%2i :  Cube Roots Test\n", NFUNCT+12);

	printf("\n N = 1 to %i compute various estimates for E given e,M\n", NVER-1);
	printf(" N = %i to %i compute verifications of functions which should be 0.0\n", NVER, NFUNCT-1);
	printf("If the last parameter on a line is 1 - then verbose mode is enabled\n\n\n");
}


int CheckParam(int i)
{
	N = i/1000;
	i = i % 1000;
	if (i>=NFUNCT+NSPECIAL) i = 1;
	return i;
}

int GetN()
{
	return N;
}

void SetN(int n)
{
	N = n;
}

double Pow_eN(double e, double M)
{  // approximate power curves
	double a = 1.25;
	switch (N) 
	{
	case 0: a = 0.5; break;
	case 4: a = 1.0; break;
	default: a = a*pow(10.0, -N/2.0);
	}
	return a*pow(e, N);
}

const char *GetName(int n)
{
	return name[n];
}

void QuickTimeAll(double e, int n)
{
	double dM, E, M;
	__int64 start, end;
	volatile time_t  start_t, end_t;
	int i, j, k;
	double (*func)(double, double);
	M = 1.0e-10; // some routines don't like 0.0
	dM = pi/(MDIV-1);
	printf("\nQuick Time e = %14.5g\n", e);
    for (i=0; i<n; i++)
	{
		func = test[i];
        if (name[i]) // ignore unused entries in table
		{
			func = test[i];
			for (j=0; j<6; j++)
			{
			M=0;
			end_t = clock();
			while (end_t == (start_t=clock()))
			;
			rdtsc64(start);
			for (k=0; k<MDIV; k++)
			{
			E=(*func)(e, M);
	 //		E=(*test[i])(e, M);
			M += dM;
		}
		rdtsc64(end);
		end_t = clock()-start_t;
        end = (end-start+MDIV/2)/MDIV;
        if (!j)  printf("\n%-2i %10s %1X ", i, name[i], (int)(((intptr_t)func) & 0xff) >> 4);
	  else
#ifdef M1
            printf(" %5.3f", (double)end_t/CLOCKS_PER_SEC);
#else
            printf("%6I64i %5.3f", end, (double)end_t/CLOCKS_PER_SEC);
#endif
	  }
	  }
	}
}


double E_slop(double (*fun)(double, double, double), double e, double M, double E0, double eps)
{ 
	double E, oy, y, y0, besty, E_good;
	E_good = -1;
	y0 = abs(fun(e,M,E0));  // should evaluate to 0 but is not always quite right
	y = y0;
	E=E0;
	while (y==y0)
	{
		eps = eps*2;
		E = E0+eps*E0;
		y = abs((*fun)(e,M,E));		
	}
	// eps is now tuned to just overstep the true zero so binary chop for exact answer
	eps = eps/2;
	E = E0;
	y = y0;
	besty = y0;
	while (abs(eps) > 1.01e-16)
	{
		if (y==y0)
		{
			oy = y;
		    E = E + eps*E;
		    y = (*fun)(e,M,E);
		}
		else
		{
			E = E - eps*E;
		    y = (*fun)(e,M,E);
		}
		if (y!=oy) eps = -eps;
		if (y==0) E_good = E;
		eps = eps/2;
		if (abs(y)<besty)
			besty = abs(y);
	}
	return E;
}

void TestNumeratorZero(double (*fun)(double, double, double), double e, double M, double E, bool absolute)
{
	const double fac=1.0-2e-16;
	double Elow, Ehigh, Elow2, Ehigh2;
	if (M != 0) // protect from insoluble but trivial special case
	{
		Elow  = E_slop(fun, e, M, E, -1e-19);
		Elow2 = E_slop(fun, e, M, Elow-2.2e-16*Elow, -1e-19);
		Ehigh = E_slop(fun, e, M, E, 1e-19);
		Ehigh2 = E_slop(fun, e, M, Ehigh+2.2e-16*Ehigh, 1e-19);
		if (absolute)
			printf("%24.16e %24.16e %24.16e\n", E, Elow-E, Ehigh-E);
		else
			printf("%24.16e %14.6e %14.6e\n", E, Elow/E-1, Ehigh/E-1);
		if (Elow>Ehigh)
			Elow = Elow; // debugging hook
	}
}

void TestKeplerNumerator(double (*fun)(double,double,double), const char *name, bool absolute)
{

	// tests how wide the zero of f(M,e,E) = M + e*sin(E)-E actually is
	// pathological starting value for cancellation of E^3 & E^5 terms deliberately chosen

	double e, E, f,M; 
	int i;
//	const double fac=1.0-2e-16;
	printf("\n Test of %s for e = 1 - 2^-N:\n", name);
	if (absolute)
	   printf(" N \t\tE\t\t	Elow-E \t\t    Ehigh-E\n");
	else
       printf(" N \t\tE \t\t  relative error wrt E\n");
    f = 1.0;
//	E = 0.01;
	for (i=0; i<53; i++)
	{
		f = f/2;
		e = 1-f;
//		E = sqrt(6*(1-e));          // approximate worst case for cancellation E^3
		E = sqrt(60*(1-e)/(3+7*e)); // higher order approximation E^3 & E^5
		M = E-e*sin(E);
//		M = 0.05;                   // spot check at a fairly tricky location
		printf("%2i: ",i);
//		printf("%20.16e ",E_sinE80(E));
		TestNumeratorZero(fun,e,M,E, absolute);	
	}
}

void TestNumerator()
{
	bool absolute = true;
	TestKeplerNumerator(Kepler_f, "M+e*sin(E)-E", absolute);
	TestKeplerNumerator(Kepler_f80,"M+e*sin(E)-E 80 bit computation", absolute);
	TestKeplerNumerator(Gooding_Fixup,"Gooding Fixup", absolute);
	TestKeplerNumerator(FLM_Fixup, "FLM95 Pade Fixup", absolute);
}

double E_sinE_Poly(double E, int n)
{
	double E2, result, term;
	int i;
	E2 = E*E;
	term = E*E2/6;
	i = 4;
	do
	{
		term = -E2*term/i++;
		term = term/i++;
	} while (i<=n);
	result = 0;
	while (i>=3)
	{ 
		result = result + term;
		term = term*(--i);
		term = -term*(--i)/E2;
	}
	return result;
}

void Print_Results(const char *name, double F, double Fref, bool detail)
{
	    double res, rel, bits;
		res = F-Fref;
		if (Fref != 0) rel = abs(res/Fref); else rel = 0;
		if (rel>0) bits = log(rel)/log(0.5); else bits = 53;
		printf("%8s % 22.16e % 11.6e % 8.3e %4.1f\n", name, F, res, rel, bits);
}

void PolyTest(double E, int n)
{
	int i;
	printf("Poly Test E = %f\n  N\tSum of N terms \n", E);
	for (i=3; i<n; i+=2)
	{
		printf(" %2i  %20.16e\n",i, E_sinE_Poly(E,i));
	}
}

void Test_E_sinE()
{
	double E, FE3, F53, F80, F_G, F_Poly, F_Pade, F_ref; 
	int i;
//	const double fac=1.0-2e-16;
	printf("\n Test of E-e*sin(E) implementations :\n");
	PolyTest(0.05,15);
	PolyTest(0.5, 19);
	PolyTest(1.0, 21);
	E=1.0;
	for (i=0; i<16; i++)
	{
		FE3 = E*E*E/6;
		F53 = E-sin(E);		// normal double implementation result changes radically with optimisation
		F80 = E_sinE80(E);	// gets evaluated on the stack to 80 bits so double prescision has guard digit
							// equivalent to 11 bits extra in the mantissa when highly optimised
		F_G = -Gooding_Fixup(1, 0, E);
		F_Poly = E_sinE_Poly(E, 17); // empirically determined to be good for E < 0.5
		F_Pade = E_sinE_Pade(E);
		F_ref  = F_G;
		printf("2^-%2i :  \nName\t\t  Value \t    Residual \tRelative  Bits\n",i);
		printf("   E = \t  %20.16e\n",E);
		Print_Results("E^3/6 ", FE3, F_ref,false);
		Print_Results("53bit ", F53, F_ref,false);
		Print_Results("80bit ", F80, F_ref,false);
		Print_Results("Gooding", F_G, F_ref,false);
		Print_Results("Poly17", F_Poly, F_ref,false);
		Print_Results("Pade  ", F_Pade, F_ref,false);
		E = E/2;
	}
}	

double Kepler_Fun(double x)
{
	return Kepler_f(0.99999999, 1.589565129427894e-12, x);
}

double Kepler_Fun80(double x)
{
	return Kepler_f80(0.99999999, 1.589565129427894e-12, x);
}


double Kepler_GF(double x)
{
	return Gooding_Fixup(0.99999999, 1.589565129427894e-12, x);
}


double MTB_GF(double x)
{
	return MTB_Fixup(0.99999999, 1.589565129427894e-12, x);
}

double FLM_GF(double x)
{
	return FLM_Fixup(0.99999999, 1.589565129427894e-12, x);
}


double Kepler_GF80(double x)
{
	return Gooding_Fixup80(0.99999999, 1.589565129427894e-12, x);
}

void Print_Results_T17(const char* title, double xlo, double xhi, double f(double))
{
	double t;
	if (xlo > xhi)
	{
		t = xlo;
		xlo = xhi;
		xhi = t;
	}
	printf("\nBinary chop results for zone of zeroes of f = M + e.sin(E)-E");
	printf("\n\n%s bit Kepler function evaluation with E values of transitions and mid point below\n", title);
	printf("%24.18g % 24.19g % 24.19g % 24.19g % 24.19g\n", xlo / (1 + 2.22e-16), xlo, (xlo + xhi) / 2, xhi, xhi * (1 + 2.22e-16));
	printf("%24.18g %24.18g %24.18g %24.18g %24.18g\n\n", f(xlo / (1 + 2.22e-16)), f(xlo), f((xlo + xhi) / 2), f(xhi), f(xhi * (1 + 2.22e-16)));
}

void Probe_zeros(double xlo, double xhi, double fun(double), int n)
{
	double eps, f, x, of, ox;
	int i, ostate, state;
	of = ox = 0;
	
	x = (xlo + xhi) / 2;         // midpoint should be approximately right (it isn't quite right)
	eps = x * 2.220446049e-16/2.0;
	x = x- n * eps;
	ostate = 2;
	printf("Checking for other zero transitions - stepping by machine epsilon\nThis may take a few seconds\n\n");
	printf("  Index  State  \tE\t\t     f = M + e.sin(E) - E\n");
	for (i = 0; i < n; i++)
	{
		f = fun(x);
		if (f)
		{
			if (f > 0)
				state = 1;
			else
				state = -1;
		}
		else
			state = 0;
		if ((ostate !=2) && (state != ostate)) {
			printf("%9i %2i %26.20g = %24.16g\n", i - 1, ostate, ox, of);
			printf("%9i %2i %26.20g = %24.16g\n", i, state, x, f);
		}
		ostate = state;
		ox = x;
		of = f;
		x += eps;
	}

}

void find_zeroes(const char* name, double a, double c, double func(double))
{
	double xlo, xhi;
	xlo = find_zero_lo(a, c, func);
	xhi = find_zero_hi(a, c, func);
	Print_Results_T17(name, xlo, xhi, func);
	Probe_zeros(xlo, xhi, func, 20000000);
}

void T_test(double x)
{
	printf("Kf(%24.16g) = %24.16g\n", x, Kepler_Fun(x));
}

void Test_Kepler_zero()
{
	// Evaluate the Thomassini challenge test along the variable E for fixed e,M starting values
	// Identifies start, end and mid point of the region where M-E+e*sin(E) == 0
	// for various approximations of the numerator (progressively more accurate ones)
	// Worth noting in execution time FLM_Fixup wins hands down and is pretty good for accuracy

//	double xlo, xhi;
	printf("Test of Thomassini test values at various precisions\n\nSpot checks of Kepler function at stated e,M,E values\n");
	T_test(0.000125786668198);
	T_test(0.0001257862775234476);
	T_test(0.000125786288366093);

	find_zeroes("f 64", 0.0001, 0.00015, Kepler_Fun);
	find_zeroes("f 80", 0.0001, 0.00015, Kepler_Fun80);
	find_zeroes("GF 64", 0.0001, 0.00015, Kepler_GF);
	find_zeroes("MBGF 64", 0.0001, 0.00015, MTB_GF);
	find_zeroes("FLMGF 64", 0.0001, 0.00015, FLM_GF);
	find_zeroes("GF 80", 0.0001, 0.00015, Kepler_GF80);

}

double MTB_Rand()
{ 
  // double precision random number in range 0 .. 1 from 32 bit integer
  // range of values greatly extended to catch edge effects
  unsigned int x, m;
  double y;
  double const norm = 1.0/((double) UINT_MAX);
  rand_s(&x);
  m = x & 3;
  y = ((double) x ) * norm;  // linear
							 
  if (m)
  {
	  y = y * y;  // quadratic dense near 0 - min value 5e-20
	  if (m > 1)
	  {
		  if (m == 2)
			  y = 1 - y; // quadratic dense near 1
		  else
			  y = y * y;  // quartic dense near 0 min value 3e-39 (may underflow some float32 code)
	  }   
  }
  return y;
}


void RandomTest(int n, __int64  repeats, bool verbose)
{
	// this should only be used for tests to probe for irregularities
	// disable for regression testing!

	double e, err, errlo, errhi, errsum, errsum2, M, binsize, binbase, s,z;
	int j, jlo, jhi, k, nl=0, nh=0, nbad=0, nan=0;
	const int BINS = 40;
	const int BINHI = 2 * BINS + 1;
	unsigned int hist[BINHI];

#ifdef use_int64
	__int64 i;
#else
	int i;
#endif
	errhi=0;
	errlo=0;
	errsum = 0;
	errsum2 = 0;
	s = 0;
	binsize = pow(2.0, -54.0)*2; // *2.0; // was 0.0625; //was  *2.0;
	binbase = BINS * binsize + binsize / 2;
    if (name[n])
	{
		for (j = 0; j < BINHI; j++) hist[j] = 0;
#ifdef M1
		printf("\nRandom challenge test %i%0i x %i : %s\n", (int)repeats / 1000000000, (int)repeats % 1000000000, n, name[n]);
#else
		printf("\nRandom challenge test %I64i x %i : %s\n", repeats, n, name[n]);

#endif
		if (test[n] != Verify_Cbrt)
			printf("\tError \t\t\t e \t\t\t M");
		else
			printf("\tError \t\t\t x");



		if (test[n] == Verify_Cubic) printf("\ta^3/c\tba^4/c");

		for (i = 0; i < repeats; i++)
		{
			e = MTB_Rand(); // 0.9999999 + MTB_Rand() / 10000000.0;
	//		e = e ;
			if (test[n] == Verify_Cubic) e = 2 * e - 1;   // test polynomial with -1<a<1 and -pi<b<pi
	  //	  else
	  //		  e = sqrt(e); // uniform e is wasteful so bias testing towards e=1;

			M = pi * MTB_Rand(); // symmetry testing is built in tries e,M and e,-M 
	  //	  M = pi / 2 - e + MTB_Rand() / 100.0 - 0.005;
			k = 1;  // set k=2 to test +/- every M value default positive only
			while (k-- > 0)
			{
				err = (*test[n])(e, M);
				if (n < NVER)
				{
					if ((*test[n] == MTB_Reference) || (*test[n] == MTB_Polish))
						err = Classic_NR80(e, M, err);  // now the gold standard complete with Danby's fixup
					else
						err = MTB_Reference(e, M) - err;
				}
				z = ((err + binbase) / binsize); // was 2.77505575e-17) / 5.5501115e-17) + 16;
				j = (int)z;
				if (z < 0) j = 0;
				if (z >= BINHI)
					j = BINHI - 1;
				hist[j]++;
				if (err > 0.000398282) nbad++;
				if (isnan(err))
				{
					nan++;
					err = (*test[n])(e, M);
				}
				if ((err > errhi) || ((err == errhi) && verbose))
				{
					errhi = err;
					if (*test[n] != Verify_Cbrt)
						printf("\n+  %14.8g %24.16g %23.16g", err, e, M);
					else
						printf("\n+  %14.8g %24.16g", err, x_from_eM(e, M));
					if (*test[n] == Verify_Cubic) printf(" %7.3g %7g", e * e * e * 100.0, e * e * e * e * M * 100.0);
					// badness metrics for cubic equations (implicit here that c = 0.01)
					err = (*test[n])(e, M);
					nh++;
				}
				if ((err < errlo) || ((err == errlo) && verbose))
				{
					errlo = err;

					if (*test[n] != Verify_Cbrt)
						printf("\n-  %14.8g %24.16g %23.16g", err, e, M);
					else
						printf("\n-  %14.8g %24.16g", err, x_from_eM(e, M));
					if (*test[n] == Verify_Cubic) printf(" %5.3g %5.3g", e * e * e * 100.0, e * e * e * e * M * 100.0);
					err = (*test[n])(e, M);
					nl++;
				}
				errsum += err;
				errsum2 += err * err;
				M = -M; // check symmetry (should be OK)
			}
		}
//#ifdef use_int64
#ifdef M1
		printf("\nRepeats %i%0i  low %9i  high %9i\n\n", (int)repeats / 1000000000, (int)repeats % 1000000000, nl, nh);
#else
		printf("\nRepeats %I64i  low %9i  high %9i  big %9i NaN %9i\n\n", repeats, nl, nh, nbad, nan);
		jlo = jhi = 0;
		for (j = 0; j < BINHI - 1; j++)
		{
			if (hist[j] && !jlo) jlo = j;
			if (hist[j]) jhi = j;
		}
		if (jlo > 2)       jlo -= 2; else jlo = 0;
		if (jhi < BINHI - 4) jhi += 3; else jhi = BINHI - 1;

		if (hist[0]) printf("<%11.4e | %-9i\n.\n", (0 - BINS) * binsize, hist[0]);
		for (j = jlo; j < jhi; j++)
			printf("%12.4e | %-9i\n", (j - BINS) * binsize, hist[j]);
		if (hist[BINHI - 1]) printf(".\n>%11.4e | %-9u\n", (BINHI - 1 - BINS) * binsize, hist[BINHI - 1]);

#endif
		e = 0;
		err = 0;
		for (j = 0; j < BINHI; j++)
		{
			M = (j - BINS) * binsize;
			e += M * hist[j];
			err += M * M * hist[j];
			M = hist[j];
			M = M / repeats;
			if (M) s -= M * log(M);

		}
		e = e / repeats;
		err = err / repeats - e * e;
		err = sqrt(err);
		errsum = errsum / repeats;
		errsum2 = errsum2 / repeats;
		errsum2 = errsum2 - errsum * errsum;
		errsum2 = sqrt(errsum2);
		printf("\nMean  %g   StdDev  %g from Hist Mean  %g StDev %g Entropy %g\n", errsum, errsum2, e, err, s);
	}
}


void RandomTestAll(int n)
{
	printf("Test takes about a day to complete\n");
	  RandomTest(n,10,false);
 	  RandomTest(n,100,false);
	  RandomTest(n,1000,false);
 	  RandomTest(n,10000,false);
	  RandomTest(n,100000,false);
	  RandomTest(n,1000000,false); // about 15s to here
	  RandomTest(n,10000000,false);  //2 min
#ifdef use_int64
	  RandomTest(n,100000000,false);  // 20 min
	  RandomTest(n,1000000000,false);  // 3hr
	  RandomTest(n,10000000000,false);  // 30hr
#endif
}

void TestCbrtAll(bool verbose)
{
	int i;
	for (i = 0; i < NSOLVER; i++)
	{
		SetVerifyFun1(i);
		FullTest(201, verbose);
	}
}

void QuickTest(int n, double e)
{
	// this test shows all the cubic methods for four test values of M
	// output just fits on an 80 character terminal for easy comparison
	// one output E value in each quadrant to test logic

	const int NM = 4;
	const double qtest_M[NM] = {-2.0, -0.3, 0.3, pi-0.01 }; // minmal test set
	// tests one value in each quadarant, symmetry and gradient at pi
	static int firsttime = 0;
	int i;
	double E;
	if (firsttime) 
	{
		firsttime=0;
		printf("\n\tM =    ");
  	    for (i=0; i<NM; i++)
			printf("%17.15f ", qtest_M[i]);
	}
    if (name[n][0] != '_')
	{
	  printf("\n%-12s ", name[n]);
	  for (i=0; i<NM; i++)
	  {
		E = (*test[n])(e, qtest_M[i]);
		printf("%17.15f ", E);
	  }
	}
}


void QuickTestAll(double e)
{	
	int i;
	printf("\nQuicktest e = %14.5g\n", e);
    for (i=0; i<NVER; i++)
	  QuickTest(i, e);
}

void RegressionTest(bool verbose)
{
/*
    QuickTestAll(0.25);
	QuickTestAll(0.75);

	Test80bit(0.999, .01, .5, false);
    Test80bit(0.999, -.01, -.5, false);

	TestKeplerNumerator(Kepler_f, "M+e*sin(E)-E", verbose);
	TestKeplerNumerator(Kepler_f80, "M+e*sin(E)-E 80 bit computation?", verbose);
	TestKeplerNumerator(Gooding_Fixup, "Fixup", verbose);
	Test_E_sinE();
*/
}

#ifdef M1
double TestEslice(int n, double e, double  *errlo, double *Mlo, double *errhi, double *Mhi, bool negate, bool verbose)
{
	double E, M, err, ref, sumerr, sumerr2;
	const bool RMS = false;
	int j;
		ref = 0;
		*errlo = 0; *Mlo = 0;
		*errhi = 0; *Mhi = 0;
		sumerr = 0; sumerr2 = 0;
	    for (j = 0; j<NM; j++)
		{
			M = test_M[j];
			do
			{
			  if (((M==pi/2-e) || (M==pi/2-0.5) || (M==pi/2-0.25))) // debugging hook
				M=M;
			  if (n<NVER) ref = MTB_Reference(e, M); // compare functions to Exact E reference value and verifications to 0
			  E = (*test[n])(e, M);
			  if (*test[n] != MTB_Reference)
			     err = ref-E;
			  else
                 err = Classic_NR80(e, M, E);

			  if (err<*errlo) 
			  {
				*errlo = err;
				*Mlo = M;
			  }
			  if (err>*errhi) 
			  {
				*errhi = err;
				*Mhi = M;
			  }
			  sumerr += err;
			  sumerr2 += err*err;
			  M = -M;
		    } while ((M<0.0)&negate);
			if (verbose) printf(" %e-24.16\t",err);
		}
        if (*errhi> -*errlo) err = *errhi; else err = -*errlo;
		if (RMS)
		{
		  err = sumerr/NM;
		  err = sqrt(sumerr2/NM-err*err);

		  *errlo=err;
		  *errhi=err;
		}
		return err;

}
#else

double TestEslice(int n, double e, double  &errlo, double &Mlo, double &errhi, double &Mhi, int &nan, bool negate, bool verbose)
{
	double E, M, err, ref, sumerr, sumerr2;
	const bool RMS = false;
	int j;
	nan = 0;
	ref = 0;
	errlo = 0; Mlo = 0;
	errhi = 0; Mhi = 0;
	sumerr = 0; sumerr2 = 0;
	for (j = 0; j<NM; j++)
	{
		M = test_M[j];
		do
		{
		  if (((M==pi/2-e) || (M==pi/2-0.5) || (M==pi/2-0.25))) // debugging hook
			M=M;
		  if (n<NVER) ref = MTB_Reference(e, M); // compare functions to Exact E reference value and verifications to 0
		  E = (*test[n])(e, M);
		  
		  if ((*test[n] == MTB_Reference) || (*test[n] == MTB_Polish))
		     err = Classic_NR80(e, M, E);
		  else
             err = ref-E;
		  if (isnan(err))
		  {
			  nan++;
			  err = (*test[n])(e, M);
		  }
		  if (err<errlo) 
		  {
			errlo = err;
			Mlo = M;
		  }
		  if (err>errhi) 
		  {
			errhi = err;
			err = (*test[n])(e, M);
			Mhi = M;
		  }
		  sumerr += err;
		  sumerr2 += err*err;
		  M = -M;
	    } while ((M<0.0) && negate);
		//if (verbose) printf(" %-24.16e\t",err);
	}
    if (errhi> -errlo) err = errhi; else err = -errlo;
	if (RMS)
	{
	  err = sumerr/NM;
	  err = sqrt(sumerr2/NM-err*err);
	  errlo=err;
	  errhi=err;
	}
	return err;
}
#endif
int TimeFun(int i, double e); 
void FullTest( int n, bool verbose)
{
	// This exercises the routines for a wide range of candidate values in the positive range 0 to pi;
	// The worst minimum and maximum error is tabulated as a function of eccentricity e.
	// Reference gold standard is MTB_BasicOpt with Halley and a final polish by classic NR
	// verbose prints out all values in a tab/space deliminated text format with *very* long lines!
	//
    int i, time;
	static int first=0, nancount;
	double e, errlo, errhi, Mlo, Mhi, 
		worst_lo, worst_hi, worst_elo, worst_ehi, worst_Mlo, worst_Mhi;
	bool negate = false;
	if (n<0)
	{
	   negate = true;
	   n = -n;
	}
	if (verbose)
	{
		printf("\nFull test of Kepler Solver : %s \n", name[n]);
//		printf("   e \\ M = \t");
		//if (verbose) for (j=0; j<NM; j++) printf("%20.16e\t", test_M[j]);
		printf("   e \t\t\t Min Error\t M_min\t\t MaxError\t  M_max\t\t Nans\n");
	}
	Mlo=0;
	Mhi=0;
	worst_lo=worst_hi=0;
	worst_elo=worst_Mlo=0;
	worst_ehi=worst_Mhi=0;

	for (i = 0; i<NE; i++)
	{   
		e = test_e[i];
		if (verbose) printf("%-18.16g\t",e);
#ifdef M1
		TestEslice(n, e, &errlo, &Mlo, &errhi, &Mhi, negate, verbose);
#else
        TestEslice(n, e, errlo, Mlo, errhi, Mhi, nancount, negate, verbose);
#endif
		if (errlo<worst_lo)
		{
			worst_lo = errlo;
			worst_elo = e;
			worst_Mlo = Mlo;
		}
		if (errhi>worst_hi)
		{
			worst_hi = errhi;
			worst_ehi = e;
			worst_Mhi = Mhi;
		}
		
		if (verbose)
		{
			printf(" %-12.5g\t %-12.5g\t %-12.5g\t %-15.5g\t", errlo, Mlo, errhi, Mhi);
			if (nancount) printf("%i", nancount);
			printf("\n");
		}
	}
/*
	printf("\nSummary for %s :", name[n]);
	printf("\nWorst low error  %-13.6g\t e = %-18.16g\t M = %-13.6g", worst_lo, worst_elo, worst_Mlo);
	printf("\nWorst high error  %-13.6g\t e = %-18.16g\t M = %-13.6g\n\n", worst_hi, worst_ehi, worst_Mhi);
	*/
	if (!first++) printf("\nTag Function  \t    Low Error\te\t\t     M\t\t     High Error\t\t   e \t\tM\t   Time");
	
	time = TimeFun(n, 0.85);
	printf("\n%3i %-12s %13.6g %-20.16g %-13.11g %13.6g %20.16g %-13.11g %4i",
		n, name[n], worst_lo, worst_elo, worst_Mlo, worst_hi, worst_ehi, worst_Mhi, time);
	if (nancount) printf("#");

}

void ErrorSummary(bool verbose)
{
	// This exercises the routines for a wide range of candidate values in the positive range 0 to pi;
	// The worst minimum and maximum error is tabulated as a function of eccentricity e.
	// Reference gold standard is MTB_BasicOpt with Halley and a final polish by classic NR
	// verbose prints out all values in a tab/space deliminated text format with *very* long lines!
	//
    int i, j, n, nan;
	double e, errlo, errhi, Mlo, Mhi;
	bool negate = false;
	printf("\nError Summary of Kepler Solver\n"); 
	printf("   e\t");
	for (j=1; j<NVER; j++) if (name[j][0] != '_') printf("\"%s\"\t", name[j]);
//	printf(" Min Error\t M_min\t\t MaxError\t  M_max\n");
    Mlo=0;
	Mhi=0;
	for (i = 0; i<NE; i++)
	{   
		e = test_e[i];
		printf("\n %-6f\t",e);
  		for (n = 1; n<NVER; n++)
#ifdef M1
		   if (name[n][0] != '_') printf("%14.7e\t",TestEslice(n, e, &errlo, &Mlo, &errhi, &Mhi, negate, verbose)); 
#else
           if (name[n][0] != '_') printf("%14.7e\t",TestEslice(n, e, errlo, Mlo, errhi, Mhi, nan, negate, verbose)); 
#endif
	}
}

double Check_M(double M, double e)
{
	if (abs(M)>10)
	{
		if (M >= 20) M = pi*(M - 20) - e; 
		if (M <= -20) M = pi*(M+20) + e;
		if (abs(M)>10) 
		{
			if (M>0)
				M = M-10;
			else
				M = M+10;
			M = M - e*sin(M);  // choose M so that input E is the target value
		}		
	}
	return M;
}

double errlo, Mlo, errhi, Mhi;

void GetSummary(double& elo, double& Ml, double& ehi, double& Mh)
{ 
	elo = errlo;
	Ml = Mlo;
	ehi = errhi;
	Mh = Mhi;
}


void SimpleTest( int n, double e, double M, bool headings, bool verbose)
{
	double E, err, ref, relerr, nr, nrt, halley;

	if (headings)
	{
		if (n < NVER) printf("\n Name\t\te\t    M\t\t\tE\t\tExact-E \tnr80 \t    1-E/Exact\t   HalleyT\n\n");
		else printf("\n Name\t\te\t    M\t\t\tError\n\n");
	}

	M = Check_M(M, e);     // allows interesting tests slicing along fixed e,fixed M and k.pi-e.sin(k.pi)

	printf("%-12s", name[n]);
    ref = MTB_Reference(e, M);
	E = (*test[n])(e, M);

	if ((*test[n] == MTB_Reference) || (*test[n] == MTB_Polish))
		err = Classic_NR80(e, M, E);
	else
		err = ref - E;
	if (err > errhi)
	{
		errhi = err;
		Mhi = M;
	}
	if (err < errlo)
	{
		errlo = err;
		Mlo = M;
	}
	printf("%-12.10g %-11.7g %-22.16g", e, M, E);
	if (n < NVER)
	{
		halley = Classic_Halley(e, M, E);

		if ((!isnan(E)) && (abs(E) < pi))
			nr = Classic_NR80(e, M, E);
		else
			nr = E;
		if (e < 0) e = 1 + e; // to handle -0.5 < e <0.5 for optimum accuracy
		nrt = NRT(e, M, E, tan(E));

		if (ref != 0) relerr = 1 - E / ref; else relerr = 0;


		if (n < NVER) printf(" %-15.7g %-15.7g %-12.4g %-15.7g", err, nr, relerr, halley);
		printf("\n");
	}
	if (verbose)
		{
		  printf("\t Initial E(est)\t\t E low limit \t\t E high limit\n");
		  TestNumeratorZero(Kepler_f, e, M, ref, true);
		  Test80bit(e, M, ref, verbose);
		}
}



void SimpleTest2(int a, int b, double e, double M)
{
	// compares algortihms a and b on simple test
	SimpleTest(a, e, M, true, false);
	SimpleTest(b, e, M, false, false);
	if (M)
	{
		SimpleTest(a, e, -M, false, false);
	    SimpleTest(b, e, -M, false, false);
	}
}

void Slice_e(int n, double M)
{
	int i;
	if (abs(M) < 9.0) printf("Slice along e for M = %5g\n",M);
	else
	{
		if (abs(M-20)<=1) 
			printf("Slice along e for M = %f*pi-e*sin(%f*pi)", M-20, M-20);
		else
			printf("Slice along e for fixed target E = %g\n", fmod(M,10.0));
	}
	for (i=0; i<NE; i++)
	  SimpleTest(n, test_e[i], M, i==0, false);
}

void Slice_M(int n, double e)
{
	int i;
	printf("Slice along M for e = %10.9g\n", e);
	for (i=0; i<NM; i++)
	  SimpleTest(n, e, test_M[i], i==0, false);
	printf("Summary error low %16.8g at M = %-16.8g error hi %16.8g at M = %-16.9g\n", errlo, Mlo, errhi, Mhi);
}

void FullTestAll(int ifrom, int ito)
{
	int i;
	for (i = ifrom; i < ito; i++)
	{
		if (name[i][0] != '_') FullTest(i, false);
	}
}

/*
void eSliceAll(double M)
{
	int i;
	for (i = 0; i <= NVER; i++)
	{
//		TestEslice(i, 9, M, errlo, Mlo, errhi, Mhi, false, true);
	}
}
*/

void SpecialTest(int n, int factor)
{
	int i;
	double e, M;
	M = 0.5;
	for (i = 0; i <= 65; i++)
	{
		if (M > 1e-16)
		{
			e = 1 - M;
			SimpleTest(n, e, M, (i == 0), false);
			M = M / factor;
		}
	}
}

void MasterTest(int n, double e, double M, bool headings, bool verbose)
{
	if ((e<-1) || (e==9) || (abs(M-20)<=1)) 
		Slice_e(n, M);  // special cases testing various e values
	else
	{
        if (e<=1.0)
		{
		if (abs(M)==9) 
			Slice_M(n,e);  // testing various M values at fixed e
		else 
			SimpleTest(n, e, M, true, false);  
		}
		else
		  FullTest((int) e, verbose);
	}
}


double TestDNt2(int i)
{
	double e, nfac, t, x, x0, eps;
	int n, m;
	n = i-50;
	m = n;
	nfac = 0.5;
	do 
	  nfac *= (m--);
	while (m);
	e = 1.0;
	switch (n)
	{
		case 5: m = 30 ; break;
		case 6: m = 6 ; break;
		case 7: m = 0  ; break;
		case 8: m = 0  ; break;
		default: m = 54;
	}
    eps = pow(2.0,-m);  // D6 -> -14 6e-5, D5 = -49 -> 1.77e-15
	x = pi/2-eps;
	t = tan(x);
	x = pow(2.0,-1023);
	x0  = pow(x/nfac, 1.0/nfac);
	printf("%2i %14.8g %14.8g", i % 10, eps, t);
	printf(" %14.8g ", tan(pi/2-eps));
	x = (*test[i])(e, pi-e-eps);
	x0 = (*test[i])(e, pi-e-eps/2);
	printf(" %14.8g %14.8g\n", x, x0);
    return eps;
}

void TestDnt2All()
{
	int i;

	printf("Explore transition to under/overflow risk with tan(E) near zero or pi/2\n\n");
	printf("Dn \t eps\t      tan(eps) \t  tan(pi/2-eps)\t    Dn(1,pi-e-eps)  Dn(1,pi-e-eps/2)\n");
	for (i=52; i<= 58; i++)
	{
		TestDNt2(i);
	}
}

double Eval_error_rk(double k)
{
	double errlo, Mlo, errhi, Mhi;
	int nan;
	Set_rk( k);
#ifdef M1
	return TestEslice(N, Get_re(), &errlo, &Mlo, &errhi, &Mhi, false, false);
#else
	return TestEslice(N, Get_re(), errlo, Mlo, errhi, Mhi, nan, false, false);
#endif
}

double Eval_sumerror_rk(double k)
{
	double errsum, errlo, Mlo, errhi, Mhi;
	int i, nan;
	Set_rk(k);
	errsum = 0.0;
	Set_re(0.0);
	for (i=0; i<1000; i++)
	{
		Set_re(Get_re()+0.001);
#ifdef M1
	 errsum += TestEslice(N, Get_re(), &errlo, &Mlo, &errhi, &Mhi, false, false);
#else
	 errsum += TestEslice(N, Get_re(), errlo, Mlo, errhi, Mhi, nan, false, false);
#endif
	}
	return errsum;
}

void Opt_k(int n)
{
	int i,j, nan;
	double xk0, xk, errlo, Mlo, errhi, Mhi;
	printf("\nOptimum contant k for %s\ne \t     k\t     f(k-)\t   f(k) \tf(k+)  \t    f(0)  \tf(0.4)    f(0.5)     f(0.61)\t  f(0.85) \t f(1)", name[n]);
	N = n;
	xk = GoldenMin(0.001,1,Eval_sumerror_rk,0);
	printf("\n%5.4f %7.6f%12.4g%14.6g%12.4g%12.4g%12.4g%12.4g%12.4g%12.4g%12.4g", Get_re(), xk, Eval_sumerror_rk(xk-.01),Eval_sumerror_rk(xk),Eval_sumerror_rk(xk+.01), Eval_sumerror_rk(0), Eval_sumerror_rk(0.45),Eval_sumerror_rk(0.5),Eval_sumerror_rk(0.61),Eval_sumerror_rk(0.85),Eval_sumerror_rk(1));
	printf("\n");
	xk0 = xk;
	printf("\nOptimum k(e) for %s\ne  \tk \t   f(k-)\t f(k)  \t\tf(k+)  \t  f(k0)  \tf(0) \t  f(0.4) \tf(0.5) \t  f(0.61) \tf(0.85)\t    f(1)      ErrLow\t   M_low    ErrHi\t M_Hi", name[n]);
	Set_re(0.0);
	j= 0;
	for (i = 0; i<100; i++)
	{
        Set_re(Get_re()+0.01);
		xk = GoldenMin(0,1,Eval_error_rk,j);
		printf("\n%5.4f %7.6f%12.4g%14.6g%12.4g%12.4g%12.4g%12.4g%14.4g%12.4g%12.4g%12.4g", Get_re(), xk, Eval_error_rk(xk-.01),Eval_error_rk(xk),Eval_error_rk(xk+.01),Eval_error_rk(xk0), Eval_error_rk(0), Eval_error_rk(0.48),Eval_error_rk(0.5),Eval_error_rk(0.61),Eval_error_rk(0.85),Eval_error_rk(1));
#ifdef M1
        TestEslice(n, Get_re(), &errlo, &Mlo, &errhi, &Mhi, false, false);
#else
	TestEslice(n, Get_re(), errlo, Mlo, errhi, Mhi, nan, false, false);
#endif
		printf("%11.3g%10.3g%10.3g%10.3g", errlo, Mlo, errhi, Mhi);
	
	}
	printf("\n");
}
