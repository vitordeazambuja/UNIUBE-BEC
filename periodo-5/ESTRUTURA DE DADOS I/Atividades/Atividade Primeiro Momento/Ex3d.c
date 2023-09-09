#include <stdio.h>

void mm(int v[], int n, int *min, int *max) {
    *min = v[0];
    *max = v[0];
    for (int i = 1; i < n; i++) {
        if (v[i] < *min) {
            *min = v[i];
        }
        if (v[i] > *max) {
            *max = v[i];
        }
    }
}

int main() {
    int vetor[] = {3, 7, 1, 9, 4, 6, 8, 2, 5};
    int tamanho = sizeof(vetor) / sizeof(vetor[0]);
    int minimo, maximo;

    mm(vetor, tamanho, &minimo, &maximo);

    printf("Mínimo: %d\n", minimo);
    printf("Máximo: %d\n", maximo);

    return 0;
}