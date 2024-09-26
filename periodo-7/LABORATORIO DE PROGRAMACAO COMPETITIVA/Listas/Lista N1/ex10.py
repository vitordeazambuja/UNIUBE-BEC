matriz = []

for i in range(3):
    linha = []
    for j in range(3):
        elemento = int(input(f"Elemento [{i+1}][{j+1}]: "))
        linha.append(elemento)
    matriz.append(linha)

for i in range(3):
    for j in range(3):
        if i != j:
            print(matriz[i][j], end=' ')

matriz_dobro = []
for i in range(3):
    linha2 = []
    for j in range(3):
        linha2.append(matriz[i][j] * 2)
    matriz_dobro.append(linha2)

print("\nMatriz multiplicada por 2:")
for linha in matriz_dobro:
    print(' '.join(map(str, linha)))
