from collections import Counter

votos = ["A", "B", "A", "C", "C", "A", "C", "C", "B", "A"]
numero = Counter(votos)
max_votos = max(numero.values())
candidatos_mais_votados = [candidato for candidato, votos in numero.items() if votos == max_votos]
print(f"Os mais votados sao: {', '.join(candidatos_mais_votados)}")