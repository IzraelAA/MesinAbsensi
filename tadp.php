<?php
$your_ip = '192.168.1.210'; // Set here your device's ip

$options = array(
    'location' => 'http://' . $your_ip . '/iWsService',
    'uri' => 'http://www.zksoftware/Service/message/'
);

$client = new SoapClient(null, $options);
$soapRequest = "<GetAllUserInfo><ArgComKey>0</ArgComKey></GetAllUserInfo>";

$response = $client->__doRequest($soapRequest, 'http://' . $your_ip . '/iWsService', '', '1.1');

echo '<pre>', var_dump($response), '</pre>'; // P