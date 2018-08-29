<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Boss</th>

<th>Location</th>

<th>Weakness</th>

<th>Souls Awarded</th>

</tr>

<?php

include "dbconnect.php";

$sql = "SELECT * FROM BossesView";

$result = myquery($mysqli,$sql);

while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['BossName'] . '</td>';

  echo '<td>' . $row['Location'] . '</td>';
  
  echo '<td>' . $row['Weaknesses'] . '</td>';
  
  echo '<td>' . $row['SoulsAwarded'] . '</td>';

  echo "</tr>";

}

?>

</table>