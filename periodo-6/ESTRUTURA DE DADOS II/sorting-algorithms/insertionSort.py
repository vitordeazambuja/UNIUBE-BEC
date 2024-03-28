import time
import random
import matplotlib.pyplot as plt

def insertionSort(v):
    comparisons = 0
    movements = 0
    for i in range(1, len(v)):
        pivo = v[i]
        j = i - 1
        while j >= 0 and v[j] > pivo:
            comparisons += 1
            v[j+1] = v[j]
            movements += 1
            j = j - 1
        v[j+1] = pivo
        movements += 1
    return comparisons, movements

def measure_execution_time(array):
    start_time = time.time()
    comparisons, movements = insertionSort(array)
    end_time = time.time()
    return end_time - start_time, comparisons, movements

def plot_execution_times(sizes, times, title):
    plt.plot(sizes, times, marker='o')
    plt.title(title)
    plt.xlabel('Tamanho da Array')
    plt.ylabel('Tempo de Execução (segundos)')
    plt.grid(True)
    plt.show()

sizes = [100, 1000, 10000]
execution_times = {'Crescente': [], 'Decrescente': [], 'Aleatória': []}
comparisons_data = {'Crescente': [], 'Decrescente': [], 'Aleatória': []}
movements_data = {'Crescente': [], 'Decrescente': [], 'Aleatória': []}

for size in sizes:
    ascending_array = list(range(size))
    descending_array = list(range(size, 0, -1))
    random_array = random.sample(range(size * 10), size)

    time_asc, comp_asc, mov_asc = measure_execution_time(ascending_array)
    time_desc, comp_desc, mov_desc = measure_execution_time(descending_array)
    time_rand, comp_rand, mov_rand = measure_execution_time(random_array)

    execution_times['Crescente'].append(time_asc)
    execution_times['Decrescente'].append(time_desc)
    execution_times['Aleatória'].append(time_rand)

    comparisons_data['Crescente'].append(comp_asc)
    comparisons_data['Decrescente'].append(comp_desc)
    comparisons_data['Aleatória'].append(comp_rand)

    movements_data['Crescente'].append(mov_asc)
    movements_data['Decrescente'].append(mov_desc)
    movements_data['Aleatória'].append(mov_rand)

for order, times in execution_times.items():
    plot_execution_times(sizes, times, f'Tempo de execução para array {order}')

print("Comparisons Data:", comparisons_data)
print("Movements Data:", movements_data)
