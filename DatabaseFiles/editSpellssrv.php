<?php

require 'dbconnect.php';

$sql = "update Spells "; 

$sql .= "set Name = '" . $_REQUEST["Name"] . "', "; 

$sql .= "Type = '" . $_REQUEST["Type"] . "', "; 

$sql .= "Requirements = '" . $_REQUEST["Requirements"] . "', "; 

$sql .= "RequirementLevels = '" . $_REQUEST["RequirementLevels"] . "'";

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

window.location = 'listSpells.php';

</script>