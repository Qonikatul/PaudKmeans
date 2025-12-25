<?php
include "config.php";
session_start();

// ambil guru id dari session login
$id_guru = $_SESSION['id_guru'];

$id_anak = $_POST['id_anak'];
$tgl = $_POST['tgl_input'];
$aspek = $_POST['aspek']; // array: id_aspek => nilai BM/KM/SM/K

foreach($aspek as $id_aspek => $nilai){
    
    // konversi nilai ke angka
    $angka = 0;
    if($nilai == "BM") $angka = 1;
    if($nilai == "KM") $angka = 2;
    if($nilai == "SM") $angka = 3;
    if($nilai == "K")  $angka = 4;

    mysqli_query($conn,"
        INSERT INTO nilai_perkembangan (id_anak, id_aspek, nilai, nilai_angka, tgl_input, id_guru)
        VALUES ('$id_anak','$id_aspek','$nilai','$angka','$tgl','$id_guru')
    ");
}

header("Location: input.php?success=1");
exit;
?>
