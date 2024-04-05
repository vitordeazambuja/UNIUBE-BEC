/**
 * Sequencia Fibonacci:
 * 0, 1, 1, 2, 3, 5, 8, 13, 21....
 */
function fibonacci(n) {

    if ( n <= 0 ) {

        console.info(
            'O argumento fornecido deve ser um número inteiro positivo');
        return -1;
    }
    let fib = [0, 1]; // Os primeiros dois números na sequência de Fibonacci

    for (let i = 3; i <= n; i++) {
    
        fib[i] = fib[i - 1] + fib[i - 2]; // Calcula o próximo número na sequência
    }
    return fib[ n ]; // Retorna o n-ésimo número
}