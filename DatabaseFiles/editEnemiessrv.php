<?php

require 'dbconnect.php';

$sql = "update Enemies "; 

$sql .= "set Name = '" . $_REQUEST["Name"] . "', "; 

$sql .= "AttackStyle = '" . $_REQUEST["AttackStyle"] . "', ";  

$sql .= "Weakness = '" . $_REQUEST["Weakness"] . "' ";

$sql .= "where id = '" . $_REQUEST["id"] . "';";

var_dump($sql);

if (!$result = $mysqli->multi_query($sql)) {

    echo "Error: Query error, here is why: </br>";

    echo "Errno: " . $mysqli->errno . "</br>";

    echo "Error: " . $mysqli->error . "</br>";

    exit;

}

?>

<script>

window.location = 'listEnemies.php';

</script>