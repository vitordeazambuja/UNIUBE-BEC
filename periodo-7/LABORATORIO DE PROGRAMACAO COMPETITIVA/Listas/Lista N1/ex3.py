from collections import Counter

palavra = 'LABORATORIO'
print(palavra)
palavra1 = palavra.lower()
print(palavra1)
palavra2 = palavra.capitalize()
print(palavra2)
palavra3 = list(palavra.capitalize())
print(palavra3)
palavra4 = tuple(palavra.capitalize())
print(palavra4)
frequencia = Counter(palavra.capitalize())
palavra5 = dict(frequencia)
print(palavra5)
palavra6 = set(palavra.capitalize())
print(palavra6)