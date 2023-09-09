#include <stdio.h>
#include <stdlib.h>

#define troca(X, Y) {int t = X; X = Y; Y = t;}

// Ex 3
//a)
int main(){
    int X = 2;
    int Y = 3;
    printf("X: %d\n", X);
    printf("Y: %d\n", Y);
    troca(X, Y);
    printf("X: %d\n", X);
    printf("Y: %d\n", Y);
    return 0;
}

//b)
// O código está errado pois tenta inicializar a variável 'temp' como ponteiro e não como 'int