
const int NSOLVER = 15;

void SetSolverCubeRoot(int n);

// golden ratio function minimiser finds the minimum of f(x); in the range a <= x <= d

double GoldenMin(double a, double d, double(*f)(double), int bias);

void TestGold();

double find_zero_lo(double a, double c, double f(double));
double find_zero_hi(double a, double c, double f(double));

void Test_find_zero();

double SolveCubic(double a, double b, double c);

double SolveCubicBM(double a, double b, double c);

double SolveCubicOpt(double a, double b, double c);

double SolveCubicOpt2(double a, double c);

double SolveCubicOpt3(double b, double c);

double SolveCubicOptG(double a, double b, double c, int n);

// Inline versions remain in sourcecode but must be made 
// a part of the same compilation unit as uses them inline 
//
//__forceinline double SolveCubicI(double a, double b, double c);  
//
//__forceinline double SolveCubicI_Opt(double a, double b, double c);

// end cubic solvers

// residual testing templates but double(double, double, double) function calls
// proved to have way more overheads than a simpler cbrt code as double(double)

void InitSolver();

void SetSolverCubeRoot(int n);

double MTB_BasicRR(double e, double M);