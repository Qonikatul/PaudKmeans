<?php
include "config.php";

$id = $_GET['id'];

mysqli_query($conn, "DELETE FROM rekomendasi_aspek WHERE id_rek_aspek='$id'");

header("Location: rekomendasi.php");
exit;
?>
