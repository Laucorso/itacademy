<?php

class taula{
    public function mostrarDades($sql){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $result = mysqli_query($connexio, $sql);
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    public function insertarDades($dades){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "INSERT into compra (nom, preu, quantitat) 
                                values('$dades[1]', '$dades[2]', '$dades[3]')";
        return $result = mysqli_query($connexio, $sql);
    }

    public function modificarDades($dades){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "UPDATE compra set  nom = '$dades[0]',
                                    quantitat = '$dades[1]',
                                    preu = '$dades[2]'
                                    where id = '$dades[3]'"; //important pq no ens actualitzin tots els id, nomes el q volem!!
        return $result = mysqli_query($connexio,$sql);
    }

    public function eliminarDades($id){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "DELETE from compra where id = '$id'";
        return $result = mysqli_query($connexio,$sql);
    }
}
?>