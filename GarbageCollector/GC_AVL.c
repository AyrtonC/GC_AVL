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

#include "GC_AVL.h"

struct ptrTree{
    void *ptrID;
    unsigned long count;
    struct ptrTree *left;
    struct ptrTree *right;
};

struct ptrTree *ptrsTable = NULL;
unsigned int changes;

struct ptrTree* insertNode(struct ptrTree *tree, void *ID, unsigned long cnt)
{
    if (tree != NULL){
        if ((size_t)ID < (size_t)tree->ptrID){
            tree->left = insertNode(tree->left, ID, cnt);
        }else{
            tree->right = insertNode(tree->right, ID, cnt);
        }
    }else{
        tree = (struct ptrTree*)malloc(sizeof(struct ptrTree));
        if (tree != NULL){
            tree->ptrID = ID;
            tree->count = cnt;
            tree->left = NULL;
            tree->right = NULL;
        }
    }
    return tree;
}

struct ptrTree* removeNode(struct ptrTree *tree, void *ID)
{
    struct ptrTree *aux;
    if (tree != NULL){
        if ((size_t)ID < (size_t)tree->ptrID){
            tree->left = removeNode(tree->left, ID);
        }else if((size_t)ID > (size_t)tree->ptrID){
            tree->right = removeNode(tree->right, ID);
        }else{
            if (tree->left == NULL && tree->right == NULL){
                tree->count = 0;
                tree->ptrID = NULL;
                free(tree);
                return NULL;
            }else if (tree->left == NULL || tree->right == NULL){
                if (tree->left == NULL){
                    aux = tree->right;
                }else{
                    aux = tree->left;
                }
                tree->count = 0;
                tree->ptrID = NULL;
                free(tree);
                return aux;
            }else{
                aux = tree->left;
                while (aux->right != NULL){
                    aux = aux->right;
                }
                tree->ptrID = aux->ptrID;
                tree->count = aux->count;
                tree->left = removeNode(tree->left, aux->ptrID);
            }
        }
    }
    return tree;
}

long height(struct ptrTree *tree)
{
    long hl, hr;
    if (tree == NULL){
        return 0;
    }else{
        hl = height(tree->left);
        hr = height(tree->right);
        return hl >= hr ? 1 + hl: 1 + hr;
    }
}

struct ptrTree* balancePtrTree(struct ptrTree *tree)
{
    long hl;
    long hr;
    unsigned long count1;
    unsigned long count2;
    struct ptrTree *p;
    void *auxp1;
    void *auxp2;
    if (tree != NULL){
        tree->left = balancePtrTree(tree->left);
        tree->right = balancePtrTree(tree->right);
        hl = height(tree->left);
        hr = height(tree->right);
        if (hl - hr > MAXHEIGHTDIFF){
            p = tree->left;
            while (p->right != NULL){
                p = p->right;
            }
            auxp1 = tree->ptrID;
            count1 = tree->count;
            auxp2 = p->ptrID;
            count2 = p->count;
            tree->left = removeNode(tree->left, auxp2);
            tree->right = insertNode(tree->right, auxp1, count1);
            tree->ptrID = auxp2;
            tree->count = count2;
            tree = balancePtrTree(tree);
        }else if (hr - hl > MAXHEIGHTDIFF){
            p = tree->right;
            while (p->left != NULL){
                p = p->left;
            }
            auxp1 = tree->ptrID;
            count1 = tree->count;
            auxp2 = p->ptrID;
            count2 = p->count;
            tree->right = removeNode(tree->right, auxp2);
            tree->left = insertNode(tree->left, auxp1, count1);
            tree->ptrID = auxp2;
            tree->count = count2;
            tree = balancePtrTree(tree);
        }
    }
    return tree;
}

struct ptrTree* retrievePtrTree(void *ID)
{
    struct ptrTree *p;
    p = ptrsTable;
    while (p != NULL){
        if ((size_t)ID < (size_t)p->ptrID){
            p = p->left;
        }else if ((size_t)ID > (size_t)p->ptrID){
            p = p->right;
        }else{
            break;
        }
    }
    return p;
}

void* _malloc(size_t _size)
{
    void *temp;
    temp = malloc(_size);
    if (temp != NULL){
        if (ptrsTable == NULL){
            changes = 1;
        }else{
            changes++;
        }
        ptrsTable = insertNode(ptrsTable, temp, 1);
        if (changes % MAXNUMOFCHANGES == 0){
            ptrsTable = balancePtrTree(ptrsTable);
        }
    }
    return temp;
}

void* attrib(void *ptrOrig, void *ptrDest)
{
    struct ptrTree *look;
    if (ptrDest != NULL){
        look = retrievePtrTree(ptrDest);
        if (look != NULL){
            look->count++;
        }else{
            ptrDest = NULL;
        }
    }
    if (ptrOrig != NULL){
        look = retrievePtrTree(ptrOrig);
        if (look != NULL){
            look->count--;
            if (look->count == 0){
                free(ptrOrig);
                ptrsTable = removeNode(ptrsTable, ptrOrig);
                changes++;
            }
            if (changes % MAXNUMOFCHANGES == 0){
                ptrsTable = balancePtrTree(ptrsTable);
            }
        }
    }
    return ptrDest;
}

void printT(struct ptrTree *tree)
{
    if (tree != NULL){
        printT(tree->left);
        printf("Node info.: &->%p, counter: %lu\n", tree->ptrID, tree->count);
        printT(tree->right);
    }
}

void dump()
{
    printT(ptrsTable);
}
