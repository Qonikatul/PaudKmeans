<?php
include "config.php";

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if($id){
    // HAPUS SEMUA DATA TURUNAN DULU
    mysqli_query($conn, "DELETE FROM nilai_perkembangan WHERE id_anak=$id");
    mysqli_query($conn, "DELETE FROM kmeans_hasil WHERE id_anak=$id");
    mysqli_query($conn, "DELETE FROM rekomendasi_klaster WHERE id_anak=$id");

    // TERAKHIR baru hapus anak
    mysqli_query($conn, "DELETE FROM anak WHERE id_anak=$id");
}

header("Location: dataanak.php");
exit;
