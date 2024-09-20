notas = []

while True:
    valor = float(input("Insira os valores ou -1 para encerrar: "))
    if valor == -1:
        break
    notas.append(valor)

quantidade = len(notas)
print(f"Quantidade de valores lidos: {quantidade}")

print(f"Valores na ordem: {notas}")

notas_inversa = []
for nota in reversed(notas):
    notas_inversa.append(nota)
print(f"Valores na ordem inversa: {notas_inversa}")

soma = sum(notas)
print(f"A soma e: {soma}")
