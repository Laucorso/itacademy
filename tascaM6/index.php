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
    echo "<br>";

    echo "<b> Nivell 3 Exercici 1: </b><br>";
    for($i=1960; $i<=2016; $i++){

        echo $i . " ";
        $i++;
        $i++;
        $i++;
    }


/*
- Exercici 1

Ens han demanat un llistat de tots els anys on es van produir jocs olímpics desde 1960 inclós fins al 2016. Programa un bucle que calculi i mostri per pantalla els anys olímpics dins de l'interval esmentat.

- Exercici 2

Imagina que som a una botiga on es ven:

Xocolata: 1 euro
Xiclets: 0.50 euros
Carmels: 1.50 euros
Implementa un programa que permeti afegir càlculs a un total de compres d'aquest tipus. Per exemple, que si comprem:

2 xocolates, 1 de xiclets i 1 de carmels, tinguem un programa que permeti anar afegint els subtotals a un total, tal que així,

funció(2 xocolates) + funció(1 de xiclets) + funció(1 de carmels) = 2+0.5+1.5

Sent per tant el total, 4.

- Exercici 3

La criba d'Eratóstenes és un algoritme pensat per a trobar nombres primers dins d'un interval donat. Basats en l'informació de l'enllaç adjunt, implementa la criba d'Eratóstenes dins d'una funció, de tal forma que poguem invocar la funció per a un número concret. */


    ?>
</body>
</html>