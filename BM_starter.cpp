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
#include "solver.h"

#define OLDCOEFF

double MTB_BasicP30(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;
	double const KC = 1 / 6.790135820951347;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = pi / 2 - M;
	if (abs(s) < 1e-6) c = s;
	else c = s - s * s * s * KC;
	if (M < pi / 2)
	{
		s2 = M * M;
		s = M - M * s2 * KC;
	}
	else
	{
		s = pi - M;
		s2 = s * s;
		s = s - s * s2 * KC;
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP50(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;
	double const KC50 = 0.0078601762643175;
	e2 = e * e;
	B = 7;
	C = 3;

	// no trig crude fast "approximations" *very* approx

	s = pi / 2 - M;
	c = s - s * s * s * (1.0 / 6 - KC50 * s * s);
	if (M < pi / 2) s = M; else s = pi - M;
	if (s > 3e-6)
	{
		s2 = s * s;
		s = s - s * s2 * (1.0 / 6 - KC50 * s2);
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP70old(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;
//	double const KC = 4 / (pi * pi);
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = pi / 2 - M;
	s2 = s * s;
	c = s * (1 - s2 * (1 - s2 * (1 - s2 / 43.45) / 20) / 6);
	if (M < pi / 2)
	{
		s2 = M * M;
		s = M * (1 - s2 * (1 - s2 * (1 - s2 / 43.45) / 20) / 6);
	}
	else
	{
		s = pi - M;
		s2 = s * s;
		s = s * (1 - s2 * (1 - s2 * (1 - s2 / 43.45) / 20) / 6);
	}

	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP70(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;
	double const KC70 = 0.0230116004550837966;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = pi / 2 - M;
	s2 = s * s;
	c = s * (1 - s2 * (1 - s2 * (1 - KC70 * s2) / 20) / 6);
	//	c = 1 - s2*(0.5-s2*(1.0/24-s2/720));
	if (M < pi / 2) s = M; else s = pi - M;
	if (M > 3e-6)
	{
		s2 = s * s;
		s = s * (1 - s2 * (1 - s2 * (1 - KC70 * s2) / 20) / 6);
	}

	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP90(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;
	double const KC90 = 0.0135822185062586	;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = pi / 2 - M;
	s2 = s * s;
	c = s * (1 - s2 * (1 - s2 * (1 - s2 * (1 - KC90*s2) / 42) / 20) / 6);
	if (c > 1) c = 1;
	if (M < pi / 2) s = M; else	s = pi - M;
	if (s > 3e-6)
	{
		s2 = s * s;
		s = s * (1 - s2 * (1 - s2 * (1 - s2 * (1 - KC90 * s2) / 42) / 20) / 6);
	}
	//	s = s * (1 - s2 * (1 - s2 * (1 - s2 * (1 - s2 / 73.78278954) / 41.99917) / 19.999989) / 6.000000054);

	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}

#define CRUDEP

// to remain accurate in critical areas approximations for sin and cos
// cos(M) *MUST* be exactly 1 for small M and sin(M) ~ M
// tiny errors in cos(M) when M is small produce huge errors in E
// These routines were a first attempt to understand timing
// They are largely redundant since the tan half angle forms
// using polynomials are way better accuracy and simpler to code
// P20 runs faster than the simplest no sin/cos code BasicV? BUGBUG (check)

double MTB_BasicP20(double e, double M)
{
	double  a, b, c, E, s, t, e2, f3, B, C;
//	double const KC = 4 / (pi * pi);
	e2 = e * e;
	B = 7;
	C = 3;
	/*
		f3 = 1.0/((60+C*e2)*cos(M)-e*(60-B*e2));
		a = -(60+C*e2)*sin(M)*f3;
		b = 60*(cos(M)-e)*f3;
		c = -60*sin(M)*f3;
	*/
	// no trig crude fast "approximations" *very* approx
	t = 2 * M / pi - 1;
	s = 1 - t * t;
	//	s = M-pi/2;
	//	s = 1-s*s*(0.515-0.10971*fabs(s)*2/pi);
	if (M < pi / 2)
	{
		if (s < 0.6) s = M;
		c = 2 * M / pi;
		c = 1 - c * c;
	}
	else
	{
		c = pi - M;
		if (s < 0.6) s = c;
		c = c * 2 / pi;
		c = -1 + c * c;
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}
const double KL = 0.47; //was  KL = 4.5 / (pi * pi);

double MTB_BasicP20a(double e, double M)
{
	double  a, b, c, E, s, t, e2, f3, B, C;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx
	t = M - pi/2;
	s = 1 - KL*t * t;
	if (M < pi / 2)     // logic here only good for M>=0
	{
		if (abs(M) < pi / 6) s = 0.97*M ;
		c = 1 - KL*M*M;
		if (abs(M - pi / 2) < pi / 6) c = 0.97*(pi/2-abs(M));
	}
	else
	{
		if (abs(M) > 5 * pi / 6) s = 0.97*(pi-M);
		c = pi - M;
		c = -1 + KL*c * c;
		if (abs(M - pi / 2) < pi / 6) c = 0.97*(pi / 2 - abs(M));
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP40(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	double const KC40 = 0.03838666;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx
	s = M - pi / 2;
	s2 = s * s;
	s = 1 - s2 * (0.5 - KC40 * s2);
	if (M < pi / 2)
	{
		if (M < 3e-6) s = M;
		c2 = M * M;
		c = 1 - c2 * (0.5 - KC40 * c2);
	}
	else
	{
		c = pi - M;
		c2 = c * c;
		c = -1 + c2 * (0.5 - KC40 * c2);
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP60(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	double const KC60 = 0.00132934;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = M - pi / 2;
	s2 = s * s;
	s = 1 - s2 * (0.5 - s2 * (1.0 / 24 - KC60*s2));
	if (M < pi / 2)
	{
		if (M < 0.13)  s = M*(1-M*M/8);
		c2 = M * M;
		c = 1 - c2 * (0.5 - c2 * (1.0 / 24 - KC60*c2));
	}
	else
	{
		c = pi - M;
		c2 = c * c;
		c = -1 + c2 * (0.5 - c2 * (1.0 / 24 - c2 / 752.2530));
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}

double MTB_BasicP80(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	double const KC80 = 0.01737661
		;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	s = M - pi / 2;
	if (M < 3e-6) s = M;
	else
	{
		s2 = s * s;
		s = 1 - s2 * (0.5 - s2 * (1.0 - s2 * (1 - KC80 * s2) / 30) / 24);
	}
	if (M < pi / 2)
	{
		c2 = M * M;
		c = 1 - c2 * (0.5 - c2 * (1.0 - c2 * (1 - KC80*c2) / 30) / 24);
	}
	else
	{
		c = pi - M;
		c2 = c * c;
		c = -1 + c2 * (0.5 - c2 * (1.0 - c2 * (1 - c2 / 57.54863) / 30) / 24);
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP32(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx
	c = pi / 2 - M;
	c2 = c * c;
	c = c * (60.0168 - 6.7105 * c2) / (60 + 3.35 * c2);
	if (M < pi / 2)
	{
		s2 = M * M;
		s = M * (60.0168 - 6.7105 * s2) / (60 + 3.35 * s2);
	}
	else
	{
		s = pi - M;
		s2 = s * s;
		s = s * (60.0174 - 6.7105 * s2) / (60 + 3.35 * s2);
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}



double MTB_BasicP32a(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	c = pi / 2 - M;
	c2 = c * c;
	c = c * (60.0168 - 6.7105 * c2) / (60 + 3.35 * c2);
	if (M < pi / 4)
	{
		s2 = M * M;
		s = M * (60.0168 - 6.7105 * s2) / (60 + 3.35 * s2);
	}
	else 
	{
		if (M > 3 * pi / 4)
		{
			s = pi - M;
			s2 = s * s;
			s = s * (60.0174 - 6.7105 * s2) / (60 + 3.35 * s2);
		}
		else
		{
			c = pi / 2-M;
			s = (12 - 5 * c * c) / (12 + c * c);
			c = c * (60 - 7 * c * c) / (60 + 3 * c * c);
		}

	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}



double MTB_BasicP32ND(double e, double M)
{
	double  a, b, c, cd, cn, E, s, sd, sn, s2, c2, t, e2, f3, B, C;

	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	c = pi / 2 - M;
	c2 = c * c;
	cn = c * (60.0168 - 6.7105 * c2);
	cd = (60 + 3.35 * c2);
	if (M < pi / 2) s = M; else s = pi - M;
	s2 = s * s;
	sn = s * (60.0174 - 6.7105 * s2);
	sd = (60 + 3.35 * s2);

	f3 = 1.0 / (sd * ((60 + C * e2) * cn - e * (60 - B * e2) * cd));
	a = -(60 + C * e2) * sn * f3 * cd;
	b = 60 * (cn - e * cd) * f3 * sd;
	c = -60 * sn * f3 * cd;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP52old(double e, double M)
{
	double  a, b, c, E, s, s2, c2, t, e2, f3, B, C;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx
	if (M < pi / 2)
	{
		s = M;
		s2 = s * s;
		s = s - s * s2 * (419.9633 - 10.96028 * s2) / (2520 + 60.00154 * s2);
		c2 = M * M;
		c = 1 - c2 * (15 - 0.75 * c2) / (30 + c2);
	}
	else
	{
		c = pi - M;
		c2 = c * c;
		s = c - c * c2 * (419.9633 - 10.96028 * c2) / (2520 + 60.00154 * c2);
		c = c2 * (15 - 0.75 * c2) / (30 + c2) - 1;
	}
	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP52(double e, double M)
{
	double  a, b, c, E, s, s2, t, e2, f3, B, C;

	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	if (M < pi / 2)
	{
		s = M;
		s2 = s * s;
		c = 1 - s2 * (60.096 - 2.991 * s2) / (120.23 + 3.994 * s2);
	}
	else
	{
		s = pi - M;
		s2 = s * s;
		c = -1 + s2 * (60.096 - 2.991 * s2) / (120.23 + 3.994 * s2);
	}

	s = s - s * s2 * (419.9633 - 10.96028 * s2) / (2520 + 60.00154 * s2);

	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (c - e) * f3;
	c = -60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_BasicP52ND(double e, double M)
{
	double  a, b, c, cd, cn, E, s, sd, sn, s2, t, e2, f3, B, C;

	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "approximations" *very* approx

	if (M < pi / 2)
	{
		s = M;
		s2 = s * s;
		cd = (120.23 + 3.994 * s2);
		cn = cd - s2 * (60.096 - 2.991 * s2);
	}
	else
	{
		s = pi - M;
		s2 = s * s;
		cd = (120.23 + 3.994 * s2);
		cn = -cd + s2 * (60.096 - 2.991 * s2);
	}

	sd = (2520 + 60.00154 * s2);
	sn = s * sd - s * s2 * (419.9633 - 10.96028 * s2);

	f3 = 1.0 / (sd * ((60 + C * e2) * cn - cd * e * (60 - B * e2)));
	a = -(60 + C * e2) * sn * cd * f3;
	b = 60 * (cn - cd * e) * sd * f3;
	c = -60 * sn * cd * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}



double MTB_BasicQ(double e, double M)
{
	// rescaled with 3x f3 explicit divides
	double  a, b, c, E, t, e2, f3;
	e2 = e * e;
#ifdef STRICT
	f3 = (1 + 0.05 * e2) * cos(M) - e * (1 - 7 * e2 / 60);  // 3 explicit divides as per algebra
	a = -(1 + 0.05 * e2) * sin(M) / f3;
	b = (cos(M) - e) / f3;
	c = -sin(M) / f3;
#else
#ifdef FAST
	f3 = 1.0 / ((60 + 3 * e2) * M - e * (1 - 7 * e2));
	a = -(60 + 3 * e2) * M * f3;
	b = 60 * (M - e) * f3;
	c = -60 * M * f3;
#else
	f3 = 1.0 / ((1 + 0.05 * e2) * cos(M) - e * (1 - 7 / 60 * e2));  // divides are so slow and the compiler so stupid (manually optimised)
	a = -(1 + 0.05 * e2) * sin(M) * f3;
	b = (cos(M) - e) * f3;
	c = -sin(M) * f3;
#endif
#endif
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}



double MTB_BasicT(double e, double M)
{
	// no trig functions - simplest possible fast alternative
	double KCV = pi * pi / (pi * pi - 8); // was 5.279 evaluates to 5.278980085...

	double  a, b, c, B, C, E, s, s2, t, e2, f3; // , B, C;
	e2 = e * e;
	B = 7;
	C = 3;
	// no trig crude fast "Pade approximation on 0-pi/2" 
	if (M < pi / 2)
	{
		s = M;
		s2 = s * s;
		c = 1 - KCV * s2 / (2 * KCV + s2);
	}
	else
	{
		s = pi - M; 
		s2 = s * s;
		c = -1 + KCV * s2 / (2 * KCV + s2);
	}
//	c *= 1 - 5.279 * s2 / (2 * 5.279 + s2); // this line ~16 cycles is 5 cycles slower than alternative (true cost of a multiply?)
	s = s * (1 - 6.7968/60 * s2) / (1 + 3.2032/60 * s2); // lowest order sin 3,2
// dividing through by 60 runs faster here but not for f3,a,b,c! Don't know why


	f3 = 1.0 / ((60 + C * e2) * c - e * (60 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60*(c - e) * f3;
	c = - 60 * s * f3;

	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}

double MTB_BasicR(double e, double M)
{
	// rescaled and single divide 3 multiplies
	double  a, b, c, E, t, e2, f3;
	e2 = e * e;
	f3 = 1.0 / ((1 + 0.05 * e2) * cos(M) - e * (1 - 7 * e2 / 60));
	a = -(1 + 0.05 * e2) * sin(M) * f3;
	b = (cos(M) - e) * f3;
	c = -sin(M) * f3;
	t = SolveCubicBM(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M; // this line takes -110 cycles!
	return E;
}


double MTB_BasicS(double e, double M)
{
	// no cubic solver used (answers meaningless)
	double  a, b, c, E, t, e2, f3;
	e2 = e * e;
	f3 = 1.0 / ((60 + 3 * e2) * cos(M) - e * (60 - 7 * e2));
	a = -(60 + 3 * e2) * sin(M) * f3;
	b = 60 * (cos(M) - e) * f3;
	c = -60 * sin(M) * f3;
	//	t = SolveCubic(a,b,c);
	t = a + b + c;
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M; // this line takes -110 cycles!
	return E;
}

double MTB_BasicA(double e, double M)
{
	// no atan used (answer meaningless)
	double  a, b, c, E, t, e2, f3;
	e2 = e * e;
	f3 = 1.0 / ((60 + 3 * e2) * cos(M) - e * (60 - 7 * e2));
	a = -(60 + 3 * e2) * sin(M) * f3;
	b = 60 * (cos(M) - e) * f3;
	c = -60 * sin(M) * f3;
	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	//	E = atan2(t,a);
	E = t;
	if (abs(E) < abs(M)) E = M; // this line takes -110 cycles!
	return E;
}
double MTB_BasicZ(double e, double M)
{
	// defensive test removed so that E>=M not enforced
	// some MS compilers generate slow code with this line missing!

	double  a, b, c, E, t, e2, f3;
	e2 = e * e;
	f3 = 1.0 / ((60 + 3 * e2) * cos(M) - e * (60 - 7 * e2));
	a = -(60 + 3 * e2) * sin(M) * f3;
	b = 60 * (cos(M) - e) * f3;
	c = -60 * sin(M) * f3;
	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	//	if (abs(E)<abs(M)) E=M; // this line takes -110 cycles!
	return E;
}
