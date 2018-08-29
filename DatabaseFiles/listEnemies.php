<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Enemy Name</th>

<th>Location</th>

<th>Attack Style</th>

<th>Weakness</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Enemies order by Name";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['Name'] . '</td>';
  
  echo '<td>' . $row['Location'] . '</td>';

  echo '<td>' . $row['AttackStyle'] . '</td>';

  echo '<td>' . $row['Weakness'] . '</td>';

  echo "<td><a href='delEnemiessrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editEnemiesclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addEnemiesclt.php">Add New</a>