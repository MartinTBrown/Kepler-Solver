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
//#include "starter.h"
#include "solver.h"

// These are the core routines described in the paper

double MTB_Basic(double e, double M)
{
	double  a, b, c, t, e2, f3, E;

#ifdef PURE
#ifdef FAST
/*
		if (e < 0)
		{
			b = -e;    // precise value for e-1 has been passed in to routine
			e = 1 + e; // convention if e<0 then it is actually an eccentricity >0.5
		}
		else
		{
			b = 1 - e;
		}
		*/
	Safe_e(e, b);
	e2= e*e;
    f3 = 1.0/((60+3*e2)*cos(M)-e*(60-7*e2));  // divides are slow and some compilers so stupid (manually optimised)
    a = -(60+3*e2)*sin(M)*f3;
	b = 60*(cos(M)-e)*f3;
	c = -60*sin(M)*f3;
#else
    f3 = ((60+3*e2)*cos(M)-e*(60-7*e2));  // 3 divides without strength reduction on some compilers
    a = -(60+3*e2)*sin(M)/f3;
	b = 60*(cos(M)-e)/f3;
	c = -60*sin(M)/f3;
#endif
#else
	{ double s, s2;
	s = sin(M/2);  // rescaled to remove 60*
	s2 = s*s;
	s = s*sqrt((1-s)*(1+s));  // not accurate enough to remain stable near pi
	s  += s;
//	s = sin(M);
	s2 += s2;
	f3 = 1.0/((1.0+0.05*e2)*(1-s2)-e*(1.0-7.0/60*e2));
	a = -(1+0.05*e2)*s*f3;
	b = (1-e-s2)*f3;
	c = -s*f3;
	}
#endif	
	t = SolveCubic(a,b,c);  // SolveCubicOpt mysteriously slower here
    if (t*M<0) { t= -t; a=-1.0; } else { a=1.0; }
	E = atan2(t,a);
	if (abs(E)<abs(M)) E=M; // amazingly this line makes it go ~100 cycles faster! MS compiler only
	return E;
}


double MTB_BasicE(double e, double M)
{
	double  a, b, c, t, em1, e2, f3, E, s, s2;
	if (e < 0)
		{
			em1 = -e;    // precise value for e-1 has been passed in to routine
			e = 1 + e;   // convention if e<0 then it is actually an eccentricity >0.5
		}
		else
		{
			em1 = 1 - e;
		}
	s = sin(M / 2);
	s2 = s * s;
	s2 += s2; 
	e2 = e * e;
	f3 = 1.0 / (60*em1 + 3 * e2 -s2*(60+3*e2) + e * 7 * e2);  // divides are slow and some compilers so stupid (manually optimised)
	a = -(60 + 3 * e2) * sin(M) * f3;
	b = 60 * (em1-s2) * f3;
	c = -60 * sin(M) * f3;

	t = SolveCubic(a, b, c);  // SolveCubicOpt mysteriously slower here
	if (t * M < 0) { t = -t; a = -1.0; } else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M; // amazingly this line makes it go ~100 cycles faster (only on MS compiler)!
	return E;
}


double MTB_Better(double e, double M)
{
	double  a, b, c, E, t, e2, f3, B, C;
	Safe_e(e, b);
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
	a = -(60 + C * e2) * sin(M) * f3;
	b = 60 * (cos(M) - e) * f3;
	c = -60 * sin(M) * f3;
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
	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}


double MTB_Optimised(double e, double M)
{
	double  a, b, c, E, t, e2, f3, B, C;
	Safe_e(e, b);
	e2 = e * e;
#ifdef OLDCOEFF
	A = 60 - e2 * e2 * e2 * 0.00060937;
	B = 7 - e2 * (0.1221046 - 0.0032115 * e2);
	C = 3 + e2 * (0.12203873 + 0.005094883 * e2); //+0*0.0074*e2);
#else
	C = 3.000076514 - e * (0.0011 - 0.07 * e);
	B = 10 - C;
#endif
#ifdef STRICT
	f3 = 1.0 / ((60 + C * e2) * cos(M) - e * (60 - B * e2));
	a = -(60 + C * e2) * sin(M) * f3;
	b = (60 * cos(M) - 60 * e) * f3;
	c = -60 * sin(M) * f3;
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
	t = SolveCubic(a, b, c);
	if (t * M < 0) { t = -t; a = -1.0; }
	else { a = 1.0; }
	E = atan2(t, a);
	if (abs(E) < abs(M)) E = M;
	return E;
}



