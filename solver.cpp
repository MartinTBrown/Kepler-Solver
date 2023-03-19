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
#include "cuberoot.h"

double (*solver_cbrt)(double) = GetCubeRoot();

void SetSolverCubeRoot(int n)
{
	SetCubeRoot(n);
	solver_cbrt = GetCubeRoot();
}

double SolveCubicP(double a, double b, double c)
{
	// Uses (*solver_cbrt)(double) for benchmarking cbrt in situ
	// 
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
			s = 2 * r / (3 * (*solver_cbrt)(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a / 3.0; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = (*solver_cbrt)(r + d); else s = -(*solver_cbrt)(d - r);
			if (s != 0) t = s - q / s - a / 3.0; else t = -a/3;
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

double MTB_BasicRR(double e, double M)
{
	double  a, b, c, E, t, e2, f3;
	e2= e*e;
	f3 = 1.0/((60+3*e2)*cos(M)-e*(60-7*e2));
    a = -(60+3*e2)*sin(M)*f3;
	b = 60*(cos(M)-e)*f3;
	c = -60*sin(M)*f3;
	t = SolveCubicP(a,b,c);
	if (t*M<0) { t = -t; a=-1.0; } else { a=1.0; }
	E = atan2(t,a);
	if (abs(E)<abs(M)) E=M; // this line takes -110 cycles!
	return E;
}

#define STUMPFF

double SolveCubic(double a, double b, double c)
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
	//	if (b == 0)	d = c*(c/4+a*a*a/27); // defend against a^6 term cancellation (unable to detect any improvement)
	//	d = c * (27 * c + a * (4*a * a - 18 * b)) + b * b* (4 * b - a * a); algebra OK numerically useless

	if (d >= 0.0)
	{ // single real root

		if (r2 < d * 1e-4)
		{
			s = 2 * r / (3 * cbrt(d));
			//	  t = s  - a / 3.0;  // inaccurate when e = E = 1e-5
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a / 3.0; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
#ifndef STUMPFF
			if (s != 0) t = s - q / s - a / 3.0; else t = -a / 3;
#else
			// much smarter analytic solution due to Stumpf
			s = s * s;
			if (s != 0) t = 2 * r * s / (q * q + s * q + s * s) - a / 3.0; // accurate to machine precision over our range of inputs
			else t = -a / 3;
#endif
		}
	}
	else
	{ // three real roots so have to choose the right one
#ifdef CRUDE
		t = q * q * q / (r * r) + 1;
		t = -a / 3;
#else
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t) - a / 3;
#endif
	}
	return t;
// final polish to obtain full machine precision if required
	r = t * (t * (t + a) + b) + c;
	d = t * (3 * t + 2 * a) + b;
	if (r)
	{
		if (d) r2 = r / d;
	}
	else return t;
	//	t = t-r; //NR
	d = r * d / (d * d + r * t * (a + 3 * t)); // Halley
	t = t - d;
	r2 = t * (t * (t + a) + b) + c;
	if (r2 == 0) return t;
	if (r) if (1 + r2 / r < 0.01) d = d / 2;
	d = t * (3 * t + 2 * a) + b;
	d = r2 * d / (d * d + r2 * (a + 3 * t));
	t = t - d;
	r = t * (t * (t + a) + b) + c;
	if (r) if (1 + r2 / r < 0.01) d = d / 2;
	return t;
}
/*
double SolveCubicBM(double a, double b, double c)
{
	// this version follows the same classic algebra as in Appendix A
	// solves a cubic of the form x^3 + a.x^2 + b.x + c = 0
	// it is well behaved provided that a^3/c < 13.5 so that a^6 doesn't dominate
	// The ratio a^3/c is typically about 133*sin(M)^2 in the Kepler problem.
	// The fact that coefficients a and c are in phase and f3, b in quadrature largely protects us
	// from nasty surprises - but this simple routine is not entirely reliable in more tricky cases.
	// Production code should use the faster optimised routine SolveCubicOpt instead

	double q, r, d, s, t;
	q = (3 * b - a * a) / 9;
	r = (9 * a * b - 27 * c - 2 * a * a * a) / 54;
	d = q * q * q + r * r;
	if (d >= 0.0)
	{ // single real root
		d = sqrt(d);
		if (abs(r) < d * 3e-6)
			t = 2 * r / (3 * d);  // when r << d to avoid catastrophic rounding errors
		else
		{
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
*/

// notes on the cubic solver cencellation errors from random challenge test 10^9
// MUST be compiled with high optimisation to get these results!

// algorithm	 error		e			M			a^6/c	ba^4/c
// original		-1.7e-15	0.019638	3.11938		0.000757 4.6e-5
// algebra		+1.7e-15	0.107		3.139212	 -0.123	0.0414

// a/3 fixup    -1.6e-15	-0.07391	3.1077		-0.035	 0.0076
//				+1.6e-15	 0.01448    3.1139		 0.003	 1.3e-5

// +Halley		-1.6e-16	-0.998914	6.69e-3		-99.7	0.666
//				 1.6e-16	-0.999685	7.10e-3		-99.9	0.710

// If you care about optimum precision one iteration of NR/Halley improves the answer.
// we don't care in this application since the next step *is* NR/Halley/D4/D5

double SolveCubicOpt(double a, double b, double c)
{
	// this elegant version prescales a first and so
	// avoids some rounding errors from division by 27 

	double a2, d, q, r, r2, s, s2, t;
	a = a / 3.0;
	a2 = a * a;
	q = b / 3.0 - a2;
	r = (a * b - c) / 2.0 - a * a2;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
		if (r2 < d * 7e-5)  // higher order approximation used here
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order
		}
		else
		{
			d = sqrt(d);

			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
			s2 = s * s;
			if (s != 0) t = 2 * r * s2 / (q * q + s2 * q + s2 * s2) - a; // accurate to machine precision over our range of inputs
			else t = -a;
			if (s != 0) t = s - q / s - a; else t = -a;
		}
	}

	else
	{

		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t) - a;
	}
	return t;
	// optional NR polish of root (not needed in this application)

	r = t * (t * (t + 3 * a) + b) + c;
	d = 3 * t * (t + 2 * a) + b;
	if (d) r = r / d;
	//	t = t-r; //NR
	t = t - r / (1 + r * 3 * (a + t)); // Halley
	r2 = t * (t * (t + 3 * a) + b) + c;
	if (r2)
	{
		d = 3 * t * (t + 2 * a) + b;
		if (d) r = r / d;
		//	t = t-r; //NR
		t = t - r / (1 + r * 3 * (a + t));
	}
	return t;
}


