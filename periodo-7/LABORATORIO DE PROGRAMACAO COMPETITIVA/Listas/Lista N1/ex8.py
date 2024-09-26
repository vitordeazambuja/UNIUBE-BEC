def detectar_spam(email):
    if email.endswith('@xyz.com'):
        print('Esse email eh spam')
    else:
        print('Esse email nao eh spam')