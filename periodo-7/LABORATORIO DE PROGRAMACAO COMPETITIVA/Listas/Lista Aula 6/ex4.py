import math

def gerar_matriz(n):
    matriz = []
    pares = [num for num in range(0, n*n*2, 2)]

    for i in range(n):
        linha = []
        for j in range(n):
            valor = math.sqrt(pares[i*n + j])
            linha.append(round(valor, 2))
        matriz.append(linha)

    return matriz

N = int(input("Digite o tamanho da matriz: "))

matriz = gerar_matriz(N)

print("\nMatriz Final:")
for linha in matriz:
    print(linha)
