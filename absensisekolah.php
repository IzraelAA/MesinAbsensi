<?php
 // menghubungkan dengan koneksi
 include 'konkesi.php';
  
$nomer = $_GET['nomer'];
 // menyeleksi data admin dengan username dan password yang sesuai
//  $data = mysqli_query($koneksi,"select * from tb_karyawan where Id_kartu='$nomer'");
//  $cek = mysqli_num_rows($data);
// $datakaryawan = mysqli_fetch_array($data);
// $idinput = $datakaryawan['Id_kartu'];
date_default_timezone_set('Asia/Jakarta');
$tanggal = date('Y-m-d');
$jam = date('H:i:s');
    $cekdataharini = mysqli_query($koneksi,"select * from tb_absensi_sekolah where id_kartu='$nomer' and tanggal='$tanggal'");
    $cekdatang = mysqli_num_rows($cekdataharini);
    $datadatang = mysqli_fetch_array($cekdataharini);
if($cekdatang == 0 ) {

    $input = mysqli_query($koneksi,"insert into tb_absensi_sekolah (`id_kartu`, `tanggal`, `datang`) values('$nomer','$tanggal','$jam')");
    print_r("SELAMAT KERJA");
}else{
    $query="update tb_absensi_sekolah SET `pulang`='$jam' where id_kartu='$nomer' and tanggal='$tanggal'";
    mysqli_query($koneksi,$query);    
    print_r("PULANG LUR");
}
// print_r($cekdatang);
// print_r($nomer);
?>