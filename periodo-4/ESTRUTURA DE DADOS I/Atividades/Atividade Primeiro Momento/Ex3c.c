#include <stdio.h>
#include <stdlib.h>

//c)
void hm(int mnts, int *h, int *m){
    *h = mnts/60;
    *m = mnts % 60;
}

int main(){
    int min = 125;
    int horas;
    int minSobra;

    hm(min, &horas, &minSobra);

    printf("%d minutos são %d horas e %d minutos", min, horas, minSobra);

    return 0;
}