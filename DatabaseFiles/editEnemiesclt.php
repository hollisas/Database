<?php

include "dbconnect.php";

$sql = "select * from Enemies where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editEnemiessrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addEnemiessrv.php" method="get">



<tr>

<td>

Enemy Name:</td><td><input type="text" name= "Name"/>

</td>

</tr>



<tr>

<td>

Attack Style:</td><td><input type="text" name="AttackStyle"/>

</td>

</tr>


<tr>

<td>

Weakness:</td><td><input type="text" name="Weakness"/>

</td>

</tr>


<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>