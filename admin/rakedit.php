<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0){	
header('location:index.php');
}else{ 
?>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	
	<title>Gudang C4 | Edit Rak</title>

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
<style>
.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
</style>
<script type="text/javascript">
function valid(theform){
		pola_nama=/^[a-zA-Z]*$/;
		if (!pola_nama.test(theform.vehicletitle.value)){
		alert ('Hanya huruf yang diperbolehkan untuk Nama Rak!');
		theform.vehicletitle.focus();
		return false;
		}
		return (true);
}
</script>
</head>
<body>
	<?php include('includes/header.php');?>
	<div class="ts-main-content">
	<?php include('includes/leftbar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">
					
						<h2 class="page-title">Edit Rak</h2>

						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading">Form Edit Rak</div>
									<div class="panel-body">
										<?php 
										$id=intval($_GET['id']);
										$sql ="SELECT * FROM rak WHERE rak.id='$id'";
										$query = mysqli_query($koneksidb,$sql);
										$result = mysqli_fetch_array($query);
										?>

										<form method="post" class="form-horizontal" name="theform" action ="rakeditact.php" onsubmit="return valid(this);" enctype="multipart/form-data">
										<div class="form-group">
											<label class="col-sm-2 control-label">Nama Rak<span style="color:red">*</span></label>
											<div class="col-sm-4">
												<input type="hidden" name="id" class="form-control" value="<?php echo $id;?>" required>
												<input type="text" name="vehicletitle" class="form-control" value="<?php echo htmlentities($result['nama']);?>" required>
											</div>
										</div>
																					
										<div class="hr-dashed"></div>
										<div class="form-group">
											<label class="col-sm-2 control-label">Keterangan<span style="color:red">*</span></label>
											<div class="col-sm-4">
												<textarea class="form-control" name="keterangan" rows="3" required><?php echo htmlentities($result['keterangan']);?></textarea>
											</div>
											<label class="col-sm-2 control-label">Kode Rek<span style="color:red">*</span></label>
											<div class="col-sm-4">
												<input type="text" name="koderek" class="form-control" value="<?php echo htmlentities($result['kode_rek']);?>" required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-2 control-label">Harga /Hari<span style="color:red">*</span></label>
											<div class="col-sm-4">
												<input type="text" name="priceperday" class="form-control" value="<?php echo htmlentities($result['biaya']);?>" required>
											</div>
											<label class="col-sm-2 control-label">Kapasitas<span style="color:red">*</span></label>
											<div class="col-sm-4">
												<input type="text" name="kapasitas" class="form-control" value="<?php echo htmlentities($result['kapasitas']);?>" required>
											</div>
										</div>
										
										<div class="hr-dashed"></div>			
										
										<div class="form-group">
											
											<div class="col-sm-4">
												Gambar 1
												<?php if(!empty($result['image1'])){ ?>
												<img src="img/vehicleimages/<?php echo (!empty($result['image1'])) ? htmlentities($result['image1']) : '';?>" width="300" height="200" style="border:solid 1px #000">
												<?php } ?>
												<input type="file" name="img1" accept="image/*">
												<span>*Upload gambar jika ingin mengubah gambar</span>
											</div>
											<div class="col-sm-4">
												Gambar 2
												<?php if(!empty($result['image2'])){ ?>
												<img src="img/vehicleimages/<?php echo htmlentities($result['image2']);?>" width="300" height="200" style="border:solid 1px #000">
												<?php } ?>
												<input type="file" name="img2" accept="image/*">
												<span>*Upload gambar jika ingin mengubah gambar</span>
											</div>
											<div class="col-sm-4">
												Gambar 3
												<?php if(!empty($result['image3'])){ ?>
												<img src="img/vehicleimages/<?php echo htmlentities($result['image3']);?>" width="300" height="200" style="border:solid 1px #000">
												<?php } ?>
												<input type="file" name="img3" accept="image/*">
												<span>*Upload gambar jika ingin mengubah gambar</span>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

									
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="form-group">
										<div class="col-sm-3">
											<div class="checkbox checkbox-inline">
												<button class="btn btn-primary" type="submit" style="margin-top:4%">Save changes</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					</div>
				</div>
				</form>

			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<?php } ?>