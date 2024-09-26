def programa1():
    numero_alunos = int(input('Insira o numero de alunos: '))
    soma_medias = 0
    for i in range(numero_alunos):
        notas = input('Digite as 3 notas do aluno separadas por um espaco: ').split()
        notas = [float(nota) for nota in notas]
        for nota in notas:
            if nota < 0 or nota > 10:
                print('Nota invalida')
                return
        media = sum(notas) / 3
        print(f'Media do aluno {i + 1}: {media:.2f}')
        soma_medias += media
    media_turma = soma_medias  / numero_alunos
    print(f'Media da turma: {media_turma}')
programa1()