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
#include "intel.h"  // for the Fixups and 80bit code

// delta refiners starting with the classics Newton-Raphson & Halley
// for each of the methods there are implementations that include
// 
// Suffix   Meaning
//			Classic sin, cos 
// s2		Go faster sin E/2 
// T		Cubic solver compatible using tan E 
// t2		Go faster tan E/2 
// t2Pnm    Go much faster tan E/2 Pade approximation Pnm (nm usually 32, 52, or 54)
// 80		80 bit implementation aka long double (MS compiler uses inline asm x87 instructions)
// M	    Starter with E=0 equivalent to Dn(e, M, 0)
// 
// Suffixes may be combined "M" will always come last (they are starter guestimates from E=M rather than deltas)
// Not every permutation has been implemented
// 
// Some lower order ones implement the negative e convention for passing paramter e > 0.5 more ccuarately
// All should be protected from negative e by a guard macro Safe_e(e,em1) which negative e into 1+e
// 
// D7 & D8 are pushing the limits and not considered safe but are still interesting and mostly work OK
// Summary testing will flag with a "#" on the end of the line any function generating nans when on test
// 
// There are also hand coded x87 80 bits versions in the Intel.cpp file
// if x87 support is not available and long double unsupported then the 
// 64 bit equivalent function is used instead

double Classic_NR( double e, double M, double E)
{
	double f,df,s;
	Safe_e(e, f);
	f = M-E+e*sin(E); // note for simplicity special case M small and e near 1 not handled well
	s = sin(E/2);
	df = 1 - e + 2*e*s*s;
	if (df) f = f/df; 
	return f;
}

// this routine uses FLM fixup for small E,M and large e

