<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Total Souls From Bosses</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select sum(SoulsAwarded) AS total FROM Bosses ";

$result = myquery($mysqli,$sql);

while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['total'] . '</td>';

  echo "</tr>";

}

?>

</table>