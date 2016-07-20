/*=====================================================================
 
 GC_AVL, Reference counting garbage collector using AVL Tree
 
 (c) 2016 Ayrton Cavalieri de Almeida (AyrtonC)
 
 GC_AVL is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 GC_AVL is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with GC_AVL. If not, see <http://www.gnu.org/licenses/>.
 
 ======================================================================*/


#ifndef GC_h
#define GC_h

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#define MAXHEIGHTDIFF 1
#define MAXNUMOFCHANGES 10

/*--------------------------------------------------------------------------------------------------------
 | void* _malloc(size_t _size) -> Allocate new memory space and insert information on the Pointers Table.|
 --------------------------------------------------------------------------------------------------------*/
void* _malloc(size_t _size);

/*---------------------------------------------------------------------------------------------------------
 |void* attrib(void *ptrOrig, void *ptrDest) -> Modify a pointers value and update the Pointers Table.    |
 |  This function takes the Origin pointer value and the Destiny pointer value, checks if it's on the     |
 |      table and modify its counters. If the ptrDest is not NULL and                                     |
 |      the value is not on the table, it return NULL,                                                    |
 |      otherwise, returns the ptrDest.                                                                   |
 ---------------------------------------------------------------------------------------------------------*/
void* attrib(void *ptrOrig, void *ptrDest);

/*--------------------------------------------------------------------------------------------------------
 | void dump() -> This function prints on screen the contents of the Pointers Table, showing the address |
 |   and its counter. It prints in crescent order.                                                       |
 --------------------------------------------------------------------------------------------------------*/
void dump();

#endif /* GC_h */
