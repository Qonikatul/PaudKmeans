<?php 
include "config.php";
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Rekomendasi Pembelajaran</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
<?php include "style_dashboard_base.css"; ?>

.table-box{
    background:white;
    padding:20px;
    border-radius:14px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}

/* ===== ACCORDION STYLE ===== */
.accordion-item{
    background:white;
    margin-bottom:14px;
    border-radius:12px;
    box-shadow:0 6px 20px rgba(0,0,0,0.06);
    overflow:hidden;
}

.accordion-header{
    padding:16px 20px;
    font-weight:600;
    font-size:16px;
    color:#1976D2;
    cursor:pointer;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:#f8fbff;
}

.accordion-header span{
    font-size:18px;
}

.accordion-content{
    display:none;
    padding:10px 20px 20px 20px;
}

.accordion-table{
    width:100%;
    border-collapse:collapse;
}

.accordion-table td{
    padding:10px 5px;
    border-bottom:1px solid #eee;
}

.badge{
    background:#e3f2ff;
    padding:6px 12px;
    border-radius:8px;
    font-weight:600;
    color:#1976D2;
    font-size:13px;
}

.btn-add{
    background:#1976D2;
    color:white;
    padding:10px 16px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
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

        <h2 style="color:#1976D2;">📘 Rekomendasi Pembelajaran</h2>

        <a href="tambah_rekomendasi.php" class="btn-add">+ Tambah Rekomendasi</a>

        <div class="table-box">
            <h3 style="color:#1976D2;">Daftar Rekomendasi Per Aspek</h3>

            <?php
            // Ambil daftar aspek
            $aspekQuery = mysqli_query($conn, "SELECT * FROM aspek_perkembangan ORDER BY id_aspek ASC");

            while($aspek = mysqli_fetch_assoc($aspekQuery)){
                
                // Ambil rekomendasi per aspek
                $rekQuery = mysqli_query($conn,"
                    SELECT * FROM rekomendasi_aspek 
                    WHERE id_aspek = '".$aspek['id_aspek']."'
                    ORDER BY kategori ASC
                ");
            ?>

            <div class="accordion-item">
                <div class="accordion-header">
                    <?= $aspek['nama_aspek'] ?>
                    <span>▶</span>
                </div>

                <div class="accordion-content">
                    <table class="accordion-table">
                    <?php while($r = mysqli_fetch_assoc($rekQuery)){ ?>
                        <tr>
                            <td style="width:120px;">
                                <span class="badge"><?= $r['kategori'] ?></span>
                            </td>

                            <td><?= $r['rekomendasi'] ?></td>

                            <td style="width:80px;">
                                <a href="edit_rekomendasi.php?id=<?= $r['id_rek_aspek'] ?>" 
                                   style="font-size:20px;text-decoration:none;margin-right:8px;">✏️</a>

                                <a href="hapus_rekomendasi.php?id=<?= $r['id_rek_aspek'] ?>" 
                                   onclick="return confirm('Hapus rekomendasi ini?')"
                                   style="font-size:20px;text-decoration:none;">🗑️</a>
                            </td>
                        </tr>
                    <?php } ?>
                    </table>
                </div>
            </div>

            <?php } ?>
        </div>

    </div>
</div>

<?php include "overlay_js.php"; ?>

<!-- ===== ACCORDION SCRIPT ===== -->
<script>
document.querySelectorAll(".accordion-header").forEach(header=>{
    header.addEventListener("click", ()=>{

        let content = header.nextElementSibling;
        let arrow = header.querySelector("span");

        if(content.style.display === "block"){
            content.style.display = "none";
            arrow.innerHTML = "▶";
        } else {
            content.style.display = "block";
            arrow.innerHTML = "▼";
        }
    });
});
</script>

</body>
</html>
