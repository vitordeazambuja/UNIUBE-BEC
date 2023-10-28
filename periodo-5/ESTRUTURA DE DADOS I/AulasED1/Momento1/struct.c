#include <stdio.h>

// Declaração de struct
struct dma{
    int dia;
    int mes;
    int ano;
};

// Definindo "struct dma" para somente "data"
typedef struct dma data;

// Função para ver se a data é válida
int ehValido(data dt){
    if (dt.dia < 1 || dt.dia > 30){
        return 0;
    }
    if (dt.mes < 1 || dt.mes > 12){
        return 0;
    }
    if (dt.ano < 0){
        return 0;
    }
    return 1;
}

// Função para ver o fim do evento
data fimEvento(data dt, int dur){
    dt.dia = dt.dia + dur;
    while(dt.dia > 30){
        dt.dia = dt.dia-30;
        dt.mes = dt.mes +1;
    }
    while(dt.mes > 12){
        dt.mes = dt.mes - 12;
        dt.ano = dt.ano + 1;
    }
    return dt;
}

// Função main
int main(){
    // Declaração de variáveis
    data dt,fim;
    int duracao;
    // Entrada de dia,mês e ano
    printf("Insira dia, mês e ano:\n");
    scanf("%d %d %d",&dt.dia,&dt.mes,&dt.ano);
    // Verificação de validade
    if (!ehValido(dt)){
        printf("Data inválida!\n");
        return 0;
    }
    else{
        printf("Data OK!\n");
    }
    // Entrada de duração
    printf("Insira uma duração em dias:\n");
    scanf("%d", &duracao);
    fim = fimEvento(dt,duracao);
    printf("Data final: %d/%d/%d", fim.dia,fim.mes,fim.ano);
}