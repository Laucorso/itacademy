<?php

    require_once "connectar.php";
    require_once "metodes.php";
    
?>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
<body>
    <form action = "insertar.php" method ="post">
        <label>Producte</label>
        <p></p>
        <input type = "text" name = "txtproducte">
        <p></p>
        <label>Preu</label>
        <p></p>
        <input type = "number" step = "any" name = "txtpreu">
        <p></p>
        <label>Quantitat</label>
        <p></p>
        <input type = "number" name = "txtquantitat">
        <p></p>
        <button>Agregar Producte</button>
    </form>
    <br><br>

<table style = "border-collapse: collapse;" border = "1">
    <tr>
        <td>Producte</td>
        <td>Preu</td>
        <td>Quantitat</td>
        <td>Total</td>
    </tr>

<?php
    $obj = new taula();
    $sql = "SELECT id,nom,preu,quantitat from compra";
    $dades = $obj ->mostrarDades($sql);
    $total = 0;
    foreach($dades as $key){
?>
    <tr>
        <td><?php echo $key['nom'];?></td>
        <td><?php echo $key['preu'];?></td>
        <td><?php echo $key['quantitat'];?></td>
        <td><?php echo $key['preu']*$key['quantitat'];?></td>
        <td><a href = "modificar.php?id=<?php echo $key['id']?>">Modificar</a></td>
        <td><a href = "eliminar.php?id=<?php echo $key['id']?>">Eliminar</a></td>
    </tr>
    <?php $total = $total + ( $key['preu'] * $key['quantitat']); ?>
    
<?php
//acumulem el total per cada nova iteracio
}
?>
</table>
    <tr>
        <td>
            Resultat sumatori del total: <?php echo $total;?>
        </td>
    </tr>
</body>
</html>