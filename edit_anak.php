<?php
include "config.php";

$id = $_GET['id'];

// =====================
// AMBIL DATA ANAK
// =====================
$d = mysqli_fetch_assoc(
    mysqli_query($conn,"SELECT * FROM anak WHERE id_anak=$id")
);

// =====================
// AMBIL NILAI PERKEMBANGAN
// =====================
$nilai = [];
$res = mysqli_query($conn,"
    SELECT id_aspek, nilai
    FROM nilai_perkembangan
    WHERE id_anak=$id
");
while($r = mysqli_fetch_assoc($res)){
    $nilai[$r['id_aspek']] = $r['nilai'];
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Edit Anak</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<style>
<?php include "style_dashboard_base.css"; ?>

.form-box{
    background:#fff;
    padding:22px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
    max-width:720px;
}
input,select{
    width:100%;
    padding:10px 14px;
    margin:6px 0 14px;
    border-radius:10px;
    border:1px solid #d1d5db;
}
.btn{
    padding:12px 18px;
    background:#1976D2;
    border:none;
    border-radius:10px;
    color:#fff;
    font-weight:600;
    cursor:pointer;
}
.aspek-box{
    background:#f7faff;
    padding:14px;
    border-radius:12px;
    margin-bottom:12px;
    border:1px solid #dce7f9;
}
.radio-group{
    display:flex;
    gap:16px;
    margin-top:8px;
}
.radio-group label{
    font-weight:500;
}
.radio-group input:checked + span{
    background:#1976D2;
    color:#fff;
    padding:2px 8px;
    border-radius:6px;
}
</style>
</head>

<body>
<?php include "sidebar.php"; ?>
<div class="main">
<?php include "topbar.php"; ?>

<h2 style="color:#1976D2">✏️ Edit Data Anak & Nilai</h2>

<form method="POST" class="form-box">

<h3>Data Anak</h3>
<label>Nama Anak</label>
<input type="text" name="nama" value="<?= $d['nama_anak'] ?>" required>

<label>Jenis Kelamin</label>
<select name="jk">
    <option value="L" <?= $d['jenis_kelamin']=='L'?'selected':'' ?>>Laki-laki</option>
    <option value="P" <?= $d['jenis_kelamin']=='P'?'selected':'' ?>>Perempuan</option>
</select>

<label>Usia</label>
<input type="number" name="usia" value="<?= $d['usia'] ?>">

<label>Kelas</label>
<input type="text" name="kelas" value="<?= $d['kelas'] ?>">

<hr><br>

<h3>Nilai Perkembangan</h3>

<?php
$aspek = mysqli_query($conn,"SELECT * FROM aspek_perkembangan ORDER BY id_aspek");
while($ap = mysqli_fetch_assoc($aspek)){
    $v = $nilai[$ap['id_aspek']] ?? '';
?>
<div class="aspek-box">
<b><?= $ap['nama_aspek'] ?></b>
<div class="radio-group">
<?php
foreach(['BM','KM','SM','K'] as $opt){
    $ck = ($v==$opt)?'checked':'';
    echo "
    <label>
        <input type='radio' name='nilai[{$ap['id_aspek']}]' value='$opt' $ck required>
        <span>$opt</span>
    </label>";
}
?>
</div>
</div>
<?php } ?>

<button type="submit" name="update" class="btn">Simpan Perubahan</button>
</form>

</div>
<?php include "overlay_js.php"; ?>
</body>
</html>

<?php
// =====================
// PROSES UPDATE
// =====================
if(isset($_POST['update'])){

    // update anak
    mysqli_query($conn,"
        UPDATE anak SET
            nama_anak='$_POST[nama]',
            jenis_kelamin='$_POST[jk]',
            usia='$_POST[usia]',
            kelas='$_POST[kelas]'
        WHERE id_anak=$id
    ");

    // mapping nilai -> angka
    $map = [
        'BM'=>1,
        'KM'=>2,
        'SM'=>3,
        'K'=>4
    ];

    foreach($_POST['nilai'] as $id_aspek=>$val){
        $angka = $map[$val];

        $cek = mysqli_query($conn,"
            SELECT 1 FROM nilai_perkembangan
            WHERE id_anak=$id AND id_aspek=$id_aspek
        ");

        if(mysqli_num_rows($cek)){
            mysqli_query($conn,"
                UPDATE nilai_perkembangan SET
                    nilai='$val',
                    nilai_angka=$angka,
                    tgl_input=CURDATE()
                WHERE id_anak=$id AND id_aspek=$id_aspek
            ");
        }else{
            mysqli_query($conn,"
                INSERT INTO nilai_perkembangan
                (id_anak,id_aspek,nilai,nilai_angka,tgl_input)
                VALUES($id,$id_aspek,'$val',$angka,CURDATE())
            ");
        }
    }

    echo "<script>
        alert('Data & nilai berhasil diperbarui');
        window.location='dataanak.php';
    </script>";
}
?>
