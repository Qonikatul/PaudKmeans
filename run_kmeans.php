<?php
include "config.php";

/* ambil data rata-rata */
$data = [];
$res = mysqli_query($conn,"
    SELECT id_anak, AVG(nilai_angka) AS nilai
    FROM nilai_perkembangan
    GROUP BY id_anak
");
while($r=mysqli_fetch_assoc($res)){
    $data[] = [
        'id' => $r['id_anak'],
        'nilai' => (float)$r['nilai']
    ];
}
if(count($data)==0) exit;

/* kmeans 1D */
function kmeans1d($points,$k){
    $min=min($points); $max=max($points);
    $c=[];
    for($i=0;$i<$k;$i++){
        $c[$i]=$min+($i+.5)*($max-$min)/$k;
    }
    for($it=0;$it<50;$it++){
        $cl=array_fill(0,$k,[]);
        foreach($points as $p){
            $d=array_map(fn($x)=>abs($p-$x),$c);
            $cl[array_search(min($d),$d)][]=$p;
        }
        foreach($cl as $i=>$v){
            if($v) $c[$i]=array_sum($v)/count($v);
        }
    }
    return [$c,$cl];
}

$points=array_column($data,'nilai');
[$cent,$cl]=kmeans1d($points,3);

/* mapping */
$map=[];
foreach($data as $d){
    $dist=array_map(fn($c)=>abs($d['nilai']-$c),$cent);
    $map[$d['id']]=array_search(min($dist),$dist)+1;
}

/* simpan */
mysqli_query($conn,"TRUNCATE kmeans_hasil");
$stmt=mysqli_prepare($conn,"
    INSERT INTO kmeans_hasil(id_anak,cluster,nilai_total)
    VALUES(?,?,?)
");
foreach($data as $d){
    mysqli_stmt_bind_param(
        $stmt,"iid",
        $d['id'],
        $map[$d['id']],
        $d['nilai']
    );
    mysqli_stmt_execute($stmt);
}
mysqli_stmt_close($stmt);
