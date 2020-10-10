<?php
    include "connection.php";
    include "crypto.php";
    
    $email = decrypt($_POST['email']);
    $pass = sha1(decrypt($_POST['pass']));
    
    try {
       if(isset($email, $pass)){
           $req = $db->prepare("SELECT * FROM users WHERE email=? AND password=?");
           $req->execute(array($email, $pass));
           $exist = $req->rowCount();
           if($exist == 1){
               $array = $req->fetch();
               $msg = "succes connection";
               $succes = 1;
           }else{
               $msg = "email or password is incorrect";
               $succes = 0;
           }
       }else{
          $succes = 0;
          $msg = "error empty data"; 
       }
    } catch (\Throwable $th) {
       $succes = 0;
       $msg = "Error: ".$th->getMesage();
    }
    echo encrypt(json_encode([
        "data"=>[
            $msg,
            $succes,
            $array
        ]
    ]));
?>