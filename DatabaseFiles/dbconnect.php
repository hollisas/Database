<?php
function myquery($mysqli,$sql) {
  if (!$result = $mysqli->query($sql)) {
    echo "Errno: " . $mysqli->errno . "</br>";
    echo "Error: " . $mysqli->error . "</br>";
    exit;
  }
  return $result;
}
$mysqli = new mysqli('37.60.248.193', 'austin60', 'Cougars2017.', 'austin60_Database1');
if ($mysqli->connect_errno) {
 echo "Errno: " . $mysqli->connect_errno . "</br>";
 echo "Error: " . $mysqli->connect_error . "</br>";
 exit;
}
?>