//#define CRUDE
#define OLDCOEFF

double MTB_Best(double e, double M)
{
	double  a, b, c, d, d2, E, e2, f3, t, B, C;
	Safe_e(e, b);
//	if (e < 1) e = 1 + e;
	e2 = e * e;

	if (M < 2.2)
	{
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
	B = 7 - d2 * (0.1118 - 0.00306 * d2);
	C = 3 + d2 * (0.1118 + 0.00265 * d2);
		// new code
	}
	else
	{
		d = 0;
		d2 = 0;
		B = 7;
		C = 3;
	}
#ifdef OLDCOEFF
	//
#else
	C = 3.000076514-d*(0.0011-0.07*d);
	B = 10-C;
#endif

/**/
//	C = 3.000076514-d2*(0.0011-0.0808*d2);
//	B = 10-C;
#ifdef STRICT
	f3 = 1/((60+C*e2)*cos(M)-e*(60-B*e2+1*d2*d2*d2/ 3000.0)); // was 4180 for equal error either side (4200 gives slightly narrower range)
    a = -(60+C*e2)*sin(M)*f3;
	b = 60*(cos(M)-e)*f3;
	c = -60*sin(M)*f3;
#else
	{double s,s2;
	s = sin(M/2);
	s2 = s*s;
	s2 += s2;
#ifdef PURE
	s = sin(M);
#else
	s = s*sqrt((1-s)*(1+s));
	s  += s;
#endif
	f3 = 1.0/((60+C*e2)*(1-s2)-e*(60-B*e2+d2*d2*d2/4200.0));
	a = -(60+C*e2)*s*f3;
	b = 60*(1-e-s2)*f3;
	c = -60*s*f3;
	}
#endif	
	t = SolveCubic(a,b,c);
	if (t*M<0) { a=-1.0; } else { a=1.0; }
	E = atan2(a*t,a);
	if (abs(E)<abs(M)) E=M;
	if (E < 1e-10) return E;
	return E;
}


double MTB_Best_original(double e, double M)
{
	double  a, b, c, d, d2, E, e2, f3, t, B, C;
	Safe_e(e, b);
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
	//B = 7 - d * (0.122105 - 0.00321155 * d);
	B = 7 - d * (0.1118 - 0.00306 * d);

	//?	B = 7 - d * (d * 0.080745-0.00081); // experiemntal k value should work but doesn't
	//	d = d * d;
	C = 3 + d * (0.1118 + 0.00265 * d);
	//	C = 3 + 0.1221 * d;
	//	C = 3 + d * (0.1220387 + 0.005095 * d);
//	C = 10-B;
//	}
/*
	else
	{
	d = 0;
	d2 = 0;
	B = 7;
	C = 3;

}
*/
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
	t = SolveCubic(a, b, c);
	if (t * M < 0) { a = -1.0; }
	else { a = 1.0; }
	E = atan2(a * t, a);
	if (abs(E) < abs(M)) E = M;
	if (E < 1e-10) return E;
	return E;
}
double MTB_BasicResiduals(double e, double M)
{
	// simple model fit of residuals of the Basic solution see equation 11
	// this one is slightly more refined (but I still prefer Halley, NR).

	double y, p, q, s, t, e2, e7;
	Safe_e(e, e2);
	e2 = e*e;
	e7 = pow(e,7);
	p  = 0.0001425*e*e2*(1+e+e7*17.5);
	if (M<0) p = -p;
	q = 2;  
	s = 3.7-2.5*e2;
	t = pi/2-0.1-e*(1.1+0.9*e7);
	y = M-t;
	y = p*pow(abs(M),q)*exp(-s*y*y);
	return y;
}

//#define ORIGINAL

double FLM_Solver(double e, double M)
{
	double f3, a, b, c, alpha;
	Safe_e(e, b);
	if (M == 0) return M;
	alpha = (3.0*pi*pi+(1.6*pi*(pi-abs(M)))/(1+e))/(pi*pi-6);
#ifdef STRICT
    f3 = (3.0*(1.0-e) + alpha*e);
	a = -3.0*M/f3;
	b = 6.0*alpha*(1.0-e)/f3;
	c = -6.0*alpha*M/f3;
#else
    f3 = 6.0/((3.0*(1.0-e) + alpha*e));
	a = -0.5*M*f3;
	b =  alpha*(1.0-e)*f3;
	c = -alpha*M*f3;  
#endif
	return SolveCubic(a,b,c);
}

