<?php
include "connection.php";
include "crypto.php";

$result = array();
try {
    $sql = "SELECT * from users u INNER join post p ON (u.id = p.id_user) ORDER BY p.id_post DESC";
    $req = $db->query($sql);
    while ($a = $req->fetch()) {
      $result[] = $a;
    }
} catch (PDOException $th) {
    
}

echo encrypt(json_encode($result));

?>