double SolveCubicOpt2(double a, double c)
{
	// prefer this version is used when b == 0
	// cancellation of a^6 is done algebraically 

	double d, q, r, r2, s, t;
	a = a / 3.0;
	q = -a * a;
	r = -c / 2.0 + a * q;
	r2 = r * r;
	//d = q*q*q+r*r;
	d = c * (c / 4 - a * q);
	if (d >= 0.0)
	{
		if (r2 < d * 7e-5)  // higher order approximation used here
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order;
		}
		else
		{
			d = sqrt(d);
			if (abs(r) < d * 3e-6)
				t = 2 * r / (3 * cbrt(d * d)) - a / 3.0; // BUGBUG should be 2 * r ...
			else
			{
				if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
				if (s != 0) t = s - q / s - a; else t = -a;
			}
		}
	}
	else
	{
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t) - a;
	}
	return t;
}

double SolveCubicOpt3(double b, double c)
{
	// prefer this version for reduced cubic where a == 0

	double d, q, r, r2, s, t;
	r = -c / 2.0;
	q = b / 3.0;
	r2 = r * r;
	d = q * q * q + r2;
	if (d >= 0.0)
	{
		if (r2 < d * 7e-5)  // higher order approximation used here
		{
			s = 2 * r / (3 * cbrt(d));
			t = r2 / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0); // next highest order;
		}
		else
		{ 
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
			if (s != 0) t = s - q / s; else t = 0;
		}
	}
	else
	{
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t = 2.0 * s * cos(t);
	}
	return t;
}