double FLM_NR( double e, double M, double E)
{
	double f,df,s;
	if (e < 0)
	{
		df = -e;
		e = e + 1;
	}
	else
		df = 1 - e;
	s = sin(E/2);
#ifdef PURE
	if ((e < 0.75) || (abs(M) > 0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
	  f = M-E+e*sin(E);
	else 
	  f = FLM_Fixup(e, M, E);  // FML95 Pade approximation is best
#else
    f = e*s*sqrt((1.0-s)*(1+s)); // dodgy near M=pi!
	f += M-E+f;            // to prevent compiler generated multiply
//	f = M-E+e*sin(E); // note for simplicity special case M small and e near 1 not handled well M near pi dodgy too
#endif
	df = df + 2*e*s*s;
	if (df) f = f/df; 
	return f;
}


double Classic_NR80( double e, double M, double E)
{
	double f,df,s;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
    if ((e<0.95) || (abs(M)>0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = Kepler_f80(e, M, E); // 80 bit version
	else
		f = Gooding_Fixup80(e, M, E);
	s = sin(E/2);
	df = df + 2*e*s*s;
	if (df) f = f/df; 
	return f;
}

double NRT(double e, double M, double E, double t)
{
	double rc;
	Safe_e(e, rc);
	rc = sqrt(1+t*t);  // should have t<<1 refinement here but never used in anger
	if (M*t<0) rc=-rc;
	if (rc != e) rc = ((M-E)*rc+e*t)/(rc-e); else rc = 0;
	return rc;
}

double MTB_NRt2(double e, double M, double E)
{
	double et, f,df,t,t2p1;
	Safe_e(e, f);
	t = tan(E/2);
	et = e*t;
	t2p1 = 1+t*t;
	f = (M-E)*t2p1+2*et;
	df = (1-e)*t2p1 + 2*et*t;
	if (df) f = f/df; 
	return f;
}

double Classic_Halley(double e, double M, double E)
{
	// Classic_Halley is left in its most optimised form for accuracy and speed
	// MTB_Halley below applies the more aggressive (inaccurate) optimisations

	double f,df,s, s2;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
	s = sin(E/2);
	s2 = s*s;
    s = sin(E);
	f = M-E+e*s;
	if ((e < 0.75) || (abs(E) > 0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * sin(E);
	else
		f = FLM_Fixup(e, M, E); // this is the preferred FLM95 Pade approx fast and accurate
	s2 += s2;
	df = df + e*s2;
	
#ifdef FAST

	if (f*df) return f*df / (df * df + 0.5 * e * s * f); else return  f;  //NB nan divide by can result divide by zero if E < 1e-154
#else
	return f/(df+0.5*e*s*f/df);
#endif
}

double MTB_Halley(double e, double M, double E)
{
	double f,df,s, s2;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt(1.0-s2); // or sqrt((1-s)*(1+s)); // inaccurate as E-> pi
	s += s;             // to prevent compiler generated multiply
#endif
	if (M == 0) return -E; // defend against divide by zero when M==0
	f = M-E+e*s;
	df = df + 2*e*s2;
#ifdef FAST
	return f*df/(df*df+e*s*f/2); // more accurate and faster!
#else
	if (df) f = f/df; 
	return f/(1+e*s*f/2);
#endif
}

double HalleyT(double e, double M, double E, double t)
{
	double f, r,rc,t2;
	Safe_e(e, f);
	t2 = t * t;
	if (t2 < 7e-6)
		rc = t2 * (32 +12*t2 - t2*t2) / (64 + 40 * t2);
//		rc = t2 * (4 + t2) / (4 * t2 + 8);
	else
	    rc = sqrt(1+t*t)-1;
	r = M - E;
	f = r * (1 + rc) + e * t;
	if (M * t > 0)
	{
		r += r * rc + e * t;
		rc = rc + 1 - e;
	}
	else
	{
		r = -r - r * rc + e * t;
		rc = -1 - rc - e;
	}
	if (r != 0)	r= r*rc/(rc*rc+0.5*e*r*t);
	return r;
}


double Halley_t2(double e, double M, double E)
{
	double f,df, ddf, t, t2, x;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
	{
		df = 1 - e;
	}

	t = tan(E / 2);
	t2 = t * t;
	if (M>0.01)
	   f = (M - E) * (1 + t2) + 2 * e * t;
	else
	{
		x = M - E;
		f = x + 2 * e * t;
		f += x * t2;

		if (abs(M) < 2e-5)
		{
			double t2, f1, f2;
			t2 = t * t;
			f1 = M + M*t2+ (2*(e-1)-4.0*t2/3)*t; // leading terms that approximately cancel
			f2 = t * t2 * t2 *4* (1.0 / 15 - t2 * (1.0 / 35 - t2 * (1.0 / 63 - t2 / 99)));
			f1 = f1 + f2;
			f = f1;
		}
	}
	if (f == 0.0) return f;
	ddf = e * t;       // this order maximises speed on MSC 2022
	df = df + t2 + e * t2;
	return f * df/(df * df + ddf * f); //ddf rescaled 0.5x
}

double D3t2p54(double e, double M, double E)
{
	double f, df, t, t2, tn, tn2, td, td2, x;
	Safe_e(e, f);
	if (M == 0.0) return M; // defend against divide by zero
	t = E / 2;
	if (E < pi / 2) 
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
	td2 = td * td;
	tn2 = tn * tn;
	t = e * tn * td;
	x = M - E;
	if (tn2 < td2)
	{
		f = x * td2 + 2 * t;
		f += x * tn2;
	}
	else
	{
		f = x * tn2 + 2 * t;
		f += x * td2;
	}

	df = (1 - e) * td2 + (1 + e) * tn2;
	return f * df / (df * df + t*f); //was  e* tn* td* f );
}

double FLM_D3(double e, double M, double E)
{
	double s, s2, f, d3E, d3Ed, df, ddf;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;

	s = sin(E / 2);
	s2 = s * s;
#ifdef PURE
	s = sin(E);
#else
	s = s * sqrt(1 - s) * sqrt(1 + s);
	s += s;
#endif
	s2 += s2;
	if ((e < 0.75) || (abs(M) > 0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * sin(E);
	else
		f = FLM_Fixup(e, M, E);
	if (f == 0.0) return f;
	ddf = e * s;
	df += e * s2;;
#ifdef FAST
	d3E = f * df;
	if (d3E == 0) return 0;
	d3Ed = df * df + ddf * f / 2;
	if (d3Ed != 0) d3E =  d3E / d3Ed; else return d3E = 0; // prevent division by zero
#else
	{ double d2E, d3E;					// old style calculation step by step with multiple divisions
	if (df) d2E = f / df; else d2E = 0;
	d3E = f / (df + 0.5 * d2E * ddf);
	}
#endif
	return d3E;
}



double FLM_D4(double e, double M, double E)
{
	double s,s2, f, d3En, d3Ed, d4E, df,ddf,dddf;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
	
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt(1-s)*sqrt(1+s);
	s += s;
#endif
    s2 += s2; 
if ((e < 0.75) || (abs(M) > 0.275))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * sin(E);
	else
		f = FLM_Fixup(e, M, E);
	if (f==0.0) return f;
	ddf= e*s;
//	dddf= e-e*s2;
//	df = 1-dddf;  // was 1-e+e*s2;
	dddf = e * s2;
	df += dddf;
	dddf = e-dddf;
#ifdef FAST
	d3En = f*df;
	if (d3En == 0) return 0;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-100) return d3En/d3Ed; // prevent division by zero
	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3));
#else
	{ double d2E, d3E;					// old style calculation step by step with multiple divisions
	if (df) d2E = f/df; else d2E=0;
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	}
#endif
	return d4E;
}

double FLM_D4t2(double e, double M, double E)
{
	// tan E/2 implementation lends itself to rescaling ddf

	double t, t2, f, d3En, d3Ed, d4E, df,ddf,dddf, x;
	Safe_e(e, f);
	t = tan(E/2);
	t2 = t*t;
//	f = (M-E)*(1+t2)+2*e*t;
	x = M - E;
	f = x + 2 * e * t;
	f += x * t2;
	if (f==0.0) return f;

	ddf= e*t;       // this order maximises speed on MSC 2022
	dddf= e - e*t2;
	df = 1-e + t2 + e*t2;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f; //ddf rescaled 0.5x
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6)); // ddf rescaled 0.5x two * removed
#else
	{ double d2E, d3E;
	if (df) d2E = f/df; else d2E=0;
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	}
#endif
	return d4E;
}


double FLM_D4t2p(double e, double M, double E)
{
	double t,tn, td, td2, t2, f,  d3En, d3Ed, d4E, df,ddf,dddf;
	Safe_e(e, f);
	t = E/2;
	if (E<pi/2)
	{
	  t2 = t*t;
#ifdef FAST
	  td = 630-255*t2;
	  tn = t*(td+t2*(210-t2));
	  t2 = tn*tn;
	  td2 = td*td;
  	  dddf= e*td2 - e*t2;
	  df = (1-e)*td2 + t2 + e*t2;
#else
	  t = t*(1+t2*(210-t2)/(630-255*t2));
	  t2 = t*t;
  	  dddf= e - e*t2;
	  df = 1-e + t2 + e*t2;
#endif
	}
	else
	{
		t = pi/2-t;
		t2 = t*t;
#ifdef FAST
	  td = 630-255*t2;
	  tn = t*(td+t2*(210-t2));
	  t2 = tn*tn;
	  td2 = td*td;
  	  dddf= e*t2 - e*td2;
	  df = (1-e)*t2 + td2 + e*td2;
#else
		t = t*(1+t2*(210-t2)/(630-255*t2));
	    t2 = t*t;
  	    dddf= e*t2 - e;
	    df = (1-e)*t2 + 1 + e;
#endif
		/*
	    d3En = f*df;
	    d3Ed = df*df+ddf*f; //ddf rescaled 0.5x
	    d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6)); // ddf rescaled 0.5x two * removed
		*/
	}
#ifdef FAST
	f = (M-E)*(td2+t2)+2*e*tn*td;
	if (f==0.0) return 0;
	ddf= e*tn*td;
#else
	f = (M-E)*(1+t2)+2*e*t;
	if (f==0.0) return M;
	ddf= e*t;
#endif
	d3En = f*df;
	d3Ed = df*df+ddf*f; //ddf rescaled 0.5x
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E  = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6)); // ddf rescaled 0.5x two * removed

	return d4E;
}


double FLM_D4t2pM(double e, double M)
{
	double t, tn, td, td2, t2, f, d3En, d3Ed, d4E, df, ddf, dddf;
	Safe_e(e, f);
	t = M / 2;
	if (M < pi / 2)
	{
		t2 = t * t;
#ifdef FAST
		td = 630 - 255 * t2;
		tn = t * (td + t2 * (210 - t2));
		t2 = tn * tn;
		td2 = td * td;
		dddf = e * td2 - e * t2;
		df = (1 - e) * td2 + t2 + e * t2;
#else
		t = t * (1 + t2 * (210 - t2) / (630 - 255 * t2));
		t2 = t * t;
		dddf = e - e * t2;
		df = 1 - e + t2 + e * t2;
#endif
	}
	else
	{
		t = pi / 2 - t;
		t2 = t * t;
#ifdef FAST
		td = 630 - 255 * t2;
		tn = t * (td + t2 * (210 - t2));
		t2 = tn * tn;
		td2 = td * td;
		dddf = e * t2 - e * td2;
		df = (1 - e) * t2 + td2 + e * td2;
#else
		t = t * (1 + t2 * (210 - t2) / (630 - 255 * t2));
		t2 = t * t;
		// 	    f = (M-E)*(1+t2)+2*e*t;
		//	    if (f==0.0) return M;
		//	    ddf= e*t;
		dddf = e * t2 - e;
		df = (1 - e) * t2 + 1 + e;
#endif
	}
#ifdef FAST
	f = 2 * e * tn * td;
	if (f == 0.0) return M;
	ddf = e * tn * td;
#else
	f = 2 * e * t;
	if (f == 0.0) return M;
	ddf = e * t;
#endif
	d3En = f * df;
	d3Ed = df * df + ddf * f; //ddf rescaled 0.5x
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E = f * d3Ed * d3Ed / (df * d3Ed * d3Ed + d3En * (d3Ed * ddf + d3En * dddf / 6)); // ddf rescaled 0.5x two * removed
	return M + d4E;
}

double MTB_D4M(double e, double M)
{
	double s, s2, f, d3Ed, d3En, d4E, df, dddf;
	Safe_e(e, f);
	s = sin(M / 2);
	s2 = s * s;
#ifdef PURE
	s = sin(M);
#else
	//	s = s*sqrt((1-s)*(1+s));
	s = s * sqrt(1 - s2);
	s += s;
#endif
	s2 += s2;

	f = e * s;
	if (f == 0.0) return M;
	//	ddf= e*s;
	dddf = e - e * s2; // e.cos(M)
	df = 1 - dddf;  // was -e+e*s2;

#ifdef FAST
	d3En = f * df;
	if (d3En == 0.0) return M;
	d3Ed = df * df + f * f/2; // was f*f/2 ddf rescaled x1/2 ** actually this is algebraically wrong NOT rescaled but gives a better answer with the mistake!
	if (d3Ed < 1e-88) return d3En / d3Ed;
//was	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*f+d3En*dddf/3));
	d4E = f * d3Ed * d3Ed / (df * d3Ed * d3Ed + d3En * (d3Ed * f + d3En * dddf / 6)); // ddf rescaled
#else
	{ double ddf, d2E, d3E;
	if (df) d2E = f / df; else d2E = 0;
	d3E = f / (df + 0.5 * d2E * ddf);
	d4E = f / (df + 0.5 * d3E * (ddf + d3E * dddf / 3));
	}
#endif
	return M+d4E;
}


double FLM_D4t2M(double e, double M)
{
	double t, t2, f, d3En, d3Ed, d4E, df,ddf,dddf;
	Safe_e(e, f);
	t = tan(M/2);
	t2 = t*t;
	f = e*t;
	if (f==0.0) return M;
	ddf= f;
	f+= f;
	dddf= e - e*t2;
	df = 1-e + t2 + e*t2;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f; //ddf rescaled 0.5x
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6)); // ddf rescaled 0.5x two * removed
#else
	{ double d2E, d3E;
	if (df) d2E = f/df; else d2E=0;
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	}
#endif
	return M+d4E;
}
//#define MDEBUG
#define TFORM

