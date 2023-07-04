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

// most of these functions the call overhead dominates and they tend not to inline 

double MTB_Pade32Sin(double M)
{
	return M*(20-7/3*M*M)/(20+M*M);
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


double MTB_Pade52Atan(double M)
{
	double M2 = M*M;
	return M - M*M2*(35+4*M2)/(105+75*M2);
}


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
