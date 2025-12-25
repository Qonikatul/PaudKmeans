<?php 
include "config.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Input Perkembangan Anak</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
<?php include "style_dashboard_base.css"; ?>

/* ================= FORM BOX ================= */
.form-box{
    background:#ffffff;
    padding:22px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,.08);
    margin-top:20px;
}

.input-group{
    margin-bottom:18px;
}

label{
    font-weight:600;
    color:#1976D2;
}

select,
input[type="date"]{
    width:100%;
    padding:12px;
    margin-top:6px;
    border-radius:10px;
    border:1px solid #d0d7e2;
    font-size:15px;
}

/* ================= ASPEK ================= */
.aspek-box{
    padding:14px;
    border-radius:12px;
    background:#f7faff;
    margin-bottom:14px;
    border:1px solid #dce7f9;
}

.aspek-box b{
    display:block;
    margin-bottom:8px;
    color:#0f172a;
}

/* ================= RADIO FIX ================= */
.radio-group{
    display:flex;
    gap:22px;
    align-items:center;
}

.radio-group label{
    display:flex;
    align-items:center;
    gap:6px;
    cursor:pointer;
    font-weight:500;
    color:#0f172a;
}

input[type="radio"]{
    width:auto;
    margin:0;
    padding:0;
    accent-color:#1976D2;
}

/* ================= BUTTON ================= */
.btn-save{
    padding:12px 20px;
    background:#1976D2;
    color:white;
    border:none;
    border-radius:10px;
    font-weight:600;
    cursor:pointer;
}

.btn-save:hover{
    opacity:.9;
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

<h2 style="color:#1976D2;">📋 Input Perkembangan Anak</h2>

<form action="simpan_perkembangan.php" method="POST" class="form-box">

    <!-- PILIH ANAK -->
    <div class="input-group">
        <label>Pilih Anak</label>
        <select name="id_anak" required>
            <option value="">-- pilih anak --</option>
            <?php
            $anak = mysqli_query($conn,"SELECT * FROM anak ORDER BY nama_anak ASC");
            while($a = mysqli_fetch_assoc($anak)){
                echo "<option value='{$a['id_anak']}'>
                        {$a['nama_anak']}
                      </option>";
            }
            ?>
        </select>
    </div>

    <!-- TANGGAL -->
    <div class="input-group">
        <label>Tanggal Input</label>
        <input type="date" name="tgl_input" required>
    </div>

    <hr><br>

    <h3 style="color:#1976D2;">Nilai Per Aspek</h3>

    <?php
    $aspek = mysqli_query($conn,"SELECT * FROM aspek_perkembangan ORDER BY id_aspek ASC");
    while($ap = mysqli_fetch_assoc($aspek)){
    ?>

    <div class="aspek-box">
        <b><?= $ap['nama_aspek']; ?></b>

        <div class="radio-group">
            <label>
                <input type="radio" name="nilai[<?= $ap['id_aspek']; ?>]" value="BM" required> BM
            </label>
            <label>
                <input type="radio" name="nilai[<?= $ap['id_aspek']; ?>]" value="KM"> KM
            </label>
            <label>
                <input type="radio" name="nilai[<?= $ap['id_aspek']; ?>]" value="SM"> SM
            </label>
            <label>
                <input type="radio" name="nilai[<?= $ap['id_aspek']; ?>]" value="K"> K
            </label>
        </div>
    </div>

    <?php } ?>

    <br>
    <button type="submit" class="btn-save">💾 Simpan Nilai</button>

</form>

</div>
</div>

<?php include "overlay_js.php"; ?>
</body>
</html>
