// Copyright © 2020 Nico Petri, 03172 Guben, Germany
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
//  main.c
//  Created by Nico Petri on 24.08.2000.

/*********************************************************************
*
*	First the main function calls the swlex() function, which 
*	determines whether the scene is a 2D or �d scene. Then
*	yyparse() for 3D scenes or zzparse() for 2D scene will be 
*	called.
*
*********************************************************************/

#include "header/shared_dec.h"		// include some shared declarations
extern int swlex();
extern int yyparse();
extern int zzparse();

int main(argc, argv)
int argc;
char *argv[];
{
	isGroup = 55555;	// set an non boolean value
	line = 1;		// start counting line numbers at 1

	--argc;			// skip program name

	if ( argc > 0 ) {
		swin = fopen ( argv[1], "r" );
		if ( swin == NULL ) {
			printf("*** the inputfile \"%s\" does not exsist...\n", argv[1]);
			return 0;
		}
		printf("running swlex()\n");
		swlex();
	}
	else
	{
		printf("\n\t\t*** mp4parse V.0.999999 ***\n");
		printf("\t\t---------------------------\n");
		printf("This is a parser for the IM1 - Player Version  0.4.5\nUse them as follows:\n");
		printf("\n\tparser inputfile\n\n");
		printf("All right reserved by (c) SATCON GmbH 2000.\n\n");
		return 0;
	}
		
/******************* start parsing **********************************/

	switch(isGroup)
	{
	case 0:
/*		printf("*** found Group2D node ***\n\n"); */
		zzin = fopen ( argv[1], "r" );
		if (zzparse () != 0) // the zzparse returns non zero when 							something goes wrong...
		{
			fprintf(stderr, "*** a unrecoverable error has occured\n");
			fprintf(stderr, "*** bailing out...\n");
			return 0;
		}
		break;
	case 1:
/*		printf("*** found Group node ***\n\n"); */
		yyin = fopen ( argv[1], "r" );
		if (yyparse () != 0) // the yyparse returns non zero when 							something goes wrong...
		{
			fprintf(stderr, "*** a unrecoverable error has occured\n");
			fprintf(stderr, "*** bailing out...\n");
			return 0;
		}
		break;
	default:
		fprintf(stderr, "*** no top level node was found\n");
		fprintf(stderr, "*** bailing out...\n");
		break;
	}
return 0;
}
