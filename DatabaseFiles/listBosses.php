<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Bosses</th>

<th>Location</th>

<th>Weaknesses</th>

<th>Souls Awarded</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Bosses order by BossName";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['BossName'] . '</td>';

  echo '<td>' . $row['Location'] . '</td>';

  echo '<td>' . $row['Weaknesses'] . '</td>';
  
  echo '<td>' . $row['SoulsAwarded'] . '</td>';

  echo "<td><a href='delBossessrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editBossesclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addBossesclt.php">Add New</a>