// this version selects which of the 3 real roots is required
// in the event that the cubic has three distinct real roots.
// this arises in some alterantive formulations of the problem


double SolveCubicOptG(double a, double b, double c, int n)
{
	// this elegant version prescales a, b, c first and so
	// avoids some rounding errors from division by 27 
	// allows user to select which of the 3 real roots to use n = -1,0,1

	double a2, d, q, r, r2, s, t, t1, t2;
	a = a / 3.0;
	a2 = a * a;
	r = (a * b - c) / 2.0 - a * a2;
	q = b / 3.0 - a2;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
		if (r2 < d*1e-5)
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
			if (s != 0) t = s - q / s - a; else t = -a;
		}
	}
	else
	{
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (n)
		{
			if (n > 0)
				t += 2 * pi / 3;
			else
				t -= 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		}
		t = 2.0 * s * cos(t) - a;
		t1 = 2.0 * s * cos(t + 2 * pi / 3)-a;
		t2 = 2.0 * s * cos(t - 2 * pi / 3)-a;
	}
	return t;
}

// end cubic solvers



double TestFun(double x)
{
	return (0.5 - x) * (0.5 - x) + 1;
}

// findstep looks for a discontinuity by binary chop in range a <= x <= c

double FindStep(double a, double c, double(*f)(double))
{
	double b, fa, fb, fc;
	fa = f(a);
	fc = f(c);

	do
	{
		b = (a + c) / 2;
		fb = f(b);
		if (abs(fa - fb) > abs(fb - fc))
		{
			c = b;
			fc = fb;
		}
		else
		{
			a = b;
			fa = fb;
		}
	} while (a != b);

	return b;
}


// golden ratio function minimiser finds the minimum of f(x) in the range a <= x <= d

double GoldenMin(double a, double d, double(*f)(double), int bias)
{
	double b, c, fa, fb, fc, fd, dx, df, ddf, phi, x; // , mid;
	phi = 2 / (1 + sqrt(5.0));  // 0.618..
	x = d - a;
	fa = (*f)(a);
	x = x * phi * phi;
	b = a + x;
	fb = (*f)(b);
	c = d - x;
	fc = (*f)(c);
	fd = (*f)(d);

	while ((x > 0.0001) && (fa != fd) && (fa != fb) && (fb != fc))
	{
		x = x * phi;
		if ((fc < fb) || ((fc == fb) && (fa > fd)))
		{
			a = b;
			fa = fb;
			b = c;
			fb = fc;
			c = d - x;
			fc = (*f)(c);
			if (!(((fb < fa)  && (fb < fc)) || (((fc < fb) && (fc < fd)))))
				x = x; // hook for breakpoint
		}
		else
		{
			d = c;
			fd = fc;
			c = b;
			fc = fb;
			b = a + x;
			fb = (*f)(b);
		}
	}
	if (fa == fd)
	{
		if (bias)
		{
			if (bias < 0) x = a; else x = d;
		}
		else
			x = (a + d) / 2;
	}
	else
	{
		x = x * phi;
		if (fb < fc)
		{
			a = b - x;
			fa = (*f)(a);
		}
		else
		{
			a = b; fa = fb;
			b = c; fb = fc;
			c = b + x;
			fc = (*f)(c);
		}
		df = (fc - fa) / x;
		ddf = (fa + fc - 2 * fb) / x / x;
		if (ddf) dx = df / ddf / 4;
		else
			dx = 0;
		d = b - dx;
		x = d;
		fd = (*f)(d);
		if (fa < fd)
		{
			x = a;
			if (fb < fa)	x = b;
			else
			{
				if (fc < fa) x = c;
			}
		}
		else
		{
			if (fb < fd)
				x = b;
			else
			{
				if (fc < fd) x = c;
			}
		}
		if (fb == fc)
		{
			if (!bias) 	x = (b + c) / 2.0;
			else
			{
				if (bias > 0)
					x = c;
				else
					x = b;
			}
		}
	}
	return x;
}

// tries to find a transition to zero in the range a to c 

