<?php

class taula{
    public function mostrarDades($sql){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $result = mysqli_query($connexio, $sql);
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
        mysqli_close($connexio);
    }

    public function insertarDades($dades){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "INSERT into compra (nom, preu, quantitat) 
                                values('$dades[0]', '$dades[1]', '$dades[2]')";
        return $result = mysqli_query($connexio, $sql);
        mysqli_close($connexio);
    }

    public function modificarDades($dades){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "UPDATE compra set  nom = '$dades[0]',
                                    preu = '$dades[1]',
                                    quantitat = '$dades[2]'
                                    where id = '$dades[3]'"; //important pq no ens actualitzin tots els id, nomes el q volem!!
        return $result = mysqli_query($connexio,$sql);
        mysqli_close($connexio);
    }

    public function eliminarDades($id){
        $c = new Connectar();
        $connexio = $c -> connexio();
        $sql = "DELETE from compra where id = '$id'";
        return $result = mysqli_query($connexio,$sql);
        mysqli_close($connexio);
    }
}
?>