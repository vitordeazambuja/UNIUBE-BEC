alunos = [ ("Ana", 7.5), ("Bruno", 8.0), ("Carlos", 6.5), ("Diana", 9.0), ("Eduardo", 7.0) ]
notas = [nota for nome, nota in alunos]
media = sum(notas) / len(notas)
print(f"A media das notas dos alunos e: {media}")