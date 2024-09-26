valor = float(input("\nInsira o valor: "))
valor_desconto = valor * 0.9
print(f'Valor total a pagar com desconto de 10%: R$ {valor_desconto:.2f}')
valor_parcela = valor / 3
print(f'Valor total de cada parcela: R$ {valor_parcela:.2f}')
comissao_avista = valor_desconto * 0.05
print(f'Valor da comissao para venda a vista: R$ {comissao_avista:.2f}')
comissao_parcelada = valor * 0.05
print(f'Valor da comissao para venda parcelada: R$ {comissao_parcelada:.2f}')
print("\n")
