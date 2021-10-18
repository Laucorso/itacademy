<?php


    require_once "connectar.php";
    require_once "metodes.php";

$id =$_GET['id']; //AGAFEM ID DE LA URL SEGONS EL PRODUCTE QUE HAGUEM CLICKAT

$obj = new taula();
    if($obj -> eliminarDades($id)==1){
        header ("location: index.php");
    }else{
        echo "Ha fallat a l'eliminar";
    }

?>