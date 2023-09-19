#include <stdio.h>
#include <stdlib.h>

void troca(int *a, int *b){
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
int main(){
    int x,y;
    x=5; y=6;
    printf("x=%d y=%d\n",x,y);
    troca(&x,&y);
    printf("x=%d y=%d\n",x,y);
}