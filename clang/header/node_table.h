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
//  node_table.h
//  Created by Nico Petri on 26.06.2000.

/*********************************************************************
*
*	This file is included by node_table.c. Look out for comments
*	to get more detailed information.
*
*********************************************************************/

#include<stdlib.h>

#ifndef _NODE_TABLE_H
#define	_NODE_TABLE_H

/* declaring the structure */
struct node_data
  {
  	char* node_id;		// the node name identifier
  	int token_number;	// the token number of the node; given by bison
  	
	struct node_data *next_data;	// pointer to the next chain member
  };

typedef struct node_data node_data;

/* declaring the pointer which has the node_table */

  node_data* node_table;

/* declaring the push function */
void push_node_data ( char* , int );

/* declaring the pop function */
int pop_node_data ( char* );

#endif	// _NODE_TABLE_H
