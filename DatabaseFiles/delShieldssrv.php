<?php

include "dbconnect.php";

$sql = "delete from Shields where id = " .  $_REQUEST["id"] ;



myquery($mysqli,$sql);



?>

<script>

window.location='listShields.php';

</script>