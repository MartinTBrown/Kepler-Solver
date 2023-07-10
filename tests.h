#include "KeplerSolver.h"


int const NFUNCT = 250;
int const NVER = 200;   // start of verify functions

void ShowHelp();

const char *GetName(int i);

double (*GetTest(int i))(double,double);

int GetN();

void SetN(int n);

int CheckParam(int i);

void Init(int n, double (*fun)(double,double), const char* str);

double Pow_eN(double e, double M);

void GetSummary(double& elo, double& Ml, double& ehi, double& Mh);

#ifdef M1
double TestEslice(int n, double e, double  *errlo, double *Mlo, double *errhi, double *Mhi, bool negate, bool verbose);
#else

double TestEslice(int n, double e, double  &errlo, double &Mlo, double &errhi, double &Mhi, int &nan, bool negate, bool verbose);
#endif

void FullTest( int n, bool verbose);

void ErrorSummary(bool verbose);

double MTB_Rand();

void RandomTest(int n, int64_t  repeats, bool verbose);

void RandomTestAll(int n);

void RegressionTest(bool verbose);

void TestCbrtAll(bool verbose);

void SimpleTest( int n, double e, double M, bool headings, bool verbose);

void SimpleTest2(int a, int b, double e, double M);

void Slice_e(int n, double M);

void Slice_M(int n, double e);

void SpecialTest(int n, int factor);

void QuickTest(int n, double e);

void QuickTestAll(double e);

void QuickTimeAll(double e);

void QuickTimeSolver(int n, double e);

void FullTestAll(int ifrom, int ito);

void MasterTest(int n, double e, double M, bool headings, bool verbose);

void Opt_k(int n);

void Test_E_sinE();

void TestNumerator();

void Test_Kepler_zero();

void TestDnt2All();