// dc form

double FLM_D4T(double e, double M, double E, double t)
{
	// last order where tangent form is acceptable ?

	double  eps, rc, dc,  f, d3En, d3Ed, d4E, df, ddf, dddf, t2, x;
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
	if (t2 < 1e-7)
//		dc = t2 * (4 + t2) / (4 * t2 + 8);  // 1 + dc
		dc = t2 * (32 + 12 * t2 - t2 * t2) / (64 + 40 * t2); // next highest order
	else
	{
		dc = sqrt(1 + t2)-1;
		if (t2 > 1e7)
		{
			rc = 1;
			if (t>0)
			dc = t+(4 * t2 + 1) / (t * (4 + 8 * t2))-1; // t + dc
			else
				dc = -t - (4 * t2 + 1) / (t * (4 + 8 * t2)) - 1; // t + dc
		}
		else
		    dc = sqrt(1 + t2)-1;
	}
	if (dc == 0) return 0;
	if (M * t < 0) { rc = -rc; dc = -dc; }
//	rc = 1/rc;
//  rs = t*rc;
//	rs = sqrt(1-rc*rc);  // stub for debugging inaccuracies

#ifdef TFORM
//	f = (M-E)*rc + (M-E)*dc  + e * t;
	x = M - E;
	f = x * rc + e * t;
	f += x * dc;

	if (abs(M) < 2e-5)  // this is an explicit  correction for the difficult zone where cancellation is a problem
	{
		double t2, f1, f2, f3;
		t2 = t * t;
		f1 = M * t2 / 2 - M * t2 * t2 / 8 + M * t2 * t2 * t2 / 16;
		f2 = t * (t2 * (t2 * (11.0 / 120 - t2 * (103.0 / 1680 - t2 * (1823.0 / 40320 - t2 * (31373.0 / 887040 - t2 * 265537.0 * t2 / 9225216))))));
		f3 = M + ((e - 1) - t2 / 6) * t;
		f3 = f1 + f2 + f3;
		f = f3;
	}
	if (f==0.0) return f;

	dddf = e*dc;
	if (rc>0.0)
		df = eps+dc;  // more accurate value when e>0.5
	else
		df = rc-e+dc;
	ddf = e*t;
#else
	{ double c,s, rs;
	c = 1/rc;
	s = t*c;
	f = s*s+c*c-1;
	if (abs(f)>8e-16)
	{
		f = f;
	}
	if ((abs(tc-c)>4e-16) || (abs(ts-s)>4e-16))
		f =f ;
	f = M-E+e*s;
	dddf= c*e;
	df = 1-e*c;
	//df = -2*e*sin(E/2)*sin(E/2);
	ddf= e*s;
	}
#endif	
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4E  = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3));
#else
	{ double d2E, d3E;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf); // Halley
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	}
#endif
	return d4E;

}

