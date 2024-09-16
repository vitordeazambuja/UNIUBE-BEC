//var resultado = 0;

function somaNumeros( num1, num2 ) {

    var resultado = num1 + num2;
}

function somaQuatroNumeros( num1, num2, num3, num4 ) {

    somaNumeros( num1, num2 );

    resultado1 = resultado;

    somaNumeros( num3, num4 );

    resultado2 = resultado;

    return resultado1 + resultado2;
}