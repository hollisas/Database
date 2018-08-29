<?php

include "dbconnect.php";

$sql = "delete from Spells where id = " .  $_REQUEST["id"] ;



myquery($mysqli,$sql);



?>

<script>

window.location='listSpells.php';

</script>