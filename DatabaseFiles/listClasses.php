<?php

include "menu.php";

?>

<table border=1>

<tr>

<th>Class Name</th>

<th>Specialty</th>

<th>Cons</th>

</tr>

<?php

include "dbconnect.php";

$sql = "select * from Classes order by ClassName";



$result = myquery($mysqli,$sql);



while($row = $result->fetch_assoc()) {

  echo "<tr>";

  echo '<td>' . $row['ClassName'] . '</td>';

  echo '<td>' . $row['Specialty'] . '</td>';

  echo '<td>' . $row['Cons'] . '</td>';

  echo "<td><a href='delClassessrv.php?id=" . $row['id'] ."'>Del</a> ";

  echo "<a href='editClassesclt.php?id=" . $row['id']   ."'>Edit</a></td>";

  echo "</tr>";

}

?>

</table>

<a href="addClassesclt.php">Add New</a>