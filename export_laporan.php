<?php
include "config.php";

$kelas_filter = isset($_GET['kelas']) ? $_GET['kelas'] : '';

// Ambil semua aspek
$aspek_list = mysqli_query($conn, "SELECT * FROM aspek_perkembangan ORDER BY id_aspek ASC");
$aspek_array = [];
while($ap = mysqli_fetch_assoc($aspek_list)){
    $aspek_array[$ap['id_aspek']] = $ap['nama_aspek'];
}

// Ambil data anak
$query = "SELECT * FROM anak " . ($kelas_filter ? "WHERE kelas='$kelas_filter'" : "") . " ORDER BY nama_anak ASC";
$anak_list = mysqli_query($conn, $query);

// Export CSV/Excel
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=laporan_anak.csv');
$output = fopen('php://output', 'w');

// Header
$header = ['No','Nama Anak','Kelas'];
foreach($aspek_array as $a) $header[] = $a;
$header[] = 'Klaster';
fputcsv($output, $header);

// Data
$no = 1;
while($a = mysqli_fetch_assoc($anak_list)){
    $row = [$no++, $a['nama_anak'], $a['kelas']];
    foreach($aspek_array as $id_aspek => $nama_aspek){
        $res_nilai = mysqli_query($conn, "SELECT nilai FROM nilai_perkembangan WHERE id_anak=".$a['id_anak']." AND id_aspek=$id_aspek");
        $n = mysqli_fetch_assoc($res_nilai);
        $row[] = $n['nilai'] ?? '-';
    }
    $res_klaster = mysqli_query($conn, "SELECT cluster FROM kmeans_hasil WHERE id_anak=".$a['id_anak']);
    $row[] = ($res_klaster && mysqli_num_rows($res_klaster)>0) ? mysqli_fetch_assoc($res_klaster)['cluster'] : '-';
    fputcsv($output, $row);
}

fclose($output);
exit;
?>
