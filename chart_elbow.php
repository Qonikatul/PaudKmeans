<?php
include "config.php";
header("Content-Type: image/png");

// compute elbow SSE for k=2..6 (reuse minimal kmeans)
$points = [];
$q = mysqli_query($conn, "SELECT a.id_anak, AVG(np.nilai_angka) AS nilai_rata FROM anak a JOIN nilai_perkembangan np ON a.id_anak=np.id_anak GROUP BY a.id_anak");
while($r=mysqli_fetch_assoc($q)) $points[] = floatval($r['nilai_rata']);
if(count($points)==0){
    $im = imagecreatetruecolor(700,200); $bg = imagecolorallocate($im,255,255,255); imagefill($im,0,0,$bg);
    $txt = "Belum ada data"; $col = imagecolorallocate($im,0,0,0); imagestring($im,5,10,80,$txt,$col);
    imagepng($im); imagedestroy($im); exit;
}
function kmeans_simple($points,$k){
    $min=min($points); $max=max($points);
    $cent=[]; for($i=0;$i<$k;$i++) $cent[$i]=$min+($i+0.5)*($max-$min)/$k;
    for($it=0;$it<50;$it++){
        $clusters = array_fill(0,$k,[]);
        foreach($points as $p){ $d=array_map(fn($c)=>abs($p-$c),$cent); $i=array_search(min($d),$d); $clusters[$i][]=$p; }
        $new=$cent;
        foreach($clusters as $i=>$c) if(count($c)) $new[$i]=array_sum($c)/count($c);
        if($new==$cent) break; $cent=$new;
    }
    return [$cent,$clusters];
}
function sse($clusters,$cent){ $s=0; foreach($clusters as $i=>$c) foreach($c as $p) $s+=pow($p-$cent[$i],2); return $s; }

$vals=[];
for($k=2;$k<=6;$k++){ list($cent,$clus)=kmeans_simple($points,$k); $vals[$k]=sse($clus,$cent); }

// draw simple bar chart
$w=700;$h=260;$im=imagecreatetruecolor($w,$h);
$white=imagecolorallocate($im,255,255,255); $bgc=imagecolorallocate($im,240,248,255);
$axis=imagecolorallocate($im,100,149,237); $barc=imagecolorallocate($im,66,165,245); $text=imagecolorallocate($im,10,10,10);
imagefill($im,0,0,$white);
imagefilledrectangle($im,0,0,$w,50,$bgc);
imagestring($im,5,12,10,"Elbow (SSE) - K vs SSE",$text);
$maxv = max($vals); $pad=60; $barw = ($w-2*$pad)/count($vals);
$i=0;
foreach($vals as $k=>$v){
    $x1 = $pad + $i*$barw + 10;
    $x2 = $x1 + $barw - 24;
    $hbar = ($v/$maxv) * ($h - 120);
    imagefilledrectangle($im,$x1,$h-60-$hbar,$x2,$h-60,$barc);
    imagestring($im,4,$x1, $h-50, "K=$k",$text);
    imagestring($im,3,$x1,$h-70, number_format($v,1),$text);
    $i++;
}
imagepng($im); imagedestroy($im);
