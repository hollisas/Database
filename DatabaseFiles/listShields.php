<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Shield Name</th>

<th>Shield Type</th>

<th>Requirement</th>

<th>Level Requirements</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Shields order by ShieldName";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['ShieldName'] . '</td>';

  echo '<td>' . $row['ShieldType'] . '</td>';

  echo '<td>' . $row['Requirement'] . '</td>';
  
  echo '<td>' . $row['RequirementLevels'] . '</td>';

  echo "<td><a href='delShieldssrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editShieldsclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addShieldsclt.php">Add New</a>