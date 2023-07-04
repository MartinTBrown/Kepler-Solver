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
#include "deltas.h"
#include "intel.h"
#include "starter.h"
#include "opt_starter.h"
#include "classic.h"

// the majority of these functions exist to allow delta_N(e,M,E) 
// to be benchmarked by calling them with E = S1(e,M) or with E = M
// delta_N(e,M, S1(e,M));
// 
// The rest apply NR, D3, D4, D5 to various starters
// 
// there are a few other miscellaneous routines to test certain contructs for speed.

// these parameters are used for optimising behaviour in Danby_S1

//need to decide the optimal point to switch from cubic solution to
// Dn applied to starter cutoff varies from M < 10^-11 to 10^-9 at present
// pade/polynomial approximations need more help from the refinement
// system sin/cos gives E0 answers to machine precisions for M < 1e-10

double rk = 1.0; // global parameter used in optimising starter E' = M+rk*re
double re = 0.7;

void Set_rk(double k)
{
	rk = k;
}

double Get_rk()
{
	return rk;
}

void Set_re(double e)
{
	re = e;
}

double Get_re()
{
	return re;
}

// routines for benchmarking taking a single argument x

double BM_atan2(double x)
{
	return atan2(x, 1);
}

double BM_sincos(double x)
{
	return sin(x) + cos(x);
}

double BM_D0(double e, double M)
{
	return M + D0(e, M);
}

double BM_D1(double e, double M)
{
	return M + D1(e, M);
}

double BM_FLM_NR(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + FLM_NR(e, M, E);
}

double BM_FLM_NRNR(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + FLM_NR(e, M, E);
	return E + FLM_NR(e, M, E);
}

double BM_FLM_NRNRNR(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + FLM_NR(e, M, E);
	E = E + FLM_NR(e, M, E);
	return E + FLM_NR(e, M, E);
}

double BM_FLM_NRNRNRNR(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + FLM_NR(e, M, E);
	E = E + FLM_NR(e, M, E);
	E = E + FLM_NR(e, M, E);

	return E + FLM_NR(e, M, E);
}

double BM_FLM_NRNRt2(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + MTB_NRt2(e, M, E);
	return E + FLM_NR(e, M, E);
}
double BM_FLM_NRt2NRt2(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + MTB_NRt2(e, M, E);
	return E + MTB_NRt2(e, M, E);
}

double BM_FLM_NRt2NR(double e, double M)
{
	double E = Gooding_S1(e, M);
	E = E + FLM_NR(e, M, E);
	return E + MTB_NRt2(e, M, E);
}

double BM_MTB_NRt2(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + MTB_NRt2(e, M, E);
}

double BM_Classic_NR(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + Classic_NR(e, M, E);
}

double BM_Classic_NR80(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + Classic_NR80(e, M, E);
}

double BM_Classic_Halley(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + Classic_Halley(e, M, E);
}

double BM_Kepler_Halley80(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + Kepler_Halley80(e, M, E);
}

double BM_MTB_Halley(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + MTB_Halley(e, M, E);
}

