def selectionSort(v):
    for i in range(len(v)):
        menor = i
        for j in range(i+1, len(v)):
            if v[j] < v[menor]:
                menor = j
        troca = v[i]
        v[i] = v[menor]
        v[menor] = troca