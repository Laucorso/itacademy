<?php

require_once "connectar.php";
require_once "metodes.php";

$producte = $_POST['txtproducte'];
$preu = $_POST['txtpreu'];
$quantitat = $_POST['txtquantitat'];
$dades = array(
            $producte,
            $preu,
            $quantitat);

$obj = new taula();
if($obj -> insertarDades($dades)==1){
    header ("location: index.php");
}else{
    echo "Ha fallat al inserir";
}