for %%1 in (*.cpp) do gcc -c -O3 -Ofast %%1
gcc -O3 keplersolver.cpp benchmark.o BM_shims.o BM_starter.o classic.o cuberoot.o deltas.o intel.o opt_starter.o PadeApprox.o solver.o starter.o stdafx.o tests.o verify.o
