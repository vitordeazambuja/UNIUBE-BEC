function calculadora(x, y, z) {
  var resultado;
  switch (z) {
    case 1:
      resultado = x + y;
      break;
    case 2:
      resultado = x - y;
      break;
    case 3:
      resultado = x / y;
      break;
    case 4:
      resultado = x * y;
      break;
  }
  console.log(resultado);
}

calculadora(1, 2, 1);
calculadora(10, 5, 2);
calculadora(20, 10, 3);
calculadora(3, 5, 4);