const double beta = 7.0-60.0/(pi*pi);      // for a direct hit on E=M=pi
const double beta2 = 2.385+4.27 ; // was = -0.073512; // 7.0-(3*(pi/2)^2+60(1-pi/2))/(pi/2)^3; // direct hit on E=pi/2 sin(pi/2)=1 split range

double DLB_SolverB(double e, double M)
{
	double  a, b, c, f3, x, beta_x2;
	Safe_e(e, b);
	if (M == 0) return M;
	x = M/pi;
	beta_x2 = (beta)*x*x;
	f3 = 60.0/(3.0+ e*(7.0 - beta_x2));
	a = -M*f3/20.0;
	b = (1.0-e)*f3;
	c = -M*f3;
	return SolveCubic(a,b,c);
}

//#define QOLDCOEFF

//const double fixit = -0.002;

double DLB_SolverMB(double e, double M)
{
	double  a, b, c, f3, x, beta_x2;
	const double fudge = 0.000;
	Safe_e(e, b);
#ifdef QOLDCOEFF
	x = M/pi;
/*
if (x<1-e*2/pi) 
		x += 2*e*x;
	else 
	{
		x = (pi-M)/(pi/2+e);
		x += 2*e*(1-x);
	}
*/	
	beta_x2 = (beta)*x*x;
	f3 = 60.0/(3.0 + beta_x2 + e*(7.0 - beta_x2));
	a = -(3 + beta_x2)*M*f3/60.0;
#else
	x = abs(M);
    if (x<pi/2-e) 
		x += e*sqrt(x/(pi/2-e));
	else 
		x += e*(sqrt((pi-x)/(pi/2+e))+2*(pi-x)/(pi/2+e))/3;

//	beta_x2 = 3.000076514-x*(0.001+fixit-(0.094963+fixit)*x);
//	beta_x2 = 3+x*(x*(x*0.04446327-0.052253)+0.01919);
	beta_x2 = 3 +x*x*(0.0778-x*(0.000266+fudge-(0.00166+fudge/pi)*x)); // 0.00165406 hits 1e-07
//	beta_x2 = 3 + x * (x * (x * 0.035315 - 0.031343) + 0.008601); // valid 0-PI/2 doesn't work as expxcted
//	beta_x2 = 3 + x * x * beta / pi / pi; //was *4;
	f3 = 60.0/(beta_x2 + e*(10.0-beta_x2));
	a = -beta_x2*M*f3/60.0; //BUGBUG
//	a = -3*M*f3/60;
#endif
	b =  (1.0-e)*f3;
	c = -M*f3;
	return SolveCubic(a,b,c);
}


double DLB_SolverBG(double e, double M)
{
	double  a,b,c, f3, x, x2, beta_x2, gamma;
	Safe_e(e, b);
	if (M == 0) return M;
	x = M/pi;
	x2 = x*x;
	gamma = 0.4126-0.6138*e;    // approximation from DLB paper (works OK)
	gamma = 3*gamma*x2;			// DLB algebra is 3*(1+gamma*x^2)
	beta_x2 = beta*x2;
	f3 = 60.0/( 3 + gamma + e*(7 - beta_x2));
	a = -(3 + gamma)*M*f3/60.0;
	b = (1-e)*f3;
	c = -M*f3;
	return SolveCubic(a,b,c);
}

double DLB_F(double e, double M, double alpha)
{
	double f, x, x2, y;
	Safe_e(e, x);
	x = M/pi;
	x2 = x*x;
	y = 1-e;
	y = y*y*y;
	f = (1 + alpha*pow(x,4)/(24*y/(pi*pi)+e*x2)*(1-x2)/(1+x2));
	return f;
}


double MTB_DLB_F(double e, double M, double alpha)
{
	double f, x, x2, y;
	Safe_e(e, x);
	x = M/pi;
	x2 = x*x;
	y = 1-e;
	y = y*y*y;
	f = (1 + alpha*pow(x,4)/(24*y/(pi*pi)+e*x2)*pow(1-x,2)/(1+x2)); 
//	f = (1 + alpha*pow(x,4)/(24*y/(pi*pi)+e*x2)*pow(1-x,1.75)/(1+x2)) is better
    return f;
}


double DLB_SolverBGF(double e, double M)
{
	// stub unable to implement
	return 0;
}

