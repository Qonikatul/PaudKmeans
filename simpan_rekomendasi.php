<?php
include "config.php";

$id = $_POST['id_anak'];
$rk = mysqli_real_escape_string($conn, $_POST['rek_klaster']);
$ra = mysqli_real_escape_string($conn, $_POST['rek_aspek']);

// cek apakah sudah ada data
$cek = mysqli_fetch_row(mysqli_query($conn, "SELECT COUNT(*) FROM rekomendasi WHERE id_anak='$id'"))[0];

if($cek > 0){
    mysqli_query($conn,"
        UPDATE rekomendasi 
        SET rekomendasi_klaster='$rk',
            rekomendasi_aspek='$ra',
            dibuat_pada=NOW()
        WHERE id_anak='$id'
    ");
} else {
    mysqli_query($conn,"
        INSERT INTO rekomendasi(id_anak, rekomendasi_klaster, rekomendasi_aspek)
        VALUES('$id', '$rk', '$ra')
    ");
}

header("Location: rekomendasi.php");
exit;
?>
