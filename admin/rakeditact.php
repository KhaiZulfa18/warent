<?php
include('includes/config.php');
error_reporting(0);
$nama_rak=$_POST['vehicletitle'];
$priceperday=$_POST['priceperday'];
$kapasitas=$_POST['kapasitas'];
$keterangan=$_POST['keterangan'];

$id=$_POST['id'];

$sql="UPDATE rak SET nama='$nama_rak', biaya='$priceperday', kapasitas='$kapasitas', keterangan='$keterangan' where id='$id'";
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
			document.location = 'rakedit.php?id=$id'; 
		</script>";
}
?>