#define OLD_D5

// beyond here you have to be careful with arguments underflows and overflows 
// are somewhat defended against but very small values will cause trouble and nans
// 
// Not a problem for cubic solvers since when M<10^-10 their answers need no refinement

double FLM_D5(double e, double M, double E)
{
	double s,s2, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df,ddf,dddf;
	Safe_e(e, f);
	if (abs(M) < 1e-30)
	{
		f = 1e-9;
		if (M < 0) f = -f;
		d5E = 0; // for debugging  f - E;        // adjust internal E to be in valid range
		E = f;
	}
	else
		d5E = 0;
	if (e < 0)
	{
		df = -e;
		e = 1 + e;
	}
	else
		df = 1 - e;
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt((1-s)*(1+s)); //*sqrt(1+s);  // a bit too approximate
	s += s;
#endif
	if ((e < 0.9) || (abs(M) > 0.25))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * s;  
	else
		f = FLM_Fixup(e, M, E); // FLM95 is the best choice here
//	f = M - E + e * s;
	if (f==0.0) return f;
	dddf= e-2*e*s2;
//	df = 1-e+2*e*s2;
	df = df + 2 * e * s2;
	ddf= e*s;
//a	ddddf = -ddf;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
//	d4E = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3));
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4E = d4Ed*d4Ed;
	d5E += f*d4E*d4Ed/(df*d4E*d4Ed+0.5*d4En* (ddf*d4E+ d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
#else
	{ double d2E, d3E, ddddf;
	ddddf = -ddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	}
#endif
	return d5E;
}

double FLM_D5T(double e, double M, double E, double t)
{
	// last order where tangent form is acceptable ?

	double rc, dc,  f,  d3En, d3Ed, d4E, d4En, d4Ed, d5E, df, ddf, dddf, t2; //BUGBUG 5/8
#ifdef MDEBUG
	double ts, tc;
	tc = cos(E);
	ts = sin(E);
#endif
	Safe_e(e, f);
	rc = 1;
	t2 = t * t;
	if (t2 < 1e-6)
		dc = t2 * (4 + t2) / (4 * t2 + 8);  // 1 + dc
	else
	{
		dc = sqrt(1 + t2) - 1;
		if (t2 > 1e3)
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
	//	rc = 1/rc;
	//  rs = t*rc;
	//	rs = sqrt(1-rc*rc);

#ifdef TFORM
	f = (M - E) * rc + (M - E) * dc + e * t;
	if (f == 0.0) return f;

	dddf = e * dc;
	df = rc - e + dc;
	ddf = e * t;
#else
	{ double c,s;
	c = 1/rc;
	s = t*c;
	f = s*s+c*c-1;
	if (abs(f)>8e-16)
	{
		f = f;
	}
	if ((abs(tc-c)>4e-16) || (abs(ts-s)>4e-16))
		f =f ;
	f = M-E+e*s;
	dddf= c*e;
	df = 1-e*c;
	//df = -2*e*sin(E/2)*sin(E/2);
	ddf= e*s;
	}
#endif	
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
//	d4E  = f*d3Ed*d3Ed/(df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3));
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4E = d4Ed*d4Ed;
//a	267 d5E = f*d4E*d4Ed/(df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed+0.25*d4En*ddddf)/3)));
//b	263 
	d5E = f*d4E*d4Ed/(df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3)));
#else
	{ double d2E, d3E;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf); // Halley
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	d5E = f/(df+0.5*d4E*(ddf+d4E*(dddf*d4E-0.25*ddf)/3));
	}
#endif
	return d5E;

}

double FLM_D5t2(double e, double M, double E)
{
	double t, t2, t2p1, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df, ddf, dddf;
	if (abs(E) > 3.14159265)
	{
		t = 3.14159265;
		if (M < 0) t = -t;
		d5E = t-E;        // adjust external E to be in valid range
		E = t;
	}
	else d5E = 0;
	Safe_e(e, f);
	t = tan(E/2);
	t2 = t*t;
	t2p1 = 1+t2;
	f = (M-E)*t2p1+2*e*t;
	if (f==0.0) return f;
	ddf = e*t;
	dddf = e-e*t2;
	df = 1-e+(1+e)*t2;
//	ddf= 2*e*t; NB rescaled above
//	ddf= e*t;
#ifdef FAST
	d3En = f*df;
//	d3Ed = df*df+ddf*f/2;
	d3Ed = df*df+ddf*f;
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
//	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4Ed = df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6);
	d4E = d4Ed*d4Ed;
	d5E += f*d4E*d4Ed/(df*d4E*d4Ed+(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.5*d4En*ddf)/6)));  
