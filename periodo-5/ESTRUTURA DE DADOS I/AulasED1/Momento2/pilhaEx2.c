#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct celula celula;
struct celula{
    char conteudo;
    celula *prox;
};

void push(char x, celula *pilha){
    celula *nova;
    nova = (celula*) malloc(sizeof(celula));
    nova->conteudo = x;

    nova->prox = pilha->prox;
    pilha->prox = nova;
}

char pop(celula *pilha){
    if(pilha->prox == NULL){
        printf("Nao tem elemento para retirar!");
    }
    return -1;
}

bool isEmpty(celula *pilha){
    if(pilha->prox == NULL){
        return true;
    }
    return false;
}

char peek(celula *pilha){
    if(pilha->prox == NULL){
        printf("Nao tem elemento para inspecionar");
        return -1;
    }
    return(pilha->prox)->conteudo;
}

int valida(char *exp, celula *pilha){
    int tamanho = strlen(exp);
    for(int i = 0; i<tamanho; i++){
        char car = exp[i];
        if(car == '(' || car == '[' || car == '{'){
            push(car,pilha);
        }else if(car == ')' || car == ']' || car =='}'){
            if(isEmpty(pilha)){
                return 0;
            }
            char topo = pop(pilha);
            if((car == ')' && topo != '(')|| (car == ']' && topo != '[') || (car == '}' && topo != '{')){
                return 0;
            }
        }
    }
    if(isEmpty(pilha)){
        return 1;
    }else{
        return 0;
    }
}

int main(void){
    // HEAD
    celula *pilha = NULL;
    pilha = (celula*) malloc(sizeof(celula));
    pilha->prox = NULL;

    char *expressao = NULL;
    printf("Entre a expressao:");
    gets(expressao);
    int result = valida(expressao,pilha);
    if(result == 1){
        printf("Expressao valida");
    }else{
        printf("Expressao invalida");
    }
}
