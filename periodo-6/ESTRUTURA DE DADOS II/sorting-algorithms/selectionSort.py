import time
import random
import matplotlib.pyplot as plt

def selectionSort(v):
    comparacoes = 0
    movimentos = 0
    for i in range(len(v)):
        menor = i
        for j in range(i+1, len(v)):
            comparacoes += 1
            if v[j] < v[menor]:
                menor = j
        if menor != i:
            movimentos += 1
            troca = v[i]
            v[i] = v[menor]
            v[menor] = troca
    return comparacoes, movimentos

def medir_tempo(array):
    tempo_inicial = time.time()
    comparacoes, movimentos = selectionSort(array)
    tempo_final = time.time()
    return tempo_final - tempo_inicial, comparacoes, movimentos

def plotar_grafico(tamanhos, ordens, titulo, legendas):
    for i in range(len(ordens)):
        plt.plot(tamanhos, ordens[i], marker='o', label=legendas[i])
    plt.title(titulo)
    plt.xlabel('Tamanho da Array')
    plt.ylabel('Tempo de Execução (segundos)')
    plt.grid(True)
    plt.legend()

tamanhos = [100, 1000, 10000]
ordens = [[], [], []]
legendas = ['Crescente', 'Decrescente', 'Aleatória']

for tamanho in tamanhos:
    array_cresc = list(range(tamanho))
    array_decresc = list(range(tamanho, 0, -1))
    array_random = random.sample(range(tamanho * 10), tamanho)

    tempo_asc, _, _ = medir_tempo(array_cresc)
    tempo_desc, _, _ = medir_tempo(array_decresc)
    tempo_rand, _, _ = medir_tempo(array_random)

    ordens[0].append(tempo_asc)
    ordens[1].append(tempo_desc)
    ordens[2].append(tempo_rand)

plotar_grafico(tamanhos, ordens, 'Tempo de execução para diferentes ordens de arrays', legendas)

plt.show()
