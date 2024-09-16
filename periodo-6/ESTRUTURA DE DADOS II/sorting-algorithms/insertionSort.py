import time
import random
import matplotlib.pyplot as plt

def insertionSort(v):
    for i in range(1, len(v)):
        pivo = v[i]
        j = i - 1
        while j >= 0 and v[j] > pivo:
            v[j+1] = v[j]
            j = j - 1
        v[j+1] = pivo
    return v

def medir_tempo(array):
    tempo_inicial = time.time()
    ordenado = insertionSort(array)
    tempo_final = time.time()
    return tempo_final - tempo_inicial,ordenado

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
    with open(nomef, 'w') as file:
        for elemento in array:
            file.write(str(elemento) + '\n')

tamanhos = [100, 1000, 10000]
ordens = [[], [], []]
legendas = ['Crescente', 'Decrescente', 'Aleatória']

for tamanho in tamanhos:
    array_cresc = list(range(tamanho))
    array_decresc = list(range(tamanho, 0, -1))
    array_random = random.sample(range(tamanho * 10), tamanho)
    array_ordenado = []
    tempo_asc,array_ordenado = medir_tempo(array_cresc)
    criar_arquivo(f"{len(array_ordenado)}cresc", array_ordenado)
    tempo_desc,array_ordenado = medir_tempo(array_decresc)
    criar_arquivo(f"{len(array_ordenado)}decresc", array_ordenado)
    tempo_rand,array_ordenado = medir_tempo(array_random)
    criar_arquivo(f"{len(array_ordenado)}random", array_ordenado)

    ordens[0].append(tempo_asc)
    ordens[1].append(tempo_desc)
    ordens[2].append(tempo_rand)

plotar_grafico(tamanhos, ordens, 'Tempo de execução para diferentes ordens de arrays', legendas)

plt.show()
