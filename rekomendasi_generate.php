<?php
include "config.php";

// Ambil cluster final dari kmeans_hasil
$q = mysqli_query($conn, "SELECT id_anak, cluster FROM kmeans_hasil");

// Hapus rekomendasi lama
mysqli_query($conn, "TRUNCATE TABLE rekomendasi_klaster");

// Loop tiap anak
while($d = mysqli_fetch_assoc($q)){
    $id_anak = $d['id_anak'];
    $cluster  = $d['cluster']; // sudah 1-based sesuai K-Means

    // Ambil nilai tiap aspek
    $nilai = mysqli_query($conn, "
        SELECT id_aspek, nilai
        FROM nilai_perkembangan
        WHERE id_anak = $id_anak
    ");

    $aspek_rendah = [];
    while($n = mysqli_fetch_assoc($nilai)){
        $level = match($n['nilai']){
            'BM'=>1,
            'KM'=>2,
            'SM'=>3,
            'K'=>4,
            default=>0
        };

        if($level <= 2){
            $id_aspek = $n['id_aspek'];
            $a = mysqli_fetch_row(mysqli_query($conn,"SELECT nama_aspek FROM aspek_perkembangan WHERE id_aspek=$id_aspek"));
            $aspek_rendah[] = $a[0];
        }
    }

    // Buat teks rekomendasi opsional
    $teks = count($aspek_rendah) == 0
        ? "Ananda berada pada Klaster $cluster. Capaian perkembangan baik."
        : "Ananda berada pada Klaster $cluster. Aspek yang perlu diperkuat: ".implode(", ", $aspek_rendah);

    // Simpan ke DB
    mysqli_query($conn, "
        INSERT INTO rekomendasi_klaster (id_anak, rekomendasi, dibuat_pada)
        VALUES ($id_anak, '$teks', NOW())
    ");
}

echo "SUKSES! Rekomendasi sudah dibuat sesuai cluster K-Means.";
?>
