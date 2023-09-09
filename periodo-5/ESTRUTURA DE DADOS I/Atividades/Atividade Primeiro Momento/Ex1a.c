#include <stdio.h>
#include <stdlib.h>

// Ex 1 - a)
int main(){
typedef struct {
 int dia, mes, ano;
 } data;
 printf ("sizeof (data) = %d\n",
 sizeof (data));
 return EXIT_SUCCESS;
}