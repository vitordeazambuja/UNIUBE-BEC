import time
import random
import matplotlib.pyplot as plt

def bubbleSort(v):
    comparacoes = 0
    movimentos = 0
    for i in range(len(v) - 1):
        for j in range(0, len(v) - 1 - i):
            comparacoes += 1
            if v[j] > v[j + 1]:
                aux = v[j]
                v[j] = v[j + 1]
                v[j + 1] = aux
                movimentos += 1
    return comparacoes, movimentos, v


def medir_tempo(array):
    tempo_inicial = time.time()
    comparacoes, movimentos, ordenado = bubbleSort(array)
    tempo_final = time.time()
    return tempo_final - tempo_inicial, comparacoes, movimentos, ordenado

def plotar_grafico(tamanhos, ordens, titulo, legendas):
    for i in range(len(ordens)):
        plt.plot(tamanhos, ordens[i], marker='o', label=legendas[i])
    plt.title(titulo)
    plt.xlabel('Tamanho da Array')
    plt.ylabel('Tempo de Execução (segundos)')
    plt.grid(True)
    plt.legend()

def criar_arquivo(nome, array):
    nomef = f"{nome}.txt"
    with open(nomef,'w') as file:
        file.write(', '.join(map(str,array)))

tamanhos = [100, 1000, 10000]
ordens = [[], [], []]
legendas = ['Crescente', 'Decrescente', 'Aleatória']

for tamanho in tamanhos:
    array_cresc = list(range(tamanho))
    array_decresc = list(range(tamanho, 0, -1))
    array_random = random.sample(range(tamanho * 10), tamanho)
    array_ordenado = []
    tempo_asc, _, _, array_ordenado = medir_tempo(array_cresc)
    criar_arquivo(f"{len(array_ordenado)}cresc", array_ordenado)
    tempo_desc, _, _, array_ordenado = medir_tempo(array_decresc)
    criar_arquivo(f"{len(array_ordenado)}decresc", array_ordenado)
    tempo_rand, _, _, array_ordenado = medir_tempo(array_random)
    criar_arquivo(f"{len(array_ordenado)}random", array_ordenado)

    ordens[0].append(tempo_asc)
    ordens[1].append(tempo_desc)
    ordens[2].append(tempo_rand)

plotar_grafico(tamanhos, ordens, 'Tempo de execução para diferentes ordens de arrays', legendas)

plt.show()