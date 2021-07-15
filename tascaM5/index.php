
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

        
?>

