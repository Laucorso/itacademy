<?php

    require_once "connectar.php";
    $obj = new Connectar();
    $connexio = $obj->connexio();
    $id = $_GET['id'];
    $sql = "SELECT nom, quantitat, preu
            from compra where id ='$id'";
    $result = mysqli_query($connexio,$sql);
    $veure = mysqli_fetch_row($result);

?>


<!DOCTYPE html>
<head></head>

<body>
<form action = "actualitzar.php" method ="post">
        <input type = "text" hidden ="" value ="<?php echo $id ?>" name ="id">
        <label>Producte</label>
        <p></p>
        <input type = "text" name = "txtproducte" value = "<?php echo $veure[0]?>">
        <p></p>
        <label>Preu</label>
        <p></p>
        <input type = "number" step = "any" name = "txtpreu" value = "<?php echo $veure[1]?>">
        <p></p>
        <label>Quantitat</label>
        <p></p>
        <input type = "number" name = "txtquantitat" value = "<?php echo $veure[2]?>">
        <p></p>
        <button>Acceptar modificacions</button>
    </form>
</body>

</html>
