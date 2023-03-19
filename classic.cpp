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
#include "benchmark.h"      // for Get_rk()


double Kepler_f(double e, double M, double E)
{
	return M-E+e*sin(E);
}


double MTB_S1(double e, double M)
{
	double d;

	d = 0.95*e-0.57*e*e;		 // BUGBUG incompatible with !PURE since E0 can be >pi.
	return (M>0) ? M + d: M - d; // amongst the simplest starting estimate with guaranteed convergence
}

//#define MHACK

double Gooding_S1(double e, double M)
{
#ifdef MHACK
	return M;  // so that generic routines can be tested against special case functM (forces E0 = M) codes
#endif

#ifdef STRICT
/*
if (M>0)
		E = M +(0.7571-0.2744*e)*e;
	else
		E = M -(0.7571-0.2744*e)*e;
	return E;
*/
	if (M > 0)	return M + e;
	if (M < 0) return M - e;
	return M;   // subtle annoyance when M==0 with previous compact version!
	

// was	return (M>0) ? M + Get_rk()*e : M-Get_rk()*e; // next simplest
//	return (M>0) ? M + e: M - e; // the simplest possible starting estimate with guaranteed convergence
#else
	return (M > 0) ? M + e : M - e; // the simplest possible starting estimate with guaranteed convergenc
#ifdef PURE 
	return (M>0) ? M + e: M - e; // the simplest possible starting estimate with guaranteed convergence
#else
	double E;				// slightly more sophisticated to defend from |E0| > pi !PURE cannot handle that! 
	if (M>0)
	{
		E= M+e*(0.966-0.565*e); 
		if (E>pi) E=pi;
	}
	else
	{
		E=M-e*(0.966-0.565*e);
		if (E<-pi) E=-pi;
	}
	return E;
#endif
#endif
} 

double MTB_S1_41(double e, double M)
{
	double d;
	d = 0.41*e;
	return (M>0) ? M + d: M - d; // amongst the simplest starting estimate with guaranteed convergence preferred for odd DeltaN
}

double MTB_S1_50(double e, double M)
{
	double d;
	d = 0.5*e;
	return (M>0) ? M + d: M - d; // amongst the simplest starting estimate with guaranteed convergence (compromise)
}

double MTB_S1_62(double e, double M)
{
	double d;
	d = 0.62*e;
	return (M>0) ? M + d: M - d; // amongst the simplest starting estimate with guaranteed convergence preferred for even DeltaN
}


double Danby_S1_85(double e, double M)
{
	double d;
	d = 0.85*e;
	return (M>0) ? M + d: M - d; // amongst the simplest starting estimate with guaranteed convergence Danby's choice (spike near e = 0.85)
}


double Gooding_S3(double e, double M)
{
	//_asm {
	//	and esp, 0xfffffff0  // attempt to see if structure stack alligment makes it so sl-o-w 
	//}
	return M + e*sin(M)*(1+e*cos(M));  // very slow and fairly useless really S( is faster and more accurate!
}

double Gooding_S9(double e, double M)
{
	// orginally written in their paper as sin(M)/sqrt(1-e*cosM+e*e)
	// it is one form of Halley's method but also derived as the root 
	// of a simple quadratic approximation for E-M. Rather good and fast!

	double s, y;
	y=1-e;

	if (M == 0.0) return M; // defend against divide by zero
/*
#ifdef FAST
	s = M/2;
	y = s*s;
	s = s-s*y*(420+11*y)/(2520+60*y);
#else
	*/
	s = sin(M/2);
//#endif
	return M+e*sin(M)/sqrt(y*y+4*e*s*s);  // more accurate (very wrong when e -> 1)
}

double Gooding_S9s2(double e, double M)
{
	// orginally written in their paper as sin(M)/sqrt(1-e*cosM+e*e)
	// it is one form of Halley's method but also derived as the root 
	// of a simple quadratic approximation  for E-M. Rather good and fast!

	double s, y;
	y = 1 - e;

	if (M == 0.0) return M; // defend against divide by zero
	s = sin(M / 2);
	return M + 2 * e * s * sqrt((1 - s * s) / (y * y + 4 * e * s * s));
}

double S9t2(double e, double M)
{
	double t, t2, y, z;
	y=1-e;
	z=1+e;
	if (M == 0.0) return M; // defend against divide by zero
	t = tan(M/2);
	t2 = t * t;
	return M+2*e*t/sqrt((1+t2)*(y*y+z*z*t2));
}

// TODO - better approximation would be to use Pade 5,4 
// on 0-pi/4? as t, 1 and on 3pi/4, pi as 1, t
// and around pi/2 as tan(x + pi/4) ie  1+t, 1-t
// range is halved again and accuracy 2^9 x better

double S9t2p52(double e, double M)
{
	// Pade 5,2 used for tan on 0-pi/4
	double t, t2, y, z, tn, td;
	y = 1 - e;
	z = 1 + e;
	if (M == 0.0) return M; // defend against divide by zero
	t = M / 2;
	if (M < pi / 2) // was pi/4
	{
		t2 = t * t;
		td = 630 - 255 * t2;
		tn = t * (630 - t2 * (45 + t2));
	}
	else
	{
		t = pi / 2 - t;
		t2 = t * t;
		tn = 630 - 255 * t2;				// swap tn & td for common mode version
		td = t * (630 - t2 * (45 + t2));
	}
	y = y * td;
	z = z * tn;
	return M + 2 * e * tn * td / sqrt((td * td + tn * tn) * (y * y + z * z));
}

double S9t2p54(double e, double M)
{
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
/*
    // first accurate version used 55 cycles
	if (M<pi/2) 
	{
			t = MTB_Pade76Tan(M/2); 
			t2 = t*t;
			return M+2*e*t/sqrt((1+t2)*(y*y+z*z*t2));
	}
	else
	{
			t = MTB_Pade76Tan((pi-M)/2); // reciprocal done without divide
  	        t2 = t*t;
			return M+2*e*t/sqrt((1+t2)*(y*y*t2+z*z));
	}
*/
}

double MTB_S9(double e, double M)
{
	// orginally written in the Gooding paper as sin(M)/sqrt(1-e*cosM+e*e)
	// failed attempt to instill better behaviour as e -> 1

	double s, y;
	if (e<0.7)
	   y = 1-e;
	else
	{
	   y = 0.3;
       if (M<pi/2-e)
		M = M*(pi-1.4)/(pi-2*e);
   	   else
	    M = pi/2+(M-pi/2+(e-0.7))*pi/(pi+2*(e-0.7));
	}
	s = sin(M/2);
	return M+2*e*s*sqrt((1-s*s)/(y*y+4*e*s*s));
}
