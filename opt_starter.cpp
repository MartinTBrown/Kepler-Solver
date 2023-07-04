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
#include "solver.h"
#include "opt_starter.h"
#include "deltas.h" 

#define OLDT2

#define INLINE

// on the MS compiler I see no difference for inlining the solver and possibily a slight slowing down by 3-5 cycles.
// this could be a benchmarking artefact since the solver code will be preloaded into CPU cache when not inlined.

#ifdef INLINE
#define SolveCubic(a,b,c) SolveCubicInline(a,b,c)
#endif 

// these are the two optimsed for accuracy versions now used as a reference since they are typically
// more accurate than the original classical methods I first used as a reference code at the outset

double MTB_Reference(double e, double M)
{
	double E; // ,ec, f,f1, f2, df,s;
	E = MTB_BasicOpt(e, M);
	if (e < 0) e = 1 + e;
	if (e < 0.65) return E;
	if (M < 2e-10) return E;
	if (M > 3.1) return E;
	return E + Classic_NR80(e, M, E); // defaults to NR if 80 bit unsupported
}

double MTB_Polish(double e, double M)
{
	double E, d2;
	E = MTB_BasicOpt(e, M);
	if (M < 1e-10) return E;
	if (e < 0) e = e + 1;
	//	   d2 = Classic_NR(e, M, E); // simple minded naive M+e*sin(E)-E
	d2 = Classic_NR80(e, M, E);  // ultimate gold standard full 80 bit code (slow)
//	d2 = Kepler_NR80(e, M, E); // 80 bit simple NR errors when E-E0 < 4e-15 can't be corrected at low or high M
//	f1 = Gooding_Fixup(e, M, E);
//	f2 = Gooding_Fixup80(e, M, E);
//	E = E + d2;
//	d2 = Kepler_NR80(e, M, E*(1+4e-12));
//	
	return E + d2;    // f2 is scratty some outside 1e-12
}



// These explore various gofaster options and optimisations in the hope of matching FLM95 performance
// none of them quite make the grade but D4TI_Best2tp54  comes very close

// There are still a few tricks for tan(E/2) speed and accuracy that remain to be explored.

double D3T_Basic2t(double e, double M)
{
	double  a, b, c, E, t, t2, e2, f3;
	e2 = e * e;
	t = tan(M / 2);
	t2 = t * t;
	f3 = 1 / ((60 + 3 * e2) * (1 - t2) - (1 + t2) * e * (60 - 7 * e2));  // divides are so slow and the compiler so stupid (manually optimised)
	a = -(60 + 3 * e2) * 2 * t * f3;
	b = 60 * f3 * (1 - e - t2 * (1 + e));
	c = -60 * 2 * t * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { E = -t; a = -1.0; }
	else { E = t; a = 1.0; }
	E = atan2(E, a);
	if (abs(E) < abs(M)) E = M;
	if (M < 6.1e-6) return E;
	if (abs(M) > 3.13) return E;
	return E + HalleyT(e, M, E, t);  // NB t preserves sign 
}

double MTB_Basic2tp52(double e, double M)
{
	// original method preserved as OLDT2 on some compilers it runs faster

	double  a, b, c, E, t, td, t2, td2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) // was pi/4
	{
		t = M / 2;
		t2 = t * t;
		t = t + t * t2 * (210 - t2) / (630 - 255 * t2);
		t2 = t * t;
#ifdef OLDT2
		f3 = 1 / ((60 + 3 * e2) * (1 - t2) - (1 + t2) * e * (60 - 7 * e2));
		b = 60 * (1 - t2 - e * (1 + t2)) * f3;
#else
		td2 = td = 1;
#endif
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t;
#ifdef OLDT2
		t = t + t * t2 * (210 - t2) / (630 - 255 * t2);
		t2 = t * t;
		f3 = 1 / ((60 + 3 * e2) * (t2 - 1) - (1 + t2) * e * (60 - 7 * e2));
		b = 60 * (t2 - 1 - e * (1 + t2)) * f3;
	}
#else
		td = t + t * t2 * (210 - t2) / (630 - 255 * t2);
		td2 = td * td;
		t = t2 = 1;

	}
	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (t2	+ td2) * e * (60 - 7 * e2));  // note code now common with t & td swapped
	b = 60 * (td2 - t2 - e * (t2 + td2)) * f3;
#endif
	a = -(60 + 3 * e2) * 2 * t * f3;
	c = -60 * 2 * t * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp56(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) // was pi/4
	{
		t = M / 2;
		t2 = t * t;
		t = t * (10395 - t2 * (1260 - 21 * t2));
		td = 10395 - t2*(4725 -t2*(210 -t2));
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t; 
		td = t * (10395 - t2 * (1260 - 21 * t2));
		t = 10395 - t2 * (4725 - t2 * (210 - t2));
	}
	f3 = t / td;
	t2 = tan(M / 2);
	t2 = t * t;
	td2 = td * td;
	f3 = ((1 + 0.05 * e2) * (td2 - t2) - (td2 + t2) * e * (1 - 7.0 / 60 * e2));
	b = ((td2 - t2) - e * (td2 + t2)) / f3;
	c = -2 * t * td / f3;
	a = -(1 + 0.05 * e2) * 2 * t * td / f3;
#ifdef INLINE
	t = SolveCubicInline(a, b, c);  // SolveCubicOpt mysteriously slower here
#else
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
#endif
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }

	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}

double MTB_Basic2tp54(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) // was pi/4
	{
		t = M / 2;
		t2 = t * t;
		td = 945 - t2 * (420 - 15 * t2);
		t = t * (945 - t2 * (105 - t2));
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t;
		td = t * (945 - t2 * (105 - t2));
		t = 945 - t2 * (420 - 15 * t2);
	}
	t2 = t * t;
	td2 = td * td;
	f3 = ((1 + 0.05 * e2) * (td2 - t2) - (td2 + t2) * e * (1 - 7.0 / 60 * e2));
	b = ((td2 - t2) - e * (td2 + t2)) / f3;
	c = -2 * t * td / f3;
	a = -(1 + 0.05 * e2) * 2 * t * td / f3;
