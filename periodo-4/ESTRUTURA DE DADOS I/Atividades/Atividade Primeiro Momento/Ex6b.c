#include <stdio.h>

typedef struct{
    int p;
    int q;
} racional;

racional reduz(int a, int b){
    racional r;
    r.p = a;
    r.q = b;
    return r;
}

racional neg(racional x){
    racional rneg;
    rneg.p = -x.p;
    rneg.q = x.q;
    return rneg;
}

racional soma(racional x, racional y){
    racional rsoma;
    x.p *= (x.q * y.q)/x.q;
    y.p *= (x.q * y.q)/y.q;
    rsoma.p = x.p + y.p;
    rsoma.q = x.q * y.q;
    return rsoma;
}

racional produ(racional x, racional y){
    racional rprodu;
    rprodu.p = x.p * y.p;
    rprodu.q = x.q * y.q;
    return rprodu;
}

racional quoci(racional x, racional y){
    racional rquoci;
    int temp = y.p;
    y.p = y.q;
    y.q = temp;
    rquoci.p = x.p * y.p;
    rquoci.q = x.q * y.q;
    return rquoci;
}

int main(){

}