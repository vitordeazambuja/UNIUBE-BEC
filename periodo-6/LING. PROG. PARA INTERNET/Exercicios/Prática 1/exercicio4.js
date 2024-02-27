for (var i = 0; i <= 200; i++) {
  var num;
  var cont;
  if (i % num == 0 && i % 1 == 0) {
    cont++;
  }
  if (cont <= 1) {
    console.log(i);
  }

  num++;
  cont = 0;
}
