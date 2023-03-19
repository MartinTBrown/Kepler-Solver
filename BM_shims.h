#pragma once

// routines for benchmarking taking a single argument x


double BM_D0(double e, double M);

double BM_D1(double e, double M);

double BM_atan2(double x);

//double BM_sincos(double x);

double BM_Classic_NR(double e, double M);

double BM_FLM_NR(double e, double M);

double BM_FLM_NRNR(double e, double M);

double BM_FLM_NRNRNR(double e, double M);


double BM_FLM_NRNRNRNR(double e, double M);


double BM_FLM_NRNRt2(double e, double M);

double BM_FLM_NRt2NRt2(double e, double M);

double BM_FLM_NRt2NR(double e, double M);

double BM_MTB_NRt2(double e, double M);

double BM_FLM_NR(double e, double M);

double BM_Classic_NR80(double e, double M);

double BM_Classic_Halley(double e, double M);

double BM_Kepler_Halley80(double e, double M);

double BM_MTB_Halley(double e, double M);

double BM_Halley_t2(double e, double M);

double BM_FLM_D4(double e, double M);

double BM_FLM_D4t2(double e, double M);

double BM_FLM_D4t2M(double e, double M);

double BM_FLM_D5(double e, double M);

double BM_FLM_D5t2(double e, double M);

double BM_FLM_D5t2M(double e, double M);

double BM_D3_Best(double e, double M);

double BM_NR_D1(double e, double M);

double BM_D3_D1(double e, double M);

double BM_D3t2_D1(double e, double M);

double BM_D4_D1(double e, double M);

double BM_D5_D1(double e, double M);

double BM_D6_D1(double e, double M);

double BM_D7_D1(double e, double M);

double BM_D8_D1(double e, double M);

double BM_D4D3_D1(double e, double M);

double BM_D4t2D3t2_D1(double e, double M);

double BM_D3t2D4t2_D1(double e, double M);

double BM_D4t2_D1(double e, double M);

double BM_D5t2_D1(double e, double M);

void Set_rk(double k);

double Get_rk();

void Set_re(double e);

double Get_re();

double BM_Dn_MkE(double e, double M);

double BM_NR_OptK(double e, double M);

double BM_NRNR_OptK(double e, double M);

double BM_D3_OptK(double e, double M);

double BM_D4_OptK(double e, double M);

double BM_D5_OptK(double e, double M);

double BM_D6_OptK(double e, double M);

double BM_FLM_D4t2NRok(double e, double M);

double BM_FLM_D4t2D3ok(double e, double M);

double BM_FLM_D4t2D4ok(double e, double M);

double Eval_error_rk(double k);

double Eval_sumerror_rk(double k);

double BM_MTB_D6(double e, double M);

double BM_MTB_D6t2(double e, double M);

double BM_MTB_D7(double e, double M);

double BM_MTB_D7t2(double e, double M);

double BM_MTB_D8(double e, double M);

double BM_MTB_D8t2(double e, double M);

double BM_MTB_D4M(double e, double M);

double BM_MTB_D3M(double e, double M);

double BM_D4_D4M(double e, double M);

double BM_D4_D4t2p(double e, double M);

double BM_FLM_D4t2p(double e, double M);

double BM_D4_D54t2pM(double e, double M);

double BM_D4t2_D4t2(double e, double M);

double BM_D3_D4M(double e, double M);

double BM_MTB_D5M(double e, double M);

double BM_MTB_D6M(double e, double M);

double BM_MTB_D7M(double e, double M);

double BM_MTB_D8M(double e, double M);

double BM_D3t2S9t2(double e, double M);

double BM_D3t2S9t2p52(double e, double M);

double BM_D3S9t2(double e, double M);

double BM_D3t2S9(double e, double M);

double BM_D4t2S9(double e, double M);

double BM_D5t2S9t2(double e, double M);

double BM_NRD5t2(double e, double M);

double BM_D5t2S9(double e, double M);

double BM_NR_Basic(double e, double M);

double BM_D3_Basic(double e, double M);

double BM_D4_Basic(double e, double M);

double BM_NR_Basic2tp54(double e, double M);

double BM_D3_Basic2tp54(double e, double M);

double BM_D4_Basic2tp54(double e, double M);

double BM_D3t2_Basic(double e, double M);

double BM_NR_Better(double e, double M);

double BM_D3_Better(double e, double M);

double BM_D4_Better(double e, double M);

double BM_NR_DLB(double e, double M);

double BM_D3_DLB(double e, double M);

double BM_D4_DLB(double e, double M);

double BM_D5_DLB(double e, double M);

double FLM_Solver(double e, double M);;

double BM_NR_FLM95(double e, double M);

double BM_D3_FLM95(double e, double M);

double BM_D4_FLM95(double e, double M);

double BM_D5_FLM95(double e, double M);

double BM_NR_Best(double e, double M);

double BM_D3t2_Best(double e, double M);

double BM_D4_Best(double e, double M);

double BM_D3_S9(double e, double M);

double BM_D380_Basic(double e, double M);

double BM_D3t2_S9t2p52(double e, double M);

double BM_D3t2p_S9t2p52(double e, double M);

double BM_D3t2p54(double e, double M);

double BM_D3t2p54M(double e, double M);

double BM_D4_S9(double e, double M);

double BM_D5_S9(double e, double M);

double BM_NR_S9(double e, double M);

double BM_D4_S3(double e, double M);

double BM_GFixup(double e, double M);

double BM_GFixup80(double e, double M);

double BM_MFixup(double e, double M);

double BM_FLMFixup(double e, double M);

double MTB_chgsgn(double x);

double Divide_1px(double x);

double Reciprocal_1px(double x);

double Reciprocal_1px_a(double x);

double Reciprocal_1px_24(double x);

double Zero_x(double x);

double nop(double x);
