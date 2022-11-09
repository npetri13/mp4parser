// Copyright © 2022 Nico Petri, 03172 Guben, Germany
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files
// (the “Software”), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
//  shared_dec.h
//  Created by Nico Petri on 28.07.2000.

/*********************************************************************
*	
*	This file is included by all c-files. It contains some decla-
*	rations for the interaction between the functions. Look out
*	for the comments to get more detailed informations.
*
*********************************************************************/

#include <stdio.h>

#ifndef _SHARED_DEC_H
#define	_SHARED_DEC_H

int line;		// contains the current line number; used by
			// warning print.

int poped_number;	// variable for temporaly storing of the token number
			// returned by pop_node_data(char)

extern char* yytext;	// this declaration allows the using inside the group.y 				// file

extern char* zztext;	// this declaration allows the using inside the 					// group2d.y file

extern FILE *yyin; 	// input for parsing "Group"
extern FILE *zzin;	// input for parsing "Group2D"

/******************* switch *****************************************/

int isGroup;		// cheking type of top level node

extern FILE *swin;	// input for the switching

#endif	// _SHARED_DEC_H