double BM_Halley_t2(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_FLM_D4(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + FLM_D4(e, M, E);
}
double BM_FLM_D4t2(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + FLM_D4t2(e, M, E);
}
/*
double BM_FLM_D4t2M(double e, double M)
{
	return FLM_D4t2M(e, M);
}
*/
double BM_FLM_D5(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + FLM_D5(e, M, E);
}

double BM_FLM_D5t2(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + FLM_D5t2(e, M, E);
}

double Danby_S1k(double e, double M)
{
#ifdef STRICT
	/*
	if (M>0)
			E = M +(0.7571-0.2744*e)*e;
		else
			E = M -(0.7571-0.2744*e)*e;
		return E;
	*/
	return (M > 0) ? M + rk * e : M - rk * e; // next simplest
#else
#ifdef PURE 
	return (M > 0) ? M + e : M - e; // the simplest possible starting estimate with guaranteed convergence
#else
	double E;				// slightly more sophisticated to defend from |E0| > pi !PURE cannot handle that! 
	if (M > 0)
	{
		E = M + e * (0.966 - 0.565 * e);
		if (E > pi) E = pi;
	}
	else
	{
		E = M - e * (0.966 - 0.565 * e);
		if (E < -pi) E = -pi;
	}
	return E;
#endif
#endif
}


double BM_Dn_MkE(double e, double M)
{
	// uncomment the one that you want to investigate Halley is an interesting example

	double E;
	E = M + rk * re;
	//	return E+FLM_NR(re,M,E);
		return E+Classic_Halley(re,M,E); // moderately interesting example
	//	return E+FLM_D4t2(re,M,E);
	//  return E+FLM_D5t2(re,M,E);
	//  return E + MTB_D6(re, M, E);
}

// there follows below optimum k(e) functions for various delta refiners
// S1' = M + k(e)*e
// most are piecewise approximations and some are continuous smooth curves
// Halley has an exciting bit around e ~ 0.85

// the following are expressions for S1' = M + k(e).e for each of the deltas
// not all of them are continuous but they gain an order of magnitude improvement
// in the resulting solution after applying the refinement step

double BM_NR_OptK(double e, double M)
{
	double E, k;
	k = 0.7506 - e * (0.207 + e * 0.0677);
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	return E + FLM_NR(e, M, E);
}

double BM_NRNR_OptK(double e, double M)
{
	double E, k;
	//	k = 0.7506-e*(0.207+e*0.0677);
	k = 0.8 - e * (0.4826 - e * (1.2063 - 1.1561 * e));
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	E = E + FLM_NR(e, M, E);
	return E + FLM_NR(e, M, E);
}

double BM_D3_OptK(double e, double M)
{
	double E, k;
	if (e <= 0.7)
		k = 0.387 + 0.03 * e / 0.7;
	else
	{
		if (e < 0.8)
			k = 0.43 + 0.303 * (e - 0.7);
		else
			k = 0.74 - 0.39 * (e - 0.8) / 0.2;
	}
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	return E + Classic_Halley(e, M, E);
}

double BM_D4_OptK(double e, double M)
{
	double E, k;
	if (e <= 0.6)
		k = 0.68 - 0.29 * e / 0.6;
	else
	{
		if (e < 0.8475)
			k = 0.41 + 0.07 * (e - 0.6) / 0.2475;
		else
			k = 0.8355 - 0.5 * (e - 0.8475) / 0.1525;
	}
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	return E + FLM_D4(e, M, E);
}

double BM_D5_OptK(double e, double M)
{
	double E, k;
	if (e <= 0.5)
		k = 0.4;
	else
	{
		if (e < 0.83)
			k = 0.4 + 0.37 * (e - 0.5) / 0.33;
		else
			k = 0.77 - 0.47 * (e - 0.83) / 0.17;
	}
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	return E + FLM_D5(e, M, E);
}

double BM_D6_OptK(double e, double M)
{
	double E, k;
	if (e <= 0.84)
	{
		E = (e - 0.42) / 0.42;
		k = 0.48 + E * E * 0.1468;
	}
	else
		k = 0.6368 - (e - 0.84) * 0.35 / 0.16;
	if (M < 0)
		E = M - k * e;
	else
		E = M + k * e;
	return E + MTB_D6(e, M, E);
}

double BM_FLM_D4t2NRok(double e, double M)
{
	double E;
	E = BM_D4_OptK(e, M);
	return E + MTB_NRt2(e, M, E);
}

double BM_FLM_D4t2D3ok(double e, double M)
{
	double E;
	E = BM_D4_OptK(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_FLM_D4t2D4ok(double e, double M)
{
	double E;
	E = BM_D4_OptK(e, M);
	return E + FLM_D4t2(e, M, E);
}

double BM_MTB_D6(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + MTB_D6(e, M, E);
}

double BM_MTB_D6t2(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + MTB_D6t2(e, M, E);
}

double BM_MTB_D7(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + MTB_D7(e, M, E);
}

double BM_MTB_D7t2(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + MTB_D7t2(e, M, E);
}

double BM_MTB_D8(double e, double M)
{
	double E = Gooding_S1(e, M);
	return E + MTB_D8(e, M, E);
}

double BM_MTB_D8t2(double e, double M)
{
	double E = Gooding_S1(e, M);;
	return E + MTB_D8t2(e, M, E);
}

double BM_MTB_D3M(double e, double M)
{
	return M + Classic_Halley(e, M, M);
}

double BM_D4_D4M(double e, double M)
{
	double E;
	E = M + FLM_D4t2(e, M, M);
	return E + FLM_D4(e, M, E);
}

double BM_D4_D4t2p(double e, double M)
{
	double E;
	E = FLM_D4t2pM(e, M);
	return E + FLM_D4(e, M, E);
}

double BM_FLM_D4t2p(double e, double M)
{
	double E;
	E = Gooding_S1(e, M);
	return E + FLM_D4t2p(e, M, E);;
}

double BM_D4_D54t2pM(double e, double M)
{
	double E;
	E = FLM_D5t2pM(e, M);
	return E + FLM_D4t2(e, M, E);
}

double BM_D4t2_D4t2(double e, double M)
{
	double E;
	E = Gooding_S1(e, M);
	E = E + FLM_D4t2(e, M, E);
	return E + FLM_D4t2(e, M, E);
}

double BM_D3_D4M(double e, double M)
{
	double E;
	E = MTB_D4M(e, M);
	return E + Classic_Halley(e, M, E);
}

double BM_MTB_D6M(double e, double M)
{
	return M + MTB_D6(e, M, M);
}

double BM_MTB_D7M(double e, double M)
{
	return M + MTB_D7(e, M, M);
}

double BM_MTB_D8M(double e, double M)
{
	return M + MTB_D8(e, M, M);
}

double BM_D3t2S9t2(double e, double M)
{
	double E = S9t2(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_D3t2S9t2p52(double e, double M)
{
	double E = S9t2p52(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_D3S9t2(double e, double M)
{
	double E = S9t2(e, M);
	return E + Classic_Halley(e, M, E);
}

double BM_D3t2S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_D4t2S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + FLM_D4t2(e, M, E);
}

double BM_D5t2S9t2(double e, double M)
{
	double E = S9t2(e, M);
	return E + FLM_D5t2(e, M, E);
}

double BM_D3t2_S9t2p52(double e, double M)
{
	double E = S9t2p54(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_D3t2p_S9t2p52(double e, double M)
{
	double E = S9t2p54(e, M);
	return E + D3t2p54(e, M, E);
}

double BM_D3t2p54M(double e, double M)
{
	return M + D3t2p54(e, M, M);
}

double BM_D3t2p54(double e, double M)
{
	double E = Gooding_S1(e,M);
	return E + D3t2p54(e, M, E);
}

double BM_NRD5t2(double e, double M)
{
	double E = MTB_D5M(e, M);
	return E + FLM_NR(e, M, E);
}

double BM_D5t2S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + FLM_D5t2(e, M, E);
}

double BM_NR_Basic(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	if (M < 1e-10) return E;
	return E + FLM_NR(e, M, E);
}

double BM_D3_Basic(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	if (M < 1e-9) return E;
	return E + Classic_Halley(e, M, E);
}

double BM_D4_Basic(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	if (M < 1e-9) return E;
	return E + FLM_D4(e, M, E);
}

double BM_D380_Basic(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	if (M < 1e-9) return E;
	return E + Kepler_Halley80(e, M, E);
}

// NB the Basic2tpNN series of approximations are too approximate to avoid using refinement for small M

double BM_NR_Basic2tp54(double e, double M)
{
	double E;
	E = MTB_Basic2tp54(e, M);
//	if (M < 1e-10) return E; // too approximate to skip out
	return E + FLM_NR(e, M, E);  // code here has been made more robust (but slower to compensate)
}

double BM_D3_Basic2tp54(double e, double M)
{
	double E;
	E = MTB_Basic2tp54(e, M);
	return E + Classic_Halley(e, M, E);
}

double BM_D4_Basic2tp54(double e, double M)
{
	double E;
	E = MTB_Basic2tp54(e, M);
	return E + FLM_D4(e, M, E);
}

double BM_D3t2_Basic(double e, double M)
{
	double E;
	E = MTB_Basic(e, M);
	if (M < 1e-9) return E;
	return E + Halley_t2(e, M, E);
}

double BM_NR_Better(double e, double M)
{
	double E;
	E = MTB_Better(e, M);
	if (M < 1e-11) return E;
	return E + FLM_NR(e, M, E);
}

double BM_D3_Better(double e, double M)
{
	double E;
	E = MTB_Better(e, M);
	if (M < 1e-11) return E;
	return E + Classic_Halley(e, M, E);
}


double BM_D4_Better(double e, double M)
{
	double E;
	E = MTB_Better(e, M);
	if (M < 1e-11) return E;
	return E + FLM_D4(e, M, E);
}

double BM_NR_DLB(double e, double M)
{
	double E;
	E = DLB_SolverBG(e, M);
	if (M < 1e-9) return E;
	return E + FLM_NR(e, M, E);
}

double BM_D3_DLB(double e, double M)
{
	double E;
	E = DLB_SolverBG(e, M);
	if (M < 1e-9) return E;
	return E + Classic_Halley(e, M, E);
}

double BM_D4_DLB(double e, double M)
{
	double E;
	E = DLB_SolverBG(e, M);
	if (M < 1e-9) return E;
	return E + FLM_D4(e, M, E);
}

double BM_D5_DLB(double e, double M)
{
	double E;
	E = DLB_SolverBG(e, M);
	if (M < 1e-9) return E;
	return E + FLM_D5(e, M, E);
}

double BM_NR_Best(double e, double M)
{
	double E;
	E = MTB_Best(e, M);
	if (M < 1e-10) return E;
	return E + FLM_NR(e, M, E);
}

double BM_D3_Best(double e, double M)
{
	double E;
	E = MTB_Best(e, M);
	if (M < 1e-10) return E;
	return E + Classic_Halley(e, M, E);
}

double BM_D3t2_Best(double e, double M)
{
	double E;
	E = MTB_Best(e, M);
	if (M < 1e-10) return E;
	return E + Halley_t2(e, M, E);
}

double BM_D4_Best(double e, double M)
{
	double E;
	E = MTB_Best(e, M);
	if (M < 1e-10) return E;
	return E + FLM_D4(e, M, E);
}

double BM_NR_FLM95(double e, double M)
{
	double E;
	E = FLM_Solver(e, M);
	return E + FLM_NR(e, M, E);
}

double BM_D3_FLM95(double e, double M)
{
	double E;
	E = FLM_Solver(e, M);
	if (M < 1e-19) return E;
	return E + Classic_Halley(e, M, E);
}

double BM_D4_FLM95(double e, double M)
{
	double E;
	E = FLM_Solver(e, M);
	if (M < 1e-12) return E;
	return E + FLM_D4(e, M, E);
}

double BM_D5_FLM95(double e, double M)
{
	double E;
	E = FLM_Solver(e, M);
	if (M < 1e-12) return E;
	return E + FLM_D5(e, M, E);
}

double BM_NR_D1(double e, double M)
{
	double E;
	E = M+D1(e, M);
	return E + FLM_NR(e, M, E);
}

double BM_D3_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	return E + Classic_Halley(e, M, E);
}

double BM_D3t2_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	return E + Halley_t2(e, M, E);
}

double BM_D4_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	return E + FLM_D4(e, M, E);
}

double BM_D4t2_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	return E + FLM_D4t2(e, M, E);
}

double BM_D5t2_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	return E + FLM_D5t2(e, M, E);
}

double BM_D5_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) < 1e-9) return E;
	return E + FLM_D5(e, M, E);
}

