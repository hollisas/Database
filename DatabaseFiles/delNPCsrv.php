<?php

include "dbconnect.php";

$sql = "delete from NPC where id = " .  $_REQUEST["id"] ;



myquery($mysqli,$sql);



?>

<script>

window.location='listNPC.php';

</script>