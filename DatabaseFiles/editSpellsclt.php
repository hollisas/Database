<?php

include "dbconnect.php";

$sql = "select * from Spells where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editSpellssrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addSpellssrv.php" method="get">



<tr>

<td>

Spell Name:</td><td><input type="text" name= "Name"/>

</td>

</tr>



<tr>

<td>

Spell Type:</td><td><input type="text" name="Type"/>

</td>

</tr>


<tr>

<td>

Requirements:</td><td><input type="text" name="Requirements"/>

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