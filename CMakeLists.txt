cmake_minimum_required(VERSION 3.5)

project(Kepler-Solver LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES
  BM_shims.cpp
  KeplerSolver.cpp
  benchmark.cpp
  cuberoot.cpp
  intel.cpp
  opt_starter.cpp
  starter.cpp
  tests.cpp
  BM_starter.cpp
  PadeApprox.cpp
  classic.cpp
  deltas.cpp
  solver.cpp
  stdafx.cpp
  verify.cpp
)

set(HEADERS
  BM_shims.h
  BM_starter.h
  KeplerSolver.h
  PadeApprox.h
  benchmark.h
  classic.h
  cuberoot.h
  deltas.h
  intel.h
  opt_starter.h
  solver.h
  starter.h
  stdafx.h
  targetver.h
  tests.h
  verify.h
)

add_executable(Kepler-Solver ${SOURCES} ${HEADERS})

install(TARGETS Kepler-Solver
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

add_executable(toy TOY_ks.cpp)