double find_zero_lo(double a, double c, double f(double))
{
	double b, delta, fa, fb, fc;
	fa = f(a);
	fc = f(c);
	if (fa * fc > 0)
	{
	}
	delta = (c - a) / 2;
	b = a + delta;
	fb = f(b);
	while (b + delta != b)
	{
		delta = delta / 2;
		if (fb * fa > 0)
			b = b + delta;
		else
			b = b - delta;
		fb = f(b);
	}
	while (fb * fa > 0)
	{
		b = b + 2 * delta;
		fb = f(b);
	}
	return b;
}


// tries to find a transition from zero in the range a to c 

double find_zero_hi(double a, double c, double f(double))
{
	double b, delta, fa, fb, fc;
	fa = f(a);
	fc = f(c);
	fb = 1;
	if (fa * fc > 0)
	{
	}
	delta = (c - a) / 2;
	b = a + delta;
	while (b + delta != b)
	{
		fb = f(b);
		delta = delta / 2;
		if (fb * fc > 0)
			b = b - delta;
		else
			b = b + delta;
	}
	while (fb * fc > 0)
	{
		b = b - 2 * delta;
		fb = f(b);
	}
	return b;
}


double myfun(double x)
{
	return cos(x);
}

void Test_find_zero()
{
	find_zero_lo(0.0, 3.0, myfun);
	find_zero_hi(0.0, 3.0, myfun);


}

// ACM algortithm 954 (untested - static analysis errors fixed)
// constants don't look anything like precise enough to me. 
// NAGlib has an alternative cubic equation solver 

