<?php


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
    $tad = (new TADFactory(['ip' =>
    '192.168.1.201', 'com_key' => 0]))->get_instance();
    if ($tad->is_alive()) {
        //$tad->disable();
        $att_logs = $tad->get_att_log();
        $r = $tad->get_date();
        $all_user_info = $tad->get_all_user_info();
        $encoding = $r->get_encoding();
        // print_r($att_logs);exit();
        $att_logs = $att_logs->filter_by_date(['start' => date('Y-m-d'), 'end' =>
        date('Y-m-d')]);
        if ($att_logs->is_empty_response()) {
            $logs  =  $tad->get_att_log();
            $my_log('Does not have logs recorded');
            //continue;
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
        }
    } else {
        echo "not";
        // my_log('Device in ' . $row['inst_name'] . ' is off-line');

    }
} catch (Exception $e) {

    // my_log('Device in ' . $row['inst_name']. '['.$row['ip_address']. '] is
    // offline');
}

$hm =  $device_logs[count($device_logs)-1]['employees_machine_user_id']; 
$user_info = $tad->get_user_info(['pin'=>$hm]);
$cc = json_decode($user_info->get_response(['format'=>'json']))->Row->Card;

// $commands_list = TAD::commands_available();
// print_r($commands_list);
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
                <td><input type="text" id="nomer" value="<?php echo $cc?>" name="nomer"></td>
            </tr>
            <button type="submit" name="submit" onclick="test()">+</button>
        </table>
    </form>
</body>

</html>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        function test() {
            var quantityVal = $("input[name='nomer']").val();
            $.ajax({
                url: 'menampilkan.php',
                method: 'POST',
                data: {
                    nomer: nomer
                },
                cache: false,
                dataType: 'html',
                success: function(data) {
                    alert(data);
                },
            });
        }
    </script>
<!-- <script type="text/javascript">
    window.onload=function(){ 
    this.gg()
    }, 111111 // 1200000 = seconds*1000
</script>

<script>
    function gg(){
        console.log("kepencet")
        document.getElementById("submit").click();
    }
    
</script> -->