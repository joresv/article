<?php
include "connection.php";
include "crypto.php";

$id = decrypt($_POST["id_user"]);
$type = decrypt($_POST["type"]);
$result = array();
try {
   if($type == 1){
     $sql = "SELECT * from users u INNER join post p ON (u.id = p.id_user) WHERE u.id = ? ORDER BY p.id_post DESC";
      $req = $db->prepare($sql);
      $req->execute(array($id));
      while ($a = $req->fetch()) {
        $result[] = $a;
      }
   }else if ($type == 2) {
      $post = json_decode(decrypt($_POST["data"]));
      $id_post = $post->id_post;
      $titre = $post->titre;
      $detail = $post->detail;
      $isok=false;
      $msg = "";

      // $sql = "UPDATE post SET titre=?, detail=? WHERE id_post=?";
      // $req = $db->prepare($sql);
      // $req->execute(array($titre, $detail, $id_post));
      // if($req){
      //   $isok = true;
      //   $result = [
      //     $isok,
      //     "modifier aavec succès"
      //   ];
      // }
      print_r($post);
   }
} catch (PDOException $th) {
    
}
// echo encrypt(json_encode($result));

?>