double Mikkola_Cubic(double e, double M)
{
// Mikkola solves for sin(E/3) and then back subsitutes
// simple correction has essentially no computational cost
// effectiveness hampered by poor convergence of series for asin(x)

	double  a, b, c, f3;
	Safe_e(e, b);
	f3 = 4 * e + 0.5;
	a = 0;
	b = 3.0 * (1 - e) / f3;
	c = -M / f3;
//	f3 = SolveCubic(a, b, c); 
	f3 = SolveCubicOpt3(b, c); // because a = 0
	a = M / pi;
	b = a * a;
	f3 = f3 - 0.0421 * a * b * b / (1 + e);
	f3 = M+e*f3 * (3 - 4 * f3 * f3);
	return f3 + 0.043*a*b*b;
}

double Mikkola_Pade(double e, double M)
{
// Pade generalisation of Mikkola solution to uinclude the term in s^5

	double  a, b, c, f3;
	Safe_e(e, b);
	b = 3.0 * (1 - e);
	f3 = 4 * e + 0.5;
	a = 3.0/40 / f3;
	f3 = f3 - a*b ;
	a = a*M/f3;
	b = b / f3;
	c = -M / f3;
	f3 = SolveCubic(a, b, c); 

	a = M / pi;
	b = a * a;
	f3 = f3 - 0.0347 * a * b * b / (1 + e);
	f3 = M+e*f3 * (3 - 4 * f3 * f3);
	return f3;
}

const double betaRS = 0.197; // was beta old 

const double betaBRS = 0.5;  //0.08; //was 0.215; to get 0.02 small // 2.2245 * 0.0;

double DLB_SolverB_RS(double e, double M)
{
	// generalisation of DBL Pade taking M' =- pi-M
	// only valid for M > pi/2-e
	// goes crazy at low M values

	double  a, b, c, f3, x, beta_x2;
	Safe_e(e, b);
	if (M == 0) return M;
	x = M / (pi/2-e);
	beta_x2 = betaBRS * x * x * e*e*e;;
	f3 = 60.0 / (3.0 + 0*beta_x2 + e * (7.0 - beta_x2));
	a = -(3.0 + 0*beta_x2) * M * f3/60;
	b = (1.0 - e) * f3;
	c = -M * f3;
	return SolveCubic(a, b, c);
}

double MTB_PadeRS(double e, double M)
{
	// works in pi-abs(M) but has instabilities notably when e = 3/7 f3 vanishes
	// and for e > 3/7 it has 3 real roots and you have to pick the right one
	// worse still it isn't always the priniciple root :(
	// goes haywire for M near zero very good for M > pi/2

	double  a, b, c, f3, x, beta_x2, Mrs;
	int n;
	Safe_e(e, b);
	if (M>0) Mrs = pi-M; else Mrs = pi+M; 
	x= Mrs/(pi/2+e); 	
	beta_x2 = betaRS*x*x; 
//	beta_x2=0;  // for testing
	f3 = 1/(3.0+beta_x2 - e*(7.0 - beta_x2));
	a = -(3.0+beta_x2)*Mrs*f3;
	b = 60.0*(1+e)*f3;
	c = -60.0*Mrs*f3;
	if (a<0) n = 1; else n = -1;
	f3 = SolveCubicOptG(a,b,c,n); // select the right real root
	if (M>=0) 
		f3 = pi-f3; 
	else 
		f3 = f3-pi;
	return f3;
}

const double betaP4 = 0.001; // was  0.0022;

double MTB_PadePiby4(double e, double M)
{
	// this one is a Pade expansion around E = Pi/4 where the equation is stiff
	// relies on sin(pi/4) = cos (pi/4) = 1/sqrt(2) only O(E^4)
	// it is the last natural position to make a Pade approximation
	// sin(pi/4+x) = sin(pi/4)cos(x) + cos(pi/4)sin(x)
	// = (cos x + sin x)/sqrt(2)
	// cos x + sin x = 1 + x - x^2/2 + x^3/6 - x^4/24 + ...
	// only valid for a very narrow range but useful even so
	// not worth doing for 3pi/4 as equation is well behaved there

	double  a, b, c, f3, x, beta_x2, Mrs;
	Safe_e(e, b);
	if (M > 0) Mrs = M-pi/4; else Mrs = pi/4 + M;
	x = Mrs ;
	beta_x2 = betaP4 * x ;
	f3 = 7*e/24 +beta_x2;
	a = (e / 2 - (e - M_SQRT2) / 4-0*beta_x2)/f3;
	b = (M_SQRT2-e - (M_SQRT2*Mrs+e)/4)/f3;
	c = -(M_SQRT2*Mrs+e)/f3;
	//if (a < 0) n = 1; else n = -1;
	f3 = SolveCubicOptG(a, b, c, 0); // select the right real root
	if (M >= 0)
		f3 = pi/4 + f3;
	else
		f3 = f3 - pi/4;
	return f3;
}