double BM_D6_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) < 1e-10) return E;
	return E + MTB_D6(e, M, E);
}

double BM_D7_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) * e < 1e-7) return E; // there may be a better way
	return E + MTB_D7(e, M, E);
}

double BM_D8_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) < 1e-21) return E;
	if (abs(M) < 1e-5)  return E + Classic_Halley(e, M, E);
	if (abs(M) < 0.02) return E + FLM_D4(e, M, E);
	return E + MTB_D8(e, M, E);
}


double BM_D4D3_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	E = E + Classic_Halley(e, M, E);
	return E + FLM_D4(e, M, E);
	//	return E + Classic_Halley(e, M, E);
}

double BM_D4t2D3t2_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) < 1e-12) return E;
	E = E + Halley_t2(e, M, E);
	return E + FLM_D4t2(e, M, E);
}

double BM_D3t2D4t2_D1(double e, double M)
{
	double E;
	E = M + D1(e, M);
	if (abs(M) < 1e-12) return E;
	E = E + FLM_D4t2(e, M, E);
	return E + Halley_t2(e, M, E);
}
double BM_D3_S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + Classic_Halley(e, M, E);
}

double BM_D4_S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + FLM_D4(e, M, E);
}

double BM_D5_S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + FLM_D5(e, M, E);
}

