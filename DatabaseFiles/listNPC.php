<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Name</th>

<th>Location</th>

<th>Choice of Weapon</th>

<th>Merchant</th>

<th>Hostile</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from NPC order by Name";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['Name'] . '</td>';

  echo '<td>' . $row['Location'] . '</td>';

  echo '<td>' . $row['WeaponChoice'] . '</td>';
  
  echo '<td>' . $row['Merchant'] . '</td>';
  
  echo '<td>' . $row['Hostile'] . '</td>';

  echo "<td><a href='delNPCsrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editNPCclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addNPCclt.php">Add New</a>