import time
import random
import matplotlib.pyplot as plt

def selectionSort(v):
    for i in range(len(v)):
        menor = i
        for j in range(i+1, len(v)):
            if v[j] < v[menor]:
                menor = j
        troca = v[i]
        v[i] = v[menor]
        v[menor] = troca

def measure_execution_time(array):
    start_time = time.time()
    selectionSort(array)
    end_time = time.time()
    return end_time - start_time

def plot_execution_times(sizes, times, title):
    plt.plot(sizes, times, marker='o')
    plt.title(title)
    plt.xlabel('Tamanho da Array')
    plt.ylabel('Tempo de Execução (segundos)')
    plt.grid(True)
    plt.show()

sizes = [100, 1000, 10000]
execution_times = {'Crescente': [], 'Decrescente': [], 'Aleatória': []}

for size in sizes:
    ascending_array = list(range(size))
    descending_array = list(range(size, 0, -1))
    random_array = random.sample(range(size * 10), size)

    execution_times['Crescente'].append(measure_execution_time(ascending_array))
    execution_times['Decrescente'].append(measure_execution_time(descending_array))
    execution_times['Aleatória'].append(measure_execution_time(random_array))

for order, times in execution_times.items():
    plot_execution_times(sizes, times, f'Tempo de execução para array {order}')