double BM_NR_S9(double e, double M)
{
	double E = Gooding_S9(e, M);
	return E + FLM_NR(e, M, E);
}

double BM_D4_S3(double e, double M)
{
	double E = Gooding_S3(e, M);
	return E + FLM_D4(e, M, E);
}

double MTB_chgsgn(double x)
{
	return -x;
}

double Divide_1px(double x)
{
	return 1.0 / (1 + x);
}

double Reciprocal_1px(double x)
{
	// avoiding division but O(N) takes lg2 N + only accurate for x<0.5 !
	double x2, x4, x8, x16;
	x2 = x * x;
	x4 = x2 * x2;
	x8 = x4 * x4;
	x16 = x8 * x8;
	x2 = (1 - x) * (1 + x2) * (1 + x4) * (1 + x8) * (1 + x16) * (1 + x16 * x16); // good to x^32
	return x2;
}

double Reciprocal_1px_a(double x)
{
	// avoiding division but O(N) takes lg2 N +
	// 1 cycle shorter than original form
	double f, x2, x4, x8, x16;
	f = 1 - x;
	x2 = x * x;
	f += f * x2;
	x4 = x2 * x2;
	f += f + x4;
	x8 = x4 * x4;
	f += f + x8;
	x16 = x8 * x8;
	f += f + x16;
	f += f + x16 * x16;
	return f;
}

