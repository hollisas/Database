<?php

include "dbconnect.php";

$sql = "select * from NPC where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editNPCsrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addNPCsrv.php" method="get">



<tr>

<td>

NPC Name:</td><td><input type="text" name= "Name"/>

</td>

</tr>



<tr>

<td>

Location:</td><td><input type="text" name="Location"/>

</td>

</tr>


<tr>

<td>

Weapon of Choice:</td><td><input type="text" name="WeaponChoice"/>

</td>

</tr>


<tr>

<td>

Is a Merchant:</td><td><input type="text" name="Merchant"/>

</td>

</tr>


<tr>

<td>

Is Hostile:</td><td><input type="text" name="Hostile"/>

</td>

</tr>


<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>