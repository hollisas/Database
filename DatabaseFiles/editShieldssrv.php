<?php

require 'dbconnect.php';

$sql = "update Shields "; 

$sql .= "set ShieldName = '" . $_REQUEST["ShieldName"] . "', "; 

$sql .= "ShieldType = '" . $_REQUEST["ShieldType"] . "', "; 

$sql .= "Requirement = '" . $_REQUEST["Requirement"] . "', "; 

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

window.location = 'listShields.php';

</script>