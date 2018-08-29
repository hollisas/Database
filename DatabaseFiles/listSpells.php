<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Spell Name</th>

<th>Spell Type</th>

<th>Requirements</th>

<th>Level Requirements</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Spells order by Name";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['Name'] . '</td>';

  echo '<td>' . $row['Type'] . '</td>';

  echo '<td>' . $row['Requirements'] . '</td>';
  
  echo '<td>' . $row['RequirementLevels'] . '</td>';

  echo "<td><a href='delSpellssrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editSpellsclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addSpellsclt.php">Add New</a>