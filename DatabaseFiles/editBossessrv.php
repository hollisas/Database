<?php

require 'dbconnect.php';

$sql = "update Bosses "; 

$sql .= "set BossName = '" . $_REQUEST["BossName"] . "', "; 

$sql .= "Location = '" . $_REQUEST["Location"] . "', ";  

$sql .= "Weaknesses = '" . $_REQUEST["Weaknesses"] . "', ";

$sql .= "SoulsAwarded = '" . $_REQUEST["SoulsAwarded"] . "'";

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

window.location = 'listBosses.php';

</script>