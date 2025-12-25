<?php 
include "config.php";

$id = $_GET['id'];
$q = mysqli_query($conn, "SELECT * FROM rekomendasi_aspek WHERE id_rek_aspek='$id'");
$d = mysqli_fetch_assoc($q);

if(isset($_POST['update'])){
    $aspek = $_POST['id_aspek'];
    $kategori = $_POST['kategori'];
    $isi = $_POST['rekomendasi'];

    mysqli_query($conn, "
        UPDATE rekomendasi_aspek 
        SET id_aspek='$aspek', kategori='$kategori', rekomendasi='$isi'
        WHERE id_rek_aspek='$id'
    ");

    header("Location: rekomendasi.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Edit Rekomendasi</title>

<style>
<?php include "style_dashboard_base.css"; ?>

.form-box{
    background:white;
    padding:20px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}
input, select, textarea{
    width:100%;
    padding:12px;
    margin-top:5px;
    border:1px solid #ccc;
    border-radius:10px;
}
.btn-save{
    background:#1976D2;
    color:white;
    padding:10px 16px;
    border-radius:10px;
    font-weight:600;
    border:none;
    cursor:pointer;
}
.btn-back{
    margin-left:10px;
    color:#1976D2;
    font-weight:600;
    text-decoration:none;
}
</style>
</head>

<body>
<div class="app">

<?php include "sidebar.php"; ?>

<div class="main">
    <div class="topbar">
        <?php include "topbar.php"; ?>
    </div>

    <h2 style="color:#1976D2;">✏️ Edit Rekomendasi</h2>

    <div class="form-box">
        <form method="POST">

            <label>Aspek Perkembangan</label>
            <select name="id_aspek" required>
                <?php
                $aspek = mysqli_query($conn, "SELECT * FROM aspek_perkembangan");
                while($a = mysqli_fetch_assoc($aspek)){
                    $sel = ($a['id_aspek']==$d['id_aspek']) ? "selected" : "";
                    echo "<option value='{$a['id_aspek']}' $sel>{$a['nama_aspek']}</option>";
                }
                ?>
            </select>

            <label>Kategori</label>
            <select name="kategori" required>
                <option value="BM" <?= $d['kategori']=='BM'?'selected':'' ?>>BM</option>
                <option value="KM" <?= $d['kategori']=='KM'?'selected':'' ?>>KM</option>
                <option value="SM" <?= $d['kategori']=='SM'?'selected':'' ?>>SM</option>
                <option value="K"<?= $d['kategori']=='K'?'selected':'' ?>>K</option>
            </select>

            <label>Isi Rekomendasi</label>
            <textarea name="rekomendasi" rows="5" required><?= $d['rekomendasi'] ?></textarea>

            <br><br>

            <button class="btn-save" type="submit" name="update">Update</button>
            <a href="rekomendasi.php" class="btn-back">Kembali</a>
        </form>
    </div>
</div>

</div>

<?php include "overlay_js.php"; ?>
</body>
</html>
