<?php

include "dbconnect.php";

$sql = "select * from Locations where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editLocationssrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addLocationssrv.php" method="get">



<tr>

<td>

Location:</td><td><input type="text" name= "Location"/>

</td>

</tr>



<tr>

<td>

Has a Boss:</td><td><input type="text" name="hasBoss"/>

</td>

</tr>


<tr>

<td>

Number of Bosses:</td><td><input type="int" name="numBosses"/>

</td>

</tr>

<tr>

<td>

Number of Bonfires:</td><td><input type="int" name="numBonfires"/>

</td>

</tr>

<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>