#else
	{ double d2E, d3E, ddddf;
	ddddf = -ddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+d2E*ddf); // Halley
	d4E = f/(df+d3E*(ddf+d3E*dddf/6));
	d5E += f/(df+(d4E*(ddf+d4E*(dddf+0.5*d4E*ddddf)/6)));
	}
#endif
	return d5E;
}



double FLM_D5t2pM(double e, double M) //, double E)
{
	double E, t,td, tn, t2, td2,  f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df,ddf,dddf;
//	t = tan(E/2);
	Safe_e(e, f);
	E=M;
	if (abs(E) > 3.14159265)
	{
		t = 3.14159265;
		if (M < 0) t = -t;
		d5E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else d5E = 0;

	t = E/2;
	if (E<pi/2)
	{
	  t2 = t*t;
#ifdef FAST
	  td = 630-255*t2;
	  tn = t*(td+t2*(210-t2));
	  t2 = tn*tn;
	  td2 = td*td;
  	  dddf= e*td2 - e*t2;
	  df = (1-e)*td2 + t2 + e*t2;
#else
	  t = t*(1+t2*(210-t2)/(630-255*t2));
	  t2 = t*t;
  	  dddf= e - e*t2;
	  df = 1-e + t2 + e*t2;
#endif
	}
	else
	{
		t = pi/2-t;
		t2 = t*t;
#ifdef FAST
	  td = 630-255*t2;
	  tn = t*(td+t2*(210-t2));
	  t2 = tn*tn;
	  td2 = td*td;
  	  dddf= e*t2 - e*td2;
	  df = (1-e)*t2 + td2 + e*td2;
#else
		t = t*(1+t2*(210-t2)/(630-255*t2));
	    t2 = t*t;
// 	    f = (M-E)*(1+t2)+2*e*t;
//	    if (f==0.0) return M+f;
//	    ddf= e*t;
  	    dddf= e*t2 - e;
	    df = (1-e)*t2 + 1 + e;
#endif
	}
#ifdef FAST
	f = (M-E)*(td2+t2)+2*e*tn*td;
	if (f==0.0) return M;
	ddf= e*tn*td;
#else
	f = (M-E)*(1+t2)+2*e*t;
	if (f==0.0) return M;
	ddf= e*t;
#endif 
#ifdef FAST
	d3En = f*df;
//	d3Ed = df*df+ddf*f/2;
	d3Ed = df*df+ddf*f;
	if (d3Ed < 1e-88) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
//	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4Ed = df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6);
	if (d4Ed > 1e90) 
		return M + d4En / d4Ed;
	else
		if (d4Ed < 1e-100) return M + d4En / d4Ed;
	d4E = d4Ed*d4Ed;
	d5E += f*d4E*d4Ed/(df*d4E*d4Ed+(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.5*d4En*ddf)/6)));
#else
	{ double d2E, d3E, ddddf;
//	ddf += ddf;
	ddddf = -ddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+d2E*ddf); // Halley
	d4E = f/(df+d3E*(ddf+d3E*dddf/6));
	d5E += f/(df+(d4E*(ddf+d4E*(dddf+0.5*d4E*ddddf)/6)));
	}
#endif
	return M+d5E;
}


double MTB_D5M(double e, double M)
{
	double s, s2, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df, dddf;
	Safe_e(e, f);
	s = sin(M / 2);
	s2 = s * s;
#ifdef PURE
	s = sin(M);
#else
	s = s * sqrt((1 - s) * (1 + s)); //*sqrt(1+s);  // a bit too approximate
	s += s;
#endif
	f = e * s;
	if (f == 0.0) return f;
	dddf = e - 2 * e * s2;
	df = 1 - e + 2 * e * s2;
	//	ddf= e*s;
#ifdef FAST
	d3En = f * df;
	d3Ed = df * df + f * f ; // ddf rescaled /2
	if (d3Ed < 1e-34) return d3En / d3Ed;
	d4En = f * d3Ed * d3Ed;
	d4Ed = df * d3Ed * d3Ed + d3En * (d3Ed * f + d3En * dddf / 6);
	d4E = d4Ed * d4Ed;
	d5E = f * d4E * d4Ed / (df * d4E * d4Ed + (d4En * (f * d4E + d4En * (dddf * d4Ed - 0.25 * d4En * f) / 6)));
#else
	{ double ddf, d2E, d3E, ddddf;
	ddddf = -f;
	if (df) d2E = f / df; // NR
	d3E = f / (df + 0.5 * d2E * ddf); // Halley
	d4E = f / (df + 0.5 * d3E * (ddf + d3E * dddf / 3));
	d5E = f / (df + 0.5 * (d4E * (ddf + d4E * (dddf + 0.25 * d4E * ddddf) / 3)));
	}
#endif
	return M+d5E;
}


double FLM_D5t2M(double e, double M)
{
	double t,t2, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, df,ddf,dddf;
	Safe_e(e, f);
	t = tan(M/2); 
	t2 = t*t;
	f = e*t;
	if (f==0.0) return M;
	ddf = f;
	f+=f;
	dddf = e-e*t2;
	df = 1-e+(1+e)*t2;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f;
	if (d3Ed < 1e-35)
		return d3En / d3Ed;
//\\\\\\\\\\\\\\\\\\\\\\\\	else
//		if (d3Ed > 1e35) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6);
	if (d4Ed > 1e100) return d4En / d4Ed;
	d4E = d4Ed*d4Ed;
	d5E = f*d4E*d4Ed/(df*d4E*d4Ed+(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.5*d4En*ddf)/6)));
