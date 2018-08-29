<?php

include "dbconnect.php";

$sql = "select * from Bosses where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editBossessrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addBossessrv.php" method="get">



<tr>

<td>

Boss Name:</td><td><input type="text" name= "BossName"/>

</td>

</tr>



<tr>

<td>

Location:</td><td><input type="text" name="Location"/>

</td>

</tr>


<tr>

<td>

Weaknesses:</td><td><input type="text" name="Weaknesses"/>

</td>

</tr>

<tr>

<td>

SoulsAwarded:</td><td><input type="text" name="SoulsAwarded"/>

</td>

</tr>

<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>