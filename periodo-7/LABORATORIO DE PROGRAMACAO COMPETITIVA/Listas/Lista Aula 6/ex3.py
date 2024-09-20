def formatar(nome):
    nome, sobrenome = nome.split()
    sobrenome_formatado = sobrenome.upper()
    nome_formatado = nome.capitalize()
    return f"{sobrenome_formatado}, {nome_formatado}"

lista_nomes = []

while True:
    nome = input("Digite o nome e sobrenome: ")

    lista_nomes.append(formatar(nome))

    encerrar = input("Encerrar cadastro? (sim/não): ").strip().lower()
    if encerrar == 'sim':
        break

print("\nNomes:")
for nome in lista_nomes:
    print(nome)