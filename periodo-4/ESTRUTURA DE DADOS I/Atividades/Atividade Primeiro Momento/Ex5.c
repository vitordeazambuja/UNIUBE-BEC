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

// Função do número de dias entre datas
int numeroDiasEntreDatas(data dt1, data dt2) {
    if (!ehValido(dt1) || !ehValido(dt2)) {
        printf("Uma das datas inseridas é inválida!\n");
        return -1;
    }
    int dias1 = dt1.dia;
    for (int i = 1; i < dt1.mes; i++) {
        switch (i) {
            case 4:
            case 6:
            case 9:
            case 11:
                dias1 += 30;
                break;
            case 2:
                dias1 += 28;
                break;
            default:
                dias1 += 31;
        }
    }
    int dias2 = dt2.dia;
    for (int i = 1; i < dt2.mes; i++) {
        switch (i) {
            case 4:
            case 6:
            case 9:
            case 11:
                dias2 += 30;
                break;
            case 2:
                dias2 += 28;
                break;
            default:
                dias2 += 31;
        }
    }
    dias1 += dt1.ano * 365;
    dias2 += dt2.ano * 365;
    int diferenca = dias2 - dias1;
    return diferenca;
}

// Struct hm
struct hm {
    int horas, minutos;
};
struct hm minParaHorasEMin(int minutos) {
    struct hm resultado;

    resultado.horas = minutos / 60;
    resultado.minutos = minutos % 60;

    return resultado;
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