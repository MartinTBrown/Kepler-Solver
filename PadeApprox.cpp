//  KeplerSolver - solves Kepler's equation using novel cubic algorithm
//
//  This file:
//
//    Copyright (C) 2023 Martin T. Brown 
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
//	Github sources available at https://github.com/MartinTBrown/Kepler-Solver
//	Author contact details: martink@nonad.co.uk

#include "stdafx.h"
#include "intel.h"

double PA = 60.0;
double PB = 7.0;
double PC = 3.0;

void SetPA(double a)
{
	PA = a;
}

void SetPB(double b)
{
	PB = b;
}

void SetPC(double c)
{
	PC = c;
}

double MTB_Pade32Sin(double M)
{
	return M*(20-7/3*M*M)/(20+M*M);
}

double MTB_Pade32ABCSin(double M)
{
	return M * (PA - PB * M * M) / (60 + PC * M * M);
}



double ErrorIntegralX(double x)
{
	double M, dM = 1.0 / 2048;
	double err, err2;
	int i;
	SetPB(6.8899 + x);
	SetPC(3.1101 + x);
	err2 = 0;
	M = 0;
	for (i = 0; i <= 2048; i++)
	{
		err = Pade32err(M);
		err2 += err * err;
		M += dM;
	}
	return err2;

}


double ErrorIntegralY(double x)
{
	double M, dM = 1.0 / 2048;
	double err, err2;
	int i;
	SetPB(7 + x);
	SetPC(3 + x);
	err2 = 0;
	M = 0;
	for (i = 0; i <= 2048; i++)
	{
		err = Pade32err(M);
		err2 += err * err;
		M += dM;
	}
	return err2;
}


double ErrorIntegralXY(double e, double MM)
{
	double M, dM = 1.0 / 2048;
	double err, err2, x, y;
	x = e / 8;
	y = MM/pi /50-0.01;
	int i;
	SetPB(7 - x);
	SetPC(3 + x*1.1329 + y);
	err2 = 0;
	M = 0;
	for (i = 0; i <= 2048; i++)
	{
		err = Pade32err(M);
		err2 += err * err;
		M += dM;
	}
	return 1e-7-err2;
}




double MTB_Pade52Sin(double M)
{
	return M*(1-M*M*(420-11*M*M)/(2520+60*M*M));
}

double MTB_Pade56Sin(double M)
{
	return M * (183284640 - M*M * (23819040 - 532182 * M*M)) / \
	       183284640 + M*M * (672840 + M*M * (126210 + 1331 * M*M));
}

double MTB_Pade74Sin(double M)
{
	return M*(1-M*M*(4158000-M*M*(122220-1331*M*M))/(24948000+M*M*(514080+(3990+0.084119948*M)*M*M)));
}

double MTB_Pade76Sin(double M)
{
	return M*(1-M*M*(M*M*(497610*M*M-49607712)+1918556640)/(M*M*(M*M*(18361*M*M+3177720)+277920720)+11511339840));
}


double MTB_Pade22Cos(double M)
{
	return (12-5*M*M)/(12+M*M);
}

double MTB_Pade42Cos(double M)
{
	return 1 - M*M*(60-3*M*M)/(120+4*M*M);
}

double MTB_Pade44Cos(double M)
{
	return 1 - M*M*(7560-300*M*M)/(15120+M*M*(660+M*M*13));
}

double MTB_Pade64Cos(double M)
{
	return 1 - M*M*(65520-M*M*(3780-59*M*M))/(131040+M*M*(3360+34*M*M)); // M*(1-M*M*(4158000-M*M*(122220-1331*M*M))/(24948000+M*M*(514080+3990*M*M)));
}


double MTB_Pade66Cos(double M)
{
	double M2, M4;
	M2 = M * M;
	M4 = M2 * M2;
	return 1 - M2/2 * (39251520 - M2 * 2116800 + 29484 * M4) / (39251520+M4*16632 + M2 * (1154160 + 127 * M4)); // go faster code
}

double M_Value(double e, double M)
{
	return M;
}

double MTB_Pade52Tan(double M)
{
	double M2=M*M;
	return M*(1-M2*(210-M2)/(630-255*M2));
}

