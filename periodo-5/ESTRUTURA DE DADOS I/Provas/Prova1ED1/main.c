#include <stdio.h>
#include <stdlib.h>

typedef struct celula celula;

struct celula{
    int valor;
    celula *proximo;
};

void imprimeImpares(celula *p){
    printf("Numeros Impares:\n");
    for (p; p!= NULL; p = p->proximo){
        if(p->valor % 2 != 0){
            printf("%d\n", p->valor);
        }
    }
}

int numeroCelulasNegativas(celula *p){
    int contador = 0;
    for (p; p!=NULL; p = p->proximo){
        if (p->valor < 0){
            contador = contador + 1;
        }
    }
    return contador;
}

int main(void) {
    celula *le;
    celula le1, le2, le3, le4, le5;
    le = &le1;
    le1.valor = 1;
    le1.proximo = &le2;
    le2.valor = -2;
    le2.proximo = &le3;
    le3.valor = 3;
    le3.proximo = &le4;
    le4.valor = -4;
    le4.proximo = &le5;
    le5.valor = 5;
    le5.proximo = NULL;
    imprimeImpares(le);
    printf("Numero de Celulas Negativas: %d\n", numeroCelulasNegativas(le));
    return EXIT_SUCCESS;
}
