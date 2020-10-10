<?php
include "connection.php";
include "crypto.php";

$id = decrypt($_POST["id_user"]);
$result = array();
try {
    $sql = "SELECT * from users u INNER join post p ON (u.id = p.id_user) WHERE u.id = ? ORDER BY p.id_post DESC";
    $req = $db->prepare($sql);
    $req->execute(array($id));
    while ($a = $req->fetch()) {
      $result[] = $a;
    }
} catch (PDOException $th) {
    
}
echo encrypt(json_encode($result));

?>