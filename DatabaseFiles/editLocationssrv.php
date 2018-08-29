<?php

require 'dbconnect.php';

$sql = "update Locations "; 

$sql .= "set Location = '" . $_REQUEST["Location"] . "', "; 

$sql .= "hasBoss = '" . $_REQUEST["hasBoss"] . "', "; 

$sql .= "numBosses = '" . $_REQUEST["numBosses"] . "', "; 

$sql .= "numBonfires= '" . $_REQUEST["numBonfires"] . "'";

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

window.location = 'listLocations.php';

</script>