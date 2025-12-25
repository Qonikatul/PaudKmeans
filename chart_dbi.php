<?php
include "config.php";
header("Content-Type: image/png");
// compute dbi for k=2..6 (reuse similar functions)
$points=[];$q=mysqli_query($conn,"SELECT a.id_anak, AVG(np.nilai_angka) AS nilai_rata FROM anak a JOIN nilai_perkembangan np ON a.id_anak=np.id_anak GROUP BY a.id_anak");
while($r=mysqli_fetch_assoc($q)) $points[] = floatval($r['nilai_rata']);
if(count($points)==0){ $im=imagecreatetruecolor(700,200); $col=imagecolorallocate($im,0,0,0); imagestring($im,5,10,80,"Belum ada data",$col); imagepng($im); exit;}
function kmeans_simple($points,$k){ $min=min($points);$max=max($points); for($i=0;$i<$k;$i++) $cent[$i]=$min+($i+0.5)*($max-$min)/$k; for($it=0;$it<50;$it++){ $clusters = array_fill(0,$k,[]); foreach($points as $p){ $d=array_map(fn($c)=>abs($p-$c),$cent); $i=array_search(min($d),$d); $clusters[$i][]=$p;} $new=$cent; foreach($clusters as $i=>$c) if(count($c)) $new[$i]=array_sum($c)/count($c); if($new==$cent) break; $cent=$new;} return [$cent,$clusters];}
function dbi_calc($clusters,$centroids){ $k=count($clusters); $s=[]; for($i=0;$i<$k;$i++){ if(count($clusters[$i])>0){ $sum=0; foreach($clusters[$i] as $p) $sum += abs($p-$centroids[$i]); $s[$i] = $sum/count($clusters[$i]); } else $s[$i]=0; } $db=0; for($i=0;$i<$k;$i++){ $maxR=0; for($j=0;$j<$k;$j++){ if($i==$j) continue; $m=abs($centroids[$i]-$centroids[$j]); if($m==0) $m=1e-6; $R = ($s[$i]+$s[$j])/$m; if($R>$maxR) $maxR=$R; } $db += $maxR; } return $db/$k; }

$vals=[];
for($k=2;$k<=6;$k++){ list($c,$clus)=kmeans_simple($points,$k); $vals[$k]=dbi_calc($clus,$c); }

$w=700;$h=260;$im=imagecreatetruecolor($w,$h); $white=imagecolorallocate($im,255,255,255); $bar=imagecolorallocate($im,102,187,106); $text=imagecolorallocate($im,0,0,0);
imagefill($im,0,0,$white); imagestring($im,5,12,10,"DBI (Davies-Bouldin Index) - rendah lebih baik",$text);
$maxv = max($vals); $pad=60; $barw = ($w-2*$pad)/count($vals); $i=0;
foreach($vals as $k=>$v){
    $x1 = $pad + $i*$barw + 10; $x2 = $x1 + $barw - 24;
    $hbar = ($v/$maxv) * ($h - 120);
    imagefilledrectangle($im,$x1,$h-60-$hbar,$x2,$h-60,$bar);
    imagestring($im,4,$x1,$h-50,"K=$k",$text);
    imagestring($im,3,$x1,$h-70,number_format($v,2),$text);
    $i++;
}
imagepng($im); imagedestroy($im);
