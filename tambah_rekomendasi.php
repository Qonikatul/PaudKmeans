<?php 
include "config.php";

// Simpan data
if(isset($_POST['simpan'])){
    $aspek = $_POST['id_aspek'];
    $kategori = $_POST['kategori'];
    $isi = $_POST['rekomendasi'];

    mysqli_query($conn, "INSERT INTO rekomendasi_aspek (id_aspek, kategori, rekomendasi) 
                         VALUES ('$aspek', '$kategori', '$isi')");
    header("Location: rekomendasi.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Tambah Rekomendasi</title>

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

    <h2 style="color:#1976D2;">➕ Tambah Rekomendasi</h2>

    <div class="form-box">
        <form method="POST">

            <label>Aspek Perkembangan</label>
            <select name="id_aspek" required>
                <option value="">-- pilih aspek --</option>
                <?php
                $aspek = mysqli_query($conn, "SELECT * FROM aspek_perkembangan");
                while($a = mysqli_fetch_assoc($aspek)){
                    echo "<option value='{$a['id_aspek']}'>{$a['nama_aspek']}</option>";
                }
                ?>
            </select>

            <label>Kategori</label>
            <select name="kategori" required>
                <option value="">-- pilih kategori --</option>
                <option value="BM">Belum Muncul</option>
                <option value="KM">Kadang Muncul</option>
                <option value="SM">Sering Muncul</option>
                <option value="K">Konsisten</option>
            </select>

            <label>Isi Rekomendasi</label>
            <textarea name="rekomendasi" rows="5" required></textarea>

            <br><br>

            <button class="btn-save" type="submit" name="simpan">Simpan</button>
            <a href="rekomendasi.php" class="btn-back">Kembali</a>
        </form>
    </div>
</div>

</div>

<?php include "overlay_js.php"; ?>
</body>
</html>
