#pragma once

double MTB_Reference(double e, double M);

double MTB_Polish(double e, double M);

double MTB_BasicI(double e_in, double M);

double D3T_Basic2t(double e, double M);

double MTB_Basic2tp52(double e, double M);

double MTB_Basic2tp10(double e, double M);

double MTB_Basic2tp30(double e, double M);

double MTB_Basic2tp50a(double e, double M);

double MTB_Basic2tp70(double e, double M);

double MTB_Basic2tp32(double e, double M);

double MTB_Basic2tp32b(double e, double M);


double MTB_Basic2tp32x(double e, double M);

double MTB_Basic2tp52y(double e, double M);

double D4T_Basic2tp52(double e, double M);

double MTB_Basic2tp54(double e, double M);

double MTB_Basic2tp56(double e, double M);


double MTB_BasicOpt(double e, double M);

double MTB_BasicOpt_t2(double e, double M);

double MTB_BasicOpt_t2p(double e, double M);

double MTB_BasicF32(double ed, double Md);

double MTB_BetterOpt(double e, double M);

double MTB_BestI(double e_in, double M);

double MTB_Best2tp54Opt(double e, double M);


__forceinline double SolveCubicInline(double a, double b, double c);

__forceinline double SolveCubicInline_Opt(double a, double b, double c);

__forceinline double D3TI(double e, double M, double E, double t);

__forceinline double FLM_D4TI(double e, double M, double E, double t);
