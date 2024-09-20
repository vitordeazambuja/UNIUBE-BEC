def decimal_binario(numero):
    if numero < 0:
        raise ValueError("A função não suporta números negativos.")
    
    if numero == 0:
        return "0"
    
    binario = ""
    while numero > 0:
        resto = numero % 2
        binario = str(resto) + binario
        numero = numero // 2
    
    return binario

numero_decimal = 10
print(f"O número {numero_decimal} em binário é {decimal_binario(numero_decimal)}")
