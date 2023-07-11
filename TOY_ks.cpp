#include "stdio.h"
#include "float.h"
#define _USE_MATH_DEFINES // for C
#include "math.h"
#ifdef _MSC_VER
#include <intrin.h>
#else
#include <immintrin.h>
#endif

#include <stdint.h>

#pragma intrinsic(__rdtsc)

// Toy version that is self contained with no external dependencies to see if it compiles using SSE2 or x87 code gen
// code generation is now OK with -march=silverlake -mavx2 -mfpmath but library code is NBG

const double pi = M_PI;

double Ref_cbrt3(double x)
{  // this is current best buy fast and accurate only defined for x>=0
	double t, y;
	if (x) y = exp(log(x) / 3); else return x;
	t = y * y * y;
	y = y - y * (t - x) / (2 * t + x);  // Halley is good enough 
	return y;
}

double BM_cbrt(double e, double M)
{
	return cbrt(M);
}

double BM_cbrt3(double e, double M)
{
	return Ref_cbrt3(M);
}


double BM_sqrt(double e, double M)
{
	return sqrt(M);
}

double BM_exp(double e, double M)
{
	return exp(M);
}

double BM_log(double e, double M)
{
	return log(M + 1e-99);
}

double BM_cos(double e, double M)
{
	return cos(M);
}

double BM_sin(double e, double M)
{
	return sin(M);
}

double BM_tan(double e, double M)
{
	return tan(M);
}

double SolveCubicOpt(double a, double b, double c)
{
	double d, q, r, r2, s, t;
	q = b - a * a;
	r = 1.5 * a * b - c - a * a * a;
	r2 = r * r;
	d = q * q * q + r * r;

	if (d >= 0.0)
	{

		if (r2 < d * 1e-6)
			t = 2 * r * Ref_cbrt3(d) / (3 * d) - a;
		else
		{
			d = sqrt(d);
			if (r > 0) s = Ref_cbrt3(r + d); else s = -Ref_cbrt3(d - r);
			if (s != 0.0) t = s - q / s - a;
			else t = -a;  // special case arises when e=1 and M=0 or pi
		}
	}
	else
	{
		s = sqrt(-q);  // needed for edge case rounding? error when M ~ pi/2-e and for Better/Best
		d = -r / q / s;
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t) - a;
	}
	return t;

}

double Cubic(double e, double M)
{
	return SolveCubicOpt(0.0, 2 * (1 - e), -3 * M);
}

double Pade(double e, double M)
{
	// simplest possible Pade approximation 

	double f3, a, b, c;
	f3 = 1.0 / (3 + 7 * e);
	a = -M * f3 ;
	b = 20.0 * (1 - e) * f3;
	c = -30.0* M * f3;
	return SolveCubicOpt(a, b, c);
}
//#define INLINE

double Basic(double e, double M)
{
	// this implementation uses solver routines inline and optimsed for accuracy
	// inputs 0 <= e = 1 and -pi <= M <= pi returns solution E

	double  a, b, c, e2, E, f3, r, s, s2, t;
	if (M == 0.0) return M;
	if (e < 0)
	{
		b = 1 + e; e = -e;
	}
	else b = 1 - e;
	e2 = e * e;
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2;
	s = sin(M);
//	f3 = (60 + 3 * e2) * (1-s2) - e * (60 - 7 * e2);
	f3 = 60*b+e2*(3+7*e)-(60+3*e2)*s2;
	if (f3 == 0) 	f3 = 1e+16; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0 / f3;			// reciprocal here because optimiser is rather dumb
	a = -(20 + e2) * s * f3;    // a/3
	b = 20 * (b + e*s2) * f3;	// b/3
	c = -30 * s * f3;			// c/2
#ifndef INLINE
	t = SolveCubicOpt(a, b, c);
#else
	{
		double d, q;
		q = b - a * a;
		r = 1.5 * a * b - c - a * a * a;
		d = q * q * q + r * r;

		if (d >= 0.0)
		{
			d = sqrt(d);
			if (fabs(r) < d * 1e-5)
				t = 2 * r * Ref_cbrt3(d) / (3 * d) - a;
			else
			{
				if (r > 0) s = Ref_cbrt3(r + d); else s = -Ref_cbrt3(d - r);
				if (s != 0.0) t = s - q / s - a;
				else t = -a;  // special case arises when e=1 and M=0 or pi
			}
		}
		else
		{
			s = sqrt(-q);  // needed for edge case rounding? error when M ~ pi/2-e and for Better/Best
			d = -r / q / s;
			t = acos(d) / 3.0;
			if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
			t = 2.0 * s * cos(t) - a;
		}
	}
#endif
	if (t * M < 0) { a = -1.0; } else { a = 1.0; }
	E = atan2(a * t, a);
	if (fabs(E) < fabs(M)) E = M; // defensive fix for M~=pi rounding errors
	return E;
}