#else
	{ double d2E, d3E, ddddf;
	ddddf = -ddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+d2E*ddf); // Halley
	d4E = f/(df+d3E*(ddf+d3E*dddf/6));
	d5E = f/(df+(d4E*(ddf+d4E*(dddf+0.5*d4E*ddddf)/6)));
	}
#endif
	return M+d5E;
}

double MTB_D6(double e, double M, double E)
{
	double s,s2, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, df,ddf,dddf;
	Safe_e(e, f);
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt((1-s)*(1+s)); // not accurate enough for higher orders
	s += s;
#endif

	if ((e < 0.9) || (abs(M) > 0.25))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * s;
	else
		f = FLM_Fixup(e, M, E); // FLM95 is the best choice here
//	f = M-E+e*s;
	if (f==0.0) return f;

	dddf= e-2*e*s2;
	df = 1-e+2*e*s2;
	ddf= e*s;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-30) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	if (d4Ed > 1e100) return d4En / d4Ed;
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5E = d5Ed*d5Ed;
	if (d5E < 1e-122) return d5En / d5Ed;
	d6E = f*d5E*d5E/(df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3)));
#else
	{ double d2E, d3E, ddddf, dddddf;
	ddddf = -ddf;
	dddddf = -dddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	d6E = f/(df+0.5*(d5E*(ddf+d5E*(dddf+0.25*d5E*(ddddf+0.2*d5E*dddddf))/3)));
	}
#endif
	return d6E;
}


double MTB_D6t2(double e, double M, double E)
{
	double t,t2, t2p1, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, df,ddf,dddf;
	if (abs(E) > 3.12)
	{
		t = 3.12;
		if (M < 0) t = -t;
		d6E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else d6E = 0;
	Safe_e(e, f);
	t = tan(E/2);
	t2 = t*t;
	t2p1 = 1+t2;
	f = (M-E)*t2p1+2*e*t;
	if (f==0.0) return f;
	dddf = e-e*t2;
	df = 1-e+(1+e)*t2;
	ddf= e*t;
#ifdef FAST
	d3En = f*df;
//	d3Ed = df*df+ddf*f/2;
	d3Ed = df*df+ddf*f;  // ddf rescaled by 1/2
	if (d3Ed < 1e-30) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
//	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4Ed = df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6);
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
//    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5Ed = df*d4E*d4Ed+(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.5*d4En*ddf)/6));
	d5E = d5Ed*d5Ed;
//	d6E = f*d5E*d5E/(df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3)));
	d6E += f*d5E*d5E/(df*d5E*d5E+(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.5*d5En*(ddf*d5Ed+0.1*d5En*dddf))/6)));
#else
	{ double d2E, d3E, ddddf, dddddf;
	ddddf = -ddf; // ddf rescaled
	dddddf = -dddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+d2E*ddf);
	d4E = f/(df+d3E*(ddf+d3E*dddf/6));
	d5E = f/(df+(d4E*(ddf+d4E*(dddf+0.5*d4E*ddddf)/6)));
	d6E += f/(df+(d5E*(ddf+d5E*(dddf+0.5*d5E*(ddddf+0.1*d5E*dddddf))/3)));
	}
#endif
	return d6E;
}


double MTB_D6t2p(double e, double M) // was , double E)
{
	double t,t2, t2p1, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, df,ddf,dddf;
	double E=M;
	if (abs(E) > 3.12)
	{
		t = 3.12;
		if (M < 0) t = -t;
		d6E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else d6E = 0;
	Safe_e(e, f);
	t = E/2;
	if (E<pi/2)
	{
	  t2 = t*t;
	  t = t*(1+t2*(210-t2)/(630-255*t2));
	  t2 = t*t;
  	  dddf= e - e*t2;
	  df = 1-e + t2 + e*t2;
	}
	else
	{
		t = pi/2-t;
		t2 = t*t;
		t = t*(1+t2*(210-t2)/(630-255*t2));
	    t2 = t*t;
  	    dddf= e*t2 - e;
	    df = (1-e)*t2 + 1 + e;
	}
	t2p1 = 1+t2;
	f = (M-E)*t2p1+2*e*t;
	if (f==0.0) return f;
	ddf= e*t;
	d3En = f*df;
	d3Ed = df*df+ddf*f;
	if (d3Ed < 1e-30) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+d3En*(d3Ed*ddf+d3En*dddf/6);
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
	d5Ed = df*d4E*d4Ed+(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.5*d4En*ddf)/6));
	d5E = d5Ed*d5Ed;
	d6E += f*d5E*d5E/(df*d5E*d5E+(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.5*d5En*(ddf*d5Ed+0.1*d5En*dddf))/6)));
	return d6E;
}


double MTB_D7(double e, double M, double E)
{
	double s,s2, t, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E,  d6Ed, d6En, d7E, df,ddf,dddf;

	if (abs(M) < 0.02)
	{
		t = 0.17255; //was 0.2
		if (M < 0) t = -t;
		d7E = t - E; // was - M       // adjust external E to be in valid range
		E = t;
	}
	else
	{
		if (abs(M) > 3.1)
		{
			t = 3.1;
			if (M < 0) t = -t;
			d7E = t - E;
			E = t;

		}
		else d7E = 0;
	}
	Safe_e(e, f);
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt((1-s)*(1+s));
	s += s;
#endif

	if ((e < 0.9) || (abs(M) > 0.25))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * s;
	else
		f = FLM_Fixup(e, M, E); // FLM95 is the best choice here
//	f = M-E+e*s;
	if (f==0.0) return f;

	dddf= e-2*e*s2;
	df = 1-e+2*e*s2;
	ddf= e*s;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-30) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5E = d5Ed*d5Ed;
	if (d5E < 1e-122) return d7E+d5En / d5Ed;
	d6En = f*d5E*d5E;
	d6Ed = df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3));
	//
	//d6E = f * d5E * d5E / (df * d5E * d5E + 0.5 * (d5En * (d5E * d5Ed * ddf + d5En * (dddf * d5E - 0.25 * d5En * (ddf * d5Ed + 0.2 * d5En * dddf)) / 3)));
	// 
