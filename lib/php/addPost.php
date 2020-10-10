<?php
include "connection.php";
include "crypto.php";

$post = json_decode(decrypt($_POST["data"]));
$id_user = $post->id_user;
$titre = $post->titre;
$detail = $post->detail;
$isok=false;
$msg = "";
try {
    $req = $db->prepare("INSERT INTO post(id_user, titre, detail) VALUES(?,?,?)");
    $req->execute(array($id_user, $titre, $detail));
    if($req){
        $isok = true; 
        $msg = "publier avec succès";
    }else{
        $msg = "échec de publication";
    }
} catch (\Throwable $th) {
    $msg = "échec de publication";
}

echo encrypt(
    json_encode([
        $isok,
        $msg
    ])
)
?>