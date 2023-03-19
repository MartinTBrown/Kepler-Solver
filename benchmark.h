void QuickTimeAll(double e);

//double _vectorcall  v_atan2(double x, double y);
//double _vectorcall  v_pow(double x, double y);

// exports two functions double(double, double) to keplersolver
// otherwise _vector linkage fails because of _cdecl math intrinsics

void Set_rk(double k);

double Get_rk();

void Set_re(double e);

double Get_re();

int TimeFun(int i, double e);

// routine for benchmarking taking a single argument x

double QuickTime(double (*func)(double), const char *name);

// benchmark function n from the master list of starters

int QuickTimeFun(int n, double e, bool verbose=true);

void BenchmarkMathlib();

void BenchmarkAll();