//	return d6En / d6Ed; // to see if this code is faster than D6M 
	                    // (it is but only when the next lines are executed!
	d6E = d6Ed*d6Ed;
	if (d6E < 1e-122) d7E += d6En / d6Ed;
	else
	  d7E += f*d6Ed*d6E*d6E/(df*d6Ed*d6E*d6E+0.5*(d6En*(ddf*d6E*d6E+d6En*(dddf*d6Ed*d6E-0.25*d6En*(ddf*d6E+0.2*d6En*(dddf*d6Ed-d6En*ddf/6)))/3)));
//	d7E += d6En / d6Ed;
#else
	{ double d2E, d3E, ddddf, dddddf,ddddddf;
	ddddf = -ddf;
	dddddf = -dddf;
	ddddddf = -ddddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));	
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	d6E = f/(df+0.5*(d5E*(ddf+d5E*(dddf+0.25*d5E*(ddddf+0.2*d5E*dddddf))/3)));
	d7E = f/(df+0.5*(d6E*(ddf+d6E*(dddf+0.25*d6E*(ddddf+0.2*d6E*(dddddf+d6E*ddddddf/6)))/3)));
	}
#endif

	return d7E;
}
double MTB_D7t2(double e, double M, double E)
{
	double t,t2,t2p1, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, d6Ed, d6En, d7E, df,ddf,dddf;

	if (abs(E) > 2.2)
	{
		t = 2.2;
		if (M < 0) t = -t;
		d7E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else
	{
		d7E = 0;
		if (abs(M) < 0.005)
		{
			t = 0.51247; // was 1.0; fine tuned 26/6/23 to avoid nans
			//t = 0.512;
			if (M < 0) t = -t;
			d7E = t - E;
			E = t;
		}
	}
	Safe_e(e, f);
	t = tan(E/2);
	t2 = t*t;
	t2p1 = 1+t2;
	f = (M-E)*t2p1+2*e*t;
	if (f==0.0) return f;
	dddf= e*t2p1-2*e*t*t;
	df = 1-e+(1+e)*t2;
	ddf= 2*e*t;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-30) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5E = d5Ed*d5Ed;
	d6En = f*d5E*d5E;
	d6Ed = df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3));
	d6E = d6Ed*d6Ed;
	d7E += f*d6Ed*d6E*d6E/(df*d6Ed*d6E*d6E+0.5*(d6En*(ddf*d6E*d6E+d6En*(dddf*d6Ed*d6E+0.25*d6En*(-ddf*d6E+0.2*d6En*(-dddf*d6Ed+d6En*ddf/6)))/3)));
#else
	{ double d2E, d3E, ddddf, dddddf,ddddddf;
	ddddf = -ddf;
	dddddf = -dddf;
	ddddddf = -ddddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));	
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	d6E = f/(df+0.5*(d5E*(ddf+d5E*(dddf+0.25*d5E*(ddddf+0.2*d5E*dddddf))/3)));
	d7E += f/(df+0.5*(d6E*(ddf+d6E*(dddf+0.25*d6E*(ddddf+0.2*d6E*(dddddf+d6E*ddddddf/6)))/3)));
	}
#endif
	return d7E;
}

double MTB_D8(double e, double M, double E)
{
	// this is just beyond the limit where numerical underflow and overflow becomes a problem so the last step is conventional
	// the rounding errors are worse than they could be if it were renormalised but it is already too slow
	// done more to investigate the odd vs even pattern of worst case errors and effective O(e^N) with N (no practical use)

	double s,s2, t, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, d6Ed, d6En, d7E, d7Ed, d7En,d8E, df,ddf,dddf;
	if (abs(E) > 2.2)
	{
		t = 2.2;
		if (M < 0) t = -t;
		d8E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else
	if (abs(M) < 0.005)
	{
		t = 0.8;
		if (M < 0) t = -t;
		d8E = t - M;        // adjust external E to be in valid range
		E = t;
	}
	else d8E = 0;
	Safe_e(e, f);
	s = sin(E/2);
	s2 = s*s;
#ifdef PURE
	s = sin(E);
#else
	s = s*sqrt((1-s)*(1+s));
	s += s;
#endif

	if ((e < 0.9) || (abs(M) > 0.25))      // only apply slower series when it will help accuracy real*8 M>0.785 approx!
		f = M - E + e * s;
	else
		f = FLM_Fixup(e, M, E); // FLM95 is the best choice here
//	f = M-E+e*s;
	if (f==0.0) return f;
	dddf= e-2*e*s2;
	df = 1-e+2*e*s2;
	ddf= e*s;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-23) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	if (d4Ed > 1e100) return d4En / d4Ed;
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5E = d5Ed*d5Ed;
	d6En = f*d5E*d5E;
	d6Ed = df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3));
	if (d6Ed < 1e-50) return d6En / d6Ed;
	d6E = d6Ed*d6Ed;
	d7En = f*d6Ed*d6E*d6E;
    d7Ed = df*d6Ed*d6E*d6E+0.5*(d6En*(ddf*d6E*d6E+d6En*(dddf*d6Ed*d6E+0.25*d6En*(-ddf*d6E+0.2*d6En*(-dddf*d6Ed+d6En*ddf/6)))/3));
	d7E = d7En/d7Ed;
	d8E += f/(df+0.5*(d7E*(ddf+d7E*(dddf+0.25*d7E*(-ddf+0.2*d7E*(-dddf+d7E*(ddf+d7E*dddf/7)/6)))/3))); // this has no chance of working numerically algebra only

