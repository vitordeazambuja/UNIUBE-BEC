#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
// Tem vantagem de usar célula da cabeça
typedef struct celula celula;

struct celula{
    int conteudo;
    celula* prox;
};

// Inserção
void push(int x, celula *pilha){
    celula *nova;
    nova = (celula*) malloc (sizeof (celula));
    nova->conteudo = x;

    nova->prox = pilha->prox;
    pilha->prox = nova;
}

// Remoção
int pop(celula *pilha) {
    if(pilha->prox == NULL) {
        printf("Não tem elemento para retirar!");
        return -1;
    }

    celula *topo = pilha->prox;
    int topoConteudo = topo->conteudo;
    pilha->prox = topo->prox;
    free(topo);
    return topoConteudo;
}

// Checkar Vazio
bool isEmpty(celula *pilha){
    if(pilha->prox==NULL){
        return true;
    }
    return false;
}

// Retorna primeiro da lista
int peek(celula *pilha){
    if(pilha->prox==NULL){
        printf("Não tem elemento para inspecionar!");
        return -1;
    }
    return(pilha->prox)->conteudo;
}

int main(void) {
    celula *pilha = NULL;
    pilha = (celula*) malloc(sizeof(celula)); //head
    pilha->prox = NULL;
    push(10, pilha);
    push(20, pilha);
    push(30, pilha);
    int topo = peek(pilha);
    printf("\ntopo peek: %d", topo);
    topo = pop(pilha);
    printf("\ntopo pop: %d", topo);
    topo = pop(pilha);
    printf("\ntopo pop: %d", topo);
    topo = pop(pilha);
    printf("\ntopo pop: %d\n\n", topo);

    printf("\ncheck vazio: %s", isEmpty(pilha) ? "true":"false");
    return EXIT_SUCCESS;
}
