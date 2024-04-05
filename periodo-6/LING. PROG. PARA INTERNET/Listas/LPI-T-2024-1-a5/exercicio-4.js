function numeroPrimo(n) {

    var primo = true;

    if (n === 1) {
        return "Número 1 não é primo.";
    }
    else if (n < 1) {
        return "Números menores que 1 não são primos.";
    }
    else {
        for (i = 3; i <= n; ++i) {
            if (n % i == 0) {
                primo = false;
                break;
            }
        }
    }

    if (primo) {
        return n + ' é um número primo';
    }
    else {
        return n + ' não é um número primo';
    }
}
