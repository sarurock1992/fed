#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <memory.h>
#include <sys/file.h>
#include <malloc.h>

using namespace std;

typedef struct{
	double r;
	double i;
}complex;

int bitr( int bit, int r );

void swap( complex *d0, complex *d1 );
