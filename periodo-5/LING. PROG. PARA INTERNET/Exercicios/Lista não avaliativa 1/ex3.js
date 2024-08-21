function sequencia(x, y) {
    if (x > y){
        for (var i = x ; i != y -1; i--){
            console.log(i)
        }
    }else if(y > x){
        for (var i = y ; i != x -1; i--){
            console.log(i)
        }
    }else{
        console.log(x)
    }
}

sequencia(10,7)
sequencia(9,20)
sequencia(5,5)