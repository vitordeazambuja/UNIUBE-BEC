def verifica_simples(expressao):
    return verifica_balanceamento(expressao, '()', '[', ']', '{}', '{', '}')

def verifica_composta(expressao):
    return verifica_balanceamento(expressao, '()', '[', ']', '{}', '{', '}')

def verifica_balanceamento(expressao, abre_paren, abre_colchete, abre_chave, fecha_paren, fecha_colchete, fecha_chave):
    pilha = []
    mapa = {abre_paren: fecha_paren, abre_colchete: fecha_colchete, abre_chave: fecha_chave}
    
    for char in expressao:
        if char in mapa.keys():
            pilha.append(char)
        elif char in mapa.values():
            if not pilha or mapa[pilha.pop()] != char:
                return False
                
    return len(pilha) == 0