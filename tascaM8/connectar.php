<?php

class Connectar{
    private $servidor = "localhost";
    private $usuari = "root";
    private $bd = "php_tascam8";
    private $password = "";

    public function connexio(){
        $connexio = mysqli_connect($this->servidor,
                                    $this->usuari,
                                    $this->password,
                                    $this->bd);
        return $connexio;
    }

}
$obj = new Connectar();
if ($obj -> connexio()){
    echo "Connectat amb èxit";
}else{
    echo "Ha fallat la connexió";
}

?>