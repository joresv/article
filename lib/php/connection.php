<?php
    $host = "localhost";
    $dbname = "id13800883_onprogramme";
    $user = "id13800883_tutos";
    $pass = "pU0AV\OLFQ(D5evb";
    
    try {
        $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
        echo "connected";
    } catch (\Throwable $th) {
        echo "Error: ".$th->getMessage();
    }
?>