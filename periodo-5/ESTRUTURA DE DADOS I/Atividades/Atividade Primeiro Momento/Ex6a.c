#include <stdio.h>

struct Registro {
    char nome[50];
    char sobrenome[50];
    char dataNascimento[11];
    char CPF[12];
    char dataAdmissao[11];
    float salario;
};

typedef struct Registro registro;

int main(){
    registro empresa[50];
}