cmake_minimum_required(VERSION 3.5)

project(Kepler-Solver LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(Kepler-Solver
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
  verify.cpp)

install(TARGETS Kepler-Solver
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
