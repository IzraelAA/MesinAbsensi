<?php
// menghubungkan dengan koneksi
include 'konkesi.php';
require_once('konkesi.php');

//Membuat SQL Query
require 'vendor/autoload.php';
require 'vendor/metalback/tad-php/lib/TADFactory.php';
require 'vendor/metalback/tad-php/lib/TAD.php';
require 'vendor/metalback/tad-php/lib/TADResponse.php';
require 'vendor/metalback/tad-php/lib/Providers/TADSoap.php';
require 'vendor/metalback/tad-php/lib/Providers/TADZKLib.php';
require 'vendor/metalback/tad-php/lib/Exceptions/ConnectionError.php';
require 'vendor/metalback/tad-php/lib/Exceptions/FilterArgumentError.php';
require 'vendor/metalback/tad-php/lib/Exceptions/UnrecognizedArgument.php';
require 'vendor/metalback/tad-php/lib/Exceptions/UnrecognizedCommand.php';

use TADPHP\TADFactory;
use TADPHP\TAD;

try {
    session_start();
    // session_destroy();
    $var = ['192.168.1.201', '192.168.1.210'];
        $i = 0;
    foreach ($var as $key => $value) {
        $dev = 'masjid';
        if ($i == 1) {
            $dev = 'kelas';
        }
        $tad = (new TADFactory(['ip' =>
        $value, 'com_key' => 0]))->get_instance();
        
        if ($tad->is_alive()) {
            //$tad->disable();
            $att_logs = $tad->get_att_log();
            $r = $tad->get_date();
            // $all_user_info = $tad->get_all_user_info();
            $encoding = $r->get_encoding();
            // print_r($att_logs);exit();
            $att_logs = $att_logs->filter_by_date(['start' => date('Y-m-d'), 'end' =>
            date('Y-m-d')]);
            if ($att_logs->is_empty_response()) {
                $logs  =  $tad->get_att_log();
                //continue;
                $cc = "";
            } else {
                $array_att_logs = $att_logs->to_array();
                $device_logs = array();
                $counter = 1;
                if (!empty($array_att_logs))
                    foreach ($array_att_logs as $key => $val) {
                        foreach ($val as $log) {
                            $device_logs[] = array(
                                'employees_machine_user_id' => $log['PIN'],
                                'date' => date('Y-m-d', strtotime($log['DateTime'])),
                                'time' => date('H:i:s', strtotime($log['DateTime']))
                            );
                            $counter++;
                        }
                    }
                // $add_att_logs($device_logs);
                $tad->enable();
                // print_r($_SESSION);
                $hm =  $device_logs[count($device_logs) - 1]['employees_machine_user_id'];
                $hh =  $device_logs[count($device_logs) - 1]['time'];
                $user_info = $tad->get_user_info(['pin' => $hm]);
                $cc = json_decode($user_info->get_response(['format' => 'json']))->Row->Card;
                // $cek = $cc + $hh;
                $nomer = $cc;
      
                if (isset($_SESSION[$dev])) {
                    if ($cc != $_SESSION[$dev]['user'] || $hh != $_SESSION[$dev]['waktu']) {
                        $_SESSION[$dev]['user'] = $cc;
                        $_SESSION[$dev]['waktu'] = $hh;
                        date_default_timezone_set('Asia/Jakarta');
                        $tanggal = date('Y-m-d');
                        $jam = date('H:i:s');
                        $inSubuh = date('04:00:59');
                        $outSubuh = date('11:00:59');
                        $inDuhur = date('11:00:59');
                        $outDuhur = date('14:59:59');
                        $inAshar = date('15:00:59');
                        $outAshar = date('17:59:59');
                        $inMagrib = date('18:00:59');
                        $outMagrib = date('18:59:59');
                        $inIsyak = date('19:00:59');
                        $outIsyak = date('20:00:59');
                        if ($jam >= $inSubuh && $jam <= $outSubuh) {
                            $cekdataharini = mysqli_query($koneksi, "select * from tb_absensi_solat where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='1'");
                            $cekdatang = mysqli_num_rows($cekdataharini);
                            $datadatang = mysqli_fetch_array($cekdataharini);
                            if ($cekdatang == 0) {
    
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_masuk"=>$jam));
// `id_solat`,`id_kartu`, `tanggal`, `w_in`
                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_masuk");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));
                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                                $response = curl_exec($ch);
                                curl_close($ch);
                                var_dump($response);
                                $input = mysqli_query($koneksi, "insert into tb_absensi_solat (`id_solat`,`id_kartu`, `tanggal`, `w_in`) values('1','$nomer','$tanggal','$jam')");
                                print_r("SELAMAT SUBUH");
                            } else { 
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_keluar"=>$jam));
                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_keluar");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));
                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                                $response = curl_exec($ch);

                                // close the connection, release resources used
                                curl_close($ch);

                                // do anything you want with your response
                                var_dump($response);
                                

                                $query = "update tb_absensi_solat SET `w_out`='$jam' where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='1'";
                                mysqli_query($koneksi, $query);
                                print_r("PULANG SUBUH");
                            }
                        } elseif ($jam >= $inDuhur && $jam <= $outDuhur) {
                            $cekdataharini = mysqli_query($koneksi, "select * from tb_absensi_solat where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='2'");
                            $cekdatang = mysqli_num_rows($cekdataharini);
                            $datadatang = mysqli_fetch_array($cekdataharini);
                            if ($cekdatang == 0) {
                                            
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_masuk"=>$jam));
// `id_solat`,`id_kartu`, `tanggal`, `w_in`
                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_masuk");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));

                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                                $response = curl_exec($ch);

                                curl_close($ch);
                                var_dump($response);

                                $input = mysqli_query($koneksi, "insert into tb_absensi_solat (`id_solat`,`id_kartu`, `tanggal`, `w_in`) values('2','$nomer','$tanggal','$jam')");
                                print_r("SELAMAT DUHUR");
                            } else {
                                
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_keluar"=>$jam));

                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_keluar");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));

                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                                $response = curl_exec($ch);

                                // close the connection, release resources used
                                curl_close($ch);

                                // do anything you want with your response
                                var_dump($response);
                                
                                $query = "update tb_absensi_solat SET `w_out`='$jam' where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='2'";
                                mysqli_query($koneksi, $query);
                                print_r("PULANG DUHUR");
                            }
                        } elseif ($jam >= $inAshar && $jam <= $outAshar) {
                            $cekdataharini = mysqli_query($koneksi, "select * from tb_absensi_solat where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='3'");
                            $cekdatang = mysqli_num_rows($cekdataharini);
                            $datadatang = mysqli_fetch_array($cekdataharini);
                            if ($cekdatang == 0) {
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_masuk"=>$jam));
/// `id_solat`,`id_kartu`, `tanggal`, `w_in`
                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_masuk");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));
                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                                $response = curl_exec($ch);
                                curl_close($ch);
                                var_dump($response);
                                $input = mysqli_query($koneksi, "insert into tb_absensi_solat (`id_solat`,`id_kartu`, `tanggal`, `w_in`) values('3','$nomer','$tanggal','$jam')");
                                print_r("SELAMAT ASHAR");
                            } else {
                                
                                $ch = curl_init();
                                $data = http_build_query(array("id_kartu"=>$nomer,"id_reader"=>$value,"waktu_keluar"=>$jam));
                                curl_setopt($ch, CURLOPT_URL,"http://bank-api.onepay.biz.id/api/Presensi/presensi_keluar");
                                curl_setopt($ch,CURLOPT_HTTPHEADER,array('X-API-KEY : 8os84kk08cc4ww8cgkcowoc84ko4s440g4s4wo08',
                                'Content-type: application/x-www-form-urlencoded;charset=UTF-8'));
                                curl_setopt($ch, CURLOPT_POST,true);
                                curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                                $response = curl_exec($ch);

                                // close the connection, release resources used
                                curl_close($ch);

                                // do anything you want with your response
                                var_dump($response);
                                $query = "update tb_absensi_solat SET `w_out`='$jam' where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='3'";
                                mysqli_query($koneksi, $query);
                                print_r("PULANG ASHAR");
                            }
                        } elseif ($jam >= $inMagrib && $jam <= $outMagrib) {
                            $cekdataharini = mysqli_query($koneksi, "select * from tb_absensi_solat where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='4'");
                            $cekdatang = mysqli_num_rows($cekdataharini);
                            $datadatang = mysqli_fetch_array($cekdataharini);
                            if ($cekdatang == 0) {
    
                                $input = mysqli_query($koneksi, "insert into tb_absensi_solat (`id_solat`,`id_kartu`, `tanggal`, `w_in`) values('4','$nomer','$tanggal','$jam')");
                                print_r("SELAMAT MAGRIB");
                            } else {
                                $query = "update tb_absensi_solat SET `w_out`='$jam' where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='4'";
                                mysqli_query($koneksi, $query);
                                print_r("PULANG MAGRIB");
                            }
                        } elseif ($jam >= $inIsyak && $jam <= $outIsyak) {
                            $cekdataharini = mysqli_query($koneksi, "select * from tb_absensi_solat where id_kartu='$nomer' and tanggal='$tanggal' and id_solat='5'");
                            $cekdatang = mysqli_num_rows($cekdataharini);
                            $datadatang = mysqli_fetch_array($cekdataharini);
                            if ($cekdatang == 0) {
    
                                $input = mysqli_query($koneksi, "insert into tb_absensi_solat (`id_solat`,`id_kartu`, `tanggal`, `w_in`) values('5','$nomer','$tanggal','$jam')");
                                print_r("SELAMAT KERJA");
                            } else {
                                $query = "update tb_absensi_solat SET `w_out`='$jam' where id_kartu='$nomer' and tanggal='$tanggal'and id_solat='5'";
                                mysqli_query($koneksi, $query);
                                print_r("PULANG ISYAK");
                            }
                        } else {
                            print_r(" Belum jadwalnya");
                        }
                    } elseif ($cc == $_SESSION[$dev]['user'] && $hh == $_SESSION[$dev]['waktu']) {
                        echo $hh;
                        echo $_SESSION[$dev]['waktu'];
                        $_SESSION[$dev]['user'] = $cc;
                        $_SESSION[$dev]['waktu'] = $hh;
                        print_r("hmmm");
                    } else {
                        echo $hh;
                        echo $_SESSION[$dev]['waktu'];
                        print_r("somting wrong");
                    }
                } else {
                    $_SESSION[$dev]['user'] = $cc;
                    $_SESSION[$dev]['waktu'] = $hh;
                }
            }
        }
        $i++;
    }
} catch (Exception $e) {

    // my_log('Device in ' . $row['inst_name']. '['.$row['ip_address']. '] is
    // offline');
}

?>
<!DOCTYPE html>
<html>

<head>
    <title>Form Solat</title>
</head>

<body>
    <form method="POST" action="menampilkan.php">
        <table id="table">
            <tr>
                <td>NOMOR</td>
                <td><input type="text" id="nomer" value="<?php echo $cc ?>" name="nomer"></td>
            </tr>
        </table>
    </form>
</body>

</html>