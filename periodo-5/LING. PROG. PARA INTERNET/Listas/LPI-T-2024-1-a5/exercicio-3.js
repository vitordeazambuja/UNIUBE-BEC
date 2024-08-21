function quantasVezes( c, palavra ) {

    let cont = 0;

    for( var x = 0; x < palavra.length; ) {

        if ( palavra.charAt( x++ ) == c ) {

            cont++;
        }
    }
    return cont;
}