double Better(double e, double M)
{
	double  a, b, c, E, t, e2, f3, B, C, s, s2;
	e2 = e * e;
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2;
	B = 7 - e2 * 0.095765;
	C = 3 + e2 * (0.095765 + e2 * 0.004094);
	s = sin(M);
	f3 = 1.0 / ((60 + C * e2) * cos(M) - e * (60 - B * e2));
	a = -(60 + C * e2) * sin(M) * f3/3;
	b = 20*(cos(M) - e) * f3;
	c = -30 * sin(M) * f3;
	/*
	f3 = 1.0 / ((60.0 + C * e2) * (1 - s2) - e * (60.0 - B * e2));
	a = -(60 + C * e2) * s * f3/3;
	b = 20 * (1 - e - s2) * f3;
	c = -30 * s * f3;
	*/
	t = SolveCubicOpt(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (fabs(E) < fabs(M)) E = M;
	return E;
}

double Gooding_S3(double e, double M)
{
	return M + e * sin(M) * (1 + e * cos(M));  // very slow and fairly useless S9 is faster and more accurate!
}

double Gooding_S9(double e, double M)
{
	// orginally written in their paper as sin(M)/sqrt(1-e*cosM+e*e)
	// it is one form of Halley's method but also derived as the root 
	// of a simple quadratic approximation for E-M. Rather good and fast!
	// 
	// 2 calls for sin(M), sin(M/2) and a sqrt
	double s, y;
	y = 1 - e;
	if (M == 0.0) return M; // defend against divide by zero
	s = sin(M / 2);
	return M + e * sin(M) / sqrt(y * y + 4 * e * s * s);  // more accurate (very wrong when e -> 1)
}

double Gooding_S9s2(double e, double M)
{
	// single call to sin(M/2) and a sqrt
	double s, y;
	y = 1 - e;

	if (M == 0.0) return M; // defend against divide by zero
	s = sin(M / 2);
	return M + 2 * e * s * sqrt((1 - s * s) / (y * y + 4 * e * s * s));
}

double S9t2(double e, double M)
{
	// single call to tan(M/2)
	double t, t2, y, z;
	y = 1 - e;
	z = 1 + e;
	if (M == 0.0) return M; // defend against divide by zero
	t = tan(M / 2);
	t2 = t * t;
	return M + 2 * e * t / sqrt((1 + t2) * (y * y + z * z * t2));
}

double S9t2p54(double e, double M)
{
	// own brew Pade approximation 5,4 for tan(M/2)
	double t, t2, y, z, tn, td;
	y = 1 - e;
	z = 1 + e;
	if (M == 0.0) return M; // defend against divide by zero
	t = M / 2;
	if (M < pi / 2) // was pi/4
	{
		t2 = t * t;
		td = 945 - t2 * (420 - 15 * t2);
		tn = t * (945 - t2 * (105 - t2));
	}
	else
	{
		t = pi / 2 - t;
		t2 = t * t;
		tn = 945 - t2 * (420 - 15 * t2); // swapped for common code
		td = t * (945 - t2 * (105 - t2));
	}
	y = y * td;
	z = z * tn;
	return M + 2 * e * tn * td / sqrt((td * td + tn * tn) * (y * y + z * z));
}

int TimeFun(double (*fun)(double, double), double e)
{
	const int MDIV = 10000000;
	double dM, M, y;
        int64_t start, end;
	int k, fails = 0;
	M = 0; // some routines don't like 0.0
	dM = (pi - M) / MDIV;
	y = 0;
	start = __rdtsc();
	for (k = 0; k < MDIV; k++)
	{
		y += (*fun)(e, M);
		M += dM;
	}
	end = __rdtsc();
	if (y == 42.0) printf("y %g", y); // to prevent optimiser zapping code
	end = (end - start + MDIV / 2) / MDIV;
	return (int) end;
}

#define SLOW

void DoTest(const char* name, double (*func)(double, double), double e, double M)
{
	int i;
//	printf("%-8s ( %g, %g ) = %20.14g  t = %i\n", name, e, M, (*func)(e, M), TimeFun(*func, 0.85));
#ifdef SLOW
        printf("%-8s ( %g, %g ) = %20.14g  t = ", name, e, M, (*func)(e, M));
	for (i = 0; i < 6; i++) printf("\t%i", TimeFun(*func, 0.85));
        printf("\n");
#else
        printf("%-8s ( %g, %g ) = %18.11g  t = %i\n", name, e, M, (*func)(e, M), TimeFun(*func, 0.85));
#endif
}

void TestAll(double e, double M)
{
	DoTest("cbrt", BM_cbrt, e, M);
	DoTest("cbrt3", BM_cbrt3, e, M);
	DoTest("sqrt", BM_sqrt, e, M);
	DoTest("exp", BM_exp, e, M);
	DoTest("log", BM_log, e, M); 
	DoTest("cos", BM_cos, e, M);
	DoTest("sin", BM_sin, e, M);
	DoTest("tan", BM_tan, e, M);
	DoTest("S3", Gooding_S3, e, M);
	DoTest("S9", Gooding_S9, e, M);
	DoTest("S9s2", Gooding_S9s2, e, M);
	DoTest("S9t2", S9t2, e, M);
	DoTest("S9t2p54", S9t2p54, e, M);
	DoTest("Cubic", Cubic, e, M);
	DoTest("Pade",  Pade, e, M);
	DoTest("Basic", Basic, e, M);
	DoTest("Better", Better, e, M);
}

int main() {
	double e, M;
	int i;
	e = 1.0;
	M = pi / 2 - 1.0;
	printf("cuberoot of 27.0 is  %g\n", Ref_cbrt3(27.0));
	printf("f(e= %g, M = %g ) = %g\n", e, M, Basic(e, M));
	printf("Needs to settle down before timer is reliable\nSacrificial readings for Basic \n");

//	for (i = 0; i < 10; i++) printf(" t%i %i", i, TimeFun(Basic, 0.85));
	printf("\n");
	TestAll(e,M);
}