double Reciprocal_1px_24(double x)
{
	// avoiding division but O(N) takes lg2 N +
	// no faster than 32 bit version
	double f, x2, x3, x6, x12;
	f = 1 - x;
	x2 = x * x;
	f += x2;   // 1-x+x^2
	x3 = x * x2;
	f -= f + x3;
	x6 = x3 * x3;
	f -= f + x6;
	x12 = x6 * x6;
	f -= f + x12;
	f -= f + x12 * x12;
	return f;
}

double Zero_x(double x)
{
	return 0 - x;
}

double nop(double x)
{
	return x;   // NOP to determine loop overheads;
}


double BM_GFixup80(double e, double M)
{
	double E;
	if (M > 0.25) M = M * 0.08;
	E = Gooding_S1(e, M);
	return Gooding_Fixup80(e, M, E);

}

double BM_GFixup(double e, double M)
{
	double E;
	if (M > 0.25) M = M * 0.08;
	E = Gooding_S1(e, M);
	return Gooding_Fixup(e, M, E);

}

double BM_MFixup(double e, double M)
{
	double E;
	if (M > 0.25) M = M * 0.08;
	E = Gooding_S1(e, M);
	return MTB_Fixup(e, M, E);
}

double BM_FLMFixup(double e, double M)
{
	double E;
	if (M > 0.25) M = M * 0.08;
	E = Gooding_S1(e, M);
	return FLM_Fixup(e, M, E);
}
