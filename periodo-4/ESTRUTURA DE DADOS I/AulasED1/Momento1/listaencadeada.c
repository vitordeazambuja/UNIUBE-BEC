#include <stdio.h>
#include <stdlib.h>

struct reg {
        int conteudo;
        struct reg *prox;
    };
typedef struct reg celula;

void imprime(celula* le){
    celula* p;
    for(p=le; p!= NULL; p = p->prox){
        printf("%d\n", p->conteudo);
    }
}

celula* busca (int x, celula *le){
        celula *p;
        p = le;
        while( p!= NULL && p->conteudo != x){
            p = p->prox;
        }
        return p;
    }

int main() {
    celula* le;
    celula c1,c2,c3;
    c1.conteudo = 10;
    c1.prox = &c2;
    c2.conteudo = 20;
    c2.prox = &c3;
    c3.conteudo = 30;
    c3.prox = NULL;

    le = &c1;
    celula* celulaBuscada = busca(20,le);

    if(celulaBuscada == NULL){
        printf("Nao encontrado");
    }else{
        printf("Achou: %d\n", celulaBuscada->conteudo);
    }

}
