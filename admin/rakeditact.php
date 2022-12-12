<?php
include('includes/config.php');
error_reporting(0);
$nama_rak=$_POST['vehicletitle'];
$priceperday=$_POST['priceperday'];
$kapasitas=$_POST['kapasitas'];
$keterangan=$_POST['keterangan'];
$koderek=$_POST['koderek'];

$vimage1=$_FILES["img1"]["name"];
$vimage2=$_FILES["img2"]["name"];
$vimage3=$_FILES["img3"]["name"];
move_uploaded_file($_FILES["img1"]["tmp_name"],"img/vehicleimages/".$_FILES["img1"]["name"]);
move_uploaded_file($_FILES["img2"]["tmp_name"],"img/vehicleimages/".$_FILES["img2"]["name"]);
move_uploaded_file($_FILES["img3"]["tmp_name"],"img/vehicleimages/".$_FILES["img3"]["name"]);

$fimg1 = (!empty($vimage1)) ? "image1='$vimage1', " : '';
$fimg2 = (!empty($vimage2)) ? "image2='$vimage2', " : '';
$fimg3 = (!empty($vimage3)) ? "image3='$vimage3', " : '';

$id=$_POST['id'];

$sql="UPDATE rak SET nama='$nama_rak', biaya='$priceperday', kode_rek='$koderek', kapasitas='$kapasitas', 
		$fimg1 $fimg2 $fimg3
		keterangan='$keterangan'
		where id='$id'";
$query 	= mysqli_query($koneksidb,$sql);
if($query){
	echo "<script type='text/javascript'>
			alert('Berhasil edit data.'); 
			document.location = 'rak.php'; 
		</script>";
}else {
			echo "No Error : ".mysqli_errno($koneksidb);
			echo "<br/>";
			echo "Pesan Error : ".mysqli_error($koneksidb);

	echo "<script type='text/javascript'>
			alert('Terjadi kesalahan, silahkan coba lagi!.'); 
			// document.location = 'rakedit.php?id=$id'; 
		</script>";
}
?>