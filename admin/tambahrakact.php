<?php
include('includes/config.php');
error_reporting(0);
$rak=$_POST['vehicletitle'];
$priceperday=$_POST['priceperday'];
$kapasitas=$_POST['kapasitas'];
$koderek=$_POST['koderek'];
$keterangan=$_POST['keterangan'];
$vimage1=$_FILES["img1"]["name"];
$vimage2=$_FILES["img2"]["name"];
$vimage3=$_FILES["img3"]["name"];
move_uploaded_file($_FILES["img1"]["tmp_name"],"img/vehicleimages/".$_FILES["img1"]["name"]);
move_uploaded_file($_FILES["img2"]["tmp_name"],"img/vehicleimages/".$_FILES["img2"]["name"]);
move_uploaded_file($_FILES["img3"]["tmp_name"],"img/vehicleimages/".$_FILES["img3"]["name"]);

$sql 	= "INSERT INTO rak (nama,biaya,kapasitas,kode_rek,keterangan,tgl_buat,image1,image2,image3)
			VALUES ('$rak','$priceperday','$kapasitas','$koderek','$keterangan',now(),'$vimage1','$vimage2','$vimage3')";
$query 	= mysqli_query($koneksidb,$sql);
if($query){
	echo "<script type='text/javascript'>
			alert('Berhasil tambah data.'); 
			document.location = 'rak.php'; 
		</script>";
}else {
			echo "No Error : ".mysqli_errno($koneksidb);
			echo "<br/>";
			echo "Pesan Error : ".mysqli_error($koneksidb);

	echo "<script type='text/javascript'>
			alert('Terjadi kesalahan, silahkan coba lagi!.'); 
			document.location = 'tambahrak.php'; 
		</script>";
}

?>