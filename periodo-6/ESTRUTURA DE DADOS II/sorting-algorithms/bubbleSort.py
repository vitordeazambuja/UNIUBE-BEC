import time
import random
import matplotlib.pyplot as plt

def bubbleSort(v):
    comparisons = 0
    movements = 0
    for i in range(len(v) - 1):
        for j in range(0, len(v) - 1 - i):
            comparisons += 1
            if v[j] > v[j + 1]:
                aux = v[j]
                v[j] = v[j + 1]
                v[j + 1] = aux
                movements += 1
    return comparisons, movements

def measure_execution_time(array):
    start_time = time.time()
    comparisons, movements = bubbleSort(array)
    end_time = time.time()
    return end_time - start_time, comparisons, movements

def plot_execution_times(sizes, times, title, labels):
    for i in range(len(times)):
        plt.plot(sizes, times[i], marker='o', label=labels[i])
    plt.title(title)
    plt.xlabel('Tamanho da Array')
    plt.ylabel('Tempo de Execução (segundos)')
    plt.grid(True)
    plt.legend()

sizes = [100, 1000, 10000]
execution_times = [[], [], []]
labels = ['Crescente', 'Decrescente', 'Aleatória']

for size in sizes:
    ascending_array = list(range(size))
    descending_array = list(range(size, 0, -1))
    random_array = random.sample(range(size * 10), size)

    time_asc, _, _ = measure_execution_time(ascending_array)
    time_desc, _, _ = measure_execution_time(descending_array)
    time_rand, _, _ = measure_execution_time(random_array)

    execution_times[0].append(time_asc)
    execution_times[1].append(time_desc)
    execution_times[2].append(time_rand)

plot_execution_times(sizes, execution_times, 'Tempo de execução para diferentes ordens de arrays', labels)
plt.show()
