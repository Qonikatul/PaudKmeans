<?php
session_start(); // ⬅️ INI YANG KURANG
include "config.php";

if($_SERVER['REQUEST_METHOD'] !== 'POST') { 
    header("Location: input.php"); 
    exit; 
}

$id_anak = (int)$_POST['id_anak'];
$tgl = mysqli_real_escape_string($conn, $_POST['tgl_input']);
$guru_id = isset($_SESSION['id_guru']) ? (int)$_SESSION['id_guru'] : NULL;

// nilai[] adalah array id_aspek => BM/KM/SM/K
$map = ['BM'=>1,'KM'=>2,'SM'=>3,'K'=>4];

if(!isset($_POST['nilai']) || !is_array($_POST['nilai'])){
    header("Location: input.php?err=nonilai");
    exit;
}

foreach($_POST['nilai'] as $id_aspek => $kode){
    $id_aspek = (int)$id_aspek;
    $kode = mysqli_real_escape_string($conn, $kode);
    if(!isset($map[$kode])) continue;

    $angka = $map[$kode];

    mysqli_query($conn, "
        INSERT INTO nilai_perkembangan 
        (id_anak, id_aspek, nilai, nilai_angka, tgl_input, id_guru) 
        VALUES 
        ($id_anak, $id_aspek, '$kode', $angka, '$tgl', ".($guru_id ?? "NULL").")
    ");
}

header("Location: detailanak.php?id=$id_anak");
exit;
