<?php
# Konek ke Web Server Lokal
$myHost	= "host.docker.internal";
$myUser	= "root";
$myPass	= "";
$myDbs	= "warent";

$koneksidb = mysqli_connect( $myHost, $myUser, $myPass, $myDbs);
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_errno();
  exit();
}
// echo $koneksidb;
// if (! $koneksidb) {
//   echo "Failed Connection !";
// }

?>