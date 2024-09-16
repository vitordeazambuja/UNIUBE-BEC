/*

ABCCBA
ABCDCBA

*/

function ehPalindrome( palavra ) {

    for( var x = 0, y = palavra.length - 1; x <= y; y--, x++ ) {

        console.log( x );

        console.log( y );

        if ( palavra.charAt( x ) != palavra.charAt( y ) ) {

            return false;
        }
    }
    return true;
}

