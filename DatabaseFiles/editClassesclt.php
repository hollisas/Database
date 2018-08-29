<?php

include "dbconnect.php";

$sql = "select * from Classes where id = '" . $_REQUEST["id"] ."';";


$result = myquery($mysqli,$sql);

$row = $result->fetch_assoc();

?>

<form action="editClassessrv.php" method="get">

</br>



<input type="hidden" name="id" value="<?php echo $_REQUEST['id']; ?>"/>



<table>

<form action="addClassessrv.php" method="get">



<tr>

<td>

Class Name:</td><td><input type="text" name= "ClassName"/>

</td>

</tr>



<tr>

<td>

Specialty:</td><td><input type="text" name="Specialty"/>

</td>

</tr>


<tr>

<td>

Cons:</td><td><input type="text" name="Cons"/>

</td>

</tr>

<tr>

<td>

<input type="submit"/>

</td>

</tr>

</form>

</table>