double MTB_Pade76Tan(double M)
{
	double M2 = M*M;
	return M + M*M2*(51975-M2*(2520-M2*(1+M2*0.000022893)))/(155925-M2*(69930-M2*2729.99988));	
}

double MTB_Poly7Tan(double M)
{
	double M2 = M*M;
	return M + M2*(1/3 + M2*(2/15+M2*(17/315+M2*(62/2835+M2*(1382/155925+M2*21844/6081075)))));	

}


double MTB_Poly9Sin(double M)
{
	double M2 = M * M;
	return M + M * M2 * (1 / 6 - M2 * (1 / 20 - M2 * (1 / 42 - M2 / 72)));
}

double MTB_Poly11Sin(double M)
{
	double M2 = M * M;
	return M + M * M2 * (1 / 6 - M2 * (1 / 20 - M2 * (1 / 42 - M2*(1/ 72-M2/110))));
}

double MTB_Poly13Sin(double M)
{
	double M2 = M * M;
	return M + M * M2 * (1 / 6 - M2 * (1 / 20 - M2 * (1 / 42 - M2*(1/ 72-M2*(1/110-M2/156)))));
}

double MTB_Poly13SinF(double M)
{
	double M2, M4;
	M2 = M * M;
	M4 = M2 * M2;
	return M + M * (M2 * (1 / 6 + M4/840 * (1 + M4/7920)) - M4 * (1 / 20  + M4 * (1 / 3024 + M2 / 17160)));
}


double MTB_Pade32Atan(double M)
{
	double M2 = M * M;
	return M*(15-M2)/(15-6*M2);
}



double MTB_Pade32Tan(double M)
{
	double M2 = M*M;
	return M - M*M2*(35+4*M2)/(105+75*M2);
}


double MTB_Pade54Tan(double M)
{
	double M2 = M * M;
	return M*(945-M2*(105-M2)) / (945 - M2*(420-15*M2));
}


double MTB_Pade52Atan(double M)
{
	double M2 = M * M;
	return M * (105 + M2 * (40 - 4 * M2)) / (105 + 75*M2);
}


double MTB_Pade54Atan(double M)
{
	double M2 = M * M;
	return M * (945 + M2 * (735 + 64 * M2)) / (945 + M2 * (1050 + M2 * 225));
}


double MTB_Pade56Atan(double M)
{
	double M2 = M * M;
	return M*(1155+M2*(1190+231*M2))/(1155+M2*(1575+M2*(525+M2*25)));
}

double MTB_Pade74Tan(double x)
{
	double x2 = x * x;
	return x + x * x2 / 3 * (315 - 14 * x2) / (315 - x2 * (139.99999986 - 4.999997 * x2));
}

double MTB_Pade76Atan(double x)
{
	double x2, x4;
	x2 = x * x;
	x4 = x2 * x2;
	return x * (15015 + x4*5943 + x2*(19250 + 256 * x4)) / (15015 + 11025 * x4 + x2 * (24255 + 1225*x4)); // optimised for parallel execution
}

double MTB_Pade96Atan(double x)
{
	double x2, x4;
	x2 = x * x;// was 11025 for last x^6 term
	x4 = x2 * x2;
//	return x * (19.732778883 + x2 * (22.30544997 + x4 * 0.176553583) + 5.663396312 * x4) / (19.73278031 + x2 * (28.8830412 + x4) + 11.34457073*x4);
	return x * (0.9999999992 + x2 * (1.1303754276 + x4 * 0.0089472229) + 0.2870044785 * x4) / (1 + x2 * (1.4637086496 + x4 * 0.0506770959) + 0.5749098994 * x4);
	return x * (0.99999999925 + x2 * (1.1303754275 + x2 * (0.2870044786 + x2*0.00894722297))) / (1 + x2 * (1.46370864965 + +x2 * (0.57490989934 + x2 * 0.0506770959))) ;

	return x * (0.99999999925 + x2 * (1.1303754275 + x4 * 0.00894722297) + x4 * 0.280044786) / (1 + x2 * (1.46370864965 + x4 * 0.0506770959) + x4 * 0.57490989934);
	return x -x*x2/3*(75075 + 23859*x4 + x2*(90090 + 256*x4)) / (75075+72765*x4+x2*(135135+11026.3*x4)); // optimised for parallel execution

}

