#include <stdio.h>
#include <stdlib.h>

// Ex 2 - b)
int main(){
int i = 1234;
 printf (" i = %d\n", i);
 printf ("&i = %ld\n", (long int) &i);
 printf ("&i = %p\n", (void *) &i);
 return EXIT_SUCCESS;

}