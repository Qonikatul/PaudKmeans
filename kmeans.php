<?php
include "config.php";

/* ===============================
   AMBIL DATA NILAI RATA-RATA ANAK
=============================== */
$dataAnak = [];
$res = mysqli_query($conn, "
    SELECT a.id_anak, a.nama_anak, AVG(np.nilai_angka) AS nilai_rata
    FROM anak a
    JOIN nilai_perkembangan np ON np.id_anak = a.id_anak
    GROUP BY a.id_anak
");

while($r = mysqli_fetch_assoc($res)){
    $dataAnak[] = [
        'id_anak'   => (int)$r['id_anak'],
        'nama_anak' => $r['nama_anak'],
        'nilai'     => floatval($r['nilai_rata'])
    ];
}

if(count($dataAnak) == 0){
    die("<!doctype html><html><body style='padding:20px;font-family:Poppins'>
        Belum ada data nilai perkembangan.
    </body></html>");
}

/* ===============================
   FUNGSI K-MEANS 1 DIMENSI
=============================== */
function kmeans_1d($points, $k, $maxIter = 100){
    $min = min($points);
    $max = max($points);

    $centroids = [];
    for($i=0;$i<$k;$i++){
        $centroids[$i] = $min + ($i+0.5)*($max-$min)/$k;
    }

    for($iter=0;$iter<$maxIter;$iter++){
        $clusters = array_fill(0,$k,[]);
        foreach($points as $p){
            $dist = array_map(fn($c)=>abs($p-$c), $centroids);
            $clusters[array_search(min($dist), $dist)][] = $p;
        }

        $newCentroids = $centroids;
        foreach($clusters as $i=>$c){
            if(count($c)>0){
                $newCentroids[$i] = array_sum($c)/count($c);
            }
        }

        if($newCentroids === $centroids) break;
        $centroids = $newCentroids;
    }
    return [$centroids,$clusters];
}

/* ===============================
   SSE & DBI
=============================== */
function SSE($clusters,$centroids){
    $sse = 0;
    foreach($clusters as $i=>$c){
        foreach($c as $p){
            $sse += pow($p-$centroids[$i],2);
        }
    }
    return $sse;
}

function DBI($clusters,$centroids){
    $k = count($clusters);
    $s = [];

    foreach($clusters as $i=>$c){
        if(count($c)==0){ $s[$i]=0; continue; }
        $sum=0;
        foreach($c as $p){ $sum+=abs($p-$centroids[$i]); }
        $s[$i] = $sum/count($c);
    }

    $db=0;
    for($i=0;$i<$k;$i++){
        $maxR=0;
        for($j=0;$j<$k;$j++){
            if($i==$j) continue;
            $m = abs($centroids[$i]-$centroids[$j]);
            if($m==0) $m=1e-6;
            $R = ($s[$i]+$s[$j])/$m;
            if($R>$maxR) $maxR=$R;
        }
        $db+=$maxR;
    }
    return $db/$k;
}

/* ===============================
   PROSES K = 2..4
=============================== */
$points = array_map(fn($a)=>$a['nilai'],$dataAnak);

$elbow=[];
$dbi=[];

for($k=2;$k<=4;$k++){
    list($c,$cl)=kmeans_1d($points,$k);
    $elbow[$k]=SSE($cl,$c);
    $dbi[$k]=DBI($cl,$c);
}

/* ===============================
   PILIH K TERBAIK
=============================== */
$k_elbow = array_keys($elbow,min($elbow))[0];
$k_dbi   = array_keys($dbi,min($dbi))[0];
$K_FINAL = max(2,min(4,round(($k_elbow+$k_dbi)/2)));

/* ===============================
   K-MEANS FINAL
=============================== */
list($centFinal,$clusFinal)=kmeans_1d($points,$K_FINAL);

$mapping=[];
foreach($dataAnak as $a){
    $dist=array_map(fn($c)=>abs($a['nilai']-$c),$centFinal);
    $mapping[$a['id_anak']] = array_search(min($dist),$dist)+1;
}

/* SIMPAN HASIL */
mysqli_query($conn,"TRUNCATE TABLE kmeans_hasil");
$stmt=mysqli_prepare($conn,"
    INSERT INTO kmeans_hasil (id_anak,cluster,nilai_total)
    VALUES (?,?,?)
");
foreach($dataAnak as $a){
    mysqli_stmt_bind_param($stmt,"iid",
        $a['id_anak'],
        $mapping[$a['id_anak']],
        $a['nilai']
    );
    mysqli_stmt_execute($stmt);
}
mysqli_stmt_close($stmt);
?>

<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>K-Means</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<style><?php include "style_dashboard_base.css"; ?></style>

<style>
.chart-box{
    background:#fff;
    padding:18px;
    border-radius:14px;
    border:1px solid #e6e6e6;
}
table th{
    background:#1976D2;
    color:#fff;
}
tr:nth-child(even){background:#f7faff}
</style>
</head>

<body>
<div class="app">
<?php include "sidebar.php"; ?>

<div class="main">
<div class="topbar"><?php include "topbar.php"; ?></div>

<h2 style="color:#1976D2">🔢 Proses K-Means</h2>

<div class="card">
    <h3>📌 Klaster Terbaik: <span style="color:#1976D2"><?= $K_FINAL ?></span></h3>
    <p>Berdasarkan metode Elbow (SSE) dan Davies–Bouldin Index (DBI).</p>
</div>

<div class="card" style="margin-top:20px">
<h3>Hasil Per Anak</h3>
<table style="width:100%;border-collapse:collapse;margin-top:10px">
<tr>
<th>Nama Anak</th>
<th>Nilai Rata-rata</th>
<th>Cluster</th>
</tr>
<?php foreach($dataAnak as $a){ ?>
<tr>
<td><?= $a['nama_anak'] ?></td>
<td><?= number_format($a['nilai'],2) ?></td>
<td>Klaster <?= $mapping[$a['id_anak']] ?></td>
</tr>
<?php } ?>
</table>
</div>

<!-- ================= GRAFIK (PENDUKUNG - DI BAWAH) ================= -->
<div class="card" style="margin-top:30px;opacity:.95">
<h3 style="color:#1976D2">📊 Grafik Evaluasi (Pendukung)</h3>

<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:20px;margin-top:18px">
<div class="chart-box">
<h4>Elbow (SSE)</h4>
<canvas id="chartElbow"></canvas>
</div>
<div class="chart-box">
<h4>Davies–Bouldin Index</h4>
<canvas id="chartDBI"></canvas>
</div>
</div>
</div>

</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener("DOMContentLoaded",function(){
const elbowData = <?= json_encode($elbow) ?>;
const dbiData   = <?= json_encode($dbi) ?>;
const labels    = Object.keys(elbowData);

function draw(id,label,data){
    const el=document.getElementById(id);
    if(!el) return;
    new Chart(el,{
        type:'line',
        data:{
            labels:labels,
            datasets:[{
                label:label,
                data:Object.values(data),
                borderWidth:2,
                tension:.35
            }]
        },
        options:{responsive:true}
    });
}
draw('chartElbow','SSE',elbowData);
draw('chartDBI','DBI',dbiData);
});
</script>

<?php include "overlay_js.php"; ?>
</body>
</html>
