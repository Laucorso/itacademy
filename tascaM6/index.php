<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

    /*exercici 1*/ 
    function resta ($x, $y){
        return $x-$y;
    }
    echo "<b> Exercici 1: </b><br>";
    echo resta (10,9);
    echo "<br>";
    
    /*exercici 2*/
    $num = 15;
    if ($num%2==0){
        echo "<b> Exercici 2: </b><br>";
        echo "el $num és parell";
    }else{
        echo "<b> Exercici 2: </b><br>";
        echo "el $num és imparell";
    }
    echo "<br>";

    /*exercici 3 */
    function parell_o_imparell($num){
        if ($num%2==0){
            echo "<b> Exercici 3: </b><br>";
            echo "el $num és parell";
        }else{
            echo "<b> Exercici 3: </b><br>";
            echo "el $num és imparell";
        }
    }
    parell_o_imparell($num);
    echo "<br>";

    /*exercici 4*/
    echo "<b> Exercici 4: </b><br>";
    for($i = 0; $i<=10;$i++){
        echo $i . " ";
    }
    echo "<br>";

    /* Nivell 2 - Exercici 1*/

    echo "<b> Nivell 2 Exercici 1: </b><br>";
    function amagatall(){
        for($i = 0; $i<=10; $i++){
            echo $i;
            $i++;
        }
    }
    amagatall();
    echo "<br>";

    echo "<b> Nivell 2 Exercici 2: </b><br>";
    $na = mt_rand(1,100);
    function comptar($na){
        for($i= 0; $i<=$na; $i++)
        echo $i . " ";
    }
    comptar($na);
    echo "<br>";

    echo "<b> Nivell 2 Exercici 3: </b><br>";
    $numero = 10;
    function amagatall2($numero){
        for($i=0; $i<=$numero; $i++){
            echo $i . " ";
        }
    }
    amagatall2($numero);

/*
- Exercici 3
Per a prevenir oblits al utilitzar la nostra meravellosa funció "amagatall" 
establirem un paràmetre per defecte a 10 en la funció que s'encarrega de fer aquest compte. */


    ?>
</body>
</html>