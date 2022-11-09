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
//  node_table.c
//  Created by Nico Petri on 22.06.2000.

/*********************************************************************
*
*	This file declares the push and pop function, which is used
*	by the bison parser function. The name and the token type num-
*	ber is stored by the push_node_data(char*, int) function. And
*	the pop_node_data(char*) returns the token type number direct-
*	ly.
*
*********************************************************************/

#include <string.h>
#include "header/node_table.h"
#include "header/shared_dec.h"

/* defining the push function */
void push_node_data ( char* sym_name , int tok_num )
{
   node_data* ptr;
   int poped_number; 
   poped_number = pop_node_data( sym_name);
   
   if( poped_number != 0)
	{
		fprintf(stderr, "line %i: identifier \"%s\" already exsist\n",line ,sym_name);
	}
   
   /* take dynamic mem in size of the structure node_data */
   ptr = (node_data*) malloc ( sizeof ( node_data));

   /* take dynamic mem in size of the length of the token name */
   ptr->node_id = (char*) malloc ( strlen (sym_name) + 1);
   /* copy */	
   strcpy ( ptr->node_id , sym_name );
   ptr->token_number = tok_num;

   ptr->next_data = ( node_data* ) node_table;
   node_table = ptr;
}

/* defining the pop function */
int pop_node_data ( char* sym_name )
{
  node_data* ptr;
  /* this loop is looking for the sym_name in node_table; if id exsists returning the ptr */

	for ( ptr = node_table; ptr  != (node_data*) 0; ptr = (node_data*) ptr->next_data)
   		if ( strcmp ( ptr->node_id , sym_name ) == 0)
   			return (int) ptr->token_number;
  return 0;
}
