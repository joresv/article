<?php
include "connection.php";
include "crypto.php";

$idp = json_decode(decrypt($_POST["id_posts"]));
$isok = false;
try {
    for ($i=0; $i < count($idp); $i++) { 
        $req = $db->prepare("DELETE FROM post WHERE id_post=?");
        $req->execute(array($idp[$i]));
    }
    $isok = true;
    $msg = "Suppression OK";
} catch (PDOException $th) {
    $msg = "Echec Suppression";
}


echo encrypt(json_encode([
    $isok,
    $msg
]));
?>