double SolveCubic954(double c2, double c1, double c0)
{
	double const one27th = 1.0 / 27.0;
	double const two27th = 2.0 / 27.0;
	double const third = 1.0 / 3.0;
	double const p1 = 1.09574;
	double const q1 = 3.239e-1;
	double const r1 = 3.239e-1;
	double const s1 = 9.57439e-2;
	double const p3 = 1.14413;
	double const q3 = 2.75509e-1;
	double const r3 = 4.45578e-1;
	double const s3 = 2.59342e-2;
	double const q4 = 7.71845e-1;
	double const s4 = 2.28155e-1;

	double const p51 = 0.878558;
	double const p52 = 0.192823;
	double const p53 = 1.19748;
	double const p54 = 0.345219;
	double const q51 = 0.571888;
	double const q52 = 0.566324;
	double const q53 = 0.283772;
	double const q54 = 0.401231;
	double const r51 = 0.711154;
	double const r52 = 0.505734;
	double const r53 = 0.837476;
	double const r54 = 0.207216;
	double const s51 = 0.322313;
	double const s52 = 0.264881;
	double const s53 = 0.356228;
	double const s54 = 4.45532e-3;
	double const macheps = 2e-16;
	int osc;
	bool bisect, converged;

	double a0, a1, a2, a, b, c, x, y, z, s, t, u, k, xShift;

	// only consider general case.

	x = abs(c2);
	y = sqrt(abs(c1));
	z = pow(abs(c0), third);
	u = fmax(x, fmax(y, z));
	if (u == x)
	{
		k = 1.0 / x;
		a2 = copysign(1.0, c2);
		a1 = c1 * k * k;
		a0 = c0 * k * k * k;
	}
	else
	{
		if (u == y)
		{
			k = 1.0 / y;
			a2 = c2 * k;
			a1 = copysign(1.0, c1);
			a0 = c0 * k * k * k;
		}
		else
		{
			k = 1.0 / z;
			a2 = c2 * k;
			a1 = c1 * k * k;
			a0 = copysign(1.0, c0);
		}
	}
	if (a0 == 1.0)
	{
		x = -p1 + q1 * a1 - a2 * (r1 - s1 * a1);
		a = a2;
		b = a1;
		c = a0;
		xShift = 0;
	}
	else
	{// code added MTB 21/2/23 to satisfy static analysis some paths otherwise don't init a,b,c
		a = a2;
		b = a1;
		c = a0;
		// BUGBUG may not be correct - I suspect a typo somewhere.
		if (a0 == -1.0)
		{
			x = p1 - q1 * a1 - a2 * (r1 - s1 * a1);
			a = a2;
			b = a1;
			c = a0;
			xShift = 0;
		}
		else
		{
			if (a1 == 1.)
			{
				if (a0 > 0)
					x = a0 * (-q4 - s4 * a2);
				else
					x = a0 * (-q4 + s4 * a2);
				a = a2;
				b = a1;
				c = a0;
				xShift = 0;
			}
			else
			{
				if (a1 == -1.0)
				{
					y = two27th;
					y = y * a2;
					y = y * a2 - third;
					y = y * a2;
					if (a0 < y)
						x = +p3 - q3 * a0 - a2 * (r3 + s3 * a0);
					else
						x = -p3 - q3 * a0 - a2 * (r3 - s3 * a0);
					a = a2;
					b = a1;
					c = a0;
					xShift = 0;
				}
				else
				{
					if (a2 == 1.0)
					{
						b = a1 - third;  //bugbug
						c = a0 - one27th;
						if ((abs(b) < macheps) && (abs(c) < macheps))
						{
							x = -third * k;
							return x;
						}
						else
						{
							y = third * a1 - two27th;
							if (a1 <= third)
							{
								if (a0 > y)
									x = -p51 - q51 * a0 + a1 * (r51 - s51 * a0);
								else
									x = +p52 - q52 * a0 - a1 * (r52 + s52 * a0);
							}
							else
							{
								if (a0 > y)
									x = -p53 - q53 * a0 + a1 * (r53 - s53 * a0);
								else
									x = +p54 - q54 * a0 - a1 * (r54 + s54 * a0);
							}
							if ((abs(b) < 0.01) && (abs(c) < 0.01))
							{
								c = -third * b + c;
								if (abs(c) < macheps) c = 0.0;
								a = 0.0;
								xShift = -third;
								x = x + third;
							}
							else
							{
								a = a2;
								b = a1;
								c = a0;
								xShift = 0;
							}
						}
					}
					else
					{
						if (a2 == -1.0)
						{
							b = a1 - third;
							c = a0 + one27th;
							if ((abs(b) < macheps) && (abs(c) < macheps))
							{
								x = third * x;
								return x;
							}
							else
							{
								y = two27th - third * a1;
								if (a1 <= third)
								{
									if (a0 < y)
										x = +p51 - q51 * a0 - a1 * (r51 + s51 * a0);
									else
										x = -p52 - q52 * a0 + a1 * (r52 - s52 * a0);
								}
								else
								{
									if (a0 > y)
										x = +p53 - q53 * a0 - a1 * (r53 + s53 * a0);
									else
										x = -p54 - q54 * a0 + a1 * (r54 - s54 * a0);
								}
							}
							if ((abs(b) < 0.01) && (abs(c) < 0.01))
							{
								c = third * b + c;
								if (abs(c) < macheps) c = 0.0;
								a = 0.0;
								xShift = -third;
								x = x + xShift;
							}
							else
							{
								a = a2;
								b = a1;
								c = a0;
								xShift = 0;
							}
						}
					}

				}
			}
		}

		z = z + a;
		y = x + z;
		z = z * x + b;
		y = y * x + z; // C'(x)
		z = z * x + c; // C(x)
		t = z;
		x = x - z / y;

		osc = 0;
		bisect = true;
		converged = false;
		while ((!bisect) && (!converged))
		{
			z = x + a;
			y = x + z;
			z = z * x + b;
			y = y * x + z;
			z = z * x + c;
			if (z * t < 0.0)
			{
				if (z < 0) osc++;
				s = x; // save lower
			}
			else
				u = x;
			y = z / y;
			x = x - y;
			bisect = osc > 2;
			converged = abs(y) <= abs(x) * macheps;
		}

		if (bisect)
		{
			t = u - s;
			while (abs(t) > abs(x) * macheps)
			{
				z = x + a;
				z = z * x + b;
				z = z * x + c;
				if (z < 0)
					s = x;
				else
					u = x;
				t = 0.5 * (u - s);
				x = s + t;
			}
		}
		x = x - xShift;
		return x;
	}
	return x;
}


