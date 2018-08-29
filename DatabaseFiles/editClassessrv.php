<?php

require 'dbconnect.php';

$sql = "update Classes "; 

$sql .= "set ClassName = '" . $_REQUEST["ClassName"] . "', "; 

$sql .= "Specialty = '" . $_REQUEST["Specialty"] . "', ";  

$sql .= "Cons = '" . $_REQUEST["Cons"] . "'";

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

window.location = 'listClasses.php';

</script>