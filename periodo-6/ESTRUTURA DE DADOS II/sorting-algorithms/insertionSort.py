def insertionSort(v):
    for i in range(1, len(v)):
        pivo = v[i]
        j = i - 1
        while j >= 0 and v[j] > pivo:
            v[j+1] = v[j]
            j = j - 1
        v[j+1] = pivo