const double  betah = 0.07352;

double MTB_PadeRF(double e, double M)
{
	// work in from either end split around M = pi/2-e
	// optimised for E < pi/2 and E < pi/2 separately

 double  a, b, c, f3, x, x2, beta_x2, gamma;
 Safe_e(e, b);
 if (abs(M) <= pi / 2 - e)
 {
	 if (M == 0) return M;
	 x = M / (pi/2-e);
	 x2 = x * x;
	 gamma = 0.4126 - 0.6138 * e;                      // approximation from DLB paper (works OK)
	 gamma = 0*3 * gamma * x2;  // DLB algebra is 3*(1+gamma*x^2)
	 beta_x2 = betah * (1.06*x+0.94*x2)/2;
	 f3 = 60.0 / (3 + gamma + e * (7 - beta_x2));
	 a = -(3 + gamma) * M * f3 / 60.0;
	 b = (1 - e) * f3;
	 c = -M * f3;
	 return SolveCubic(a, b, c);
 }
	else
		return MTB_PadeRS(e,M);
}

// for completeness the original ancestors of these cubic methods
// and reference implementations of other nice starting estimates

double MTB_Cubic(double e, double M)
{
	double b;
	Safe_e(e, b);
	
#ifdef ORIGINAL
	double a,c;
	a = 0;
	b = 6*(1-e);
	c = -6*M;
	return SolveCubic(a,b,c);
#else
#ifdef FAST
//	return SolveCubic(0, 6 * (1 - e) / e, -6 * M / e) + e*M*(1+e*M/10) / (9.9 - e);
	return SolveCubicOpt3(6*(1-e),-6*M);
#else
	return SolveCubic(0,6*(1-e),-6*M); // sets minimum baseline for solve cubic overheads
#endif
#endif

}


double MTB_DCubic(double e, double M)
{
	double a, b, c;
	Safe_e(e, b);
	a = 3*M;
	b = 3*M*M + 6 * (1 - e);
	c = ((M*M) - 6)* M;
	return M+SolveCubic(a, b, c);
}


const double delta = 5-48/(pi*pi);

//#define BASIC

double MTB_PadeC(double e, double M)
{
	// Pade expansion around E = pi/2 
	// uses sin(E) = cos(pi/2-E) and Pade(cos)

	double f3, a, b, c, x;
	Safe_e(e, b);
	f3 = 1;
	if (M ==0.0) return M; // defend from M=0
#ifdef BASIC
	a = M-pi/2-5*e;
	b = 12;
	c = 12*(M-pi/2+e);
#else
	x = abs(M)-pi/2+e;
	if (M < pi / 2 - e)
	{
		x = x / (pi / 2 - e);
		b = (delta - 0*0.10*e*e) * x * x; //5.86345;
	}
	else
	{
		x = x / (pi / 2 + e);
		b = (delta+0*0.049) * x * x; //5.86345;
	}
    if (M>0)
		c = M-pi/2;
	else
		c = -(pi/2+M);
	a =  c -(5-b)*e/(1+b); // was c - 5...
	c = 12*(c+e)/(1+b);
    b = 12/(1+b);    
#endif
	if (M<0.101)
		f3 = SolveCubicOptG(a, b, c, 1);
	else
  		f3 = SolveCubicOptG(a,b,c,-1);

    if (M>=0)
	{
		f3 = pi/2-f3;
	}
	else
		f3 = -pi/2+f3;

	return f3;
}


double MTB_Hybrid(double e, double M)
{
	// this is work in progress select appropriate DLB approximation
	// depending on the values of e, M
	double b;
	Safe_e(e, b);
	if (M < 2.5 - e)
	{
		if (M < 0.36 - e * e * e * e / 3)
		{
//			return DLB_SolverMB(e, M);
			if (e < 0.95)
				return DLB_SolverB_RS(e, M); //was BG
			else
				return DLB_SolverB_RS(e, M);
		}
		else
		{
			if (M < 0.2)
				return MTB_PadePiby4(e, M);
			else
			    return MTB_PadeC(e, M);
		}
	}
	else
	{
		if (M < 1.64)
			return MTB_PadeC(e, M);
		else
			return MTB_PadeRF(e, M);
	}
}

