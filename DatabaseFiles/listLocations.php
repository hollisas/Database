<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Location</th>

<th>Has A Boss</th>

<th>Number of Bosses</th>

<th>Number of Bonfires</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Locations order by Location";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['Location'] . '</td>';

  echo '<td>' . $row['hasBoss'] . '</td>';

  echo '<td>' . $row['numBosses'] . '</td>';
  
  echo '<td>' . $row['numBonfires'] . '</td>';

  echo "<td><a href='delLocationssrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editLocationsclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addLocationsclt.php">Add New</a>