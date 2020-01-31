<?php

use TADPHP\TADFactory;
use TADPHP\TAD;
$comands = TAD::commands_available();
$tad = (new TADFactory(['ip'=>'192.168.1.202', 'com_key'=>0]))->get_instance();

// File json yang akan dibaca (full path file)
$file = "tampildata.php";

// Mendapatkan file json
$anggota = file_get_contents($file);

// Mendecode anggota.json
$data = json_decode($anggota, true);

// Membaca data array menggunakan foreach
foreach ($data as $d) {
    echo $d['id_kartu']. "<br>";
    echo $d['tanggal']. "<br>";
    echo $d['w_in']. "<br>";
}