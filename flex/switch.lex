/********************************************************************
*			switch.lex  -  description
*			--------------------------
*	begin		: 10.06.2000
*	copyright	: (C) by 	SATCON GmbH
*					Warthestr. 21
*					14513 Teltow - Germany
*	
*	email		: 		info@satcon-de.com
*	author		: Nico Petri
*	email		: NicoPetri@{web,gmx}.de
*
********************************************************************/

/*******************************************************************
*
*	This software is not free. You must not modify		
*	or distribute this software in any way. All rights		
*	reserved by SATCON GmbH, Warthestr. 21, 14513
*	Teltow - Germany.
*
*******************************************************************/

%{
#include "../clang/header/shared_dec.h"
%}

%option noyywrap

%%
[ \t\n]+	
[^A-Za-z0-9]+	

"Group"		{
		isGroup = 1;
		return 0;
		}
"Group2D"	{
		isGroup = 0;
		return 0;
		}

[A-Za-z0-9]+	

%%
