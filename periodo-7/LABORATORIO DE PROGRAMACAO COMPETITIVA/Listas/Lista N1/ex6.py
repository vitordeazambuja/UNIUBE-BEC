def programa1():
    n = int(input('Insira o numero de elementos: '))
    if (n > 2):
        sequencia = input('Insira os numeros inteiros separados por um espaco: ').split()
        sequencia = [int(numero) for numero in sequencia]
        maior = max(sequencia)
        print(f'Maior numero: {maior}')
        menor = min(sequencia)
        print(f'Menor numero: {menor}')
        soma = sum(sequencia)
        print(f'Soma total: {soma}')
        sequencia.sort()
        print(f'Sequencia crescente: {sequencia}')
        sequencia.sort(reverse=True)
        print(f'Sequencia decrescente: {sequencia}')
        segundo_maior = sequencia[1]
        print(f'Segundo maior: {segundo_maior}')
    else:
        print('Tamanho da sequencia invalido')
        return


programa1()