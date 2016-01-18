//
//  main.c
//  GarbageCollector
//
//  Created by Ayrton Cavalieri on 6/01/2016.
//  Copyright © 2016 AyrtonC. All rights reserved.
//

#include <stdio.h>
#include "GC_AVL.h"

int main(int argc, const char * argv[]) {
    int *v, *w, *z;
    int *vet[100];
    int i;
    w = (int*)_malloc(sizeof(int));
    v = (int*)_malloc(sizeof(int));
    z = NULL;
    for (i = 0; i < 100; i++){
        vet[i] = (int*)_malloc(sizeof(int));
    }
    *v = 10;
    *w = 20;
    printf("*v = %d, *w = %d\n", *v, *w);
    dump();
    v = (int*)attrib(v, w);
    z = (int*)attrib(z, w);
    printf("*v = %d, *w = %d, *z = %d\n", *v, *w, *z);
    dump();
    for (i = 0; i < 100; i++){
        vet[i] = (int*)attrib(vet[i], NULL);
    }
    printf("New dump:\n");
        dump();
    v = (int*)attrib(v, NULL);
    w = (int*)attrib(w, NULL);
    z = (int*)attrib(z, NULL);
    printf("Dump:\n");
    dump();
    return 0;
}
