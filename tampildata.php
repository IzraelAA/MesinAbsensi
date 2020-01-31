<?php


//Import File Koneksi Database
require_once('konkesi.php');

//Membuat SQL Query
$sql = "SELECT * FROM tb_absensi_solat";
$innerjoin = "SELECT tb_absensi_solat.*,tb_solat.*,tb_siswa.* FROM tb_absensi_solat INNER JOIN tb_solat 
	ON tb_absensi_solat.id_solat = tb_solat.id_solat INNER JOIN tb_siswa ON tb_absensi_solat.id_kartu = tb_siswa.id_kartu";
//Mendapatkan Hasil
$r = mysqli_query($koneksi, $innerjoin);

//Membuat Array Kosong 
$reult = array();

while ($row = mysqli_fetch_array($r)) {

	//Memasukkan Nama dan ID kedalam Array Kosong yang telah dibuat 
	array_push($reult, array(
		"id_kartu" => $row['id_kartu'],
		"Nama" => $row['Nama'],
		"id_solat" => $row['id_solat'],
		"solat" => $row['solat'],
		"tanggal" => $row['tanggal'],
		"w_in" => $row['w_in'],
		"tanggal" => $row['tanggal'],
		"w_out" => $row['w_out'],
		"tanggal" => $row['tanggal']
	));
}

// //Menampilkan Array dalam Format JSON
// echo json_encode(array('reult'=>$reult));

mysqli_close($koneksi);
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Struktur Table</title>
	<script type="text/javascript" src="jquery-3.1.0.min.js">
	</script>
	<script type="text/javascript" src="datatable/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="datatable/css/jquery.dataTables.min.css">
</head>

<body>
	<table id="table">
		<caption>DAFTAR ABSENSI SOLAT </caption>
		<thead>
			<tr>
				<td>Id kartu</td>
				<td>Nama</td>
				<td>Solat</td>
				<td>Tanggal</td>
				<td>Masuk</td>
				<td>Keluar</td>
			</tr>
		</thead>
		<tbody>
			<?php
			foreach ($reult as $key => $value) { ?>
				<tr>
					<td><?php echo $value['id_kartu']; ?></td>
					<td><?php echo $value['Nama']; ?></td>
					<td><?php echo $value['solat']; ?></td>
					<td><?php echo $value['tanggal']; ?></td>
					<td><?php echo $value['w_in']; ?></td>
					<td><?php echo $value['w_out']; ?></td>
				</tr><?php
						} ?>
		</tbody>
	</table>
<script type="text/javascript">
	$(document).ready(function() {
		$("#table").DataTable();
	});
</script>
</body>
</html>