double MTB_Pade(double e, double M)
{
	// simplest possible Pade approximation 

	double f3, a, b, c;
	Safe_e(e, b);
	f3 = 60/(3+7*e);
	a = -M*f3/20;
	b = (1-e)*f3;
	c = -M*f3;
	return SolveCubic(a,b,c);
}


double MTB_DPade(double e, double M)
{
	// simplest possible Pade approximation 

	double f3, a, b, c;
	Safe_e(e, b);
	f3 = 1 / (3 + 7 * e);
	a = 3 * M * (7 * e + 2) * f3;
	b = (21*M*M*e+3*M*M+60*(1 - e)) * f3;
	c = (7*M-60)*M * f3;
	return M+SolveCubic(a, b, c);
}

double MTB_PadeK(double e, double M)
{
	// alternative method which does work as well as I hoped
	// needs a better guess for E internally

	double f3, a, b, c, k, d;
	Safe_e(e, b);
//	k = -0.0778 + M*(0.000266 - 0.00166*M);
	k = -0.0778;
	if (M>1) k = k - 0.00719*M;
	if (M<pi/2-e) d = M+e*sqrt(M/(pi/2-e));
	else d = M+e*(((pi-M)/(pi/2+e))+sqrt((pi-M)/(pi/2+e)))/2;
	if (d>pi) d=(pi+M)/2;
	f3 = 60/(3-k*d*d+(7+k*d*d)*e);
	a = -M*f3*(3-k*d*d)/60;
	b = (1-e)*f3;
	c = -M*f3;
	return SolveCubic(a,b,c);
}


double D0(double e, double M)
{
	// M must be in the range -pi to pi here
	// way too slow to be useful but ~5% global accuracy
	// replaced by D1 which is much faster ~15 cycles.
	// only interesting feature is that it is closed form.

	double ae, alpha, beta;
	Safe_e(e, beta);

	alpha = 1.1529 - e * (0.5261 + 0.3464 * e);
	ae = e;
	if (M < 0)
	{
		ae = -ae;
		M = -M;
	}
#ifdef FAST
	beta = (pi / 2 + e) / (pi / 2 - e) * alpha;
#else
	if (M > pi) M = fmod(M, pi);
	switch (N)
	{
	case 0:	beta = (pi / 2 + e) / (pi / 2 - e) * alpha; break; // default
	case 1: alpha = (pi / 2 - e) / (pi / 2 + e) * beta; break;
	case 2: alpha = 1.153 - e * (0.526 + 0.3462 * e); break;
	case 3: beta = 1.1376 + e * (0.9875 - 0.9574 * e); break;
	case 4: if (M > pi / 2 - e) ae *= M / (pi / 2 - e); else ae *= (pi - M) / (pi / 2 + e); return ae;
	default: if (M < pi / 2 - e)  // faster, effective but impure - scope to improve too
		return e * sqrt(M / (pi / 2 - e));
		   else
		return e * sqrt((pi - M) / (pi / 2 + e));
	}

#endif
	return  ae * pow(M / (pi / 2 - e), alpha) * pow((pi - M) / (pi / 2 + e), beta); // globally not bad approx ~5%
}


double D1(double e, double M)
{
	// M must be in the range -pi to pi here
	double d, d2, a, b, c;
	Safe_e(e, b);
	if (M > 0) a = M;
	else
	{
		if (M == 0) return M; else a = -M;  // considerably faster than fabs() !
	}
	if (a < pi / 2 - e)  // much faster, effective but impure - scope to improve too
	{
		d = 1 - (a / (pi / 2 - e));
		b = 1.222 - 1.06 * e;
		c = -0.229 + 0.51 * e;
		// was 	 
		if (a < e / 3) return MTB_Cubic(e, M) - M + e * e * e * M * 0.01;
		// above gets a better answer in combo with Dn		 
		//		 if (a< 0.41 - e*e*0.31) return MTB_Cubic(e, M)-M+e * e * e * M * 0.01;
	}
	else
	{
		d = 1 - ((pi - a) / (pi / 2 + e));
		b = 1.236 + 0.88 * e;
		c = -0.367 - 2.06 * e;
		if (a > 3 * pi / 4 - e / sqrt(2.0))
		{
			a = (pi - a) * e / (pi * sqrt(2.0) / 4 + e);
			if (M >= 0) return a; else return -a;
		}
	}

	d2 = d * d;
	d = 1 - d2 * (b + c * d2);
	//	 if (d<0.75) d = 0;
	return e * d;
}
