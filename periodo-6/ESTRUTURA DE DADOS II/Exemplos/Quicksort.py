def quick_sort(v, inicio=0, fim=None):
    fim = fim if fim is not None else len(v)
    if inicio < fim:
        pivo = particao(v, inicio, fim)
        quick_sort(v, inicio, pivo)
        quick_sort(v, pivo + 1, fim)
    return v

def particao(v, inicio, fim):
    # para uma versão com partição aleatória descomente as próximas três linhas:
    from random import randrange
    rand = randrange(inicio, fim)
    v[rand], v[fim - 1] = v[fim - 1], v[rand]
    
    pivo = v[fim -1]
    print(pivo)
    for i in range(inicio, fim):
        if v[i] <= pivo:
            v[i], v[inicio] = v[inicio], v[i]
            inicio += 1

    return inicio - 1

#v = [8, 5, 12, 55, 3, 7, 82, 44, 35, 25, 41, 29, 17]
from random import randint
v = []
for i in range(10):
    v.append(randint(0,100)*10)
    
print(v)
print(quick_sort(v))