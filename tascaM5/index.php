
<?php

/* Nivell 1 EXERCICI 1*/
echo "<b> Nivell 1 Exercici 1</b>";
echo "<br>";
$edat = 18;
$double = 8.75;
$nom = "Marta";
$aprovada = true;

echo $nom;
echo "<br>";
echo $edat;
echo "<br>";
echo $double;
echo "<br>";
echo $aprovada;
echo"<br>";
echo"<br>";

/*EXERCICI 2*/
echo "<b>Exercici 2</b>";
echo "<br>";
$cognom = " Garcia";
$tot = $nom.$cognom;

echo strlen($tot);
echo "<br>";
echo strrev($tot);
echo "<br>";
echo $tot;
echo"<br>";
echo"<br>";

/*EXERCICI 3*/
echo "<b>Exercici 3</b>";
echo"<br>";
define("elMeuNom", "Laura Cormand Solà");
echo elMeuNom;
echo"<br>";
echo"<br>";

/*Nivell 2 EXERCICI 1*/
echo "<b>Nivell 2 Exercici 1</b>";
echo"<br>";
$notes1 = array(8, 9, 4, 3, 8);
$notes2 = array(3, 9, 9);
echo"<br>";
echo"<br>";

/*Nivell 2 EXERCICI 2*/
echo "<b>Exercici 2</b>";
echo"<br>";
$notes2 [3] = 5;
echo"<br>";
echo"<br>";

/*Nivell 2 EXERCICI 3*/
echo "<b>Exercici 3</b>";
echo"<br>";
$array_resultant = array_merge($notes1,$notes2);
echo count($array_resultant);
echo"<br>";
echo"<br>";
/*Nivell 3 EXERCICI 1*/
echo "<b>Nivell 3 Exercici 1</b>";
echo"<br>";
echo "Les notes són les següents:  " . $array_resultant[0] . ", " . $array_resultant[1] . ", " . $array_resultant[2] . ", " . $array_resultant[3] . ", " . $array_resultant[4] . ", " . $array_resultant[5] . ", " . $array_resultant[6] . ", " . $array_resultant[7] . ", " . $array_resultant[8] . ".";
echo"<br>";
echo"<br>";
/*Nivell 3 EXERCICI 2*/
echo "<b>Exercici 2</b>";
echo"<br>";
$x = 3;
$y = 10;
$n = 5.56;
$m = 1.99;
echo ($x + $y);
echo"<br>";
echo ($x - $y);
echo"<br>";
echo ($x * $y);
echo"<br>";
echo ($x/$y);
echo"<br>";
echo ($x % $y);
echo"<br>";
echo ($x **2);
echo"<br>";
echo ($x **2);
echo"<br>";
echo ($y **2);
echo"<br>";
echo ($n **2);
echo"<br>";
echo ($m **2);
echo"<br>";
echo ($n+$m+$y+$x);
echo"<br>";
echo ($n*$m*$y*$x);

/*- Exercici 2

Escriure un programa PHP que realitzi lo següent: 

declarar dues variables X e Y de tipus int, dues variables N i M de tipous double i assigna a cada una un valor. A continuació, mostra per pantalla, per a X e Y:

El valor de cada variable
La suma 
La resta 
El producte  
La divisió 
El mòdul
per a N i M, lo mateix.

I per a totes les variables(X,Y,N,M):

El doble de cada variable
La suma de totes les variables
El producte de totes les variables*/
        
?>

