#include<stdio.h>
#include<stdlib.h>

typedef struct dma data;

struct dma {
	int dia, mes, ano;
};

int ehValida(data dt) {
	
	if(dt.dia < 1 || dt.dia > 30) {
		return 0;
	}
	if(dt.mes < 1 || dt.mes > 12) {
		return 0;
	}
	if(dt.ano < 0) {
		return 0;
	}
	return 1;
}

data fimEvento(data dt, int dur) {
	
	dt.dia = dt.dia + dur;
	while(dt.dia > 30) {
		dt.dia = dt.dia - 30;
		dt.mes = dt.mes + 1;
	}
	while(dt.mes > 12) {
		dt.mes = dt.mes - 12;
		dt.ano = dt.ano + 1;
	}
	return dt;
}

int main(){
	
	data inicio, fim;
	int duracao;
	
	printf("Entre uma data: ");
	
	scanf("%d %d %d", &inicio.dia, &inicio.mes, &inicio.ano);
	
	int dataInvalida = !ehValida(inicio);
	
	if(dataInvalida) {
		printf("Data invalida!");
		return 0;
	}
	
	printf("Entre a duracao (dias): ");
	scanf("%d", &duracao);
	
	fim = fimEvento(inicio, duracao);
	
	printf("Data Final: %d %d %d\n\n", fim.dia, fim.mes, fim.ano);
		
	return 1;
	
}