//	d7E = d7Ed*d7Ed;  // fails numerical underflow on double precision - might be OK on real*10 ? (untested)
//  d8E = f*d7E*d7E*d7E/(df*d7E*d7E*d7E+0.5*(d7En*(ddf*d7E*d7E*d7Ed+d7En*(dddf*d7E*d7E+0.25*d7En*(-ddf*d7E*d7Ed+0.2*d7En*(-dddf*d7E+d7En*(ddf*d7Ed+dddf/7)/6)))/3)));
#else
	{ double d2E, d3E, ddddf, dddddf,ddddddf,dddddddf;
	ddddf = -ddf;
	dddddf = -dddf;
	ddddddf = -ddddf;
	dddddddf = -dddddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));	
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	d6E = f/(df+0.5*(d5E*(ddf+d5E*(dddf+0.25*d5E*(ddddf+0.2*d5E*dddddf))/3)));
	d7E = f/(df+0.5*(d6E*(ddf+d6E*(dddf+0.25*d6E*(ddddf+0.2*d6E*(dddddf+d6E*ddddddf/6)))/3)));
	d8E = f/(df+0.5*(d7E*(ddf+d7E*(dddf+0.25*d7E*(ddddf+0.2*d7E*(dddddf+d7E*(ddddddf+d7E*dddddddf/7)/6)))/3))); // this has no chance of working numerically algebra only
	}
#endif
	return d8E;
}

double MTB_D8t2(double e, double M, double E)
{
	// this is just beyond the limit where numerical underflow becomes a problem so the last step is conventional algebra
	// the rounding errors are worse than they could be if it were renormalised but it is already too slow
	// done more to investigate the odd vs even pattern of worst case errors and effective O(e^N) with N (no practiacl use)

	double t,t2,t2p1, f, d3Ed, d3En, d4E, d4Ed, d4En, d5E, d5Ed, d5En, d6E, d6Ed, d6En, d7E, d7Ed, d7En,d8E, df,ddf,dddf;
	if (abs(E) > 2.2)
	{
		t = 2.2;
		if (M < 0) t = -t;
		d8E = t - E;        // adjust external E to be in valid range
		E = t;
	}
	else
	{
		if (abs(M) < 0.005)
		{
			t = 0.8;
			if (M < 0) t = -t;
			d8E = t - M;        // adjust external E to be in valid range
			E = t;
		}
		else d8E = 0;
	}
	Safe_e(e, f);
	t = tan(E/2);
	t2 = t*t;
	t2p1 = t2+1;
	f = (M-E)*t2p1 + 2*e*t;
	if (f==0.0) return f;
	dddf= e*t2p1-2*e*t*t;
	df = 1-e+(1+e)*t2;
	ddf= 2*e*t;
#ifdef FAST
	d3En = f*df;
	d3Ed = df*df+ddf*f/2;
	if (d3Ed < 1e-28) return d3En / d3Ed;
	d4En = f*d3Ed*d3Ed;
	d4Ed = df*d3Ed*d3Ed+0.5*d3En*(d3Ed*ddf+d3En*dddf/3);
	d4E = d4Ed*d4Ed;
	d5En = f*d4E*d4Ed;
    d5Ed = df*d4E*d4Ed+0.5*(d4En*(ddf*d4E+d4En*(dddf*d4Ed-0.25*d4En*ddf)/3));
	d5E = d5Ed*d5Ed;
	d6En = f*d5E*d5E;
	d6Ed = df*d5E*d5E+0.5*(d5En*(d5E*d5Ed*ddf+d5En*(dddf*d5E-0.25*d5En*(ddf*d5Ed+0.2*d5En*dddf))/3));
	d6E = d6Ed*d6Ed;
	d7En = f*d6Ed*d6E*d6E;
    d7Ed = df*d6Ed*d6E*d6E+0.5*(d6En*(ddf*d6E*d6E+d6En*(dddf*d6Ed*d6E+0.25*d6En*(-ddf*d6E+0.2*d6En*(-dddf*d6Ed+d6En*ddf/6)))/3));
	d7E = d7En/d7Ed;
	d8E += f/(df+0.5*(d7E*(ddf+d7E*(dddf+0.25*d7E*(-ddf+0.2*d7E*(-dddf+d7E*(ddf+d7E*dddf/7)/6)))/3))); // this has no chance of working numerically algebra only

//	d7E = d7Ed*d7Ed;  // fails numerical underflow on double precision - might be OK on real*10 ? (untested)
//  d8E = f*d7E*d7E*d7E/(df*d7E*d7E*d7E+0.5*(d7En*(ddf*d7E*d7E*d7Ed+d7En*(dddf*d7E*d7E+0.25*d7En*(-ddf*d7E*d7Ed+0.2*d7En*(-dddf*d7E+d7En*(ddf*d7Ed+dddf/7)/6)))/3)));
#else
	{ double d2E, d3E, ddddf, dddddf,ddddddf,dddddddf;
	ddddf = -ddf;
	dddddf = -dddf;
	ddddddf = -ddddf;
	dddddddf = -dddddf;
	if (df) d2E = f/df; // NR
	d3E = f/(df+0.5*d2E*ddf);
	d4E = f/(df+0.5*d3E*(ddf+d3E*dddf/3));	
	d5E = f/(df+0.5*(d4E*(ddf+d4E*(dddf+0.25*d4E*ddddf)/3)));
	d6E = f/(df+0.5*(d5E*(ddf+d5E*(dddf+0.25*d5E*(ddddf+0.2*d5E*dddddf))/3)));
	d7E = f/(df+0.5*(d6E*(ddf+d6E*(dddf+0.25*d6E*(ddddf+0.2*d6E*(dddddf+d6E*ddddddf/6)))/3)));
	d8E = f/(df+0.5*(d7E*(ddf+d7E*(dddf+0.25*d7E*(ddddf+0.2*d7E*(dddddf+d7E*(ddddddf+d7E*dddddddf/7)/6)))/3))); // this has no chance of working numerically algebra only
	}
#endif
	return d8E;
}