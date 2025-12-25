<?php
include "config.php";
header("Content-Type: image/png");
$points=[];$q=mysqli_query($conn,"SELECT a.id_anak, AVG(np.nilai_angka) AS nilai_rata FROM anak a JOIN nilai_perkembangan np ON a.id_anak=np.id_anak GROUP BY a.id_anak");
while($r=mysqli_fetch_assoc($q)) $points[] = floatval($r['nilai_rata']);
if(count($points)==0){ $im=imagecreatetruecolor(700,200); imagestring($im,5,10,80,"Belum ada data",imagecolorallocate($im,0,0,0)); imagepng($im); exit;}
function kmeans_simple($points,$k){ $min=min($points);$max=max($points); for($i=0;$i<$k;$i++) $cent[$i]=$min+($i+0.5)*($max-$min)/$k; for($it=0;$it<50;$it++){ $clusters = array_fill(0,$k,[]); foreach($points as $p){ $d=array_map(fn($c)=>abs($p-$c),$cent); $i=array_search(min($d),$d); $clusters[$i][]=$p;} $new=$cent; foreach($clusters as $i=>$c) if(count($c)) $new[$i]=array_sum($c)/count($c); if($new==$cent) break; $cent=$new;} return [$cent,$clusters];}
function silhouette_calc($clusters){ $all=[]; foreach($clusters as $i=>$cluster) foreach($cluster as $p) $all[]=['v'=>$p,'c'=>$i]; $scores=[]; foreach($all as $idx=>$it){ $a=0;$na=0; foreach($all as $j=>$it2) if($it2['c']==$it['c'] && $j!=$idx){ $a+=abs($it['v']-$it2['v']); $na++; } $a = $na? $a/$na : 0; $b=PHP_FLOAT_MAX; $clusters_ids = array_unique(array_column($all,'c')); foreach($clusters_ids as $cid){ if($cid==$it['c']) continue; $sum=0;$n=0; foreach($all as $it3) if($it3['c']==$cid){ $sum+=abs($it['v']-$it3['v']); $n++; } if($n>0){ $avg=$sum/$n; if($avg<$b) $b=$avg; } } $scores[] = ($b-$a)/max($a,$b); } return array_sum($scores)/count($scores); }

$vals=[]; for($k=2;$k<=6;$k++){ list($c,$clus)=kmeans_simple($points,$k); $vals[$k]=silhouette_calc($clus); }

$w=700;$h=260;$im=imagecreatetruecolor($w,$h); $white=imagecolorallocate($im,255,255,255); $bar=imagecolorallocate($im,33,150,243); $text=imagecolorallocate($im,0,0,0); imagefill($im,0,0,$white);
imagestring($im,5,12,10,"Silhouette Score - lebih besar lebih baik",$text);
$maxv = max($vals); $pad=60; $barw = ($w-2*$pad)/count($vals); $i=0;
foreach($vals as $k=>$v){
    $x1=$pad+$i*$barw+10; $x2=$x1+$barw-24;
    $hbar = ($v/$maxv)*($h-120);
    imagefilledrectangle($im,$x1,$h-60-$hbar,$x2,$h-60,$bar);
    imagestring($im,4,$x1,$h-50,"K=$k",$text);
    imagestring($im,3,$x1,$h-70,number_format($v,3),$text);
    $i++;
}
imagepng($im); imagedestroy($im);
