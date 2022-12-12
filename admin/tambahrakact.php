<?php
include('includes/config.php');
error_reporting(0);
$rak=$_POST['vehicletitle'];
$priceperday=$_POST['priceperday'];
$kapasitas=$_POST['kapasitas'];

$sql 	= "INSERT INTO rak (nama,keterangan,biaya,kapasitas,tgl_buat)
			VALUES ('$rak','','$priceperday','$kapasitas',now())";
$query 	= mysqli_query($koneksidb,$sql);
if($query){
	echo "<script type='text/javascript'>
			alert('Berhasil tambah data.'); 
			document.location = 'mobil.php'; 
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