#ifdef INLINE
	t = SolveCubicInline(a, b, c);  // SolveCubicOpt mysteriously slower here
#else
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
#endif
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }

	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	if (M < 1e-9) return E;
	return E;
//	return E + FLM_D4T(e, M, E, a * t);
}


double D4T_Basic2tp52(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) 
	{
		t = M / 2;
		t2 = t * t;
		td = 630 - 255 * t2;
		t = t * (630 - t2 * (45 + t2));
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t;
		td = t * (630 - t2 * (45 + t2));
		t = 630 - 255 * t2;
	}
	t2 = t * t;
	td2 = td * td;
	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { td = -t; a = -1.0; }
	else { td = t;  a = 1.0; }
	E = atan2(td, a);
	if (abs(E) < abs(M)) E = M;
	if (M < 1e-10) return E;
	return E + FLM_D4T(e, M, E, t);
}

double MTB_Best2tp54Opt(double e, double M)
{
	double  a, b, c, d, d2, B, C, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M > 0) a = M; else a = -M;  // considerably faster than fabs() !
	if (a < pi / 2 - e)  // much faster, effective but impure - scope to improve too
	{
		d = 1 - (a / (pi / 2 - e));
		b = 1.226 - 1.054 * e;
		c = -0.23 + 0.51 * e; // .229
	}
	else
	{
		d = 1 - ((pi - a) / (pi / 2 + e));
		b = 1.236 + 0.87 * e;
		c = -0.367 - 2.06 * e;
	}
	// this code gets 3ppm
	d2 = d * d;
	d = 1 - d2 * (b + c * d2);
	if (d < 0.57) d = 0;
	if (M > 2.2) d = 0;
	d = d * e;
	d2 = d * d;
	// new code

	if (M < pi / 2) // was pi/4
	{
		t = M / 2;
		t2 = t * t;
		td = 945 - t2 * (420 - 15 * t2);
		t = t * (945 - t2 * (105 - t2));
		//		td = 630 - 255 * t2;
		//		t = t * (630 - t2 * (45 + t2));
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t;
		//		td = t * (630 - t2 * (45 + t2));
		//		t = 630 - 255 * t2;
		td = t * (945 - t2 * (105 - t2));
		t = 945 - t2 * (420 - 15 * t2);
	}
	t2 = t * t;
	td2 = td * td;

	B = 7 - d * (0.1118 - 0.00306 * d);
	C = 3 + d * (0.1118 + 0.00265 * d);
	f3 = 60.0 / ((60 + C * e2) * (td2 - t2) - (td2 + t2) * e * (60 - B * e2 + d2 * d2 * d2 / 4200.0)); // was 4200
	a = -(1 + C * e2 / 60) * 2 * t * td * f3;
	b = (td2 - t2 - e * (td2 + t2)) * f3;
	c = -2 * t * td * f3;
#ifdef INLINE
	t = SolveCubicInline(a, b, c);  // SolveCubicOpt mysteriously slower here
#else
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
#endif

	if (t * M < 0) { td = -t; a = -1.0; }
	else { td = t;  a = 1.0; }
	E = atan2(td, a);
	if (abs(E) < abs(M)) E = M;
//	if (M < 1e-20) return E; can't skip out here - root is too approximate
	return E + FLM_D4TI(e, M, E, t); // hardened to handle e ~ 1 and M << E << 1
}


