lista = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

# Intervalo de 1 a 9
lista1 = lista[1:10]
print(lista1)

# Intervalo de 8 a 13
lista2 = lista[8:14]
print(lista2)

# Números pares
lista3 = [num for num in lista if num % 2 == 0]
print(lista3)

# Números ímpares
lista4 = [num for num in lista if num % 2 != 0]
print(lista4)

# Todos os múltiplos de 2, 3 e 4
lista5 = [num for num in lista if num % 2 == 0 and num % 3 == 0 and num % 4 == 0]
print(lista5)

# Lista reversa
lista6 = lista[::-1]
print(lista6)

# Razão entre a soma do intervalo de 10 a 15 pelo intervalo de 3 a 9 em float
soma1 = sum(lista[10:16])
soma2 = sum(lista[3:10])
razao = soma1/soma2
print(float(razao))