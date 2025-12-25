<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "paud_kmeans"; // sesuai nama DB kamu

$conn = mysqli_connect($host, $user, $pass, $db);

if(!$conn){
    die("Koneksi gagal: " . mysqli_connect_error());
}
?>
