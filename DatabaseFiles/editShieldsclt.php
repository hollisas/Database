<?php

include "dbconnect.php";

$sql = "select * from Shields where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editShieldssrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addShieldssrv.php" method="get">



<tr>

<td>

Shield Name:</td><td><input type="text" name= "ShieldName"/>

</td>

</tr>



<tr>

<td>

Shield Type:</td><td><input type="text" name="ShieldType"/>

</td>

</tr>


<tr>

<td>

Requirements:</td><td><input type="text" name="Requirement"/>

</td>

</tr>

<tr>

<td>

Level Requirements:</td><td><input type="text" name="RequirementLevels"/>

</td>

</tr>

<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>