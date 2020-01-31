<?php
if (isset($_POST["name"],$_POST['age'])) {
    $db = new Mysqli("localhost","root","","db_sekolahabsen"); 
    $name = $db->real_escape_string($_POST['name']);
    $age = (int)$_POST['age'];
    $query = "INSERT INTO data SET myname='$name,  $age'";
    $db->query($query);
    print_r("yey");
}else{
    echo"nay";
}
?>