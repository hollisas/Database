<?php

require 'dbconnect.php';

$sql = "update NPC "; 

$sql .= "set Name = '" . $_REQUEST["Name"] . "', "; 

$sql .= "Location = '" . $_REQUEST["Location"] . "', "; 

$sql .= "WeaponChoice = '" . $_REQUEST["WeaponChoice"] . "', "; 

$sql .= "Merchant = '" . $_REQUEST["Merchant"] . "', ";

$sql .= "Hostile = '" . $_REQUEST["Hostile"] . "'";

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

window.location = 'listNPC.php';

</script>