double Rat_tan(double x)
{
	// Remez polynomial good to 1e-8
	double x2 = x*x;
	return x * (0.99999998 - 0.958010197 * x2) / (1 - x2 * (0.42913502 - 0.00971659383 * x2));

}

double Rat_sin(double x)
{
	double x2 = x * x;
	return x - x * x2 * (2796203 / 16777216 - x2 * (0.00833282412 - 0.000195878418 * x2));
}

double Patan76(double x)
{
	if (x < 1)
		if (x >= 0)
			return MTB_Pade96Atan(x);
		else
		{
			if (x > -1)
				return pi + MTB_Pade96Atan(x);
		}
	x = 1 / x;
	return pi / 2 - MTB_Pade96Atan(x);
}

double Remez_Atan56(double x)
{
	double x2 = x * x;
	return x - x2 * x / 3.0 * (88.83410112 + x2 * 5.642737025) / (88.83410407 + x2 * (58.62007459 - x2));
}

double Patan56(double x)
{
	double x2 = x * x;
	if (x < 1)
		if (x >= 0)
			return Remez_Atan56(x);
		else
		{
			if (x > -1)
				return pi + Remez_Atan56(x);
		}
	x = 1 / x;
	return pi / 2 - Remez_Atan56(x);
};


double E_sinE_Pade(double E)
{
	double E2, E4, E6, result1, result2, result3;
	E2 = E * E;
	E4 = E2 * E2;
	result1 = E2 / 6;
	if (E < 0.01)
	{
		result2 = E4 / 120 * (1 - E2 / (42 + E2 / 72));
		return E * (result1 - result2);
		result3 = 0;
	}
	else
	{
		E6 = E2 * E4;
		if (E < 0.2)
		{
			result2 = E4 / 120 * (1 + E4 / (3024 - E4 / 17160));  // -ve terms
			result3 = E6 / 5040 * (1 + E4 / (7920 - E4 / 57120)); // +ve terms
		}
		else
		{
			result1 = result1 - E2 * E6 / 362880 * (1 - E6 / (10 * 11 * 12 * 13 * 14 * 15 + E6 / (16 * 17 * 18 * 19 * 20 * 21)));
			result2 = E4 / 120 * (1 - E6 / (42 * 72 * 110 + E6 / (156 * 210 * 272)));
			result3 = E6 / 5040 * (1 - E6 / (72 * 110 * 156 + E6 / (210 * 272 * 342)));
		}
	}
	return E * (result1 - result2 + result3);
}

double E_tanE_Pade(double E)
{
	double E2, E4, E6, result1, result2, result3;
	E2 = E * E;
	E4 = E2 * E2;
	result1 = -E2 / 6;
	if (E < 0.01)
	{
		result2 = -E4 / 15 * (2 + E2 / (21.0 / 17 - E2 * 17 * 62 / (21 * 2835)));
		return E * (result1 + result2);
	}
	else
	{
		E6 = E2 * E4;
		if (E < 0.2)
		{
			result2 = -E4 / 15 * (2 + E4 / (2835.0 / (15 * 62) - E4 * 62 * 21844 / (6081075.0 / 15 * 2835)));  // 4,8,12 terms
			result3 = E6 / 315.0 * (17 + E4 / (155925.0 / (315 * 1382) - E4 * (315 * 1382) * 929569.0 / (155925.0 * 638512875.0))); // 6,10,14 terms
		}
		else
		{
			//BUGBUG to be done still E_sinE
			result1 = result1 - E2 * E6 / 362880 * (1 - E6 / (10 * 11 * 12 * 13 * 14 * 15 + E6 / (16 * 17 * 18 * 19 * 20 * 21)));
			result2 = E4 / 120 * (1 - E6 / (42 * 72 * 110 + E6 / (156 * 210 * 272)));
			result3 = E6 / 5040 * (1 - E6 / (72 * 110 * 156 + E6 / (210 * 272 * 342)));
		}
	}
	return E * (result1 + result2 + result3);
}