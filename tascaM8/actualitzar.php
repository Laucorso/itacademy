<?php
    require_once "connectar.php";
    require_once "metodes.php";

    $producte = $_POST['txtproducte'];
    $preu = $_POST['txtpreu'];
    $quantitat = $_POST['txtquantitat'];
    $id = $_POST['id'];
    $dades = array(
                $producte,
                $preu,
                $quantitat,
                $id);

    $obj = new taula();
    if ($obj-> modificarDades($dades) == 1){
        header("location: index.php");
    }else{
        echo "Ha fallat a l'actualitzar les dades";
    }