double MTB_Basic2tp30(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	const double KT30 = 0.428;
	e2 = e * e;
	if (M < pi / 2) 
	{
		t = M / 2;
		t2 = t * t;
		td = 1;
		td2 = td * td;
		t = t * (1+ KT30*t2);
		t2 = t * t;
	}
	else
	{
		td = pi / 2 - M / 2;
		td2 = td * td;
		t = 1;
		t2 = t * t;
		td = td * (1+KT30*td2);
		td2 = td * td;
	}
	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp50a(double e, double M)
{
	// this one deliberately left in the old style before
	// swaping numerator and demoninator to factor out common code
	// on some compilers it runs faster
	const double KT50 = 0.1718;
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) 
	{
		t = M / 2;
		t2 = t * t;
		td = 1;
		td2 = td * td;
		t = t * (1 + t2/3 + KT50*t2*t2);
		t2 = t * t;
		f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
		b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	}
	else
	{
		t = pi / 2 - M / 2;
		t2 = t * t;
		td = 1;
		td2 = td * td;
		t = t * (1+t2*(1.0/3+KT50*t2));
		t2 = t * t;
		f3 = 1 / ((60 + 3 * e2) * (t2 - td2) - (td2 + t2) * e * (60 - 7 * e2));
		b = 60 * (t2 - td2 - e * (td2 + t2)) * f3;
	}
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp70(double e, double M)
{
	const double KT70 = 0.070372125;
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) 
	{
		t = M / 2;
		t2 = t * t;
		td = 1;
		td2 = td * td;
		t = t * (1 + t2*(1.0 / 3 +t2*(2.0/15 + KT70*t2)));
		t2 = t * t;
	}
	else
	{
		td = pi / 2 - M / 2;
		td2 = td * td;
		t = 1;
		t2 = t * t;
		td = td * (1 + td2*(1.0 / 3+td2*(2.0/15+KT70*td2))); // should be 17/315
		td2 = td * td;
	}

	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp10(double e, double M)
{
	const double KT10 = 1.1575; //1 + pi / 2 - 2 / pi;
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2)
	{
		t = M / 2;
		t2 = t * t;
		td = 1;
		td2 = td * td;
		t = t*KT10;
		t2 = t * t;
	}
	else
	{
		td = pi / 2 - M / 2;
		td2 = td * td;
		t = 1;
		t2 = t * t;
		td = td * KT10;
		td2 = td * td;
	}

	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp32x(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) 
	{
		t = M / 2;
		t2 = t * t;
		td = 6 * t2 - 15;
		t = t * (t2 - 15);
	}
	else
	{
		td = pi / 2 - M / 2;
		td2 = td * td;
//		td = 6 * t2 - 15;    // uses a better approximation p52 for M > pi/2-e (with clear improvement)
//		t = t * (t2 - 15);
		t = 630 - 255 * td2;
		td = t * td + td * td2 * (210 - td2);  
	}
	t2 = t * t;
	td2 = td * td;
	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp52y(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 4) 
	{
		t = M / 2;
		t2 = t * t;
		td = 630 - 255 * t2;
		t = t * td + t * t2 * (210 - t2);
	}
	else
	{
		if (M > 3 * pi / 4)
		{
			td = pi / 2 - M / 2;
			td2 = td * td;
			t = 630 - 255 * td2;
			td = t * td + td * td2 * (210 - td2);
		}
		else
		{
			t = M / 2 - pi / 4;
			t2 = t * t;
			td = 630 - 255 * t2;
			t = t * td + t * t2 * (210 - t2);
			t2 = td + t;
			td = td - t;
			t = t2;
		}
	}
	t2 = t * t;
	td2 = td * td;
	f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
	b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp32b(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2 = e * e;
	if (M < pi / 2) // was pi/4
	{
		t = M / 4;
		t2 = t * t;
		//	  t = t*(15-t2)/(15-6*t2); // 40 cycles not accurate enough
		td = 6 * t2 - 15;
		t = t * (t2 - 15);
		td2 = td * td + t * t;
		t = 2 * t * td;
		td = td2;
		td2 = td * td;
		t2 = t * t;
		f3 = 1 / ((60 + 3 * e2) * (td2 - t2) - (td2 + t2) * e * (60 - 7 * e2));
		b = 60 * (td2 - t2 - e * (td2 + t2)) * f3;
	}
	else
	{
		t = (pi / 2 - M / 2)/2;
		t2 = t * t;
		td = 630 - 255 * t2;
		t = t * td + t * t2 * (210 - t2);
		td2 = td * td + t * t;
		t = 2 * t * td;
		td = td2;
		td2 = td * td;
		t2 = t * t;
		f3 = 1 / ((60 + 3 * e2) * (t2 - td2) - (td2 + t2) * e * (60 - 7 * e2));
		b = 60 * (t2 - td2 - e * (td2 + t2)) * f3;
	}
	a = -(60 + 3 * e2) * 2 * t * td * f3;
	c = -60 * 2 * t * td * f3;
	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Basic2tp32(double e, double M)
{
	double  a, b, c, E, t, td, td2, t2, e2, f3;
	e2= e*e;
	if (M<pi/2) 
	{
	  t = M/2;
	  t2 = t*t;
//	  t = t*(15-t2)/(15-6*t2); // 40 cycles not accurate enough
	  td = 6*t2-15;
	  td2 = td*td;
	  t = t*(t2-15);
	  t2=t*t;
	  f3 = 1/((60+3*e2)*(td2-t2)-(td2+t2)*e*(60-7*e2));
	  b = 60*(td2-t2-e*(td2+t2))*f3;
	}
	else
	{
		t = pi/2-M/2;
		t2 = t*t;
		td = 6 * t2 - 15;
		td2 = td * td;
		t = t * (t2 - 15);
//		td = 630-255*t2;
//		td2 = td*td;             // works better with 5,2 here
//		t = t*td+t*t2*(210-t2);
		t2=t*t;
		f3 = 1/((60+3*e2)*(t2-td2)-(td2+t2)*e*(60-7*e2));
		b = 60*(t2-td2-e*(td2+t2))*f3;
	}
	a = -(60+3*e2)*2*t*td*f3;
	c = -60*2*t*td*f3;
	t = SolveCubic(a,b,c);  // SolveCubicOpt mysteriously slower here
	if (t*M<0) { t= -t; a=-1.0; } else { a=1.0; }
	E = atan2(t,a);
	if (abs(E)<abs(M)) E=M;
	return E;
}

double MTB_BestI(double e, double M)
{
	double  a, b, c, d, d2, E, e2, f3, t, B, C;
	//	if (e < 1) e = 1 + e;
	e2 = e * e;
#ifdef FAST
	if (M > 0) a = M; else a = -M;  // considerably faster than fabs() !
	if (a < pi / 2 - e)  // much faster, effective but impure - scope to improve too
	{
		d = 1 - (a / (pi / 2 - e));
		b = 1.226 - 1.054 * e;
		c = -0.23 + 0.51 * e; // .229
	}
	else
	{
		d = 1 - ((pi - a) / (pi / 2 + e));
		b = 1.236 + 0.87 * e;
		c = -0.367 - 2.06 * e;
	}
#ifdef CRUDE
	d = 1 - d;
	d2 = d;
#else
	// this code gets 3ppm
	d2 = d * d;
	d = 1 - d2 * (b + c * d2);
	if (d < 0.57) d = 0;
	if (M > 2.2) d = 0;
	d = d * e;
	d2 = d * d;
	// new code
#endif
#else
	d = D(e, M);    // globally not too bad approx for E ~5%
//	d = Gooding_S9(e, M)-M;
	d2 = d * d;

	d = e * sin(M + d); // final polish
#endif
/*  previous code */

//	d2 = d2*(2*e-d2);
#ifdef OLDCOEFF
	//
#ifndef CRUDE // 3ppm code 
	d = d * d;
#endif
	// 

	B = 7 - d * (0.1118 - 0.00306 * d);

	C = 3 + d * (0.1118 + 0.00265 * d);

#else
	C = 3.000076514 - d * (0.0011 - 0.07 * d);
	B = 10 - C;
#endif

	/**/
	//	C = 3.000076514-d2*(0.0011-0.0808*d2);
	//	B = 10-C;
#ifdef STRICT
	f3 = 1 / ((60 + C * e2) * cos(M) - e * (60 - B * e2 + 1 * d2 * d2 * d2 / 4200.0)); // was 4300
	a = -(60 + C * e2) * sin(M) * f3;
	b = 60 * (cos(M) - e) * f3;
	c = -60 * sin(M) * f3;
#else
	{double s, s2;
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2;
#ifdef PURE
	s = sin(M);
#else
	s = s * sqrt((1 - s) * (1 + s));
	s += s;
#endif
	f3 = 1.0 / ((60 + C * e2) * (1 - s2) - e * (60 - B * e2 + d2 * d2 * d2 / 4200.0));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (1 - e - s2) * f3;
	c = -60 * s * f3;
	}
#endif
#ifdef INLINE
	t = SolveCubicInline(a, b, c);
#else
	t = SolveCubic(a, b, c);
#endif
	if (t * M < 0) { a = -1.0; } else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M;
	if (M < 1e-9) return E;
	return E + D3TI(e, M, E, t);
//	return E + FLM_D4T(e, M, E, t);; //
	return E + Classic_Halley(e, M, E);
}

double MTB_BasicOpt(double e_in, double M)
{
	// this implementation uses the routines inline and optimsed for accuracy
	// final answer is polished using Halley NB a,b divided by 3 at source
	double  a, b, c, e, em1, e2, E, f3, r, s, s2, t;
	if (M == 0.0) return M;
	if (e_in < 0)
	{
		b = em1 = -e_in;
		e = 1 + e_in;
	}
	else
	{
		b = em1 = 1 - e_in;
		e = e_in;
	}
	e2 = e * e;
	s = sin(M / 2);
	s2 = s * s;
	//	s = s*sqrt(1-s2);
	s2 += s2;
	//	s += s;
	s = sin(M);
	f3 = (60 + 3 * e2) * cos(M) - e * (60 - 7 * e2);
	//	f3 = 60*b+e2*(3+7*e)-(60+3*e2)*s2;
	if (f3 == 0) 	f3 = 1e+16; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0 / f3;    // reciprocal here because optimiser is rather dumb
	a = -(20 + e2) * s * f3;     // a/3
	b = 20 * (b - s2) * f3;			// b/3
	c = -30 * s * f3;			// c/2
//	t = SolveCubicOpt(3*a, 3*b, 2*c);
#ifdef INLINE
	t = SolveCubicInline_Opt(a, b, c);
#else
	{
		double d, q;
		q = b - a * a;
		r = 1.5 * a * b - c - a * a * a;
		d = q * q * q + r * r;

		if (d >= 0.0)
		{
			d = sqrt(d);
			if (abs(r) < d * 3e-6)
				t = 2 * r * cbrt(d) / (3 * d) - a;
			else
			{
#ifdef STRICT		
				if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
#else
				if (r > 0) s = exp(log(r + d) / 3.0); else s = -exp(log(d - r) / 3.0);
#endif
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
	// this is the final inline polish and can be added to any of the original routines

	if (t * M < 0) { a = -1.0; }
	else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M~=pi rounding errors
	if (M < 5e-7) return E;  // exit here to avoid Halley refinement where it cannot improve the answer
#ifdef FAST
	r = t * t;
#ifdef _DEBUG
	c = a * sqrt(1 + r);  // simple minded version fails when r < 10^-16 ie t < 10^-8
#endif
	if (r < 6e-5)
//		c = a + a * r * (4 + r) / (4 * r + 8);
	    c = a + a* r * (32 + 12 * r - r*r) / (64 + 40 * r);
	else
		c = a * sqrt(1 + r);
	r = ((M - E) * c + e * t); // NR refinement

	if (abs(M) < 2e-5)
	{
		double t2, f1, f2;
		t2 = t * t;
		f1 = M * t2 / 2 - M * t2 * t2 / 8 + M * t2 * t2 * t2 / 16;
		f2 = t * (t2 * (t2 * (11.0 / 120 - t2 * (103.0 / 1680 - t2 * (1823.0 / 40320 - t2 * (31373.0 / 887040 - t2 * 265537.0 * t2 / 9225216))))));
		f3 = M + ((e - 1) - t2 / 6) * t;
		f3 = f1 + f2 + f3;
		r = f3;
	}
	if (r)
	{
		b = c - e;
		//  if (b) r = r/b;  // NR
		r = r * b / (b * b + 0.5 * e * t * r);
	}
#else
	if (c != e)
	{
		r = ((M - E) * c + e * t) / (c - e); // NR refinement
		r = r / (1 + 0.5 * e * t * r / c);           // Halley refinement
	}
	else
		r = 0;
#endif
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	return E + r;
}


double MTB_BasicI(double e_in, double M)
{
	// this implementation uses the routines inline and optimsed for accuracy
	// final answer is polished using Halley NB a,b divided by 3 at source
	double  a, b, c, e, em1, e2, E, f3, r, s, s2, t;
	if (M == 0.0) return M;
	if (e_in < 0)
	{
		b = em1 = -e_in;
		e = 1 + e_in;
	}
	else
	{
		b = em1 = 1 - e_in;
		e = e_in;
	}
	e2 = e * e;
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2;
	s = sin(M);
	f3 = (60 + 3 * e2) * cos(M) - e * (60 - 7 * e2);
	//	f3 = 60*b+e2*(3+7*e)-(60+3*e2)*s2;
	if (f3 == 0) 	f3 = 1e+16; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0 / f3;    // reciprocal here because optimiser is rather dumb
	a = -(20 + e2) * s * f3;     // a/3
	b = 20 * (b - s2) * f3;			// b/3
	c = -30 * s * f3;			// c/2
//	t = SolveCubicOpt(3*a, 3*b, 2*c);
	t = SolveCubicInline_Opt(a, b, c);
	if (t * M < 0) { a = -1.0; } else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M=pi rounding errors
	if (M < 5e-10) return E;    // was 5e-7 before improvements to f(e,M,T) below
	// the optimum value to bail out is about here refinement using tan below
	// I don't fully understand exactly why but M = 1-e is still a weak spot eg. e=0.999999 & M=1e-6
	r = t * t;
#if _DEBUG
	c = sqrt(1 + r) - 1;
#endif
	if (r < 1e-3)
//		c = a + a * r * (4 + r) / (4 * r + 8);
//		c = r * (32 + 12 * r - r * r) / (64 + 40 * r);
		c = r * (32 + r * (32 + 6 * r)) / (64 + r * (80 + r * (24 + r)));
	else
		c = sqrt(1 + r)-1;
#ifdef FAST

	f3 = a*(M - E);
	r = f3 + e * t;
	r += c * f3;
	if (abs(M) < 2e-5)  // term by term approximation in the tricky zone (expanded from atan(t) and sqrt(1+t*t))
	{
		double t2, f1, f2;
		t2 = t * t;
		f1 = M * t2 / 2 - M * t2 * t2 / 8 + M*t2*t2*t2/16;
		f2 = t * (t2 *( t2 * (11.0 / 120 - t2*(103.0/1680  - t2*(1823.0/ 40320 - t2*(31373.0/887040-t2*265537.0*t2/9225216))))));
		f3 = M + ((e - 1) -t2/6)* t;
		f3 = f1 + f2 + f3;
		r = f3;
	}
	
	if (r)
	{
		b = a*c + a - e;
		//  if (b) r = r/b;  // NR
		r = r * b / (b * b + 0.5 * e * t * r);
	}
#else
	if (c != e)
	{
		r = ((M - E) * c + e * t) / (c - e); // NR refinement
		r = r / (1 + 0.5 * e * t * r / c);           // Halley refinement
	}
	else
		r = 0;
#endif
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	return E + r;

}

double MTB_BasicOpt_t2(double e, double M)
{
	// this implementation uses the routines inline and optimsed for accuracy
	// final answer is polished using Halley NB a,b divided by 3 at source
	double  a, b, c, e2, E, f3, r, s, t, s2, t2;
	if (M == 0.0) return M;
	e2 = e * e;
	t = tan(M / 2);
	t2 = t * t;
	s2 = 2 * t2 / (1 + t2);
	c = 1 - s2;
	s = 2 * t / (1 + t2);
	f3 = 60 * (1 - e) + e2 * (3 + 7 * e) - (60 + 3 * e2) * s2;
	if (f3 == 0) 	f3 = 1e+16; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0 / f3;    // reciprocal here because optimiser is rather dumb
	a = -(20 + e2) * s * f3;     // a/3
	b = 20 * (1 - e - s2) * f3;			// b/3
	c = -30 * s * f3;			// c/2
#ifdef INLINE
	t = SolveCubicInline_Opt(a, b, c);
#else
	{  double d, q, r2;
		q = b - a * a;
		r = 1.5 * a * b - c - a * a * a;
		r2 = r * r;
		d = q * q * q + r2;

		if (d >= 0.0)
		{
			if (r2 < d * 1e-5)
			{
				s = 2 * r / (3 * cbrt(d));
				//	  t = s  - a / 3.0;  // inaccurate when e = E = 1e-5
				t = r * r / (9 * d);
				t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order
			}
			else
			{
				d = sqrt(d);
				if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
				if (s != 0.0) t = s - q / s - a;
				else t = -a;  // special case arises when e=1 and M=0 or pi
			}
		}
		else
		{
			s = sqrt(-q);  // needed for edge case rounding? error when M ~ pi/2-e and for Better/Best
			d = -r / q / s;
			t = acos(d) / 3.0;
			if (d < 0) t2 = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
			t = 2.0 * s * cos(t2) - a;
		}
	}
#endif
	if (t * M < 0) { a = -1.0; }
	else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M=pi rounding errors
	if (M < 0e-9) return E;
	if (abs(M) > 3.13) return E;
	{
		double t2, t2p1, f, d3En, d3Ed, d4E, df, ddf, dddf;
		//		t = tan(E/2);

  	    t2p1 = sqrt(t * t + 1);  // convert to tan of the half angle
		if (t > 0)
			t = t / (1 + t2p1);
		else
		{
			if (t == 0) t = 0;
			else
				t = -(1 + t2p1) / t;
		}

		t2 = t * t;
		f = (M - E) * (1 + t2) + 2 * e * t;

		if (abs(M) < 2e-5)
		{
			double t2, f1, f2;
			t2 = t * t;
			f1 = M + M * t2 + (2 * (e - 1) - 4.0 * t2 / 3) * t; // leading terms that approximately cancel
			f2 = t * t2 * t2 * 4 * (1.0 / 15 - t2 * (1.0 / 35 - t2 * (1.0 / 63 - t2 / 99)));
			f1 = f1 + f2;
			f = f1;
		}
		if (f == 0.0) return E;

		ddf = e * t;
		dddf = e - e * t2;
		df = 1 - e + t2 + e * t2;
#ifdef FAST
		d3En = f * df;
		d3Ed = df * df + ddf * f; //ddf rescaled 0.5x
		if (d3Ed < 1e-88) return d3En / d3Ed;
		d4E = f * d3Ed * d3Ed / (df * d3Ed * d3Ed + d3En * (d3Ed * ddf + d3En * dddf / 6)); // ddf rescaled 0.5x two * removed

#else
		{ double d2E, d3E;
		if (df) d2E = f / df; else d2E = 0;
		d3E = f / (df + 0.5 * d2E * ddf);
		d4E = f / (df + 0.5 * d3E * (ddf + d3E * dddf / 3));
		}
#endif
		return E + d4E;
	}
	return E + FLM_D4t2(e, M, E);

	/* unreachable code left in for historic reasons */
	c = a * sqrt(1 + t2 * t2); // 1/cos E proxy // _copysign is much slower try a as int?

#ifdef FAST
	r = ((M - E) * c + e * t); // NR refinement
	if (r)
	{
		b = c - e;
		//	  r = r*c/(b*c+0.5*e*t2*r); // go faster Halley
		r = r * b / (b * b + 0.5 * e * t * r);
	}
#else
	if (c != e)
	{
		r = ((M - E) * c + e * t2) / (c - e); // NR refinement
		r = r / (1 + 0.5 * e * t2 * r / c);           // Halley refinement
	}
	else
		r = 0;
#endif
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	//	r = (M-E)*c+e*t;
	return E + r;
}


double MTB_BasicOpt_t2p(double e, double M)
{
	// this implementation uses the routines inline and optimsed for accuracy
	// final answer is polished using Halley 
	// NB a,b divided by 3 at source and c divided by 2

	double  a, b, c, d, e2, E, f3, q, r, s, s2, t2;
	if (M == 0.0) return M;
	e2 = e * e;
	s = sin(M / 2);
	s2 = s * s;
	//	s = s*sqrt(1-s2);
	s2 += s2;
	//	s += s;
	s = sin(M);
	//	f3 = (60+3*e2)*cos(M)-e*(60-7*e2);
	f3 = 60 * (1 - e) + e2 * (3 + 7 * e) - (60 + 3 * e2) * s2;
	if (f3 == 0) 	f3 = 1e16; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0 / f3;    // reciprocal here because optimiser is rather dumb
	a = -(20 + e2) * s * f3;     // a/3
	b = 20 * (1 - e - s2) * f3;			// b/3
	c = -30 * s * f3;			// c/2
//	t = SolveCubicOpt(3*a, 3*b, 2*c);

	q = b - a * a;
	r = 1.5 * a * b - c - a * a * a;
	d = q * q * q + r * r;

	if (d >= 0.0)
	{
		d = sqrt(d);
#ifdef STRICT
		if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
#else
		if (r > 0) s = exp(log(r + d) / 3.0); else s = -exp(log(d - r) / 3.0);
		//	  if (r>0) s = ASM_cbrt(r+d); else s = -ASM_cbrt(d-r); //cbrt positive only
#endif
		if (s != 0.0) t2 = s - q / s - a;
		else t2 = -a;  // special case arises when e=1 and M=0 or pi
	}
	else
	{
		s = sqrt(-q);  // needed for edge case rounding? error when M ~ pi/2-e and for Better/Best
		d = -r / q / s;
		t2 = acos(d) / 3.0;
		if (d < 0) t2 = t2 + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		t2 = 2.0 * s * cos(t2) - a;
	}
	if (t2 * M < 0) { a = -1.0; } else { a = 1.0; }
	E = atan2(a * t2, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M=pi rounding errors
	if (M < 1e-9) return E;

	c = a * sqrt(1 + t2 * t2); // 1/cos E proxy // _copysign is much slower try a as int?

#ifdef FAST
	r = ((M - E) * c + e * t2); // NR refinement
	if (r)
	{
		b = c - e;
		r = r * c / (b * c + 0.5 * e * t2 * r); // go faster Halley
	}
#else
	if (c != e)
	{
		r = ((M - E) * c + e * t2) / (c - e); // NR refinement
		r = r / (1 + 0.5 * e * t2 * r / c);           // Halley refinement
	}
	else
		r = 0;
#endif
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	//	r = (M-E)*c+e*t;
	return E + r;

}


double MTB_BasicF32(double ed, double Md)
{
	// this implementation uses the routines inline and optimsed for accuracy
	// final answer is polished using Halley NB a,b divided by 3 at source
	// it is the only implementation here in basic 32 bit reals and the 
	// ultimate accuracy is degrade accordingly. 
	//  Also has problems with some awkward values like e = 0.85, M = 0.70
	// Cubic solver can overflow since there is not enough headroom on the exponent
	//  max(tan(E)) ~ 10^7 and (10^7)^6 = 10^42 > 10^38
	// Slower than 64bit reals so pointless on the Intel or M2 CPUs with C.
	// Might be faster using 32 bit sin cos implementations
	// But cubic solver would need additional work to protect against overflows

	float  a, b, c, d, e2, e, E, f3, M, q, r, r2, s, s2, t;
	if (Md == 0.0) return Md;
	M = (float)Md;
	e = (float)ed;
	if (e < 0)
	{
		b = -e;
		e = 1 + e;
	}
	else
		b = 1 - e;
	e2 = e * e;
	s = (float)sin(M / 2);
	s2 = s * s;
	s2 += s2;
	s = (float)sin(M);
	f3 = 60.0f * (1.0f - e) + e2 * (3.0f + 7.0f * e) - (60.0f + 3.0f * e2) * s2;
	if (f3 == 0) 	f3 = 1e8f; // defend against f3 == 0 when M=pi/2, e small.
	else f3 = 1.0f / f3;    // reciprocal here because optimiser is rather dumb
	a = -(20.0f + e2) * s * f3;     // a/3
	b = 20.0f * (1.0f - e - s2) * f3;			// b/3
	c = -30 * s * f3;			// c/2
//	t = SolveCubicOpt(3*a, 3*b, 2*c); // calling sequence for standard solvers
	q = b - a * a;
	r = 1.5f * a * b - c - a * a * a;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
		if (r2 < d * 0.0001f)
		{
			s = 2.0f * r / (3.0f * (float) cbrt(d));
			t = r * r / (9.0f * d);
			t = s * (1.0f + 5.0f * t / 3.0f + 22.0f * t * t / 3.0f) - a ; // next highest order
		}
		else
		{
			d = (float) sqrt(d);
			if (r > 0) s = (float)cbrt(r + d); else s = (float)-cbrt(d - r);
			if (s != 0.0) t = s - q / s - a;
			else t = -a;  // special case arises when e=1 and M=0 or pi
		}
	}
	else
	{
		s = (float)sqrt(-q);  // needed for edge case rounding? error when M ~ pi/2-e and for Better/Best
		d = -r / q / s;
		t = (float)acos(d) / 3.0f;
		if (d < 0) t = t + (float)(2 * pi / 3); // needed to handle M = -pi/2+e correctly
		t = 2.0f * s * (float)cos(t) - a;
	}

	if (t * M < 0) { a = -1.0; }
	else { a = 1.0; }
	E = (float)atan2(a * t, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M=pi rounding errors
	return E;
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	return (double)(E + r);

}

double MTB_BetterOpt(double ein, double M)
{
	double  a, b, c, e, E, s, t, e2, em1, f3, B, C, q, r, r2,  d;
	if (ein < 0)
	{
		e = 1 + ein;
		em1 = -ein;
	}
	else
	{
		e = ein;
		em1 = 1 - ein;
	}
	e2 = e * e;
#ifdef OLDCOEFF
	B = 7 - e2 * 0.1221;
	C = 3 + e2 * (0.1221 + 0.006772 * e2); //+0*0.0074*e2);
#else
	C = 3.000076514 - e * (0.0011 - 0.07 * e);
	B = 10 - C;
#endif
#ifdef STRICT
	f3 = 1.0 / ((60 + C * e2) * cos(M) - e * (60 - B * e2));
	a = -(20 + C * e2 / 3) * sin(M) * f3;
	b = 20 * (cos(M) - e) * f3;
	c = -30 * sin(M) * f3;
#else
	{ double s, s2;
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2;
#ifdef PURE
	s = sin(M);
#else
	s = s * sqrt((1 - s) * (1 + s));
	s += s;
#endif
	f3 = 1.0 / ((60.0 + C * e2) * (1 - s2) - e * (60.0 - B * e2));
	a = -(60 + C * e2) * s * f3;
	b = 60 * (1 - e - s2) * f3;
	c = -60 * s * f3;
	}
#endif	

	//	t = SolveCubicI(3*a,3*b,2*c); //
	//	t = SolveCubicI_Opt(a, b, c);

	//	t = SolveCubicInline_Opt(a, b, c);

	q = b - a * a;
	r = 1.5 * a * b - c - a * a * a;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
#ifdef STRICT
if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
#else
		if (r > 0) s = exp(log(r + d) / 3.0); else s = -exp(log(d - r) / 3.0);
#endif
		if (r2 < d * 1e-5)
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
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

	// this is the final inline polish and can be added to any of the original routines
/* NR
	q = t * (t * (t + 3*a) + 3*b) + 2*c;
	r = 3*(t * (t  + 2 * a) + b);
	d = q / r;
	t = t - d;
	q = t * (t * (t + 3*a) + 3*b) + 2*c; // check it worked
*/

	if (t * M < 0) { a = -1.0; } else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M; // defensive fix for M=pi rounding errors
	if (M < 5e-19) return E; // refinement now greatly improved
	//	return E+FLM_D4(e,M,E);
	return E + FLM_D4T(e, M, E, t);

	// unreachable code preserved for now (until I'm sure force inline works OK on most compilers)
	c = a * sqrt(1 + t * t); // 1/cos E proxy // _copysign is much slower try a as int?

#ifdef FAST
	r = (M - E) * c + e * t; // NR refinement
	if (r)
	{
		b = c - e;
		//		b = c + em1;
		// 		    
		//	  if (b) r = r/b; // NR
		r = r * b / (b * b + 0.5 * e * t * r); // go faster Halley
	}
#else
	if (c != e)
	{
		r = ((M - E) * c + e * t) / (c - e); // NR refinement
		r = r / (1 + 0.5 * e * t * r / c);           // Halley refinement
	}
	else
		r = 0;
#endif
#ifdef _DEBUG
	if (M == pi / 2 - e)
		r = r;
#endif
	//	r = (M-E)*c+e*t;
	E = E + r;
	return E;
	if (e < 0.8)
		return E;
	else
		return E + Classic_NR(e, M, E);

}

double D5_FLM_Solver(double e, double M)
{
	double f3, a, b, c, alpha;
	if (M == 0) return M;
	alpha = (3.0 * pi * pi + (1.6 * pi * (pi - abs(M))) / (1 + e)) / (pi * pi - 6);
#ifdef STRICT
	f3 = 1.0 / ((3.0 * (1.0 - e) + alpha * e));
	a = -3.0 * M * f3;
	b = 6.0 * alpha * (1.0 - e) * f3;
	c = -6.0 * alpha * M * f3;
#else
	f3 = 6.0 / ((3.0 * (1.0 - e) + alpha * e));
	a = -0.5 * M * f3;
	b = alpha * (1.0 - e) * f3;
	c = -alpha * M * f3;
#endif
	f3 = SolveCubicInline(a, b, c);
	if (M < 1e-18) return f3;
	return f3 + FLM_D5(e, M, f3);
}

double D5_FLM_Opt(double e, double M)
{
	double f3, a, b, c, alpha;
	double a2, d, q, r, r2, s, t;
	double s2, E, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df, ddf, dddf;
	if (M == 0) return M;
	alpha = (3.0 * pi * pi + (1.6 * pi * (pi - abs(M))) / (1 + e)) / (pi * pi - 6);
	f3 = 6.0 / ((3.0 * (1.0 - e) + alpha * e));
	a = -0.5 * M * f3 / 3.0;
	b = alpha * (1.0 - e) * f3;
	c = -alpha * M * f3;

	a2 = a * a;
	r = (a * b - c) / 2.0 - a * a2;
	q = b / 3.0 - a2;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
		if (r2 < d * 1e-5)
		{
			//	E = 2 * r / (3 * cbrt(d)) - a;  // first order correction
			E = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			E = E * (1 + 5.0 * t / 3.0 + 22 * t * t / 3.0) - a; // next highest order
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
			if (s != 0) E = s - q / s - a; else E = -a;
		}
	}
	else
	{
		s = sqrt(-q);
		d = -r / (q * s);
		t = acos(d) / 3.0;
		if (d < 0) t = t + 2 * pi / 3; // needed to handle M = -pi/2+e correctly
		E = 2.0 * s * cos(t) - a;
	}
	if (abs(E) < abs(M)) E = M; // defence against rounding pi
	if (M < 1e-16) return E;
	return E +FLM_D5(e, M, E);

	// unreachable code preserved for the time being

	s = sin(E / 2);
	s2 = s * s;
#ifdef PURE
	s = sin(E);
#else
	s = s * sqrt((1 - s) * (1 + s)); // dodgy otherwise
	s += s;
#endif
	f = M - E + e * s;
	if (f == 0.0) return E;

	dddf = e - 2 * e * s2;
	df = 1 - e + 2 * e * s2;
	ddf = e * s;
	//a	ddddf = -ddf;
	d3En = f * df;
	d3Ed = df * df + ddf * f / 2;
	//	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3));
	d4En = f * d3Ed * d3Ed;
	d4Ed = df * d3Ed * d3Ed + 0.5 * d3En * (d3Ed * ddf + d3En * dddf / 3);
	d4E = d4Ed * d4Ed;
	//a	267 d5E = f*d4E*d4Ed/(df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed+0.25*d4En*ddddf)/3)));
	d5E = f * d4E * d4Ed / (df * d4E * d4Ed + 0.5 * (d4En * (ddf * d4E + d4En * (dddf * d4Ed - 0.25 * d4En * ddf) / 3)));
	return E + d5E;
}



__forceinline double SolveCubicInline(double a, double b, double c)
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
	if (d >= 0.0)
	{ // single real root
		if (r2 < d * 1e-6)
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + t*(5.0 / 3.0 + 22 * t / 3.0)) - a / 3.0; // next highest order is better
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
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
	/*  // optional Halley refinement gets to full machine precision
		r = t*(t*(t+a)+b)+c;
		d = t*(3*t+2*a)+b;
		t = t - r*d/(d*d+r*3*t*(a+t)); // Halley
		r = t*(t*(t+a)+b)+c;
	*/
	return t;
}



__forceinline double SolveCubicInline_Opt(double a, double b, double c)
// this one takes prescaled a/3, b/3 c/2 inputs for optimum speed
// it should inline automagically too at least on MS compiler
{
	double q, r, r2, d, s, t;

	q = b - a * a;
	r = 1.5 * a * b - c - a * a * a;
	r2 = r * r;
	d = q * q * q + r2;

	if (d >= 0.0)
	{
		if (r2 < d * 1e-6)
		{
			s = 2 * r / (3 * cbrt(d));
			t = r * r / (9 * d);
			t = s * (1 + t * (5.0 / 3.0 + 22 * t / 3.0)) - a; // next highest order is better
		}
		else
		{
			d = sqrt(d);
			if (r > 0) s = cbrt(r + d); else s = -cbrt(d - r);
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

__forceinline double D3TI(double e, double M, double E, double t)
{
	double r, rc, t2;
	t2 = t * t;
	if (t2 < 7e-6)
	    rc = 1+ t2 * (32 + 12 * t2 - t2 * t2) / (64 + 40 * t2); // next highest order
	else
		rc = sqrt(1 + t * t);
	if (M * t < 0) rc = -rc;
	r = (M - E) * rc + e * t;
	rc = rc - e;
	if (r != 0)	r = r * rc / (rc * rc + 0.5 * e * r * t);
	return r;
}

#define TFORM

__forceinline double FLM_D4TI(double e, double M, double E, double t)
{
	// last order where tangent form is acceptable ?

	double  eps, rc, dc, f, d3En, d3Ed, d4E, df, ddf, dddf, t2;
	if (e < 0.0)
	{
		eps = -e;
		e = 1 + e;
	}
	else
		eps = 1 - e;
#ifdef MDEBUG
	double ts, tc;
	tc = cos(E);
	ts = sin(E);
#endif
	rc = 1;
	t2 = t * t;
	if (t2 < 1e-4)
	    dc = t2 * (32 + 12 * t2 - t2 * t2) / (64 + 40 * t2); // next highest order
	else
	{
		dc = sqrt(1 + t2) - 1;
		if (t2 > 1e7)
		{
			rc = 1;
			if (t > 0)
				dc = t + (4 * t2 + 1) / (t * (4 + 8 * t2)) - 1; // t + dc
			else
				dc = -t - (4 * t2 + 1) / (t * (4 + 8 * t2)) - 1; // t + dc
		}
		else
			dc = sqrt(1 + t2) - 1;
	}
	if (dc == 0) return 0;
	if (M * t < 0) { rc = -rc; dc = -dc; }

	f = (M - E) * rc + (M - E) * dc + e * t;

	if (abs(M) < 2e-5)
	{
		double t2, f1, f2, f3;
		t2 = t * t;
		f1 = M * t2 / 2 - M * t2 * t2 / 8 + M * t2 * t2 * t2 / 16;
		f2 = t * (t2 * (t2 * (11.0 / 120 - t2 * (103.0 / 1680 - t2 * (1823.0 / 40320 - t2 * (31373.0 / 887040 - t2 * 265537.0 * t2 / 9225216))))));
		f3 = M + ((e - 1) - t2 / 6) * t;
		f3 = f1 + f2 + f3;
		f = f3;
	}
	if (f == 0.0) return f;

	dddf = e * dc;
	if (rc > 0.0)
		df = eps + dc;  // more accurate value when e>0.5
	else
		df = rc - e + dc;
	ddf = e * t;
	d3En = f * df;
	d3Ed = df * df + ddf * f / 2;
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E = f * d3Ed * d3Ed / (df * d3Ed * d3Ed + 0.5 * d3En * (d3Ed * ddf + d3En * dddf / 3));
	return d4E;
}
