function vaiCorinthians( frase ) {

    var palavras = frase.split( ' ' );

    console.info( palavras );

    for( var i = palavras.length-1; i >= 0; i-- ) {
        
        console.info( palavras[ i ] );
    }
}