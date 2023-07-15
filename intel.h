//#include "KeplerSolver.h"

double E_sinE(double E);

double tan87(double x);

double atan87(double x);

double sin87(double x);

double cos87(double x);

double Pade32err(double x);

double sincos87(double x);

double ASM_log2x(double x);

double ASM_2x(double x);

double Gooding_Fixup(double e, double M, double E);

double MTB_Fixup(double e, double M, double E);

double FLM_Fixup(double e, double M, double E);

double E_sinE80(double E);

double Kepler_f80(double e, double M, double E);

double Kepler_NR80(double e, double M, double E);

double Kepler_Halley80(double e, double M, double E);

double Gooding_Fixup80(double e, double M, double E);

double Verify_s2c2_87(double e, double M);

double Verify_sin_sin87(double e, double M);

double Verify_sincos_sin87(double e, double M);

double Verify_sincos_cos87(double e, double M);

double Verify_cos_cos87(double e, double M);

double Verify_tan_tan87(double e, double M);

double Verify_atan_atan87(double e, double M);

void FPU80_on();

void FPU80_off();

void rdtsc64(int64_t &t) ;
/*
#else

#ifndef M1
	int64_t rdtsc64(int64_t &t);
#endif

#endif
*/
void Test80bit(double e, double M, double E, bool verbose);
