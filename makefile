OBJECTS=benchmark.o BM_shims.o BM_starter.o classic.o cuberoot.o deltas.o intel.o \
		opt_starter.o PadeApprox.o solver.o starter.o stdafx.o tests.o verify.o

KeplerSolver :  $(OBJECTS)

	echo "Start link"
	gcc  keplersolver.cpp -o KeplerSolver -O3 -Ofast $(OBJECTS)

KeplerSolver.o : Keplersolver.cpp KeplerSolver.h benchmark.h BM_shims.h BM_starter.h classic.h cuberoot.h \
		deltas.h intel.h opt_starter.h PadeApprox.h solver.h starter.h stdafx.h tests.h verify.h
	gcc -c KeplerSolver.cpp -O3 -Ofast

benchmark.o : benchmark.cpp KeplerSolver.h benchmark.h BM_shims.h classic.h cuberoot.h deltas.h intel.h \
		opt_starter.h PadeApprox.h solver.h starter.h stdafx.h tests.h verify.h
	gcc benchmark.cpp -c -O3 -Ofast


BM_shims.o : BM_shims.cpp stdafx.h KeplerSolver.h BM_shims.h cuberoot.h deltas.h intel.h \
		opt_starter.h starter.h stdafx.h 
	gcc -c BM_shims.cpp -O3 -Ofast 

BM_starter.o : BM_starter.cpp BM_starter.h stdafx.h solver.h
	gcc -c BM_starter.cpp -O3 -Ofast

classic.o : classic.cpp stdafx.h benchmark.h
	gcc -c classic.cpp -O3 -Ofast 

cuberoot.o : cuberoot.cpp stdafx.h classic.h intel.h
	gcc -c cuberoot.cpp -O3 -Ofast

deltas.o : deltas.cpp stdafx.h intel.h
	gcc -c deltas.cpp -O3 -Ofast 

intel.o : intel.cpp stdafx.h classic.h deltas.h cuberoot.h
	gcc -c intel.cpp -O3 -Ofast 

opt_starter.o : opt_starter.cpp stdafx.h classic.h deltas.h opt_starter.h 
	gcc -c opt_starter.cpp -O3 -Ofast

PadeApprox.o : PadeApprox.cpp stdafx.h
	gcc -c PadeApprox.cpp -O3 -Ofast 

solver.o : solver.cpp stdafx.h cuberoot.h
	gcc -c solver.cpp -O3 -Ofast

starter.o : starter.cpp stdafx.h solver.h
	gcc -c starter.cpp -O3 -Ofast

tests.o : tests.cpp stdafx.h benchmark.h classic.h cuberoot.h deltas.h intel.h \
		opt_starter.h PadeApprox.h solver.h starter.h  tests.h verify.h
	gcc -c tests.cpp -O3 -Ofast
verify.o : verify.cpp stdafx.h KeplerSolver.h cuberoot.h deltas.h intel.h solver.h starter.h tests.h 
	gcc -c verify.cpp -O3 -Ofast

.PHONY : clean
clean :
	rm edit $(objects)
