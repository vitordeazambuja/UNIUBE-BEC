gastos_joao = [300,500,200,800]
gastos_pedro = [200,400,500,700]
soma_joao = sum(gastos_joao)
soma_pedro = sum(gastos_pedro)
if(soma_joao > soma_pedro):
    print("Joao gastou mais dinheiro ao longo do mes.")
elif(soma_pedro > soma_joao):
    print("Pedro gastou mais dinheiro ao longo do mes.")
elif(soma_joao == soma_pedro):
    print("Ambos gastaram o mesmo tanto ao longo do mes.")