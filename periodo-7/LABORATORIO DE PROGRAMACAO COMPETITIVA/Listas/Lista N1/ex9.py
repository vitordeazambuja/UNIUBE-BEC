n = int(input('Insira o numero de unidades no vetor: '))
vetor = []
if n >= 8:
    for i in range(n):
        numero = int(input(f'Insira o numero {i+1} para o vetor: '))
        vetor.append(numero)
    pesquisa = int(input('Insira o numero para pesquisar no vetor: '))
    if pesquisa in vetor:
        posicao = vetor.index(pesquisa)
        print(f'O numero existe no vetor na posicao {posicao}')
    else:
        print('O numero nao existe no vetor')
else:
    print('Tamanho invalido para o vetor')